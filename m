Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5482F690F
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557457; cv=none; b=pwv0l1x7L5zGZqIYH64Zj5kGoSkFjlWNtXPzW5xVBlx08kgi2hhy17JdpUrbtE7NgQ0o7wrsJ1ahE1qbT6gTHSbb19W4u/drVvbY87vXpsO1MmNCrFYzB2t/3IjBZ+u7+78gHMgVmO2Ey2T+POvxowunDcLStTMUiHAg697v3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557457; c=relaxed/simple;
	bh=WGTFvZ0ouX7deB1LeI5Cs6VpX1ERJhSLG+hx6Xv/bzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gtb8LfhMIV0QRRTRxoZemtqkXXnaM3hBqaxHL31MJRdnlDWHU48abA4gZRCYUZBIUuqVP7U7kJvcFQZwi+iD7rkyLbSpHYE8LIr6GOE0nmlzh0ov+SU7Yx4x2HeztmqOoWD42PE63uhpzxWEvE38e+QlbUCNxGoZDL7FwD/wzvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxAByVLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5BRemKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxAByVLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5BRemKp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376lNGp2550283
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=; b=SxAByVLJojjIvjvN
	mgiFXkQHFMS2v8h1z9y2jtcQBu7pCjdysdYakcgxEuwk/C4nliwSkpUcpfVaTK7X
	jhFdylX5SXGWCy9fbeCYL9TnJS6WSk4ihuvuvqAyvio7JXSK8rTWHImMTIkHObDH
	q2JmR4RsdcEDjcyIsf0HQTd1JtTBkNoiUwr62s0bRp4hPYlNz1mtT3U0ABWtUl39
	oLS2EukD/AH+OX3rvhcMNhKDaP8guzB/qlOmw/IbHSViQ16mAbGBMw/p0c/OSb81
	3F4PBzuJFvhQbQM2hTnEHIVJ9GjbXD6Nfj9N9l5tWKBC2BY5tpBTJVRuf7FBuIIF
	MyOkyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea98b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:24:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d87632952so7445101cf.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557454; x=1776162254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=;
        b=J5BRemKpDlNK+rB+vx+Ml95BvXHlxYTTitwE3YLLjcortzhqMLUJC5MXsm4bytfQVu
         qGBMS0IELHuVWEWnU6qkLYiZoStQXrOnHyGYcx7U5aKGs3VXXeGu5ociqiHlDTFxLSJv
         LFATHW4n15PL7oySb9NG/meXGU8eBsWuLY/NhB2cAYU98qoMRQHZr0TYWc9aaamHMzEZ
         agNUG1At7+pG5NGGioVWEETUspCCO4eAQYxI31pmH3uxxsv9L9PR80Cm/JOlOfBeIMfb
         Tbr3M2G5/h2ThxS/BZFRZkPvFH4ixzu1CkP6QjIWWdET8VMZv9z/M+GzrrLKF3uqz725
         6yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557454; x=1776162254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKJo2yrppwtEuJodZFl0E9MYXbP13Hqw36pWZEsb3PQ=;
        b=bTPo6CAbIJ6khRrx4vZ0m1dGlcTYJF6LMNY5Zh3s50mp1ninTQVHXpuswXX9UljqUq
         YLVC+akYfbF6LLGGCDThlu8ABNAIEo9NluSS7nXNzGRrMPujXMKMEHvOKvY5t2M65MSH
         Ly4jfnuWRpUePwE23ensEoeanPqss98jq+GeRpD+VQdmGBpjtQ0cBM3eePHfE1AWkqIR
         kh4OAmxp7Od+pBOjCpSjI6ilIlUw+msrATLbT6XmgYNZXTqCXgsT2YTCQMm9BmhAbVCd
         HOOWtlkTGK2K5fC9tJpHjTEZYwmiYkHsFkLNUORtxsDq1rEwNxkqS77rOPSi/dmuAMh9
         wySg==
