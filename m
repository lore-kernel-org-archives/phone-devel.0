Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461B301014
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469152; cv=none; b=BPVZb1RyE9yRfXI6i+DB+r22Ga5tJjtgkuj7ToagnhPZ85v5JxyiZT8Ph9B7+Z1gG/P/8vVSAwbqvdhUAAqSRkAB2cpkRbcGsEyjzKPQOC60urplxEUX/Pb/yOHQfUSwCqivZdAn5CfIJrVGrFuMGC5aprVyUwFGRwIxlcpAHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469152; c=relaxed/simple;
	bh=fvFoo9fhDYfbREAY0AlledD8IPpn47ehSnAuBWaNz8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFJCmxjFFCC20K/hEQSXUEFMxU4YesF80vw336b4Kj6hDkWCZLbSXnRaFGReWmPBDsjKjnXr6c3ar5wZ/bQBRZlTm3ZXqDuwr46G9TQa3Q1CnvPf4Lx5M7mEH9cVNMoymAH8vmX5MA/N6IIHhUWK+C9IW2vxfUnHb6t1mQTbSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmPG92a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrHmB5jM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmPG92a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrHmB5jM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8DqXg2193978
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=; b=DmPG92a62btS/mhL
	leNG15fgB7xCZQOhb3QGnesVslm6NdEKPQz7dWXoroLIaAMibQ3ZhyxFJNQHg569
	g2i9ENSsxDeN+BbwFZu8mJuS+zQahVRfRYNSG5vNUxBa1bs91U2xy/WFIfcmhQaR
	8krIGyG/oufveCbHVD+zcRyUCOyasopXd6ZT1+lTnNUcVrxRhEO6xU6y1hmuNm2V
	okby7n7tMHq/h/Jx1+COXGj6hWitH6HPI7rpp6elGsOBs6JayRcj9ywv7BgtQdaP
	LfDev9SXjTKU7s0LOmg0rdnlIqsuRl4bIZ8h/WZVTBQp3oPmyyaXqMaEbIEpO02r
	q6y/PQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8qyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:32:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882416e9d9fso13477276d6.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 04:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763469149; x=1764073949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
        b=hrHmB5jMpRhtwXJnvxDgHmLMbY18ffhRyCivZb5Hf+FsoceL77cGza6V42NaovN51O
         smkP17UX02o3jdWw4+/HM1Ddm5tpXx1ch+RUceXtYOu+oEJphs3GWnO2IJjyArL1aHOj
         2A8GpTAC3vn7FAtsIddIvwFbPb1W3lcPynhYHbvvsU71HBL/97ALVC/1atzvJl8v0bAk
         s3Y57y/QBW0rWJZou+6oo/OttpIQZuQRM6vUWqFlV7DKzQxCKnMYjgPNAswZf/Vvb3/x
         6wizaMDTLh40qINIK0wwldJDKS6V+G/+PeLR+qW0RWaVhzrVewuNw7O++fsYal61G780
         SIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469149; x=1764073949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3aTjUqAnV3GyFM7M/S6VNGq335rA7IntJp6oTBtDJM=;
        b=EiY8WrEyIVjBKF8P2RSxl9pLkRIwiR+OsGfv8Tdw/aqYdLQ+RbkIeaP8CNqEyzm+uB
         KIDr3OV+GD8y3cbTFgl4cT1Joika9zAhUnwEX+xCNsvgevuoizKXIZbiXi5iav3bKNFS
         lxD2i0UuAzBGeESn6q681wkKBNWVkiOskpecp+6phQQjxWGEFPY/YGEuE4K1xGvzkKnr
         UZ5OlrsoKbMWPX9ArRI84xVntNb7Wzn6jP1m+mitn6MiIG7IJRM/LuNfv+BRwSvyvLE4
         L8Elx4rMyUlukmvlkDaWZH8xmzbvur0RBxWOc1PAaBMPcynt2PgZ9lMr0hjbQ7QN3i4k
         ZNcA==
X-Forwarded-Encrypted: i=1; AJvYcCUkz0RA6qW7Bj65RoHqHljI7Anlc/Qf4WmVUfmu9kiZJeJEYcupJBRUJPFVkVBELjZ8ycIftLQTfc0rJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvROzXycDggFw84JM3fxHJaALaLZ71WDjQL/c5ULBkmYOjXJw
	a7hZfnTHJF1BVr78kHD4eD6mqNcOZF99rYa6OTxPk0KAXTJKQAmQTRdMYr7Exi5yZAH+B3ViZtN
	4cInUcKqa2y6cNP9L1uMIR0sINOVmDGdYxrEixNAiwqPhi72Fw5W2KWUhB3cbBP0/qw==
