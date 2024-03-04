Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A49171AC
	for <phone-devel@vger.kernel.org>; Mon,  4 Mar 2024 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539391; cv=none; b=gHi+QCC/SBWGvD7KjxAApOTINYl+8k8UfdBK++q4HNjEJKSp4uE3cRZKBWPvstfS6jqzTBUq5kpPInql4sJVeJZWv+IT4TdhmqrHGT9d0EeCAfiK/YUXKJucXjq7pUkm7c/ImF05m6gdIP/HRVLilovejucHmKJL+Yl6MsMNi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539391; c=relaxed/simple;
	bh=cf2GQuHUnLGa1HT30qbwpYOorlUsieDl9zdB7rsh5hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlVbijyAVrxlxsL74+M+unvo+wYOB0h8z3iao2UjjmmqIjkjknzMIgVE1/OzW95cnUOzhYwMTA86wDN+3mU5Anu4m27obmpzX59YSNIhAsEYjuIePxTL4JlCe3EMo+dd48mC9zItJxXwuR3ytCxOr43RVV52tWJM7nFHyF3BAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYcZOgOq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYcZOgOq"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513173e8191so4972703e87.1
        for <phone-devel@vger.kernel.org>; Mon, 04 Mar 2024 00:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709539387; x=1710144187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSr0PIDEu1LU4XPjjEQ1EhQ2tPIxMT1qNUrAmVrWMFY=;
        b=tYcZOgOqbS6eBjSkfV1JOgYle5b36xIMq35ASQA4U8HGhelw2GQeGSWAhYJLs7mY+r
         eEjY+sm3WLK6zf63DpZJ5angBx9u/sYteYf+Yybd1wQifKMggf6IYH0ytQs9VlQt386y
         2eMSCgY1uc5dtDMXSS/ZKFbQvOK96xbtR/EgBO+nYncVBjBEzOi93RQCRphrrLn31/Ib
         CKKnEZUPS/4BBMYZUtNIYqgFL3UiAHkg7KfGhhM1iTeXQfKfubHnoXAovf+kZ7c/nEd0
         JDct8+X0dyPPC9byg06bi8mRlMxL6QHtWQxA0wmVzRT6NyAzTOcJasrEydIaGAkDDNL2
         tGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539387; x=1710144187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSr0PIDEu1LU4XPjjEQ1EhQ2tPIxMT1qNUrAmVrWMFY=;
        b=DIhkVeMxDn2YecTcqOav7aUQTcTyMPekAOvyk0yk6CKOCiGOuOhfl6ZruEY6kF8k6Z
         OE4HZv0SXrQQqVNa6LG0M7uVp+ytTs0O3M/UeMckM0wou4T5Rg/8pVr7VjHl/H3TKDh8
         TMvS90mRRoVR1DQNJF9tRoB8mzvMIRG3J99mfXeimpP/ny+SVK2mT2y34YkI0LfNQawg
         RzMM3vynbPXgiA4qtzKZdriU//TyCEzB/tKGJO0ZlgKkhx5FTsFA/UtkZjc8gDyfAa3t
         ez1kmEFo9mrn1bKiEH1jkVmYXntFc0MrFpWgaRcaV07mDH0h2FJcH/JBgVzdKM/pH+rZ
         3WnA==
X-Forwarded-Encrypted: i=1; AJvYcCUD0/mA00Q7gjYaoDiqHqCg6x6PYtxAW4z1/wz4VCj3Ik28JVldf/yb2Fb6idZXngZvlcGuAO5bdA6/KsoTsDlf1gX7Qq5wiiCoJN8=
X-Gm-Message-State: AOJu0Yx2GIWwCMaPVeeQSWSArXDRskx6VuFOqFpzr1oSI4oLCu7pshh6
	DWQoa1YmRMc6fohzkf8eHcC6IurtNiB8kXnQbCr5xrybvdqKIPPhsJUmesA8r3c=
X-Google-Smtp-Source: AGHT+IHHhY2ic0gMBE2XWlw3mxZhJaKJAhDImEtmHH50mtPCTMkl3akkewtk0UKgiJ/cgJozr/Cxbg==
X-Received: by 2002:a05:6512:2354:b0:513:3310:2ffb with SMTP id p20-20020a056512235400b0051333102ffbmr7135798lfu.7.1709539387288;
        Mon, 04 Mar 2024 00:03:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id n3-20020adfe783000000b0033b79d385f6sm11367416wrm.47.2024.03.04.00.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 00:03:06 -0800 (PST)
Message-ID: <a6937e1b-ec4b-4eed-8771-8f5dae801815@linaro.org>
Date: Mon, 4 Mar 2024 09:03:04 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: mfd: add entry for Marvell
 88PM886 PMIC
Content-Language: en-US
To: Karel Balej <karelb@gimli.ms.mff.cuni.cz>, Karel Balej
 <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20240303101506.4187-1-karelb@gimli.ms.mff.cuni.cz>
 <20240303101506.4187-2-karelb@gimli.ms.mff.cuni.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240303101506.4187-2-karelb@gimli.ms.mff.cuni.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2024 11:04, Karel Balej wrote:
> From: Karel Balej <balejk@matfyz.cz>
> 


> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pmic@30 {
> +        compatible = "marvell,88pm886-a1";
> +        reg = <0x30>;
> +        interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-parent = <&gic>;
> +        wakeup-source;
> +
> +        regulators {
> +          ldo2: ldo2 {
> +            regulator-min-microvolt = <3100000>;
> +            regulator-max-microvolt = <3300000>;
> +            };

Messed indentation here and in following lines..

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

