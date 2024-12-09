Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4222489A
	for <phone-devel@vger.kernel.org>; Mon,  9 Dec 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747530; cv=none; b=BDP8yH8sRYK9K09NygYpMwPbUBn3xc7MfwhiNrHcEXr0UKB/OChxtc1p1pko7dA2ffXpVYdBXDl17UbDXWh3o4VYOZYm7s/dHeYzVQx6IiW9lO1OheDnPHN7OXsHWSsp6Ppa2xNwvvXvujMoAjUGpAXRAvEV9RIt5IoPrEWtWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747530; c=relaxed/simple;
	bh=FGLn2JnnbPgNLHqbV6sAQ+LR5fP9D0IYaul+g1G6DaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMw1duTjCM+LwVQx+lrBI+aXievnyYVC9ryF08bghqEZtnTDAp1WmxbKQoz5zPP9EN6UBQVnKSKW2YG6cXsob0voCt07elHu5xMY7xURXrUghGLBupfdvEABHcnjP6BZwy2m7zOTssWMYLHLzgxtmYfM4HLlw7rnTs/K3pETaJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOMo9384; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOMo9384"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so47850355e9.3
        for <phone-devel@vger.kernel.org>; Mon, 09 Dec 2024 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747526; x=1734352326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uViGPV/v+nHuHOrvq6Ruv9ExCngCDQh5fTkCG1Yq1vE=;
        b=oOMo93841/umVk3Qx7QhGPmZQC7QVQ/r+ZRdIL5PckE6esOUP+I5Tt7bnPT4UL24bL
         HeYelRCOeH2Qz2gv70OQaugTMt3tiagT6Mx6OJ/GeP2kTkofLrpvJLFQNLCjrUbL/Pkb
         FlM8lknfYxN7t+l7ZVm7Se/HU05E0suuquA4HA8QSWc1Guxhel6x0rP1dA6uvsZIHqGF
         x41kt36x073fcrpPtXk9ZJ7k3TiJ+AUMY3XpSRkBJ+NV59Jw+1DYcWvDKuYkw3SEAN3k
         5rMeWS6R2E1y5PWJZEjKqEyEdXSryIG/CdSd2XxhhZisTM64XG54z/Fj2Nn9aZ0LGSnR
         FJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747526; x=1734352326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uViGPV/v+nHuHOrvq6Ruv9ExCngCDQh5fTkCG1Yq1vE=;
        b=bjy7eYSX900mkJ7g6p5avlDeg0Ev0c3hRYtqfD1Fs8+r3NHDWA7/+DJhnJrxy0LMo6
         bhtsZIDfKQxP5tjQJpt1mbTUBfeK1IGPbNazEkPCcFoLunsEKrGUK2b7lqxQ21P5Pz3X
         hxC9ZJ8eREZFeauq9udyYcQ9SCDqfeDkMN/QBQtIM6ZC+LMs/0auQV6hogD7OJ6VbLba
         S09Ld3B5puD6MU0DPQlVGUeBqjgEQFGsI7m4NPcBTrSh6YZxHipZ7ls8lK1qyy+KI7S4
         rrS5/l2jHZf/HzLDpW8D/PfTFveraFAIqYesJ2uGcoZObZDM0RdXSWoidX9UPO9cKB5x
         DwqA==
X-Forwarded-Encrypted: i=1; AJvYcCV8HHBxKAEBImS374pNZrIVq+ZymPe33LaSoPQWovwX/OX0ug6cYDbSa2Y8/4XJ8yn2w0LCkFOzEO+l7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YykyQfpQCCjlJUOUTnX8QhBESiQPQQlTtE99iN7Rqm5LVmfvYgY
	cw5iEsfzkpds1uB1taIQXQD8sWj6ykF2vSPObP86rSwyzrTrGNm1iK91HJQH3vU=
X-Gm-Gg: ASbGncugY4I85fbu8D68+9ab3zcz78E91w90EaUheUajnxvcD52KJtrHmIGhrjyjual
	NjuA/edw7XivaY30Ls7WjVZZsHbTX1niyDpj6PEXrur4DEOuLb2/LTVRYVB+jyi80MI3ydiUX5J
	E8FB6pjj4d6dnBkwnz66eaNXI4T8TtbOix9usbEBMs0Zn/EhR/b69xhni8XfnNK27AiE8m4kQ/u
	9UK2wnbRSOekDKG3XMZTduqEaeuuJqgxEcOPNvu2o86rPfXsUqW548IBD5NDXY=
X-Google-Smtp-Source: AGHT+IF0QxPe4hKMnzuRcXAHmSvyPWaavGQlC4qzDsq4v/j6r5ozfzx2v6ivK+DXs+Z/GbfSnPDNuQ==
X-Received: by 2002:a5d:5f8f:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-3862b3d0963mr7831264f8f.40.1733747526115;
        Mon, 09 Dec 2024 04:32:06 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621909739sm12864233f8f.66.2024.12.09.04.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:32:05 -0800 (PST)
Message-ID: <9c89e6f4-a9af-4270-b266-537f3464ee32@linaro.org>
Date: Mon, 9 Dec 2024 12:32:04 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
To: Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:01, Luca Weiss wrote:
> Currently the Qualcomm CAMSS driver only supports D-PHY while the
> hardware on most SoCs also supports C-PHY. Until this support is added,
> check for D-PHY to make it somewhat explicit that C-PHY won't work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d2f0d54ecf12ac354d9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	/*
> +	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> +	 * D-PHY is supported in the driver.
> +	 */
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> +		return -EINVAL;
> +	}
> +
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
