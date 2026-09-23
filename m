Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64140522696
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168662; cv=none; b=BsCUQkGyK0Jb40NGSz3RyJgxo60a3dtff1nlbLKG3WVG0SRxtmHBdJ9Sh6U+0xPm3Gy6xmvBwLMhUYPaN+SAtyikMg8us2/DcUWo3XozjPhbGTUFAvUjcne2gaMul1IV/RprD/pN5JK1YbQx7VJWzFrQS4RhggDSDp/4ZdsIuSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168662; c=relaxed/simple;
	bh=jAtUvHOL+UcHTw/1yuGYltepxe1MNq2D2AIdAMygYQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAiDG89T3pbUvr9qb2jM6EL5A7QQuDtScSyVyQKQzKOvcsknhPSd5btAI30v47520z53GvOJdXUW8Dr0yUo163XVc4LEAtDUwQ43/uvxFQ+8yL4OGHwn0Sx+g28m/wY0nWUAqpmk+1anZfd20rs08vs495lK+J2VLc9Zh4/YJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7z4xXkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEWjqfy2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7z4xXkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEWjqfy2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbn66100094
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=; b=k7z4xXkA/SZHfuhi
	vn9NYJh5Ahaxe+BXAwR8yjRZxLP4fJO9sswA51eQ1aMyN+KVgWKNMCTe9cfipXJG
	47EY/ccDUuzZ3MMae9a9+i1GRZS2jCa2UuGzOFaTEbKdusyM7JRGBiw78iQkBXrI
	Pj8hu5w1nBwa8GbTiBG0JBFKT3vDC4O0f1lQediXz8QuH8yUMXe/ZkDfyn+Pzzy0
	n/KZk7UWuwkQ0pwQ4PJMqJ25CL1sxzflSMYIQokDuC2W0cCLyn45pZGZs0QdKASh
	oV2Je+ZQvUeM6I+bo6xZ+NOQB+tJByfXS2u/YXRewmqRno/S5O11x+NSHRZJPZeI
	6AHVtA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c4f8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4bb82497a04so99356b6e.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168660; x=1790773460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=kEWjqfy2G6PvHxPaetag+A1fHiHfnVsS2QSSlwbx0N2I4THTv/wBirtJDvRMuIBICA
         ldABZBPPamygRBT4sGsAEfJBc91IFpGHJ6RENSb1DtaPoP3TIi94mm5bNUr+dcnT5NNm
         1C7/NjyVYIWKCdVkTOH3Q2kACIsfX+p94mHi9pj2gEORLwLV2MzsrRrpJMK+KA20u3U1
         lP1fF6Ry4Wqhj90dU7kZZ/CGO39Fcbm044hQslITRjZJ5K1tyHyEK52bs7sC+Zip0LLZ
         r6O8im6jmd+DsZyJLMmSUKx0Pt448DvVPV0aHeRK8q8I9ODN9PtkcNtASqo10Qpjl/2n
         zjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168660; x=1790773460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=Arf8+czwro9LX71ozbH4M54ca8Oy2oI4el6Z6KQ4t3JJqy0KHNRb79c06WWh6YxukN
         lZTz5gYA2tNiN1KqM713qnxuXm2EEMjQLkF1dmAuJBkF1b+LpUtuLJ9zPo9o40ZZnYhV
         yYCrSWdOxEJwzJH441mq8TbCd/sGJ6xmU524EUT+MY7Apyvj5nN4+jcX1YZty3SjsiGP
         ijCxYv3mJQtwiWesUWowdziUMidUf5XS2J7sg/TUhzJD5Mj8QqeGDvPpy3OpZB6/oMus
         qXyHJc6n40RDtNgjdYWVx0gD2QrLWN1wRMS4Q45R+tYqpJskfTKED912KNSsmIt0pSLf
         TP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAEJYSkL/HLA+2tp27YSgcL1qj0VnUiy++Ts5morGmAGFR/HJqNvk5DN/YACJJtZp+nSXzNeSWx58Cvg==@vger.kernel.org
