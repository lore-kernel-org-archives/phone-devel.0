Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AE37AA61
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981486; cv=none; b=OsExiUUYjbNVJFb/cY2k8gZ+in5mgrN0Ao38Srbv5DQ+H+gzDwNsvCUQ2zm+rlt9dNzWnomM/bc7Z3zId7svF4ThPwou2+C6DdPmUVrW04i+M+PbRBHKnN01vXNeYvsxzO/1cM0uJHB+3/izdImETIecCj1UsM4AVgJ2awgKJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981486; c=relaxed/simple;
	bh=4Y0QZZf7hx7OxnfngFgck/ptzeCaLWIRizIPuutL2gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL/vCEQi4PakkuJ1rk2ArSyZIgwW3b4Zi7KbYwjtZn5dA+vFx3A2D8R3fENwTL6G8AzDzp6/GRmOh+P15yXjoDsf8zpj+C9rzJVNhhQiPF8diGSufLH05krAiF3jMYMgL1tj5Hu1jmaVF9MK4qEjBW24s5CUHt7NSZ7oZXl6PZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY1Ui2sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YX0UiVTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY1Ui2sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YX0UiVTx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VHWxIM3103850
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CWZbyw95JjqJqWLA6GpFRlU
	U3PYOcL3cCFiiHuW7b4=; b=TY1Ui2salHX+314tX7JZYQH1a9tRAIaDQf0Uedvf
	ccm4DkCqI4CCZyydNqbnVYJKkcc/N93VbofDKGbi5wOH980qSQfV9pgjjMZWplo6
	/lZH0iVFL3Ovw2dOaj/DjwJhD7OZL5MP3wLcXyANt+e/oMba15jtHYAq+PEz+OdP
	DkVtL2RvnNayfv7ewPBpZ/NhkmEX0v42ZjCHx73yMQeNRZvQwSbzhDHeTOir1kxS
	9iDqgoCdZyvFTudQbLUYDL4rxjzxrCiW0uG6/auzveiBqmEmTdS0YRNCRfRd2KEP
	OPUnbgJtcMq/2NCew1NPV9ijncUsNwCXQ1u0UhG04M4JEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js209hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so198584781cf.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774981482; x=1775586282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=YX0UiVTx2cNxZqn1tCLjO3f2XATgCH7GDfzTJsXl/WzBREcFkiOXoyKK1BVwBSK1vi
         cjkYXFXOOd1C1fzeYHGk8oeJ7Zqj7DM2ri7wJnbglCGn/7cNi2aqdQa0RWIYM3gBwH8l
         JDnPxmwennkt6Wg0TIJEcOWEke6iK++ZA5+iteAopd7Oq+aiDJf9uzgMTGFts8qN/OZY
         NNERUsSfwxbVizDJb/7wB5KXLx2u7IR621TqPCHPKrO49J0pTXE4pb3epsHkwYkNQshR
         lnNPmyYmw9oV8zQqblGFT0NKca9Jy2qW9pbKANgiqB4ymg/HXdlBeiMYDIs2NJKayxMA
         dGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981482; x=1775586282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=IvrrNf9kXx6DshMBzLANn0oAdT1hSGLq6EQ3mwKBeSny6YQe7QpaMY1tF3uNCB5x/G
         zNhhSfxwxsPIrutOfrp/k3p0O+lZwD2nAfzi4TlLF/+GvnM5Zb7xjqddoR1p5qNpkdmm
         KxTC9MvxMf8QNWRPJbpJC7Ruw/wYKqFk4qeEQMIYbvQtm99RcLMAe38nNdp3VP2KshVz
         ScZlNLSfYeDV4dwl4O9I+f1wPxY8rVRDgRPIGZTyipzeIKjWlu51y2dYGW8qEMWGf6yc
         r51fqSQHVPpOVNN4Htixpq2DDzdISA2EzMVNVEBLWnReEEi3q3JWW28QjHQwyXbSH/O3
         iCJg==
X-Forwarded-Encrypted: i=1; AJvYcCUKsLAz+6+X+UOiJYfcc/tL3mBIs+TyIgtw6I3NPJ6EqqZrnCr9KXtCyyBULIO3FO2yVRV+2v9uNzU8Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZK5PLCB2zm83XM2Zf5HYoovbVvac0yd1F3zliebk7bjkRDjy
	0dy+yQ/6Ck6M/Bwo8Scyle/X+24Lqp6qSpTgCgwJ+dqVAs2J3YxOUq4NLbmfWpsLDic/ebRswjs
	toDNkz0Br70J3WUdhhxyemkBBe2CqWgUjMuEO/Kqifl+VLJeHWHkH+wMNtylWf5R03A==
