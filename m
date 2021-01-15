Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D1CC433E0
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 04:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 990FE23106
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 04:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhAOElB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 23:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbhAOElA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 23:41:00 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB213C061575
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 20:40:19 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id n186so485536oia.5
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 20:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WvxX8eMBKQeiOYu3rBDxAoazeGoPgEH+0ctDwdLMVo0=;
        b=W2HgaemMy4iB1sZmL7hLe9+by+EyQ1kr1/vQL3BGusbPuIIJ2iOYmza+iCfiyeM0PN
         pgf3sams192fZsdXo/DiVBJjsvd6Y04x64qMcm4A5FurpHj+vuMAEhgdyaYgUTywuSEq
         qyAvZN9KtI2OeeRIueDYuo7XJBaRf6XSBSOJSgFOtfCRy3GBxbkqb+byDIND53Zyn5wI
         vuQfUnHVkCnnyQAQhMWVA8N22IR971nj/WjhxirsSOU394SZACZ4PgSH30KTsdmximye
         xy8VKkVBfsDoEZVWjGNDV2+KivufmzY+XCzQK+R1A5eoipU+Su+DhNRNofwbEcFNJAi0
         SCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WvxX8eMBKQeiOYu3rBDxAoazeGoPgEH+0ctDwdLMVo0=;
        b=GuYVQo99UMcrkd8iuIQpRENlMJAr4Z9W9T77JsOGjZtp2712iKznVYB007g8+HEmL9
         /k2S9tOBsWu/KES+WRhxV+OzB6SLlb9VKU6L5JGG5vcT0os1+k34jXrB28crLOwgxbXf
         mV8jelNvDg3c9cB/1YopC81Axlu78Ay4DKwdYIfbq1pgbkByAPxRDC/MNoF8y9A3jnDj
         Dmr1MLAJtHJsTKaRqE+My5m7l1dDiWyxGJp/UannKBdRkQeQb/ExktDQLQYLvArwGKan
         2MXMX8oUPwVV2cEavMB2IeVfyf0yKXOE0+NAR/ZO62DMk/iGj2yMircQ+VTeeXLhFQuW
         LAGQ==
X-Gm-Message-State: AOAM533TLfD3a4OqqlXxXrOycSKlMw+10Cp9bWQH+yEDvc2KnSA4RalY
        UWRtfq1pAY6ZhsSRvZpANn2uUg==
X-Google-Smtp-Source: ABdhPJwjB9VsEmpjfnUvly0rRpkB9ZsEiqGnVoDB20LOGXKbkVbwxBmIp48WVJyz/GAsnZ0CwxPhTQ==
X-Received: by 2002:aca:b03:: with SMTP id 3mr4657072oil.157.1610685619237;
        Thu, 14 Jan 2021 20:40:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z38sm1547056ooi.34.2021.01.14.20.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 20:40:18 -0800 (PST)
Date:   Thu, 14 Jan 2021 22:40:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v2 1/7] regulator: qcom-labibb: Implement voltage
 selector ops
Message-ID: <YAEcsNmsPsi11kkM@builder.lan>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113194214.522238-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:

> Implement {get,set}_voltage_sel, list_voltage, map_voltage with
> the useful regulator regmap helpers in order to be able to manage
> the voltage of LAB (positive) and IBB (negative) regulators.
> 
> In particular, the supported ranges are the following:
> - LAB (pos):  4600mV to  6100mV with 100mV stepping,
> - IBB (neg): -7700mV to -1400mV with 100mV stepping.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/regulator/qcom-labibb-regulator.c | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
> index 8ccf572394a2..9f51c96f16fb 100644
> --- a/drivers/regulator/qcom-labibb-regulator.c
> +++ b/drivers/regulator/qcom-labibb-regulator.c
> @@ -19,6 +19,12 @@
>  #define PMI8998_IBB_REG_BASE		0xdc00
>  
>  #define REG_LABIBB_STATUS1		0x08
> +
> +#define REG_LABIBB_VOLTAGE		0x41
> + #define LABIBB_VOLTAGE_OVERRIDE_EN	BIT(7)
> + #define LAB_VOLTAGE_SET_MASK		GENMASK(3, 0)
> + #define IBB_VOLTAGE_SET_MASK		GENMASK(5, 0)
> +
>  #define REG_LABIBB_ENABLE_CTL		0x46
>  #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
>  #define LABIBB_CONTROL_ENABLE		BIT(7)
> @@ -51,6 +57,10 @@ static const struct regulator_ops qcom_labibb_ops = {
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
>  	.is_enabled		= regulator_is_enabled_regmap,
> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
> +	.list_voltage		= regulator_list_voltage_linear_range,
> +	.map_voltage		= regulator_map_voltage_linear_range,
>  };
>  
>  static const struct regulator_desc pmi8998_lab_desc = {
> @@ -59,9 +69,18 @@ static const struct regulator_desc pmi8998_lab_desc = {
>  	.enable_val		= LABIBB_CONTROL_ENABLE,
>  	.enable_time		= LAB_ENABLE_TIME,
>  	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
> +	.vsel_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
> +	.vsel_mask		= LAB_VOLTAGE_SET_MASK,
> +	.apply_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
> +	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
>  	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>  	.owner			= THIS_MODULE,
>  	.type			= REGULATOR_VOLTAGE,
> +	.linear_ranges		= (struct linear_range[]) {
> +		REGULATOR_LINEAR_RANGE(4600000, 0, 15, 100000),
> +	},
> +	.n_linear_ranges	= 1,
> +	.n_voltages		= 16,
>  	.ops			= &qcom_labibb_ops,
>  };
>  
> @@ -71,9 +90,18 @@ static const struct regulator_desc pmi8998_ibb_desc = {
>  	.enable_val		= LABIBB_CONTROL_ENABLE,
>  	.enable_time		= IBB_ENABLE_TIME,
>  	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
> +	.vsel_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
> +	.vsel_mask		= IBB_VOLTAGE_SET_MASK,
> +	.apply_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
> +	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
>  	.off_on_delay		= LABIBB_OFF_ON_DELAY,
>  	.owner			= THIS_MODULE,
>  	.type			= REGULATOR_VOLTAGE,
> +	.linear_ranges		= (struct linear_range[]) {
> +		REGULATOR_LINEAR_RANGE(1400000, 0, 63, 100000),
> +	},
> +	.n_linear_ranges	= 1,
> +	.n_voltages		= 64,
>  	.ops			= &qcom_labibb_ops,
>  };
>  
> -- 
> 2.29.2
> 
