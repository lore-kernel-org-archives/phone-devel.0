Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338B3DA5B5
	for <phone-devel@vger.kernel.org>; Tue, 28 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369678; cv=none; b=R5mK+69sxWhsNv+p0yUB1BmYNPR4X66fgwV5oqb3nCmERB0GwNX5NR+k3+g2StZVYEsieEP4B3cOc22kYBq23zbiRCNxueEY4ZgbVml+1gvgI+p0qav0b4JAofJkI7fRBa9zlzq04K8/EGV8cLCXCfqmr9Wy3FJqpsx1zyxTJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369678; c=relaxed/simple;
	bh=1s3zoV2UGzWKIUYJTiOORY7/gFXs9hQgskCHHMAdMIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq1qRnWmQJiQqtF7SMfMQqmN/jQOMc5mN1YWI6zmp4liqkfxyD/ulPXgfpTPSg3JMEPKpYs3OJyhRAGHuWhIzuH5ICtT2mD3vlZeJYYkzKlXnV+7kgVYjuQwirYiM0PpSWRUgxSgX3AN4qcDjaA1196UIpGstW8PTrWSVUVTntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSlZWNwQ; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSlZWNwQ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7991db3dc98so122484857b3.0
        for <phone-devel@vger.kernel.org>; Tue, 28 Apr 2026 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369676; x=1777974476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=mSlZWNwQJhFV/Fta0Lg/DZspuHEowSRFzPDwB5YmB5YVvlCAobHaXdF2dMXrkVWmP6
         g/xKyD7V5BQGr552oP0MAIuwWQfwJoG9l10wUOIwUFYKhaNsShE5/s0dKwohHJguCsJJ
         SaQSHThhsxyLIMGA9L/nHHsLdPmQk8+3q5BOLbtbjWvfF8IXN1rEZfl96Hm7lEkjQk2f
         al+hSdabIBvT8pt/HNoUplH9jag9EHBf8X3Gdm8IQTbZXNOq6Zhi1ntyPYG9Dqevsace
         7d/ggnsUba3izdMo5U6t7Zby1ZQp4PteeSMbrhIUiXX8sGTaDi72bG9LYssP2Ats5Heo
         DTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369676; x=1777974476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=OBjIW3PP82NUlujX2uzLg9c5KDmMEldF51E7KnHxFHjSHA8AOk2inEBKZddgJqtsGA
         KdBKvEWIl1WtUdy4BqAXS2633hpw0g9WzW6+zG4mRe44aG7thZNAGgF+pgZrnegrxZD7
         4wvQCCK2J//pubCWlHeryt2jUghkNnufA+K+fX8JYBtJUP2TAbTu9aBg6hn+ZH6jcnEj
         vKrC5TitsavYQRt5xqAdEd3l7AQooV3Zk3kViY2cUSSKt54H+oQUTEfKxwJ2Drn0KM0L
         DAyltnENt1X4vXq0GpMRlQyttPdtrCzYNWHHCSmWduVucPh1k1gFVbt9nLAU86Vm6ZQg
         StmA==
X-Forwarded-Encrypted: i=1; AFNElJ8tsd+egKHSUhfA+2NVBs+GmHObBUF+pcMoT0QrFKLvWIOMpnhHmuCZIeLbWYMb6uEui2Vo8OgiFR5Mgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhivgTUjLHNRjuC6GHMqph/Vlenj+wN+yXn7I0K4E6ut+IEHI
	C4WYAkp0O7TwCoQuY5a3MJlQP18ZQt3sgIe9eARQRFJ9ebi6QqvLhTDj
X-Gm-Gg: AeBDievbRtmn1GofwNkXTsOIfRIYIMrzJOD3khrykG5aYfzeNotRlCJOgJPdZl521PQ
	YJmoNI70hpBhQEhOMILYCldfC0s189nZ7idpKyaMkD4ZcmCLHOOcB4yH4Nu0Odbnu1j8unSPSXS
	YIxJrGpd0kkl2+zrD64/ZDGCu7+qBfAEEKqEBsdXipOJrnQe7bt1TaGAadWZNfs/sihInKx638U
	KJlHlsGyB1SHSXekk1tz2T4In+EAuR/11bHtRz2Ye9ECpY/Kj+gi8RjkGQQkYOkjcyUVKJlnqAa
	Qqz1E2Et3RWKzfd0CaSASYDanxw1tAyFg/kNC5o7zpxsdngZCvj0AV7kVQHEqg0DyhYgiZ4cxPZ
	rR8ff2Gkza2UspuovvOhuW3ABPs4h9xxLRHOle2Et0Slx5xh8g3a80Z8qeULo7XVIF6XRljmGgw
	hv+u3Yfk5AahfhnfTvL7RukYAs1CTzBJttTn2F
X-Received: by 2002:a05:690c:6e86:b0:7ba:f2f1:86c7 with SMTP id 00721157ae682-7bcf50d07d7mr20810327b3.1.1777369675548;
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e4740sm14218867b3.14.2026.04.28.02.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Message-ID: <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Date: Tue, 28 Apr 2026 12:47:48 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
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
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
> 
> So to be fair in this case you do have a reason to have an encoder and
> decoder compatible here _but_ it should be the case that one one of the
> sub-devices contains CORE0 related stuff and the other CORE1 related stuff.
> 
> Because in that case the sub-devices actually represent individual
> hardware settings.
> 
> So listing power-domains and clocks for both cores in each node like
> this militates against that.
> 
> The other thing is to double check of the encoder and decoder are inter-
> changable here i.e. can either core be encoder or decoder or is it fixed ?
> 
> I believe on older generations - perhaps not on 8939 it is not
> interchangable.
> 
I found this in LA.BR.1.2.9.1_rb1.5:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
Only decoder bits are being set in bus configs. This suggests that the
cores are not interchangeable.
Then again, I never managed to get encoding working on MSM8939. Testing
it with
gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
v4l2vp8dec ! xvimagesink
Fails with the following log: https://pastebin.com/nmZcLgPV
And in dmesg it reports a firmware error:
[  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
session_id:dead, pkt:21001)
[  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
dec: event session error 0
[  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
enc: event session error 0
[  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
Z:\b\venus\utils\src\vbuffer.c:1319:
[  785.791641] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.018339] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
(recovered)
This happens regardless of whether I enable the cores for encoding too
or not. The same errors were happening on MSM8916 as well. So I can't
tell if these cores are interchangeable just by testing.
