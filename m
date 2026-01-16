Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C137417B
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563024; cv=none; b=SPzwxgujidvOG01i96awHEzkICBG0rzMls1AiZE74pt30N5RRgfXerqD5IW3XRH1sNvV+C774rfZFq8BEpucbLzbj9BxVuFQltFcvcYAcXvMSipKkkb7H2gf94TwpzDn3SR4f+IqDqHoCTO0o1kZl1qgWXn0kl92kRe71nN8dZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563024; c=relaxed/simple;
	bh=TQTvbgiBG+SKBmDtt/7Qz10lccsxtBeY3EJYQbt/5ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhCeLPcbLoSBFbvZOogzdH9aVOcfNveZnai2uXdWetiOJSF89gpigxnXyisRc47nUA9vpFj9U7PPE8Y81hyUPaOFd2HLWIqQznhjihoeLGanv70LEHiEhESYLosJN+GV5asWoC/aho6TzH8KdYxlgHQYMNeXERrAgmA5Y9r2df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKDM+ota; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vod1QmzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKDM+ota";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vod1QmzX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7uvhE2819062
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=; b=EKDM+otaqzpTsTFA
	a89rMF/q7ULUU7gUWmU7o9AqUkG+2q1cUlfYNuW+/2aovpB9/kNM8O7Ieoxaouex
	ihjYuB56RU2C4U19LMsDVCi+o3M1yIjJICA8GZPQy1dLNgvuETB8lar0nd+IGaA9
	4DaGbfARlhv8jY0tnLXy5Mnh5npnjDq6N/Dt7K92529MoQoqBLlRg8DeSWmgU/86
	flVAksWe7iSF+RdClH/xIE4bYJLySa1daCGBuwByR7FhodX/WVWytTsnBJhGThYW
	KfUvGNfx456A+k9ni7uXk42pngMUSxvmvsLFafUV/4YrNE/Ru8X6jGgDrNOXVR8T
	P+chMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ahydp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 11:30:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014549e7d6so6387101cf.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 03:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768563018; x=1769167818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=;
        b=Vod1QmzXu7uxSyKNXo9K7dOO5TAIM5cWG4lrmVxI/6Ym9jlkrt8MtrbjXj5CYoCcy0
         Qe/BVwrGgwtbofCfQkf8bYFIEl6f7yK5kGEyA08saczYVUPQJTffDreMLz9satv5SzQ3
         y7ZqtW70MJzBmui5VQ2ol+QML1jSaRU9o78ULpB/hKSUAhxHWSI4l38quluffybI7Mcv
         2rJCe3mDnR35nACRJf+FCOPIXQId2XcKcAmyi/9YMuS0edK6eP1zjmCD4rgr8U8rg3Z2
         L/pwIe4ua+RMiaCUZtXkREqk7H+p4NZZejqnQDTplqEwrZd/n8ouCRE6O2dMO1zBt9cR
         d0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563018; x=1769167818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09h4tPa/kI/gXdQi3NlmGSOnFal6CqO9SCpG9ObzGqg=;
        b=F8JH5R4Y1+5opiksy/AXQ1mIUI5WVhjOO/czG6NIPtCWtCJ+fv0wVHD6Uiaysq6hTh
         rSdES8bZtc4Wc5PWCITBdIdpMmX5wWzC5pPEZLYBsZJW9Que1jC1Iz0Vz80p0sD1VOLw
         rG5nqd7by47k13J75q5sf/sHyr9/BBc9iu0UsM3K5rtVzT+UMASuUC7aZSbVg5f6C83b
         X2ZZGO6OIRus8WZ3AIvFUuASYImVvLiRqD4eYNLKV5nnuK7nZMvs2BEqDsrfiwcntoqS
         8xGvWOAgMH2MPBH3D0VyKtkC1p+Bc9InYKnCc+Fip4zepb3BqfAxYTW8RHP+tjyLQOa2
         xEZw==
X-Forwarded-Encrypted: i=1; AJvYcCWBcwJsqW7R0zYhJJe47d92b4AbmrttH0drkx3Ad1AXhlx6c0CC7MBfYEFarG7EPrl6/trFLUJHLbvfTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1krhEdZoCU8qR/Zyq1PCQsBfZlk3x3aEhMdLPALvqDoQ3gQj
	uxrssYY3fy0ol4CLahUgLglx0afApRJ8j7HOJiVf9QLDu6WfKx9YN/D4b4uK8HEKPp9+ScrH/S4
	21XNFSnffT9XmBT5YDU3uGBoA8zRaMvQOmPZEdbwQMz4k7RxrteKwvFK7pLbM+DcUog==
X-Gm-Gg: AY/fxX62bIh2zeDwQ7W2xfmyLzgt1TfkhJxDvMjS393+0vAFCQNZLXnu2SaIjuVq4S5
	IjjLfJriwwlPUl/0pbkIcshKcvkUocNyL+F9+vG7RDYMQMgE0taW4FBC12IfgX7wayIihqly6Yd
	ULcLsr3JN45WIHRvsN4imS2NoC+JxbpEe1jDbE5zcvOrnfR762AGT4+DfBvYa2r1H3fWuQ+CyH2
	2eJc8qYH3HMEwhg8ftYpaS4rdSvf4r/qaJ2jMXaVW3uFKb9UAEeE+qJhkhKfYxZfzwNLfhzYszz
	UFzMZBtMq2BmYr1VXguHpQDp1JrpMhHRmdglvtkrq7sZKVifR+MEyWxojhqVUqGHzQvYHuG+XKR
	HuT36CRPHB0AtpRTddw/5i5Y7lF4FHkyzUoy7iwZtysAJm9/UZ7qyMeYVtnzy6+1omY0=
