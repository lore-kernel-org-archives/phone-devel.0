Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09DE341650
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580010; cv=none; b=cfZtkVmwmaD50RIrHygE1aGxusW5AZ0xIl7VTGzTKb/P5RAJf6m7gC59+wEdmlmsB3ZevU1AUGtzi1U019x87VEeHPiZxv58+UQ0SMPKs1y1TN5qkF8s9syIf3r/HP3OCRLxRJgwFkwUw4rniLZEfRp3xa2N9SpJjJBTtW9qmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580010; c=relaxed/simple;
	bh=h/E810/CTY1XFkPzarACCiq7c1ZDlBl33zyKw8u34j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0xDj9jGU18nFxfuTBRXolQuFmjrR5sRtR6o3l+oftY+vuyQywSwELKLBzAXFYTl8Fd7Do7MGKkfuR9qNfF5WczJEoFCGLILhP1uT1PuhJ51zDL3tkBc+x01cBfXddRR+uJCnPKmR6AG9i3kd2V2cPBOHY0Pc4/UkcbmzI1hiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwtjwEOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2J6feBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwtjwEOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2J6feBF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDZjtC1196336
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnISaKeZPEtPqspPW3GnAYb4
	P+w9H95p9ol9sk2Y1Ek=; b=LwtjwEOFF3xQE7pWnTpfjP1S3D667uIzgDEEzPe/
	Af0uXOUde99Yy9GCpztpYnlmfStTpt9QZO1Mi+l8ndWZV+G/UKbsvlyqa/QHk4WE
	MfQkOrnASq7DV6xw6szDvO0Ces7kwXZipO1cuHarDjTgTWdq1s2xKy5KslGoMs29
	bKYgaPCxprvGuLvcwVdeWPNxZP3HdG66/1d83we0hkDDVGYtQsJUcKujuA0MyOCS
	JPZT5Xcy8X3OwzJURMoTtpd9UBIyAvjSNvggSxqkKPkjVffAt7Hu+hsHMxVEe9R3
	5ooeVPvbyZZiHj5yftQTTS1Nizy6EOospBddKAKKXu1VHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqpbr0eug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:13:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a7fb4421so186062785a.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580007; x=1769184807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnISaKeZPEtPqspPW3GnAYb4P+w9H95p9ol9sk2Y1Ek=;
        b=S2J6feBFh4XRBMeqnDq3qb9tzvnn6l7zwdD/w9yVGwcvoRm1CJIdh0eXH1oFl54ZeA
         MeBnYsJoOCFvY+kaljXYMSzT1QmEd4Xj2IV1x1vRZ0dAWQ72pP7jR0W0OXwm/ml+k3cL
         ArT7cH57V6NaFefWenRtv9AOsAES96a5hJnzgqW6A4SRZBWb+z2CO/DXSAuMz0vOtlJT
         BUWQnZWbMtGRNaT3jn4R+mJC0BTk5VZgqG8HWV+pzQ1YptIG8VMReQKY3rar3SHynNxO
         Q98gwwzVbaYdC6FcjPPfTm5caXOa0btx+jRfvKoWZ162PnFIjM+mb4YHUM78sVAldUa9
         p/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580007; x=1769184807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnISaKeZPEtPqspPW3GnAYb4P+w9H95p9ol9sk2Y1Ek=;
        b=V16n5RV/zgLO8EhMU7W+zfY2NlnlelbPGnNYfvIoRyWICglo+J7nKp37w1EKm9oe7R
         5n2Udk217cBPn4DzrLVDeJfphkEK3Tu1OnkcdS3KizjBvCyd4Jsjyi8/jSW5AavA9PkL
         NhFgMaUzrd34JuJn6amEp+2lVwRD53KnNmFtymTRli8qPE7soGnxmi11l3z1wkiqDRwi
         QPEsOBI2pCdiIJjpJkfm8lKrqYDXkTLXa4uhHwIpNttisIaO3QgYZb+l9Y8QP0Wh4kuL
         3hRjjyKIiV/+fXzTezZh063vM8vU6ne8kPMt3hL2JcyY8d+qu6CgN/OsBkUuSFpXXYZI
         tEuw==
