Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180035CBAE
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833674; cv=none; b=DSe1nzRALA7Gfeckf5k7I6jaPzm1a1rtLdgVKsj/I23SPLrcOdU8+9SRVZVpSNK5OfsbbzauA7uzLki/P9mldYIHbiZyLhTVVPoYAq/HT2dSMzm2+Jm5C4ytPWTRLqu0cUYqew4LOeQtQQyjC88G38dbX8sZPPVOA7cZjkYMjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833674; c=relaxed/simple;
	bh=yg6SXcloJGmJLSUFypYVPsO2vcnz5ICLgzuvBEPL1A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q29poLRQNa3RrWiOL2+TqG6Dq80k3Djd3PLYTOepj3rzjD0lA+rnElJXfK8fQZVkIQpTI8pwKY1/M+EgpVNoYFOwoHfkcNvtYcnwjUXGMmXeYlSEOkbqk0b5EG4ThFXloKJQhxZcQqe/oZBbGS7JAYsV0o75AaGY6bW/xIQwnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/9J/JWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lig5wHdD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/9J/JWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lig5wHdD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J911UR903163
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 14:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=; b=F/9J/JWqO7Dnci5Z
	hiccikZ44wG4TVIPeeAEzIRpadHsn/zH9/0nu+73eQzYDWQoYY6K01MbEz0aQfmc
	u6c5OLntOqpxIqPTN65i91um3XO0qdAqCZ0X7UIagzyeAMuXj5BFaavcjN0Srdm6
	sdNLy5X+VX6m6d0Wkqnh283smKFslLKiB2U92elN4HOhgJnwD7OkcgH4bVwOiCnt
	Hxt7B0rrJiUZlv2UbnJUkTGGjzfwrbJbibhglqNnHvDJ8ydSDKstg9HOORLymWiJ
	x4yZBLDiEBrY+R5e+InWD43W4dTrjV0C/CEP2pxlRSpsDWrz4SMp2Ezy/Ust+OU6
	5EV/tg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yt5cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 14:41:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c532029e50so154306285a.1
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768833669; x=1769438469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=;
        b=Lig5wHdDpCVrtxoFsblq/Pu+4zfV1iMTgvndlCQKYJt+UN7fodEf88yehmNHfF4XL5
         g4j40fXW8iw9BqQR3fNnJPFVr9mDAX6qSoYR1F+OBAHkpw+3TDmAvkAsVBEdlD5BZKFb
         JwVkP81NWZr8Lvb0rhrW9FzhNDyN9xJuq5bhU1mUuBQQSihnC4RgHXVTo6nMK7NcAyim
         K6AVr0Z9+xOM5etp3E5SshKym71TY0o8wsMxy5XN7uaa8opViXTp7bRyrKrQBNUCRjxM
         ZKTy94QW33n5CWQawjo24l/1+X19tFMOFu1rFyTHe+rbqMKBqVjizMAsprRkqIZbZ0jV
         oVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833669; x=1769438469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aXbYMXdhaJIz9VzAOKmHA9NGQuHXXe77OASnsSmBNI=;
        b=R8bSLAxPuJzsnDsvxrkzmohyrDOu1BnqZgcOxZl73+GtpfSJgh1Tgg2Z5i7DopAoh6
         CkX5pVI8MOZ7Sjxb+tNMzKZuvAZQF7srnJJutPO0QjxJNu/sVjNO7farSunYTPsJzyGo
         dPztZJiS3lLvB7pkvc1Ysp6BUoCAuVVELCyY24TLBTGQ4MyJXCeSIYi/r0lXLHUYG0D7
         xg2JhA328qek8WSmBUItYuNSgOQUhvbyO2sI1nwO6IqN//a9kd6H+XdI+OaRrsi7R3ne
         XZY2aCWSnZ9NWN9UTateIILwoe+Ida1R7Oy9GfXP2L+bnDQX1CM4ByKKz2zYoBqXu55r
         5RjA==
