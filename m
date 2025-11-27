Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361C2F4A18
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266024; cv=none; b=hzv8QSg7mMhEZwUMAOPK05KkBNbsmLTvYPlM6d/KOTMhLb8rK9MWr4cjK0KvfCHF4pFH66aQ5UuwU5vJzD5WEf8UoZl5zHNf5GrTzyXGi2fT8DYW0bXjuIztSi1nM3cQ1ey7xHVrrKwfh6r0KjrnV5/a/epyWDqnRpQo3JItlDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266024; c=relaxed/simple;
	bh=nEj2rUx8G9gla85oszVk7WefBks8vjxYZLcGA4NKCZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsgpEucd5k495MlMdraYUJ1pdjDD9ngUXTMALlBsUvjNQ5pBWDOwttuDhhbJhEg+ZCEmm68QK93W4d3mOi3tti5y7H5qGIl++g4Um2rZx0nhr2i3Wc1dkF7sT+GDoT50ZRhamBO8lyBuZWWv3I20R2RYkse/1tlvuhpOJKsCW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXTvrBSL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXTvrBSL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso9022535e9.3
        for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 09:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764266021; x=1764870821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETweoxGWZm2ziwTrSjwftUK80iZE4y2BuRacSXs/oVk=;
        b=cXTvrBSLRu//G1uEOfJgmZMZuu1swGKTUfHUrYQIH5KALFTMeO1dJ6OlO+mxtcutZA
         Xw0J9FxnkFtJbbEwzXurObhNlfrGQFPmTGqiwcU3DbLp6wYSakVij065Iv1upwP606Ry
         Z00jNN0GebI8uu8WEhvn69S1x0VFxgEtEvODkii/dIK5zn1L9QmNForyLi40tRO8uriN
         zhFmjuu0V/cMkX507V/O+Mc8wxqCeFb1ds6XHnB4kpvflP7F/jgUDMXR/Mmx54Da74Ll
         mM21Svm8U3YWoVyFZQSaurmG6rXLL9RRWolCWpXcpNooFIC53JBpiCBLPCXb6NJVG9Im
         cAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266021; x=1764870821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETweoxGWZm2ziwTrSjwftUK80iZE4y2BuRacSXs/oVk=;
        b=PkpGlDEhrhKVXSJVEjUwf8Rx9bucnyBsHixL122qjxFVwPMQ6t0/l7DA2Juze1ruA/
         Iy9FB3POljCjN7YI6ysTuPkbVBLpnPmhXb2e0gWCTNIbN0WsLfWQM4li+r4+wWhvTtkg
         ptMoPbJcmj0Ruh5eg49fklIAMFstZAg+olzCtVT2+deb5RHTH+c0mAZfwguphxDiB8wf
         U8b1udq42yTgR3+gq4yMS7sBw0JC3UOESXxUjF/ehGCvuTo+w2+BWD0qtO5qcnnCF/s+
         sgNgb0ur9op6wBLzeJHRYRiIggKyX/dy95AY+WbVJ8jeXeDfkMttyaTWlYxyCpJjHrcd
         9xag==
X-Forwarded-Encrypted: i=1; AJvYcCXz6ot/wRviUlDYgHlRY35Co+QZGFF5bA7RT1AZOIOYzNdyp6zwQYe3+Y15WYaOZh+V/llPK3xrPPiL8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YztdJcojBejRnpERWjG1VCpclVqn9cRPYpR73icLi1SKz/XVIOy
	nPOtN3JTRfewdH25WX6mlureg66kJJhyj0z+I5waXPUCh1mSF5gTAFBpr8YKI8cBJV4=
X-Gm-Gg: ASbGncsosSd+daiVFK6EwO7rzUECrvlKJwiru9i8PTEdBK+z/yZOmG1jUGQzNTYfcXn
	rePWUJcRdC6KAUh3SJmlTCladDTkiS8aoX0DrIQ6AOtmAKV4JD67A0SN02yPQ0Qv/oNeLephThX
	p1U8z37V9M5Lq46bQM97J200eaLOcHJ/PyfxBFC8W0E/mmivuNSj/6Cr/y8n4CGUUoVzJKa8MTc
	j5JoQgS81qt/GDsMNUVf5QuYS4qL2aUrVLnhRyhtyDC4Yg+Bfd60kMG8WlmBu/WzqLGxCTHEjRz
	gdFsLV3toRY4IY1VawUqziHdHQY3+vgKeU8CURNwHIexuSSmPTN5k4+XyvM8OSvxJM5RkXeruv/
	7IwBSI+bfHfwLv07j1zYnxep4S9uls3bMr8ArfonHsRXuIBQKB5nrr8/Cv7zZlmOYE/FGdUzPfv
	CYyKg4e48oFQA7u6T5daa7PiPqimuTntA8z8m+4OacuLHf2npsJwIy
X-Google-Smtp-Source: AGHT+IGfQcg2rnX4fdDDkIwWfOlTxEg1XWFtGmpFpSHYpBftRve1U7d6ObiP5sKkjk0IWCH4pIYGKg==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr251138045e9.8.1764266020721;
        Thu, 27 Nov 2025 09:53:40 -0800 (PST)
Received: from [192.168.1.36] (p549d4195.dip0.t-ipconnect.de. [84.157.65.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052b3f5fsm72574625e9.4.2025.11.27.09.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 09:53:40 -0800 (PST)
Message-ID: <a9ba3370-ddff-4b69-b2b9-9244f759b6f0@linaro.org>
Date: Thu, 27 Nov 2025 18:53:38 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/8] arm64: dts: qcom: pmi8998: Add fuel gauge
Content-Language: en-US
To: david@ixit.cz, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexander Martinz <amartinz@shiftphones.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/11/2025 22:53, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Introduce the fuel gauge node for pmi8998.
> 

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>>
Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..ab3bc66502657 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -44,6 +44,17 @@ pmi8998_rradc: adc@4500 {
>  			reg = <0x4500>;
>  			#io-channel-cells = <1>;
>  		};
> +
> +		pmi8998_fg: fuel-gauge@4000 {
> +			compatible = "qcom,pmi8998-fg";
> +			reg = <0x4000>;
> +
> +			interrupts = <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "soc-delta";

I think it makes sense to add all the interrupts here, even if thr
driver only uses one of them currently.

			interrupts = <0x2 0x40 0x0 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x1 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x2 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x4 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x5 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x6 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x7 IRQ_TYPE_EDGE_BOTH>;
			interrupt-names = "soc-update",
					  "soc-ready",
					  "bsoc-delta",
					  "msoc-delta",
					  "msoc-low",
					  "msoc-empty",
					  "msoc-high",
					  "msoc-full";

https://github.com/LineageOS/android_kernel_oneplus_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L292

Not sure what the difference is between bsoc-delta and msoc-delta, maybe
Richard or Yassine can recall? DT bindings would need updating too.

> +
> +			status = "disabled";
> +		};
> +
>  	};
>  
>  	pmi8998_lsid1: pmic@3 {
> 

-- 
// Casey (she/her)

