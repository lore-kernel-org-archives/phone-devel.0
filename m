Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A53806D9
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294861; cv=none; b=h2O8Mu9IsoYMBkQKKDqT4RUnRMlRkY/1MEFPoAiwhy2HH4P0QI4/UDNmBDIfZR//XWTbYZjDFabUGISOgVH5blNzY+y2CgFDNjKsPNcKWhEv7aQL5KUJq3z9ozBR+1k2UtAt4bbIMV4oZFO1Iiwvb91BxYGnRdBDuJtjb+NJAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294861; c=relaxed/simple;
	bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsQGmmaqzAyUN7DJsNPJgDjVc5k5jMuFnVSDoKfDS4/Zm/Y1kYQzhzHEPhVX3RwiQ9dvqtHnIVP/b3A/6b9fZdvgS4eoIzKVdI5HqyzCsvJdcR0BM39ya+UqJfU9WpbJatOtvCjndGoRn8YAjyRIExCeD459eCLaOMRZNrT0Mkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEXsgQGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGq/tNIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEXsgQGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGq/tNIe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aqdA3636924
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=; b=KEXsgQGX651qbW2O
	TjkbCoy06tKKRbBsRcGGrrJ5czlpms5uDz167YfORNuGzG7x1cA62ABtFSiEONWe
	YKgClWxTNpuR2DzpP3OQwf+oG6z97Gdoby/olD89OWIhK6JAtWgEh/pySjtq2r1R
	AF3PnD5rM9K8PksBeNtzdSCzAGUn2BCmfREnCfwLbT8+cs5AWPf2XDyZQ3DUuzc9
	DZFI0dMKCe3raZcwhspOl7u9RfbMDeF0XT/wVuVq0kIoZiYGlNTp+cUy9NC205bM
	8Zf1F23zLMWAd3JRTjAt7HoRTzP9FiXSkMHLFJlE7lS+oVH+A3WyM7rbz/dCbJ08
	6GO+mw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0kmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:00:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888ae5976aso26553196d6.2
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294858; x=1768899658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
        b=HGq/tNIeUkwkGZFu7YbLfEU4bHQAa/W/XCQkKUnsU/CvSaavOjIaVRmF3Hr0skbmRU
         zmWZl/1tUutPolNbBcWy12XkconvzCKAWyRc90KykwkKyzW19RSsPub1ypgTavkLYPGV
         EWQtmhVlH02l3XTfcuTb8+BRjdHJ9oJHnaJKW63IEudgktxTwEGNMGN28BG2tunspG7l
         yaBg3/OMUFzL0mUYnIbPGbKApX/65jMTJ9jAMTraoFM4K7VcDA8hSdSpjh+UU8qo3PKE
         kMFhHxfLVkSf6YrdqO4y9Nxvdb4089TlIOT7WJQmgxMKMtDWuvij65fnJ6APfqNAb/Dw
         ltqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294858; x=1768899658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
        b=lP5B2EBg9gAnA/GDsOSQHdbQ1aFEDAhHdFRjTxIzo5DawjVEVoAwqJKn4g4ydAB1t2
         obuPQgENkbfLfm4P2/3ZICnqhixB8toK3+Hnb+XWX7/H+1C89RXijWD5Nkc/SAJRjOWM
         0a3LLLGopI3HL2QrqZ5KABlNRleh9L2OKoPqPiD+WJXYqrOPwpxpOsSoIGdxJLoM/gH6
         zyCvnLPpzRMPCk2/ZjL5ZjYC50h7Avnqu5LdmaLRHmj2/hqN0xuuXrnXrqg/IAR+HuDk
         LGCBG2Gvn3CGY0VV8CFThnYH3IMqvduf9QwqbOzrBCM52xurp7N82DxBle2pknzgjyMQ
         KR8A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4uv5FNwtfSP6tUCn2IrTn7Uc/2GBkAzqYtTWxAlG7woOqycYhnUOSjpuneJDjwxdL55rAguInyQ1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHI9tMO9vhcm38PfNrYKvH8T4vxXpgEvHEXp9UfOSiEt52XzoU
	U00JywSBm3ulauj6Cv2UtZFATiinui4mLLt848fyjBc7sR/5aCPrfCrbY5GbuUVa5NEaU4ppsmY
	bd6oftkqKI3fhoT3i6xz0X7rqBvDSXWiY2TE4GjDLtUG7neSoQ2XRJwnS2cWl3Bdtcg==
