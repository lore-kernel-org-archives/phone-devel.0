Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6EC40DFB1
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150078; cv=none; b=lG6Rqm7NpF4YCt0xbmoDpEbuh1gD7ZL14r3tXIRApnZItz74VdkHYQmiai5+1As7USKDQOH9NIdPezOI/acG6mYwzLigOcxZ9bO57w+wPyGOAmhTuUykH4h7mi+QKMzFNQ5r661VdRMqVpBekRD8ULz1MXGZtOOahpNl5OsQQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150078; c=relaxed/simple;
	bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENGusgFd9ITnHGB5MRGu3VLoX5t2u/q86OOLAU3U7U4aQdqFrQypPKar8NXfYtJLd8jm+czWUqqPW3Jk/nr3aj2OyoJOE/LzqDVFDMWHJBfoqgAdCJuRuaDqFk46gIhsuTFLAhEOlKU6tJYnw8NhHDcnersAGAlCbl25ffSbHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgsIsnZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FE676n9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgsIsnZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FE676n9/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACamYm964164
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=; b=KgsIsnZ66wvp0i7h
	yMm/6WZCQ0gtSgzSPf0D/FHx+giZn3kulbmrM2QKK7AoXq3dD7qb8+G+LqLHJZEn
	WQi6moMDMvf/jdJjGeqOx6U9gfOSvYJKgrMDLNGwW4fHpqG8oueIjUzv/XxFk/kU
	o8ZvD5sl+7vwpC7S/ByfzCQteKZzoTqayZpjzRb6hnKbABI6wLWXPSbVNZ5xCOam
	2eVSpxsTKd1TLuLtn9Mofe1jgYsnYv8HwnTt/z1Rjb/ldqL4mM9PAwdGV3ugoxbM
	JQQzSkzOLJLxTTi5288IjMayl2AdL6GQ+mP+LSz+aT6ERKV5gQQhCXEQ4b6mI2YL
	VjBO1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477kdjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:41:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso782729585a.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150074; x=1773754874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
        b=FE676n9/TvsfUbQJD4ZMpgUgD/69i8TGLo5havLv+Mu4/qEWb+9gH4TBjLlWJcz8wP
         eFkYCTp28eWMhye2u8ePl4s/OU+4Pqs7rpaN7E/71e8PPi2lnP84Ciiy0lv6XCR701lq
         KDsExXirXF8tcNLxkdA6jregMiuTcai5cn/Wx7xwGyOAeiDbf6WpG30GR0fGlHGG8wbK
         rCcpr/ionZM7D3LrbUiJAa/rX568hUQSHmmUHbZZkBo/npJFqjjw4N0sy8UJj0Ar6+iC
         JRBRPa0bI/woMg+Tet0O7pVQq4fODGBRUlsBvMkPw0Qg1B7q3cPySaqx5CCOfIACVCLR
         gBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150074; x=1773754874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/lj6B8seo20eJVoikHZMdPOJJq4TtVmvM/xqVoEKIM=;
        b=ZYOSrsVXpD97JoU/qgvmlwJ9v+Kk+pUJ7zxEsKirN8rcHq3zX/lSt1/a69GnL2s1h/
         UM3Vy6jBAfSiZFibC5tBxPPZd7p2+EloYoduOriWHW4Rdhscq8xSsLnfxJ/ePqFMzLAI
         soGLt5FMA48OZRIRbqCCl1UdFJYiZrUUUGlACaeZ4jZPwT560M8CGo5w0J/AVbQm6bCR
         P0O26+nftXMT7MBU4QLqvPpX2ADwNilBcNG8GsDFNSVH7NggkvfzQR0aNHVyLp6hVrCR
         xJ5i+/e4fmmNPo5Q2fwoFkwG+Ydhrc7M2yVtoOA8RyIYRd4zTPrB0Ju3MPBBLYaecfcp
         3wrA==
X-Forwarded-Encrypted: i=1; AJvYcCXwmwJ2Bh1Lh4wrShw0nERHWe4XpC1zPGETC1dGngQW28IEXBRYBbtK3LK7trgi0he2u7HZSCzhdmxqTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyViF4aYj6o1O/wUiH/8oBi9nLRd3pJB6KQZJ2sbAb6WNTvH9E3
	UEi7iGoBHRNkSeTYVVjpnMAbU2tfXnrlVVOeik72qgtzIjxXYHB8Foytj/SoWLz81cgsiTKRKZu
	Cxz0bs1uK+PZE97lvQTpbevPv6O1mQ7BFf5YMEnso6NZKjG27N5EUToo4mAELMaBL2Q==
