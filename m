Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22828467C
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644880; cv=none; b=ZLKUU2mbSmNQmSR0jhS0qEp+e1ifwBsEiZzjLHtuYPRduyv20cTg/Z0ldlTEMQ+tT23+V50kbKaiiVji7NsHvqDgXnmFK6rAnjP0XDaM7X2jMO754cDfjWkqmorkBxRqO/tcbo8Qr4HFbxfkaYD2lVPOr4uDzGmsHtQ7fyHR/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644880; c=relaxed/simple;
	bh=92ximMM3HrtCvYomgPsBKCGxl0j5JEsmTo0RRYmUmfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3bmwQt7VuEFIe6xyBxrjtaYqFD+4YSu3P9nFgNjXXI1Up8FGHSUyrLW64vDJn7dnE7ggmyYzbiO29AlwctD+dZNycduD7ghR/84jxmRawEu6IPFOyX4dUfVrmvCPVfVFmSizsqicOSlfJP6njKBaj5XVKubQJEzWrybjAQQeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaBvbMT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaBvbMT7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8XtC81177255
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=; b=CaBvbMT71qxdRcLc
	/tz0Ll8hiP/C4lCb0tkRv0LTvExtU5Vfl92yFHyMNi4gRU5iL0DA6N8yrICdUKv/
	ll8HxKdkND/zSkjn0RJ4erPzzzVnmCRt21NutpPpeq/T7rREzI0MIxdEQcvIGS+r
	0tEvcdPJnJFFVF0e6rGChUrd3jeXCu+ZxkQu+j8VUHbyD/RnXamqkl4rWJd2amaX
	u7e+thsL1dhZhP5SXFT37CUPQSanRVmHra4B6cwvFa3smO4qS8hvhclvvgTmOgRx
	8h/kQvKVk4FKS+yhEB7tuWLv40Ja0muWHhC8SEdY7P6D3BpCED35+C6GGMTZA0Qv
	Jzy1hw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2tebg7vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c28cecb4cso23304286d6.0
        for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 02:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644877; x=1762249677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=;
        b=I2w9RKR1Jas6ECTKJdqp7B5LYthiRQtpHmBxcEjjJR3Oz9zzU5+dUE2Z9syapYB+Ok
         j53VjkmwLoOrU2kvfAqaYD+LW2ynRdFT3bsYTJjGuDuHQEXMjWzG+U4EVWZ1lEZF2qqk
         HDJc10pLmEntU8GRio5D1JBqnCEOtOrrKHpOTwqP7J93dCxZ11TPmruqt4IMO3lBUAxf
         OjK/fIEQoJWEMlxS8G3QD7yH520pARGgEFXQX5fc7lcoHSAuG+UNevq6epQaG7zNidd2
         VU0nEUKhtJRr8i+t6FSrxplrKdauUbhovY1SFFCh/pW/WZfrIiZSniWE8SrQdF8D6fv8
         th5g==
X-Forwarded-Encrypted: i=1; AJvYcCX19WKC2jPcsoyzgu/DzCyxhu7WppIa7N7gt737JAH1KNF6ADfS/h4wsJZpChfnn/szocINB2Z72p1aeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SQHqKl3GhvwrpAusgYRJSNZiStydR8xXRAQRfGCg8lI3fxL3
	G4uM6bYmCBwLuoQeuW6yIBcEc4Yw4C9MEj5M2CU3YRyjRfgureQlvH/G8noly9+/vu0VfrdRk7k
	Ahq9MYe1QRmgAd7UX/5tGhnfNYf3DJPD68+Sgy+NNuRWMAAngUTk6n4qMY7p7oFrTqg==
X-Gm-Gg: ASbGnctQyERw8z5CPRhHvW7amhv6iJg+TA48ELPFLSpPjHp51Wf5HQ4E9KWBHXG8n2c
	qzEbPnEI8DN+NMasRA54vD5aiWr+VdoUKw5AMcDhnkt4slWZPGpB48j2sIp5ygrfPGMxrTaZcQ3
	NAiQ4fPrr9IN3H+GkXxEfYGfaJJ7Rmw1dJbLQTra/wH5S58B0Mx7qEm7R7zvqhNrL+KYFUT/F1I
	MRtu8KHMOsUCJVkERw1CJDtFgQdPP5EaqnDPLHYpxYQVGelgD8eeJjQh6TCI81tBmDbrk8TZiVN
	z9nJAdKer2PXGGFziNooSS6peImxevCuK0UZwpOWmWP6WgUT6N2ngNwMRWGG00WXY94WvateOuC
	+5VFstjyq/rlE2CDn6FmLIJrsBDjOrVpQ4g5VCZOCCnHs4pNCx7UOXF2w
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687396d6.6.1761644877306;
        Tue, 28 Oct 2025 02:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOS8rCxBapT8jvuZGeFUYuC27SOQS9JehyH0lmgObjPrvYaSPzNW1Ksfgu1G8QPT0mdat+BQ==
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687266d6.6.1761644876903;
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f97f7sm1026780966b.51.2025.10.28.02.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Message-ID: <63f3d1af-8620-465d-8dd0-30a42a36305d@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:47:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MyBTYWx0ZWRfXy1M8S4uSRgzf
 rqmqBzTLeOnEPM8mvqyPp3nhXybyzTTTbxOIVsWnw5snvwNHSLzGz/VlHpUz2QowT+nmOT6ttSi
 sfeylc/l4S2TmBlHg7+xQ88bibEVZJuDEZy31A+c5P+lnOQEn/LFiSbN7fuELW2QPcjHInkXitd
 NWFNuqiH8J1ir/q3q8R5YOoa4cEuy7s+7t2fR/4BZkcW0aWL54UVm7l0tfxT4F4kv/EXTMb4gIW
 0dMWHuRaJaXWY2PrRmFUx9m27qOd3CuhANWtptWlvjqk23hJfOHZknxYsEqGY23z3bNwF0aubLy
 swA62lFpoEN44AW4laOIxABiORoIFH43GvYbKyTEG0vBQD9E+Rs/W9ckkfC10jwOhKue0igtzCb
 tsKymjVsphhIOFEVzjpiazn1XWtSIw==
X-Proofpoint-GUID: 5FWuQ9Q-rvSvlq9hAPikQ2NWjHqN7yLI
X-Proofpoint-ORIG-GUID: 5FWuQ9Q-rvSvlq9hAPikQ2NWjHqN7yLI
X-Authority-Analysis: v=2.4 cv=V/BwEOni c=1 sm=1 tr=0 ts=6900914e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=As_Xg-pERP707GV__uoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280083

On 10/28/25 10:24 AM, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Tue Oct 28, 2025 at 9:54 AM CET, Krzysztof Kozlowski wrote:
>> On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:

[...]

>> There are no dots in property names. Are you sure these are called
>> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
>> bindings how this is being named, depending whether this is PHY or PLL
>> supply (or only PHY).
> 
> The following power supplies are mentioned:
> 
> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>     (not referenced in downstream kernel, connected to vreg_s5a in
>     schematics)
> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>     With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>     With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

I can corroborate this

Konrad
