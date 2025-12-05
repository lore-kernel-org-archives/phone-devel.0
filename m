Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB3305958
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931139; cv=none; b=MLI3B7wgV2ISmj3CpG9RMXfUOX6OC2+DN4/gqvfb4HR2sgGkNQGhqsVS2ZTAtz0PybA5Q02T/n3QcL4g9ZOwmeT+658CcUQECWxjScmfvNzW8XUYH9QdHMsfqTsFGDkyh6xXPU5rDcJVv8JFaMWeZ6A5iV8VJXxEMdXOLZUV6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931139; c=relaxed/simple;
	bh=7Ti0/hGGkcg6vgg8ymr8rwSgVKCe99zuGiU54ocDWAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Py3vVkmth0qasedtdkepK3Pod7UPW1bYnJ3MduMlxipTKY2HsmpKD0nJfsXkAwGzUiIu9yH4m3Aly64eOqVBNBFerSk9NNCN+qSCaXXgFPnom714b9h9GrjYg6h1GoqFUpWUCOFmlcJ4B4Z4d/BDV0JpFIab+lv2xYXOU7SlQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIDmaRxL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIDmaRxL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso9820425e9.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931126; x=1765535926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=wIDmaRxLRmZmtfvpWC8v9C8oFKrswPcglDTp0Uj0bJbjhlYvIIAGm6yncpWdAS9txT
         4/g1IVxSDaXapSvcKOHxPScqV4nGRmfFyOeZq6Ux7+SUPlyK3/i9q+vj/tMzDLxpG3kI
         Fn7yBexlS+sURVrzqwB/jfTBB2fomGqj5P+Kny+809oscQe8vlymxDjN2/tyXYzFMvYX
         u0Nkc16YDYdYL2OO3s7NlQrVzZ34DZT7UXJTOUDzLMxkEX2ToHmniNJFObvRgMSwFrrR
         y4oBS3NYRnlHEMjujPr7I4DoTyBN6iqYOy8rPGVGvpm/kT6W8qD+iW2dd1MEGTNV5yr8
         TBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931126; x=1765535926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk2Qe6UttCBY6LSv0m45hYHnxidbxniuJXbEECMv7UY=;
        b=cI5kkKqK/ucSrcKtoV1SMOm/HTr630kH4hCR8vW8QnpB+c/lyMfNfeJO9NJRLxvgMY
         fGYtGuTNpzgwAeC90vea5Kvc2PDOuZpKLFkKM3PJHcHPkjbTuadW9G4ieOC6mHB0muhn
         xw0OzUlSFOfLTJgfwUZe6pPOgImml1JmQJDHLYfwXn4h0VkECh81EniXjzxia8tEawaK
         BUySKobeXVrRod/JZQULKXIzOeOMftqQpMvZpQRe/2fbPzlBDYICYekX4MbF4qBeC3v0
         aFeP5EEXzFSw1gf1kYFqD6MNqH6LodsHCc+gDzfCxCXAPFbTsNrpGxfHWUw95eLiVFAp
         iTmw==
X-Forwarded-Encrypted: i=1; AJvYcCU3/+cxbWj9Pyvt2aGA51zlUiBY8cg2U9gf1TVcHpCjrcY0lzh6N+VUn/Olr+s92X2VFfXEY1/rIsto+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96c967Vqx953iwDl8vyfgSlWJ+xaAutYwitIY7z1sAmMBYYIv
	jUGxTJR2CJQbkmiErQHiYbptZMIUuKf+Eevchaj6tjuX5iYUM1IpFF0BddCf/ukEWWc=
X-Gm-Gg: ASbGnctuhQF7T1SU7jwuAZ1YKL2HvdUYvECyhJ5cMz1R4lx4YYs4vEPU1MbzdWiyMUA
	kBF4ZrxR6NXhc305V+MCb7MxLdz/nSb1JMBljm+tIhksPWJx5tByVOYpkrEzyZCPkJVd2r2ZZ2B
	5L/I/3eNJmXgota+xQnWBP2Nnsc8dt90dV0glruYdETHgfZ80GeEWw/pZYUdHBem2ITbYni12mD
	QVRmQLfRYdZMxoFnor9vzfuEGqTn2QedYJ8KuACASPOTVIIUyJTi+nwhHisQShGebMiTc8N+Xbo
	qPnU3gI/mgzWbLLtIVqm/4Dp4Ct4FrTukW+rKVBiOC/bmONzbH0ri7jnO4Fm7HTkFtrR/Jcff4l
	RNNmwsN88o6QjcQ47vnHY9TWm4tJMtI2Trj4DH4Rz23yrHGrwIkVTTijJr7PuTWx2EuTzuEz0Id
	DS0x6m/BS4DAEAE15GCvjWVmikNahn4uPrYN6rMGBeg8RpxazbosAikcrxVYNr/60=
X-Google-Smtp-Source: AGHT+IEniZY9x6ScJP/72sFnDswrZrFy73p5tN4uqWyYm+lhn3NmJsuyIGi2aQ1n3YuJ/2WMhpQq1Q==
X-Received: by 2002:a05:600c:35ce:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4792f268a6bmr70857545e9.14.1764931126466;
        Fri, 05 Dec 2025 02:38:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ed466sm72223685e9.13.2025.12.05.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:38:45 -0800 (PST)
Message-ID: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Date: Fri, 5 Dec 2025 10:38:44 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>   1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

Is this error possible ?

If so we want to trap it earlier and throw a meaningful error up the 
callstack to NAK the configuration.

i.e. you could make this function return and int and throw the error 
upwards.

But is there no opportunity to trap this error before this point ?

Either way just printing out something like "critical error can't 
continue" without returning logical result codes to that effect is wrong.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> @@ -1236,25 +1240,45 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		}
>   		break;
>   	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
>   		break;
>   	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
>   		break;
>   	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
>   		break;
>   	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
>   		break;
>   	case CAMSS_8300:
>   	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);

You could trap this up the top of the function.
Make this function return and int.

Or better yet find this error earlier ?

Anyway rather than replicate the if (cphy) { do stuff } in each case of 
the switch, just move the error handling to the top of the function once 
and return a real error.

> +		} else { /* V4L2_MBUS_CSI2_DPHY */
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
>   		break;
>   	default:
>   		break;
> 

---
bod
