Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02011205E25
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837659; cv=none; b=WoC2+7sbNuX8MbqbhesESlwhE4hiD1d0O1cJF/fJxnKqtx6FNKr8qjZm66htZMxNks1vRMoJJal1EDM3EIX84qCXQ4LSjhrNWU4qABd3mZ5zajvnz0KcltuFGROLTvwmlaCe3SfwJO8Y16dU4uXrfzGUE2H0FLOAraDZDTPXfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837659; c=relaxed/simple;
	bh=zA1BeXhQdtW1QR+mRUEiee3Jg5g6Fdj482GgldGzhbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2fRuZ+V+QBkA29swtrDfyo2KqdcAkKgL4BFzxQFsmMnSQqcbogaWj+Mrxit0bfSbkesDIUsWtC6THAVEP18k2OXT3zVN5vPl4P4LZP4aDSwMrwc5o+6Qf9fL2PPSF2lDtNcOZeUU4dg11njxkF0xLxh5m7wrOmUMjGtFfvsnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULa9g2EQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRWr4vET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULa9g2EQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRWr4vET"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrAfX2121043
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=; b=ULa9g2EQeFWEYBhS
	LvgvZ5Q1W9W4H2e0C+i0HMkCpw1/bUv4rImhqALlqrkYjDQEfWvV6DsDlqTDsq/O
	rIPUpHVaYvF53iT3tX84r2K1f4DcuSB/44EBQQenQ5NzRp/4cDPgmE1G1+o2zg9Q
	9gqI6IQCxeg5JuD2T5GyHGqYizRfJMlSFpfGCdzBVSQ8Vy3c/Rzhw8LsbpQK6zFK
	oRAyoZUHIr8KK1wSoq8QXMU+1btDgfW6I+ektIyoL2j+b55tc4lyZJvua8uuBiyk
	8HX1s/RyY8BFN1AOZJIxYKlGI1NVBrtlKeIOSCWFgqXoSilkVYYIZKgV62Kauxyz
	nufbxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 09:07:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so456560385a.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837656; x=1772442456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=;
        b=ZRWr4vETU5Lkle3ZWgb4EVQxPysSohnTmWnmD/f2gfb62c3FBitypUoUGb95QkFjtG
         VOHA0cADpz4zrK/0EjcezccyjACnhI4jeQb90bZzWuIpJe5qGaVxGFmMakJPxr/EdaaT
         6Q5Zhcpza6IRPgvezLSnMixqA1Q8tWGgtOjeLzO0DlzKRR0jkZC/XJfSvmWJ2asQMK1x
         pnbYaSbUbTUcQwa4v7eTAoetsVJgcXbXRybxr97Ab0bH2nLh/PnSRjpPYl7t3GDrc5Ek
         0/gjC9tB9w4vAGHmyIRdOLcvoB0xPvQHXFEFldJj05SarsOVoflG1KNdlQ3kHwIR+3Nv
         ovzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837656; x=1772442456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrr1pmmPZi1Uq+KJFYbh2hBj9DnfGjKAVs869o7hzPs=;
        b=S0yr9wYvalNjIhvqUpFdB67/bWJ1McSJlELQi/mg0q5hCNd4fsQSt56GJShm5HCL/1
         uZTlBSqSNDckZW9LT+vTykLxIRcXng2VAb13js1Z/vdq26KYAzrMkraZclgk1oRm1oT6
         cLXQmXGo7yf0nTO3yPEs0/5NG5Ib0Vl7eDN943tToFCckR576BET1+/PT04dcKcSJqeJ
         a5Z6f6n/IOSlcYgCw3VuLos2CP2MbFSdarP9hDZC3IpUYpj/HtEYiB7CklPcidMBuIq2
         9RMinxm6z1y4irnASlLrohIERqN/yIVU4fuVM6EYV4ctwZT/CL43sV8SSMZ9TMemk8f3
         nAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwsf2fmSh031OyWKaAQCQP5bSW/gV/Vk3XMALVXSGGUL9SU4FbsYu3uX/tY53hxvH1rdRClD+yiCSQxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPpwCqE6JYFJUDgJ8l8oLmOl2uaeqHlGHXyYmTVKbiZZAla9j
	Gqd4tZ7WH6a/bxV7ZSlrVqm4crbG2kFHjJjanxso4zeFcUC0KQG2nEpf+weB5209FTqI4CyRFZO
	uDwW2A1sX9/I9Cb8hwUq4G+dCR5sTxB1OyZrhWpFq2XikuB/8efyaMtpk+Sx0nZo/mg==
