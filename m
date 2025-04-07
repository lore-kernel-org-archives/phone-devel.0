Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFF226D17
	for <phone-devel@vger.kernel.org>; Mon,  7 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015254; cv=none; b=QZrcsX55LaO453GlkuOXBX3Sip0x2R7BIzKwDMCE9Y0bfQLcsHXgG0Tt/XG4lfVqsGFiLz5cqe1ZyZiJWIGO4GxXXKx561f/zfmyDLVJhO90OqM6RNzAfeL0AJ0bEAC5yiYX+HpEAcKDH0DlAsCl3iXga+OSfxFbosiDaPefprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015254; c=relaxed/simple;
	bh=onZLseSQqRpgk7xz8fY3EmUBMLegLFqoFajCvjWiZiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpXyHC1g7b9fjuB65sNuwGjJJxiwpeWnlaMHTibw2yMHkQJtk9Jj/UH1GGXJQJvsMP+h9DX6lgaiI6NNAAPfrFVOPnJ6bPzGHrJXx+FqrFK3hVn321Fb7zfXBdSB7LLu6k5btKoJQQDiOresnHgXPcMKF17PlZ0pCt/JwS/iXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOIuQ/Fg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOIuQ/Fg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dq0L013367
	for <phone-devel@vger.kernel.org>; Mon, 7 Apr 2025 08:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=; b=VOIuQ/FggEfjWtaZ
	sbpFY8lSiISTDqAh4/iH33p9nKWCwqBojDZncXN1d7lKC/GMYMwaN04l8YuciECG
	Jz4PBjMNxhhHexDA3eKwcl1UcPXdUUBwJ60CPvb7THSMneyBUJCGeOCNGWlAOP1n
	5iO8NsydiQmiEBdLeRqHbzOe+QLDL1d338LfHCLGikqROvO5YeKGzW24Qds+1KgC
	YqnJPzCxD81xNfyDaRnFL8wpQ0/gE34xXzUVxidOEmBFzXZpuyaQObJ+9b9as7Xg
	KSvH2+hloaN+vWc+S7HSD2dtiBNiNgfbkAaZliM7RKlwyzGUoGJrIuWK1uydZlNw
	etar+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1bhkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Apr 2025 08:40:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so114401285a.3
        for <phone-devel@vger.kernel.org>; Mon, 07 Apr 2025 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015250; x=1744620050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=;
        b=KiNMrNTpH+kZXk0C+XCG9gDdLSg8A7Il4UtF6kCxRXTU4sxwsXXO2F4n6qH/7FIwGa
         i9Cc5ovdEWbF7znIsBGmYAba8v93jTUa/zp66cHRZnoUUe4l+N4rgYgT4Dfu3zFvuhm7
         YyMI8iUKyUmT3TTfgRT8+HvnYtXAroKQ3cMtZRcCRtMpoV/+Um1VO7wLxH5XsIAXJ3gH
         GQ5LMAOy+uQDXhQVu61yL1YmG0TkGigGEA4R6qW5cgF1uDO3RaCYwgXtt8brMPNsHoJt
         YNuGneBg89oJ0S4hNn03gMVXCEJX5/odyJ8WTu48nSMK28QfOwIhQqTb771MQiYZvEX8
         DfvA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3MqoFPcU67oNgHmLD1S0SP2YnfI8KcfC0OO4mSTWkxx1mKt7rLBt9f9VrzwD6JiPOuAYDRDP/4yFQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ezSLyaL8EKPGP1Fkubd1l93qKToelgC3vdQjX2Z843KyL2Gi
	PRkPnBYAiBxN5ceaZ8bwD3g6biDmVM2PqqSr14s07SmBAPkKP/AUUj5y7vKJ77JfKVSBIYWn+uL
	HAZVOsbJD7FujbDByZ3H1Jk2IAfeVD4rz3h1WG3Tw++mRlIMEcGcHqWenVLHmOw==
X-Gm-Gg: ASbGncvGeoPUaLt099Cf06qOLJpmVFeVN5GlcJ8GKu6y5iPxEVW5P1Jb6pIhFk/7s/q
	joBav72B63JnhsZ1nhGwYmpD6gh69hMTdFAKKqSESXadMd4Gau4Cr0//TFKlUvYYarwIRHstfAF
	TAlfUDMrw4WNbnVfG1dSxw6Djdy0T23lvvAbygkBSjUcFzw6Fv1yhU6GQVzygjMgR93WSD5nu46
	AiEPRv6xJ52dTjs14ya/Hm5sa+/pF36h94fZQqyvHAcSz80++mCHlPZZk4DQHWgT1yGH4rP3n1U
	y5flYdE0mpa5goxKsbChnNQFt9cdQm5KXtnKsns8g9//S9BAWZsW73VFhy5LlStsR/n4DA==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590207285a.0.1744015250607;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETuFZ+vsD5+Sv9K/PkFBkn5sgkSbEsPdKQDRnhPrYiuCM1GOPeod7sM/VUOp7RK+3maRUJxg==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590206585a.0.1744015250316;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm723668066b.60.2025.04.07.01.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:40:49 -0700 (PDT)
Message-ID: <0c374a5b-b2fb-410f-9d2e-3b42e8eceb0f@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:40:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898
 amplifier
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
 <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pEF3GtR9166fVYHUak6vGekREGBvMgUU
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f38f93 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: pEF3GtR9166fVYHUak6vGekREGBvMgUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=882 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070061

On 4/6/25 3:03 PM, Luca Weiss wrote:
> Add a node for the amplifier found on Fairphone 3, receiving sound via
> I2S from the SoC and being connected to the speaker.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
