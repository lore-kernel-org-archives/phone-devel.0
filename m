Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8402D73BC
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180572; cv=none; b=pBwTfSKBWnnBQSFK/f0j3Uxq9+ahleDpvwO1+WlnszRA6oJK90SxQBVUDnWHDzMMEH7xo0Znix0xQmQNHCVQ4KxmQvw5QPZCZWOd0MHRJOZItdCoB71u87w5R3dMqZEvYjkOJgzxxpJGgkRYqeHzfUOYdi0Z2HZrMkUJXgFfeno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180572; c=relaxed/simple;
	bh=6mybAxFWA9piKMYdQTC95b5ZGi6YKc2Dvduxn+GK1Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V66eb7YMCtDWH+lcaTddksG8vOXTGLRc05zqdPOCJxoE8q0nRRC/zTZcYIJ+vsMUQhkx0SUvantdkLemVmPqJh87+MPTIITS9TgQi7GmDZ9rfl3i76WYSFwe4MH9IsIwfQM/qeTL8JueBL9nVIjLxEXXObe+YlXMFZU2T7tgqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZuwcPG3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZuwcPG3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68da4e45so709137e87.2
        for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781180569; x=1781785369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=sZuwcPG3VczZISaPBGPUIykdEVbYJmqWYESl0nQwgXSBnWyTgIQx+NZWRAXknB/oBd
         i7jzaBuPwUV5Eaz1P9UvlsuO+18UVjbHf2PKL8Mltx8H09UjN3nvf2tL+fcKDz1ylKuY
         1pHLnMxxk7Gju4UrFZsszu2s0brHQs4i0PXmmsR+4Pr+50dOEbXGIq3D+7RVMFMTVIoM
         euvfJGEKm2UELN6qTQ2z6G2pb81APsN/FIxtGLiDDSDfXIgFZkXG/KJZe1EJuXlGxCSk
         h1Wy9jsHN/7KsPEyYyxKQ88nzCXu9QbGQZXgzHnQBwXriPQdJhDu5tDVuiQzCZhR46Yk
         qS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180569; x=1781785369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=l47IblMNCT2BB5Tva0K/klNmYi6uQ5YSzLbdQ8oWz57HY8Foyfeh0GIH6E4QdX0sq0
         6Q7RPPisinu6/RDeqaMpJyVrcy9Jeo4djIsrNNyDUZ4jOd4yV9S26gNouxzrqyKBXRaK
         70pETdR5OlhyCgksKPjlHL6fd1bPy+pLhEUcVaWC17P/l6Ii2Radr57h4kG/DxMt4zMs
         ceubv8U+p/MFBBWmzSiXfbo7qh3GqhHj2qyNDYrDHWZvPruOiQk3x3J4sTc3IxHtOQZI
         OtNScHL389pYKdTFRlrCt8s4/j0ViTozki6eExKQlNz7yQB+T1ddf6QFngPmKbtFqblj
         frZA==
X-Forwarded-Encrypted: i=1; AFNElJ+P8zFa5gZT3N4J2CdhMwbgYDMEusq4UoLsv34PoHpTu/OV/RND/er9M3StB+kp+IKVom2movGIHIpVpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv9IdWgSueN7iRTt0cOLb8/9uOU2NLUyg8a1Sd2b59RFf/HhFf
	A24/ThNsojtB55Hrl4rYmpqIxDIy2gCFKM79auLs/iZGoJfX10xDpTmK3/htyOlOeak=
X-Gm-Gg: Acq92OEZXH5cjjw4nwGHm+sx/YzIY2qGdC0f3NO9TDKy6ueHxSVViYghmwaAhhGt8Gh
	GOUk5ExL41kCDp4kBQhla0+c9oVohlmxgJcAZe7fjrylbpzF/2Ic1eAfBJ+kwvcZPBv/zaIBtlx
	D2OpFF93xfVhimHDdJquA0a8aDzK1xS4dVjHhcpsdJw9FuPlCe9FqN/d8G0xfnUmA52RZ2EvSdz
	lFPIRw7OyMpD9c/NU0SJ1TgOgo1xRuP/T2qmYUb1F3u81zUsVlFMBJ72+31TsLXvTNloKfDSqfP
	iEuCrkp2W7oStyl0XcZ6tR2XiYFRCgDTk/JNwC433hxwOd6wdOOKKKoHkydEON99ybI95h2MV/Z
	Nquc9aj9S8aqBDigxRR2lpy33Cbb4Gb8h3mLhrmt9UoQmoKosfpgnUvxth7Yf4aqYMH5FEAjTcu
	Uif878FcpErlDFQ9biP9NvjwkEVcDAy8g1FradusuiF8kN2ddz3JrkEsmty9dtjJ15mKY+smyd6
	DW6NW+9T0DYsFYO
X-Received: by 2002:a05:6512:1548:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad2ac0a109mr69074e87.4.1781180569120;
        Thu, 11 Jun 2026 05:22:49 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc8d9sm6258927e87.28.2026.06.11.05.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:22:48 -0700 (PDT)
Message-ID: <ed42708e-97b6-4c5a-aa52-d712cd4dc591@linaro.org>
Date: Thu, 11 Jun 2026 15:22:47 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] media: qcom: camss: csiphy-3ph: Fix lane mask
 calculation
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
 Cory Keitz <ckeitz@amazon.com>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Hans Verkuil <hverkuil@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
 <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 21:28, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lane mask must be multiplied by 2, but this was accidentally omitted.

Fortunately this computed lane mask value has never been used expectedly by
csiphy-3ph users.

> 
> Fixes: c94d21ffa814 ("media: camss: Add CSIPHY files")
> Cc: stable@vger.kernel.org
> Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Fixes shall be the first patches in any series, please reorder for v9.

Then, formally it looks like a fix, but to my understanding it's just a noop
change against the current upstream codebase, thus the change is not justified
to gain the Fixes tag, see Documentation/process/stable-kernel-rules.rst.

> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..7c8c0e41bc62f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	u8 lane_mask;
>   	int i;
>   
>   	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
>   	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
>   
>   	return lane_mask;
>   }
>   
>   static bool csiphy_is_gen2(u32 version)
>   {
>   	bool ret = false;
>   
> 

After dropping Fixes tag and cc to stable,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
