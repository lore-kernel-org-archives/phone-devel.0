Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5E1607B3
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717765; cv=none; b=U24oRlMQK8AvBKmeVOupxO4mBtioWZxZUg+spzqjSG4Z3nUuVInfFL8slDzCTOWCO7yNseS2tMW3VJETwX0OxDvbGun7KPF6zEJY6BKwjLLbNT3r0v3VlO+J3LH8gdoQxNHaqG9jCX1+i5BRvX+71tWcthFT//tKRyDpzYn0itg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717765; c=relaxed/simple;
	bh=gE5K1CMg0FDplJQ5qb/JC8BlAQdTg4qg1zpQnY6aNRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1Emhg4v/Na02Jfh41yiVzs5qvmrvsT2T6PilCvdr93lMj89xuhtHvGg9zWUL4NF6tPgfCZ+PTq5qED0AUC/WLdRtkyoOMntXSqY7RLkp5w3DQvzmDPXhNLAORqYb5AFCg/x31zKWLLdrqHKeVdsiuE7pWvpb6z/zChhxdWdgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2B63vUY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2B63vUY"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so4767457e87.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717762; x=1719322562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=P2B63vUYfZ59vNDRxC9yU2S2ZKWYTl0FUTUIm9Ezh2a96cIal8cz2avtHwjaYIgrh3
         3+ATRLAnurGStP3+ayiwh86DJ6ObcSu1+TE6Pz+DZQasdo15onMzshoiGX5rmgpgKUWl
         wT1wJK0aGumJSae89Uf/+61nOcKWIoc/eKHyK2xbgiPwlWPDfXmUzIQwimuCMYQYv/pw
         bvSa/23o5i9Q8VI/BDcrFvokoJ+knOWqB9rNPbJ4/+/niji7HGc+FUDs2POZliqZ4ZMd
         W3otcU4d0lhvyJucusKwQ7vN7Bqp1xcsZIaCfZsmc1knLmDLZ4pDcFR/K2muYE9U55MD
         GbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717762; x=1719322562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=OnA+cBNgIEojfcl10JvsqguBIforMf1tO3EGm2NI5ryM8vQDNZB90CxJ9Ss0Ebgg7t
         qjMDaD5dDsuZ/0qM5iyj7pYNJyWDDqSz0K5qIP4TpISAziSHlWaUQFgcicxN72ZIcJhT
         FMXEcng/eTiH/qTuElFYC45kzeD1cUHAB/HxXkL3ZinEtmMNV3Lo6/0exOZyP6/olWoO
         xGR7vMybL21lufg6H9u84haO25/eGMZZyKuEAW77W1uLy6eU/EgzUioziYwUk0Tj6zua
         KGodXnHCr+ViqRf1i0gliLJ5X+6GFpVHLOseQSh5tjN7KIKAKWV5jOjPoIsG18fWtNGa
         sUvg==
X-Forwarded-Encrypted: i=1; AJvYcCXtyD80tZW3AQ0xpkESqtqTkXTeHbBwtqWbrtMHFCI4F9d3FWrSn0PGBHcH5t+VLynGoNFLXBWNuiBqhz4k58cKebL/Sg3q+UCu0kw=
X-Gm-Message-State: AOJu0YzaTIE93rVB5Qyr9XAt27LiUhX0t/Tun6jUN2wF3cuDDOuUN5u2
	dCdCzadXPhHN/xmAgZqP4UozXfuh0N8Jm8D31rxTHo+QTdLfKR1gBhMur46hROE=
X-Google-Smtp-Source: AGHT+IG9ei9VafGhogll0ZfQrnWQuX3q3mJNG9ItxBVOsOkRff58mzJtsjaCsRuB3ayEgZ5pWyxEaQ==
X-Received: by 2002:a05:6512:402a:b0:52c:b196:ea37 with SMTP id 2adb3069b0e04-52cc4767572mr906296e87.0.1718717761608;
        Tue, 18 Jun 2024 06:36:01 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28720acsm1509466e87.146.2024.06.18.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:36:01 -0700 (PDT)
Message-ID: <180bb76f-a547-44c9-824c-b8d57f7eb10a@linaro.org>
Date: Tue, 18 Jun 2024 15:35:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-shift-otter: Name the
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
 <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
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
