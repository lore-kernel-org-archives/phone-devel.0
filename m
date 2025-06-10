Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9924679D
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581874; cv=none; b=H4AaDZ/9SdFZ6Qr5zaSys5mrlFbKVShZ9dFTUkEAjXby4rjIbbnYlBwG+vlq+bupzaP7w7z0/VFeIupRpjondbd3DKadU3GB8+Jw229U0Jyg44PUHGBO4iw8ATYJMGb2egKWty1IL/rKIM8wShvx1btOrQRuAmWLdFHWXjKB7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581874; c=relaxed/simple;
	bh=OHkRo8FvD4elBOPDQqurUw3uyz5hZ0e8dTn8vLmfrJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfdA4yxOgR4YAlx7O3thTgVOpoCyqBAQgzL4gTv9Z6cklLCsfJ/I+Z41Bv6KiraqFNFd3rhuwH+fN5g7Wa1zE9Btw011as3xK1heJ3L4kz0lLmpJ1ZB4ipFlmRUAYGCA+qZ2n8boH5tJvOaSmrHgCEbfHlbCGql0d3ogwOMcU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvZQfX6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvZQfX6/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPrWc000519
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=; b=UvZQfX6/cSgx18Dd
	lvTE6esc8Ims4sjnSW67RQsYweRHZRelc374HhxEwhyRhjSUL8cnNtwLbPo4sSPr
	6mKAO5mE4yN3xGDIq/seQxrc4zENSJLkW7Xz/lg+QYGc9unwisjXPDfpQTtHgkvf
	9JsybKdR9V68ijniYzNTG3zOxhnGbypOx38pgX5to0Evuh56LKtzIrSe5+dltFQk
	cLBq1jgc/vjOiRHEfBs4VQwnd8AkbukSZ7k9VOHs2V5CUW/aJR0dZt/eXYT7pQ3q
	AmkMciEr1Te2jpQ+eYmgX1D9LJNccY+8g/GZvGSMCS8GGXJlOc2zn4u3pEsaaVTH
	jusFRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvafp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so103198185a.3
        for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 11:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581871; x=1750186671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=;
        b=YwqScc+cJ24x51VKoJdjVxsZQjqNg2+YrC6fGw5YglYYCwXdApLMfYSNBrwiHpP8Tn
         jjVMiyWJTfOPtnXZhePCFoA01JkeZ+JmCPPiidHNfIQpa2ju3vDiXnyOIp7UgMnaGam4
         ZxDwGUpBAGrwEkLIZTRrICPgzPVLyssy8pLr4gD/EBiVuxw9HL27+Kvwzl94LOcZZ+YK
         dFHOQ10Ziiu2l+SR112SQIaaBavEc+I1TthsxcOmbRxt19qUzWCtK5kGMULlyvgvh6pO
         DIgDZQ+B5fyhyHo6EdrYRyWKYz7i8Aa5JdfYFNuctuCLB3hjwo+u+B9LUCltwYicavUS
         n3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVbL/vV2esYKwmd+v4YD/6P8ggmw2ek8lehmmttOCSWC2qNT2rka+tN8yicM7E/ioimW77r/0lkuKAN1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYShFPKj20sqg6CDZaIAmAtmejdnKc5ZZAMO7iFIEY1bNhQo2
	9LYutiyo1bqWkxxRpfEBJohvSkBwA2MU5flZu3qmQIML/8aMUlDZGx2W5Dw8Qf+IPLnMw7BKKbs
	lF3qbhX4A9P+3WSd+xvH/vXifu8Z+NAzZgqflM4hs4ZvVkYR02O6sHNVX0biTQyZ+mg==
X-Gm-Gg: ASbGncvTkaQnhzrg7lxra+HrcfqWM0M7Vakd8AzfWC1uV8jc+V9tCqz/ILUBDNvL+fg
	ux2fA4DB1KhFRl7t80VvEEDO1FdkM3z4IRI2cSXQLyuG4gLIJauSI4RO795rzhe/aejiRVgCgdS
	YMQWgVxIdYMf2Ed4/x664c7/mcK42B4Dg6TJsuaGKNx4OmiqQ64u4nVrczo7aaUwLGluHRsVyCz
	cGFv/2xTpUnaf4+thh/2KpOS9l/M/SHm9UcCWY1bE834aY//ZeO2X8w1XjMxMga5wy17DttHugx
	sSLTJn2ya+L3RO20hAV/GznIUdgLgIkjzL8Nrihjl+TQuIZhrYRidRfaZPg8FvJRJsvBRVXGcml
	AZGk=
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28136485a.10.1749581870520;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL9+1OgozdcD0e49HSLFtrscbL8pflDN77oeih/OFQ2Al80bPXOe/82xvA4uxsalTvF4826A==
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28133985a.10.1749581870126;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a4absm774105366b.143.2025.06.10.11.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:57:49 -0700 (PDT)
Message-ID: <38e161a2-2f93-4042-9db7-50559ad5f381@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 20:57:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
 <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
 <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: stNY-fBa6_JI_Av17JE4A0S4AQkCdlrY
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68488030 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=QR4-IV6K3ZDuD3Off1kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: stNY-fBa6_JI_Av17JE4A0S4AQkCdlrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE1NCBTYWx0ZWRfXxys6s0C45FZb
 a8K0Bvg625PCkjonni8avuSoa+H+yTsTm5Ogbu+HXd1cSmK1XgBld24+o8o3hswRhpyd3SgZgW9
 cD1Aliwt+4BUsAxH5UPJhfbt8R8f9ZvTuALmTAqHOKPbUbM26cIpxUOsJeel/UmLPeZOCFxVNmr
 THXhBUuK+yRClZLfalGOpCQdcI733SARZMNunQhnNCY0bAG7bKQtvmSckPrfIkPM8Q0QJ5bqtS6
 Q9dx5DpNt814ZvymAAuxstFqUpEbs48A9YWHQ59ndeoilZcTxiO9hjui+OByOz9jhrHinKmvQgY
 Mij1ZoU5AydLLpZs43mrGWsPm1B+x/lNSFblJaoMieynmvH8QIP4gaMqqBM9CTMlcvUxqjOQSYa
 ml6ekkgU7KYfJ21gWgsukBnfJLGhwdD1itWY4H+MiYlIb0I86ieq1oFxEmRcO0xeli4KojuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100154

On 6/10/25 6:57 PM, Luca Weiss wrote:
> On 22-04-2025 9:43 p.m., Konrad Dybcio wrote:
>> On 4/19/25 11:08 AM, Luca Weiss wrote:
>>> From: Adam Honse <calcprogrammer1@gmail.com>
>>>
>>> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
>>>
>>> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
>>> ---
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

[...]

>>> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>>>               regulator-min-microvolt = <3075000>;
>>>               regulator-max-microvolt = <3075000>;
>>>           };
>>> +
>>> +        pm8941_lvs1: lvs1 {};
>>
>> LVS1 is unused by anything here - it's probably good to define it, so
>> that the driver picks it up and regulator_ignore_unused is aware of it
> 
> Yes, did you mean here to put the addition of lvs1 into a separate commit?

I guess I was just thinking out loud, it's okay

Konrad
