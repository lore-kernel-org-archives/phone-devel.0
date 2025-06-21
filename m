Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63101DFE20
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501025; cv=none; b=PVqGX/dgIWXk3BcbIO3VAAsyahwEmI3LTUY6yO8nQUkjuxnCPzzMDa7ZAQsivTo8OXN+wn2UsZ0RphPJOP/fn+XP9FZCzlB7WR9989MlrPpo0IbM7wM97eM1vSv8GJolbS2wDU6B5ON82eQTzf3Y72FXzmEOgLloWHBmQn2T9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501025; c=relaxed/simple;
	bh=vPnLzFJwFahHeUricYEurdfVj2ke+giIWHeToRhHl8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YURrGTlObuRvwP25J0R96JrEzsZYtlgL3eOjFfJyj2s5AcPI07m2JXEznfaU3LMz6F2BFwVAFyp+79YNiF5j1v1pt2AXtMlddqHv4TW+0ZMrVGnQb+l1b4mj3BI+Nz1sh/nN1Du0ac0kdtM5uVOo/X4b8XiGn+B4AIN6v07AX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1XOAxxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1XOAxxl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L4KPwt019219
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=; b=S1XOAxxlrWQmLOBg
	W2q+JtbyfgaShZZzyxuoiy0TirvqNYUrMCSOTmTFq9Fd6+pghIYwyh641rzedcV4
	3J2J3JvEXiaNBORk0x5KhSFxPt0SK+0vHFf4/Nkk/5er1teynZTiyIPfegPLU9e4
	Ks2QuSRZpuKLoDjKO6mQ5O3zRo+CvIjByiInsh3aeJ1576qGzc0z+Gu34rSTuhao
	fjsOyb37udhbvmVEEt3YA9L9GWV95FmChH4wA6XWZcgTPz7ipI5Ni992g1afeebv
	L/ZxI2bxM9Kdc+4ZI9rNWwOparLexDLFM45AFTM43wCC/AQkeyiEw1RXc1a/kVAJ
	YKEoog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dm2mghbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8aa327049so3511866d6.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501022; x=1751105822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=;
        b=R4qnfIjtsvOW/y7ieni+z5nLu5wrjjrB9wIymr6zjk5wupvMLinpiRbKLMdKLs6TXV
         /19iRV+CG9zNh+5hyduS1aXDXwz3V9LMdwzrKcxU1S+xCkXB0kUW7xSMRwAJ5AYvVcHm
         RzufxBmQ2OULJLRX7SVJ/hK9MDspNtzDmz5SRQFkjsm3HHrsqWiT1wqNG+VXx9O7x7e+
         jO8OdG3KbkGZMQC0IAm6c8DjSXHVUAq9A/8ROr8RfThbZHqZ/tSxSykRYfo5jAACtVal
         rUW3LJ2LVoDklYyPcpWgOb2zH1HJFQkEcoV/jenASNot3ocTH77l3dQJXUL+2plf0YAP
         V0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2m6lHC4Qzjd6nuTidrrtVFhjdA+2wRSJqlZmCgRcart9IMCdt8IrxK/fp92d+r4vXxtC4V8YoswX/bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbl1JnlelZceYaQHoi0xn2jcnx8ias2k1Msrl/jAfW7u8Cz7Sg
	ikKuzXqLU4qG29GV6a73AnHMWfzZ14IgV/6TmWzTJYx3B9MOu2KuFbTJpsgQn6+/Ngz9Qn3YumS
	OJqLocFQHIkVK8UnCAlgt2vbAcoNDW8obv/wc5tq3/l3rnErhx/+ilwMlA3wMuqVgzw==
X-Gm-Gg: ASbGncvVw/PbITiJfHou5yA+csEcQG1F43rdEpRVznVzHwboHgrpteezyWJyci3YKMe
	DuhmGDPmg4CJBrzKiQQK3s8DbtmxeluOmotklxbYV58RSj7JCPTK/ZtY/8HFmTKQYaClTAj3Qd0
	7AtNcd2odxTiRDd93VAcglM1cbUn7D1fKKqxx4ZdJaa7mCRtmQgH66911JsyKLdhTaENCZyYSW6
	ZT7C0ambNs9UjVSArebVWfUZWwmCWdQmxVsp5n0ZyBlVYXVN/JkADkhJMrjOfsLsxN4U+1IgwH5
	qXEDARv9YSKMO9PN3GeVmntU/LHvIO2Rz0NeoK7YRZWSvA0VFq1vhwUZ9wKG59Ci9TESAMWc7iI
	pqf8=
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467836d6.4.1750501021965;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeGPqQjG6xCSUjFvNLWJwXCnIR+1W/DIRu1mmTytQ+klkZrMyqX8o5SSfXwinRdq+7CTGxPg==
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467716d6.4.1750501021575;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e8082fsm337209266b.8.2025.06.21.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Message-ID: <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:16:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LOxC6XL4pkv75fg03P8Sa3mqImVTI67n
X-Proofpoint-ORIG-GUID: LOxC6XL4pkv75fg03P8Sa3mqImVTI67n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX3a/IUqlublgf
 LI8viOPS2l3LNWwCRvIdAx+k4RQzRXXbZ0j7nw7hpNtlOPLMWkCao445t7isAUdD9k9d06CWJG5
 /f72WKXbfJZ42LaiGDkPa9lkUde93cSQXIZ7rsWpBFSuiPFx9fcsH/jXtCkhu5OpuemhLazO3Yg
 dh6zw33mAVWCh62PcUdN+NxaajDbN0Su+tMJiVUOfLa7HOU4rQR8OSLKwPPN3tVD+qSTyO2ieuv
 +hHuudRtsmtysOPTscuWvhZpWasxHW8ilFZexmO0INCE9mudgAzqRX/c80pZk+LxIe9OhGuLEMi
 C4F0JlOkuL94wsJ+s4Keq6PinXm+78NYboW4NLdTP/I+RGDPBR96Uh+5Y3hy/vrEij/PJjb1EnP
 kGVF0H+QBOQpPzlzJF9BNjkvc268SknTw3Th0KmaBJ88zLrBU78ZS80DckKDTB2yAuL5B/Zx
X-Authority-Analysis: v=2.4 cv=Q93S452a c=1 sm=1 tr=0 ts=6856869e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=oi8dwGYPpvFf8akzgh4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=676 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/20/25 11:51 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_key_default>;

property-n
property-names

please

[...]

> +	reserved-memory {
> +		qseecom@0 {
> +			reg = <0x00 0x84a00000 0x00 0x1900000>;

'0x0'

[...]

> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8953_l8>;
> +	vqmmc-supply = <&pm8953_l5>;

you should add regulator-allow-set-load to these vregs

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>,

These GPIOs correspond to I2C/SPI_1

<135 4>;

And these correspond to I2C/SPI_7

Without much more knowledge, I would guesstimate one of them is
for a fingerprint reader and the other for NFC eSE

Konrad
