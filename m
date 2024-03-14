Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02FA6D1BD
	for <phone-devel@vger.kernel.org>; Thu, 14 Mar 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410548; cv=none; b=JhO2RrHvdgzO+o/X51wQjpEmzkcZfwFpeyqOHpjCndQDNtEMJTJhcrkHkacAiVUKmK/yPpOMQHBdv6uix74XX9Q9fig4+LJ4OhVf/QtfifuStN0wcOBFqdngjCVYeEceP3MYZ/CdeTIbrjrGw3c4K794Vw2Ya1pf/Av2lOSaVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410548; c=relaxed/simple;
	bh=JpUcI29deeFUiVLFVWQx+YC17SdHXIIkn3hGw3jMbmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwygaTE0UQ27PIyf0OSAwuMN9AuObjx5cLPYIGN9z2AGgE4TKMOVrWud90ZYrqHg4dZZQpVYDFAHV+I8a2e7BOjhVF4BherCvTqQNa3E4oErozz555aKU+q64JPk9PatZpO9wTyqVufeKaVxE8nBd4ndY10gUCvNAXU95V+kz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ0D63s8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ0D63s8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so810401e87.0
        for <phone-devel@vger.kernel.org>; Thu, 14 Mar 2024 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710410544; x=1711015344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVCfYz9oIySfeLjhpRglcwU9GXWcLEvHNoQGqzXrLb0=;
        b=JQ0D63s8krTuE1UYeh/HGXwQQm5wN0gZn4Yp07RPqEa5skRCXlLjWUEK5fDWKP+t2W
         0z0RRawgSewaz5IYNy9c8430DFfdXpjnAQ+YffAtBdUTasZWRhSirN8w1TD/xh96oTZK
         TQ0P+q8vW4oFnj1Sl3C3Z08Jan//waZenQTmhHTdBHO+VHBsmjy651hjhHYEAw0tFlMw
         ffmE0+imL6eT1d/yZ1jxP+uu7ZWIfSKel/wS2xFbP0HACAGDpfc3ydW1CjbOYhrmfaUe
         xXl3y7bqFPCcnrS91h3kaScwYZp63OLqD+81MRTU5bp/icxmcYxAgtz2NMyogW9eBz7H
         /aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410544; x=1711015344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVCfYz9oIySfeLjhpRglcwU9GXWcLEvHNoQGqzXrLb0=;
        b=o7gEYFm2Kdc+HGISZv8RUR2BPEdjNv7qhQp4369uZnk5TepTr2QIT4gGuSQsT9Ivb6
         mmT1cOt4nQRm3lmCPRUEMBUoDLHK/ClLLpzcWjkgAjPM6wHkxOrW5zMkY5rZl/xETbun
         e3+ZlOm31N3wfKiwGt6AUh1SK8eU/McYwyILQNkSVXTuINJiM3rUv3UU3b8fQkLxJbyc
         zOaW20HE5xqWGhFRIE0ej73htW4NVNSxKCx2SH/8HcekUzONtW1KMVbEJII3O9Od8vzL
         WNWdj1kbH1Dhl1yJiIHvCgGApUHhroz29Kua6eH3gzohEm0+5XhQRFjTkamxMmYWiLyD
         A2ow==
X-Forwarded-Encrypted: i=1; AJvYcCU+FZ4Od6JxEmO6T0ttlQkrDhnSaVzwhbqbLc/g3MSoTZWwYszAE6BAfX+i5lsYksKN/ajvsyD9w32tN2MvxLHUqs6e5LTLjlz8P74=
X-Gm-Message-State: AOJu0YzcNO630noWEL43OBJxp27TV3Wxg1PfArA/dLf4iqAQk8vQCiuu
	jKx/qfvMRv5fr0s8WaMmx52pizgjcrjXrL+0cF05qP9jDTDJlJddFw4IarhEo9I=
X-Google-Smtp-Source: AGHT+IGlBqvWSjPadbAZx49QcdSGc2n6I1bU76B+EPDyxGHGYorXVB/0f39xhCheAMS5uLJCjQetAg==
X-Received: by 2002:a19:4307:0:b0:513:9f14:8f73 with SMTP id q7-20020a194307000000b005139f148f73mr934909lfa.36.1710410544124;
        Thu, 14 Mar 2024 03:02:24 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b00513a9d149a7sm202192lfs.302.2024.03.14.03.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 03:02:23 -0700 (PDT)
Message-ID: <c213a3c0-004a-427e-9a19-037eab196ca4@linaro.org>
Date: Thu, 14 Mar 2024 11:02:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: Add Samsung Galaxy Note 3
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Adam Honse <calcprogrammer1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240310-samsung-hlte-v1-0-e9b55bf98a48@z3ntu.xyz>
 <20240310-samsung-hlte-v1-2-e9b55bf98a48@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240310-samsung-hlte-v1-2-e9b55bf98a48@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/10/24 15:13, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add the devicetree for this "phablet" using the Snapdragon 800 SoC.
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> [luca@z3ntu.xyz: clean up, prepare for upstream]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>   .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 403 +++++++++++++++++++++
>   2 files changed, 404 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 9cc1e14e6cd0..845af12d15a2 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>   	qcom-msm8960-cdp.dtb \
>   	qcom-msm8960-samsung-expressatt.dtb \
>   	qcom-msm8974-lge-nexus5-hammerhead.dtb \
> +	qcom-msm8974-samsung-hlte.dtb \
>   	qcom-msm8974-sony-xperia-rhine-amami.dtb \
>   	qcom-msm8974-sony-xperia-rhine-honami.dtb \
>   	qcom-msm8974pro-fairphone-fp2.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> new file mode 100644
> index 000000000000..e03227a49b67
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "qcom-msm8974.dtsi"
> +#include "pm8841.dtsi"
> +#include "pm8941.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/ {
> +	model = "Samsung Galaxy Note 3";
> +	compatible = "samsung,hlte", "qcom,msm8974";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_3; /* SDC3 SD card slot */
> +		serial0 = &blsp1_uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_pin_a>;

property-n
property-names

> +
> +		key-home {
> +			label = "home_key";

"Home Key" etc.

> +
> +		pm8941_l20: l20 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2950000>;
> +
> +			regulator-allow-set-load;
> +			regulator-system-load = <200000>;

regulator-min-microvolt = <2950000>;
regulator-max-microvolt = <2950000>;
regulator-system-load = <200000>;
regulator-allow-set-load;


[...]

Konrad
