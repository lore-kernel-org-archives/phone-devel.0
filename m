Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB6129A89
	for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200214; cv=none; b=gdv/vjKavqZiD9HSTV8eXd+eVQ4ZOh/e2whWFHp4+lQxbgCRlh25SX+FcxI8fM2Xq1E5SmS9ilywHqDjY6MY/WRa1+iFWTbydDLp3lQcAvUcfGEij9PWSZkDqfZyWqc6lNr+0Qn4LONBjFs28W2RW2I8Jm++B4txQ97MzkVTmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200214; c=relaxed/simple;
	bh=TR6aGTPM9t5wwOjuYIaOf09pZ339d/Sdvarehyw+RI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJU0bVHNV//CxsZC8XKMwfs9YApraFcll5fwATxct3H9SHnbnRHW/yYAwUSIbe6xaFnJPsXSDbwCChoAG2wZp+2FgD7Ali0loeHT4u2vRQyLSkohKJthmayGEgduwNNQYXn/gJBbOEQ+43hVU6gZVHv9axAiTEA/6xKw4uWdbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hELJsJsC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hELJsJsC"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso3416970e87.0
        for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 08:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706200211; x=1706805011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9ORfXvOUXdfPDPAdOO8WW7EHE91PZVtFj2Y6hJfxfM=;
        b=hELJsJsC4b2TK7Ce2bWZTJ59anlKiW4dm8aRfyASmVbDHvs1g4WrdzRGo5UYrdTMTg
         9wbSAIxiaqAGoxtm5NL5vmFvMEedMAsVmv70go6vgU/W7+EPtpkxU4xC/A0mGCCYHXIy
         cZVpPy4QzAqHlpdm3DhOC57j2DW6JEcqz94bpjYH43M8Ms4Luzel4dLKzKcwAaAFRs6Z
         IBdYdTxcBIptdGWnIOJ6+cmiZ/cQBKnpnR9IyCGXh4NHNpZk5zHdjHw/cVXr4U3eSi+B
         aBhC/8Cbyu2VZnvM6tB+riRyplmIaTw7qgRgNnC3QKjrpFH7Fmd0AutixRMwz3uTlcPg
         RpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200211; x=1706805011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9ORfXvOUXdfPDPAdOO8WW7EHE91PZVtFj2Y6hJfxfM=;
        b=QTxIXIbeoQSQnssWdBu0JqZmmumClFsIvNIx9LBe5TDB3Xz/ajF/m0v+3zdYHEiCND
         ZKvymjC0aIYQz/XXSoJ9UeRHQ6ckuJhvdtN05kUFQ/GkJ81dbWAEcKnYTMXAUBCte7mv
         9GCAPXrplSmJNu4QCoS9IjDMfLUK6BCATemaMg9WHGsCqYamB/tzNND1CRlOR8k2llZu
         B2rCHgcix/+PhGqRHgF/hOlcQSrCGA+HBdvVPO/3gfErgVOiZAqSymrlcHtwM5qfBKVw
         hKIoDaBWSowMMtyqx3D8YFGcddRmfQxV1hQUDJnxoT4S3npoq/nazTP3oGZRQaxCstQV
         tGDw==
X-Gm-Message-State: AOJu0YyYF8OCMf/auT8dQr+b/eh3Zk53lgJrVkT9G+DYmXJbd6IkHIQJ
	pocyGvo+OUEcvsKX9ZlEH1MrztU4ZnvOB41fM8W2Wr1ObsRZ8uT8GRvSwxM08is=
X-Google-Smtp-Source: AGHT+IGab5rWCzYSyVXGFlz/nGkyGkJHUkwn1MhWbiuyzkrOOqOp2GzA20uUEh9GMufP45z0IUFQ9A==
X-Received: by 2002:ac2:428a:0:b0:510:c8a:d496 with SMTP id m10-20020ac2428a000000b005100c8ad496mr18520lfh.41.1706200210713;
        Thu, 25 Jan 2024 08:30:10 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050eebe0b7d2sm2931938lfs.183.2024.01.25.08.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 08:30:10 -0800 (PST)
Message-ID: <da281c50-9dcb-46d6-8cb1-ef4662e24a9e@linaro.org>
Date: Thu, 25 Jan 2024 17:30:08 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add tsens thermal zones
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240124-sm6350-tsens-v1-1-d37ec82140af@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240124-sm6350-tsens-v1-1-d37ec82140af@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/24/24 16:31, Luca Weiss wrote:
> Add the definitions for the various thermal zones found on the SM6350
> SoC. Hooking up GPU and CPU cooling can limit the clock speeds there to
> reduce the temperature again to good levels.
> 
> Most thermal zones only have one critical temperature configured at
> 125°C which can be mostly considered a placeholder until those zones can
> be hooked up to cooling.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +		cpuss0-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&tsens0 7>;

cpuss0-thermal and cpuss1-thermal are very likely the sensors for
cluster0/1, can you test that out, perhaps with corepinning+stress?

You can then assign multiple cpu cooling devices.

LGTM otherwise!


Konrad
