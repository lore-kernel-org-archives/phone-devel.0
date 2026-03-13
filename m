Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA3372688
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406349; cv=none; b=UaIOW2oZi4sfKk9TTTkpzDfwCij9j/pfYlZxG6pY5YURCg1qcZ7gDTqk7n2gAvEJX7fXrxjRJNRx6vW4U5b9ULc7sXjivcYyEXmJUk/uUHwZBfZCSnFIODAM/oONtIuqlUAwnNpLF59YPs2swinsMbAdCxRDEObPirJNxvBiBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406349; c=relaxed/simple;
	bh=wtDbhbmNnfEqEzyJzSlKLMntpH7AqiBe1ctdQmC+84k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EejgptPyuqsJw8XSTkWoF/qnyFNaQRVlcw01laBdePWNNyezKDCOF6uhgwKa3Md+MCSBo/B9Mp/mBtCoThrcgmv5GJZCCdmT04FTvImxMlNyJB0N1uad5vQ/MGxVYvzb4n8ng5vqyD3QTPtQRkiF544xuHNfVIGKhJRka1cfmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPAp0SYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBwg/3xp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPAp0SYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBwg/3xp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oVtc793577
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=; b=oPAp0SYRNQn53PhL
	He7aTOT8HZrsHCQ7npPny19iaISjT1FhvOMwq6B1uoY8sZeIHdbmEccjPkqwLeUi
	xDJGsDbGzNCHJEHenSiG+1r1XN+vEShtyFmF7vyqLZnFN5ap/UtWUPNfd/Ajoysc
	KwaE640CMTwEFvC5dGxnqCmr0Y5WI1gff2bASYpVSdF3JDdJNuGwg6h33OQ5lsST
	8v2wDVzC/Tlz69SbkEMd24LLuIRHE0bBhZLsXu/+FKbMrWlOcgCIZNbVAC7GfDpP
	we561h7GIpCVnlc0NLOnzBQQlvz+C8HM2U+lNYoeXHa94r/bgKsPrTlCHGEKppC+
	TdWPwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt18kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:52:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a2c535eso102152785a.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406346; x=1774011146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=;
        b=jBwg/3xpOz0MkqELLun8/T+PU1qphEmacZq40MjGitRx7Wa1/CXjOAJ5j1RYeroHlr
         8BIDWlD8B/qxHpsTu5TGuA0GdbaWo0F3FICMlUV9rRKEj4EFEGDHKpFXU2H3b90zsAYK
         guHefMnDZkhDjv4KezOiGXFZ1TIHN0qYpB2cSDv4c7L9hiy/+WJSwGfoSb1vlCvT1EJQ
         K/xOh+9kIYdFefjejSgEKVtv3Esh6k5cIEgkpUVsqU6/KNSt8cbm7wHy08ZvRRBz94Wj
         quOCVfLyHTbSa+GUVZm12bkgrheIatLfX7qVDZLclwtKx63oAOft8jmp2hOOijx8ZFcg
         HzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406346; x=1774011146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bfg4L5JUbKgcj3urNnjZrvnI239bwc+beH+6JvGVSxI=;
        b=hQk5hZjce2oumgxbrQ7exjo33K99PoUH9HJuEosqhxvoHK+R4UM4AtjzUEkk4yrnUf
         xP5c3Uc9ovPAY9j7Lm2I5IaZHKWR8LfyhYVtqCAakOWQG7ATd2xmzzrETnwRbOq7vljR
         N1dh/L7g0ldakpGleDiiey27LI2vRFluQwyR36lqA+rN2veQ4GqylJMLKfa2sJFMpa7Y
         mCogah9ePfol1daZU0e3A8G59YUB38s72baVjW2q2DSdehvC9wBMo8w/FSfBzSNMy0Aw
         8Ri+/RmS7G3euyzJc9Y5aYcyuN9roqx0V2xeYL1lNGMKcfiYcbdsb3UcWLZM3UNgEK4q
         RUZw==
X-Forwarded-Encrypted: i=1; AJvYcCXgWAKDCtJO7AZ7XuI+Ms6EcsOetm3FGiepLTrzD9jt/f49mOB5IyT8N8FqHp3TL7YqwFNDbPD0Uavkgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYq5qjeprZFuVSTgb1/AVvmiCVkdooLlaEvL6PQUsEyhc4zQN
	pctUUW0hB1sV4uAmgcOmTgNPxT7SHNQRo0MUAxYs1uCG0j0995A/bTvJQDyMopMgqfUUa9WstfG
	G0CFSMMckxO9t5NHyUEAdb6k8SzlrjDAb54qJdAtP6epcD06KDUvtFWIq6LIieb7KkQ==
