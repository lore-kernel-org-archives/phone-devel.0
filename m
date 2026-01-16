Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1212135CBC4
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557214; cv=none; b=Y8fCwMUwdFl/q/qgCIN6vGE/p3eAG3d4qSMplnyw+BBruSjogOw0yrq8MP3HjrxsheNQmU2i20UcrdPYNHDgL4kBK0p2jivV90WXZIJgulJ4KuNpcg3Tmjp9EYhj4wAz/zLcknzS2hdu63fu3hwizaCQIG6N/M6kFp3ZPK0RBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557214; c=relaxed/simple;
	bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRvbEPu1/5cdlPEYv/EcMq5hfrtzVHgjF6k1js+0Brq5TSZh+lYjec8Os71EubSRlOUvdsK7mED+FTvOXdLwqSUXzB0GWLRGecbqDLHTT3U2onZfhCDmz/qLyXyigKrXqEIQZq7hc6KaBowrPRQkw4WTuixaUsQ1vZSVkgbh6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5jf/a/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eENforfE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5jf/a/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eENforfE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7vJHn2818797
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=; b=A5jf/a/I2XLuaGCe
	bFCOwQBJZnToyShg+U/cuxvuk9dgwGjSeYf8fnqr0P1w2A/gB0bSRwCyOdB4GI+h
	wOAMzhB4V39F3/FYpidkFqlCzgtYmS+O+lru7OKBa1EzTdwOepYVh/MNQo1WTqgY
	2Io1NgPKC5kjJJRf70UYt5r828hTmOTaGjZI+mmtxrNTgN74n7DUwEt9mwq36+ha
	wswOuwd1WyM44DI0elJuAJNt29XP18KzJ+G320GFBlumR4U+L95HyfljYIV69sur
	6R8r/n5h9aMogbqX5D7vua0tD8zzofL1JC+qQ0IWJm02VV7dcBwYuJ4AbRnW1TjM
	6P5rZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ahpup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:53:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014549e7d6so6150231cf.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 01:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557208; x=1769162008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
        b=eENforfEAgCmTD2cBL44PxuFbo4v2DbVWM2a32Lwg3PHKcLqalpj+Bhr0Rpa6D2FUd
         k3SkejC9YJ7FLYvd5l5Hsb1S59kc2WMwALLAHY5uJzyh/q1P0IVP21K6g/qdISCSAVEE
         jH8lSWHOgLFXaE+ktK5zEmKGsWG0JBAO2OMPzs7y/8dZz19EUUJELydNOVoslbJXHAEJ
         NoGiSXwkJATus+7/FTbLTRWMtdF/jhNVczSNXurKfhFtdZ5NySzmjf26YIEXx7tkeZjL
         /2XaHh5dvhpqWLpB68sc3pMlPq/MojBFrorvMQuBJHlvDBRwE9nYFxFOUkWO0LHYrpeX
         fSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557208; x=1769162008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge6ghaPRiNit0+4pAgxtBDe6NbdialyVuuknLaBpZBA=;
        b=dIoLi7tDijQ+ApgpqxSYczXFl+YXr/g43y1GPqSZeeDunWdm5FjNjsCGKiNUDsxORj
         RdSULEAaV/V8Jw4GcsdbRxNDvTRjRAn5XaTwBpL7vIzGY1J4zK8VEoUus+Qjs4jAbsoa
         IydIWN9XmGFzGZs58Rs8o9v1s+xeDqd2gAOEhTTTDQvgNpXxzwiOTi9NxvKO2jVsN//9
         9rWlp/1W+oLMPwW8a4xfaqcJGykXqdz2tnRgjYN64O0CTZC9Y7PZHr+eYc2VvIKu5QXy
         JghFa7efrJhpLdQN5ebgc1p7Ogwx0aYUfCexyGkAYjpjrfoR79wWtzfIkvlPONPdPY0i
         FK/w==
X-Forwarded-Encrypted: i=1; AJvYcCXCobKba6DPqcD2iPxND8s+0c1EiUfYsAUNJ4JXHDJrG/swNZjVRKYufajSAoLCmLs9FYMajtobGwQmww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2wfVlowLcFHPveAuTAfIoZyU0oN5/l7zSy6rS8qtFvEo/1wM2
	SDPNX82E8Xm3ump4Q3HtOrNXg/KhOnR9N7Xe5cRhEtsse2CLjoolWzxaCOa7PMfLsDLnnwONpJd
	u/P4DvkzQiAkXpB+LB9zXnOfnOgL90tejOh3cw79tDnd1noCtfbvBwD59Kpe8S3SBvw==
