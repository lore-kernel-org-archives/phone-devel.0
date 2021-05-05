Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CCFC433B4
	for <phone-devel@archiver.kernel.org>; Wed,  5 May 2021 22:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45F22613F1
	for <phone-devel@archiver.kernel.org>; Wed,  5 May 2021 22:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhEEWnv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 May 2021 18:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhEEWnq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 May 2021 18:43:46 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C398CC06138C
        for <phone-devel@vger.kernel.org>; Wed,  5 May 2021 15:42:48 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id t3so3126230iol.5
        for <phone-devel@vger.kernel.org>; Wed, 05 May 2021 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eVRAL4I5R3EIThtpHkhCvr3PaZqxvgbDA7g9md7suZ0=;
        b=NAJY9Hg2QjXPKsUa6VRHa7ZlrvQLdZV5WbT0H4FG5YQX800t2+fWOzVW1GHg3mR+gh
         P94XdmejdrLRI5m5SSqTdHs4OnPb241mf5Qu/itTHtAbbnpww+FRLdM0TgDIbKXRVt1z
         S8enQ3S/SCDQ7tOd42GHNNV4uSBbLYisYEdXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eVRAL4I5R3EIThtpHkhCvr3PaZqxvgbDA7g9md7suZ0=;
        b=Cy5eoLvehADLXgujYmcTOgK+XtI8Jy759CyRF8GezADh45GxQy7WOrqSrzU+/fckEj
         rz3uUKn5SoVqA+d8+94sezcNq16HAwvlkwlkE+mIz4h2JpAX5rp209Ti1h/EE6ybaRp5
         asRIqR2nOZ01AEbS4xcJitvgpna4kPe/a41R+0yI7F8z5vP46rZPvEiUm45vgOe/h6X6
         f4W/wW5hoHBI/8Y8NebQTtHAewpwIJeOyjhXSByPl0yQvxRbcEup4VlhXDPgRq7kuzJg
         bi3/1KaGWvNyDCE/Gp4UW5PfwuWfM3gxzOVLJUbwHcFnE1mhj7TlPkrhJdZU7aXN+z/2
         KO/g==
X-Gm-Message-State: AOAM5310oWNXX46XEt1mQDi7fFMgTyIXLwx6CX1W2GBvu1I31e6YP6O7
        +nZ5nSqP3QSJ2IzAPW+QQ2eRJkRFP2tvqccN
X-Google-Smtp-Source: ABdhPJzRPg1pfHtketnKuyEw5gC3cjUAUj2IyceNo+rC3q5l1fw9d0pKB58HRLXey4W1vzb+15I/VA==
X-Received: by 2002:a5d:9149:: with SMTP id y9mr661126ioq.159.1620254568052;
        Wed, 05 May 2021 15:42:48 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id s23sm264263iol.49.2021.05.05.15.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 15:42:47 -0700 (PDT)
Subject: Re: [PATCH v1 3/7] net: ipa: gsi: Avoid some writes during irq setup
 for older IPA
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-4-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <cd51718f-b584-11f5-40e0-cdec197881eb@ieee.org>
Date:   Wed, 5 May 2021 17:42:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-4-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> On some IPA versions (v3.1 and older), writing to registers
> GSI_INTER_EE_SRC_CH_IRQ_OFFSET and GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET
> will generate a fault and the SoC will lockup.
> 
> Avoid clearing CH and EV_CH interrupts on GSI probe to fix this bad
> behavior: we are anyway not going to get spurious interrupts.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Looking at this more closely, I see that you have found
a *bug* that I will fix.  The bug is that these registers
are the IRQ status registers, not the IRQ mask registers.

I have posted a fix for this bug, and once fixed, and I would
like to know whether this fix makes the fault you were
observing go away.
   https://lore.kernel.org/netdev/20210505223636.232527-1-elder@linaro.org

					-Alex

> ---
>   drivers/net/ipa/gsi.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
> index 6315336b3ca8..b5460cbb085c 100644
> --- a/drivers/net/ipa/gsi.c
> +++ b/drivers/net/ipa/gsi.c
> @@ -207,11 +207,14 @@ static void gsi_irq_setup(struct gsi *gsi)
>   	iowrite32(0, gsi->virt + GSI_CNTXT_SRC_IEOB_IRQ_MSK_OFFSET);
>   
>   	/* Reverse the offset adjustment for inter-EE register offsets */
> -	adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
> -	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
> -	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
> +	if (gsi->version > IPA_VERSION_3_1) {
> +		adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
> +		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
> +		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
> +	}
>   
>   	iowrite32(0, gsi->virt + GSI_CNTXT_GSI_IRQ_EN_OFFSET);
> +
>   }
>   
>   /* Turn off all GSI interrupts when we're all done */
> 

