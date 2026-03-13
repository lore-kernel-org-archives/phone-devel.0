Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEE364044
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403597; cv=none; b=CgBpY0w/vK+Ne/pCi1uHb3i6N0yEEP9npZQ4WdbPkI8oXb1XeOj/103qUQSXkSoKiqkRuqWqOA1lqav+EkpEphon0778kusMmIvrU8X8J7Ep9jxAsOIeAlVVn4W+14OJaFcA6p8Cgmwu0tHPHbPCyeKxZoZKw6Nw4H0F5Q4vJKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403597; c=relaxed/simple;
	bh=23loiSD4kWy17dc1xnugREgMOncTqNm+7+iUXu5avAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZitNvxRv7zexFPcuS3rhSLQw2/euVJCUaZ1vWEi/ae/oVSaVbM2Gyv+bZ3oN4Nzh4260e+yMiuiQKVM8NwjhsoZADGfU+K+r3RNzpGCqU+wzGTpm0VXc6iLdpJCnZ4wberJStGilSlf4CWwg09LMRzUBls4DlQ8fiySKJPx9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vxc9qeBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yyz5WAJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vxc9qeBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yyz5WAJd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA85tr1749468
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=; b=Vxc9qeBL//V13qZ4
	OscVAsLZcGyooEJpvN2Yk65B4lU/i2u89IY2TsI4vkdWBDDdkd+f2UsUPPIB6YrS
	ZNDXyyHQ0r6pJCEtYWbX6dVfc6zV1O7SPe1ZEuBdMR3Gpzi5IC1L/RwwdjekVplu
	NalS7C78oJI9UNo0oHMUrlV0Kq0LVbt+4JWkN2Lezgf3Pi9Pa0Y3SfSXS+84JLok
	VJilf7ZcVTjMuBoEQ3puQaQmXk3rEpALiGZ47/HBUtkHvaVMW0lJf6T5l+rcoX0d
	0kaW19TnA8C80yeB82ElXC5K076C6f+Eo/KUimZfAwE7MytJc7fnVeip8mYTQyGh
	cQFlOA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:06:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so361699137.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403595; x=1774008395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=;
        b=Yyz5WAJd2ooB+hic7HPLWKkXUyicIOZzehvmGaN12t6f5Anay6vJ6r09Uu8UO+FcQs
         HC1xQ+MaaH9xAjF/ZHGt0Ii0WKpWG5ErzbzpltDjCuFHpZcJIgtQpahrQmrH/Q+SJxtf
         CLMBMhflVfsuB0FUm9cMptTr4y3aycP/4/5AV0OLbEh+EyNAYzq/zewoPZn9mw8rpHQS
         FaZmYu9AJN1nQykcTfzFKE+fP32GmTh6zQgX0KCr1A3vaavqJ+sxNSH2884tdfl8M1iw
         JIOKrJ2YBQjP/TyFrYidjIGdwYZXWMPotQgwbUnY8mEAP7rQ0ndDuSXYUrYZLtwow41j
         lDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403595; x=1774008395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mwQEs5gWC7r2dTr7np9eDA3UalN1FsvttnNPRSI0KI=;
        b=sc63jGhzMa7DSEUnqiiZaJ8VdQ4seviX160sDvYOrUwM6aPerfQScl7usmuVmm3BxG
         C4VhYV5oDaU1xMULsFBTkhJEY8Pck9UECK3PORcHna7Rm4pKOoyYeWpTRcRLIHoruwE4
         AAj+H+7EkrSdniRtnomWMDhw350h9WHIGH/EzGvF6HNRX+KUtmOXgQ+lUKb8EPC0VQaS
         Oae/SntvZ71E8u+BY69c7hr65j54cemW+7h2KSQPYzBvbvIZWjsSZm4CYt+vgjZxeO3V
         JnnrAZiCjaDshyKA2BS9ysa933VqojXStWJJ3IfX/0agULZkv5uGC1EOOBhy1sOQeB5y
         fqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ceiLvj0UfhbaAMQM0Adyi8taedW/rXZZN0i3b505KGW0I6i3/fuKk7KW9hl/iNmVuQYU1RdGRTfmQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzImcdgKYzpGkIkgCulFgdkK15Ulev+1wIN/Svm9Mk10WNq3na
	aKHPFI/YY0XeTCH7d9w7RI4rboW2Qw2MjQutqhle4AfAMbbrr3q8U9+7DWIynXZm7lh6wYWdQrj
	Zs4N/ORNWTu7dCyZkcmSsS5PHaWH52lymjIvP3OVcLZe96xJqid+Z+Oix/Q2CGKTJsQ==
