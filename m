Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6D450416
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515329; cv=none; b=RNmrRiRDDVTJTg/Dk5RbHc96ZdVnb6Hgq9K5Q1R9R7X0dyWMOpZ6UH0HGV7Zjc54X8tIdCmMAYUzVOLGPLtC52xYNsY0A2OEJjwFzgXPHXvzsdJJVkz4RkvVrwDnFxsF3P8alvXrTCPcWwvQ4GDD7HKMs9zyGuTnlNVpXZFpmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515329; c=relaxed/simple;
	bh=tdIckQhLNbQNSl5V3HKeuTWwIdJ326oXapW+yHipcXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKRuESlFKU2B3Bwwa4rjvNquCCRRiG3lPe/Uf76+n9A+H0peLeu6WWZQf5xbESqIudri7k7KjGW5nwz47ZZNr7I/6slifwC696b+ivtVyy10LdR2hDdh2d5sOnBnDEbFkcJbicAnV5dhe56rW5hup1dkyeyai5+tianCyDFFiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ8qIkc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij+QHXfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ8qIkc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ij+QHXfM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOc6U206235
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=; b=OZ8qIkc1cHBlefwq
	b3qjVnJ8PnTRnT34MU6TTLI1d9MoAw85if6r6CQ0NNPsGxay+j7cvZOyCdLN4hGU
	r6urCOKM+LE9QgfStgCLq2U9Q8cPMBqyavVsGP2daCwZ4ckwdHiTapyf6Hj6euWX
	8pG1Y3O3rGwW6ZsuVHCud2J6RV3aIQKvAs7mZiTij1wAdLYwrM52hCK8CMn+BZTy
	GdMnIMLjy+XL9Hg76VRNpGPraAAmswRz7/flMZYVKpTENLRFTl3MZQpHEV6fMZjr
	vhKVdXT70XhcpO63gDAfuj6oAPdwqskwSgXaevdhCojU0d/4vYUYhXvYqCQuhWuw
	KVr1mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dh9d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:28:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so2070261cf.1
        for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515326; x=1786120126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=;
        b=ij+QHXfMm3ZugorQqwNO0wvUt3HGu+157KxGKVszUKpY2lMjMTMpZrR593Ngfpadlf
         QEVdt8mrUsEjNpyg6leYkVdmLhS42kqI8CwCsLhh+ZYCsLacS/JjJjkhqx7rV5whUNRR
         HlBwe+1RIgzKKB+Fp/pGOi4+TNdcgftvSD90xk2rF7L973oV4udF6KH9qr3RoeHurBAH
         Qnt2DHsubb9/o4uJJcuqAXyeMo4N1iGPu+x09EQSS3DM1STZXVs2IYOAGu2EIqAI+pLF
         RPP+Ad6b7IrWNse2qjBCw96Bz7jWu65tBKXdYZwPgEQ0H72ZmhgVSUdI1H9XrF60TMJG
         SGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515326; x=1786120126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=;
        b=Docwjdolpavwhv0Ob17/odsRYEaq1uwj7wF9GF74UMnnH4jiX7G/+OhbI0uTvyBGnX
         LoLqIsWB246cMGwSBxW9odrKoNGhILlpjdxy3tCbNKWecXLAqHcHIjb+7ntfKfhHKAWS
         5W/ZXZoJ/aYv97V2fZpW415fGIic28I8HxbVh0BdILM2ZH2CdLXH+Y86bFCAZLzNitMZ
         79sec2p9vkn5+zQ9dekA3pDd+GOCwpnIDFhK7ZxKp/s0vsUete1Bp3lBUsISiSoosZhp
         mVcexSM8r266kHbA8DpIpghgntznt17acYqCFEaOXKQWrOw7/cEgg7DCZ4ZTeQWebiT+
         k0+A==
X-Forwarded-Encrypted: i=1; AHgh+RporFFr2RRLJetuMtoNtr8E6sx/foRdv4uEd74AQ0JGnVmw9mdoY8tCy0XgUBX78VFmqT19k8wGqN961A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2bKdwwfhFHOskODtSt1Rs3IgycrMwTpPwF1RXJn9t/yjVYypa
	fJKa00up7XAczoeDPJduIXcBVcw0t7kOGfMy1+eDdXoyjfHQyAVVBHvm6t0ELtqWn1eRCmeZ9Iu
	6LqvSeVviKNNZS2Aw0MOzPNF14IHbccc40YSVSsaDQym+Ukea7CTkjflV0wg2PBe8hA==
X-Gm-Gg: AR+sD10ua1TDvPLdY3zwxd0qjheBo9jGOiamP7rqDl5uFFnKIwDlY0HXh9WbaMSyRjL
	JBUVTWu8xK/k2paA/ZkvC65KEHNvbih+eTDvthHX5RewIkyiWCQF24XO729fBj++zU5CKOVzCi2
	U47O1gpENLVh59D2DxKMISqTcIvqh9jrDH8b/ujS0wnL1tIPVOu8f1Mz0tVamm1gIB2S6s1z6pn
	nBIIqWVr/wGVWGTba92qQnaQh03nbLsW6EGgzB56IVb9r/DYf/dhQ6LMDzVJdemCDDg2/gx5OwT
	7FuCk4PbJyl0W+ZFL/itWm0gc/QVNiS3lhPyG0h5PRF5lk9Ia61rkNxzZf6OsCDJMgtak0Ozykq
	FUkIrZe7Y/fICZjJKzyNY1DCH
