Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463F3C636CC
	for <phone-devel@archiver.kernel.org>; Thu, 16 Feb 2023 03:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjBPDCq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Feb 2023 22:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBPDCp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Feb 2023 22:02:45 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47162234E9
        for <phone-devel@vger.kernel.org>; Wed, 15 Feb 2023 19:02:44 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id e75so640859ybh.13
        for <phone-devel@vger.kernel.org>; Wed, 15 Feb 2023 19:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmfoGNmoydQLu/4gLeD4ecXj20LBp85h/89oL/+L10E=;
        b=Q/KqDmrg1GbuXRaTxw0oDwkSDjBxP4Ae+nf6X7sbOxXNH0eD0wl8/M6FexUVCbi88W
         zG2CbhcfEHXgFgPZg1xntAm61fIipkbd5y2y4AHDcvd9/Q45+S0L4PrITYjwN5fnhWl9
         cluu0f9dhWYoit9BCQsz4c25kC13XVsv/ECcrJK/OBY0Yy9d+VjixjI7KeEI4+u6eutk
         I0KrrQcpfxCWG4OFz5ILWRHlI9KoYahrIvj9Uw57V9nsJIKSmS64zK7ELoqZyKttAlov
         HyzQgQtNBCkc0MbCzxDrMcSxmXsTrPWpMKI8PvVsVH6MwUBhhM5TLFdqDhJlsJp4Z2cU
         rvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmfoGNmoydQLu/4gLeD4ecXj20LBp85h/89oL/+L10E=;
        b=7WbqE/wu/OysaveZuSeGrzoFBuD8ImUVURiCqLbhIcBtrgaG9fggVk2J+NVLJLTA8f
         k0dvjz8lDlc+1i1jZAy5Js+DiOtC1vf09wo2oPdPBL8L+xvC1VuUDu4wrtlhXVNOcmAl
         oe3TNLOEqcSOlw/6t2Xlh7C4zuq3JVb6VZ+vD5cMPwLMao/5jM9DcZw4zexMKcIozbD+
         qLYQMlLeltZDzzr9H0RgUPTRrlcLdZbNlZZz+9TMwkjrKRBvfZH9CKbg8vzubgcpCyfJ
         6wjFjRLt1nogRlmO19aH9lvPSpXGZGPdrCb88EqGoI/uKjNKqHsW90qqMb4RuD/+HgFN
         gw3w==
X-Gm-Message-State: AO0yUKX0bXBYvzJEHESOEt3bg1VTE9HNSnGN8ecnDPh7WQbJLymfUkPb
        5aDNNSFL4mu6y7RaDXf4rQ8VjCGB+dwEszLe6pq1Zw==
X-Google-Smtp-Source: AK7set+wevyweJgk6/FESwWZUqeOoq8hRyKir3CGjvMKeXHLg9TcJFZU8wMezt7btRCXjLKWkqQ2a5assUlQmuvevrQ=
X-Received: by 2002:a25:f50c:0:b0:90a:8ba9:3ac3 with SMTP id
 a12-20020a25f50c000000b0090a8ba93ac3mr509152ybe.333.1676516563474; Wed, 15
 Feb 2023 19:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Feb 2023 05:02:32 +0200
Message-ID: <CAA8EJpqL-Vsq7dbK7tfJAGgg2_nV463QYv5zgvRLx_8T2bsXxA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dpu: Initialize SSPP scaler version (from
 register read)
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Random inspection of the SSPP code surfaced that the version field of
> dpu_scaler_blk was never assigned in the catalog, resulting in wrong
> codepaths to be taken within dpu_hw_setup_scaler3 based on a 0 version.
> Rectify this by reading an accurate value from a register (that is not
> equal to the values represented by DPU_SSPP_SCALER_QSEEDx enum
> variants) and deleting dead code around QSEED versioning.
>
> Future changes should likely get rid of the distinction between QSEED3
> and up, as these are now purely determined from the register value.
> Furthermore implementations could look at the scaler subblk .id field
> rather than the SSPP feature bits, which currently hold redundant
> information.
>
> ---
> Marijn Suijten (3):
>       drm/msm/dpu: Read previously-uninitialized SSPP scaler version from hw
>       drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
>       drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

The cleanup looks good. However as you are on it, maybe you can also
add patch 4, dropping DPU_SSPP_SCALER_QSEED3LITE and
DPU_SSPP_SCALER_QSEED4 in favour of using QSEED3 for all these
scalers? As we are going to use scaler_version to distinguish between
them, it would be logical not to duplicate that bit of information
(not to mention all the possible troubles if scaler_version disagrees
with the sblk->scaler_blk.id).

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 12 ++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  9 +++------
>  4 files changed, 11 insertions(+), 26 deletions(-)
> ---
> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
> change-id: 20230215-sspp-scaler-version-19f221585c5e
>
> Best regards,
> --
> Marijn Suijten <marijn.suijten@somainline.org>
>


-- 
With best wishes
Dmitry
