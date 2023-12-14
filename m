Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270996C6E7
	for <phone-devel@vger.kernel.org>; Thu, 14 Dec 2023 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zPqMWoQ0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so1109705e9.1
        for <phone-devel@vger.kernel.org>; Thu, 14 Dec 2023 15:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702597062; x=1703201862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VVO89L9VZTI3O6OBS8Xb5DAR6WYttB1FJb4u0vyyCs=;
        b=zPqMWoQ0tEzto2Aht4d18WMvcyM2ZaVEXQlyJH/B7uZOAWzpaIlw+5Ws2XXKdmwB99
         EKAC/lo+bp9PBt0Y3OaOZZ81v+UeX6hAArtDkTC58a3lWOwDh8QZf/V/h+0xVulBeYf3
         xkhMQQL3tqR9ZE9DVFvPgWqtlZvTVowxxm4ZHxFh+BrP579X3gzPbYkzSiid0PytlePk
         e7JRy7fy1bHOj8up7dy9vfpBpLrbqfldeMSfFgBNfVeOj20QzWdub2xrfS4WM2rJv8Ls
         rCNxwkaGgbB8C8vEdfHPj3NDLkUZ+R42zr0WjnjYQPTN4M6D64ln7U5zk+wI3yGqyGHt
         cozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702597062; x=1703201862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VVO89L9VZTI3O6OBS8Xb5DAR6WYttB1FJb4u0vyyCs=;
        b=L8j3RZtTITSGbvcGVzI4RmS8mWNWU21EA12RCjet1HcH2hOkuo8maXLcmVJl19SDMC
         E20NuD16sVHowUMTFj7nivQ6puc556iNQNl063r9xOR2FmFJJffAvmfOqBsBXIsTWfHb
         UwF9NHvowlo7NFlvfJRZkWGZ2nnn1pHu+25QzQuKuYrHMLqKsEhaJCb4IHe/kCySjc+U
         6FXLH9k0Ugc3gqo2sIEmjRiflaHh05xtr9JxANgpRb5PUikfOKAti5A7ujcKISK0NMNf
         Ccd2YcDIn3e/t1tatJRTLB1RkVCHTezhySS76b7FGoLPofzkuUcYd2kPaEpvxZYf6sBi
         CdPw==
X-Gm-Message-State: AOJu0Yx2Px3qrE+GXPMkgATm5+L75GSyw612p0QqEcw+vOuzFvGSurOo
	c1AYFY717nXp0+mNJbdu5nSYAEMjS0FBTBzQHBRYhg==
X-Google-Smtp-Source: AGHT+IEIw6fODakxs+SDKFkkOz22erjEWVpm1FcZcPyyqFr5OfNKp0LxnOkROs9ikxtK6hyVPI59WQ==
X-Received: by 2002:a05:6512:3408:b0:50b:fa1d:aecc with SMTP id i8-20020a056512340800b0050bfa1daeccmr4627770lfr.29.1702597042079;
        Thu, 14 Dec 2023 15:37:22 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f33-20020a0565123b2100b0050be242f50esm1981318lfv.58.2023.12.14.15.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 15:37:21 -0800 (PST)
Message-ID: <f6eb7bf1-7592-4313-9fe0-a3a8b8039ab5@linaro.org>
Date: Fri, 15 Dec 2023 00:37:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 initial device tree
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20231214-peregrine-v2-0-a35102268442@apitzsch.eu>
 <20231214-peregrine-v2-2-a35102268442@apitzsch.eu>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231214-peregrine-v2-2-a35102268442@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/14/23 21:59, André Apitzsch wrote:
> This dts adds support for Motorola Moto G 4G released in 2013.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI
> - Vibrator
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Excellent, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

[...]

> +		pm8226_lvs1: lvs1 {
> +			/* Pull-up for I2C lines */
> +			regulator-always-on;
> +		};
just one q: is this intended to stay a-on, or will it be bound
to some i2c host (presumably camera)?

Konrad
