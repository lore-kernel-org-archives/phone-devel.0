Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E312C53D
	for <phone-devel@vger.kernel.org>; Thu, 13 Jun 2024 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264912; cv=none; b=G5Kd6gGHMB4iM/5Cm7W10qQ3XQEnDWwkkqZed+3eYKjNnaB9ShJGFSVJFfZJrc73ikuk+5EgVtp8m3G095ngUOWOdeN4w0vpdLkPim6n0bKrLUG5ia06m7oXfoC15+WtTEmN3OJENrVuctcxsMbU1cpUh5Hn3OorHDOTBSjYMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264912; c=relaxed/simple;
	bh=4WP+wvpQcfDeRRO9xJK0LLuMXzp+fXt20Q5xyse7NL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRr2H+IcE/3i0+d3WmOXteoaW0CwBfyMjOWPFHcYIa35v/psLwdoEZU5gjWFKNt8hyqmahwYKMg+sp8K2LfXAH8l+arhdV+g29Sf3BMY5eb6gjebLIazdjKLRk6n0vz0SNnUlvuDmz9SAdIp2wi7izB4Vld1khhZCpWXjpmMWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zISvuQ+Q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zISvuQ+Q"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c8342af5eso839338e87.3
        for <phone-devel@vger.kernel.org>; Thu, 13 Jun 2024 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718264909; x=1718869709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VdTreM/4CjpbEldQaCtjNolTelGaHpzCWji9mFlJTjk=;
        b=zISvuQ+QH3dIVH/kACxiA8chwONrMKFXwjbzldw/Kzk9J9tu4S2ulbvMGBIVDkXtBi
         Qoph+vHwIfGjSXDs/mRZHYVhW+VsqTrfhN8MEpQHhrwxlN7s2Y8hksZ1IBsKFqv79Pqz
         I/UZ2efQ4ii8Ol2QoUX7jJPOG34IwCCaSkQJhlJwTFpeRkmSCVtdLz7Ps0Nd18oHYBV2
         2REY65RllXcfht70RNv0bV6wUvhT8pRVB7kigkEhbeTScnYbxRQhMXVaNWEJNdaKb9PA
         rK8ydZQKCdr9Tw/6HFQ6CXhG0Ui1eV7qNi9h6Z28AswVdrJtYCYusdMC5oPbttJiZFui
         8dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264909; x=1718869709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdTreM/4CjpbEldQaCtjNolTelGaHpzCWji9mFlJTjk=;
        b=F7fjxy47DGg/7YD32EKNGSj96ALmfM6wMqITJi1cvzEmHpcXz7HykClHAIaIwipHm1
         +DzToxilO7A+KMKsljqOVHfEMogm74opsNUqz9kKpdKIW8I/KZsNu4Qf7B5Aa0kvwheR
         j0G73YDH7pMP0C9suubrqBpjX2Iu3v9kZa01AORmqvV906Ow3EzrJ02GoHMTF9Pki0l8
         BjptpfISL/8QPwlvi3aX0ckxhTJ+m4bvRDkok1eenC3JGKZ8aT/sLwLgF5mQ1jBp+rCA
         M8biWP0ei9J/Nm4hVRQo++BkNLQBItIO9VICFb/Kib49FZUA9a7Q/DwkZP2xil+5NIbC
         xhNg==
X-Forwarded-Encrypted: i=1; AJvYcCXwSbqTM4KybWVm8HvXYFDa5ohajQcec1kSFaxxyufWmhkNf9q71bqV2s8QoWPvrtY9O1SQr1elI63gnGEXHkyr5U1oIhELewSQHGE=
X-Gm-Message-State: AOJu0YxgX929sVyKKmH4UlHJKbagIy1liiNvfwLeNj4z3Vi1V/cmKEe7
	AX9jbRcf+Pmz086LxDTtWFWus5TqbRiZLAgPnIIm5XCLq/N0nVJO9v5sIwc33yNARdSG5Se60L0
	l
X-Google-Smtp-Source: AGHT+IF2OVDFCqDLMt5hgTHiYYN2fy6FsGkyibfB0dHYIVclAaNr0xSF3MvK0gmdm1UmC+fM9//mUQ==
X-Received: by 2002:ac2:418a:0:b0:52c:86de:cb61 with SMTP id 2adb3069b0e04-52c9a3b7977mr1991716e87.10.1718264909540;
        Thu, 13 Jun 2024 00:48:29 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:c71b:4253:8a9f:c478? ([2a00:f41:900a:a4b1:c71b:4253:8a9f:c478])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287aaf8sm115607e87.194.2024.06.13.00.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 00:48:29 -0700 (PDT)
Message-ID: <2b39d763-5b79-4b21-85f9-22fee9f87468@linaro.org>
Date: Thu, 13 Jun 2024 09:48:26 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer,
 magnetometer
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/9/24 13:05, Stanislav Jakubek wrote:
> Add the accelerometer and magnetometer that are present on the Motorola
> Moto G (2013) device.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

[...]

> +&blsp1_i2c2 {

Consider setting a clock-frequency = <>

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