X-Gm-Gg: AZuq6aJ0PtTCXzgPl4GDqX16PSG3VB3H2LujpYTJNx6ycFwEQ1KSAkkJfLyIslvL9pA
	lVxVYyKDILBqcb0tMEYI4ODPnE9WLqqtSnx2gkZbNoClzG51YC9YBz/DXa65IC0ME5YtejsINIE
	xPiHmn+fZuVPs0zLBnWSRCLQ5tbjlsOAjci5c4a89gbP538fO/WoCx3/rp/pi4FNs4TO4PQF/3l
	noP1AJNtNYVMQpOsNXn8b9aZnUshv1MbkC/qHYS+a/j0V8jNleq9e3yDyO3xVJbkuXPetZ2TyLO
	ZGbkuJF0i76CI5SklOWh296CYvode+36en9kcH1mjN+Pp+buqhaNYt69hCdnXT+p1Xd0b1mTAs8
	4nYAExSWEBRY2eb4+E3VRskN6P6kJYewrwNvGIwrisX1nuqJyPn/hViksysD0XzZd3whkSOjY5F
	XLm0w=
X-Received: by 2002:a05:620a:170c:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb8ca924f3mr753421585a.7.1771837656292;
        Mon, 23 Feb 2026 01:07:36 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb8ca924f3mr753419385a.7.1771837655742;
        Mon, 23 Feb 2026 01:07:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f18f7asm303345766b.66.2026.02.23.01.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:07:35 -0800 (PST)
Message-ID: <5d3efb0d-96a7-4ce7-9622-88152715656f@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:07:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c18d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OB9DN5_9geIfRXgfTJoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OO534yPkYo9lRU0t7WiUqvse3HY6G80E
X-Proofpoint-ORIG-GUID: OO534yPkYo9lRU0t7WiUqvse3HY6G80E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX5SYKh0UL1v46
 8iJ+pPtQpdHJKlcgd2hJfkYN7G3CgoIDE1jPIIF17GIQc8/i7LThIMklhsMGO0Aa/0iuHh21MX9
 H8B6QCyEh1Rh494LEVKP9/phDw6Tltu29uLoe5TC/BbNyN0QH0ezHAVrkC0ISPFxl9jLSpAsnqc
 yU9axsrR6Q+SWEpJ2BICXD8eKSkWHdf13omnABTrP+OC4vI8ZY52RHrE4NfXgPtDuA12Ir4Tl1R
 W6cm9z58h4kXDIW6oACm8WEiD2ha2tyr4cCWANrKCu98gEME9Aa058SF/0yCTU+e4N8vZQrSoHc
 jCmofMJXGpkyJuNtO4UCE7OqBzE6rAVbUIY44hCkMoBW7ZsinxNSw6ZTqr5qqYxfsAvMbtdR+4d
 gX143QN1TeMED1mplWgCOKbUnjLbVirgPkmF2wuE4S+nQ8wxQT9RBhbhucoUPM+CY/FJKdafizW
 pwWK2gq2wfiUoZqqT4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

On 2/21/26 9:55 PM, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8916_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&button_backlight_default>;
> +		pinctrl-1 = <&button_backlight_off>;
> +		pinctrl-names = "default", "off";

"off" seems unused, this should be "suspend", however the difference
between the two states is already handled by the enable-gpio in the
driver, so you can omit the second state

[...]

> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&keys_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Buttons";

Sorry for not being clear, I was okay with the gpio- prefix in the node
name, but I intended to ask to remove it from the label.. 

> +
> +		button-volume-up {
> +			label = "Volume up";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	hall-sensor {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};

[...]

> +&pm8916_pwm {
> +	pinctrl-0 = <&pwm_out>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&pm8916_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

Please add a \n before status in nodes where there's more than just
that property

[...]

> +&tlmm {
> +	button_backlight_default: button-backlight-default-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	button_backlight_off: button-backlight-off-state {
> +	     pins = "gpio119";
> +	     function = "gpio";
> +	     drive-strength = <2>;
> +	     bias-disable;
> +	     output-low;
> +	};

This can now be removed (it had incorrect indent anyway)

Konrad
