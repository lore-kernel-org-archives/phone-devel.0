Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89BB2882D7
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686573; cv=none; b=k+iBt6rbrdpKAs7VTWybO17VfJIQ6HhCEo02NT4oS6/h3lvDefDsRKNjmu6v5gZDBfjWIMtzIMGh5Sn4kWQ5NRpu+9b/8K4expYx2B5PCbGE/30qkY/WIC8NTqfzxftDmFk+wpzjLtSu0q2Bf1X2XQJZTnutmlVPOcYLMWggpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686573; c=relaxed/simple;
	bh=onLbcLZRexGHMs/MuJUUOqStQQZwuoTHvstxMfq3lgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNXN9VOlRdqPtuRxOMLo8yzpTDt8iMOKplSOXxdNJnE5/DtKx9D7D8K15Cy9Bg3meP+PWTdrwTBNUSjjZhLsWFmqLFPRevGmlypaIWE5cd/tMdTGozN2nO5cXq2kEPfX117ef8jPCnR41veJf5JBEMpgl8ElRwgerM88/mXJ1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v60wFDk1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v60wFDk1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso21161615e9.0
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686569; x=1769291369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UffJIUSVYgo0B0h25c8d4mRFsK/J7Y5IFP4JKLVIwkE=;
        b=v60wFDk1Vp2tUsHqYwPCrj2cmmg0FzuYGgjLLJ3kaDEWZfrtkAKGBV+GoCvicWQXTO
         4Lvae6vO785pSpAzBhJvIck7ZRZg5kienjfEaqgRgkcH7PPLT5AV/8SVteGtBA0wfIOS
         ONVy0dDc2QuinPDNoZhy5wHVSYzI+dQdesDUevoupIFsljsLUKTdF+rCFx2200zBouNN
         wvPnkgAUntYziNyC4TbFQMJB8WuHaHG8/ZFeNHua3CtmgdQKehcLI48rbiY18gHFksR4
         MkdkEP096VIWm2vOm8DfHE0yO2YWe3WnENCESsyLwyL3Ur45aW4DgYV3F7oh98BdVgfR
         fIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686569; x=1769291369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UffJIUSVYgo0B0h25c8d4mRFsK/J7Y5IFP4JKLVIwkE=;
        b=Nh9wIHj1Q3qnPifjtLfI5IxXx/tZgMedCVQhY1H9y9iKXX2XtT3P/qtw+2q+qNFMCV
         6xfMgQTzmZdUbiRaZdRL4ee/XfA5SF9xVsYvQAAZ5LpwW9uNQAgm55eizaO8dsg8wzxm
         1yCT13LlERLdrzNEvklfR5lDeqe+zdmJLBDjZitxz3v9JX01GxEVkagRDwNt1LqLXI8I
         QvMdp69biE3Bh3s0Oj/bmmX2Nw5Mqu8vZhRqVXa1M6rHZrOLtZtMr91shhUKcLks4xr7
         xoy0ylQZVdZnVQJxf2Ma7o2TNz82XgCilhXmumS4nbllXVVDoaV5OmDc+FIugjOLcnZc
         fKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXRGGRxZJlpArhn5S31dEoH5jfF7WQ81Cawkk9Ptci1Rv/rF8QF8oqIukLVP/ur04A5w+uCa9xDjPeMnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7eMfYtqI/8PNhEj8YMTrhNCCPh3VnzzpcVvszlrUKj/X99meu
	5kDAOV/27L2XqSdORDEkePfdqMftkbsHhMTZPifabmM4DnOMrLdPSlKZ/1vCeZbYKlI=
X-Gm-Gg: AY/fxX5T43Z6TIz083a9ISZqzOBPfzYjirEyGd6yMbMicYS+G9IenpfIyvq/OQ9Ghmh
	lKRbTZ7PWDYO6U7+Sj+Rhk6yYAPWWtJ9aFrHqO0sjykP/mYguXw+FBHCyQRFRXTMp+wXL4aBpYj
	p6fNa4RQIRtup7HVwNbmVDdZZLvFg7/11kbyOw1Gk1Eh25MRhmbewDL4CieKzFyVHoLcG622EmU
	eFhJOSCZZHLFBUrcfrGjfNv9daDI5SQ5lZG/aWnWrrMKX3R6VIQcxWoFxvA7AGRlypkX4SyiYpB
	xJrr4V5gwAED6/rLhsSaypYBM9qn4NdrBR9rf7Nxn5oE5xgH7b/hCbq5O9TVQrBWslllTPqazpZ
	MgO0XMUPVHi5RNN5aM0PYSk42Iz4qwhYDH7Oe9t+8WszxbsvJA/opXJupjJVcroumLLg9xIMAHt
	td2JtxEIfWjNU95zQsED0JhhZeW5y9NlpQ8mpGm/NNZ3DjulKOXN2e
X-Received: by 2002:a05:600c:3b90:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-4801e33a93amr81774125e9.18.1768686568765;
        Sat, 17 Jan 2026 13:49:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm12904711f8f.24.2026.01.17.13.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:49:27 -0800 (PST)
Message-ID: <4936947b-f402-4817-acf7-299abbeeb23b@linaro.org>
Date: Sat, 17 Jan 2026 21:49:25 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
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
 <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 +++++++++++++++++++++-
>   1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 9e8470358515f..f819472511823 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -146,6 +146,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>   };
>   
>   /* GEN2 1.0 2PH */
> +/* 5 entries: clock + 4 lanes */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -220,6 +221,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> +	{0x015C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 1.1 2PH */
>   static const struct
>   csiphy_lane_regs lane_regs_sc8280xp[] = {
> @@ -1050,7 +1114,11 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> -		{ /* V4L2_MBUS_CSI2_DPHY */
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else { /* V4L2_MBUS_CSI2_DPHY */

This is inconsistent commenting Ted and I'd reckon something 
checkpatch.pl spits back at you.

If checkpatch.pl doesn't complain about it, I think it probably should.

Please standardise the location of the comment and have one for the CPHY 
and one for the DPHY configs.

>   			regs->lane_regs = &lane_regs_sdm845[0];
>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>   		}
> 

Once implemented.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
