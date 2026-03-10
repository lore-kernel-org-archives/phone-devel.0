Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B23AC0CA
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145661; cv=none; b=ruonXoanMiVwTWH8H8Zgenw5GKQDwDoP6gfCtHZxDhmswko4TJinwQ+18AvyS7fgoQCX4JRh9jfTo0iodAnPG3usr97UDzQ/CYMhUS4wLwnhiYY9CpA3QD4Ro3eG55xbvYyOlyGvc5OT2JhitY4ItP2mi+GUAhdVEh8qwkN16TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145661; c=relaxed/simple;
	bh=8Upy1cHORXDNFQ63wTwBurOgO3zyTLSCnEIJO3Ampf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNYawXy01IEkXI2o/zx5wErIxoVOnlRrNExJnBF256GphobRG8SvbSbUhHsfq6XlaDp9s8xzK3UudLvDDHGmchyApeGw3PBCd42sEVJYA/zYyYToq2bX8Me56eU+VoZPRXPw+WIudZ6FF6gGqj9OwrVt5RcwlTntw3cmYHRfn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZMHgcQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JseJ6QNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZMHgcQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JseJ6QNU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABUtFf2021450
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=; b=LZMHgcQsjuODNi6T
	tua1ZEJtrvSzgj1XR6TUb24ExqCyLLdZQtiBSKWVLiIDXw8U6AHk0eOc0o3tz+Vp
	+7m+NlHnludGjjNOOWR6+gylCYc9LfRsXGoKcuVinaHYgAwZ+d9zVlTbVB6ibcTR
	HuJgGxwT1w8BlbjORaUe2bV0r2evfQn+fxOXuYXdXiGyKEXT/l8YkL/cqe87Wmi6
	KCWKfAiMUtyS3T661X+5ylPCy3Wp4n/X0byIX9aav3svy9mNBuznItQSM435hmiG
	b+ONH2pz9B6ZZEl1yicNcVvEbkHeGO0tnssUw0AB5P6a2n7S6W5KM5fhe/YGqln8
	UhUeKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9a3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:27:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84cfae34so109898685a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145659; x=1773750459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=;
        b=JseJ6QNUBD5flhODwgRFgaDxyAJQeKjAll5Ctf2l03oN/T3XjWNov2x5Rko/ma6lB5
         R5jbxQJ9SqnjJWXztfH+8jHSq98EbjRAWMjr/Uv36yEpIaX7a5KygfJDOhQdwti9I/pB
         L2ZOofMrpVFK0TKe889uPQydnzaFBUnk1GdiH+TBCLhHSZR7Yt90z58710zefdBOsXMD
         JKU07IY+Myjo5vii0R8LSM/lPDWe8qc2K7PorLKscEqFt9qjOZ5NhEUxdSSPz9/JeBka
         CN+JS5NFJN1HRZA1SYIlKJX7N4z3m6pz5hdy7M0TboN9VrjRzBgT3Lv0yu5FRQdBsnwE
         w6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145659; x=1773750459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/UGlNQn23sYU5tLZJ79XsnEcLyxrZm0JZwaMD0J1PA=;
        b=EAIZt+afwS3tW/zHE8cinOlLdH1ulAjuPZmtYZcmIN9vBhpoVb/QMuBMGIt6naP1dq
         RT4FFe2yeGkobpsl2ACxy+1dqZDZ3gmhgisEkzvPcPgVHV7Ffj6dOB6CGBakGZKjDuSz
         rcegzp4//fSJZZ76EzvEGqgsk+qn3m42YyAb0iWfgJktRld/NXXavE5AspIGCvc3TqYr
         AxD0ElsENAzDFwVlQy7l5PPM9tuu2JBJRS73OHoZddxOGDrX6nu5h7RQMseu07JS1ywY
         zcVppYXaRI+NoIvA+IcX0HP++WED4wVlVH6C6n/TqI9ETykJgO2fEtLZjYSrXTpvbhqg
         RMyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/hdU5L71VUD1HQs8rW7YE5pDeuNvNeJiEIQvS8ZdBaVwmuXs39t7uKS41e/MJOju2ObKeIsIxHVWqiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCTnpT/KMyd8pJFpH3nLgvlQzKKqczDQBL4FqdGuHgLa+9ljO
	Z3hhKXVtQqOelTDIKetnRYAqiT0EjXfRNLuHqLIp/qJnLYvhseO3sX1ctXrWJCC0DsasauJEOS6
	kNNnHRVxHuebp/kKTu1b56MK6PIT1QmPULSs+4LwRgFl5ABlW2GuOMEDVhQYNpI1GFg==
