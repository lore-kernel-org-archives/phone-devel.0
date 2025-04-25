Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EE21ABA2
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609174; cv=none; b=Xuc1DbQWNdwKHAVs967Zj6/Z/e4l23TAasnZSyT1jW/oDFP6nUKBlzWtpPMsfXgFs4PK5eZ5yOnhfux2580MlL94G9wkKzTzqbIi77DA+SnqNdGcMd6WwnR7h1vsKJVJO03bBKU822HdL1BBaSgHKwyaZ1HRbQDAxsL37VgR0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609174; c=relaxed/simple;
	bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK7ZBVH763QHZAV2WHxqHejYfYjVSuL2oX36O8a45fEdD4gCY+UCnahqhKUfbR52R2WmtsFm7sAjiINbaJ6rJxpMEGwS569yDWS0eb76xxNt+9BHj6ESTxI/TFXR5vtASz1yZRhj2LOZzoAuRTzhVpVv8IlJ5kBR9UJc/b0H6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4RMZY/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4RMZY/Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrV6004665
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=; b=D4RMZY/YHGrtcRQw
	lVQYHp18r3mZtZ9ZsHHzxGCjgDID+iqFkDbxU4b+CzOWpSPob5qovR9UtF2y7i04
	Q9TyAar5JYujyG1OjGF0BmcsCIL2fQb0lY2c6ingVPmIh1p1CWFFVK7UuplXnaX9
	cbAbCc1ysortnRatYOjDgV4WedQXvO4/8SVgtuaviiWgw+VYspu3a7MYpDky3jKG
	MubdZPAed2QbA/CzjjVmfbfKOfTHHL75UC+ZznfpyoYZqoNunvuf8rJIezSTMtqB
	ke0u5kwSASdhQK7+3c2IforuyCKPF35xaWS7UECVzKKBxIliPe9HkLjWMHOLdsU1
	wFD1sA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a4cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso5994221cf.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609170; x=1746213970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
        b=pvbKY+mlHILsPXNWBPevti8Sa0k/GCGoom3j1E7eCr5TFgAqjiX9AlDdwXgic2fbL5
         AaS9nTfS1LwIAOilOb8ldzvuGBkiNEkpL7AK8MdayWE32XYHumhl1hFvs26ORnC6FnCc
         K1JRf/zzMN4mDVdwmBmZdVXuA/RVbvX8LyVfgA9Ikzz7BZW355Mv2e5qsIdWAViLCyso
         k//ZtnDw2F6UNMOBAGj41QlaFGHDrIcZZi5SX+LT0YQvU88cfBMxbMaruMLvLsPHOc+x
         p7HsZrPib8JKIjEH9DjvFWg4t+WrpaSmWNhCrJTwWF4jORqehmT5i9dTa61nFlMviRaL
         vYcg==
X-Forwarded-Encrypted: i=1; AJvYcCWk6fBNk6E/vmAsv1UpvL6TgMuRHscX7tU0L4T+GBiPFDhdkyiVFaoNqE3EwgxJjda2mv8wA6HHHmLTSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMC/IFwaxYkyNs9OniGYIqJLrXeoVLwsClVYZQTl338rkvNjpT
	mjNb58UPAaF90GJenBeyo2Koox07vUXV3JqT2er9KWwBm/izKkMMY++UNBvJISgW+ADyiG9bYZB
	pcpQyKgGCrYy5lLs4uL+neQeAeUHVC2nZ+FgtvF8GYUsYpVqLElg+8lhv0FdySw==
X-Gm-Gg: ASbGnctsBUhwcTe0T96cO2RhXkRfX3c2ToJ7p81OJA44JihX7y0VLXdcypMp/yM9eJb
	ArS3qqcZcCUE53wrk/FeORzLeGNIX3O0Mh5fvMfoi7iRE2EB1tsXVcTiGcJf69hcUFMlu1YOXmx
	TUipndpme7+sy+k3mTGECHrJfKOrcYw0xOVK+Kuz7aJLNENrWUIcx5Gq9ggMnBhUMPMvYvpQQdZ
	JeOwXBCI8Nidkn+oJ9bVBX0uSh8PPMnID3qcwHGZ0VkH852AOY9Gx0af2eMJFILxapOO+Y2EztS
	uxNlvdcfHTw0apHKQbxEmHRw582Z0QEwDEdsSdI1zFh3YA6trJcUAO6gbAe7JLiw76k=
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297701cf.10.1745609169915;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2r9L2pHOoYHGaxcw9IGqNIifgrl5bAlz4s9wksJ/7yXxAXtbVK+GxNShhVnzb9jvGPXJzw==
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297581cf.10.1745609169507;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf7397sm180940066b.92.2025.04.25.12.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:26:08 -0700 (PDT)
Message-ID: <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:26:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfX4UxXlpPmcdx/ NN8h8OMZ5tJ3Q8WEUMFIyXyVrPcxYprZt6ybAPwNH9lLa3r0Nll157V+dR51ZRe1w+34tdUXtzm YwwWXZePFzEszTaky6T9mpR8EF37Lyw8KR8Hd6YMpcFq9SSFRDQ2AggyOPORrcILuwlXiMTIHIU
 EwVydyMz4jB86sLSxIww0GWAqHmVmGukVAmMBZd3rXfF/IUGGbNJa/xzkJzOqLgiwpoG7UAFJbK xd9hWiStHlNeAQu4wT7aFFRaX0LKvSb0UJwzXwMEyWFlt62e8KhLwZK8P5AunPId3UrsT9Qh4H8 KgYppReoUkK3ymOfZ2A2bSV5lVxCC4qUzXqJgSO/SgLdd+OuG3C6V1eFij97hN/AJv5OUSspmUW
 YJEJGWI2RVH1VelQ+sqXRg6rmYfGi+oGYT4ZcHRJss/CPH/MVUygaFtkeUt0RXV9fPYvu2Un
X-Proofpoint-GUID: W4S75nwANCxMRl7kQ_RFdaSXz7n7eR_k
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be1d2 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=uxr0c4oy3NFgYiDcH2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: W4S75nwANCxMRl7kQ_RFdaSXz7n7eR_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 11:57, Konrad Dybcio wrote:
>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>
>>>>> Add initial support for MSM8937 SoC.
>>>>>
>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>
>> [...]
>>
>>>>> +            gpu_opp_table: opp-table {
>>>>> +                compatible = "operating-points-v2";
>>>>> +
>>>>> +                opp-19200000 {
>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>> +                    opp-supported-hw = <0xff>;
>>>>
>>>> The comment from the previous revision still stands
>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>
>> Right, I have a series pending to improve this situation a bit..
>>
>> In the meantime, you should be able to define the nvmem cell and
>> fill in meaningful values for this platform
> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.

This seems not to be the case

https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191

Konrad

