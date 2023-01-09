Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7B0C61DB3
	for <phone-devel@archiver.kernel.org>; Mon,  9 Jan 2023 08:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjAIIZR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Jan 2023 03:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236591AbjAIIYG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Jan 2023 03:24:06 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9118BB1E6
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 00:24:04 -0800 (PST)
Received: from SoMainline.org (unknown [89.205.227.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BA0103EE8C;
        Mon,  9 Jan 2023 09:23:59 +0100 (CET)
Date:   Mon, 9 Jan 2023 09:23:57 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Drew Davenport <ddavenport@chromium.org>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Message-ID: <20230109082357.meebk7udokdfvwle@SoMainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
> On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> > On 22/12/2022 01:19, Marijn Suijten wrote:
> >> In the event that the topology requests resources that have not been
> >> created by the system (because they are typically not represented in
> >> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> >> blocks) remain NULL but will still be returned out of
> >> dpu_rm_get_assigned_resources, where the caller expects to get an array
> >> containing num_blks valid pointers (but instead gets these NULLs).
> >>
> >> To prevent this from happening, where null-pointer dereferences
> >> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> >> increase past NULL blocks and will print an error and break instead.
> >> After all, max_blks represents the static size of the maximum number of
> >> blocks whereas the actual amount varies per platform.
> >>
> >> ^1: which can happen after a git rebase ended up moving additions to
> >> _dpu_cfg to a different struct which has the same patch context.
> >>
> >> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> > 
> > I think the patch is not fully correct. Please check resource 
> > availability during allocation. I wouldn't expect an error from 
> > get_assigned_resources because of resource exhaustion.

Theoretically patch 5/8 should take care of this, and we should never
reach this failure condition.  Emphasis on /should/, this may happen
again if/when another block type is added with sub-par resource
allocation and assignment implementation.

> Another option, since allocation functions (except DSC) already have 
> these safety checks: check error message to mention internal 
> inconstency: allocated resource doesn't exist.

Is this a suggestion for the wording of the error message?

- Marijn