X-Gm-Gg: ASbGnctoVi1mfqIriqRqoKbxw/QEQ2V3ue4pUQFbUC/ww/Mgo9IVgHI5df2GUnAaGCk
	sM19bruPpJChkaxeNKbqrTYiYyrDjJiTsHFWTU0mPtHj+XKEmcO+MoHvYxkgz0Q9mpePN8IGK9Z
	2DGorYxfiyVLUqiOkEDyyVLsoUm/3E60PoeQBK89ajk0p1cr5ojtzgqZmUjr017m32bdO0v2D0b
	9a8QjOfw1Bpod35FqnLfKPL0hgEs3puZKnOgSGHKDrcQ/8LwuogzC3hF1cw+gGh9xZJ8q3Pbaow
	eaYOhQaWE/Ee+gA9Idz+tdbcVXxqmlMyIZBj+8GW2rydiv0eR1HkKq43XXYVGjspG5Hvp6kZMz+
	VjVzVI6q1K3cL05AVM4F17nJYasSqu1CpotlPk0xtYBV9vniQi2cN/nHES8ZcgDSV824=
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee313fc7f6mr22769501cf.2.1763469148978;
        Tue, 18 Nov 2025 04:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/j9scY6gKmY7H/LVrmAogDQfP058lK6yPhTQca2byI2jY5prL43O5zkzKrB7PPWz4H5MFg==
X-Received: by 2002:ac8:598d:0:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee313fc7f6mr22768981cf.2.1763469148416;
        Tue, 18 Nov 2025 04:32:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm1345195766b.62.2025.11.18.04.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:32:27 -0800 (PST)
Message-ID: <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:32:23 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfX4Ex/FOEalUAF
 tII5sJdDDRj6coz2BrESfAiEPAHMXqhaQ+4tVyU8IlX1Oa/T05fZU6TgghYCm02JI+9UrH5MM5l
 kwxI59cwu3AwkqdkBZIH8cIapD2rSqPuPiYTQbdra4Jt3lGMJ3rQWLlgfaGmxAswgBH20cUyDN6
 FqkkBM75GFqrifNzYhYKEQM1Ryb3FhH+3KHzPyt7hZbHmjS8LwlnjPF1qwIj9epcQPYB3qL5dGm
 UZhMuINXG4x6Td94zBC6xtqPBqFQbVhaMXTISbwTyUoVUa5faYzl3oLzenUhSIYpzmcRHsMxZBF
 LiXHD8uFH+kJXO6Y66rlM/RZMfEHAqKLz6aXt/9Nt7S/AJ07ILGFaftuYJwT5y+On5zqqcZfzKD
 DjVMR4yg0Q3z90sBa04osAPAA7E+CQ==
X-Proofpoint-GUID: doOnbwh6EcY46Gh0Q9knBwGHcVpUxGGW
X-Proofpoint-ORIG-GUID: doOnbwh6EcY46Gh0Q9knBwGHcVpUxGGW
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c675e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=T2UTSHRGlJI1zv4ncCYA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180100

On 11/18/25 12:30 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.

[...]

> +&cont_splash_mem {
> +	reg = <0 0x9d400000 0 0x02400000>;
> +};

You override it to the same value on both devices, keep it in common

> +
> +&framebuffer0 {
> +	width = <1080>;
> +	height = <2160>;
> +	stride = <(1080 * 4)>;
> +	format = "a8r8g8b8";

The format is mandated by the UEFI specification and won't change too

[...]

> +&tlmm {
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";

Pin entries would be best sorted by the GPIO index:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes


> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};

Stray \n above

[...]

> +&adsp_pas {
> +	firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";

Sorry if I asked this before, but are the binaries identical for
both devices?

[...]


> +		vreg_l14a_1p88: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

Is that still the case with your fixes to the panel driver?

[...]

> +
> +		vreg_l28a_3p0: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;

ditto

[...]

> +	regulators-1 {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;

This is a very broad range, what voltage does it need to be?

[...]

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */

stray space before '0'

Konrad
