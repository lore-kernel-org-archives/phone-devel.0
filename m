Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A777BC4332F
	for <phone-devel@archiver.kernel.org>; Wed,  5 Oct 2022 21:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiJEVI4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 Oct 2022 17:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiJEVIy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 Oct 2022 17:08:54 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490B4816B4;
        Wed,  5 Oct 2022 14:08:48 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7DCAB20178;
        Wed,  5 Oct 2022 23:08:46 +0200 (CEST)
Date:   Wed, 5 Oct 2022 23:08:45 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
Message-ID: <20221005210845.yednmbqec4bzukxm@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
 <20221005181657.784375-6-marijn.suijten@somainline.org>
 <CAA8EJpr=0w0KReqNW2jP8DzvXLgo_o6bKmwMOed2sXb6d8HKhg@mail.gmail.com>
 <20221005205845.rwkzyit4daizi3z4@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005205845.rwkzyit4daizi3z4@SoMainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-10-05 22:58:48, Marijn Suijten wrote:
> On 2022-10-05 22:31:43, Dmitry Baryshkov wrote:
> > [..]
> > In fact, could you please take a look if we can switch to using this
> > function and drop our code?
>
> [..]
>
> Do you want me to do this in a v3, before applying this fractional-bits
> fix?  [..]

One thing to note:

	/* bpc 8 */
	dsc->flatness_min_qp = 3;
	dsc->flatness_max_qp = 12;
	dsc->rc_quant_incr_limit0 = 11;
	dsc->rc_quant_incr_limit1 = 11;
	dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;

Here a bunch of properties are hardcoded, seemingly for bpc = 8.
mux_word_size is only ever read in drm_dsc_compute_rc_parameters() so
only becomes relevant _after_ the migration, and is currently dealt with
correctly by:

	mux_words_size = 48;		/* bpc == 8/10 */
	if (dsc->bits_per_component == 12)
		mux_words_size = 64;

Aside fixing that to assign these values (through the proper constants)
to dsc->mux_word_size, is it worth looking for the right parameters for
other bpc or return -EINVAL if bpc isn't 8, to uphold this comment until
support for other bpc is validated?

- Marijn