X-Received: by 2002:ac8:7e81:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b567f85bamr10459831cf.3.1785515326265;
        Fri, 31 Jul 2026 09:28:46 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b567f85bamr10459421cf.3.1785515325767;
        Fri, 31 Jul 2026 09:28:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542d2sm229079466b.35.2026.07.31.09.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:28:44 -0700 (PDT)
Message-ID: <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:28:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
To: Esteban Urrutia <esteuwu@proton.me>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
 <20260731-savvy-piquant-chowchow-f516f2@quoll>
 <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
 <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
 <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QHs1LP7haOi5tMzcjLvYR7_-BYHVxMvB
X-Proofpoint-GUID: QHs1LP7haOi5tMzcjLvYR7_-BYHVxMvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX9vzqm4qXSFUf
 cV9fqyBCqfg0c9XRGzGhg6+hro+vhSgqCHyDogv9ekRH2A0+UmPPkv0a4A6iQImOWmfUNOjeX5s
 nd1h3ofERc2Vd0vZljt8zClZpNqMu5BVq8RCgC2/ZXBDWElbT8YZX2qlX3ZpFCrBXsbbO2SEtpa
 nL2UZmLVvjxD0Gbnc3q+xayHYETRwpSQrePS6CQw+6NqDj5veiIun4sGMY7W/Df/+X1sWw+aJDc
 lhG6+VWWxXZv2fGI1UL4SvOep+FX8Wd2Sa2CA2VQ6u5EQsmh5/0LIfdm2vdzYuoOBVNlK1nxi5X
 TF59oyZffxZzlUcncy9FwE2+yOqxUnwALRnFRLUlsGS56Pcmw5ywEpxGJzbsy737ht63+6cxeuA
 ipfjmEx5GB0G1M9YMrEjm+B8qPhlQNxZAR9wSsI2m98Oo21EAU2B03MqU0wS9M/fvCQ+YBK+04W
 X53iWgP9tgQZNPce4Cw==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6ccd3e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P4BrIvBfxGhJqZf7NZgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX+zHaQarHWg27
 DqD1V+T1BAHk0AAtl3x+GprKmoCTWUOKcec+QqfUzGAR+5jX6lnstevPFH0H+njiHuBaMyJ4WR3
 g6Ezwv6GfIhc2A5vrxK6X2o+0/KZLUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

On 7/31/26 5:54 PM, Esteban Urrutia wrote:
> On 7/31/26 11:30 AM, Konrad Dybcio wrote:
>> On 7/31/26 4:44 PM, Esteban Urrutia wrote:
>>> On 7/31/26 5:58 AM, Krzysztof Kozlowski wrote:
>>>> On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
>>>>> Due to a different process design, SM8475 (4 nm) SoC takes things from both
>>>>> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
>>>>
>>>> What things? This is just unspecific and not useful. And I doubt that it
>>>> is even "different process design", because how one would know that?
>>>
>>>
>>> The process design is specified on the corresponding datasheets for
>>> these SoCs, which are flying somewhere around the internet.
>>> Also [1].
>>>
>>>>> Add a separate compatible string for this SoC to avoid possible confusions.
>>>>
>>>> No, explain the hardware compatibility.
>>>>
>>>> Add foo bar, which is not compatible with baz because it uses bam bam in
>>>> different setup (difference in registers, e.g. XYZ and ABC),
>>>
>>> How does this commit message based on what was said in [1] sound to you?
>>
>> That made more sense because the electrical differences are what made
>> the PHY init sequence changes necessary. Here, Krzysztof is trying to
>> express that the pmic-glink interface found on SM8475 is likely no
>> different than the one found on SM8450 (and SM8350 and so on)
>>
>> Then, since it's the same, it can reuse the same driver match data,
>> so patch 2 is unnecessary, since the driver binds said match data
>> on the fallback "qcom,pmic-glink" compatible
> 
> 
> I don't understand. You're implying that the pmic-glink interface found
> on SM8350 and SM8450 is not that different but they both have different
> quirks on ucsi_glink.c.
> No quirks would be applied on SM8475 if patch 2 is not in place either.

Somehow I confabulated the generic compatible being present in the
driver... I was trying to explain that 

And yes I didn't notice the 8350/8450 difference. But anyway, the
resolution will be one of:

// 8450 is fully compatible
"qcom,sm8475-pmic-glink",
"qcom,sm8450-pmic-glink",
"qcom,pmic-glink"

or

// 8475 is special
"qcom,sm8475-pmic-glink",
"qcom,pmic-glink"

depending on what you believe is more correct. I think the first
one fits better.

Konrad