X-Forwarded-Encrypted: i=1; AJvYcCUqtdLYX585eDvaodrFLmo+MgIz7pM4Y7h1qDlgWTiCT9adEw5rmkCK4+wX6B0PHXQYIokz/GlPNGHLKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8X4ldZ6lX+Q3DgOJhQWG/psXlkkY7/YEqGFv/sodl3JAYApW
	LFfTBdPhsx5Xfvo5p1FZq60lYpjtnJyCfjK3ACjBoR4A1rcQpl+bLiDnOi0JTDYadl2UlOMUsL8
	9Nr19YcSprbhb4pXFHZk+WLPQSHaYoDQe4SRxzHOGQ3asb1P0V+3sf2XYcVo6xDxSEw==
X-Gm-Gg: AY/fxX7niA7NdvFbtoLug7iYf8Vyg8LRP23dm9/hsoNX1InZ/yGZLaiU5KNpBFpyDIR
	YuQc3HCny5LSom1I3mf4qnXnUDJNcBlTSuBKX0v9tF7+V2Yjd15YPDP2LM1oAAwTUNXBnn+LQYJ
	QG/+Vnv2g3ZGSb122QxMfNh4TuRd7ALxqTNveIjU41DjwOzo81zdkINpoSZtZ4JeseTWliBcLDl
	wkxcIjRgSMxFnIyq6nuAfZiCpAP2FeqiNdXZ6DV7sP6eZqcpAvcY2L9qGEHfwfHvoLkSIB7YneP
	yHpfES4jD9Q52GjhRfoXVe1nyjxNnkpMAxBrpNzdiPkcNXUV6rMFznXtXSXOaRQRJAn+U24lAzR
	Wm0R/qfvrUFYjHkXUpjLrZwE9/7I+KX+8HsxLtjrbjo1fPj0oFL4FRR4RHJRAc/NTlxQEc2G/OD
	AAZEBB+RMF7UHjb/bRvAoK0So=
X-Received: by 2002:a05:620a:404d:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c6a66e4bcdmr468242485a.32.1768580006777;
        Fri, 16 Jan 2026 08:13:26 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c6a66e4bcdmr468222785a.32.1768580004787;
        Fri, 16 Jan 2026 08:13:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976fcsm880180e87.65.2026.01.16.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:13:24 -0800 (PST)
Date: Fri, 16 Jan 2026 18:13:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] soc: qcom: pd-mapper: Add Milos compatible
Message-ID: <hwndiywr4x6tvqh4k6nxyfqf3cumrjhdcxtm4w7h7wxtsmucz6@f4yutm4kfkuq>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-1-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-1-27b4fbb77e9c@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfX/BrpXFmzkSJM
 gWrRF/RrOk4SJcRrhElw8aSXIxoWDi7aphdNkttllo/aqkmKT6DFA5av/l51J3oG+WPckbzhALn
 Aaggdtdj2nnLzK273N/TMOhhheVrTUwHv+a7PQ+1ldChxXLCM6FbxB8bXC8h3inuhEbwAAEwEBo
 K8oiSqD32RDAojzBCMBQk3Ntc4fFGxoSLtluVTCz1ri4MI8DJsgOXAqn1gRfl5J1YTUrNPjTOc9
 PC2Kf0hgSMdojwcLY+012EsIsD/9+mSAYmNXf9gUijpBIL47ubflm2HyMkz64oZ06uoO5RErepF
 sMdPVmr3sinlivJec5PGO0SEwPn4GVcBoGAh+ySFbzSakvI2SQayaCr5NeLZQHS7qaLtBAvs61G
 BpyibmrPG/nkoRjkl5ZbfTx4NtSBHAH/yDr4oY7Ntn/8s6t+U7T3I/tnMw6aMbGu3GTSWG3GzEj
 GdfZdXQTwZRQLmn6P9g==
X-Authority-Analysis: v=2.4 cv=dL6rWeZb c=1 sm=1 tr=0 ts=696a63a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=zGNnDoXLyRuJOFJG0UgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: d6pf2bvCXKfduW7X_t2XcZTML0b1Dq9B
X-Proofpoint-ORIG-GUID: d6pf2bvCXKfduW7X_t2XcZTML0b1Dq9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:47PM +0100, Luca Weiss wrote:
> Add support for the Qualcomm Milos SoC to the protection domain mapper.
> Milos shares the same protection domain configuration as SM8550, so
> reuse the existing SM8550 domain data.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
