Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1472DB7B1
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686674; cv=none; b=WAT/KJRspL80HifLwfovBgUmWkcpDvtRuouMwu6HcLhf9mvRuLDCYdJ7z2aDdUAm86xkg/+fRUgq3StavOzPJEoZP1rWPpl4QZ6EPQvmWox1kzZCbLmqfousx0jOPXtX3sSwJyy8oBvS3BFp7OpBArSzBGLZnAsHYSiYG8g4CDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686674; c=relaxed/simple;
	bh=myLF26efXwG+zrl9RYzCtib2Stxlc7Wu1ovoDV9l8T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgKaX2cMoWngxdL/+yht+ft5dbjLEiSGut/b+UFWLDOfxDskHLmESUoZKeKQMTQ6cjJt0C6zaMI00ZpnbCEHAajGGX3/5TfL+eZfz8XA4QDzRlMz/+m3Q/2g10pOeZHhMbzo9HVwk0HPZ5czsEQT6xse4mlv/wewIgZ6+SIdyMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhV98R6b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhV98R6b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f57cd471so1611038f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686670; x=1769291470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiMJCmaBnE9OMyIR9MSg47wsmZEe9TD4Io6PS5HOP+Y=;
        b=JhV98R6b+4yn8W2CSZcRIHGo/3kO6bQTZV8/3O1iA4cUsxzE9frH+iQ38O0Dub57rB
         4GTkggc7Q+yzqXT+OVlnWOSv+5BGjqBFrQLReIEwdCJu6JREw15Zm8wp97wgN70XMVm9
         PuC83l9FlhfVcm3ZpjuSHFBHFyN9s4XyKd6fpekCj1c20hG62Eju04vnVCwXlxLwJfp7
         52nJMkR8FTzbUNHYEPtgmhFmndjF5r9+7/Inx4GZClPaOFQLbRBgBTlyuGQoK2nbJVFm
         yOg2QoQ6dsfA97ckrekRWdCkQZAarmBEaIkNmII3YhjQDTBxW91PpUYNwmg3iHVgQX3Q
         8A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686670; x=1769291470;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiMJCmaBnE9OMyIR9MSg47wsmZEe9TD4Io6PS5HOP+Y=;
        b=TePtakiajyPvK/r00ch1UvKzCT9ld42BZf4BEjUbIAC4b5oUEZcNrPF9KVrpCyNBNO
         H11giXOkdZbjduBh9znynVelz4v2aJ6Nw4/GLRwWN83+ak2EXeG7A3ZpPY5yHJsAc9zZ
         DE0FCMUTcTUQRRwOt3Kb6RBeThuth33ojvmm9dh+BAD1fSp2HpS6BRoac//CH87HId58
         AeUoMQbmycdP5d1sfazjxrj9RWeKTQ9x1n7maNtWURbfk/QcEI6bT+k4fO7Ex2aXbY21
         Y+gN+nlJtP35p3mFaKbq2ZidwUnPnfIuUO6E96A0uu6BqQKB+FQWRFN/utw753kCgpdM
         +vcw==
X-Forwarded-Encrypted: i=1; AJvYcCUXgQl3VqMdT4wDvyXGueATedzoAdFS1g2y/BrMTJ7INkX4O0dUjj9miIeGcpKOTuzawvhGKeqCIRbpkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDMekx08pQTjq24jX2AxNBuVHr02S+8vcLtWT0hEYIlJexoJl
	cgO6YkIB7ysFYkwKfuBqKdQIRwf0Pjuao4mSDOyYQ1YpPpXPqy6wruJjpdCRkoQdp2g=
X-Gm-Gg: AY/fxX72okZE2dgUgxvCUCpgGSfxTnDDy7qEpIkHTu/Sao6HyRnGP8IHKAhKLmAezjD
	BhUVkwzSXjc6mwPrUaKsrLq4aLGHintNozQy1+SWDm/yK1Ax0XJdhAkkGuxkGFnYtH0ZPvCjbQm
	utD4xBTSMnYf7ts8RgO6AxdCCnUiJfnnYKnz78YNU0w53r0E3YPW5CCXjrQ89TP6oaJAqOi7eVf
	8Zep7+chRNdRL9CmuGsIJcxVUbgpvIFBJtILrrF4G5ANRN2NRH7lCHJSu0PNlRggbb/vniz7ZtZ
	67sIEKt5pb3dI1/4TIO/ac0t8BkTwFwT6BpBu7iBfFQ6i6te+3+n4+hC5IcyOwUaghddcCIaIRn
	uY19qFVdQ2U70MjW3c4S6/o6l0CticwaPw/wnZTwDRV+q/ifIFnvkDGYcKS32otjt+/s5W8PBxs
	57QtbHSaycFA9MTx5JuwRVnltmYSzpYnhJwQTDINvlML7LvMO2P2dT
X-Received: by 2002:a5d:5f95:0:b0:431:266:d134 with SMTP id ffacd0b85a97d-4356a05d66amr10260699f8f.53.1768686670415;
        Sat, 17 Jan 2026 13:51:10 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm13373646f8f.20.2026.01.17.13.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:51:09 -0800 (PST)
Message-ID: <2e903659-fc43-4211-8f9b-10e0a3e1e4de@linaro.org>
Date: Sat, 17 Jan 2026 21:51:06 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.1
 MIPI CSI-2 C-PHY init
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
 <20260117-qcom-cphy-v3-6-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-6-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 110 ++++++++++++++++++++-
>   1 file changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f819472511823..d82a88dad74b5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -548,6 +548,111 @@ csiphy_lane_regs lane_regs_qcm2290[] = {
>   	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.2.1 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8250_3ph[] = {
> +	{0x0990, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0990, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x098c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0188, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x018c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0190, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0984, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0988, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0980, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09ac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09b0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0388, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x038c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0390, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0aac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0ab0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0588, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x058c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0590, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bb0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 2.1.2 2PH DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_sm8550[] = {
> @@ -1132,7 +1237,10 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> -		{ /* V4L2_MBUS_CSI2_DPHY */
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = &lane_regs_sm8250_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250_3ph);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */
>   			regs->lane_regs = &lane_regs_sm8250[0];
>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>   		}
> 

Glorious, two PHY init sequences in the one go. It feels like an analog 
to my birthday.

BOD makes technology jokes.

Please fixup the comment in the code per previous patch comment.

Then.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
