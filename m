Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439DB15A86D
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240698; cv=none; b=ccpnQ5M/XbJDKYjrtl48qRJTMsrnLba42lLHX/el7H88VNO3u9WlQvmVKBATdRr/ME/IhEVCC6m4qo9k1P5o26UYv3WTxBVrC1uaXdNAt6RGdOKd4+CtbZyUVb4ju+qCxx7aMJTQmC705KwhzHnsz/GGQsLETXoz37rhR1qkYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240698; c=relaxed/simple;
	bh=ad85B4rdRDGUPF7BGuuP0i7dKAVWLVlLV2lYoMUmcy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyHwh+h7YN8D2gHHT1sJa5qWzu6x23AsJvLX8tpH2f8c84g5kkP9QN6KJvG61VkJQhg9OD0pPdxrkk4GjJUwIbI4MY5BnjnBIJhzKQGQK9I1A6bfIZOsekAHJvMI3T7xkXjcPjVHVt3If6GuV252bHNi7ZWdM9bKvnbbOrKHB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnnyZSVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMzUEM98; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnnyZSVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMzUEM98"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fgX32671392
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=; b=HnnyZSVTAJl61FAY
	mg+rL3wOxhzT/vPsNM+k7FZkBq8blMNQShNg9UW+emBiCUQF9wQdzlzjQiQP0nHW
	ZM+v4for7oy6209ibJUVx1GdRhA5k57ETUg5q4rN1GZ+Xhyw0K8bcfQaDzDZuKef
	StG8xY1YpWSpEzDb7ra1jT2LTT+GRk/l1DKYsH58F1XURTn5Q9mcfWUpFFRVKjIP
	6d1xG55xw4QnBfhcIs896o9EeYGAj0CI457Tzm+9NRSQHS4Ah1hAdYm3VqEHa9aI
	dEl707XOi7zQNU++RVGcdHXUy4MfsKlWWh9vltue57nsdSPaJ4JQtLA5Abd/XEYC
	mOGL5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cd7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 11:18:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so142654285a.0
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 03:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240695; x=1771845495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=;
        b=WMzUEM98XHw23yRG1Jcy3nyIzHDsPhg5Y6AKBAF7xfpr0VKW88WfsaLncCqtvWs9q2
         iHKOhCf4ldr124YVEcqTPFEqdaMu+L/eJTSmzjjrPBao7IBwtBbLbPdkAI2c1TbzH4SG
         7EeW5IwFQ7QFqNvUk5rLuk7vd2Nfk1ebvSsNIKaPbi2WEJs7/F2vMn5VjMIrZ9v/runL
         7XRfzya79W5plxQPpOLUav9+Dp+DS2xP6dviY7J9cN9a9q4VDa5KWg33ajYGoRObo+9i
         qf4+5u8+jiBnbhrZDsgEG8lP4vQgpzC/eOZPK/b+ZAhkqIWvOHWsMOL8Q+exId99pCRG
         Vfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240695; x=1771845495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hNIzX5BNkAETmCDKWT6OzqUx76/RGNDM+ucplj4ws=;
        b=rrdMwj7JKuTGn+35z3uD2fl4CIHkWfj07Jn4+7xfbKJ/Ue4+gxfnHEvGCFtXZtIo6c
         yQHSJbyetXudXOh8tfq4w3/GySY2QY7NxY4OlgE/2eCsfazmHWttlAUne/xjBbU4MCsy
         oCBS9Q81Kk2viTNk6GIro6mfMSKzWegScmKsQxeeOsIJrgxH+BbjbIBQ02yaKVceh4tM
         lLLnRh44zRveWh3+mqHBiSwBhNk/7cJFEJZRf3WJ2STU7Cq4Mx8rTL6R+qXr49feUPIc
         iIVR1Sun2tiLx9pSs7ZZl8z7e1DVifYNVNG42eZMZTY8BwXiZfNHkpLOwFFkwJViTCEf
         K9jA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ooJ0VnStFVHVIpDUKILQtQRUa5CVNnGcxWjoII08eyOo77lom0Avog5HL8kwWHmB0Tt61jetkPLG6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwH4+/YpbJE+g7crHpWhMDyWLe+ixKOmP50IxtOXcsxdSGgqW
	11PrcDAZ0jmALT4c/kxzR++IfffBRNGz3EMEF9Gi9GiDgil09vUcgK+HMb8HkvYEmdJBjbuYpkO
	NcQbRq/yEg30qTBzQeQht/hIXLzsgFwwocua0/+XSUyyHF9ODLe2f1jGSxZYHQVOZCw==
