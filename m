Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FFDC433E0
	for <phone-devel@archiver.kernel.org>; Fri,  5 Feb 2021 00:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA20464FB0
	for <phone-devel@archiver.kernel.org>; Fri,  5 Feb 2021 00:07:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhBEAGk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 4 Feb 2021 19:06:40 -0500
Received: from so15.mailgun.net ([198.61.254.15]:15114 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231613AbhBEAGi (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 4 Feb 2021 19:06:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612483575; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OymwwLKe/n8QLaeKpafE8CF0mbQotflC2A51yd5T2eY=;
 b=iWN4VLat1u3Ml8Ip3HmDsDBbpC6QJyAHWyQTOZHueABvOO2Q9r8Z+m3OHuZUPZ1UcQDIxZeK
 F45gGpDiOBrx4nxtbwu6alVbLnuKycdxrztJU4gg1qG1B5yKzsM7yRqedajslqvn/dmPbEP+
 QO+neZO5LZpqWLW7FQj0SAgwe0g=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI5OTczNyIsICJwaG9uZS1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 601c8bcaf112b7872c700560 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 00:05:30
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 202ABC433CA; Fri,  5 Feb 2021 00:05:30 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACB74C433C6;
        Fri,  5 Feb 2021 00:05:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Feb 2021 16:05:28 -0800
From:   abhinavk@codeaurora.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp/mdp5: mdp5_cfg: Fix msm8974v2 max_clk
In-Reply-To: <20210203231537.77851-1-konrad.dybcio@somainline.org>
References: <20210203231537.77851-1-konrad.dybcio@somainline.org>
Message-ID: <5ad25d1c5ee33060338a57b61c973c9a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2021-02-03 15:15, Konrad Dybcio wrote:
> The maximum mdp clock rate on msm8974v2 is 320MHz. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index dfffd9cf0613..bd07d2e1ad90 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -177,7 +177,7 @@ static const struct mdp5_cfg_hw msm8x74v2_config = 
> {
>  			[3] = INTF_HDMI,
>  		},
>  	},
> -	.max_clk = 200000000,
> +	.max_clk = 320000000,
>  };
> 
>  static const struct mdp5_cfg_hw apq8084_config = {