X-Forwarded-Encrypted: i=1; AJvYcCUHJSlkcR/leEnSPyigoSIYOWTGcOjLObCy/uy/pmky/dYg7XZLDCviA2nWuOk5qPZxWC4TG+yCqc+G6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YybRNWO/zZtp8/C+5iCcHIdNeFmNqbkFFAg6pZ3P/JWRkWuipcG
	UViFbOKfymictR4tRMogtuca+dpU3ZQpaV+o+UWnaO3rqz6C4x/oZxb8FOWPiuVDRdf5GQ03bC2
	dU0CcYpU2dMBdyrWCCfQxpPSm09Ot9zSAvZKoj3GNRA69k3rHn1Fv409tuhY7etYV0Q==
X-Gm-Gg: AY/fxX5iUbSylWbNCAboWBj8vXhC4p1pTzUZUId41MflUJf1e86evdnj9DZESK77Xkz
	7wrTP2pi/bJCZL0yw0mSYO7WIceE4F2Q1e79WP8AXkOrxfLvsyae7UL+IKfa32a3zPtKxEyrjPz
	deZZhGGcyBzejIIhdNYCrYZSi6k59y3PeY2Q30HbRfw/JdU5zzR3ztBY/jiifDLGiNcrBubsVbv
	tHY15D9dHnGGL+6t/oyCVn+BUtU2EMJdJKojzOXHziVu7DR3sTbQAY81fwEF799qU1hLzSAZaNX
	eoxuhud/Nnj1nJIh5VG9t+6BfwlZr2FnY/t2nZtSjgfEb9nvHiAFjq8okOwDpbZZE72u+KqAqS1
	cOPv5Vi4cLU3ol0JYFK1rBBYR1S1IyaVjY8M/YiMoit+Ldt0ftgSzT9gXLTGoUa9h5kU=
X-Received: by 2002:a05:620a:2a05:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6a67bc788mr1133450285a.9.1768833669372;
        Mon, 19 Jan 2026 06:41:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6a67bc788mr1133447285a.9.1768833668948;
        Mon, 19 Jan 2026 06:41:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c7bsm1178573966b.20.2026.01.19.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:41:08 -0800 (PST)
Message-ID: <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:41:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e4286 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=p04JXNiKSxiIgApV0UoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMyBTYWx0ZWRfX5XmgoFlWJXj8
 0H4tewuS866BtSmdmLRpZ1Ix/fcY2Rvtjw8IrZNg9PGpXSb5dr+qW2BlrWqrZXTsYpQWtdDtRUC
 o+IfgDwvVIeA/rSCoxC0RjfBHe13YUzBGVWbiw218CPzLR8t/5HM4/RvqNIewV7Lr42sasCKWRp
 022ig0kkFheg6xx9JpoYbD7XofiBIkW2MsFjfUNJ/d++W64B/1w/ggSf6/Ha4XkW6Tcra9uMali
 c2UQt38kZF5OWAUdDDk5r5nnyyMAbM9gyFl3WZSAuIA9LDz0gxmdEcN6r27E0MdmkdydGI+a/+i
 ZmZeviJgbKjJ7sFRAdUHHb00Wulj0rmd03Ldgrf/XD0P8EEdwUnGOaTyCnQHAzqt27iu8J+mBiv
 aMqn/tqw2gUxlXrffrryWpLADq//TEg8BE7CR91Ml1fW50u89nALg1XjIUNqpbSKmzhbiyuJuVF
 GfNhdQpGZHgCoeQIGaQ==
X-Proofpoint-ORIG-GUID: oyaydCnv3GsBeK2RPoMTbhJyZShqKi0c
X-Proofpoint-GUID: oyaydCnv3GsBeK2RPoMTbhJyZShqKi0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190123

On 1/16/26 3:22 PM, Luca Weiss wrote:
> Add a node for the Hall Effect sensor, used to detect whether the Flip
> Cover is closed or not.
> 
> The sensor is powered through vreg_l10b, so let's put a
> regulator-always-on on that to make sure the sensor gets power.

Is there anything else on L10B? Can we turn it off if the hall sensor
is e.g. user-disabled?

Konrad

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 7629ceddde2a..98b3fc654206 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -32,6 +32,16 @@ gpio-keys {
>  		pinctrl-0 = <&volume_up_default>;
>  		pinctrl-names = "default";
>  
> +		/* Powered by the always-on vreg_l10b */
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
>  		key-volume-up {
>  			label = "Volume Up";
>  			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/* Hall sensor VDD */
> +			regulator-always-on;
>  		};
>  
>  		vreg_l11b: ldo11 {
> 
> ---
> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
> 
> Best regards,
