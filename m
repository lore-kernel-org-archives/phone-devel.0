Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4812239150B
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532469; cv=none; b=J0mJJMHI3MHO/dNdqVH8o+ruWGVpLUU+jkCs4n9fb1AnaFY6U44zndq2Vzjhp8lYFA+yKL/V2TaVAgV33iTcvbw6xGeQshz/SKu7CRpzTrlu3Vja37o6GiBpK4bEQ6WvmNkNsuEVvcgz/xniG+D7zfMH0M8rVlrke9yR8RT1byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532469; c=relaxed/simple;
	bh=Rjq4yiNDsrY2Wz980m8WNISCg1KOiPNISWFecbFsP+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FA3XDLaZg/5sgFF01mKvXilaimeiaFSLXUc3aZeIae1pLl+Ro3kCd+ZlDjO8CzJvWRMt1FRJPpMHNhqY7nNhM/I5lEzuqRAQL3umRCPhzvDgtDhMZcL4t8Oh2LpDYuEla8RwQYH5E3smMJvzJFiwx+RPE9rhW4kkLpvDW7GQ49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRw8wAhg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRw8wAhg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1849113f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532467; x=1773137267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=iRw8wAhg6FXDcL4/esOE5WLvHaM09NEYW7J4ky+im66qLRsJCfy4g0uClmyc8XWSSd
         nBUG3J4yziKdrW1n8z8jkiPffddoAczXSW+qlrfgnGT+mnzovEXMtUo+d0RRhS/w+oSW
         arB1IaJ6hJnrob0QNj32fRDSiKteCRKWb9vqwbfv6jz59IbKKS73plG7nFUu7qZXrfYB
         Eyv3NjrpjTXjLz2SIYfomu07OkOjunFYekEAaCXdBVamxxVW/jnosa8ExWvolrLnvctH
         1w96Ua8wXrHUqUZ8S1sXTOVeqWygWB4/ddeMLMCXRm1W1zhxb4nRlIDmrIzzOEoLhOGK
         bZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532467; x=1773137267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=fXqei561Y0MhW8ZYhH+3YK4h3DjVaUDyjBuq36dhxcHBnthEDHk78lgNw0tQ7eAyVN
         UyIUr/MvESusEw1QtgcGMtlXgZjeylpqVg7aJRO8GIlFgNzbYIGPnKHrMeF3z6sXa5hi
         e0LJ5uQRpvd8fhD9oerjCmhH/rM7s4+hbZj0p7kQowI3DH9L0/sKyaIvgM4OsJS/IZhN
         ItIjUivuY7ewQ5fGs4tYgZ7uf3kw+osZAqKn1mbYfUcoF4Ow/tj7RR002ba1gYjMM2y7
         mS3oPmjPW8lapfMY3VB5nqd8UvvXJxjRVeZrJ7HubxVBQqT4Qk3WdhB44ERc1Gl1RwuQ
         SA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8bj3N1S1Jh6OBBqkyRY7uE3frk2spcYZFBydJnWHKGJvLJIoP8CLs7R/ZTbRvI2RHHLYveOkZLiKA6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKv5GBdnQ2XO8rbM7fOBRcmMFGt0XwUfy0DVnHbWqetQlkT47
	8rEPioqvHcDnqwgRBFXI4OaNlLumK0LlUIxJLuUAoj+6rdLfO7pttJf5kXudlTNC/OM=
X-Gm-Gg: ATEYQzxnN+0Xr6GSME4E13zhQ6+aylU+zQQypSQkmpyKlzDrJKhkIyfeGYr3d5s/U+V
	p3f7YyCTLaOaq8id2uPrWIq/zLUTsqaVzYJvWpUTqgVkgcXH8efdd/gaRmXLtL6/aPUZ6aOvUTf
	IWG30Tv4+4P0yw1jQmfPPI1+a28Um25xEPvQ/bcTWE5H8QD6a4zspmxr/CrELT9koRUtm5zq0IV
	ZrB8jZGYe9HW51V0l9Ucc8WR70qLLlLRq/2ftdEUbUWuQ1DieNT0o3W5lj0H72s750qp9RbAWTH
	FvNQno5DOa90OLybDFQ2yoKEOlCGech1Mp/0deWTVEi+eXxZ9ECKj/AGWLHNGBbQbCgAm+1dzQB
	6vmooevkpZZKiu0+am1mwOlelYMfyMdoqD3jJBRNFQ8zjNtoht2+5E07NYqmI6np0f/c9kXKaTW
	8KtCMCVzcm73GcOq2JgtrZqsLqlHonw1XgtacbtW963Nzu8tunUUaTp/a+MIV61V7m
X-Received: by 2002:a05:6000:288e:b0:437:7010:1cf5 with SMTP id ffacd0b85a97d-4399ddd872emr27275843f8f.5.1772532466420;
        Tue, 03 Mar 2026 02:07:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm14840871f8f.38.2026.03.03.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:07:45 -0800 (PST)
Message-ID: <1fca6458-761d-446f-9223-7875a4a66f4f@linaro.org>
Date: Tue, 3 Mar 2026 10:07:43 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 9/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
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
 <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
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
>   drivers/media/platform/qcom/camss/camss-csid.c   | 11 +++++++----
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index b50b0cfe280c1..2fc17c6a15e2e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,18 +534,21 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
> -static int csid_set_clock_rates(struct csid_device *csid)
> +static int csid_set_clock_rates(struct v4l2_subdev *sd, struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +
> +	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, lane_cfg);
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> @@ -703,7 +706,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   			return ret;
>   		}
>   
> -		ret = csid_set_clock_rates(csid);
> +		ret = csid_set_clock_rates(sd, csid);
>   		if (ret < 0) {
>   			regulator_bulk_disable(csid->num_supplies,
>   					       csid->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 938600f3defe1..ea9dd2cd2e740 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -143,9 +143,8 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,10 +269,9 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ea0c8cf3cd806..4c13bae17007e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,14 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4280,20 +4288,24 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lane_cfg: CSI2 lane configuration
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	struct media_pad *sensor_pad;
> +	u8 num_lanes = lane_cfg->num_data;
> +	bool cphy = lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY;
> +	unsigned int div = num_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e..67be42b4c9174 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			struct csiphy_lanes_cfg *lane_cfg);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