X-Gm-Gg: AZuq6aJGS1Iwj4aOXoOvkUO6Ju2v5iBeDC+X13rxeKhfvUMdz7qcekItJWlRO6tr8j8
	FS/9kp2jWKJbd/W+n7hwOc/0dapl5Dn2wgd5Fmhy+QTMjwyHiBxw0SPLgqInMtlkgvnednvxU6d
	W9mjl/PaIvSCge08s99ul3L0g5a3uj+6fu5HXIyq47XF76BXHpXJOM6uZsrn0cfVrMLrxqHQyMd
	fBAwKJbA3GP490R2BAiS/DkeQ+u9LTQfmLYDUQQVuifM2Y55sDUVxfS/rJdrnFcpzEXA7nyP35f
	Eycv/dBDc7ss7X4NsxR03Hmji6GpmeXDoX6nBch9WIred+tyLKRrGp5hd7jVrTkVZMHmfYXXy33
	NhoPQJ7P07XafXlLQ4Fo4ex5PsL2J2yRjR1sbQ7Ah7Lm/DURe5Ei7knkFL2wlxP+q8seN9cjxSC
	p/bys=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1016713685a.4.1771240695609;
        Mon, 16 Feb 2026 03:18:15 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1016709285a.4.1771240695011;
        Mon, 16 Feb 2026 03:18:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691c48sm248837566b.59.2026.02.16.03.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:18:14 -0800 (PST)
Message-ID: <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:18:12 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial
 devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qYhdu_IZuMMi_-fjkcPtxIcsheZsTCk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfX5PqKKDu9MIAj
 hvKsaFLpA9IZzWySKiMX4F9s4VwmZVzwk5vkC1KVm9YUMMWJCsBVyay5QZOLM8VHcBv5ByP22nT
 J//Nb5CHLuDrf0X/g3cfZ/o5Cp9QnZz4pQhi0Djoz++SOYrU3fW25S9cL8Po2wvVSvm1bSWkOyL
 8A4zoSNie97saBtbm1skLpvL26vGg7UdYngc+MMuAerQ4JvohJcQkBmX4DRkY6u3V2lI9rGy+B0
 SR1YkDrNkGCVypu8DcV1eag1YpyJuYbQmAcuwpq2pGOffa6k+JF4hf7d1B9unGU86qt1PAn+RQZ
 EWopESaa1umOgm1jJbN19vls9UTVhFnsa76M6BhYl7zsX5S1oClUsVt/AKoIO1sYZFZ2qpZ5Lfp
 jMp/AyO3uk6vEmetsdLEx0ay6XNT3XHDgD/2y2oQAvNOTfz99+cumb9SzcxBr1LMH9HUjhOHk1C
 6WMjHqzVLlAHCJjw9rg==
X-Proofpoint-ORIG-GUID: qYhdu_IZuMMi_-fjkcPtxIcsheZsTCk7
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=6992fcf8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=L2tLbZxQM9psbuxyGx8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160095

On 2/15/26 9:02 PM, Paul Adam via B4 Relay wrote:
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

Hello, just a couple comments below

[...]

> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +	backlight: backlight {

Please add a \n above to separate these blocks

> +		compatible = "pwm-backlight";
> +		pwms = <&pm8916_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&button_backlight_default>;
> +		pinctrl-1 = <&button_backlight_off>;
> +		pinctrl-names = "default", "off";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Buttons";

I think the GPIO prefix is unnecesary here and below
> +
> +		button-volume-up {
> +			label = "Volume up";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_hall_sensor_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Hall Effect Sensor";

[...]

> +	proximity@48 {
> +		// downstream devicetree only specifies "stk,stk3x1x"
> +		compatible = "sensortek,stk3310";

Looks like the driver has a number of CHIP_IDs - you can be sure which chip
specifically this is by printing it out

[...]

> +// make sure gcc is probed with display disabled.
> +&gcc {
> +	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
> +};

Do things break if you remove this line?

> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mpss_mem {
> +	reg = <0x0 0x86800000 0x0 0x5600000>;
> +};
> +
> +&pm8916_l6 {
> +	regulator-always-on;

Is there a reason for this?

[...]

> +&sound {
> +	audio-routing =
> +		"AMIC1", "MIC BIAS Internal1",

Please unbreak this line after '='

Konrad
