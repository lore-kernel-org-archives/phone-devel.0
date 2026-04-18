Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB22F549C
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526483; cv=none; b=LmQhFpkLUpzVbR5g9XvpaBl4f7+Kg+eh0J1Pt2ZRWK63Buu4simqnAEIWJL0W43jAUOlt//mmeN3xrbRLhSHdStj9RUbMUsO74nIldASc97AUr8bTQC6HHEOLVs6RHM72oaViMH8vKpJKIz7GMuqO2ceneOeh9YsE8VKlvAV290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526483; c=relaxed/simple;
	bh=TPzN5DMU8T/18hixWg+6FbE+3zhkzJJf8xccVhqSMfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t82vJEBEIJEIXssE5gHBNUjgONjd1HEyYSsNfItI379d8sHWiECi/8Cg6Dy1iclmLMXLE+Ig/jhZzcK86y8VV16yz4MSYqwaZI7fWzbvYNovGDqGt51vlgQdHxb2nLR2N1VCijPcuFntuwzUo196PyUUCWO1yZBV8VPr81fEpdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2sPNMUH; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2sPNMUH"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-793fdbb8d3aso15665167b3.3
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776526480; x=1777131280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=e2sPNMUHwQKNFxBRt9bexCJ7KiZUbIjPEp2KZ0QTgLwoeUhdJAZDtlQ3wqLmm9ftq4
         9AYQRdBbeOKzg2VMOaxw4iNCTkrADpJAY16VodX/oxhSX1kyXVRpTXSxPAUd5BCPhuJg
         sAH8Ee24NG+6UJyXveWJywzJiyz22ktRBQsD98lLstJ1+yTdVXMZYuXRpHA++lp8mdK1
         TfcziVZqgAtU7Jd57bx46JWaW3FQxYl8LG6ywgiI+EN1jyzQAaaS2GQ4BHFxESFoLElc
         yaQiSwCXP/cqy3qlRAktz3Q+CuOx/uvso2i/HPRkQ8yh/a2auhOegn6U9ENP+FLKOvDQ
         GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776526480; x=1777131280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=BhYfIrlp8yYD7fWuT1oBsMo2lyjeISKkxNLxx6yjfeR0PR1w+hEz/VaEEGnap7u+6R
         HYsvT8RCsPft5ApOjGm8I4B0EfN7fgbEIWM97GUm7u0dYGnAV7kRmg2tQGLcnG0wFF3k
         LVU9lWvtTbIq7ZZB4FT/HfjSss81OwHrHwNwIerG+ZAJ9iDZiHToHvD5Cj1/S/NxzZ9E
         tbEwQPUNbRWoNcXPhUojae50lPAE2b4Lo6QlHhOmVoQZ4ZkNpdQxk3S0fVhzXU8nW9Oh
         5ZyPwllDfvMwqn21guHfRDGrqIP/SX8mYzlimOtIzM92CpYtrbXo0R3UhvLoh2AvDIqk
         MgRQ==
X-Forwarded-Encrypted: i=1; AFNElJ973+tB4Upu9skT4XUw0QVDCa2lWSvno3J2AL+xbULAeMJwwhY70BLaRchdZqNtrNgjPfxDq1DdsJv4JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJH8GtSbiznIAZnZHa3QtIo72roODiQwUDWLIFEMHAITnU+9+
	EAOSYZEnL6cPZZxESRoH2OavQjn6yOpKKA+p5XaKOJy0Awh/7YKLjnK9
X-Gm-Gg: AeBDiev3mtydu6PSOMZ0nJneRecCrm7xE9dZqhwC+1UPJPFxNbQIopK9ogkVA5M7lQ/
	jqXRTl2obEqBS76q0w/3e4KNxqQzwdYwfPNanUAN6/9hxWGoYD1vwuYxSNebtePP6NBUHmohvNG
	+sK8Y0N8xi0uuuOzDx9KYZCD7Aqvhs6ZSS03BjP3pyFgtHxPYoVy6l1B/tR95VGsvDNuo4qbnn7
	g7Sm654NTHsIkUkhRdfeCQtU4a59NmxmtriEvshkbm0oxQ6n0zAUgsX+MT0L3kkP8apu8MBbQwM
	vWSzPnK1rmGvDUkO/iiMjdEwigMr9yxL7NzSa7uHrG7uyfhkwmUQ+R0sjfvhWFCD7FthA6UptMg
	woh8Ixnq9OI0kiAcUuRSPM+BWjc6Nj2gHQx3HTJxHHZ/CWjZxYX/GZpUnv/rqqmFMMb5IWwqgJp
	wzfbCJXRQLWmPGkSpmYB3jMYjUa5CNGT0aU+G/
X-Received: by 2002:a05:690c:e3cb:b0:7b2:9347:7be1 with SMTP id 00721157ae682-7b9ecf86543mr73129417b3.29.1776526480099;
        Sat, 18 Apr 2026 08:34:40 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm20380427b3.6.2026.04.18.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 08:34:39 -0700 (PDT)
Message-ID: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Date: Sat, 18 Apr 2026 18:34:33 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
> 
> This doesn't make sense.
> 
> You have two cores => assign one to encoder and the other to decoder.
> 

This way during decode only one of the cores gets powered up instead of
both, resulting in power collapse fails.
Core clocks and power domains can be moved into Venus node instead of
sub-nodes, like this:
venus: video-codec@1d00000 {
	compatible = "qcom,msm8939-venus";
	reg = <0x01d00000 0xff000>;
	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_AHB_CLK>,
		 <&gcc GCC_VENUS0_AXI_CLK>,
		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
	clock-names = "core",
		      "iface",
		      "bus",
		      "core0",
		      "core1";
	power-domains = <&gcc VENUS_GDSC>,
			<&gcc VENUS_C0RE0_GDSC>,
			<&gcc VENUS_CORE1_GDSC>;
	power-domain-names = "venus", "core0", "core1";
};

And then they can be powered up regardless if the session is for
encoding or decoding.
My first question was actually about this - whether these cores should
be powered up only decoding or for encoding as well. Bus configs
downstream signify they are only for decoding:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
Unfortunately, I couldn't test encoding on my device. It appears to be
broken.
