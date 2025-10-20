Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35EF2EBB8A
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955399; cv=none; b=SB77VecqwUqMc7rjXbGWIcLoT5ZbZZQVsp4SgxyS3/iAS/t//JGgr8hIrLx1T0lFMA5cywF+ZNDcwcdDZcu82AAmv13AQPnsXYNX6mBewlSrE34H77fi9i8pmB83lEnzvrR57RaW6MmFON2PepI0zwOjuimeeciB0qDJPqFk5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955399; c=relaxed/simple;
	bh=mdpf1Oy2ydcWXpHDNlNXheRGi6wp8wV18k/D4DoO4KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1M9JUAjOgB1l3h4JmU4PjpOMQeJNx3mA+9xEwnfLF0y7MUUpcj29zwcUAcUUFYkSaihtqRtIJDETAN4qR0l/YBgM8GfmFhgy0U0R1F31gBjB+OVsBDn7jWoss0iXEb7lM23ubWl0zmm19rYQN/zk5+VPIS1398Py/pMaJmrX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jrb4O64c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jrb4O64c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JKK1Yf014493
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7GiakkB7w+XPBZzGT+5+Y1LK2gVzD7OqWO9cWs4zks=; b=Jrb4O64cZk/y8r1s
	bWyhZfULLMdw5Z9HLly+yFfaQ87+YeOkBvk3+CCRzbqg8oE6EbnggIq5kcPp6f2t
	lL6b/DkvT8SS0bFfOcnIqtRm+RAJZqLZ2BwdulCVr4ZVJ/bINKJtwsfXbxePSyTH
	r0saGmA+H9JLKuybf/I+lCvAiOstOIzs0Jad8iosDZDcTxtRs7vmJt46DPp5oEUU
	bk3yzjOIwnXcN88ifd3bx9CorjR9X26ZZneBy0MyKVcVf5eoBczoZue3+kGC14J6
	cxssThapAVbxbHQTA01y2IJD0o7Oaxk21Xi4mcLzFBssdFmBUIGSj474kg2TQe3x
	r40VwQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hvg9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 10:16:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87bbee3b92cso16117726d6.1
        for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 03:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955396; x=1761560196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7GiakkB7w+XPBZzGT+5+Y1LK2gVzD7OqWO9cWs4zks=;
        b=aV2cQ+7F2A2j7YgQn0SV2N0HdbxBrmxZVkx7SIEd6DJ/MJPDwvzWIoVHo5XYDElHEF
         UbLYBZYxprG8loAUMxl4dtPmmBK5AxBDgl9NqhEDHFS1pbWxWxDDaQMr7fs7FMqtMZp0
         ctPnYQJvLAZb+0IytPzZ4q7tz/Co8fu0qmknVjLrrxBmKNyt/2jFTuClsSqWdN5EISmO
         h40j7ESxEyh4QVxWrGdIu+FEYAU1Ikac755jyWfWNGM5nTPxP6gR30QbIVh41sZSYK9/
         ZoAnfhAMQp2q5rWOv5uy+v4bxFzZ5AB3tG9tzfvNLb8jJdq1lT70391Jua4qSiPWlcoU
         gnqg==
X-Forwarded-Encrypted: i=1; AJvYcCUUUk/8a/0G7LjMShSo4THEkmqmE0WVepQ/RBYsGDqEq24b2Cwen0Agn/nYjvR6vMt4zoYggDtEcN1YWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS07kyPUYwuvc8Hj6H8XyUcL5Ezzxrha65Ou0ijNlUQPgAjvzl
	RYmL3N1/U6U+uLQq85L+Dhvt45CGxae5Wg/+wlKB0Anj3gnZNMJxKaWTzERszq3CZ9xSOPV3u7e
	Z+8lwTPwDHmEp1YX+/nketc9I4PErNn2UGpvy5tkawPbmvWDITL8NYQ36lDo2jzQV1w==
X-Gm-Gg: ASbGncudXQ9YQ9Tvqps5BM3NDMYmqyYM4THOB8PFuK5trqZdmvJdTeKPI+snL0fHkK0
	Z0ZnsDguLOcWPXIa52AX/QRlxhlVGhZruX9FgGIu20gH2E6e5cmnV0ozNSOB8yWdHp8ClHD/Gi4
	EtJYbdWP7pgyOFuER+v6AfPX8vNpPPfoD983LqZTltEzW5N6oVCx6DBJYcl7e4qW3K1o3pH/JOI
	3xlAxgviynH0uY7ZgeHbhkPV9LtMrMhoTWe4dQaT3upWvf86pOO5FiaIoQD3fDU4Ol14vQpNiQZ
	GhvUSOMOHzvvxByepar/f7BBGWB/NLYmoTxl6Pw3pcgMWGkG8XQbstoNvyaIX9BJGs35MltrxY9
	AyI89Mz0KtFkABSJzlniLN2YCg3eu6X5PkZb4Aprk3pmJXe2+gCLOCR5w
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr24082431cf.5.1760955395815;
        Mon, 20 Oct 2025 03:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS3mAY5bftHTOOPGyd0UuN914pq2mMKSAA/PCsiHWYAXoa3iQZKyBuxtJgaJglQpUr7gc+jw==
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr24082251cf.5.1760955395353;
        Mon, 20 Oct 2025 03:16:35 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da3412sm750511666b.3.2025.10.20.03.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:16:34 -0700 (PDT)
Message-ID: <c754eaa1-555b-4ec7-8539-b98a037bc2c0@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 12:16:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Move address and
 size cells upwards
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX0Pq2s8hMy7sL
 WJ/9Z0kEkUJdJ/zzdF3Eju7Ww0etWD8e5qHqH+pR6gROr9DlgczVI2ZEqRpF98AQ0Md9wWKVeRb
 YT4sQMNmkv+cURmuTzqN2jtg7b89bFAWdljv3Zg7m/K2Dm44oBYqoVm9d6BLMdiQhyDCB7ujupW
 /kcD9Q87Aml/vph7f104tDb6PLfNhPyqcmPcJkwRLLg2qSUqj3XiGEqSd5+GC4uTQQKAIIUAqoW
 tcekuYQ2LYKRIpEmQtSd7PtBBammlj2mdEXiLZWM8Jk145kmCkxly9ffCoa9kA+hkN/YxkUScvw
 Y1jn75rGdcR2OHPy6i+YwZbJUMRJxDwwI6YDmm83ZABkAkPsIRXPwa8GTzXlfEJPWB6rMRywHA9
 qP2jMFqYohjrwc6+ZCFGTgdc5QvcIw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f60c04 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=_PUjjehnJBWPTTrYcrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: BPdwQPuvxwp2sE6SAC7qP64Y18pXagWO
X-Proofpoint-ORIG-GUID: BPdwQPuvxwp2sE6SAC7qP64Y18pXagWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/20/25 9:55 AM, Guido Günther wrote:
> They're used in the parent to describe the panel's reg property.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 89260fce6513..44e7b5015d26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -472,6 +472,9 @@ &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
> +	#address-cells = <1>;
> +	#size-cells = <0>;

These are already defined in sdm845. you can simply delete the lines
below

Konrad

> +
>  	panel@0 {
>  		compatible = "visionox,rm69299-shift";
>  		status = "okay";
> @@ -479,9 +482,6 @@ panel@0 {
>  		vdda-supply = <&vreg_l14a_1p88>;
>  		vdd3p3-supply = <&vreg_l28a_3p0>;
>  
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>  
>  		pinctrl-names = "default", "sleep";
> 
> ---
> base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
> change-id: 20251019-shift6mq-dt-e4b9e7dc7169
> 
> Best regards,