X-Gm-Gg: ATEYQzybA9C2VgqADRexuclUK53EKkUrsttAGMGwFaytPVxloBU0z1lYdmMVZHeerjP
	SrK3t+V7Gjxp3kN0QE2OU/6l847Me90AwlnaUfiUF2eoY7kxgbOIMOXMOp9Dob0EvFY47jjqERZ
	75+W1NrIEVuMIcbWSfQ3NUxzmHpAc1wk6OML7WKFIuJaV5jyE/SJNs4Q78m2gdP97V5iExqxovu
	TmEMLe8sH45fUK5LLpOCej/PCt0nCa/O3lMcTjVv/VZ+4tObQEneo2h8tdUvmI1A3e7CxgskR2l
	77LNitfQ/RzDdceT+Bm/fdvDzQXH2ixyczmcvvmDOEpiE+yrZa5kKVPiG4+8MK2F1RBtsT309Tw
	hMci/hHutyOv6ghFBUyCmatTql0Y5bra3vg8lCom8pJobpF3p7MYceHexFlORZLkxSyNColdyXz
	/5hAc=
X-Received: by 2002:a05:6102:2912:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-6020e58864bmr524735137.6.1773403595016;
        Fri, 13 Mar 2026 05:06:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2912:b0:5f5:3a57:1e88 with SMTP id ada2fe7eead31-6020e58864bmr524722137.6.1773403594514;
        Fri, 13 Mar 2026 05:06:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6e96sm41623066b.2.2026.03.13.05.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:06:33 -0700 (PDT)
Message-ID: <70e9a500-3fbe-42b5-8ea3-87b417c16064@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:06:31 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Mark l1a regulator as powered during
 boot
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfX91rr8ZhllVVh
 0tc+MFgyR7qzcCYcmaVGi5npDHFlkLhj1b0F6aSZtYqvN2lU9hye/2fQkNiv00FK8wBY1ha+x8i
 oEmfcOfrrcvKH051yaraam4YMEBYQOXJ6dH1B3ErfmeeUglHE0O65IuEOxQC2HLUkmCkelrPOEs
 11wHVmgxYFh0UBT78e81/BVgkRnWZjaK7ci64/B6+AYlAUX3A4ciaguFF8aAFk4mhg9llf7BKq9
 TgYU1tbsvGLZL3g2J6rdS9+rPcP4utASjPHtpqwIqItHI2cRVeVSIKC0dO88avRGEUzQk1u0rvw
 h5Ehq7+UTVUuWlJGqrGnCk5AOM2Jc9OByTrJ4atw/Mf/7INFJRp+AknH3ixQP6X/u/A8neyfbsq
 fjb7aJ69N2lfRaBT6VsG6B3udoBlbk5ck+Rho+3vQVpn6NaVPDYVsdjvwc0yh5i0WWB4HvFV8Md
 /UEYY7bHe6nJuXTB3rA==
X-Proofpoint-GUID: o9eWzLM2vv34QIBRF36YnlWJhEsvswEi
X-Proofpoint-ORIG-GUID: o9eWzLM2vv34QIBRF36YnlWJhEsvswEi
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b3fdcc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SXj6t1vWLU9fDgigrtYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095

On 3/12/26 12:49 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This regulator provides for the display subsystem, thus must be on.
> 
> Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

  regulator-boot-on:
    description: bootloader/firmware enabled regulator.
      It's expected that this regulator was left on by the bootloader.
      If the bootloader didn't leave it on then OS should turn it on
      at boot but shouldn't prevent it from being turned off later.
      This property is intended to only be used for regulators where
      software cannot read the state of the regulator.

While I believe what you're doing is okay, the commit message could
be interpreted in two ways:

1. The regulator must be on, since it provides the display subsystem
   [and therefore the bootloader had turned it on before Linux booted]

2. The display subsystem requires that this regulator is on, so for that
   subsystem to function, we must ensure that it's enabled [by Linux]

I'm almost certain you meant 1., but please make that explicit

Konrad
