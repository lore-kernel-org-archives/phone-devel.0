Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338219CD0B
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690294; cv=none; b=Ihg3sR0sLvHIaAXNqrIuS0BYxOHZcHsFmwxjIfnhk/UrdZMzpIFOX6lZWlFtPXaL3qqKSHV0Lo19nu3bLGSGVw1f0eOsYT/UJZj0lqyC/rlCd2tfsoGNFMEJS5XksReB+JloAsTzV3PHguj7lmeJZbfH3aWerwlrYUkesVsKypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690294; c=relaxed/simple;
	bh=zRmzez14Q8uePLJ3L4CKjWqTX0r8E0d2mwlKujEpwic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C98j5hxY5ct/KCvLzko1SOoxlPdvQfMQ4ofcJZQZuGLdCONlJjOMsd54xHqBoQHmaffKSVnuNHgBejFVPtLdTo6+RoJc0NCw4fPLZ02i9mIipHC6dIHFrv/WVEcBnJiDI+LHuxqAmpU9NTldSnooKRJyVN5XR/KYSM33/93iyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TV8wi9OE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV8wi9OE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBr3mK029879
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 14:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUh+2DQfUB1PNyecxMnx9SxZiBcDBwza+kyMM7WfB5Y=; b=TV8wi9OECocW/REu
	cWSGTeWehvwSUzh7GV/zAv6PtD+aIwLODoi1hJlxWH0TKb2gaGSZTBlcr8wef5GY
	K6mTQ1CVCHlfJ6j3KaG/40ixWcU8xevYJ44zqq5dhRd8IOswVUAmQjyR7YIUXRrJ
	bqbrxnVcRUtNBqeG3qz/rPhezB/hHJJWqMM2rrqe/Mt9pkpieoTJckVkxVJCWPjn
	Ws16BawcuRLPxytxFHh0QaIb39P2Rk//rGvaUlVSEZaMQ8zPqzk4L1uZPgZ4sq6/
	31T9L4elApDl5f6EYx6kzHtapz5Xh48ECkV07MSUaCW6Xx6Q5Q5J3x9NIPjSL2WX
	0BftZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1t7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 14:51:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso108066185a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 07:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690290; x=1751295090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUh+2DQfUB1PNyecxMnx9SxZiBcDBwza+kyMM7WfB5Y=;
        b=g/WTrIIzYaF4FG5uvVlrQiD5z/Tu/tjvcOeyFs0VBo3nWTrwTCQ6J7zC+fEv3Bl+dP
         uwsPUvbzi6SV6420RBHUZvYtxOWFOagR3ZLHVmqGU9Lysq9dEiy4uz7pLdpKTEC6o0Ec
         aLu8oy/Iv27sr54lMDo4YW3ccIuXyjRlWYHNV+N1y8H4DZGGZInBT4vr5bEO3TT+BBu0
         fo4RUK0CvIs93Yj8b/FUEwudHBNpn7nwnpDPc97r80F1fYzZjSRRXn/V5etVZjwZPLqc
         /Q8twJxPXp9orITVH8HC61zTnDpzrqzmoqNwg9bAgXUMrukw++y65ldY+VJoxAuXhTeU
         SSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXGqcuOTWeXqS5Iuu0i8pTBZQJ7lxZDoNhq6cm3YAWjGHwMZMEC6ukKAZQrm0P4oXz/lZBdgxrns4rgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIWKRHWY25SvQd86yzX9dSX1Ml/Aof64FvISoVjnmwY6NBc2F
	qvWHnpNt9UyswfWo3iWJ5csjHtRKma50exS6RYgGsdk01iChM/N+8EqkMcYiecOAEeNq3B9FauW
	YNsV/H3Sv9PJkZRnKAmojVwa3gm3t4ssbrdZsACj4d0BufHKHWuljXn4y95nrdv6zNjzGZq4bEQ
	==
X-Gm-Gg: ASbGncs8qNuCL/ngZDklAaiey/r3Ca90w5DXcpogAZSxkqeiKf7GgjQIVcz7qUGG478
	YAKGIzwrfLxt6Z3qkPxUyfxw4UZ5gEpsSn/QIpKzmw1P8NYzy10p3H6b6q1uDwljGKcSOIbC4nb
	HwihR0nBMWBh5nUpVSi6DNTa12qVOUhKble2GEw7hQy820arWhjBu1svaGbn4QMO+fdNYNygxb8
	jE/4kKbZEYte0HT3l+hJTsvw0gK210VQwH+WmN3JurLkKVLz1cfhJeKLqcSWfkAsa1NxbNEKjr8
	dlZNnDzBhoWqsveDTKxsLmc6NLsN+a5lxqy6FTjQcwES4O1lZE2AntcffdTv7nSdjjI6r2mPf9C
	Pk3c=
