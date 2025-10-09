Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD82236451
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759989053; cv=none; b=nBo/+g9fqoA7QGBdtuYtzDVN7Xz21T2L0fW1Bs8mZKF0a9gNJSTFMgzczCcVjLNEgAhhWYzlYn6ADZ5H+JIXi7DpwkkqWFMA/4JziDudKUJ4RD10mLzaXGQFRWIE07OjdV+MIAi/OhUAyKw64pWfTVe+vX+V9fvB2GbgLxqZFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759989053; c=relaxed/simple;
	bh=CRcGoM/pdmgvjzc/HLi5jOX3AiGRO3dzVYqKflx3hZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNBr11ApKuDPkudEC/IM2df6Odu2z/PE/7gAzAPE7t1VAyA3e8UZ4uHDvUXk/mSJaCapIJLvvY3IP3lVsAe3P6CB+yRoCt6MxCragNUMocKsV9Nz14U6whgnjjxOs09FbjqKmoklkYHQdjWcp2/kls8tW3fBOJ/CAomTy+HZWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=grFunmPV; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="grFunmPV"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-859b2ec0556so63667385a.0
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1759989050; x=1760593850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=grFunmPVQaUBhYHE5+rccqwp8qgK+YMX513QU/fj+vri+LReQY6Q4coqnOdlI+KR3C
         Dycz+S2IKaRGgM1Zmno5ScOSFOj6+V9Gu4GrgQT7MUqOd7KjCSlf89fios5RctSOQ1uJ
         /1DZlUjtBpo/tU98A4S/LEFVNFIFUIDgpbHsMMuLngrnxiUBpOWIKrkrbsyyItWICx2b
         jyUYhTsq1fisTobSHx7xndI7vFj/TNfEFd8x/sn6J+4UvKzNbUDW9BN22tc1t6+C51E7
         buyejUYk9sW/ePk1q6071vm045BFFmw/rb1GlEXiuPRQjnJnldDLyzHaov4PBIfmIcNe
         daFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759989050; x=1760593850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=EVyKQ1SFLbne5a9tv+Y7KPfE7zIBz0DvGkM3FckR9ifqtCkednvAN+zvGhbM4DU5VV
         bvB/LEg+oUvuZ4ULv25wOW9JG9BuIzmsL0pMWSXUA/VvQ0EZCE3m6Vn9SD3U6+Qe3YmA
         KSvsGh7eebHRuhFd442XeKUFkagmP1odRVkAJQiRIKLERfDc9scNyDiI5NwYkF6eG1gu
         vPBbVqGodknjoTg4QQm2LGAAlmjaW7LwG2UUrbWP08Bm5Eoypseyxhy8q0n6hnHuoqL+
         ACmCMOlWFqYpIIoBTLwxbenfc3JMeb1FRpVLKIyZq8H0zjF6EnSpnYpWDA+TjH4MFjSV
         FSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwGIL1UCceteuEMAqse3uUIbyE/vjmPElaA+t4pFK++MZdzTs9kdwmaXEEfp/fexpzFoVkXxMKsXRxsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR/QOUipsQduSPBl91FVChcOmfpdIZJNXCoXsnQIYWNFEVVLwP
	6fGIZ8Axm3+oTs3UauvFLw9QU2ptiyyFJii4tjtHzLLIm4y9X4YpPBJe5b+5qD/Zl8I=
X-Gm-Gg: ASbGncv1d2tJKsxMDKit0cDnMeflO8eH/i3+LV0U1qT/rIMJLK+UJz26ggeEXmitEYP
	I1RrqINRIj+VSHbbyaUH+KvDbOd0UAp2gj2SzrALym1RLjMUKIkVL5wvjpKF48I7lhdGc7bNuu0
	+npJWk8vNIdPuS9u1cgOR2OmBxqfYSZn0OLzgY95WKJNUypc4v/yKZU424EjwysJ2X5b0r7wvEm
	Pj8iU4jicKSBya31x84Xkzw9jZGRGLCNzFwPZL5gPwiWBMlkzl+H49DoW/DrmyHaxSAbnR0RUiW
	v8LQ8L7exP+oqNNpdpm1wEaqdKiaeBSmoZ1yIUgUFfJWpbyQbk3AM2RnTqv6Se47PRa+XP9mGkO
	Ujjf6bshK86TbfOHNHQ8/CjLza/BmBu9ZEQCSDwptPE+Z2Up+w9YDrhEWQK3ozUVlEFwz+u5YSX
	Fiq/dHdKinDRk6fpaHLoMU5jZ+CScrVpmQAA==
X-Google-Smtp-Source: AGHT+IFCznXbDVprhXyGUQz2c8H3d7UxKBtr6+yolyAKzCcIf8tTzXD2m9VShCCqzveYlA1zyjZR+A==
X-Received: by 2002:a05:620a:1a0e:b0:868:5fe7:8d92 with SMTP id af79cd13be357-88350983f36mr1024873685a.31.1759989050419;
        Wed, 08 Oct 2025 22:50:50 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f2e00d8sm136229585a.1.2025.10.08.22.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:50:49 -0700 (PDT)
Message-ID: <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Date: Thu, 9 Oct 2025 01:50:47 -0400
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
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-07 06:04, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add the touchscreen device node for the HTC One (M8).
>>
>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> index 36eb42f0f3d9..040a256f9465 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>  	};
>>  };
>>  
>> +&blsp1_i2c2 {
>> +	clock-frequency = <384000>;
> 
> This is not a valid I2C frequency
> 
> You're looking for 100/400/1000 kHz

Hello Konrad,

This frequency value is used in the vendor kernel [1], hence why I used it.

I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
other patch) are still detected, with basic functions still working.

Let me know if I should still update to use 400 kHz. I would prefer to keep
the value from the vendor kernel (and in that case, I will update the commit
message to add that information).

Thanks

Alex

[1] https://github.com/LineageOS/android_kernel_htc_msm8974/blob/lineage-18.1/arch/arm/boot/dts/msm8974.dtsi#L970

> 
> Konrad
> 
> 

