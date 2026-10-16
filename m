Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DF31326A
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138988; cv=none; b=IfJPRqscTJuLV7UsEL8Vi2sNOy/mLSXMK0ZXgDag5COwRDhatai67H+A2M4mewGlUfTHzfAPFCo8G9WZUv1hA25BCtpjXtBr02JLFHzJN5N+n395TXFV/1npGMZHNT3UOS8VBbswUW9Ubcam63FAham68RyF+SkB++vsbEEd7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138988; c=relaxed/simple;
	bh=81xJNwsV2hThx94m0mUACRa9V2TnijGNC/Fo/63ejY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHX+s1ttCgVq+1X3MWjTT8m4uGxahKgFr8Zw+hN+Y29wrJYEnPj43YI8Fn9Ftj2STvG6vdFrNY/Dp/+bkCOrABc7f8TC1dzZZD06XrDU/1Kb/aPtZkd3hnFRYbfuZSgqTJjPSLC17XaGsvoCioRFNuP3aY0uDBU/SX3lklDKyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3AX/bVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROtgt2KW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3AX/bVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROtgt2KW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2fq5B406042
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=; b=m3AX/bVuAi1WvgIB
	8oRWa4ZheHc1vlCx2zY3iiHEucBt3ot+ztEW1Lzx4P2U99okNXjE53Q+RuBPYv0a
	QW5OySUKcrVDLO9cz1l8zE9aB6HOCPWs+5ZZz8q7kZ1tVbdhivDRRzMnlRD8Gu9O
	l/L26lzH0J1qtSMW2SyE0UZXpiqn1qSv46ZArA+kgbyucMtvKnxq9UJCqNkCNgD5
	fXaZCHdh4R0/Kc/K94XNhVnAFqBikOJP552KYkU36SEJMYtk1RZ62wuMl7sbNMQP
	m/usO1R5WJftUFK+lbqP6gzjioxcrGY6amRnl9z3BIRkHXx0IS5NA7oTSZXzGZqg
	gFCqfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2sr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338a4075d3so19557831cf.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138985; x=1792743785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=ROtgt2KWb4A8fK/FiXohCbOgMA/FjsJ3kNyuNU5P7wCPXpkaFMw2wYBDkaemRvFRHO
         yNNlyCpXNHoDL7xBftf0UwsJB2D80MGaWaSOYLzSRJXsxv/Dc2y1LpB3BOuXnIB+lqcX
         esE0Y2X1mvsQtqfX26/8Vorg/uqmhyib93ytC2EsBDwp3TVZoPwTQWGRceMWyKlE/uYi
         ZlL4gX2zyhKRiDLvd+QSvQwMhiGZVPyU3eiiQnHBUcoRojAu8kwnC6UgKTGN+Ga9TSCp
         4QbrCFB5bsQjpJr0QBCN4GByATSAvi2QF3p5yfOGE7HIg2JCI2pv4KbZBgKpL0AzySuS
         F3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138985; x=1792743785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zywhglPEDHWFnoWPY8Q8bVI8q6iKlypiLOq3HGmVQxE=;
        b=C4Mi7FxfQdwws/H/JUuIk49TwYwC127qoCO7Tr8S+ydqalp/q0HdV1h+Ggqclb1bee
         SimW6n+xgU2YAG9dhH9ws7Cfe8ZLg/tfaOlPUL87zgIHwGmot5A+352tHEbkIuAwcso7
         eMEm6wuOF5W/hWN8yPXK/Rr9oyQa2q7xPUpVgKPA2cEOexKkNy/VFAVqmDeKS7JeYKYj
         xWe/z/Nj/mO988XxITV8ducqDYlHL68NaDjGeBMLYSSL7+k26efpY1Ee8Yqg28ngwosV
         nDzwQyNMeamxXQmN2sJxrsVsU+KCW07J0ORf0aFRpTjnfkIPV2O0rvG4tIWZ2vR9Tw7r
         amSA==
X-Forwarded-Encrypted: i=1; AKwUvBzuMbr2BXwQh7aWkc9vrSmfuQUfWbL4hPwjY1vltLjrBD7ExN+loOoMV+6Z+CKEFAMePY0sb3ARy+7ZwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL682mCYrWk7QjygUngWR9Isf0sz49w5ocxv/IxILPVd/Y16SI5
	9ZxNhzQSVkktVC9mF3reE7QnrptpOTC7qSOC1W1SqtGnXsQjtp9001QZtDSI1tVxZ4iX4ebyzcb
	3BqO5Mo5VXNzp63UWNCTCuddTER6P3AbDK8PS9NXhIO1WC+B9EyKA7jxScu1+Y1eq9Q==
