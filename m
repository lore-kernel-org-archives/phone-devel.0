Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA881FFC54
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769436; cv=none; b=sFmZQEf3PMjOnM7VDHgg8n4kmL8MdUnztR4X31S1Xc/+0zwmwRHIvRjQBCMrJafKdoCzlDpPVCj5K6mNpXQLf8j2wotdp34+zVi+tdZAX6D1Hii0tyXU5rInghalUR+OXDkf2XzbnuOHDvoP3jC7uxt3Sa842HScdAX720wZmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769436; c=relaxed/simple;
	bh=x6AxyMhQqdGqFN1K69xSDMF+wdj9jfMXh15jVfyPOFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSg06ktL5YuUXv5+XCwrIsWfsWGd+kWHiUx+MuJTKoldDftwcqXnIufusYpfbkDoRNvyVOPElasrdSKSvmdeJ8G9gNg99yR/fpH6eHYs7XkHqAEmLur+p6KWBk05aA67LGDIiRoYEXzlCgbBbYeK8wA4UbKoYGvgRZkre8gDU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMsYIeeb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMsYIeeb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-550ed4a6374so538935e87.0
        for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747769432; x=1748374232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=nMsYIeeblcIh1Ony7Af43AZXWN6eYaHh5VwH3oLBkQE+/DK/4l8STejhdEvja6AeL9
         HWP9vPQG/6JWMuK5+1tL6JngchNJcDZMtXCN6/OnRKK+NHbUTr3E9b3csIA038npQX6k
         g2NK3c2YuZAmB4zCSC5hwJT0SB4Utl1EV32/im33TRGIBjXGzPv4aaMV+bSiPU0Y1HPr
         AjVW9vT57Z7H6KgELx2bp0HqFJtQ0/fM1CmIceOpnWmZlcvszOCgxXjMynQmiasz/II3
         hi/cAyXLi5DsSrnoLvV9c6hbhqp8Nmq85cnt6au7RkVz0rtQU/UJdHzEj+9d0lZJdXH2
         ksVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769432; x=1748374232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3p0VWyDXbjKjlLoZSFw2DHo0Iai22UkFrPhJcqj/s=;
        b=cH4YgV5DBme4hbF3WelzCFgTLQWvhoOgjR+2/DLmmfdsobf0IhMZhhndlCpbZ+G2km
         NciOIRydkCW2pmEcL7SxGdZLFqg/jZycP8t4/RuDoxLzDPde4lP5Deej6etcA8FiVMrY
         D9Zwgr6FvoV2SOLZ/JibKZne6+KO/2PVTyvMfwLJOjF6SInRPSK/ugJG3m3SkbQntRfi
         aQh0z/F0XqCsqTDucox7AnvbX+aiHJ6OArdy58KxGRMbKZCWibkFE/2nqsckzXVxJ2JO
         6hiXM3pDhEch7c95hMHA3OzWGU+uUMs/MZVRR16IZDDZXIGVV9qzNFqSQKSdJbAx/BcP
         glGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOJLzCG+ZRHIw95K6cn/E4cNAN+Djiv1IyKvzY/DXAT2YkAhRYDa/ZnsiSYctLV1awYJlIJGZGop7Izw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRpkdmqiFckBj5BA9r+7IiqsIRpiazOxPeubj4xfyo4Jyk06W
	VdW4QohXmjnEFhOE95hpyoGKD33/2dMgR+L0PKQARhxi/H5v2FSfxSN7uPagF5gA3wg=
X-Gm-Gg: ASbGnct00Vf3kLaixoIp8uaYe0mpb9kdpYmPSaBZoGdF4wOhByH2h5LUiPAr8USHTe3
	bd2op3q13vqF/lvrGH/URpOZpRV4aqdxUaVMRu/MGc/2pOvflyulWpukmv16PX8Ida16EEyl9/C
	3Hbh80hJ51Z++NpMkfTIw0tbQHU6KJepmdDZ73s6KrG0zlH51YSkS7GqX420WNR6IOK8OzrqAsF
	Yph96Fr/r9QLY4u2lP4RYvo8oLrSZHWJ2jCRKQ246W8E1IBfeixtZXOetb3YvjGHul2G6GIt8/9
	C+2eKaMGF9gnY96HcR9Buj5Qr/iU5X70Ha776ysBjdUM0WfsEG/1yuNXprrjP4WxxFynYiOBA8r
	5Mlvrs/cFl3QMBBdDkEUaP6rX/VMQeQ==
X-Google-Smtp-Source: AGHT+IF36LoL0W1B2tdbhvaX+VoqQRr0ZxEehxaTQy+98wAF5xfwJrfsSoWGXqZoOmJCEe1+CmJLiQ==
X-Received: by 2002:a05:6512:b9b:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-550e71cfd72mr1915127e87.7.1747769432371;
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dba0sm2442502e87.199.2025.05.20.12.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:30:32 -0700 (PDT)
Message-ID: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Date: Tue, 20 May 2025 22:30:30 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
>   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++

Please split SoC specific changes from the board specific ones into
separate patches.

>   2 files changed, 156 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> @@ -11,6 +11,10 @@
>   #include "msm8939.dtsi"
>   #include "pm8916.dtsi"
>   
> +&camss {
> +	vdda-supply = <&pm8916_l2>;
> +};
> +

What is the benefit of enabling CAMSS on a board without any sensors
connected to the SoC? Likely the board specific change has to be removed.

--
Best wishes,
Vladimir
