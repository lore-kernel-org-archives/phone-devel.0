Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046312E975A
	for <phone-devel@vger.kernel.org>; Sun,  9 Nov 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762692165; cv=none; b=DmgrMs5lWAZJZQFWWZRvPJOg1gnPUjH5QU+lESfCbyqzlqaZrcECPe9sCE1xsakkE3QpjB9eKZTRuWhbTgLcdBWllINUIE8BQg43UNb4UNUrnGm24xTK81uk/xyB49ve5durQ+F8Al5I62H4A6ouKBqY+eLcrZu4yZ9IWjCFCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762692165; c=relaxed/simple;
	bh=6TOHpgpqHJ5WgnknUzBZQ+Cb+5OFiDU38P5bXDVOJnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eF3dT0LgyYeD9koGTSiuPGvgMQApgY7gIOm29E3nYFTh/XIkmKlQOq5LgKgOct8kvRKa3EhloTaxiC9cdLqcqJkI6qLv/c9YkEcg61+uAErS805NWUUt64BkLhK8XTJCCvdwWm7UYi8xs3CosZcgsyLbWR4MIjrXGh5xa8tKubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNryNons; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNryNons"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b725ead5800so279128766b.1
        for <phone-devel@vger.kernel.org>; Sun, 09 Nov 2025 04:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762692161; x=1763296961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXaxtSEsQGvchBbil4q1XD2yo5gxFEG8Hu3hgTDWe1I=;
        b=vNryNonsftE4jxNo0F1H7ZDzVR2tKZIJan+FzQLQhasqwpJmkGZPpW3VPMZB8gIMV/
         BxRRrRIwWCYxwTVo9zpNaPcXxhOeTsn3LM55+b2cI9w/QwXr4TFFlOuGGytpnIO7B2kt
         HkWKgyzkjwmsvuTcisz7aezSaY9mVdWA1O1rNQlQ8Hareby7TMqd8fHbXuvQWFiCyfVq
         pa8HV328a9oz2glV95iI7M/MvLXlxFAV8bKyijbYQ0/eBjIYEyjo+HCkYqAGPGORUhak
         Ia++lRvQiFQWZxVu9KYEddSTY+Kb2WcP3xPe+vNLViI0bqn3Eye+m/98Rzkgn8XsKS+4
         FC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762692161; x=1763296961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXaxtSEsQGvchBbil4q1XD2yo5gxFEG8Hu3hgTDWe1I=;
        b=mhfFnAu8uEBd1i2beuokSyqCLumDMNO1FVbai14qGmCf9j+s4agXJS4GWC9Kj+qROa
         FmgxzM5s22OSfVK7Rls4S1xe3T3XTNJtdLHmAP7cWe6DJScxcE+TFMCbB3whxQc7JHAX
         6fNbQSCwy5KdWixfQiDc+Mfdlqe3Ithh8DOfkhKY3pYJYCsMQvG8W6iGoAqzfv4a7opV
         E8ZkDSf0XcfoLxjdGGXUFaGlZ2OP95A/zUvgwWrwrlOyeKgu+n7cvGAU0D+BF4Wy5S6N
         2GByjd63XX7Rhrgsojc6iu3Q0wY8tVCxjtpL8SNwDEz2vJwSUaZmH38x3+2LUgRE9+Ft
         jlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6t9v+YyzWY7nZS9nTHmhUj4fwfNtVY7VUitpDxCql8f+OMLzX6/Xpo1QbBdJpBufXVnD88jOhlz7xPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+P4g/sh3fNHa5wfcbPyUCQIhYW6ApagsLfPU2KfTUWk0FOLHt
	yqzx80tDyIQlSB6dGdhYwS4+p7p3KY19leohmCd/mG1rJhGuIFithF59pByvntIddtE=
X-Gm-Gg: ASbGnctB9mmtUCn0bfbUpoXIutsUyYApf+T/G8IwGKg7o5m4gI9WeamUmZqoA3C/8ym
	GbLacl0ZW1rTKJAqrqziZCxlQ9BnLXXsZArZfeAO42cvIjHx0B1kyzWXcaoi2yu7yKSLmYrlXM3
	mD9pW0hYLR3e1u7qxWj28m/laL5DnQ3+FrbK0mX4M3ClZLjumWEx40JsRIzjKq2VzsLbAIrq/lx
	A1d6qy6du5MYfQxWWic1Qi6lrGCmmlqcMfXu00wMtSNy/hWTykHc3UgsxcIJNZibBy6qBG1k/Uf
	rDjd7SBzhCU/xYie+DoBZcVKSy4aM/DYUXfGtxDIbNS48T2qXJnJCwKXfDaEpF6i5iv8K0FWryw
	VyQ2Z4Fcg0YbMrVVkXvipF7mGAcYR+U4WDums/IjwJhxjxrgwbRKAPdI8lHxeXFd9WH/RuxNONm
	Q3exetlJzWvx6sPmM5vNIOUPk5ZHEHmeKoxcCWdMQnVlBd/hYE5IyExbGbblYOG5i+lxX7ehILB
	TOpu31N90pps/Z21INYHkUU/vvFbB/j4QqBDhpxtS9moEZuBFlt0znv8r4/PQ0+Ww==
X-Google-Smtp-Source: AGHT+IENKoAaMYCpquqLORFICuxP93xzbU3KBb6gWvvqfSpI7tXUE7Swy7LtzA/UFFK4KqGX4Fsd5A==
X-Received: by 2002:a17:906:f58e:b0:b70:fede:1b58 with SMTP id a640c23a62f3a-b72e028b9b0mr497726566b.2.1762692161300;
        Sun, 09 Nov 2025 04:42:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6? (2001-1c00-3b8a-ea00-4729-b0ef-dcc4-b0b6.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bcd59sm784848566b.53.2025.11.09.04.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:42:40 -0800 (PST)
Message-ID: <fd0a3ac1-1a6a-486f-ab0f-e5cd69f8127e@linaro.org>
Date: Sun, 9 Nov 2025 13:42:39 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-7-165f7e79b0e1@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-7-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 11/9/25 10:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++++--
>   drivers/media/platform/qcom/camss/camss.c        | 7 ++++---
>   drivers/media/platform/qcom/camss/camss.h        | 2 +-
>   4 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 68adea33cc719..9fb5834b28e2b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +					csid->phy.lane_cnt, csid->phy.cphy);
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index a734fb7dde0a4..61f2b2ac3f159 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 549780f3f948b..248aa6b21b5ad 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3912,20 +3912,21 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @nr_of_lanes: Number of lanes in the link to the sensor

Missing cphy doc comment.>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			unsigned int nr_of_lanes, bool cphy)
>   {
>   	struct media_pad *sensor_pad;
> +	unsigned int div = nr_of_lanes * 2 * (cphy ? 7 : 16);

What do the magic numbers 7 and 16 mean? It would be nice to describe these.

Kind regards,
Casey (she/they)

>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, 16 * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 9d9a62640e25d..0ab908b0c037f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -162,7 +162,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			unsigned int lanes, bool cphy);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 

