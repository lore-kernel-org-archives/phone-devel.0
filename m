Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911532D0CE
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326290; cv=none; b=JtNwkTZeMgwleH5v6Kjl2rkzuLVBYClV+COfzLvE1rnoUHXH1V3BmBgyIIvdBnN96fJFr+IU+QL0P44HEFdzatYq5MLC5qutE3YGG3D2vrYKYs7GTvYzYKDkCvk5vdznDtRF+EyXd21C+XZfTJRAr3lnaMmzRO1Md2YF/nlgnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326290; c=relaxed/simple;
	bh=xjFZ0hdn//xg8PEJB3ItjmhQ6igL7H1mvyq0vdtLNFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhsUCrHo6S35crIsoH2+QDnfZdk7m3V9g3EjYAC8WU9FVhs1SN9pxO2iLfP+Ci5bUK0yZuAXU0eMRs+Bi8sT3I0oVwmrnrNdeVVaQLNwF0RXVmbyPoR9M7H9Xtl4emKJD2S4ujGeuLnNsWMq5Hv87Dt+9SijkSL6rfbQuIixwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeVrKWRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvHrcRFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeVrKWRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvHrcRFd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H7sNoS982299
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=; b=DeVrKWRJhzoLyeyK
	OaaiE9n6LFuQPflGFu3lx9temf2ICinDQ4FwIAI3GDNnIsi8RWdPC+YLofjgjY5o
	mNeMalVMSwo1nzLt9G5dULwr/aJVoA2ijNLSFvt/7W+fjhHkcPgHrOTA7TYsqxtT
	yTpsFKpUTIkOMGgF5+KxmXfISNQc4EzVW+HEtudQ/cnAj4AUfudUOL+QN8ihHGzT
	6Peg0WMZR5cLp6F0vL9X4nBVi6tikrbMvZyTSW21Erdd5BFxRNixRl2P4r5APnzx
	Pvc95KWiyQnpd0NhV1wvD81euvsrNgvHd5EhzG2eA0AuVBZ0eWY6tzIbXWaxBnoH
	Ofs2ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t379-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:04:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb399597fbso259192485a.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771326287; x=1771931087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=;
        b=MvHrcRFdHDvvNJ9xEdUQOnP8iAL1j9GRCYw/hmsSzmmjtqFzLYbZwjadboZLTUAf4B
         NCM4Y8n4ZwufQa23CqN6B30lkOu73/Hxgt/FRI4QaivjVasXOuSXoDV9BxpqtcxvnorE
         VV7dgWpayT2sqo0KyCY5q5VbHEvV3zaP5dHF4MCSm+g3tAHhv4jcbucexxBPPNNiztwE
         RcFD5Pgzu89eZnPO/NNqqV0329WIReJwLyPE9dKsXwCjUt74PpR+m1G1v2FzWZMc7iAo
         cm9edreXQR3CRj1MJg/FO0/715QNO4apVfz36Fk4zyb4x1ud/Qgrw1hTRiIY3gSTnjmM
         h7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326287; x=1771931087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=;
        b=FKqtXRztc+JCka7/mAh6BS9PiLrO/co2Y6zwFH25puIKj1h1aeO5uu29jdsZmK3CDz
         hPbA+tqbAGR8NrqAEUychMUPqN86u3n9nfIKXVclaYSSWBpQLKIgzc1XIcZREzvMKSoC
         /mJKpxHWIjUmXwDRCdToiY74B17S6ZElU1Neal2Fxedx7SxYyfV1ftT7x7iwjfAF2crt
         5XeEwdqKcEX0WsAA95nYXJuuIALIuWyqzo7UjbIvnBWNkgoDttld+6cP+NF0VqYam+q1
         s99+zrU0/Khy2Kc/0NEP/sqbHmzMk85ASyP+1zCS26CeJ821qOXQv+gw5zY5SkzdajhD
         o6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxnVhhERiDzRStuRJDYuvTYV8Pb8+QCzUDWBU6j/ZnwcK0iJkOq5gn6vSP8rMJB533l4v5ccsuPRRrMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7qkkBM+w86+vaB9cvaJuRy7VWZJ0P6UVJCo/QSYDB3ly72S4
	OheN4HXBymxXj6tz9kEemJl1pV1Jbo2n0OWrMppgBtiaiSmsGOB1VkMetzyUXyMa6GC9ou/Bw6R
	FcW49hfTUWA1ysgJbiV6MxsjV4MxUX7yyr2TCtSqWihzml5wSVBXpvkSzvlfkdToiIUOPUND+Zg
	==
