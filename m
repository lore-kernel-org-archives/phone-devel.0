Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70074C433DB
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 22:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4156723A5C
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 22:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbhANWZt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:25:49 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:41009 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730161AbhANWZs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 17:25:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610663129; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=WAPn2S7lwyyKdDbqBsaQKLrf+AH0DF+Qb5HT251B5/I=; b=QpUymj+gqbb64Tp70XY4k1iPObhve9k/EsLi/6K99xrxqNALd8U4tYdyMaGyfg8D7onvDG9s
 gP/jvV9F5xJvgKwz52TuAG/ybSrKeAKRHvSVtitgAnenk82GnLGTDF3pawcsmEjVt39eulxg
 mamCOO5cgxHgB0hw5gOj4rTFHPs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI5OTczNyIsICJwaG9uZS1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 6000c4bbc88af06107591424 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 22:24:59
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64672C43469; Thu, 14 Jan 2021 22:24:58 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D017C43461;
        Thu, 14 Jan 2021 22:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D017C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 14 Jan 2021 15:24:52 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v3 7/7] drm/msm/a5xx: Disable UCHE global filter
Message-ID: <20210114222452.GF29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
 <20210113183339.446239-8-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113183339.446239-8-angelogioacchino.delregno@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Jan 13, 2021 at 07:33:39PM +0100, AngeloGioacchino Del Regno wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Port over the command from downstream to prevent undefined
> behaviour.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h | 2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> index 346cc6ff3a36..7b9fcfe95c04 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
> @@ -2367,6 +2367,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
>  
>  #define REG_A5XX_UCHE_ADDR_MODE_CNTL				0x00000e80
>  
> +#define REG_A5XX_UCHE_MODE_CNTL					0x00000e81
> +
>  #define REG_A5XX_UCHE_SVM_CNTL					0x00000e82
>  
>  #define REG_A5XX_UCHE_WRITE_THRU_BASE_LO			0x00000e87
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 23fc851756de..7e553d3efeb2 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -754,6 +754,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	    adreno_is_a512(adreno_gpu))
>  		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
>  
> +	/* Disable UCHE global filter as SP can invalidate/flush independently */
> +	gpu_write(gpu, REG_A5XX_UCHE_MODE_CNTL, BIT(29));
> +
>  	/* Enable USE_RETENTION_FLOPS */
>  	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>  
> -- 
> 2.29.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
