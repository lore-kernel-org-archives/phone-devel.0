Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6812F12A9
	for <phone-devel@vger.kernel.org>; Wed,  3 Dec 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759322; cv=none; b=PTGFlKJeIYnL+m/jZ3IJ8X6ZIJeIU+UNoRV1Vt7yEjhtLBad0IjRXu8Q7AqFwIDIMv2Y/DgJQmF7gRw/07Prly3FEwCo++AhhYqjl+zq3Yyrh+mY2nvCQbmI7qoG5JmlW4b2FBE2Wy+y3cGFDyPReRfEcZPMH1ilM9h1hxdthww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759322; c=relaxed/simple;
	bh=em0K/RKU+ni8P7BtpuIB9udj7IIR/3vLGu2NcI6J6e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uh5MIKoLID+88WfdZIn3h7M8Hr9miQotWaOU8JwWvdJg1aMT9MGWyjDvCS1e6uzVC7Lx5/4Fwe/3/bG1DZH71P8D6v7ZpPlDIKKu2f7EwF9KrecVQaV70i/8IVzYStTAKZ4NlZ0Cs6BK9XrodmaN3MAvMGQdMW+pNgvq75HVBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMReJlXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJuT0dMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMReJlXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJuT0dMQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34uelB385553
	for <phone-devel@vger.kernel.org>; Wed, 3 Dec 2025 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=; b=BMReJlXC8GRp0ZX6
	hBNLGeac15ARnLAXokBvDIVOwicCh3SlOa02C0kHW7AZ+GfLgR5seqrFa5yUa0z3
	9vJpBn7SK1IATCqUIHBcJMlIJQlp4bHGHAO2BEHZjfFOkAM3N0pz5BF7myRDPVYZ
	I+SlPHlZEiTb9UKrPABrcVGsJ2z5xs0zcy0YyWUfIHHZFJfY8lOAYIqO5uf72i8X
	vakbp+AsYEmRPs7VEq6s8zzLV+z+NnaPRWmIgxDj+l7006jjj/B8dvduZcBxfdlO
	lXcuoDGe5Oe1zuOSnC6x5M9VHRIX/nhE1420tytGgKG2fvozSTfcZo/Vv1kfgn9W
	sy/sEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db2qfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 03 Dec 2025 10:55:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927208so18524241cf.1
        for <phone-devel@vger.kernel.org>; Wed, 03 Dec 2025 02:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759319; x=1765364119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=;
        b=gJuT0dMQwFV7ramP9Ik8hjoeeN6ZrCGJotxWMVizoGfD6oBHl3HfNcHMXfHIrkgKS4
         z07RsHaK3uqbu7AiHwoMQHuTyrDq07yLaRgK+Uiy0sjeZZAr55KAaYiDgv/vmVphXJ4L
         XMQ3HxSBfvrDRZK/3SYpNRsRuEiQXM0+l2MDotw4mWzm0hxCJY+bW+qytGrrEipD9YdN
         LWJx0ihr/Ux4sUgLARDHIE9i8aPLUkzchzldDdA1Uyq4OA5AHU8+Yp9GdMqMlDkd66SR
         Y5l8pd8SnJdGMI8vYLsiwxV0KbsJrLfg7XaaINp5mYXx4oU//H3eeCv2PjibbtniVnBm
         Cr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759319; x=1765364119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=;
        b=XutY8t+MQ6p3/3aVmKmXIaqaIyNBNg/KTw/TyKcxG+8QR1l4qaB39XUF1DQYhM/vuF
         9vq8gsyjzl7ouikIWS3BtQivA84ybM2N1yPOJsHjtG5gZr6gFg54Z/pIS4Jxe+9i0izv
         IDGgRAVE1T3xGtA5fVUgYqvGbxkgcIyHyHpNSFT4J/azVBMYznW9zyQvO9wnGOZ8LqL0
         bo6M4U0kJee2HpFGnthfEg82RSQxkiAsifjA6LMHs0bSir/oCmoWJwrJ6tq3zEkw2F7n
         25eyYsYbuWr2eJEeo3gwFccwvog82BLX7FGxTraWI/6OHT68EGUuMUwaNWgWRusbiHbF
         cNMw==
X-Forwarded-Encrypted: i=1; AJvYcCV1yi5FEk8B9PXa+cmK4YEAtxsrN2JfH+QsKX6zXRKGfiHir0k85CCq0a3AY0vcaawd30DIwbH2jy0Mhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMO+IdrBPIkP0I2Cqw03E2AxBIO3otbyTpbJvLayJNC15ETG9Q
	cU6b/X3NarL4FrjzL5TdAiHFv68hLF8dYr0jPX7ne8b2qldMNper0H+SXoofzUnWTQzB9X/RW3v
	TsUhPEpYLDmIAIB1T8wpwkOqn52y7GRmYuaIuiGh+ClIaJh9rf2K7xqsXA7eMh/oFyQ==
