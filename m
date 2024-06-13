Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A081494D1
	for <phone-devel@vger.kernel.org>; Thu, 13 Jun 2024 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299235; cv=none; b=Qhdo5956bMvJjqumYrl6CtVFS9w3UkEBRDgBLayIgHcnrHs05CBQL9d41DWaq4WKNXwAwXZeBeX9W/HuOdTYWx559LcU7dH0ZwxGoxOeoN+upoeiwUu9HNKs/KunFdQGzdKZmfwEvI7ld4w00s9iBmOj1BorloqMf4KiTufefTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299235; c=relaxed/simple;
	bh=vX4tZlfdMiDbAOqyzjLKdId0wIu+miOZ29FnR8jsohU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVCMBdmFe/15aQ5fp1Fes6qq8DTL2CiLAMP1YBssgjdDfEtG6orcBmbMyU5Y4QQxZSbZdzBMiVm5iqdbgzQh7PwMV7IsgWJP1etpvtyvC9IQclEm290k/7+jJzXLoF6rLhGZ5bnpgj7xVIisIYLM2lRMO/oCwN3jay0b1+JqNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3iiQebH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3iiQebH"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so1159154e87.0
        for <phone-devel@vger.kernel.org>; Thu, 13 Jun 2024 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718299232; x=1718904032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmCat4yFzakLoPqsICLGJKZ86qrL9CrdVXXkrAz9XWA=;
        b=e3iiQebHT4EK0OwiMj4owv5tcaaj3m5nUDjIFNNYwjZQcwWx/r0Y9RbNgeqjRkC/U/
         nv1RMkUDeQ6jaCeIWvWS3bKpN87vLZo5G0cBOChYrBGfCDCiYpXJBU2V3qucfEaFLPks
         /Bla1sMan0J5Hnt5sq+FDbh3VIiFQC6jXBhg326Fn6iuulw4GQh4cCrHk+T8MUQQDZcb
         D4+2Mvpg+c9wZlqdFii4EwNTYk4J67fqZyCi5T4/Lq95CTzGVt3nuXbqAAc2NA8AqVDE
         rwI0Jv4CnqzFRB13olKxgFGoNlh8lfK/xqIaJGssOdDLPRrCrCZ/JJqxLu9gJMJG2EKo
         s2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299232; x=1718904032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmCat4yFzakLoPqsICLGJKZ86qrL9CrdVXXkrAz9XWA=;
        b=m4l8n3M0rJmuYam4eere60QMmmK+aN+ahcEUTZNueNm9R4APlL338GHbjHMut46BVG
         1xUQRrCWk9PpxVf4WQZsA8SXOgBdZJA5SXRcE6m/oP/GWQkmNhqr6ZQEZWU+6CRto8yR
         EAyNiYfOpqL2Gbg6BFNRAvpLZSAkitcImm2zzc22l/dSiFCrogB2tns8gQBY+ttNjnaE
         WR2ARd+dEr5d+4xKnWKZhVa2afGjKi2uQpkJCh48p9Ov5Qs3EVC/HonhokkP/ls9wnwz
         K5g1R9KoO+hUBIJ9EdEU7Hj1juTAiqNawAvX5iPUxWrFE/pRWoXtSOCJSftcug/L7Jg1
         k31g==
X-Forwarded-Encrypted: i=1; AJvYcCXj4LmfUz9nnKHvSySCIwH5ezwBSFMRgFkIMTQcsXVPo3qO047bGlqx+uKBJFkXK+fGlUn2HOoLSjOaQ3okk+Mx3fqmlYDim5Xae24=
X-Gm-Message-State: AOJu0Yzp+45mYcyxA4w5JDKB7eu895UJhgcCw7QObrnh2icfKhxp/mJc
	OYX7cd5WJmSU8ibb7lgsfQ1Kn1cO9cEOhZJRno2LFTsGvuwmlmxmgFvLdzC59QU=
X-Google-Smtp-Source: AGHT+IE4j3HMxhLWYVU29TQZzIBVMZHRaQ5xZ54nQ/SRi+BohkpWnbIsKLlp0bKYqGHndxwko/uGhQ==
X-Received: by 2002:ac2:5183:0:b0:52c:8daf:da1c with SMTP id 2adb3069b0e04-52ca6cb877emr133289e87.20.1718299232137;
        Thu, 13 Jun 2024 10:20:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2887effsm295391e87.257.2024.06.13.10.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:20:31 -0700 (PDT)
Message-ID: <5e916d38-7dce-43d7-bee0-a10842faabfe@linaro.org>
Date: Thu, 13 Jun 2024 19:20:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer,
 magnetometer
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
 <2b39d763-5b79-4b21-85f9-22fee9f87468@linaro.org>
 <Zmsp8kPRCE/fIPQk@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Zmsp8kPRCE/fIPQk@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 19:18, Stanislav Jakubek wrote:
> On Thu, Jun 13, 2024 at 09:48:26AM +0200, Konrad Dybcio wrote:
>>
>>
>> On 6/9/24 13:05, Stanislav Jakubek wrote:
>>> Add the accelerometer and magnetometer that are present on the Motorola
>>> Moto G (2013) device.
>>>
>>> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&blsp1_i2c2 {
>>
>> Consider setting a clock-frequency = <>
> 
> Hi Konrad,
> 
> checking downstream [1], qcom,i2c-bus-freq for I2C2 is 100000, which seems
> to be the default. Should I specify it anyway?

Yes, at the very least to silence the dmesg warning ;)

Konrad
