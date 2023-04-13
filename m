Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AFCC77B78
	for <phone-devel@archiver.kernel.org>; Thu, 13 Apr 2023 23:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjDMXdu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Apr 2023 19:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjDMXdt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Apr 2023 19:33:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14421727
        for <phone-devel@vger.kernel.org>; Thu, 13 Apr 2023 16:33:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d4so797446lfv.12
        for <phone-devel@vger.kernel.org>; Thu, 13 Apr 2023 16:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681428826; x=1684020826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwF7snSUE/NLFeUZMrStjP7tt1VryQB7xouzwE9Xx/o=;
        b=vubxqTEh+mKF04vi0bv7De2MyxeRxkA4IY7Gp9n4lL5w8zBTxuZoMv0DGnO4oKccyb
         +Qk7pPt0b3PPCjid37KTUAQmVHI+H74uPeD4UvrE8G8VYFppEDTDN/WzZd6OwLkjFwGV
         yyFsM2LFEUj19VaG9yDK82b4rvIvklEXoVHKy0R1g12YSIet1k1bWGj1x8JDmIntSn3G
         Gor/ORZQjMbhLA2zOvu3VH9C7nhtNy+Xvk0LSPs/mIJ8qxN5yLdy5m1AOv5ngTsuNQtb
         zs6rKxg34+4KV208wIYFOcoTvDEysVxVlNiWFj0PaxbOk7zZHU/u2EUAf530b6Oar0yv
         ybdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681428826; x=1684020826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwF7snSUE/NLFeUZMrStjP7tt1VryQB7xouzwE9Xx/o=;
        b=BWP5Nrfn3SKeFtPcCoN/KK23Y+EBWPMN8dGCDnm0ItP14TgpFEE4CzY4GdYsBXKR4K
         kTEzFh56qu8FdfPRaCsgDANoRa/LbGX2Pd2ea3y52ittvkXaKBuXS+s/k/itMb26ABWr
         mQHuL/vOY2Z+hCbh7hQpP9qdmC2B0db6i7tLTT8ICdtBQKQp1BdnFaH+7l055xqLRnmm
         NW3BeUltZO4OIA14pcEuCtVDcm1uf5WlBLxsgO9JfY/h0xGu+k8n+ZnpVFFrMyQdEJ2Z
         XKnVxh4w6ETceTBlgs23eCKUe3y3km07h7P725UktFwYPEiGPw8NFBH0J0rP6MgUlPgq
         xmQw==
X-Gm-Message-State: AAQBX9d3BERrPr36vY0Pr/yeA8jXfBUqjM4mChs03DEZfBmMZY5g3qXU
        DMcta2+9StQHkbEM+tTCGrHifA==
X-Google-Smtp-Source: AKy350bOC3dwpph5K/wDMOrsZ3SIXqH8umA7KKx/Gl6dQdSJ1VCK/vHsmwWchQ1B6nzz4qVlOQAKew==
X-Received: by 2002:ac2:44c1:0:b0:4de:7a23:23e2 with SMTP id d1-20020ac244c1000000b004de7a2323e2mr1420800lfm.21.1681428826060;
        Thu, 13 Apr 2023 16:33:46 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id e3-20020a056512090300b004ec508e3a9bsm506364lft.276.2023.04.13.16.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 16:33:45 -0700 (PDT)
Message-ID: <197870c5-4ef4-ed21-9e03-5169f4100bc6@linaro.org>
Date:   Fri, 14 Apr 2023 01:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/8] leds: qcom-lpg: Add support for PMI632 LPG
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz>
 <20230414-pmi632-v1-4-fe94dc414832@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230414-pmi632-v1-4-fe94dc414832@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 14.04.2023 01:17, Luca Weiss wrote:
> The PMI632 PMIC contains 5 PWM channels, 3 of which can be used for
> LEDs.
> 
> For the LED pattern it doesn't have LUT like other PMICs but uses SDAM
> instead. This is not currently implemented in the driver but since LPG
> works fine without it, add support for the PMIC now.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Matches everything i see in 4.19!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/leds/rgb/leds-qcom-lpg.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 67f48f222109..51763ecb8c1e 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1353,6 +1353,20 @@ static const struct lpg_data pm8994_lpg_data = {
>  	},
>  };
>  
> +/* PMI632 uses SDAM instead of LUT for pattern */
> +static const struct lpg_data pmi632_lpg_data = {
> +	.triled_base = 0xd000,
> +
> +	.num_channels = 5,
> +	.channels = (const struct lpg_channel_data[]) {
> +		{ .base = 0xb300, .triled_mask = BIT(7) },
> +		{ .base = 0xb400, .triled_mask = BIT(6) },
> +		{ .base = 0xb500, .triled_mask = BIT(5) },
> +		{ .base = 0xb600 },
> +		{ .base = 0xb700 },
> +	},
> +};
> +
>  static const struct lpg_data pmi8994_lpg_data = {
>  	.lut_base = 0xb000,
>  	.lut_size = 24,
> @@ -1436,6 +1450,7 @@ static const struct of_device_id lpg_of_table[] = {
>  	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
>  	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
>  	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
> +	{ .compatible = "qcom,pmi632-lpg", .data = &pmi632_lpg_data },
>  	{ .compatible = "qcom,pmi8994-lpg", .data = &pmi8994_lpg_data },
>  	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
>  	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
> 