X-Received: by 2002:a05:622a:1794:b0:501:4767:a6f with SMTP id d75a77b69052e-502a16043c2mr26336831cf.3.1768563017766;
        Fri, 16 Jan 2026 03:30:17 -0800 (PST)
X-Received: by 2002:a05:622a:1794:b0:501:4767:a6f with SMTP id d75a77b69052e-502a16043c2mr26336231cf.3.1768563017270;
        Fri, 16 Jan 2026 03:30:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513ed07sm226392566b.3.2026.01.16.03.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 03:30:16 -0800 (PST)
Message-ID: <42a0e768-c217-44b2-81ba-1237d9f983f9@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:30:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: David Heidelberg <david@ixit.cz>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
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
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
 <ff4d697c-2007-4b2a-b66b-dc86053a20a6@oss.qualcomm.com>
 <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
 <e0f33ac2-331f-4ab4-a960-6bd8bcac7306@oss.qualcomm.com>
 <d90872ae-968f-4340-8348-aa83de92a3de@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d90872ae-968f-4340-8348-aa83de92a3de@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fQD2rrnqBU383kM8xDRQHu60CgzVXlwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MyBTYWx0ZWRfX+zO3Ja/mJ+Na
 U7F/+CC34XRvjhKzM/wSXjCGVhDYmRP5io6aZUTrRPo78OMl8PyStWBRZjg6DASqA85m2YJ+c+M
 JxUY+HguQ4Ch6+7595DP7Nfj3TztyE01A/TcD4MSeWo8aYYeeLlsZ1AMbA8EO/i3V3FM82hmuAR
 Er64nyPlJFZSroEFRc5DM1/NjumqcWvGdqX+iEvehilmnZiiR3S0xzzYN6hCYSDesZuX0tDgWpc
 TAL/bzbIIwaOF3MaKZeP55ajbXq+Fj7+5+CgriHg029s4RiKq8yxgbYdimHTuG/OTjyVt1qKx5Y
 nC1VgJ1+FSYObmeWz9q4u2IX6JwZs64t9HkZzGkDJmcZ/ygLkK8LbecgRJIc/KuEEdUKIGpcKUs
 xh8B6+77dhUzchN1Tdszp38L0l4/sglgqWaNm8JEPq9VVd2/1pc7uoegVDmkmDnABXhRtSSb73Q
 7NTLhnET5LLPT4KiAqw==
X-Proofpoint-GUID: fQD2rrnqBU383kM8xDRQHu60CgzVXlwS
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a214a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=WKeohOAsuF05E7y8TmsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160083

On 1/16/26 12:21 PM, David Heidelberg wrote:
> On 16/01/2026 10:52, Konrad Dybcio wrote:
>> On 1/14/26 10:55 PM, David Heidelberg wrote:
>>> On 14/01/2026 11:28, Konrad Dybcio wrote:
>>>> On 1/14/26 11:15 AM, David Heidelberg wrote:
>>>>> On 12/01/2026 21:13, BarnabÃ¡s CzÃ©mÃ¡n wrote:
>>>>>> The device was crashing on high memory load because the reserved memory
>>>>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>>>>> Change the ramoops memory range to match with the values from the recovery
>>>>>> to be able to get the results from the device.
>>>>>>
>>>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> Hello!
>>>>>
>>>>> I suggest one more nice to have improvement:
>>>>>
>>>>> you could label framebuffer cont_splash_mem since you already touching the node and testing the series.
>>>>>
>>>>> Then in additional commit, you can replace manually defined `reg` in chosen > framebuffer node with
>>>>>
>>>>> memory-region = <&cont_splash_mem>;
>>>>>
>>>>> For example you can look at sdm845-oneplus-common.dtsi
>>>>>
>>>>> Tell me what u think
>>>>
>>>> If you wanna do that, please call it framebuffer_mem, "cont_splash" is a
>>>> Qualcomm-specific name for (roughly) flicker-free bootup
>>>
>>> I have feeling someone recommended me to stick with cont_splash_mem.
>>>
>>> I think, since we'll be doing the mdss reset anyway in sdm845 (which I used as an example), I can do the rename in our sdm845 too then without any harm? (no it's not flicker-free takeover :D )
>>
>> It's not flicker-free because the OS must cooperate in that process,
>> whereas we currently reset and re-initialize the entire display subsystem
> 
> Sure.
> 
> Previously I was thinking, that after doing proper panel driver with proper initialization sequences etc. etc., we could have device-tree property such as "linux,takeover-from-bootloader", where we could skip mdss reset, panel reset and just continue from the point what bootloader set (for devices where bootloader does the right job).

I don't think there's a need for a separate property. Once MDSS is
powered on, various registers could be read back and the state could be
largely inferred from there.

It just comes with an infinite amount of edge cases and it's not top
priority for now, I don't think

Konrad
