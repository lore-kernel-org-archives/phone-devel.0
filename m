Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8238C2C3
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531342; cv=none; b=Wy90KFaX4Yes0Am+q9lesomMKAVrXzxsTPZDZ3nW6L4ROJm+6g7YUj6ddZHsPItp1mZN2ME/Rq4NR8c1uADl3qDICSMHBdktK/qlmlZXgiVQCdyNljBNoeqV+Ya1YfX4d6qjioXV4nx65QU1kG4PMyhXDWsyiwS+k9YbjQLmLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531342; c=relaxed/simple;
	bh=KAWCy4tkMF0D8YDzaB4jm6Ts3+v/1dxLLNWF3XOeHgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka5rGC2ULiP40o3BpLjU+2ItMtdWGaKxSu3Uh3LO017nIw4wcxOR709SFLXSnEx0Gcd9eYMzfCrmuYTtkOtOFDrET3VRBVbjsckz5t0ZIgwJEm6fA+m19sdWP5QZsUANeTSK+mvJwmKHyQFHENWYoVgKmVxmEsT1/qlwPtGeU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emiVkiaa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emiVkiaa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439afc58ac7so2420938f8f.0
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531340; x=1773136140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyD6tVeysMRCx2UQUXy5bMdSjZYH+j+DP5U0HLL1Des=;
        b=emiVkiaaARfv1NEZtb73Q2AWy0FeOyPqU1lodGPdZ7SKYJwahl1E6qeeHzWRtTiVWI
         iUgkpOHLRRV7ohlD9s1brlak2oponr9HkzNzIPp485qbYoeXzc8oV2aXZT8grwvfGkd+
         tI1+ojQCY8MwIZdBJBZOpwdb0YWDoaKV5axK2pNbbM8fG7PS9A/XLod53xTFMqJm/cMC
         OfBTKzHPIzFPp2tiMsLZv+w8isfaABQt9yZTR4+GEbLvOOu+nYqgjtoue/3oqE+wBthS
         j9EY6RpIk/Tb/knV1mHkS+AvIWWo21d9MzdFpEd2nlKmcNRnFeKKxuqUTtB9TK0BHUaE
         K3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531340; x=1773136140;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyD6tVeysMRCx2UQUXy5bMdSjZYH+j+DP5U0HLL1Des=;
        b=R3NrCgxY7rbupzKfxYomjsfGFslI44NhW2U1obkZ4dbLVjFJQA/bay0KAf1RnMn14k
         rJhT5SFQ96lJAVQy5C2buURT4XzBTSVQPs+pfKYOV/FhxWwN7cOOqlw4otW7BhUZYDVA
         eCR6hCk+FIJ0acm4Wq2Vrk1sYuEgAEiPu3gltWTYABqIMyA7JB91MQOCCocc/k3KOCsM
         d1tKKjJtuMXLwL21RJjII2NvTFNwlFklhKGt6WGox9yGypUz4Ll9BmnLySNsl7dS2PIQ
         r4ayaq2aZlbYtCN7jzhZPse0Z1Vhof5hEdE61EU34+cF0/G15bOvzMsEuobE55mrRtms
         xLjw==
X-Forwarded-Encrypted: i=1; AJvYcCXaMwQ7sm+kqLHv47Owo1GBu9j8dvXdemMMAXEs/TONZYNaZWevb+AnARBag2iGs8sODfVNDqweFGHC9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rwzphI+Zg18u+tjnaWeTH9nS+ebS+Lh3oj2DZZgUo7V2DDvx
	qsVP91JSDdWIenMbPKYdWzL94XRtI87tuuYyR2BCQoIT0JNsT42J/xOIoHTrl17G/as=
X-Gm-Gg: ATEYQzzq76HBQTZtbRjnzD4wx7VFogwpZq78JXQ087P7XSmf8ZEqZcQlZIh4JvnCuKz
	rgqbBlf7myR8Vt8KxSIny9X9a53J02FTFiLI0qWHcpgt6kKDRH7MBOlUobmAjxriWa6+/PYDGlq
	nA7h7dMDjVVkKGd5PMupUSaR/W5NvcmUamDaeG3C2eXYyl3+N2sYlahj/Xd5QMdPoB7RExY2RE4
	umo1jiYsN+rjmOEcyW9VmYDeDTi1gUkJ7UIj67sUWvuyL1waKeA1g68ysdz3K2oWGhq2iTrIjAe
	Dqq/Yko8ETJEp5mc+kwtBfjDvnWQjrRvAMLZSe69veXuwMj4X+GWNQW+3MxZBkXGbFKdzA1uyP8
	2WzR/ctA74clg8ZZHsdfgaCvShrl9qHrr+V1QxcdVlZPHc5dY9zPb2LSathVons5+gwWj1em14v
	VZqAhD/k+3Qutmzndt96pQ/HdgTsF+XpJ+IPbXtyOYCeJyKSlWsMgUMKHaMFXg7pbl
X-Received: by 2002:a5d:5f55:0:b0:439:b6ae:5d5f with SMTP id ffacd0b85a97d-439b6ae617cmr12014767f8f.36.1772531339819;
        Tue, 03 Mar 2026 01:48:59 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm14593576f8f.17.2026.03.03.01.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:48:59 -0800 (PST)
Message-ID: <64441ca6-bcd1-47ab-ac0c-7a2ebea4fa01@linaro.org>
Date: Tue, 3 Mar 2026 09:48:53 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 1/9] media: qcom: camss: csiphy: Introduce PHY
 configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-1-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-1-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Read PHY configuration from the device-tree bus-type and save it into
> the csiphy structure for later use.
> 
> For C-PHY, skip clock line configuration, as there is none.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h |  2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++-------
>   2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 2d5054819df7f..d198171700e73 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -28,11 +28,13 @@ struct csiphy_lane {
>   
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @phy_cfg:  interface selection (C-PHY or D-PHY)
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +	enum v4l2_mbus_type phy_cfg;
>   	int num_data;
>   	struct csiphy_lane *data;
>   	struct csiphy_lane clk;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..ea0c8cf3cd806 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4411,11 +4411,11 @@ static int camss_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +	switch (vep.bus_type) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +	case V4L2_MBUS_CSI2_DPHY:
> +		break;
> +	default:
>   		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>   		return -EINVAL;
>   	}
> @@ -4423,9 +4423,13 @@ static int camss_parse_endpoint_node(struct device *dev,
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> -	lncfg->clk.pos = mipi_csi2->clock_lane;
> -	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
>   	lncfg->num_data = mipi_csi2->num_data_lanes;
> +	lncfg->phy_cfg = vep.bus_type;
> +
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}
>   
>   	lncfg->data = devm_kcalloc(dev,
>   				   lncfg->num_data, sizeof(*lncfg->data),
> 

This patch should come last in the series - i.e. it should be invalid to 
select CPHY mode until all of the other code has advanced to accommodate.

I guess you end up depending on this variable a little later on.

I think this patch looks good with the one caveat that I'd like 
bisectability here.

So perhaps take the switch statement and have that part be a last patch 
at the end formally enabling CPHY mode.

---
bod
