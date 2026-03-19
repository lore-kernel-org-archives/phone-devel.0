Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5C3C2781
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916504; cv=none; b=ixL5SBRtq+jHIul1IXjOAxydQwDdJ83Q5fw16dzJBLTNXHhSthVc8WCsNFoHaCcdPfOZVO3WXI5FkWlyoW+QxyDPrwX/tODHaHXep1wbjLfaxwglhUa9kJOCBegSqpW9EKPMhC/K103yj3VPKz4N7vlfIUw+PV5OfrkTSyIAHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916504; c=relaxed/simple;
	bh=hAWjeG+NsPQursv7HB44cYhVWfuO9vlvMjswBd0DeMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nr5dfPKVB7EZYaY2a59QyPXTgITk4smg63rN0exJQITsBWKY0PKqgvFLzNCfUomcW7qVfXVB2/HkcjQ+2tQjKSUrxE/5eDVLzWjc5zp6zKWhTWmYPSt8SI/Z7lxTLA9pdNPhjm5OVUh2kaAQI4YZ0wKUWe9vQbBaHqYbrjMerTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6Obaquz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIdHoE1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6Obaquz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIdHoE1h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73t3c2666040
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=; b=W6ObaquzrkpXwG8w
	ZxxbaPsjH1ndCM94kiTk4eo8cUZ1hypd0js4Nv8APJ14lcCpVfandQsCktlh2t9T
	pJs/BTKkO75RfUkNWPtR5NwnM17rZrM6hv8LgfhQohv07aZePUVhGtZwSvjFa9IZ
	elRXiZEY0SiQ9FT3xuLpfy2M2A0EgQSpj4q8ruTX5IzAFIEXMrIZpNplMRlINmVS
	LhDeYA4NDKIGUsRguzfd9RPO2Oe22L3DOmk88u/uxboSG7M0KIJDIgFyHRi6COOK
	9IEKaHODpUUb/P38hfxXzCBDClrrajbKfF0caFfgfPqaKP/duomiwNigtSHU9R9q
	PTpnnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54br6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:34:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so6296261cf.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773916499; x=1774521299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=;
        b=QIdHoE1h016maJZbTABK5UOUSvpm8mxKJwns5lnh2JCh5aX4wClPTk359xLLJRaUyX
         EVXAr6PF3DdG3yX843kd3AS/k/tE23LJ9qaXHcXk/tlwT2A3EUdV5WhSzgP9J+hjHvig
         tSHirR0qUJCX0tC8ONX/T4MBkvQ8uipHQChf8W4VWk3HmlSxGDQaAQtRlws+ZUjx1iyj
         H2+hik2/+NOmhJBunH9nY1dWpGKP5bGR88MwaJMFLJ2jH7B7UYLM1jXP/RIMpAVoDaIw
         nROhF0wPDVI/6P3DFQ2zhIHp5cwGN5K3wUlL/IZeiBqC/A0Xdu7M/XVwzOEH8MjJnfEF
         QGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916499; x=1774521299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=;
        b=SVVSzASuiiuEetb6pQ6m8kxeBjqOZLjjiqv9C+uAMs94X4RIimKkAXNMn7+NHFEmvg
         Q7C4nhfvCEFWoDEwk7OpF+PoaHab6hrBFxwc/FDxhJrapLTSfavwqe3PoEqAGGxV6a4R
         dWUGDH1KT4E52cvwf9pGdaELdZFny7tdS1ng5Xbc//j1RjdJ7iUBG0zoYMDYA5bk9yrK
         sW7B4cImXmTkAJ1PzhCyjQOs1qpR4otBAgtkFktTgxWY8tJFbycmnQm4C1RXsZnpN7MK
         J+WMIC6xqc7RqOE8Ul9Zzv3aD99RSSUYFloSCEQz1fxjVMQXVRSrAkFo6kVk9Wnffpgf
         h3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1uX8psLPKGB0jM2PBjLHIUQkhpquWjhGObx/lsaUOBMScnfZSWUI5ZkQw/XqJaIHtiTlj6pc6n6fUYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfSK/X9SilEmMkaoZGFMOeWaeQKqrrF8CFXJ6F1IvFn/fq2V6
	kikd9pRW0hdzVb4pQ5s6Ry0XI2zqdRlmZ2C2RL1RwGb0rSzo0/wkwUEAA7xDQeLcwHqQ+hE96no
	s2lcl5loo5pHofmVBOGsodRiZJwGylptoEZJh3UJIQShX72AFzj7oaLz1oPs009PVmVhmebEOLA
	==
