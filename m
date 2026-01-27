Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113DC296BDA
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514926; cv=none; b=XKhVVIPuO5+8kjByFlL90dVfsZubxR04nSoDbISX70/iRRmMrigxHRskxqlrgIsP/AQZ6pWmgGngJNdDThA3GP0Z0BftTOf9qc82bJJg6axYfXbDfm68xnTRu5b1SxntqP+HcZUDGJHdWr8SI5u+yqJbblVT+GOPbOSdj4YoN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514926; c=relaxed/simple;
	bh=o9v9hHV5L3vmq+RKzllPOVxRj4a7zOG+09H9v/8+dek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E72JiRcK/cHcuEMXkjeyXYzH/+9TdM6VxGRn+2zZg0XyOU6A5k4LpdD2NeIphfENJ6ec4pSNmmtqcxDYQTRSEMicXQU/MYafAwvYfp6/Ss6+1kB3eEFhAxjkWHfd5Ng+Sm4T71z8iWO7Chqxbrl0X8m0bFZv+2OuzwI1Y8n2cnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8ZVhDTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLUqT2X4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8ZVhDTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLUqT2X4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKZTG496005
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=; b=i8ZVhDTOXPCYbR/R
	lafK+Mhg89Uinr0/bMU26cFy+TsW7FAbEkmlH0ZA//TRvkjaziIAJ27KZFqgUjzF
	rRRKKFhJbX/jLSXN+Ez0ZJj+1hHDIBpK+Y70vUkTHbkuyOtM6s9wDgbFn5gRvS4i
	tGNn3NOdFg/UyKya0NsGSBs0MHSQIuy0hJemsmAh4QbeQT6uJZeOfnu9a5/OxLIT
	ENAY6iu5AlI9Tc5d9AYs+YCsjLfVr56uA31fuqS2dweNUURScykPjhySAjTCQSUH
	eZOADN6ChSF0zcB/9rORHdK61xNUwEJKJYgMl+RrnD8gI6aSsppbJV1Ooo8wmOKx
	YhFoqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bjkyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:55:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c536c9d2f7so184283185a.1
        for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 03:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514923; x=1770119723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=;
        b=CLUqT2X4j8MoI4ElcjYtOsWOTC5MPKiZ/gSgOuoWFJzKtOdsDv2WVlyeuDjOBsr+rB
         +uEdEwMVPM/a8sLtukID9EMDXEINqnNq0gPZAUOWDkopOCrB+3WKKLS8nsN7W8PenWnZ
         +vpk989CJ7wMhmOeBmj1RvPH3SHRMsrEo6bstdKAmVcqwwP1pqvy8ftJUeadSKTXLUKR
         VALU5Oxa1umDpiE83q8KfWekNNELndOMxi/xBt4akuYImLUn7qvzZbU2/B2IJ567Q16+
         6OPLKvCj6KPJ5rqOsf67IF44NiYpbmJZ9HYN+mm3rDcujMtcY8zX/cNDqg2srYCSa1Pg
         UspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514923; x=1770119723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=;
        b=JEVAJhyLip/oRYWWIMKn3U6zwHXzg6GX4uhtP0870nu1OjYIaERm+8ElkF96oZGh3K
         KSIM2Zx549VR5gOYLCSRCeFe8FAcyLQq44KQaoEwcJQBKBb3BDE8QiLijfIsiznCsmCg
         BY9zPf7EkedK9vgGNgrEQxBQFD1rmfKWKiYX28QpXM7i7ODvCRL8kF4IiHMoTW3xI/bG
         HDvMr0fYdBHy0WzC0nj2E19Y9TMk4TI6q0MIX2eu0uNK9J4pd71wV6y1BlQU81FYu9BE
         uVbwQdI/ehJpeScxc9JVWH1oLWZ+fiCpKjRbjRYEoCeTp1dIPgNXiaW/f5Sd296nzGYh
         0pag==
