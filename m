Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4901BD9C1
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328122; cv=none; b=htMraaLW3poOm8ZD4b1hnadgvKIUXNY606YSihEwR8pvqfeUH/kK/qPr5xX9m6P70fEs+we6o8b+rKrhHSnpvb7AVSwF3vAYZppQIDES59gU0RudNcoEklmrUVIYlrEtk+basz8P2QLMkW+AKETzZRwNlYwFNrTvC3SSUiUwex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328122; c=relaxed/simple;
	bh=4voU1ARq8K+IDYbZ16Vqqk3bx5a+nqiyeDrprWrgBcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qw67cFuyn1msLtisGlRq2AE2f7RmUtkPObcB2C8TEVdKnhlvOOuQ4ykWhZimJmzCGqJOXXY9PfJEsUOK4ZUyVjO6Mdz2S0uPly0wQ6lyEYqXEno2shvqUtQzSMFHjjXNTTgMCXpBmNwBZNGE56p8RkK+D063BoFe8QzO3JsMO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLVsKmkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLVsKmkH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9bjl3016311
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=; b=NLVsKmkHYSjWbIqZ
	MQB2yb/RkXJ+u2FIffEgpN/ZExXvwyIemQ+6691RcJyl/9n8kY5T/cCxMRpjKo/Q
	7HhbtpLczLSwt+QntfdBrp2xxFaAqqQ6cQPy+MyGAgECFSZUeso++p+5FCQOuUdP
	WHTQ1/EPEspWuXWmAXmcBkQp8ZQByrmdpWOQcjMFTpNRr1Ur3Qo+LI1SGkR0Py7S
	pa4HvKqDU6kED/UK7og9kcobg0tyYQ2r16xzyGiBIBBpteAwA3RIfKj+3p1ktUuG
	0g6T2VS3Wtq7tHHksDPdVxJR+r7frxUmbAcV6QeyvhB65amBETSosToY1t34qYtP
	SflEAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gv24gemp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f28dc247so42250385a.3
        for <phone-devel@vger.kernel.org>; Fri, 31 Jan 2025 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328118; x=1738932918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=;
        b=iHmaAqWFTrHwdPywGpyrjWHzMox6/sna9BpfP4QAq+TDa35LaAjjArs4wIo9LlAKCS
         m9RHrBXksm3bXQGJN0qbnsqwraang83SiNMls6JVgXLlPKs0Td4LZ9oXKrnatyWH2Y0R
         eCQBPdO1wHbDIeFJtX88/PZpbpvK3min/Er8GGAsd1ZmccZ7MDgMZEFtnbG5clk061pS
         Yu3ekO7kQeQtlooK5jHDWxW3UZG+J2Qcbla9UawCv+nBbTXS647/iI4uRpXC/XR3lj7w
         eFfn82M04Q1fTNCj77lpQBcAuna3YwTezOr4JTvPLbdLwKMTC0ZULyGUbO/m5bYS8T/m
         feZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfsA+3gu+Th4IhVLxA5SsFkLaM3f4SeqOY3r6d+ItG1C+W6QtkS7OxLlca7jQSEyxbMb7QUseu71KFhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPeWonwhCW2vJC87BbhHAFMZfu5wQCTmgmiJJcdm9JqccWRWal
	kY1C7XbqGFsqsbGIDy9J3SNdvj+ApGYgeiJB+aKlVCqY8PmfE8sw9qM2p+GPFjiehQQsVfrJE8t
	YXLt8JklqE2uTTtFiE5C0XBWlPDtlfJsm97kYBiiMIxMTIVfCqwme1I+1bYgdhA==
X-Gm-Gg: ASbGncsagPmlP3dMYQzjT0FnymIRD1J71AHYXmgTHPSOEMVb8FGTBPhl6m0i8r2E0w7
	3vdmIFDXVlYrr2GkcnhWZ5AtMUU9QjRqg3ZytC9BJi3CA2UXrs1NCCcYcFsJ9qvSlT5iQ79oLbC
	2P6D6VF9ytSiFKrzVLSt5EVr8sFqX/jyakrmFnDgaksAVZf5m2fZUHixPfTjQJgTU4mLV/QQuU+
	1MRKnn5SqCjvy47TaQsv55FiF1o5Qngn0xDwAQf6WB6UuRzQ1Lm93jW/9jTk5Ts1PnI5+J/iSYr
	mn9Etn3TgzE2CcuMD0ooFTyc8oybRSyP9faXPeHDvAabnstxkzQKnjpZSIA=
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600533285a.12.1738328117964;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMVxyaytYmw+jjx4Ac97ZKB2a0FMxruFitQESJaPsVpyHuARSgtzgS3LBseJLa814PhTou0A==
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600531685a.12.1738328117549;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c93d9sm2787473a12.68.2025.01.31.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:55:16 -0800 (PST)
Message-ID: <53a8feea-27a5-473c-8d87-852008b88fc7@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:55:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing resets to
 mmc blocks
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v8-5mtVZy86N6ZGD4SvOJZuubPJl3HYA
X-Proofpoint-GUID: v8-5mtVZy86N6ZGD4SvOJZuubPJl3HYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=994 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310098

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> Add resets to eMMC/SD card blocks so linux can properly reset
> them during initialization.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
