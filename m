Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1E235F61C
	for <phone-devel@vger.kernel.org>; Mon,  2 Mar 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449628; cv=none; b=L5jeD4ou5yKvjpkiTDNp8VzsEvdVXSNFzVoJfeVQAM/i1Ut52QC3vPBp27iJeuxW88w0OrHd6S7fsKV1JHATEvARAF4TN63Prx4OW+3qPxMQ0ThRcy1jgGyl5Kbzav9r+CDYTCcJydFAKHUjgLjF2rDJqgel7H2k3y4/PjM4KFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449628; c=relaxed/simple;
	bh=BBuFilbkJGsN6xMCsRGB9mMzj5tWOIs/AWZNl6o5ujM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQ2rwO5wIAcbNinGoj/vr1Vr5KjwVHmFqpXleP5Tvr67qV/GUfMcH8vJfn1Y8au5veR0ComO4fmOwQW59xl9IJ52vNZh5Oe6qonhy8DlsjrupcScM2iU2TAYGL327NrxXcHfl1tsBcN6hWZAcoz5ywrNm2vAexPC86UJWeFRxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfEe3/Q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdD86HH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfEe3/Q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdD86HH2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227JGMQ2358125
	for <phone-devel@vger.kernel.org>; Mon, 2 Mar 2026 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=; b=OfEe3/Q3k25ZMdzD
	M+qtpADaKdb1/139SeHxGM7YsjbNJd0aa7ZKuuMNt9JoowXlp2icMAKzde3NiXXG
	nqDg3bXfHo7Qzu2CHmKP5dhd0zqToN1aBK0o83dmGahBQ4uU05/QD7crkFmakKyb
	kvS0K+MvV268dzEr38QXpneaMGR7mcvaIkKPQwupy9K/YMK0wvtEmhqd8ITbI1ew
	3n1UmQz4jSNihqjgXTWUwiMsnIJPGVZnNQ79nlBFQv1fpWTFMEFJswH7SBy2UR0+
	YklhYy0BDeA4pPEGXoVZTwxja+Ggz7JOmI9RtMcNmtoVrvlbwyF9B2QxWXneOHrf
	T2vOIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau3ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 11:07:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a01982dc5so2030036d6.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449621; x=1773054421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=jdD86HH2nE79P8bTOhVQJvKfPFJpI3/mXbwIBw9N2vxZwydoeMRzOpzPifVFR+vYeo
         v3n840OPBe1oJZnNR2AmWRCx4rcQYh2ujOjy5GosnivX9tAKXlejltHQ76F6H/3xWUqt
         1911PJ4WTgY8uRynNvt4LhM8YFfC7WBN1O1l2n1onawuKRLbQ0isJQ6LSpUgcrrVUabJ
         cDhyOuHyjsVRtLuMDUrTbovZKNtRhvgNjEwuu0j2LH8s5jI2PFh1TfLP04/3IKyRcqeh
         TAUOobKbHf1JzZmQLg3iZPdWbEyHO9YzR4U1eKRFxKIoXe6QXXCs2GsZQPpMlwb7qc9/
         qBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449621; x=1773054421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=N0BV9O+o5MKgRd37E5Ct4VZhuVsXLbvYQ3p0g8lzLIC7uFgDoNkIIkgJFOxO40/gbw
         Ygrw/YY6bq3g1eFxayx2hoS6FHwIAzJ9aI2nTTuSdWA5wZit/OZmcTNTyUcAUulba08A
         722aS/GUlDK4/wuz0peJ/ub8bmWODNvSNsoTjgvIVVLtwgLU0TcUqIM9jXhA0PqHF51j
         q8eqJ3H4C2jEpwS1G0Bk3JPEzUaE0azd3xQPFQKwwfjRstsAuOFjHdYWgVypCkuLsjhy
         lHJEqTP1Nif5a0gUqVriSslye9hwXwH5GgzsO+9JjKOj5Y/NzLKPefvawOEmlMbaIHN8
         5BCA==
