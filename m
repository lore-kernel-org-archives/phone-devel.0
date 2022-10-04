Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E83C4332F
	for <phone-devel@archiver.kernel.org>; Tue,  4 Oct 2022 14:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJDOlZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 4 Oct 2022 10:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiJDOlY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 4 Oct 2022 10:41:24 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D9117E36
        for <phone-devel@vger.kernel.org>; Tue,  4 Oct 2022 07:41:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id b145so1723518yba.0
        for <phone-devel@vger.kernel.org>; Tue, 04 Oct 2022 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=z41duvCKMloCMs7/yS+eYyEb+WVImktYvIerwjQ5evI=;
        b=j6jR0OTmSljAbwsij5gsdUL+4ZFD75ZNHeSNzLJ6oPjvuO064edahqdHCjca2FVoNE
         BMIHxdhPWGZSeyUjkE1RHfGXRB1XY9mBdsQfsg8uEzypRG2oXvwJJoxkKG1IpkFp+9Vt
         GB2IpJ0heualwYLJrYc4+9+qsVEaYfxxVwtG4s6CPJMrVT3z67fuJVcjqBlA7iF/Tvmq
         169kZ+gBTNZftLrhpsg1ijx/7QF/AcuUd6OcGh1vUK0r5nE/7O6Z+j4DRK85NvpKEiM+
         r/M3ChmBXywKUVwIWfnXmH9FcDntC5jTRgrPSDSEn/mZh9kSoOL/A0e2vegGLeFvFokX
         5m6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z41duvCKMloCMs7/yS+eYyEb+WVImktYvIerwjQ5evI=;
        b=7fRSRuC/b1diXxHoc6U8pvpaScrNI5hHrxYdqkMEgbvkInSJDP6KKnRKTngTwquofW
         30RczKDTKiHHp9sFYl/zBlS8RJP4meZsKqSCPVMbHcWc4DOc8afkDWHsBnFqaQwYv3JX
         zK8VkR6kbUriEcEZaYh61jQta0f3ndKYyzFzw6ZFW6R1+bLg6unplH0aMAQnNZIf+xek
         m+qz9eie8XufFojqDQCwSFKlEx/1O+9Owp/qxb3c6eVrVTaCh3Mrxmp61UuumeM0REvq
         osDBqh6m3o8YTHJnIWRniHbLcrZkbaOcZQyoDeS8YZnMinDRqU4SUvuTvLCR4nnkB/g1
         YdTg==
X-Gm-Message-State: ACrzQf3RAA5Fb5yLc2iKsSRjXtP5vUeg8QBMSrtnuteietXW3ZZll/FJ
        8PBbIMPRJi1SdMWCCm4urf8wHks1+fuU5DmxQX7S7Q==
X-Google-Smtp-Source: AMsMyM6iglxo2rnyStaDCkTZCnJHAIs8F74+vN9/msLvrF4RKqOOdLEukISP12dZ8dOsqZ63qavPJSynh+H9LBTCOZ4=
X-Received: by 2002:a25:2e4e:0:b0:6bc:ac92:a4df with SMTP id
 b14-20020a252e4e000000b006bcac92a4dfmr26652384ybn.153.1664894478194; Tue, 04
 Oct 2022 07:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org> <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
In-Reply-To: <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Oct 2022 17:41:07 +0300
Message-ID: <CAA8EJpricAKmrtqGJx_ngqyqCWjc2rbrOcsE5QaH5qKaHP7-2g@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        David Airlie <airlied@linux.ie>,
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
        Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, 1 Oct 2022 at 23:23, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-10-01 21:08:07, Marijn Suijten wrote:
> > msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
> > of a char thanks to two's complement: this however results in those bits
> > bleeding into the next parameter when the field is only expected to
> > contain 6-bit wide values.
> > As a consequence random slices appear corrupted on-screen (tested on a
> > Sony Tama Akatsuki device with sdm845).
> >
> > Use AND operators to limit all values that constitute the RC Range
> > parameter fields to their expected size.
> >
> > Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> > index c869c6e51e2b..2e7ef242685d 100644
> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> > @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
> >        */
> >       for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> >               pps_payload->rc_range_parameters[i] =
> > -                     cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
> > +                     cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
> >                                    DSC_PPS_RC_RANGE_MINQP_SHIFT) |
> > -                                 (dsc_cfg->rc_range_params[i].range_max_qp <<
> > +                                 ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
> >                                    DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
> > -                                 (dsc_cfg->rc_range_params[i].range_bpg_offset));
> > +                                 (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));
>
> Pre-empting the reviews: I was contemplating whether to use FIELD_PREP
> here, given that it's not yet used anywhere else in this file.  For that
> I'd remove the existing _SHIFT definitions and replace them with:
>
>         #define DSC_PPS_RC_RANGE_MINQP_MASK             GENMASK(15, 11)
>         #define DSC_PPS_RC_RANGE_MAXQP_MASK             GENMASK(10, 6)
>         #define DSC_PPS_RC_RANGE_BPG_OFFSET_MASK        GENMASK(5, 0)
>
> And turn this section of code into:
>
>         cpu_to_be16(FIELD_PREP(DSC_PPS_RC_RANGE_MINQP_MASK,
>                                dsc_cfg->rc_range_params[i].range_min_qp) |
>                     FIELD_PREP(DSC_PPS_RC_RANGE_MAXQP_MASK,
>                                dsc_cfg->rc_range_params[i].range_max_qp) |
>                     FIELD_PREP(DSC_PPS_RC_RANGE_BPG_OFFSET_MASK,
>                                dsc_cfg->rc_range_params[i].range_bpg_offset));
>
> Is that okay/recommended?

This is definitely easier to review. However if you do not want to use
FIELD_PREP, it would be better to split this into a series of `data |=
something` assignments terminated with the rc_range_parameters[i]
assignment.

>
> - Marijn
>
> >       }
> >
> >       /* PPS 88 */
> > --
> > 2.37.3
> >



-- 
With best wishes
Dmitry
