Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C854D599
	for <phone-devel@vger.kernel.org>; Sun, 12 Oct 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249220; cv=none; b=ocmGwPyip1xBcuwYf6B4bOzi6FP5Ndb2X5KAAjaBWVUB44QOU3I9IRhNGbuxV+a7AULGaeIczNkf70FJyZYlo4sRhzKpmaGDJWxURvNvLTA7XkL1yoZMdaD5VSnWHn4mc1o87I3jUCeCqHiH946y7RLkAqBBYPxSWyd1IhGhwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249220; c=relaxed/simple;
	bh=J4GE7EyQXEOo3w5bDh2vhnigRy0tlpj7MlJXIT6c3eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf3uLJhsi1oxt6nYRdzhPRkUp7QNY8RkQHAKP6KqR4Y8wgBdCg96LqqDESPtViIVrf64Dcp+o8ZlxjbOL/YHmta23QUfvSHUzuMfJnWE7uvZIoRkQnRWyvXSW5U38SiV0G5CFjXo1OBWianfm5hqSBhy+mm/47icJHDF2utKFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=iojdxx85; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="iojdxx85"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-855d525cd00so558909485a.2
        for <phone-devel@vger.kernel.org>; Sat, 11 Oct 2025 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249218; x=1760854018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=iojdxx854spNBqH/HxnpIPwpC/h7rVVJCPnjnb+tpWTJwstzlc78XyyT61COZ+gBry
         gNJpEijjsakKSXbee13g3nnlo1X3ZdfmwNdbyTBEn2/e7On60E+J21s3c3E2fg+tJj5Z
         YgjySyNIXXZ4jRBmVxraHVHwkJfL4tNn5M/P3Jij/vfpPRK/09KamSLr4pg19I/C0ONY
         YvzaGftOSKNIlbhnZZz86H8m7AKorFDZgnGzeQ6fH8qDpqU5CSinYEAePRDw4PYb2539
         Lyx+3Cbicbba+T7jL2eg/3tsWGs1ByUo+3Qg1z3gjXdOxlzwlc2J5OjvV4X3nZwovWjk
         fKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249218; x=1760854018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMI7wRbzRfPNICl70mUsYJErke1tBJAXXVxBPXEiK5c=;
        b=gopwuehR6kBi2wFfFrfxINJVZofsoBHPA6Nn+jht5B0ahtk6WdcrQ9Q38tvkXPeiyO
         am9fRk/uslnNN/21PUEM18MshZ9CYY3TuNPKFf7VpTcj5OgjqR4i6hCaYPRfkVYkSVyb
         L7vf9AHgI7tLn60FC9TpRXxRPes6qgfl+erMxpNoVT2pTLe0R8lx5/aALiBL1qhG3BOq
         3L6hRtE8vNJwBkQKZf+xvoAOu02HSRASdi6MUFlz6XlZkhgTgIQdP1U/XW+iWfkCtqbL
         B3ZBiPjFWCUMoVuItCGZzNA4Eu67/LQLgzXRngaIHsyFnMPkzf9TxzbZNx9PsdmEVtIm
         0PCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh6HhCW9A11dhAfjWSftIrpfQsD5qnOZm+khTj7RpO18y2xp+RU0flnPLHGYe9E3irmrlqNJr3GnVvtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmb+1GdWBMntUibNxIGejbuLlB/t5V/KmAPnuGzRdBvgJkREkT
	iRRz/9SXjx0lOrRyRCcB7g4LiTxeMW3gCiP9z2KMgFwCNLkyMCLnurCCVndS1GGZqSA=
X-Gm-Gg: ASbGncs9yuJ29OODHqE1Do6SO+0S1D+i5uhoXSbnLqEUGiBAOanxfGRGh8cooTbWKPk
	iMNJ57hxAZZQsd47zmN21ujm5sEzo+fptEh1L5fW0R9zJPIgENe+su4HLNxHHYVABluYh/8vgRh
	Urf+yDM+TX/oV5832xmll8BKyoYdFVRA4fxAu80mMXinGrYWOH7kWm/kXuPZUrzqlQhrCjLR6GP
	L5ATFV+suCYPpZSi/fC3MRIQCkq4wv6F/RzGUeMVP2NDnr/1SmOPIqtQzP+erGAOF6Xm06xhkQX
	fR3ui4TYyLAOM892IUZ9B5MKxFJk8deGqTG2+jrsHjopRF4rNLtW586XQSUX1tIMOZM+xVqufm/
	QB8yvRq0E9wJrBJ41M11pgVOX+id8uk6FpUNeC7Medo16WSWbM1BONJQVH4ZAFP76ezA4LCR/0k
	TOYb1mJywuBzavVaGJNEeeO0tsaJ5vexsYGW+zRz+ePcdGLaadqA==
X-Google-Smtp-Source: AGHT+IEMl4hzF79Bq4DCeP0JM3aR8UtTQq0FlGDLXT7cxwwHa5K+nkf//3379/x4FHU0neaf3KpzLg==
X-Received: by 2002:a05:620a:a901:b0:886:17fb:9436 with SMTP id af79cd13be357-88617fb9445mr508393185a.71.1760249217775;
        Sat, 11 Oct 2025 23:06:57 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca17dcsm738639285a.36.2025.10.11.23.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:06:56 -0700 (PDT)
Message-ID: <458ba722-ab52-4b30-b020-30039102ce57@me.ssier.org>
Date: Sun, 12 Oct 2025 02:06:55 -0400
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
 <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
 <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <84d7ab07-4026-4313-8919-b5f9205132c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-09 05:30, Konrad Dybcio wrote:
> On 10/9/25 7:50 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:04, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add the touchscreen device node for the HTC One (M8).
>>>>
>>>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>>>> ---
>>>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>>>  1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> index 36eb42f0f3d9..040a256f9465 100644
>>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>>>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>>>  	};
>>>>  };
>>>>  
>>>> +&blsp1_i2c2 {
>>>> +	clock-frequency = <384000>;
>>>
>>> This is not a valid I2C frequency
>>>
>>> You're looking for 100/400/1000 kHz
>>
>> Hello Konrad,
>>
>> This frequency value is used in the vendor kernel [1], hence why I used it.
>>
>> I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
>> other patch) are still detected, with basic functions still working.
>>
>> Let me know if I should still update to use 400 kHz. I would prefer to keep
>> the value from the vendor kernel (and in that case, I will update the commit
>> message to add that information).
> 
> Hm, I grepped around in old vendor trees, and it seems like there was
> a period of horrid wild west wrt this..
> 
> I see 355 kHz, 384 kHz, next to "normal" values of 100/400..
> 
> Let's just keep it as-is, but please note in the commit message that this
> is intended and that's what the downstream sets too

Got it, for V2, I will add a note in the commit message, for this patch and the
other one (for the NFC support).

> 
> Konrad

