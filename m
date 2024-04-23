Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60057130AF7
	for <phone-devel@vger.kernel.org>; Tue, 23 Apr 2024 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877875; cv=none; b=GtyH+AmTAaLuZGGvHDe/mNkdGG7KCCXwupT4VG0lOcaJV8XxGtR68281/HtbkRay0vu77gbb9QWgMWMWrvgnh8nyDk3ifd3GAPHUVMlBgOSOKDut+YMUOONo1sO5EFoxbbI2MYbJn/njcYLVlPNt1wgcLqQ7OPnqnH+dXYksO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877875; c=relaxed/simple;
	bh=EKiFUNWp2CVL7UdhgyBqmC8Xr2ctOjFiU0OMBH/KQs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjeMtUHR0mn9dk5oCMK5SKT7dfJ/yX+mXcBxyXUZG5gEvyKepDznBoiLzWVk92sd3hUgrcBplfun2u97BroQMF2k0OQRRmK6hDIk3HfvlGT0ZpgHJpQIKnRxYva+DxYJ4/mdSGgg2KbxgVBKe8lbAimKAZWhyo8Vubn/2Jo1EjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgYB3Kad; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgYB3Kad"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ddc2ea2091so17173251fa.1
        for <phone-devel@vger.kernel.org>; Tue, 23 Apr 2024 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713877871; x=1714482671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljVofaMz5XK05sXcsxWO2zq54dDkOVWRiaigypPdLmw=;
        b=TgYB3Kade/ZeRX24pgwtEgyFUiYPjqgVxorw6P9BaCZ4/m8ZoTCb8mQLzrG7cY5KcC
         4AjDcN2I/IjPIir+AOPjP4bLAlmyHrAdpcZlmBY/hTn1+csCKFD+KiIIQLEyPS2Eomcv
         8qgvA8yH3AVX+dEZUImgxgwW58S0V3JCMNHYDXhJo9/GjVdd250fVt7Z6aOTHpWUyuLZ
         8cvgk2zsrCIO39iPSVgOuaHPfMOg1sH9Wh8hiz4jCPRGro3APlKflCiH1DQBeKLEE6zf
         yzThZMy4QQdYOT5nDxEGPKcpiQ+Qk8uVFk6VGTWaxBV/AtRUFCBt5G5V2oeQzw/fhQmX
         MXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877871; x=1714482671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljVofaMz5XK05sXcsxWO2zq54dDkOVWRiaigypPdLmw=;
        b=NNzwi10QQZW6NhdmaYW3S1Y72pJxW42Q6fWLodQkimzOuAjH32uuLszysawLyyB6EA
         EoJpZlYVZMJlBEpgnUOhUmDyD68mTb7JdU4lAG/voZyiGwjTPk43XPjgszklMcYb4KG4
         PJnLq5UivoNBjVR2m+75t16x9Ddi789r7tPjlGu4mmN2l2VD7pNS+uPK55vVgL8s65xk
         sJc0lYM3LosSQh2D3rMz4y+EyedcI2RP0zJNfX019Tc2JN6kyvpAkwqM4lcuRemfT7+W
         uHY3tFJgHVRbmO4Cx7kW/Aji1EMB2VgcVZRdm3oG4Vw5kdVzxfEfJKBMBlG+AT5hLPwg
         F4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWa2gtCYBcObPVGdSC7vLSiJze3gLgl7POCD2mBofA14dp87BtA5qmYAn075h6SNrld0/UuTvxTXYVzuo7ZDHHQwcPcjOGV16jCYBA=
X-Gm-Message-State: AOJu0YzxpvPTb9KwI27g4HBYtEWE0xJErAATf9gAuNoouGaxP1Y8wrnd
	Z7d43MjOfZ/233nb1c/pHF36UDbjQnDn962bAFQvk2NtJ8qtkgRPdKeWfbmeFA0=
X-Google-Smtp-Source: AGHT+IH6+a300iDdirczkNG89v3OWEFzlKL6UcHimIG4AYRQ19LBvrY3ZDkgjW/buxJ28WPKLxuKTg==
X-Received: by 2002:a2e:9995:0:b0:2da:46ca:25ad with SMTP id w21-20020a2e9995000000b002da46ca25admr8218339lji.44.1713877871520;
        Tue, 23 Apr 2024 06:11:11 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r28-20020a2e8e3c000000b002d28db9ce7bsm1741252ljk.20.2024.04.23.06.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:11:10 -0700 (PDT)
Message-ID: <3054961d-251e-4e70-b907-4949cfacca96@linaro.org>
Date: Tue, 23 Apr 2024 15:11:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
 <20240329-fp4-tcpm-v2-3-d7f8cd165355@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240329-fp4-tcpm-v2-3-d7f8cd165355@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/24 13:26, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> For now USB Power Delivery properties are skipped / disabled, so that
> the (presumably) bootloader-configured charger doesn't get messed with
> and we can charge the phone with at least some amount of power.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

nits:

> +	usb-role-switch;

this is a common property of the dwc3 host


[...]

>   	vdda-phy-supply = <&vreg_l22a>;
>   	vdda-pll-supply = <&vreg_l16a>;
> +	orientation-switch;

and this is a common property of the QMPPHY

Could you move them to the node definition?

Konrad
