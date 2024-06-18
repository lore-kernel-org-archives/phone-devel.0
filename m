Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D684FDA
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717748; cv=none; b=t2YISISc9TRbu5hPGp0RJFn94gA4cVmeccI5QF3lUZLm7FCuA5aJE/nVLPTPMPUGUMzlPNeZl5EKg26uCZqHDAny4Un/Nql+wB54WcqdIM+NcEdZzZF4lCsl2G+lAjynC49PLfbZq0+5/BcOx4jY2oVs8hGd2g9CfbwtSn6yR3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717748; c=relaxed/simple;
	bh=gE5K1CMg0FDplJQ5qb/JC8BlAQdTg4qg1zpQnY6aNRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PalVOnopMd5cSh8K4ekZP8rBTL0mP1ZZZ2r/DVSLj62wEAwpbOmsdgAuzZ68JE9be6tF7HFUag86t2vnVB7pY60EKs4Oc5Kkme62Vz3F2T1Cm7kk5OlQLhWYy5tbYTrovvVAbcYGMz/HgNj7NXeaB0FqHICe01BdBfs8i9fgrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz1NFZJW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz1NFZJW"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebd421a931so51401151fa.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717744; x=1719322544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=mz1NFZJWpiq65eSwDWuPoDz3ZahC4Hi718IVwT7Rd41037lj1hdmSWWILaMTn7hDdg
         uT2qRfGvMeSW6UdF4YznZMJqdLbiyhSSqcHfgmKCGPgmeKqCwtQ32EFv1uohr4ejLOKO
         IqAHpl2KY+uDkHSjaLkEoxHOvqxyggCBtylxaIhvGX+zIXyEp8qAd02BR7VAGAgOjsw7
         szEv5f5sdusYFc423maXJ6ai7FE3qqmhkwVE5A7oTwiRFlHIjJL5a5epbGHfgD54cPfL
         Xt35GXl0Az2d0Ima72XD1dLgVIuh+/fEZO4z4D0wSylJxwb49eSxag//zgne/iBrojPT
         mY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717744; x=1719322544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=fTfTvmSOs70R1J51Nub3QNeogNDrTtPxG/s4a82MW91HtRIkdNWEqgq5CxhUR/mYKH
         y1y7qERATpLEBaAbmJwaEIhLR+XhzwVS8drye+VtzpWalMZHUdgPudJrZMQ978ZRRpjY
         rsGb+wGWn8OdtOUb7uAsU1t9m+S6wWe0f5gXfyd49yKkXlmuDafr/Rl+tZ8mj/Br7q9u
         BR8R28AevsPrECSqh75k+fpvd+HqB9A/AgS0EntFgv/COA3bFuZY+vv7FxUrJ6yI3lfk
         H4QebuTcR9Prmy6Abxn1GNWCYk1FA4222Ui3a0qrITEPy8/MQrzSfGtynpkzbvmgd3wn
         Cz6A==
X-Forwarded-Encrypted: i=1; AJvYcCXv46glEnFSK4lL5It7IZFQu6TBRDIbPeVWd1rzEFZ9KI88QE13PCk50hyUBXQq5rehEYbcquRucQB7mcuzmnTfmQQDMiFZtSn0AjA=
X-Gm-Message-State: AOJu0YxRu2R0tcwohAHUIig4wHjz6zkP8AV4emvXPHo3FuhyrNP9pNbi
	1/N8rZ9wv/qjBuMYu7g5EFajGpA8uOQrBmuwGTkmQ+dTC2weG5RGaCAn+uID63o=
X-Google-Smtp-Source: AGHT+IEKKcmYXRZGLCQoh1/2bz9eoQuNYXaJrxW4J4yKb9lxs1Zcann/PJVH0hN3sJo50UZMHp4w5Q==
X-Received: by 2002:a05:651c:546:b0:2ec:fa4:e310 with SMTP id 38308e7fff4ca-2ec0fa4e522mr96437711fa.34.1718717743930;
        Tue, 18 Jun 2024 06:35:43 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c89ce7sm16950161fa.112.2024.06.18.06.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:35:43 -0700 (PDT)
Message-ID: <c0c30696-0d38-410e-8a59-e5ad146da7c8@linaro.org>
Date: Tue, 18 Jun 2024 15:35:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Name the
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>,
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
 <20240618-qcm6490-regulator-name-v1-1-69fa05e9f58e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-1-69fa05e9f58e@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:30, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