X-Gm-Gg: ATEYQzxZ4cnFUcy8x92c17NqN4VuUgEiVoj/1R4h2MoWetIIrs0ZrMQMsKBYzPgdLDw
	Cf0aS2B7KuOUKNt+v9aOHInHJFSDlC6MnUrqVQyGQZsPj1j1C3+u3XulmyuJzIKPBRB1YeWXYdV
	EHCRUg/JepmWiyNKENd01IKW9i6oTBOC4qFydhkZcrlhu1D5mw3qTPQHfl7JzcHAg8bYdHyGkOC
	numq5hJYbqDy4QfxasCOuS9SIIomMXc43W9jB5OYlbcpdMZUXKWjwKrAHfQ8gUXiSwIE7MbIfPF
	8QbK09ecYoeqi33onz1qCCROcYS+F0SKZLnti+HIUukwH/lum8Knh/PXcU/eBLbC2rO3+l4Ps2X
	tHOYx8vdwyuPY6avqrydcH6xsEPplWoEIWHjk3wiHTKc7kqRzwqggoKEj8H1RpN4gDOZUdQX7jV
	y1BJQ=
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1494496485a.5.1773150074480;
        Tue, 10 Mar 2026 06:41:14 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1494492485a.5.1773150074051;
        Tue, 10 Mar 2026 06:41:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94351894bfsm468701766b.1.2026.03.10.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:41:13 -0700 (PDT)
Message-ID: <e878d01a-036f-444a-82ab-b823d7aa7525@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:41:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
 <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
 <6665244d82ee8776826a7f6a4e64af99@mainlining.org>
 <a9658d1f-556e-4a58-828c-1d97e227dfd0@oss.qualcomm.com>
 <70ad0b19dbeee89c04c17a0618a9cecc@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70ad0b19dbeee89c04c17a0618a9cecc@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfXyuJIhpyDSFX+
 g4JIl4U1PbpgvTdK92LFKJL1h9YVXg6ldu7mVDFM9Cy/N3yxVt7iDeYyKDTIXx4nPL+OxIbfsPs
 T9irgqCPQGVNmeIaA+wqM3X5ulXs0EMmvGuZxpU7+TwVkZWVXPsyrCG96IH49t3xeUi8tDPsCLh
 bUEFtlDnr5RfZicevxaRGXk/hC+g52zOj+0TonFwm6xoSswtn7B1PqS1kq+vGQnfvXngEz+P0+z
 uL2QVZTTARW1oUwhQX/waeWKDXm08vPoMrypVbqHy3Kz9UhKO0cPlge5rkTfJ6gk6ZALNw9bt05
 J2SPsShgzUMEk59AKsAajHiNaGE7pSN7FxB7+zNMrFTKAFQOazYjesRPulMlFor/mz9F2uO07m2
 3KVccPeRNWv1Ccc4j/zL6IyZryRNyEf+mdvLGV/GGlkzpN6bzbDgjKssCoPdipySH8Ae10dLZgA
 ouHF62QvpMh6M2byqdA==
X-Proofpoint-GUID: 09s6OWUipW9bElKBqUjn3g8K4r_xO5IV
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b01f7b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=fr_QDkp6JkS4JuZzObsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 09s6OWUipW9bElKBqUjn3g8K4r_xO5IV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100119

On 3/10/26 2:26 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-10 14:21, Konrad Dybcio wrote:
>> On 3/10/26 2:11 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-03-10 14:04, Konrad Dybcio wrote:
>>>> On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
>>>>> On 2026-03-09 13:55, Konrad Dybcio wrote:
>>>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>>>>>> it can be commonized for avoid unnecessary code duplications.
>>>>>>>
>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>> ---
>>>>>>
>>>>>> Could you please try adding the following to your gitconfig:
>>>>>>
>>>>>> [diff]
>>>>>>         renameLimit = 999999
>>>>>>         algorithm = histogram # or 'copies'
>>>>>>         renames = copies
>>>>>>
>>>>>> and see if this generates a shorter diff?
>>>>>>
>>>>>> Konrad
>>>>> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
>>>>> they are wingtech devices. Which naming is preferred?
>>>>
>>>> I think xiaomi-riva is easier for people to associate with a phone
>>>> they may have in their drawer than wingtech-s88503
>>> What about renaming just the common part to msm8917-wingtech-common?
>>
>> I think it adds more confusion without much benefit. Probably none
>> of these devices have been released without a Mi logo on the back.
> Yes but riva codename is related to Redmi 5A and naming as msm8917-xiaomi-common
> could cause confusion later when i would send Redmi Note 5A (ugglite) what is
> none wingtech device and have much more difference.

Well, you never mentioned that!

perhaps msm8917-xiaomi-wingtech.dtsi then?

Konrad