X-Gm-Gg: ATEYQzxpxdbZSaFstXo7ZIfultpROrJ++ADv7oTyPFoNVp4492AWcwT0MkJlDzDBh6l
	36aqg7k2gGgMIut6hT4IwyXIatB7yr2ZrG0TQrizZ5+0Hwj6zrV5gpjjW8G9/n+PZJCfgnOEMtj
	6uzJH5U2dm0wBREG+flaNOwwZd+Ja6Jcc9I9kRwhqVTtx2BgKNYcYUHy55VjlCaDElDg+b14CQK
	pI2V5Ia+zDft7LWKF9juersmUBFGPLsG4XqYYZlj3VSGKn9a00m9Oh7DQ0c7zV9NTefD7N9jp0j
	0H8Gzj+I1agKK3HcPNFXE81X31xpD9OIs9EOm1vslncXrmKifLFr8TOe/aXX7/0FdTmBmH2jnJz
	1dRhSTWEDqRZ0zXvZTS915ydRYEKbDcea/Zs/xW3TH2v09AXA/CFTYQPPnvUR4EHLiEVXysJU/q
	RgkBM=
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr327694085a.1.1773406345670;
        Fri, 13 Mar 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:923a:87a8 with SMTP id af79cd13be357-8cdb5a2d141mr327691985a.1.1773406345267;
        Fri, 13 Mar 2026 05:52:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc29844sm44696966b.30.2026.03.13.05.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:52:24 -0700 (PDT)
Message-ID: <4e4054e4-6e5c-4623-a03e-2fdf1277a2d8@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:52:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
 <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
 <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b4088a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=f6X2TnFsAAAA:20 a=OuZLqq7tAAAA:8 a=5Mg_qL-c0DIWtcCVzYIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 5-_49lT531mmvUoCiQSz-M87ZG89BpuP
X-Proofpoint-ORIG-GUID: 5-_49lT531mmvUoCiQSz-M87ZG89BpuP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfX8MLr/kzv4tcN
 zFWidkfSuq+tk/uEq14r79NiKbPUy4sbI8HpjuVWGgVRm+xA9eSy6TxUbessiFeyYEmaDYgx1rJ
 OOm834twP39dpaHFObr5V8U/vQLGzNjli+1lNGEA569zerGZBy0YgRPLTrhLOnT/54fzmb6vS+C
 je7anouQxY6+xBvJDpP7/KXblpI10lMmnGsTyejtB0h2kNbh4m6B5b1a71GL4tLDX2+Z2e2Kdfo
 FgWjB2Ni5RlEw+euTEGu0WaZf3f6FNwLreSGjGGz1D8qNfv8Z4C5//6Ed6ZKwY2T9j7t4WO1omt
 9jzjAXAJ4XPag1k2Rk2/W7nzG1125gNC+G8mYm5agJ1ba5R4+li6d2580M6lnHwf9c6DIU9Nn0E
 k1b/SEIHAtaurEgXWTIJV8Y7jkqYvMUtvufbtmE4Vj/LsFtMB3p2w+RLJ0Y3N7hYw+j2LoYBAbe
 fGPa2+c+jUjuVqcXBGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102

On 3/11/26 3:38 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-11 10:16, Konrad Dybcio wrote:
>> On 3/10/26 6:21 PM, Barnabás Czémán wrote:
>>> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
>>> fuel gauge, different speaker codec configuration and display.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> I see the Go has some differences in regulator configuration.
>>
>> Does the 4A's one match the existing 5A?
> Yes they are same, l22 is vana l23 is vdig for camera sensor.
> riva and rolex is using 2.8v for vana and 1.2v for vdig.
> tiare is using 2.85v for vana and 1.2 v for vdig so l22 min-voltage also should be increased
> but l23 max-voltage increase is unnecessary, there is no reason to keep downstream value there.
> 
> Here is some proof https://github.com/Mi-Thorium/kernel_devicetree_xiaomi-msm8937/blob/dts/mi8937/4.9/master/wingtech/msm8917/tiare/camera.dtsi#L16C1-L23C65

FWIW it's easiest to work with decompiled DTs, as the include chains are
often very complex. You can then throw them into ./scripts/dtx_diff or
similar

Konrad
