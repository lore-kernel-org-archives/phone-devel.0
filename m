Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68AAC5479D
	for <phone-devel@archiver.kernel.org>; Mon,  9 Jan 2023 09:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbjAIJLM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Jan 2023 04:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbjAIJKU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Jan 2023 04:10:20 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4686C165B7
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 01:06:57 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4bf16baa865so104351237b3.13
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
        b=uxJqcr/vA16Jbso7FMrCavP3Cf2jhnnlPgVnsuBsvS/o+Z1jwaAnN1AQdnbbe+GJc6
         ixviHjNm2JTcHR4e5QhHj1v3nXBUyMlCCBLXphPY6Q+qVkTzrxjlykCBgc2y7oRrP17s
         A5bSkfDmbgJreYllwN7sl/4BZpeZJ/z9eUcIoENMIMYTupxqrttaUSwQCj8s/SrP+sIQ
         6wbCC9UCbTxxCG3hCIRwUkCdwfAGRw4ZfRIfAuJDLhTbJR+AerCjSUWlZklTY53Ts7Et
         bD4pvNfviMu91QcLX9ba5HawO/FK9vk9Bayawpaj1Wn4PcYxCp7iUlPdFSLxeLu0MHla
         foSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
        b=ICxsOagg3+KpXRiuAGhkWwKJpE66Yn9Idyz+UBbUnwDlQUFS57JFDn72qhOrf3ZxxA
         o2IRITQCn1AlhbN9eHMLJY28M7VeGUhonUePzvD+0vVUniZllkL1lcHcQ5dMGXnoJkXh
         MvJtit/Jsle8po28HU4x9nLeE1ZpGOFDRDuI84vQ8Bg9Dtok4VGHQtW5xPqEKb+46FJY
         mNXXf5T3csn+O1C7lCMIb9+q7eZx0WhRLPdoKb8yi/nxIPQjZbrtKwIXpBkRk7s4OH4V
         JC2LTlJjKt7xMYRDt9hCqos2t6Dsoz8w7o5EVcjo6AzqHrh10ZYwFY35aaYwaa/Kl8Hq
         kZsQ==
X-Gm-Message-State: AFqh2kqKe2jCBBNsm7rOxGmmb1JnrNtthsXHey+HhjIod86Bku0Ec5Jc
        o/JOm2nDxbYtGYKQrPkceqTq4YaE3BcJNpEVG3ngyg==
X-Google-Smtp-Source: AMrXdXv7lpAYFxmW/eV/4rKWRDYgiJ5liDzlAKLCsDctqH1bw7LEQ8Q1lC1IVljbsIzfzyvSmxnDP2lGZbHp6UK7mUs=
X-Received: by 2002:a0d:d692:0:b0:477:b56e:e1d6 with SMTP id
 y140-20020a0dd692000000b00477b56ee1d6mr6161ywd.188.1673255216324; Mon, 09 Jan
 2023 01:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org> <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org> <20230109082357.meebk7udokdfvwle@SoMainline.org>
In-Reply-To: <20230109082357.meebk7udokdfvwle@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 9 Jan 2023 11:06:45 +0200
Message-ID: <CAA8EJppqocjgTbZLhcJtmRGjE4X2u_jDEGDWS9Bsp7MEgD+Ldg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be returned
To:     Marijn Suijten <marijn.suijten@somainline.org>
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
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 9 Jan 2023 at 10:24, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
> > On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> > > On 22/12/2022 01:19, Marijn Suijten wrote:
> > >> In the event that the topology requests resources that have not been
> > >> created by the system (because they are typically not represented in
> > >> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> > >> blocks) remain NULL but will still be returned out of
> > >> dpu_rm_get_assigned_resources, where the caller expects to get an array
> > >> containing num_blks valid pointers (but instead gets these NULLs).
> > >>
> > >> To prevent this from happening, where null-pointer dereferences
> > >> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> > >> increase past NULL blocks and will print an error and break instead.
> > >> After all, max_blks represents the static size of the maximum number of
> > >> blocks whereas the actual amount varies per platform.
> > >>
> > >> ^1: which can happen after a git rebase ended up moving additions to
> > >> _dpu_cfg to a different struct which has the same patch context.
> > >>
> > >> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
> > >>   1 file changed, 5 insertions(+)
> > >
> > > I think the patch is not fully correct. Please check resource
> > > availability during allocation. I wouldn't expect an error from
> > > get_assigned_resources because of resource exhaustion.
>
> Theoretically patch 5/8 should take care of this, and we should never
> reach this failure condition.  Emphasis on /should/, this may happen
> again if/when another block type is added with sub-par resource
> allocation and assignment implementation.

Yeah. Maybe swapping 4/8 and 5/8 makes sense.

>
> > Another option, since allocation functions (except DSC) already have
> > these safety checks: check error message to mention internal
> > inconstency: allocated resource doesn't exist.
>
> Is this a suggestion for the wording of the error message?

Yes. Because the current message makes one think that it is output
during allocation / assignment to encoder, while this is a safety net.

>
> - Marijn




--
With best wishes
Dmitry