X-Gm-Message-State: AFuF++lQCw9KtnXczYllWXnrZ7SEMdB8i4/E/IKa/Y+NDlmY8+O1/ECo
	c8JR/lt1CzzpbDQyGyevS7YZxJmnUWpUjdDmgBJWiJfadxZt1riG/KRh7Jedz7gVnoJWfimuvpO
	r4AkR069yR012FHwSqbr6Vy0FCOaW/cAjkMRHDTcbu1z6P7/1NQodK7kXKdGL9GX8+w==
X-Gm-Gg: AYBFou3Cz4eb39cbMTbXSajo/fesBr5c9V83JYCh8/qU2ARaiIhJITc2vrdWUrnw4A6
	ErWAuoxBI4ZrtIHK59V/sQbzLW5VugEjQ8AzvzR7g0KaJuNuTB+x6CzbkjIl99spNPHBaut7rkX
	cw2CnOZP81e3lC7DfyJG/PCSz1IYgkUCB2tBXqFMV/sFc18omaen+7nV1bjVLnwfIsSGA6/tg72
	jtqIk1zRcw7c8xIH5ooO/ax0zYKPq2G5KuhO+DyzwIqT/1RkiWocMtqQxwXkrUiKXGLV0rUhiKX
	+IcNOm8gTTrAxcntf5MeGlGzi7dheUriIwNvb9u3qdpE5BqTF0O7xpeanU+rSOL/akPQEYJs1Oi
	AqxOULZrblFRLokosIpQLSsgIV4hjnyl0
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350296b6e.3.1790168659776;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350248b6e.3.1790168659264;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115627866b.31.2026.09.23.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:04:18 -0700 (PDT)
Message-ID: <ab94b4e8-7de5-40ba-9306-03c4fb18fcea@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:04:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
 <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX/SecykwQtXdx
 pyOHMdb+xJVUhIWfO0L+TxD/RHsOYoeEJ3+bfjRHpBW8eYr6Bba43rIVyxE6bFcNkSzbrm0ghDD
 59h8WM3sahcOmbdJhBL4npUpQV4DYaRF/egHs7tSv6Q4VBOToG1w9qq9WXWyvW7u/sqAdIGyUdD
 jIJnyoc95UQDEouZhINwgQe+aMma6yrkL9YoSuwl+tAtAXftaTfRkgL+bsDSzhDsV0h4RFljCN4
 9KYUalCJoQVZvyp3cTezy308+xHJFO7BkD8TEdbmyVdPNfLBWz2vfyLuPnLQz+1wB2k65T21RUU
 rkasRqjrbvohGIz4tpZp+DZt0gqcZVS99hLXid9cXU4xYR4vexqOnlto+SAak8NUuHMzAq7Wbzy
 bzJtZUtHb7k9Z0y5Q1ZIQmfjc+4A/HNRu5BNEJtWCJXx6QAq963p0brfC9S81Ed4T+VQUCa03cb
 08z4o05bijho7lhrtPQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3ce54 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=80cRBlfBHqb0UARuMZ4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: sGYsv99YVy-38xpgsItmvEzVzIMOSwQK
X-Proofpoint-GUID: sGYsv99YVy-38xpgsItmvEzVzIMOSwQK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX0Q02huP8ux6P
 8W0guca6BfP0LHuMRvRXzxYRjh54hYUMN7ks5YwQFHrdXbuEPeZ9o2ZDvaKABC+lGxmmUN4Adaj
 pGkG1WvDWFPDFdWOOna7970i/RQxZmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:02 PM, David Heidelberg wrote:
> On 06/07/2026 14:00, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.

[...]

>> nit: 'co'dec < 'cp'u < 'p'latform
>>
>> also 'c's35l36-dai-link < `m`m1-dai-link
> 
> ... aaaand **sorting nodes** broke audio.
> 
> Moving `mm1-dai-link` behind `cs35l36-dai-link` broke the audio.
> 
> For now I'm keeping m1-dai-link at the begging and added the comment why is it there, but I guess would be nice to have this solved properly.

OK. But please take a look at what GPT told you below (I'm in no
position to suggest what is best) since the automatic style checker
will probably be deployed at some point and may mess with this..

Konrad
