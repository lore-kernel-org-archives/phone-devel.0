Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C728851E
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686344; cv=none; b=Xn8EyNMLRMo8Uxtal12ZCqDY8KEFsP1eNXnX+KX8rYhNsSfBVytkHp7nNyARXfLov6MMNvizqwlhm4yDUjEqDa6/R+ErqcSdBSQOFKglKSTB+9WJ2kxGxqzx0kC9Cw926Tx6WVJED1/txowcFhEvNIp0pJgdN3YNfyEhmytaGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686344; c=relaxed/simple;
	bh=0uz81NtG/vkuLGFutGR+aZqXQZBLoZNngy5nYCQ664s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsxcnp21G+ChV47IG10j/gJyKVUkkV7Nyhfhh3ojM9jMPhddYTwcZz7tu9LaYrfmOrkJNDJdz0wFkjrWMowjuUxxnEQLohJFj5rZgD7mLAwytifEZMOBNfGoaGk8E0BUf1pbziwLCR+4QgnoJAWX1gaofFL7cTFKafzW5OdTMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkHOYd9I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkHOYd9I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso17143055e9.1
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686342; x=1769291142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=JkHOYd9IxhzDrifYRDn6k6b2J6NkfOvukeY8uoS20HYGL4STIt8KkpU69T/9S3oOWZ
         AWJQlndagjSD6NVjMYyMR0OkDu+Ty3h1BEQgv3ek4kFV6Cc2lF69FoFaP61AiIaIjwY1
         LTy7UZWw90UJ6kNjBc3lcVHmSkkknkRE++xgO56XLsdud+7GtsoRcXNWGgZhDnccmApO
         ePj1sNkD5RbmuqyWpFtCSOd5ChHukyfQ8qNL+7kqwMxj5tlZjLBg0dBBPufroWrp7rKv
         qIfdl3kxIQQXkmBzqiYGGdv7lHtyoW9zJ1qnbB0gijUuaEcgXbW4iKKgi78Jvdaf4EwO
         8Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686342; x=1769291142;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKeeQEgigGP3fsz7r8SWZQKQz3VCZgZtDO1jaED0ANw=;
        b=j7dyxUBI+AkvjtWMmjfrlaghONdujNdB/pVKMieQTuaeU1NzfVZWwfdnTjHf4t/ZEE
         an9evhNUu/+F7aAcGjyp2rIBKRmmz9hs0qrqLuwA8g4j4rAQOcvHZL8Z4xe8OcGyvp9X
         TkzyCWeEtDLk3zWLgLXI3I4W6LtqmQUck8N3uoDBzgzO24XWDJLJ3Ohn2Cqcfoa5Il/b
         922oWjJejXOJb1ClTfiZDnmeJoEbqTyOvvkUCj3eHNPDfFRNU/zeHl5BHMAiDtLbbwAC
         ow+rVKNNyVYxWSMPBHJGCNEE/fxKvMJSvw7W0ZKfmN7jvr551HqGs7XDoOesIr/bxjli
         TcWA==
X-Forwarded-Encrypted: i=1; AJvYcCVc7FUw/eLPFg46iMFY86gsr3+VJLP9IuYvrgzM1sjAE0QFRUbBsiGLbwBk3CMYrWkpzhTew/x7bUew1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+3gAao3i2heyw8ahSzdu46GSK9Id59rRuefjN2rG1TbgrQlj
	x82UXQJnDI5rgVQtx8BXvOdEMJLkHVja119DYp1wsGKxi1tDgZmq5BIbddawSEoYjE4=
X-Gm-Gg: AY/fxX5mDyMHHIgKlW3dAy9Hc61x7JIaa8Io7WHC9+7WvWHdf/MplWzy4+NlhBM6iqu
	qPUCB/RvJ+djScYKyEtNU56RqPgApy1g6Ka7f8oywnoZuG0+rj/iYMSLEhPxbb62knc/QheU03+
	sI6sr9B+7VIDy9fxN7nVjU1LAsE346EORlhpp3kemKF0JMuMdneJdwAX2KI5Iqb/lbxni8xICyn
	wCONs6JtM0bIcATd8vf9MBrudydguY8GD9JaZYDPdZ1RfMwN5eNIVC39O8ru3Rx9KqWoSW3XnAd
	1IqumzO1mn3a+JZ9cJ68fncRDLmX3ENUq3jlZTUmzearODYmfO/EeXgmhyS4eIDzZl5KrWv0Tog
	Mzatf/gcIthQqpyCPF4AVUE50wZyX7MpD+PjiG+QUyQAGi+t/qCC030dfNIg9usXI/wkRQ3Z1SJ
	Rgl+GJ9QcdBneBQmJEXQpcNeNBBMfn8IG2I7v3AX7rFWSfK1o8hYTB+WRjxkU08mQ=
X-Received: by 2002:a05:600c:8b78:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-4801e30a790mr89523405e9.8.1768686341602;
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm111346115e9.8.2026.01.17.13.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:45:41 -0800 (PST)
Message-ID: <6fd412e1-31d4-4f8b-9aa3-e2d7423fca66@linaro.org>
Date: Sat, 17 Jan 2026 21:45:31 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
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
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <phodina@protonmail.com>
> 
> The lanes must not be initialized before the driver has access to
> the lane configuration, as it depends on whether D-PHY or C-PHY mode
> is in use. Move the lane initialization to a later stage where the
> configuration structures are available.
> 
> Signed-off-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 91 ++++++++++++++--------
>   1 file changed, 57 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f3a8625511e1e..9e8470358515f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1048,6 +1048,62 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
> +		break;
> +	case CAMSS_2290:
> +	case CAMSS_6150:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8250[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		}
> +		break;
> +	case CAMSS_8280XP:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
> +		break;
> +	case CAMSS_X1E80100:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
> +		break;
> +	case CAMSS_8550:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
> +		break;
> +	case CAMSS_8650:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		{ /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
>   	val = 0;
> @@ -1119,49 +1175,16 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		return -ENOMEM;
>   
>   	csiphy->regs = regs;
> -	regs->offset = 0x800;
>   	regs->common_status_offset = 0xb0;
>   
>   	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -	case CAMSS_6150:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> -		break;
> -	case CAMSS_7280:
> -	case CAMSS_8250:
> -		regs->lane_regs = &lane_regs_sm8250[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> -		regs->offset = 0x1000;
> -		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>   		regs->offset = 0x1000;
>   		break;
> -	case CAMSS_8300:
> -	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> -		break;
>   	default:
> +		regs->offset = 0x800;
>   		break;
>   	}
>   
> 

Subject to testing.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
