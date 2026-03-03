Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B138C408
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531544; cv=none; b=jVg7wkqrd8B0OpW6uSiGmuk3H6tUeBYHWCyNEoANw+HLjHs1xi4FDxzu2N0qTS0/UmbPMr9c0O5Os+urNho4Ju1kQkDfJPiTS6PmV08WfSHSvQBfGsZzm26QaU+GsGTaPxPvIXwLHZEyX8BGJV1ClJ5uH8TnIKEurdAk2PBfkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531544; c=relaxed/simple;
	bh=80jG9ADr3sRQeZj+6MKfSocFpOPETsZ8Vw/RpGIjP2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/WbaySsJ+YW1lYL5Yv0QZcfOXNLcnxKlKrGd6WL61gq73VcBvPyWm7pnp3K4I0t43yUJQ/QzT31nI8WQwDYwq5yrZXmnXRW0bqI8Xuyyu6+gmo0oMYzzLsfDrcjPQVR+U+GTZGj6H32+FRtoUX917P0CxE+fwqH4L5kVBUGjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9Fu7eN5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9Fu7eN5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so65365745e9.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531541; x=1773136341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Czw8AGkm+Fe/UN3W4zP3A5S6h5MUJRS9IWz2PJW9Mk=;
        b=J9Fu7eN51eM68KB2gGREeyazQ5V93MwTD8nZrcodwoXyL/Iayqt7BH5rv68g12WX0q
         6zFpVF7Yz5jZq2tot0UTYs9k/KoHwDDZue0UVUoYqMX8S/XzNwgyxstFdNAs2SzL7dEh
         0Iuuv4pZ2zFU1NA8FjFFGkpvGdLKtSs6PaH/OW03vj13kvlULpqWblkGNKdqRaOTbZj4
         FbHLKhfeMIl0weXhJwIPFDs9wrlk9aZ2zGPEpxQYLP/nn6AGRlou60TMfcROk4tTe0Pm
         n+E7678HemdMnlx5ph8v6bOz+gmVedORW9Qok4QVBUeh1nKplOrqEBt+YNTBiU2Zvhe1
         6R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531541; x=1773136341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Czw8AGkm+Fe/UN3W4zP3A5S6h5MUJRS9IWz2PJW9Mk=;
        b=YOTawQTtdtJyvEtyEDshhovEyojpdrrcJX4l49AirlPEDFrrKp5xJRAvmp36iKjNig
         Hls6bUYR5NyYybzXxIzFxnYUw4ok6HrrRfNqfneBeP7OyxSwhLvBvX5N5fiKFuC90zvv
         gUoqIRw3qyNJtlNCc+hmeDxk5KorR67r8J3iN51LEPIqJ/IkcgvhGXDzlrYdICYwIQ/Y
         u8p9t5GmFj29gnZuht4U0M1TIUOVQ/wHXeKECOMTcCZLQroMSyodgM5Kalo/f6I1TCe4
         x3yMFgWJnIFuyy7Mb4MEMIKb6h8JMN1x150GVwBh3M4Jl0Zzm3X9Z+Zbh/Pb1ENeVnDg
         DOAw==
X-Forwarded-Encrypted: i=1; AJvYcCUEch0Mce6ip5PMDZYJ6HEbOvJ8Ek2NdG3PEtcRGo3cpMmAv/jBGmRBGfQSOqxL/uMcqrmxTtfDY0KuxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgP9+q69dleA7VxJNg+SWZLaAXa6Otp0IbgVoG2qakNnFiJkDO
	xoJWA7IQpXu0kSEVJsbCn4pVAYFC9SvFCNneTGdtgltaUdg7xeDLyOcXy6p4wIxysfg=
X-Gm-Gg: ATEYQzxmELB0xZTKpKGU6yGfKh4Q1MST5wSufssLZSnO7PM8DlqYZcHf9QsVWhcRk6L
	0IUqFjAe8kI2M7seJhaUUfnTGCjrTqGG/jN82GB2fpf9rcmQDO1xArKJV/F/XtooAemjEtddj6N
	vOIQRa5zchbELsqoNVe1bcy61Hw+FMCZyzufmJqFIl8jBKGHiXRWyRpBs00lklHgYYTgdlCiWw6
	OauefarQybH30Ro/A3pihVMnkCRGzHGnF+wUGPJh4mfGS9xtI6zDKOdGf153JMxYhexBCSyv7KO
	n52W/7o0f/oKwgSUnRUAmDU6+LTnPfKUBwNJMe3f0Thmqu7iMekHu6vCAfB5W+HbHusrsVi9Va1
	Q891oG+/sExcK3d7cbE1e9uC7jRambz1wQ3NPf4IeKOZNhA02TYzYzHE4HNHfKOw6wXULA5KMTE
	x6m0AMH4kTkTfwmZXleYvRR+WyicEsfKQ7E0IV5iS7Ljk9OqiYyAESpZ5BKj0FM53rfoPXewcIY
	8w=
X-Received: by 2002:a05:600c:3509:b0:483:c3f3:1dad with SMTP id 5b1f17b1804b1-483c9c20d75mr241280155e9.34.1772531541093;
        Tue, 03 Mar 2026 01:52:21 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485135b6900sm11662145e9.22.2026.03.03.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:52:20 -0800 (PST)
Message-ID: <3f6673f2-ca75-4367-b1f8-45f4462e07ff@linaro.org>
Date: Tue, 3 Mar 2026 09:52:18 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 2/9] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
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
 <20260301-qcom-cphy-v4-2-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-2-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  5 +--
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>   4 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366a..bb4b91f69616b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   	return settle_cnt;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	u8 settle_cnt;
> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0x3f, csiphy->base +
>   			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 4154832745525..cf83c9e062b81 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -14,6 +14,7 @@
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>   
>   #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>   
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos);
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	return lane_mask;
>   }
> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
>   	return ret;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
> +	struct device *dev = csiphy->camss->dev;
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   	u8 settle_cnt;
> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> +		return -EINVAL;
> +	}
>   
>   	writel_relaxed(val, csiphy->base +
>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f4144..938600f3defe1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -265,6 +265,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   static int csiphy_stream_on(struct csiphy_device *csiphy)
>   {
>   	struct csiphy_config *cfg = &csiphy->cfg;
> +	const struct csiphy_hw_ops *ops = csiphy->res->hw_ops;
>   	s64 link_freq;
>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> @@ -295,9 +296,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		wmb();
>   	}
>   
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> -
> -	return 0;
> +	return ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index d198171700e73..21cf2ce931c1d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
>   	void (*hw_version_read)(struct csiphy_device *csiphy,
>   				struct device *dev);
>   	void (*reset)(struct csiphy_device *csiphy);
> -	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
> -			     s64 link_freq, u8 lane_mask);
> +	int (*lanes_enable)(struct csiphy_device *csiphy,
> +			    struct csiphy_config *cfg,
> +			    s64 link_freq, u8 lane_mask);
>   	void (*lanes_disable)(struct csiphy_device *csiphy,
>   			      struct csiphy_config *cfg);
>   	irqreturn_t (*isr)(int irq, void *dev);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