X-Gm-Gg: ATEYQzzrUYqSSQ4zLR+fpb7wHSK17KD6TzDU6kk/F+2trJQaWqzvMpsnr2lyfxQxdrb
	CJDbc28ZH6oO7hM3tlb1hxzRQfEEFFdFr+98PsqU0puVWJNz4ChpEYlUq0fDyg1SZX5nVAoebqO
	HG9KbiU2uLxbJnUAjkC9cH/2wWi1GIDP26/Ut1Hw9OvkCza24UD9Sx9laDypeTkUJSY0HfqBRgg
	jMjvur/RLkFODbyhD7Rp84V/TtTdduMQkdFJ93PQKfR6/VTFnl5Tm0Lacn6t5FuRft7Y9R1aSAf
	G+G9R5WLtlJWXGB4vqTYxMTCMwZR1tqwVcwW5blF7Um9+MC1lBrm+3kQQZ36dE/noK9h+/ecsD9
	qO3z/ch31slWuo/ctvp+ZRZ82WQr1sz84X887yycjRFDcdCfmkkbYwre0X3mT4fXpXh8z0l1kfu
	F+G4A=
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr64099051cf.6.1773916498919;
        Thu, 19 Mar 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr64098751cf.6.1773916498374;
        Thu, 19 Mar 2026 03:34:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1738f1asm402338266b.58.2026.03.19.03.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:34:57 -0700 (PDT)
Message-ID: <466e7543-20d1-4015-89c1-1e2bb0f1cb5e@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:34:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: guptarud@gmail.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
 <20260318-expressatt_camera_flash-v2-3-5c2b9a623dcb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-3-5c2b9a623dcb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NCBTYWx0ZWRfXzFAZAEuuPbQw
 dsklaA65JTKfbiIzOfqIVrCgf+MsrxlfOl5BnvaxUUkopXsl807MvMKkaYUY9hqDUZbStBIMzQ4
 UtoWt3Yh02cB8Pj9RlU9XaDaSp9LKuh++7Rlk9dpZ9UCzV4wDHEy/QEUnWIKs686IRfnesxSQzZ
 y1XRunpBwfwT1wVg+CpNlAtLzWXhBVAtpQDje5vPlSZ7+mB4zLgPX2mFzch3tNblIfAYbfMiHPr
 RX442mi4T7HAT3CFTTm1zJtkPqaLeVNP60gUQebxTSFGU6CjK32iaIdranA2zaSYaqYkPY8q1GL
 S2Aan2QHts0rYIeBhMNqJHSxn9aNvrJVHYdNo1eGQGKDOG6ZfRnh7P3uVjBsyqMppGn3LlIEGcF
 s9WYaEO5N76Kq1KGRofQRoYdjG1VtBr4YwCwq5rOMuDLm4raV2dsDjBmH9duRrXqsGisZmiPX5d
 UUa2dSv+zN6md2lCLZQ==
X-Proofpoint-ORIG-GUID: 1SBNv8QTz0nsGahaqXyY4wuCAzRS2OJN
X-Proofpoint-GUID: 1SBNv8QTz0nsGahaqXyY4wuCAzRS2OJN
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbd153 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=b-NmJ6g92bM9CzcnVPEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190084

On 3/18/26 7:34 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index c4b98af6955d..ad5169a60937 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  
>  #include "qcom-msm8960.dtsi"
> @@ -61,6 +62,32 @@ touchkey_enable: touchkey-enable {
>  		regulator-boot-on;
>  	};
>  
> +	flash_gpio_reg: regulator-flash {

"vreg_flash:"

> +		compatible = "regulator-fixed";
> +		regulator-name = "flash_led_en";

"_en" makes it sound like it's an enable pin - if we don't have a better
idea, perhaps VREG_FLASH_3P3?

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&flash_led_unlock>;
> +		pinctrl-names = "default";
> +	};
> +
> +	camera_flash: led-controller {

Let's drop the label since it's unused

> +		compatible = "richtek,rt8515";
> +		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&flash_gpio_reg>;
> +		richtek,rfs-ohms = <16000>;
> +		pinctrl-0 = <&cam_flash_en>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			flash-max-timeout-us = <250000>;
> +		};
> +	};
> +
>  	i2c-gpio-touchkey {
>  		compatible = "i2c-gpio";
>  		#address-cells = <1>;
> @@ -247,6 +274,13 @@ touchkey_irq_pin: touchkey-irq-state {

This label from the context seems not to be present in -next, FWIW

>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	cam_flash_en: cam-flash-en-state {
> +		pins = "gpio3";

Please keep the pinctrl entries sorted by the GPIO index

Konrad