X-Gm-Gg: AY/fxX7OU0/XnlLPnYVr4lBaGmbnIwSbhKWu3tLCSjzFvk3eFVItBA83g30cbRRh75d
	65vfTNYfXlxVwEefBJrJLKgw/pNAIkaxDx1LOrM/YU9CJrVyiJBBRHmZo12IZ7DeJZwa2PuKBCc
	WmIV/IjtM654yotxGEZQPgUayhLQw8UUg9v/PsVk6myacJPM7R7g+7IBwbXIa2nHmBB61hzaZpa
	K4ZElNEAwO/Yy31wIcz+En/j8yBuQQhv3BJOQwb4QNqmT5xQaQm0BSk79RtBg6CsKUdcYZqvAcJ
	FVp/M65QL9hOk8mOtorhACh5xxXKzNBVMTTl6/MVlYch/c0nnT5t1TUAuOqT3b5yu5Hg7TBNBsT
	DZ2vZVD+hE9zM1AjhLb96o4J2PskcYz/9G5HRLnhhR8lNDtYThxPbDMCqwD2TKtUSxNs=
X-Received: by 2002:a05:622a:610:b0:4fc:989e:f776 with SMTP id d75a77b69052e-502a161627cmr25289441cf.4.1768557208450;
        Fri, 16 Jan 2026 01:53:28 -0800 (PST)
X-Received: by 2002:a05:622a:610:b0:4fc:989e:f776 with SMTP id d75a77b69052e-502a161627cmr25289201cf.4.1768557208059;
        Fri, 16 Jan 2026 01:53:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm1933290a12.31.2026.01.16.01.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:53:27 -0800 (PST)
Message-ID: <253d0cbf-f65a-4f60-b874-4191e552c191@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:53:24 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
 <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ogqGUu-90UqL6h4e3mNwZgxhmGzgrcZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfXyzS/KJyftBiN
 F467swjR/Zz6GE2w2/bQTxHcjxDxoN9EEazXZLNsS/kxTuZe33xvo0SbpIHjdNzrw3PYMkWtr5C
 7nS4XlShzy/k1RcBYjGJqktEoNvwnmoXMBHj9MnnzE0q7x1NugeLhD4M2xymcI38YdylVWM5nSy
 TYh+mDmWhkpBbreHKdRZ/gXDT9xKMgZp2IyGzAJIm8UETplpz8sChyoeXp1J4FShUPxtQoAzAw6
 jA8nyy+rkAgr/IR8kX8yTCr1Md/6qpA/OCVjGeHBviXTLbRA4PBAjYNgUAx1JG8wQUefOI2FgnJ
 FLn6MWHMJsuXbQX8O1RJezRuv3mHfyrZRk0km/lU0EsX5lmJGWkxHXfNumsj6ot8zteSwF9SwN/
 BOHOqXwjYHqvMwL8DfBUAhe+x7gJFBWaGmnm4iqD6aJ3FEnhET+PCQ9aKHLxn0m1tesNUt1lyIu
 oUMO3YFGetQcCUOuBlw==
X-Proofpoint-GUID: ogqGUu-90UqL6h4e3mNwZgxhmGzgrcZS
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=696a0a99 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=OOYZNU6-2sxu1PXP_N0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073

On 1/16/26 7:53 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 10:04, Konrad Dybcio wrote:
>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>> the only difference is willow have NFC.
>>> Make a common base from ginkgo devicetree for both device.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> index 163ecdc7fd6c..70be19357d11 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> @@ -1,304 +1,12 @@
>>>  // SPDX-License-Identifier: BSD-3-Clause
>>>  /*
>>> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>> + * Copyright (c) 2026, Barnabas Czeman
>>
>> Is there a reason for you to remove Gabriel's copyright from the 5 LoC
>> that remain in this file?
> The original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi.
> I have not removed it, it is a new file with the old file name but
> i can add Gabriel's copyright here also, would that be fine?

Well you certainly don't seem to have contributed anything additionally
in this specific patch, other than splitting a source file into two
source files, so the rule of the land is to generally keep the copyrights
as-is

Konrad
