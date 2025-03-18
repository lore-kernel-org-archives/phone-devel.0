Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1D206F1B
	for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293506; cv=none; b=FaHAAQmAW2/HJ29ERLMIfV99KYMBaW7qAzEO5nnErSyiw9n00QvtK/jO7GHOPMzjDwcjwBsjPH7ELaFh+XT0to3BHjY5GXZARIPfK9OtVzEnk/3ju/gWq5hL/cizUyKbFzLbVaJq9i673WEMPjkg2tOcfTLzZgpYLW2JLTslBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293506; c=relaxed/simple;
	bh=viI7y/zKVyvSQat5yicr/ZP4aQMPwYcfsOE3HA4N1zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJyvWA28oJ30kkhyiOuIwdOCexlQOcJ8FBO2MICQkaMaZOFY8uF473MfOpmHtXxzrSy7wYo27lniQvDxApHNBjvg7MoEHCGv58jAcK9oKerojfZvhbo5ei/WpgfncQSiAt8ktc4lPzkOKBgGdrg3RIgI2MQbMWgTLYXRjB4joY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IASshelC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IASshelC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8S3ng002276
	for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 10:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tGWEqzwTs/fY6RPkduOMFdSME0M9poWROeZ179aC8E=; b=IASshelCF92cIw4f
	A1dPhjICdvIqb6ufrw2KWwm9tA871vKxWyLLy+V69JZFMSQIyzibEEd6RSEqxV/g
	HVJje31jJw5qEq2eLZshtfd/m8/eqZ7juPPbU9Ypaw8hyWX54PKSCm81CWy0Lim9
	aFqB5Gv9APizKnl0hPt09l/RjD9gLSYTHEEEhUm04pMg3XQvVOOpQGeK/CnvcFee
	ljSrAtFPz8oIWVcI4/acLvDrPkfvQ3Y3uhIMoQJvO7qWIxnFrjtmGICsqA3JSG3/
	W6v5STl/Ib/kyzfCCX3ahR3rPpxv/xDxHoLoPSpjDmDwXhQWWCql8tk6X22y7uCs
	13aKpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7ytpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 10:25:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768b27fef3so7711481cf.2
        for <phone-devel@vger.kernel.org>; Tue, 18 Mar 2025 03:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293501; x=1742898301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tGWEqzwTs/fY6RPkduOMFdSME0M9poWROeZ179aC8E=;
        b=JO9jIoGJ6Tb+KD1GqLP9rTx9d/H5kmZVVB0HUmkwLi/uZX2bevE1GuXAejGbDEF2fF
         wAYRQ0jWUuhraTfmtqw+uVJjnjqx5i5olj9kWZnjs5IrJfA5SdKK1n5PYYLCcWKgqSSg
         +DEsWuHsiAMUqIzAMF8Wk2oW6irLQ4iU0w8nqiQidZp2zXXRpGjRNqxeSXpH/Lhi9XmI
         I10yt83Tk+M7TPTqmg4cjeWSDhcAgCCSNcG6596EISr9pqOGOqUvxsHgtg8SnCf2OPIa
         ZCX3/7TywLVncB3ed+foUc13Zs3hAh5JHoe84B1VEFWrQA0vHXw74yhtdmv7uMpvVLb+
         Q5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVcrvVyL/xrS8INwqgeQWkLM22AFR0/m2mR29at3Uentsl0KzLyg7pCjhwcGYa9zxJkkz8dq80YkYE86w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCMwmMYYvXe6BnDhx4PHK6Ceg4NzXj4CUC77lCN3JRHN9s4mJ
	VxX9GJn28rdIhSFq5XnnOow+kVYgM9uIvurONEsvDa7pnJYUbvZQ/Nng5RuW3AEI3DV3I0wI8Qo
	796U8h7aIecb5vDeKnPVy12tmrFBC38iiVsjlHGY59EXyknoXmxqqf3aJ587new==
X-Gm-Gg: ASbGncvttaYzNt9mB4LZ2oS+YC9kh862vn2OrEDWH2XpacSDsXzTn/8s7dtCF42RE14
	DCJgI+j93uWzY83Gxpi6oNbyJT5RCyVRJnZSEmErLOP4j7lcX6C6gCv+QZR3J0Wgcwfm8ShV9rm
	XJowrTPyLse5pObcI5xdR0EzsKzuXLrlmTebP7r/dmbzMr7/oXeB5dCtLlXf0gkucpaoDephe+a
	XEh33H+D7h4pPXx4tLxIkPV3agn2vNKPahxDVnsf9/8fq3WqT1ltLWH4IRY1MLmCTsbyM6smLAJ
	FzoT/fN0IWBibdImEfD7TRjRPuf3pKVP0zO3NLSZ5Edi+z5feh88ycBt1W3W54OhUiQWQw==
X-Received: by 2002:ac8:58c1:0:b0:471:fe93:4b5f with SMTP id d75a77b69052e-476c81b622emr86278441cf.13.1742293501463;
        Tue, 18 Mar 2025 03:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDsMQDOS+0HDILyNXHIvpznOD0Y7l4AYvNrP+8R89ZspJwFSR2+cZXNbEUsjSQJ6tnA8Zr6g==
X-Received: by 2002:ac8:58c1:0:b0:471:fe93:4b5f with SMTP id d75a77b69052e-476c81b622emr86278321cf.13.1742293501043;
        Tue, 18 Mar 2025 03:25:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968bfbsm7331474a12.17.2025.03.18.03.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:25:00 -0700 (PDT)
Message-ID: <8e830d99-61d1-43c0-bcd3-a8b669fcc2bb@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:24:57 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
 <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
 <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 45uY8M_qb5qLObx8QSk3ezBpHV05eiDV
X-Proofpoint-ORIG-GUID: 45uY8M_qb5qLObx8QSk3ezBpHV05eiDV
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d949fe cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4oVbTNSGWYtvGuB_2MIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180075

On 3/17/25 1:12 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Mar 14, 2025 at 11:08 PM CET, Konrad Dybcio wrote:
>> On 3/14/25 10:17 AM, Luca Weiss wrote:
>>> UFS host controller, when scaling gears, should choose appropriate
>>> performance state of RPMh power domain controller along with clock
>>> frequency. So let's add the OPP table support to specify both clock
>>> frequency and RPMh performance states replacing the old "freq-table-hz"
>>> property.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +			ufs_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-50000000 {
>>> +					opp-hz = /bits/ 64 <50000000>,
>>> +						 /bits/ 64 <0>,
>>> +						 /bits/ 64 <0>,
>>> +						 /bits/ 64 <37500000>,
>>
>> This rate on this clk requires opp_svs (not low_svs)
> 
> Not sure where you're seeing this?
> 
> This is from my msm-4.19 tree:
> 
> gcc_ufs_phy_axi_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 50000000,
> gcc_ufs_phy_unipro_core_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 37500000,
> gcc_ufs_phy_ice_core_clk_src:
>     .rate_max = (unsigned long[VDD_NUM]) { [VDD_LOWER] = 75000000,
> 
> [VDD_LOWER] = RPMH_REGULATOR_LEVEL_LOW_SVS,
> 
> My intepretation for this is we need low_svs?

Hm, I took another look and it seems you're right, I must have misread

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