X-Forwarded-Encrypted: i=1; AJvYcCX2q2PSFyq/4kWPAjPa8JMM6aPOcbORBiAYJHIgTOuDpOkyiOfrnhg6oIO1yq1s1zZFNaK3aWiMt76syQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcloffCXO0pBJVQilhetE1vH9Hlay5unDFsVGA4heRBC7KtqG9
	di+0hFtr5ei+mH0ukkvZ/JShzFApRd0WoSYShF3MTW57hRI7Z74w6KoCvgXkqZvZSal3ICLlvZ3
	9GstHfMzzmXyA8XJTbYh/m0IipVe0cB51MX+r65wKfepom0nsYx4aShuUkaN1vAcHXw==
X-Gm-Gg: ATEYQzxDHwHn6vMTUlXmndyXttQISBAzwh4+jqccg6Cpi018UcKr3QVgKh9DMiirEhr
	d2XJ3veZnXHvVDJ9m4zbuW2CRHfxV+3ko0TUSuqX16s2Tddu6TS187DlcP9677p0uRnbVKr4C2A
	CHyaJ8U+CkpSTR/yRylrOjXG7vNZz+jgE5PS87I9Ahgr/zDIvVh5ImB3aq+k6S5+am8o6FFbvV4
	oBhCtLcHF0yxMIEVAMJItEeZbpO4HzhmmT1hoNTa0nXiFpfpAODsBVLnd1QSL1ZC1ceqz3L+0Tb
	MB/d0HMX/ovYo59oUeD8kh3aCrNVWS7NNPnYr9VeBcX8e9FYgM5n1ELwhBRIjLIg6CwZJLYDg4s
	lq+QQmU/ByvuPuGIc2hVx5J5aku6aVVJu6SXNIyZ0R2nlGz7L2mLzzeXSvDn1pRal/frX88efZz
	eD7T0=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105602785a.9.1772449621116;
        Mon, 02 Mar 2026 03:07:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105599485a.9.1772449620636;
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm3331067a12.22.2026.03.02.03.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Message-ID: <b747b545-12c7-4e33-95ae-ffa114fa13ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:06:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MiBTYWx0ZWRfX2yly+VnCMGwo
 Y8HLVUfdg0mry4Odpws9aA5NpucdUhNOlYw/6JTkAxADcANzkzbwnkigcy4iyXH9EJnQnE9Jy85
 WlyShZW5/tQe80zRo1jKC1YZ75c4gD+EbbpSAQcNuxSGIJ9Iwq4rOVp0pUC4R/UqTu58SKSF9Sr
 PDF9gbv22VtWkdTwyaTODq9Hp/RCkviXQrh+0JTYTvXba6c7uXRQyPffDaVQEDsYZqM9Xq2Cbmm
 wFnIXdahn2tMDAW36eRVWmPXvEBQzMniWIR5hqS/2L9jHxShzwngETuFvSCcwCZaXCZOF7/kxZ8
 sex9DdDNdD1Y09wRSSogvt0EaTSz5D+hR8u+f5XzrMps0gFLtL8X2jVMCU1wNTlsW4jbGo458AQ
 F1SPjT82OsO6qsZnBJX7BlT9L6Oe5XZGQimUHzAmaEo0w7mKkt/Uu0GtvJyNHPfbmJ9NT34qoDO
 XA6qDi+3bK3pn8MwDUA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a56f55 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 82oj4lJCfulag1L41ldy6Ebe9p0Igb_E
X-Proofpoint-GUID: 82oj4lJCfulag1L41ldy6Ebe9p0Igb_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020092

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..2501104b06e1b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,26 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;

This is an anti-pattern - you can translate the GPIO handle to an
IRQ handle, but unless the hardware is spectacularly odd, an interrupt
reference is usually what you're after

> +		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l19a_3p3>;
> +
> +		touchscreen-size-x = <1079>;
> +		touchscreen-size-y = <2159>;

Are you sure about these off-by-ones?

FWIW

input/touchscreen.c:

touchscreen_get_prop_u32(dev, "touchscreen-size-x",
                         input_abs_get_max(input,
                                           axis_x) + 1,

				            notice ^

Konrad
