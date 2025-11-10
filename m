Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6B30AACE
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774556; cv=none; b=PlerCWqMq9GhbNj7wML1Jgnaku82W36/VFjJ7WHF9aHRHKGQ4UPOD4myIR2tsdf8rv9QDU+3r/uFWKvBddeYfNxeRTk/zvSjnmOLtjzpKLdRgtwxM2X7Pm0U2xYrE0FxxFK94LrttrW47WvDQW5u2ns+KpbuwoOCH5A9CVYpwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774556; c=relaxed/simple;
	bh=AL9VUTAnPmoOffKlIJNa0kvWod/v0SpUxAnrML35V+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAZ4eZ33ZVzsgpol8xJoPIP+Ai8XNavbq2hVzOA4jDAF4YKk5Mi7ozMoTIFFOXHACpluAm2EW0sNoYHEII2fZHbPWqwj3sssyIYdZEkY8kJwiRkIIWZ2KcjNPV9deh5qNUs1mjJSrHLTDrRiz/dIMMpBfO3urCHbRRA55KC3/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh5WZxVb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh5WZxVb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477632b0621so19539735e9.2
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774553; x=1763379353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y6wCAKSaMKPZ+2wBt9jzrpJq7K1/r6VCG/1Dr2iUWQ=;
        b=Yh5WZxVbt8FkT4g7ceHlcT4nG5nZjs4aiwypFKjbTCkX4X/A7PTlFZgdKCgBy4bsjI
         IAdI7RzbOVCCZKN22E+8M2FoNQxxnrE9NwjhhVDsUfae17K2xnpD+Fys49MMiogXY8q9
         2+hAhXk8nJCM30P8pG6PyS8GSwwEryLyCcq4PfEMpVO/dLSwyCVAE3s66SQgIiInHu92
         79W9KicD6e2eyArPu1op2ekeVsWKWGZ+UAp/z1rmGwuInIU1makD1Meewzx7ePplk40u
         fuTLVj3q5bXLLlh0kCL1B2egFwivheaMznl6P2fWBPrJSdAf228vdUrHvhLdceBgjyx2
         VI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774553; x=1763379353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5y6wCAKSaMKPZ+2wBt9jzrpJq7K1/r6VCG/1Dr2iUWQ=;
        b=o9jljx7kvLhIk7HtS/hEq71MrB1I4lJjjYdDX6Qu0F0yEPeW26Zk4s5Ei9FAxJ5XV+
         DqjBqrIPbjtA5DFbwWew0cNF0FXEcSCisMjlZi/YioPwj6MZzBhKm+bYXA2mizOqI+xj
         E+HTQanAJkGSYmPS7bB820Htp4oit0WN0I2oKRKQrZQjKwC8JK9kxZeyPgEAJDlDvCvl
         9XdBnuDByEsXz69OAiWL2nAR/No6fe+p+/jzXh+S+nMgUSjSe+B7U+Cub01+0wlU4lIn
         zrxtF8Eixt8okUMO8LRp/1IHZN7b7oWYM9a5Je2fq/d3vtFkoeE6NNRjKDP1ERasty/U
         lI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUF3fdayeyoTW4ycL16X1ktczJG2Z8Jk8BhFJdxTDLvN/KsKj2dGL/NSGXqtdChTYutJpacEfCAWvJ7oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUYaMvgf0csSssfSfNcy+hFRAJiFq4All+BYZOisiAVTOolqM
	bEXr6Zlvz2Iq/tDjQO5R8ohTvLi9oWwoHXl2YBwd1yzV1GcYALAhBFPIC2Mxb0Rv3jA=
X-Gm-Gg: ASbGncsGjtLW3hslFp7pAjZdAn/ZlYc71ohovjWnBXdK6Gg//atT8Iqbyu/0jxwojek
	bLMNF6xJpewlrSY2c4cYENCqQtxgErDGKtRjK4D8HYcsyg82TwpWFNnDma/WobrihRxU2ExWEEb
	ZE6gQUXuE2Sh4O7+TGXbMhhBHb8u7ssOKqcLmtYAz3dzrcQUlQFvnVHS4TS/ITqA3uTJZl48+2Q
	9Esh6DlKxkPj72jE25Cwn7niFOIwCkXwnYNKsY0ORiHPlxT5sBioHJTUb1FxHCIu5PutnwqMjSv
	vVgj8ANwtA1mQOh8B03+Kv4oqTOygzy3xMjlO29d3GmKlVGs6kafjH7oeyp8LQYfgKvABAD7GfQ
	Oi0GGEM7GIhhWRc0pN/E9sCLUm5xIpLEvltd1VErnulSPSFlrepa9gs10jsLD169U7Kc+/p1im/
	tuOfk+KYhgVc94fWiKc/Fh9+VD1yWlz9V4UnLpPLnArA==
X-Google-Smtp-Source: AGHT+IH7a4ZIA6K1hyshUjilyezxAd12GR80z/y8NgV7hZhcHkivP2UCzIhZhQjPDXMAGanfBiROLA==
X-Received: by 2002:a05:600c:4704:b0:477:a9e:859b with SMTP id 5b1f17b1804b1-4777327cb50mr60888925e9.24.1762774552976;
        Mon, 10 Nov 2025 03:35:52 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bccd41bsm197008495e9.2.2025.11.10.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:35:52 -0800 (PST)
Message-ID: <26bc458f-1db1-44e3-937a-f3ee7c1027be@linaro.org>
Date: Mon, 10 Nov 2025 11:35:51 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] media: qcom: camss: csiphy: Introduce C-PHY
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Read C-PHY from the device-tree bus-type and save it into the csiphy
> structure for later use.
> 
> For C-PHY, skip clock line configuration, as there is none.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c441..8f7d0e4c73075 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -28,11 +28,13 @@ struct csiphy_lane {
>   
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @cphy:     true if C-PHY is used, false if D-PHY is used
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +	bool cphy;

Should be an integer from

include/dt-bindings/phy/phy.h

- PHY_TYPE_DPHY
- PHY_TYPE_CPHY

this should be indicated in the dt and latched here.

---
bod