X-Gm-Gg: ASbGncvzsAB0Smdral1vSmvPjER3GBBjbQHRFjCgaLh8WWrkX2Uhd10Jn0XNXf7Je4e
	2l2sSfiF9Ua12ryfg/By7j1Y7mqmUTqEBzGJcE4b77L3LzzjHsUYhfTqJBkchHAn0tOYwUpTF6z
	HHtNAg6FScUxDFTf8QZmV2MbaZrQNPFJRVlqv5kwcDpOmiJfjeSvzpHSXqXHW2K8IwVPpluH/4Y
	JfDtnTPfNbWeii2yv+WUzjk+fylokMIWvyY4+gogyo28yAlz2STL0TjuPGdR6mAJSizfN0kYC2U
	3lJPG06EscJ/rJZrLh8oC9SDupR3K7m9or8OojOmBqubSrTFxXCERWCBJf3s80IFWBHos5RcIGx
	Ko8ylTkLKGW/FQ1LCL2HdVVhuP5nOd9jsOzXIApt9vnQ++Ou5pfanERsjrxGt09p8iw==
X-Received: by 2002:ac8:7dd6:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f01750b1damr17836371cf.3.1764759318632;
        Wed, 03 Dec 2025 02:55:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr5PQ+gv7K6GuZzMoPFuo4GgPd9lsQ5lQLFmBxYkjsvmJqCdnkBJsvqSRrfwVjViPa0QgdtA==
X-Received: by 2002:ac8:7dd6:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f01750b1damr17836211cf.3.1764759318228;
        Wed, 03 Dec 2025 02:55:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecbdsm1704405866b.38.2025.12.03.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:55:17 -0800 (PST)
Message-ID: <ed9475be-c3a2-4eb8-9b3e-7e4824a5d4de@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:55:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
 <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
 <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
 <1d56eccf-1978-43c2-afcf-03ca88acc0e2@oss.qualcomm.com>
 <164f88c182ff8e17a0d544effc7d64cdd73cd4eb@postmarketos.org>
 <de30bfad-a28f-4cc0-9099-11877428070e@ixit.cz>
 <88d96898-3c83-438d-89e9-4bb2bd0dd98b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88d96898-3c83-438d-89e9-4bb2bd0dd98b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W6TODOTaSDcmH37rddhDE-Fo3he1JvqK
X-Proofpoint-GUID: W6TODOTaSDcmH37rddhDE-Fo3he1JvqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfX70sgi0oOZrlw
 6PgT4u13hDB0zhuxluF8mHTaDC0F6zc+1v+xYRvPFJmFCVGpjDtPpRERT0rmMEX3yFc3n6ORbVO
 Lv5JYHK7LMw9R3rtLLYF+1GKjLL2puxo/b//hloJaNzK19E6ngCwJnsFyp2xrSHnWP5FWgOKJgK
 0TsCNMr2c06MBNZTgu1Swj27sfTZ8J20Cr9VXBBkVubHTgOtHZRpBf5/u++mSo4jhBn7uks/Gct
 1QC6+zOYREA6H5yfNldFkwZfnXSWlWqj6PVkuH7SwTbPsCWag/MY9oASHVDlUN9hv2P/g1M//W7
 rMSpEydzJTDXZ3i4JQuQgIvc1dpKT79kKm6fLU7q0IHpyKhw6cNO19nrV9Lm50M13ECYaB+ocwM
 Lk2heg3xedIB+4gZ36riFO8aSkeruQ==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=69301717 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=1eIp3gH4w8MLQwSKTRAA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087

On 12/3/25 11:45 AM, David Heidelberg wrote:
> On 03/12/2025 11:37, David Heidelberg wrote:
>> On 03/12/2025 09:42, Paul Sajna wrote:
>>> December 2, 2025 at 10:34 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com? to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>>
>>>
>>>>
>>>> On 12/2/25 5:41 AM, Paul Sajna wrote:
>>>>
>>>>>
>>>>> December 1, 2025 at 12:41 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com? to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>>>>
>>>>>>
>>>>>> On 11/25/25 9:12 AM, Paul Sajna wrote:
>>>>>>
>>>>>   It causes this warning
>>>>>   [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
>>>>>   framebuffer@9d400000 mailto:framebuffer@9d400000
>>>>>   (0x000000009d400000--0x000000009f800000) overlaps with
>>>>>   memory@9d400000 mailto:memory@9d400000 (0x000000009d400000--0x000000009f800000)
>>>>>   Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>>>   ---
>>>>>
>>>>>>
>>>>>> It's defined for both devices that include this dtsi.. perhaps you
>>>>>>   could remove it from there
>>>>>>
>>>>>>   Konrad
>>>>>>
>>>>>   I don't have a judyp to test with and prefer to limit scope.
>>>>>
>>>> This is a mechanical change
>>>>
>>>> Konrad
>>>>
>>>
>>> Sorry, I tried to have a look at what you meant but didn't quite understand. In this patch I changed the dtsi that is included by both already. I don't see any other reserved-mem nodes in judyp. Do you mean I should remove the framebuffer from judyp? I don't think that's wise since a panel driver isn't added as far as I know.
>>
>> I think this warning likely comes from sdm845-mainline repo, as it has extra patches, which trying to abstract framebuffer into sdm845.dtsi, where it likely conflicts, have you tried against clean 6.18-rcX or next?
> 
> ... or sdm845-next repo [1]?
> 
> I sent the patches moving framebuffer from sdm845-mainline repository as RFC [2], but so far it's not clear to me if these should go in or not.

Ok I only did a marginal amount of grepping and judyln/judyp define
framebuffer@9d400000 as the framebuffer device, while sdm845-lg-common
defines memory@9d400000 as a memory region. I assumed they were all the
latter.

I don't see any other framebuffer@9d400000 in sdm845.dtsi so perhaps
David is right..

Konrad