X-Received: by 2002:a05:620a:f02:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d3f991e683mr650814285a.9.1750690290314;
        Mon, 23 Jun 2025 07:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeRbjwyAk9ZnxdjVR+ztXT7T4QHUFREQAUwKk0CQHe5tEcFnckPNFWjGRkQcD3IT8jTYP2Zg==
X-Received: by 2002:a05:620a:f02:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d3f991e683mr650812085a.9.1750690289889;
        Mon, 23 Jun 2025 07:51:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05433aa56sm720624166b.183.2025.06.23.07.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:51:29 -0700 (PDT)
Message-ID: <2aed1a50-7ad3-4e6c-a8e7-c8b24a66d6f9@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:51:27 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
 <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com>
 <92f1d1c1-e62d-4f77-b55d-110d8ad56a06@oss.qualcomm.com>
 <K0VOX_o4DQFENShBki5YS11cHp90jAhtOYFT62ycGgps8JLh6a_SyDqoXyVaPhMADabNwpGyn1px_sAgxeMCJFNSDjyagcqk6DrNh9AECE8=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <K0VOX_o4DQFENShBki5YS11cHp90jAhtOYFT62ycGgps8JLh6a_SyDqoXyVaPhMADabNwpGyn1px_sAgxeMCJFNSDjyagcqk6DrNh9AECE8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=685969f3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xsC4XkDQC8VCkiu0ezIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5uEM_GeDsoj7SkQAV7mxsevaezIeh3pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OSBTYWx0ZWRfX6M6RHRXgwMbz
 kavLpiCqC2LfQAnM5DMaK1jRt3OrZtwUnGEYnBEiAYppW3ANU+c8pAFvtRZ89SHi4M5mo+lYgtB
 I7NrxG9SfCD129HMWwKbr0Mi9XrzvSUj6/T9deoZSGfMlauG+IkXgA37DuWUS+D4e6JZKV5Y+Zv
 826oIkk1ldpp/LGvm4jQfizy+LviZs9f1fTNd9/yz7BWQHcf9/+vBGTF+tYVr4SdBWaK/dT4ro5
 tQCCObNfeIAQe315yFzAfWGb86+yYllzdMCY0N+xyfuEY9zCXd/LPqrnA6xsVdfBjSXt0YUlmNf
 vXxf4lK+aWvAJZggCF1/5iOglfgCudvKHrSFfZtxmVkGZw4O8WtVM2ZZo8PiLdnx4fxWaZVfRZg
 lt1Mvv/J+kXj4h3laHvoa6z8NbIwlDQ7+QcDcbgfstMg7XoQfM1OusbuH18nUtrpsb/DW7yU
X-Proofpoint-GUID: 5uEM_GeDsoj7SkQAV7mxsevaezIeh3pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=837 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230089

On 6/23/25 4:49 PM, cristian_ci wrote:
> On Monday, June 23rd, 2025 at 12:11, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 6/21/25 9:31 PM, cristian_ci wrote:
>>
>>> On Saturday, June 21st, 2025 at 12:17, Konrad Dybcio konrad.dybcio@oss.qualcomm.com wrote:
>>>
>>>>> +
>>>>> +&sdhc_1 {
>>>>> + vmmc-supply = <&pm8953_l8>;
>>>>> + vqmmc-supply = <&pm8953_l5>;
>>>>
>>>> you should add regulator-allow-set-load to these vregs
>>>
>>> So, do you mean I should add 'regulator-allow-set-load' property to 'pm8953_l5' and 'pm8953_l8' regulators? If so, should I do that for 'pm8953_l11' and 'pm8953_l12' regulators too (sdhc_2)?
>>
>>
>> Yes
>>
> 
> ACK, I'll do that in v2. BTW, since I've not such references in my downstream devicetree, IIUC what you mean, 'regulator-allow-set-load' property is now required in mainline for regulators supplying sdhc_{1|2}.

The sdhci driver calls regulator_set_load(), which requires that property

> Also considering I've transferred every value _as_is_ (except for max and min microvolt values ​​of one regulator - after the kernel log complained ​about ​that) for regulators/rpm_requests from downstream
> devicetree to mainline devicetree, since other msm8953 devicetrees seem to share the same situation of 'rimob' (I'm referring to
> 'potter', 'daisy', 'mido', 'tissot' and 'vince'), I wonder if it's not the case to standardize all these devicetrees in the same way. Any thoughts?

We've been there before, it's all good until one device stands out, and
then another, and then another..

Konrad