X-Forwarded-Encrypted: i=1; AJvYcCXnBbJdq08UFbNHyVrmijRor5Wc6oeKvIrN3fNCMfPNoTltP6Y/XweYhTEb7ZMxZ6BOmpy3S4CE0vRKpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+Nl/DJLWlawLcEYkcf+EIRy7UMoH4Jub86nNPMuHvtjAaeG+
	FfOPu1sC26XkLEP/DSlM8N+gYIuDA3JBhSKMIIuOKo5AFf0RQqkPrskOTYHo1sh/SvzkiqdR8/z
	EelQgT4vnCKZ7u8ogOCZFPQfuT0RsnE3rUyPvMIy2vTOSeSK/vFAGsEUKuBJrzBGqHg==
X-Gm-Gg: AZuq6aKFj30C9UZBREcoYTDF6QChZkBUcIT0kF6s3tFzxzQEgfzBwL5y2jDzk6X+K6q
	zOJLkZkmAtYbPnee1G+EsCjLHTlEO2DBfgz/jO/6siily2KRuWMY1he1BQqt9c1E58kvGWHO9pg
	E7thTiDI0CsQ2wTR+9AOINtzOeiQlneI5lFNoMhQJ54/4WvR1L8Mnd4+17qZ8e2IANDwVwJY1Jx
	g++bo/Qe+w+QbT0jHp5FKQQsLdC2qiRspkJ8KTvBMddNNKG+Jw0NR/axnQ1zPUq1ojmJKOQ1DWL
	AbvZMy0cs3R96ai0KPyk9C9mKHautRYRjXYMYkxjsg5Jr3mZ510CCC6S2Vv0GOY32ut1L93Nq/H
	GiygDk5rGC7PQjedmHrfqGldxCicwYuLNu6hRyQYqqPeq4P3UGuHS5XrI3TqKsKLo4Bg=
X-Received: by 2002:a05:620a:19a3:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c70b9b3ca3mr104159185a.11.1769514923425;
        Tue, 27 Jan 2026 03:55:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c70b9b3ca3mr104156885a.11.1769514922939;
        Tue, 27 Jan 2026 03:55:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b418494sm792980166b.21.2026.01.27.03.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:55:22 -0800 (PST)
Message-ID: <d996747e-b727-4116-9124-08a2a8827250@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:55:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: Add Redmi Note 8T
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
        linux@mainlining.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-7-aad7b106c311@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-xiaomi-willow-v3-7-aad7b106c311@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KQgq-nTGuMTuTz5yQCH03X-Ba08j7v9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX2HpI4NnK/7QK
 BUy0V1/NYObkKXC+tmgqQ053FRNQyVe1EboismigI9X0q+WwkwQZxWOoxYYr4vcnFlWv4M47JWn
 4WJv0xeA/G9gKip001JXn+DVTTvtRK9wRi/TwksFZPpjrwdrWPAF1JjGt1GP46vDBECRwgSmtGP
 WQPqvnWT7k2WVosjBMidsyZUbX5dyomEnPiWrRhw1w9dsi1hlwOn1MnauhiaiHTEak1h3VzRxU1
 5EtXSwKjhzfOTkj0T08m7OmrxWVPJ12sCmQFSGdOZYBVnNAxdt2Hi5tvuaQr6J0XzL8+5DbjXGv
 Cu52H9qifYmi9It2k32oWiFA7IdXSEURDG/W/cPTts2UJ1G5+ZkAGQFZ9zNvWDnHIEyO7SFga8A
 IxtR/PtMS/5T2Vd4k21yMxtlsWqfAV2h1fnx9QLlqdibRcy/WDdAuQqnAK2NusbtY5YmBDMX5vm
 +Wzh9TWNVFQkdK6k8RQ==
X-Proofpoint-GUID: KQgq-nTGuMTuTz5yQCH03X-Ba08j7v9F
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978a7ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=QCooW88KiTORuWKV444A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096

On 1/26/26 5:34 PM, Barnabás Czémán wrote:
> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> the only difference is willow have NFC.
> Make a common base from ginkgo devicetree for both device.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
