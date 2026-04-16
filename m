Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517930E0CC
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358658; cv=none; b=SYqytoopGvMfkKy471EwQLEgPqnRihcJJCo4B5Wa8Tt9w4eJdVJJPW/eQxRXsYkWVH9gjUPFcRH5ZabfkUHbfhVDGkAupk7VsfHX8d+hmHTUS+GQrHCVlkMe1iklFKsZ9JClz8Mqhj6wPmrinTSuF25pmeTebiurXWg5OWP5vig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358658; c=relaxed/simple;
	bh=ZQzEC9KPPF/hi8gDo0hur4Qe56bygpOXxw15KXDnxAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df+8v7BJITrmnmMTG5MFhwhC0rj9vYm5bDv3nZhXRG01xt+gMIXdyMh4Eqt4YmHPqswlC+C3LrbtxcGwG9BRa3P9IdCF9HnS/RXqeEwmEjS01J/FYDJ+dpQljlB64iuXYAG+csmvoAVYIhCjlhwxv9NZ1XQtYbJ/Apypm1uBeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/MrKT6O; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/MrKT6O"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e96a071c3so26600541fa.0
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358655; x=1776963455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=A/MrKT6O9oD6Gfu2xmuZDFlnBZTe9Jk/sv7bT4sc+7K4ZbAgwuGa56iA95WpWk8z/Y
         E+v2A/H73A1sI0mubI0GSwIcVMuBIZMtaUT/l+FHqTR+g51zKNqsWM4oUriPaUtzNB1a
         2PCDLQnOpAQbDbBiacp3laaM0SHVGtMUPhPosJWmuN5Z3s6CzLSAM2cQ4t6i9VdWqKoN
         IikH+pcAqGOKGLZOPVqs7U2kZ6WVzyQb8rVJF4EDMKOAF4j5XOp6zYwQj75u0LZFRwMm
         PbhdwrTPJZAsuYiq76tTuuj28EInyGiKeNwbr022Kae5Nd+0NIYQBP8gjE6eav+5FgtK
         ehUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358655; x=1776963455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=fu1KUptd7PVyy9CJnsxghPiaKSoIxl/KC+j8gJqJ6NtmnmLaGxtMi0do5q9rp89XLF
         oWVqG4BiqfIyO4pSnfUjmB/EsG/YAQueA/KgbiQa9uS5Pi+CjAPjAH7swpAUqyJXucgu
         5Q7gQGB6zlkO3C/ux2qc0K5leXHBjLonIUFx4IDWflT5K44ogTSmTItDSR+njiHhn17V
         u4voQUlPZmsNEOsDWrTczhHe8j95MMaPY/MTjBfuOmRpSFevS7rRLlfM5jzhpov5nRkU
         tRdrwz7dh/avDp4F09m0Qy62upwgAm+9nofMpnlNEoYMQ8xehPkmMDIqKHJcxWUopeMS
         dswg==
X-Forwarded-Encrypted: i=1; AFNElJ9WXQCeOvwqVfWEdHAJKS5YIKOHpQMaB3aiEE77BbYOBShvFfbZ9Oz9p/Dyv9DDSkRMOAzoPwFvqwumWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhlSByavYbG6lW+HQRBPZLTIJ3E//l2x05nugttfmd/m6SRCt/
	Y6NzvTa3FrL0pfIoaUAdy6ZDeftLkrYfAglLqRrgS2TgTgtOj3W3ityg
X-Gm-Gg: AeBDiet0m0YTNKaSNQMdBOWyMAVjBAgypUAUsf8PpbNR9ciKHXNHm5l4SKdqH/cO2Hk
	v4en/LkSm33Jwt9Jyfl5YfCdOAD5yanqYibi7o/RiTVgA0ycNv+L9ZFBrk1NwehKceAyt+WfDOx
	4NHKv4c8f9d06VGVHpSH/uInEjwUn/KDP3Q75Nr28DAgckHLltqeGrTFeEwh0Mw10GS+Nfjo9jC
	ERL5N1sXhcHLVmeCmCntNf+EhmImcZmvodbxDQEg1OhyMglU+ySzzqQMeJVA6NoKTZGxsfFXQcb
	SQftjtsAp9cruYNuyAoJUCNkEdDKzidOAgDMNK46GUlfcP80Tz0ya9nS3nLfQ4ghn5L/FWLUUvi
	bdBroSYEU/9LnOm4DkgCHcfbWpb2vPkwzKAnPYYpq7/dRIwQaklPaH2/yvjKhOpDmd0YqbaRcWH
	OF9jvEEEXfbilIzvkRTU5e876xuqfDslvHIgDjRsltCuVxmSuItLS94hPyFfBOBPlo
X-Received: by 2002:a05:651c:985:b0:38e:21bb:b2dc with SMTP id 38308e7fff4ca-38e4bf67cd6mr84783971fa.32.1776358654514;
        Thu, 16 Apr 2026 09:57:34 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec6b35dsm12269011fa.37.2026.04.16.09.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 09:57:33 -0700 (PDT)
Message-ID: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Date: Thu, 16 Apr 2026 19:57:30 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
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
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
>> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> index 90e966242720..231a3e9c1929 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> @@ -267,6 +267,14 @@ &usb_hs_phy {
>>  	extcon = <&usb_id>;
>>  };
>>  
>> +&venus {
>> +	status = "okay";
> 
> You need a firmware path here

When I tested Venus on my device, it loaded without one specified -
msm-firmware-loader creates a symbolic link from modem partition for
firmware. Additionally, none of the MSM8916 devices seem to include a
firmware name. Has something changed since then?

> Konrad