X-Gm-Gg: AY/fxX5mdgP3LJ4jCVIebvBOhhpoF4knJ/WmdBEnqYWmDmKTjy+57YlsouuUS3WTMWB
	fcZ5aIEYz5c5gxZgPb5NwW10xysI++SXV46QaAex68+rrHmRfx9nGmExM//1qFb6VYjOzqbm9bk
	BUlZjzPYO0nQgdEIfhNjxmEcy0iah4y02Rml6g3oiu7lmkDxVZlP3PN+XG5XXvECBJ0J6U64Lb5
	Vjj/Ka9VS5aZz/19225fU2Kn1kUVT4szOTN5P3ySkCGWdqzli5QwMi2efE36YGg1n8oncmD84v/
	2S3+MoVX9npZ6q2GGe5YBux67aZ0hjOfB64gIXLfDuw/zuQeBN40ht+mtR3pX2sU7wbR1g0G4tn
	pi4fyq2e1yiTM9H7SI7rX/mm2smRFkgs7qMASj53rVnWFpPHrMk1ZRqWtfG+Q6x6l+dE=
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr232029921cf.2.1768294858253;
        Tue, 13 Jan 2026 01:00:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5beq5fmT9rl2rskNz5xtpPUMHW61786+z5iSz7v6XEXO/Y7S061xRYJo5ZaIT4WiV34EIuw==
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr232029561cf.2.1768294857665;
        Tue, 13 Jan 2026 01:00:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f0esm2218533366b.60.2026.01.13.01.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:00:57 -0800 (PST)
Message-ID: <57ddf3a4-8e4a-4072-828a-9145f1f30d12@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:00:54 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX3h5wWcPNGAgs
 qfXGhctZqvxNn8gtot/6OhViZIk4/MSfK2du9Bnq2+b52B3/PXY+zYBo0jzltBpcHCbVnR2kk5h
 3l0UxzGWHZgp7b4BhOT9mTCa7u8C9UPstlGvHO8ruNnRMMnO2mMAat07xYu0sPy0AJFs/tqaziW
 7TTmUWE9uUGq2Abh8Ncvtqn7wqDGegc/yIMJAiSqIZd11YbjlVPJHa9slz+nh0vqT1yyXIw8+wL
 Ci9fvlqT8v1Nu9W8EjTA/wwWQzU6aU3URBVipc/IIwUaYtNID2IUT6pNliOGimMRbUGnvony62D
 Gnp9kM6kRu9iSpjzrXslcD0/66aBdCSSTt/cOojmcEyJ/chc4dexPH/eU86qCmQDZgrInba4Dcd
 qAXGes89ybX/GyBskk9j6qukYyW45dULqb7E7lsnxDl41RSPB7OqCiEpg76P/0ccj+jC7nmCiap
 o0fZ5HnFqDZ+qTq9kdQ==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=696609cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MdDK0SfbWQR3MZ74HusA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: peiaKgTEhMpXEiKzbLhOw2oaSpDt2U09
X-Proofpoint-ORIG-GUID: peiaKgTEhMpXEiKzbLhOw2oaSpDt2U09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> GPIO pin 102 is related to DisplayPort what is not supported
> by this device and it is also disabled at downstream,
> remove the unnecessary extcon-usb node.

If you put the phone in fastboot, and connect a USB3-capable type-C
cable (making sure that it's not a fake one, usb3 ones are noticeably
thicker), does it show up as a SuperSpeed device?

Konrad
