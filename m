Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A726A091
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307417; cv=none; b=qhuJuu8L7+fcCT3FUxITNLQawDpH1rArmr67pb8efRYsBh5/uv3a0UcQM0mBw3f5CcRXVzk6wysKoEyzdA49W/WV9DxWHX3kpVjZXmWosvYYSXzYxWevPnk28o6M9UC9Ve2Ls9eSg3O48fO2LMnoDraQ5cMDLQSzklwaDhUyWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307417; c=relaxed/simple;
	bh=UDw9fFof8/RcJ1kPbVY+sQqoq6I7U5xpbsVTYPMeEQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GygOvtbRW21C3yPkSHmvjmcfC07zmQXeSJcFCc/qg1ZRCZT3ChF9y/HrmAji7+ErV98BxSUhR/7mofvATsM32+UhKTjNPWT4uTSO15f8TLB/5FHBlv2HbyQ7y/1Ke5ZGlTeSYPGprNrWotqCq/qoGPYExVMXSYRHYnAHfw5pzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5HW5zA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5HW5zA0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UM1Jis027458
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X6tqOnkZCqc9sQ2fgf+wm6GtNt0ebr+SQzxsxlSdHc=; b=k5HW5zA0ar0TIz7i
	XbxPZoCMmoZHXcXb/R7VIRbM/3YJQPqLm9jkIJCw+aJzX9XT5I2vLeDVvBdUWPiI
	uKjz8sQqo8qs1VW6e1MwbVkNhx9Qrm99z1PY0BQUO+bWMjgtKd52L8xVCssqEEY0
	rn30RiZiDx0zMFicf+4Ooj9HZ4x56hmvSG9tDj2Rf7mX6Hvxmudyt9m9H8CmWx+t
	eTNu6emQfnv9XJ3vHeQQAM88S/VEpdbBqEXVKfpH8rsJh//JQWzZ40OfrAS09+uf
	K1MqU8XME0eldagxHn43cuc18nCzEjHXRg4jrJJLDd8kzr9Tlt2X7WwheOz+CEUg
	31tSsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kv1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:30:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8247c6738edso9506186d6.0
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307407; x=1759912207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X6tqOnkZCqc9sQ2fgf+wm6GtNt0ebr+SQzxsxlSdHc=;
        b=Gc7GGy6BCxO/Q5DIpbQFb1o8QUA2jhNdxWqRphFnI/wFiftK+oBosgs+maaifxLkRh
         pDFMJWsDMV6Z+HLe6X0bhHUNYvxSD8DnbYA7NszgCyTV4VCieDgy2+xoQeFVWqgeKsJT
         3Fcx7u6T7/QNEMJKv4Og7v1x3escz7wEEbhDUAjaF0KOCsm0pBvEWkYNJY/lNkWn+Q9I
         JNllM0QwTNIQRwH7lOQHdJn53XW7cubGYkClM6UPJe9RXttsedAG5yjpaZ6l1jWMuSrS
         enJ3/P/eMrQV3k7eaoU59nrLVvSiC8C+GsXkxGIfhVIanQ72A3fhqO5SOmP3vQp+SCzZ
         2oEw==
X-Forwarded-Encrypted: i=1; AJvYcCU74M+OcXLpm+PKfHjKdoOGpMUcIzbxNf4TuCbbV5CkQMRUilyIqd4OF9AipDHpkdye1VtnkI5e8SxtCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywaVENnwFAo0jls5XTL6tRMgw8jCGBuGfHDcSSsIxPkcNXQSEH
	9ZB5th7xWq10rLQR5gcao77/bKzt7NJ1gfWjppvRwKa0bI9o67I5fXpZncgElMjByTa7Cv6WQkB
	CAQL5cOhrYOXmhGeDKfKTHU77we0bFr5up1VVpE6IYDMYDBfjMbAW5q+D84oUai7fcA==
X-Gm-Gg: ASbGncsyzQNrPmSZxdYyRPjvGP2MU8vfpqFqOW/eqbmtRdLgqjKlw2RpOipUoqN1PyO
	tMH/RWDcydRqOJ2DVynyhrLTJvIRYO3Bx9DOfewIzfIUFArQwcc/qCS8kEFi3OoitytKP/Xs23/
	xMUTAE18EWj2cJvUSFoaIf5ZxUMwt7z7Tf+uo1srhDYBfJQFGrWWkgc87gMiMWLFS4ApI8QGoNO
	M5aDLRYdV3JvxHPmHTIlOijYNweB6iifT9+f+dVonctOQ99cTw2EVYoqBbWHge+/FewnF2KpIif
	4L/SM4qjGUva+UaeEqRgw0bB1P7MfLYpGh8Ca8ZO/l1Qq/JKcGMjFoWlRIx/GvgZo3NkA3jwpRk
	yVImQNHo6yaP/9uhTcbBOxVp1dm4=
X-Received: by 2002:a05:6214:f6a:b0:806:d113:3f87 with SMTP id 6a1803df08f44-873abb0222emr22127646d6.8.1759307406540;
        Wed, 01 Oct 2025 01:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC8KNsHxDoPXMUkX/fvgyVmTEiJDo+/TI3l8mHrrYISyzN5SbngHkWWEk4JHQhpymJZjMEYg==
X-Received: by 2002:a05:6214:f6a:b0:806:d113:3f87 with SMTP id 6a1803df08f44-873abb0222emr22127286d6.8.1759307405922;
        Wed, 01 Oct 2025 01:30:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629cb2sm11171448a12.11.2025.10.01.01.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:05 -0700 (PDT)
Message-ID: <3483a7ba-7248-4358-b65f-356743648c92@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:30:02 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dce696 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=v7dz08i6nHTDO6dUxXgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX/V9j1Fyt7dMu
 nAkNpR9r+dSZWljTM82z+x035UGEsLHV93iKMIyUagAcrRL1P1h71OEq8v8adtxgC3YC9eXBJNs
 YfxfGnjJbUfh3l1xS5THc+t56+St5HAKuMCR1xZb+lOsqqjR03nZkSWRcn2yjuFOGP8FNdCrLt4
 Wikd2QV5UrRwk9qZ2AuXAnd0l7lh+d47vOiqLm9s+wghrdPAhLk/4VSWYdd2kZ83wU2cIBhwtK8
 oyuO3pAUURC99yB5WQJKBRMWFTs0Vcd5Nhmz/LYqhgp4j7wzTog+A7b5/leMzgGutb4x20qQDAB
 HYP8XG/v6gdhHtqhNBkrQ6Sw5sZsmt/qXkbKgHnlvh2Jpbz5iOZEKi9j37W31KNu1I1zQzMZc0J
 jir30PPX6DxGURh4CoPRyj568OwgxQ==
X-Proofpoint-ORIG-GUID: qTHtv1l9jbsJ8D0f2hZfRTK1UN7EUSng
X-Proofpoint-GUID: qTHtv1l9jbsJ8D0f2hZfRTK1UN7EUSng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Describe the flash LED on this phone.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index ce794ca724db6deb39f7fae47912c3fefe974573..36cc67469615974c193ea3a9db1b2362869d56bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -619,6 +619,19 @@ volume_down_default: volume-down-default-state {
>  	};
>  };
>  
> +&pm8350c_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>, <2>;
> +		led-max-microamp = <500000>;
> +		flash-max-microamp = <1500000>;
> +		flash-max-timeout-us = <1280000>;
> +	};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