X-Gm-Gg: AYBFou1nqfOTUQYL2cBotE9l5wZLGXJE7Snoy/0vEz9JBSg3nBXwxpjPzCQK8tOWYBh
	stV+i40j1MzuSOxlwNLZ/zApLKFF65ItR0nVBvo1PlbqN0/KugRtlRZV5O23K7eTpNu6DKgGC8D
	KM+GB1plu9E7s/jiEmbjwCDk7YVFzk/k7f5Xt0/ez/q9xoT8Wr8FDYt3u4R2sT0ZB7AMkKsMWK8
	P3JI4c0ZWaWdPyjbMzXCl0qZOBFIKIXAraf2B+kvkALNyyV136n+srcUdFciS1lZIXtJqGXX6IY
	q4q79mklZLQA2RRouQZEYUmusKlfHoy1vCUYXD2/4cZU7TcWedf5wHEVB4xIDQQE+jCn7zFNGon
	mkfAhrlOMKeK7dkSy4nREMA==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623431cf.3.1792138985312;
        Fri, 16 Oct 2026 01:23:05 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr411623101cf.3.1792138984859;
        Fri, 16 Oct 2026 01:23:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm48509566b.62.2026.10.16.01.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:23:03 -0700 (PDT)
Message-ID: <ecaf38b5-a04f-4fab-a0d6-4f1d633264c0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:23:01 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX4Xyo0OHO/Eaw
 R37ZymNg9BbNEPm3Gfr3AQqz0DdZmxvG0QBE4uow/KhA6DAdShVMRPygN6Sx9BnnX2AmFYdrJ73
 GYYq7FfLBC5kSHNOLsaajNSs6HU4PHA=
X-Proofpoint-ORIG-GUID: WRD-AfpoaNCgZ5_aq7WSgNiLAjomE8t9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfXxIDfx9pntnJb
 zz30GFGM6L20wtx1Fxn+oCZu3h7xGfGL6MxXaZD8PMGGtYVss6dCNOMWI+Dg1TDDh7XiOH9OUnI
 /viSfL+GPGr3Iq+IkhNUKfSMiQJvvTVM7CXPd8kxAp6e3AOLFD8L1WIRbqOS+QIbWGX29Mynj/S
 QiAu7Bfh70Z83apA/1W7QfF7FO3luZCzbxTj76rSwodI/FpOVOaBSFxjiAs78OClZLdu72y4fwc
 eICoNHO0fgtGiHXxWFpd1GyIqhAzPLvfmbD+rsLMqFpEK0Vflj4uzfrT9MEGlfG/3yXRqQp3+c1
 QWurQufVM+VY4b1KfsCmPbAW3sbZ1RzWcbC3HZ93qjZLk9tkvfDu84QVgVF9AbFDSFd/Wo3OQMC
 sNYJczQTkov7TXEBmsFACTXj6NRd4YK765m5eXjHZJLlbOJd8HQmtNW5erHa6uIlVy+XWgtSY9g
 XrTxXylExQwdKpTIbJw==
X-Proofpoint-GUID: WRD-AfpoaNCgZ5_aq7WSgNiLAjomE8t9
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1deea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OQN141zOAAAA:20 a=WE8o4AYwAAAA:8 a=pGLkceISAAAA:8 a=RgHCbSjZinxpUVw5y3cA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                 |   1 +
>  arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 129 ++++++++++++++++++++++

Better. Please split off the dt-bindings changes to a separate patch,
and put it first in the series.

[...]


> +&framebuffer {
> +	width = <1080>;
> +	height = <2400>;
> +	stride = <(1080 * 4)>;

Does the resolution differ between the two devices?

> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

Is it not present on the other one?



> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
> +
> +		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
> +		vdd-l3-l4-supply = <&vreg_bob>;
> +		vdd-l5-supply = <&vreg_bob>;
> +		vdd-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>, <&pm8008_interrupt>;

nit:

property-n
property-names

in this order, file-wide, please

[...]

> +&i2c16 {
> +	status = "okay";
> +
> +	fuel-gauge@55 {
> +		compatible = "ti,bq28z610";
> +		reg = <0x55>;
> +		monitored-battery = <&battery>;
> +	};

Likewise, is this absent on the other phone?

> +};
> +
> +&tlmm {
> +	pm8008_default: pm8008-default-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		bias-pull-up;
> +		output-high;

Drop the output-high, the driver will set it for you

Konrad