X-Gm-Gg: ATEYQzwczKA42e4LeQ5DvLWnLCYarkgrxTA/blD70EJpJ9S0G+1NVGDnhPZ54NjgJJ0
	mmi7XtzE1bkVga4Z6TIO2nelvUkViRMwR+tA7WPzsC95vJWS5k62V8iYfF2jkDCiMDHdgSq4Dcg
	sl8OXWGls6uqXUlIQoC5+bmnVzXZ94yrEru2kGq5O351pUicS7T+zY2Sqmn1csicbB5DigLUDe8
	Hf3EMpGPYjjy4c8PXmX4npn9bUPgwJ27mTaIHsE9s5i0s2PAMl1dnXvoAXAXVo3r8WDzsAoMJem
	H8QdTuiarZgD95KE6fdjtq7WtHk7zAF1Pswclt+5QpTp3fYkUoTIlz8qvofrsRzh6m4dIjBy9l/
	RsLetPyPH9WEPaKmM9n/JQ2vxYbs+dDhPSaLEDwDnEMVrat0Ujvu37qS8mJW+C+qAcjiSqBHJa5
	39Lu4=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr725001685a.7.1773145658835;
        Tue, 10 Mar 2026 05:27:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr724999385a.7.1773145658398;
        Tue, 10 Mar 2026 05:27:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15c23fsm482138966b.49.2026.03.10.05.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:27:37 -0700 (PDT)
Message-ID: <257549d4-b582-4b40-86aa-62a2ab68037e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:27:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Linus Walleij <linusw@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
 <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX6xkt/+OSDRnm
 8ookYb9nlGE5WOoVV7hubqqQzPhqaGWaBEyfhUmj4qPqemf0JswpB0MJq/F4nO1hijdb3LsNFgS
 ck/xavHdSGJTl4TCOSzq7OjZUVZKMEEbnRmnIzrnY727nvheMt1GPRkDyqRwweganzTcs3OE09d
 WngOAVnKvPqerLcU2GzNluxK8V5xwYl7IHmxx71r0FeGbnK5LulDh+Irqyy5LAEfpObuEQUGxh6
 o6ZlQiFEX2bH52717CX6TFU0rgebHsE1kQ/OStNdoB3oBiHjnMQEd12L4bIdk9nHgGNvsKz8c4/
 3sQP1AjHWmAQLQbBYECNLP6VTDIFQq5ADrRXUwk+sExpqtmRw7Q86wbspfhHRh1J8c8KLfMxNVk
 Puj9ourzQZdszhr/wUtE1DkUX///ZHcgKxYQUXLO6dJnclWA8AETHdD0NY5YFERmYJDL60oFyNN
 6lxtHIXM/NVZfw7iVSg==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b00e3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=yMsay90vpbKVJel7XqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ePq4nAEZfl8lPn7ozsTJxBjeW_F0u80j
X-Proofpoint-GUID: ePq4nAEZfl8lPn7ozsTJxBjeW_F0u80j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108

On 3/10/26 12:28 PM, Linus Walleij wrote:
> On Fri, Mar 6, 2026 at 3:22 PM Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> Add a driver for the pin controller in the Low Power Audio SubSystem
>> (LPASS) on the Milos SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> Patch applied to the pinctrl tree.

fwiw:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