X-Gm-Gg: ATEYQzwhNIx4Nj7Vmle27QPytiGgAAai3UiOunJgwMmmwXgHTOegqQSXqf+deuCJcKo
	DLLJnk3gbsd8OH05W0bdDFRUDOiDtacQusd7D+IErhGELJ/3p+9h4Aunnory5/x7+FUG7yYcFjv
	0ElpYt6R7HOWa9Zg7cAmvUzIW6UfKVC8kW5ZQ+jXCZCdRXLQJvOv18GCfyUf4fitUe+f932oYVn
	HRqcHCd0vnb9oIojOAMo1ybuNX6Wfk3Bzs6CGOjeXlNv00eYwV4Y3XYqJOB8MKTFJJgWOuj4Phn
	o/OVZWAUYW1yAAfJeEFdi1qDhGQmntErgM7aR1UltRHRfBMNlRKz4MjKIz/L8BJ0ejUp1QeIrem
	AIwZGU57rqZ32gmRWiK6RTNLOVBB9laoIGEKTEy1jabgTuL/Td+iYgIF2SkoSMFduHxFkXtA0pj
	E+ZzRAGGPTIH8zTRKrRuBnK7kx+w+wu4yN6ec=
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8613071cf.39.1774981482032;
        Tue, 31 Mar 2026 11:24:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8612431cf.39.1774981481522;
        Tue, 31 Mar 2026 11:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838daa4bsm25924981fa.32.2026.03.31.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:24:40 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Message-ID: <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
X-Proofpoint-ORIG-GUID: 50XAoI-fDvirBqa9V5SEsRB0PfxVgmuw
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cc116b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OQN141zOAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=34O5YtzfCyVlAbwKECEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3NiBTYWx0ZWRfXwapsLFtBGl9Y
 cc9Q004pJDYqZ3oldkQEpJCCAHbw/vERNMQ52J3kjr5dAMM09pLPnrfK+h1SMilCtd2w2XtyVxu
 CyxQ48qjel2antAyNm3L5OMo6gkwCairnq8/oAPLAb2IIzHq0jNG0ei9EduZAThATqIEWLkKarV
 vIv2tiliqDEx7cR4h72DDlkHkwyLYicuxIQ6FnfxC4+8VUMVhs3J6oR0H22t9Guis2WFK/kY6ah
 ymszPjHLG9wkd5gout4DfAqUwb8f+Ov0BTGfPvVpP4JXSd87B++Zx26VtVgKpHhkD+DujJUWaav
 AQRa9W/b4eY0a/cAQTHRAkW4r0N2ih4emRpq0yctsPEcEbSYV2pwSX1dEV4FmvRyHkO6x8uD+k/
 AA8Sdf8aiwOh2zhThDTUokxXfg5ABCWGK7eDuDJU/KVuU9beoiop6YqNjssyawW6LHtiQ9lK+eT
 n03RS/21HKX3qI8yu1g==
X-Proofpoint-GUID: 50XAoI-fDvirBqa9V5SEsRB0PfxVgmuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310176

On Tue, Mar 31, 2026 at 10:08:09AM -0700, Rudraksha Gupta via B4 Relay wrote:
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
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index c4b98af6955d..35514fd53e3d 100644
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
> +	vreg_flash: regulator-flash {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_FLASH_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&flash_led_unlock>;
> +		pinctrl-names = "default";
> +	};
> +
> +	led-controller {

It looks like the nodes are not sorted. Could you please make sure that
they are sorted alphanumerically (if there is no node address)?

> +		compatible = "richtek,rt8515";
> +		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vreg_flash>;
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
> @@ -172,6 +199,13 @@ touchscreen@4a {
>  };
>  
>  &tlmm {
> +	cam_flash_en: cam-flash-en-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +	};
> +
>  	spi1_default: spi1-default-state {
>  		mosi-pins {
>  			pins = "gpio6";
> @@ -572,3 +606,12 @@ magnetometer@2e {
>  		/* TODO: Figure out Mount Matrix */
>  	};
>  };
> +
> +&pm8921_mpps {
> +	flash_led_unlock: flash-led-unlock-state {
> +		pins = "mpp4";
> +		function = "digital";
> +		output-low;
> +		power-source = <PM8921_GPIO_S4>;
> +	};
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