X-Forwarded-Encrypted: i=1; AJvYcCXSArMEGQLqmcH3wUgSmgp6VQMcAMRZKwuUXrXIRYAKMGYcJgKpGHFloh4tPUGXMiknxRauzm2ANn0UxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwEGI0Ned6NZHCBDIHOlY9dW9gkNS/Wjl3pUst74r0vS8q9E3
	x/SNkhBb9QMIRHyyNxUUjiOYn7RDygBUNuyJBK+InWePPrE8mKct1iBfftzNA8Y4nKJXMP68xec
	3UOC+p2h9gz4cr0dNkzWGXaI4tBFp7KyFXoiO1YBQoGT13EMxwKZOYIZG4gCIaXubZNXG2Vel5A
	==
X-Gm-Gg: AeBDievIViF7UywPiI2TQ02HGNgtvAT5pf6/TS8lX5AhA7HC8KZDysI8f4QTZjWCTIb
	KJyTKK8j/DNuqjFLR0YjMLrhRC5jdPUEGsaBw6Z2PH9ooJqkPvjktYe/YJ948CxXz85wbz2bT8v
	jKI7F8YhUdCed7TlYU6ouultynPClSu7WGA5tpvQzQQuO9Pa0KopPbNOVXEJwX5nJ46L1BPeW5n
	+NJ4IvdRQfjE35myMAJSbylw+jv9Fk7XThNtSx0uXwvfJ/tf+Tx8WE09+Zb9/FODeRjHOQka1Ro
	5Zr+2Ykn84ndK0AzruZ8094r9MCbFScMID6s2zCD/4y242x36sb1erX/xizn3GwK7blp8IYQh/x
	pSScJSZHSQsaEqmLoV/FmeXWN22PZ3CbAnL5PeVuRCfKii8rRpFpJ7vvKT/GHi5U/bRhG0cLghQ
	onCBY=
X-Received: by 2002:a05:622a:5593:b0:509:39b5:a977 with SMTP id d75a77b69052e-50d62c827e2mr163641641cf.5.1775557454504;
        Tue, 07 Apr 2026 03:24:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5593:b0:509:39b5:a977 with SMTP id d75a77b69052e-50d62c827e2mr163641421cf.5.1775557454105;
        Tue, 07 Apr 2026 03:24:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm4173930a12.13.2026.04.07.03.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:24:13 -0700 (PDT)
Message-ID: <3b279568-1163-483e-b79f-d84421702a86@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:24:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: Enable known blocks
 and add placeholders
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4db4f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-borPC1GNyWcu_w0NBkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _tJbHFjj-teH44ulTRe1JQuzzouwO_-G
X-Proofpoint-ORIG-GUID: _tJbHFjj-teH44ulTRe1JQuzzouwO_-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfXwhKaMx4ht8m4
 nTiDsxLbw4v3ICEDTmk21s/QGSBW1325tG1JHRJhtFvaYRXzHPOJPJ5jmcX6NymS1bnqwoWDo8k
 AFeJXICQR5GM3kwdTvVn5VzldlvA0YMK1Cr5p9DXcSDYWHg0CFmaxdDDpNjrQJhdyNyyCrvVIx0
 ilIaixemCr+vw2K7hzw3IOvEnGe0KAZdClnjWw4Uf3KtpO4rYzeESlzc5gHqjhRZmbbDDTIHq1l
 BgEfgzWI5pMQcTsZZV4E+CwbbwYA8+IYLK9e2sEHmr2Y5/ZTlwDzbyD3gPcRidBZueaKFpOAwMp
 kHfQdm6ySziexzk9wjFytsQP6FNApJvxZv7WJHZQGgV3V3kN+qD5uM7C1USIwim7P/A26neN8NO
 ovwyNoD+xvOnfFKm6Ef+gTF+D3xE3OECAVDrJE49ZpIXEHALV1PmUsHFpfg2KSkiGrIP1/kpo5N
 +rJE55pkVyTA7tfqHOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On 4/6/26 10:18 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know these devices are present; most of them are supported by
> downstream and are close to the mainline kernels.
> 
> This adds placeholders for:
>  - front camera (imx371)
>  - rear cameras (imx519, imx376k)
>  - actuators
> 
> This is very handy when rebasing the integration tree with
> support for multiple different blocks at the same time.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I assume the preset 100 kHz freq is fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
