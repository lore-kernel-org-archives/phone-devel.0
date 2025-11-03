Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1E30B50D
	for <phone-devel@vger.kernel.org>; Mon,  3 Nov 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172682; cv=none; b=SczpDv7QNMnzji1ho4rJNrkUy6QmoeTWrpytYKnxHOiaYwZ4cI++jfoDDl/PhV4pqq4sVRHyB1quEhtMNQhzCBwV26WJ48hjrU834sxLUKYr0bPO/tyvq+m2aKYTf7DaQs72obQ1M09WvpafS7gPm8+tJ5mSLjjfdCuU/0mDb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172682; c=relaxed/simple;
	bh=vwzBSD6YjCzeEO2eiRf2nhfCnTbIY4rkNTdkJaTw0TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2dmO5lwKbAUzYFFwyTYt/lyIIynESF23z1tVVyOpqVpn9OoAKVq35PTdIShYbF3pfzPK0boO2+2BMp9FMSWycKiZ0Ss4ijPnYHBvuEe+q54uvD7iY1drBNp4pLTkDaWYWunyEotTudre27EYTAdS/YaBnz+yUMweR5VwtIPmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPf1DRAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jz3hwTdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPf1DRAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jz3hwTdL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A368XGG2269724
	for <phone-devel@vger.kernel.org>; Mon, 3 Nov 2025 12:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdIQ6Czmd1hHUaY52E30LH9FRShtyPrpnnnsHJC/oT0=; b=LPf1DRAKgWnvBy7x
	A0oDBivhqudxXd0xLWe7aYcGsA/hBnyMVvCk7p+nMaPDHkq0cPSJXTloY2dFJm2P
	/DLZotJH7oUGS9FqNB3kDfsBRbkX8BOZPdp/wg6JMAyqToSJcYRwSGGis417txla
	LVaDwzjBCNDpkIdiQfN200AXEAa7NW7rM62z+pSkSI8IT8Tzpb2hEeA7yy2x8RPB
	w/jAejjEn9P5J16JxzgQ1glVZdaZT05F7rOVsVEojzXIgoEhCjiP4mf9phQUj8XK
	2/7gp6XkdibD7TwKK0j9567izCJHG48tZTmdc8Qxsr3HAgHtxUd5b6eFnrfNB9C3
	UtykYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv79369-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 12:24:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-880415ba763so6231796d6.3
        for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762172679; x=1762777479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdIQ6Czmd1hHUaY52E30LH9FRShtyPrpnnnsHJC/oT0=;
        b=jz3hwTdLVTn7GYAziYs6HatgJxCc3iwqL587LIFNEwDjjbigfke8REep+qsw3YtthN
         ULojs+Mp2VAmc5encgEVYIV49hxE8TqucDHXQIVR1obKTd8DEchorSm436XlWZgx1y7U
         njmeBk+PkPvd4uvQdKsRLw3sLHtHSe6M0p8jGuCOdpOx+5U+1BfvNpS5Bu/wXRDGpE/5
         0Uc0hpNUwTUXmogIJNJfTn9c+BekXBEJHXrE9l53pkEliHcTa7YP9uNdx56oD8ZRZdX/
         wyiewqUMaSD594Ku+MIPE+No0IopOSm63lZOaytIj3aVG67otxW1Ep+nu9bf8onMBiC+
         Q9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172679; x=1762777479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdIQ6Czmd1hHUaY52E30LH9FRShtyPrpnnnsHJC/oT0=;
        b=J3AOp0bFrDisoT72p5dBxQGZInHTRPpsLWmNyCrJsPZEBrhjHdqrjqfNzO8BPvFdFl
         ZRRZtCuS6t64M2ZhACEGRxnHUawS37o8KrB+oRM0Taf8TVVfOsKnvIMOnzKBtUaetZwA
         JT/D0IEYmikhGVbsTd8l50Cx3OcYfOEn4Malhbjyi7jifgl5Ywjn9ee8xgcX4El4ZVpo
         HW+4gITzZZDtgZDquCKbjtnHqO17Y+V9veeVMnZdL9igRkKOYucDgTtwUxMNRB3Udc1i
         F1QY+vNtNItlKXLny0DuaGeeOibHeCBLA4WrIZEw39iHR2dIwF3pql4uuL1XZpgNb5PU
         y+/w==
X-Forwarded-Encrypted: i=1; AJvYcCVFiNT+dXwnlxWvUopvvkibVABohMFn9aB0B50PZ8LqxmQwQOhM+YrYmPCamdjnZs4cx5Vh3WCj6E376A==@vger.kernel.org
X-Gm-Message-State: AOJu0YydvDAmpoFSycNjY7Zj9UbdedAvdTU4J8sCp5QV3ZrSvnIBRoC2
	K5u/3nzBHapDUfiRGmo6FtnZTD1J/sGbZ2pw+QlhLHa9fcGPxHm7/3oVDERJPhAdEQDXI3wP5eR
	ruBHzcHEaQEndUGo7XlOow8cpqnSzuAuOdWkb725PgUgGA5u2/t0lt6iAwo51B0tkew==