X-Gm-Gg: AZuq6aLyzNfsFZ3zxWfh1RYOPsnUVtG5ZURlBIcOV3F7pbm4IGB+CoEanAlRLBmsZPj
	fRhMNNrAUhvlhdSSor0nN/9nXi8ESMgfAq3g31/uLRbu4eAuQQQsxaRsvhsaXLiPD+Z4/THmTXz
	SEVd/4oE7/Pp+Uor4VDZyjK/jvJQtMexsuCwi4XQSEvjxW6FJ47bsedzxYk/58lSLfwccx3P/yP
	VFaiaXsxyf3Iy+wAgqKqX3J6xQ5l/kPXr5BtrifePxxMeSF52nGJCy9y2RfIOLBHUb2VquVlvwU
	kJrVF9TYb+rQSZI5XfVg+9i7YwOp2qZ4lsqKMUSXKBGCH57Mdh3q6WUMeT8ed9DQZDUcnHeB6jn
	qeIFozmE+9vbXOOBAoxUxaQKzskNqzuLimp4Y6Xckt2xAZw/sWqhNfcw0j2/C1RrPS51i3EMwx6
	r1KHY=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1405257985a.1.1771326287331;
        Tue, 17 Feb 2026 03:04:47 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1405255085a.1.1771326286867;
        Tue, 17 Feb 2026 03:04:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d1ebsm337347466b.3.2026.02.17.03.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:04:46 -0800 (PST)
Message-ID: <b6642f5e-c890-42fd-a733-c5ff1cc95d25@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:04:44 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial
 devicetree
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
 <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>
 <aZRJb6FVi6B-fgWF@MyryksLaptop>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aZRJb6FVi6B-fgWF@MyryksLaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MiBTYWx0ZWRfX0H3KViqyR+/9
 tMfAPouBODdYjL1SAPvOdOmLUZkem4mp0AviTQHCEwrh9wbubAKnNcfR5tHyVRFWhn1curRiwy5
 lvlcSXZX6BNLO9RC0toqa/B8ttwhVOtFzN/raeaTcmNfhoX8iRXiXfRq+mXLt7wORxlu7cF8zWJ
 mgGm3ovhPrg4lzVaNEWlwGb3udygGCuo1di1NRJj++dIo6FJ+xge+KP86GO/rNzTIxWwlL/Y2aT
 MFf/wpeKorfmKxuj9DTIAYxTMwO9ai4vLQgZ5yGfQmmIoY5WBKZR87eBsCaS25+s985qhkpekxy
 R66ZuEBVRCYaqTjCGBQ8o0sD65l6jSz5BDZ6W0WEbRFzoFV48CMgxu7+auBgwqdIuT1TzxKWLiB
 b2jiDEXWDaPPEPfPkmruGTi4aFBW6MDSYa6bsVz+erCtaugLz1FLm0xLvBFoVnAYRiYhKAxeFlA
 aL6XMauy8IJDQqcfwDQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69944b50 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=sbB4V6NMbHWj2XBHrEwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XlXtq36tU89g177uoP_hPpJBPr_UV_P0
X-Proofpoint-ORIG-GUID: XlXtq36tU89g177uoP_hPpJBPr_UV_P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170092

On 2/17/26 11:57 AM, Paul Adam wrote:
> On 26/02/16 12:18, Konrad Dybcio wrote:
>> Hello, just a couple comments below
> 
> Thanks for the feedback!
> 
>>> +// make sure gcc is probed with display disabled.
>>> +&gcc {
>>> +	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
>>> +};
>>
>> Do things break if you remove this line?
> 
> I tested it without and it still works. I just included it because
> it was on the pmos msm8916 mainlining wiki page. 

If nothing breaks, let's remove it :)

>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mdss {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mpss_mem {
>>> +	reg = <0x0 0x86800000 0x0 0x5600000>;
>>> +};
>>> +
>>> +&pm8916_l6 {
>>> +	regulator-always-on;
>>
>> Is there a reason for this?
> 
> I removed the always-on property, it was for testing purposes.
> mpss_mem is needed for audio to work.
> I removed mdss since it is only needed for the panel.
> Should the gpu only be enabled when the panel is added?

Ah, I only meant the regulator-always-on part specifically

The rest is OK, including the GPU and MDSS

> Also should I wait some time for additional comments or immediatly
> send a new version when all remarks are addressed?

Normally one would wait some 2-3 days after sending. Because we're now in
the special part of the cycle (post stable release, pre -rc1 release where no
new patches are accepted yet), some people will be grumpy and actively refuse
to review your changes but I wouldn't pay too much attention to that

Konrad