X-Gm-Gg: ASbGncsXZd7LhqTyMmdEq8qrLHGcFNoJYxhXzir8ar/ab1A8la1w8mlr1L0mnB4zKOI
	V/lYMFkS+40U6oCXVuFkv276ED8mUc7MM9P6rm5uAuNPJ3ioetRT7TPaj3IIXls/gD55P/8CSND
	kBS0rWwkxvTD2Nxy70h2krwIPB3MI+od/M8EwwVRXiZIcL+EZPEksaY7UajwUxjHimyKAPKW6UR
	4xCReYUrNk7SjqofZ+SMJ60ymT5pUjbZS+MgtZjL6ijk4u5d8YccNwjMPrxOTcQtCdYPqUM8QKW
	xx1dRmOAhDYnD7BUV1B+ZTnl6iULFNcCxvgylPeP3QbdrfTVRWd9drt9vwPxnjvJTAmJCEZsx+N
	0R76ckuRTTJLNbbGS3H+POr7lP0/92HsrPTt7BeZLJ7ysQqaNwfu3z6Rx
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr89420901cf.9.1762172678791;
        Mon, 03 Nov 2025 04:24:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKC7c+sG3ScBo6GxArZhv36vSpltAdRIVXXFR8SiQD5USW8CgQ/o9dQtWKno1nX8BCx1zJ/w==
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr89420631cf.9.1762172678275;
        Mon, 03 Nov 2025 04:24:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640af968e5dsm4919370a12.19.2025.11.03.04.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:24:37 -0800 (PST)
Message-ID: <89d1eaba-557c-4df6-b65c-b2105ec20788@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:24:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
 <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>
 <DDZ1X799V2KV.269J9YL1AGCIF@fairphone.com>
 <0fd020e4-636a-4bb3-9c22-7a5b16e4d3c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0fd020e4-636a-4bb3-9c22-7a5b16e4d3c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SL0mqh-pMk1zKCtTjnYFWBNOyd1zuxin
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=69089f08 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=efwxOTLiV638Ii7ixkkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: SL0mqh-pMk1zKCtTjnYFWBNOyd1zuxin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMiBTYWx0ZWRfXyg0PY1HVdd5s
 nt2kIa8aTd1TyK9zHCs/PcW3o8GudkEsAbLB4wcL7CDzWn2WJOLIphAfBG33afZ2wizb1sb3cCs
 LICt0KG/uJbRWUi+YocnecgmCKQH8em/6XW9nzTr4lS/zuVroJsER9S55PQJnhwUMnQekhYoK0X
 JOyjp/HsCXqN91ZIx4GFjwf+eycSRp3DFdQ0bIHgq1fn4HCbCzut5GxrxAAAo9fSbZ4IfFvTa5l
 fXdcKIkOC8fTB5/qhS0TxZg2BeuQcRwVS0lNb/gAzZipfPOAXG/9yGo904IMT5sPrylp/9DuMgg
 etoYKrY8ROOZ7oGO2V5xpM6JnL7Ls0KDhDOhzRuYjuTPWAZU7MSSxjo2gsfhzQgwsMJWZBrkW1T
 SIajdzy0QlVFPHaC89dKcidWmRrIXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030112

On 11/3/25 1:23 PM, Konrad Dybcio wrote:
> On 11/3/25 1:17 PM, Luca Weiss wrote:
>> On Mon Nov 3, 2025 at 1:14 PM CET, Konrad Dybcio wrote:
>>> On 9/5/25 12:40 PM, Luca Weiss wrote:
>>>> Document various bits of the Milos SoC in the dt-bindings, which don't
>>>> really need any other changes.
>>>>
>>>> Then we can add the dtsi for the Milos SoC and finally add a dts for
>>>> the newly announced The Fairphone (Gen. 6) smartphone.
>>>>
>>>> Dependencies:
>>>> * The dt-bindings should not have any dependencies on any other patches.
>>>> * The qcom dts bits depend on most other Milos patchsets I have sent in
>>>>   conjuction with this one. The exact ones are specified in the b4 deps.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>
>>> FWIW this looks good.. where are we with regards to the dependencies?
>>>
>>> Are we waiting for anything else than the PMIV0104 (as part of glymur/
>>> kaanapali)?
>>
>> Hi,
>>
>> From my side, I'm not aware of any patches that have any unresolved
>> comments, so I'm essentially just waiting for the correct maintainers to
>> pick up the variety of dt-bindings patches in this series, and the
>> PMIV0104 and PM7550 series.
>>
>> Any advice to make this actually proceed would be appreciated since most
>> have been waiting for quite a while.
> 
> Apparently I misremembered, kaanapali actually uses PMH0101 and PMH0110
> and PMH0104, whereas glymur uses pmh0101, pmcx0102, pmh0110 and pmh0104
> 
> (it is not easy indeed)
> 
> so it looks like PMIV0104 only showed up with your series.. and I'm not
> opposed to it, let me leave some review tags there, and I suppose I'll
> just ask you to rebase this series on next & make sure the bindings
> checker is happy

Well I apparently already left the review tags there.. please resend
all of them (2 pmics + this one) as a single v4

Konrad
