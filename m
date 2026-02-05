Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544A3A7F4F
	for <phone-devel@vger.kernel.org>; Thu,  5 Feb 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288668; cv=none; b=ovZwAqZw6q9EIx5GO83NeGiPB1Oikw+vY5/Tb3V3epN66Jp+S9K/1YpVVRvmvwRWKJiaIQzJPsz/Lnn+7HTMFPnrqeERv8tlvvakNKEmt9RfoyQj7+Lm05lUiQmcvmN4/yLirbTq2NmM9gZKGktdptWZU4CeqmVdxjq0DGemtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288668; c=relaxed/simple;
	bh=w82cuJogvmAtlnyTMJ0dtkRsLTv/YyrjrcgtsGaB4/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEvyv9jhGsf2Z+DyEVL3XnCaqzbalN64cpr0JdYivHNxb3wZgTib8xXFBctsvQyWj2hb4D6OKbDy4bvQnp1Y43vLRVjExAh1cAK6dDsmSHeKajxnWd/KaWVqNHmNXgMRC86G01o3dH/5I/Ol8jMx0w6u+Cfbw0kR51SHVjRQ4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0wS2sXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7TEO7J1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0wS2sXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7TEO7J1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dtEV3031046
	for <phone-devel@vger.kernel.org>; Thu, 5 Feb 2026 10:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=; b=V0wS2sXzOR9O09tB
	jVFq2ko8EpLJSzyxa9zWjqPpasxxYLRvQ36mgOMkFeebTmkwPar2Zc43H0lOSj3d
	TMnpKc9qLIVjVf3ZzQ4HV3KLesEUDlPEiPXNv7GK1o0p1LowrZY6ZzbXTYRz3R0e
	Wr0I0tMForApnTWarpuJKhYUCNssNJZdimcpeEOAYlUUnGq5QHBWCCRt4y/F77C/
	IS+6d3EZtwF1UnlWRyACzcG1jq+UUPKsQSZuxcSV4sYS9VB9Yg1zjTw71tP9q61/
	7KoZ2YjMO02TKkCjHxjHEMsY3gaaTbSzRpHGTRyooZ0lgBr7E5GuTbbWPz76j12O
	pGnUSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tjw89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 05 Feb 2026 10:51:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so9430285a.0
        for <phone-devel@vger.kernel.org>; Thu, 05 Feb 2026 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770288666; x=1770893466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=;
        b=c7TEO7J1BIA6chfYyS5h0JFsABJ42XSs5eVe1/jx3akGaA+1bRUEZqa5XWfq37BXBI
         PspC//zD501wtfddhmWpuCjT1r0qqn7d7FkUmM1ObZ0LUK7KbAlstg94rvnCBllX0Esv
         rGu7JsCym5xI7qIg/c3RH1dXB6IeVzS0gtZ1pntQt9WVI4gmWMgeMa++4oro383SEfqc
         nV/mom5OTE2uDo+B1YWFfsJZHQb6PVm4rXfyCi5vVHC0AYNClGYB6BnP+ymzDIWKT4tP
         p+iWkAjUaEvhMbqAKsiKXDzk2dWGTUyctLTQQgmdMePyPrmQOcvJF8qo6rMUjS3LppRz
         w2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288666; x=1770893466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c07KdBpCk0oynCm+8y8fUcH+9LrRngoiGgHIH2HoCVg=;
        b=wIOjWmY77La1SNlM17cQfWTJ2iAqsGbvKYqpOaXTGazbYWlUtFLdLOALnxtZV3Pn8Z
         n2ZEMJjDXv+B1YmYUV5Cw9ONNYsJeNCNrHnXNioO/6h8+kb+Mk2617Gz/UVmP4AxGMIb
         ojN62aXkrkhAWB7X5ZD5ycM7qipbgm1SCS6QQ6rugsL8J8dE5WWmFEooHmcsqmC/1TuI
         n2TuLWdg1MCVF2bWmEXIcO640zd27x/ofvNk26/UbiqDsSzMn+M1yAo/QAl6AKCISA9F
         09qtt8KUIQAIviiAT/g/u4y+yYN0hVqiBN7JQzBa71PBweCEHCafZT5nGlFK3K6OEpte
         2Hug==
X-Forwarded-Encrypted: i=1; AJvYcCWE1wv7wuHV+WvWMgMxqjf1w1vEPeBaCOcLBEOAWxAcyuE7JgbCZ5zjK7GIz6H9cnXfH6K1zu6LHDc7RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMx+XroBuivjd1e5V8jjvICfTEOE2xlL9NXtOokf4FpICqRYI
	sW1PIy5XIL9v2kQtUVtpkYuAoI971440YJEiLElFQKlXy005JiNhqTFooLQno2oyXClXCpE9/6x
	OL4+0rVmCnajAZ2R1fmxj9AEv5C1qFO9fcrPTzX1LhyJrYfhoFklNm0bE+SZjA5S+5g==
X-Gm-Gg: AZuq6aJArZsEJCjXdsZCBc/bHJMQxvwOwDYrI3msydMX70t43nucQpQTZKn/sxqzAkS
	+2nyMVhAoST8K5Lek01NNhOk6tF6xGj1CaBhRbQ3rGe1F67ToBkKIJPRLgWvF4rxUthoQdZPIhR
	lR2It52bX5zPDJC3Y6m9PAL/XBti31cHlZKVVcHMwf4UPb/MW/fxf9ESf4iSwFRxr0qGEKh4pKO
	ryGT6Mwj4g6CJuuprmtK6RVi5pNRoCDjUMddUXTilZbgzBx0Of+ZRaUZ2wRPnSCGGy++S5Lod/J
	gbTFkniqM3bcGiDdJp27IIxRqqR166YKiuAS/+8/Z8JgPAVfQ5rVi4mnc8ZmuGThiJb1yCKkutQ
	5o6uHT3mwvOI7AA5w95vxhqqm4dFGRqypv91vYpGJRMR9aCuCZlmXKex7qzD+oVl8ZWs=
X-Received: by 2002:a05:620a:44c3:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca2f826c1amr651268285a.1.1770288666239;
        Thu, 05 Feb 2026 02:51:06 -0800 (PST)
X-Received: by 2002:a05:620a:44c3:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca2f826c1amr651266185a.1.1770288665816;
        Thu, 05 Feb 2026 02:51:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0073117sm211208666b.71.2026.02.05.02.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 02:51:05 -0800 (PST)
Message-ID: <ea4877a6-3032-4710-a563-99230b6f861d@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 11:51:03 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] testing! arm64: dts: qcom: decrease WiFi antenna
 regulator minimum to 3.0V
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260204-oneplus6-wifi-voltage-v1-1-ee6fd47f9d02@ixit.cz>
 <d800d5cc-0e57-401a-a62a-42e9c40125f6@oss.qualcomm.com>
 <851db388-61dc-4916-91fa-32b96113d4aa@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <851db388-61dc-4916-91fa-32b96113d4aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S_wMBbiatB77ZJLbLzjnVRHHRm5kR7aP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MCBTYWx0ZWRfX7NAqCbg9ZpVs
 uMQl+VK1OqSBjffi3xMVp32Kzx7WaVvUif3IFa4d4u6MNFIyzL4VEpqWLqQo5DgaQGSX1cuX0Js
 bftcvSLGvYASJcwU7jdsyc1iZ7QvcOShHkbGENdRxUI328C6S9Ky/sz9qq7Yw5PMFyy4PxiAajS
 Ha8yZ2QcoNeeQEfESLrQYtpNU7KSwfDIl60mnSMxWT4te6qiMln0QbampgKYzg9Vv9B6aa+Gb/s
 iBkhLD+gqGFynlqrHNEVqW0FDSP6aFqigHCM6LPSe4pr0lPozsEjRLKVRN+pMMtyhkeLpJLVhe3
 J0sb7O9OO2w6k83AzeKQDszO7LCy104YfsUe1BlLBZyIvlZDkKqyWAlmSsmpDeWx8iQHlryehfM
 x98o8N8bbWNHrNzsvc9BVGES0wai+VQJ1EPY3lhkMI43GZBg6VO+KGOxnFEUFciIpiaGQwRKCXg
 MS05NOxCEmRNEvHmLJw==
X-Proofpoint-GUID: S_wMBbiatB77ZJLbLzjnVRHHRm5kR7aP
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=6984761b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wKYZdr8hRx8ZL1f4wtIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050080

On 2/5/26 10:58 AM, David Heidelberg wrote:
> On 05/02/2026 10:05, Konrad Dybcio wrote:
>> On 2/4/26 6:03 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Downstream defines minimal voltage as 3.0 V, while when OnePlus 6 was
>>> introduced to Linux mainline, the value was fixed to maximum 3.3V.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> Tested for ~ 1 month. Seems to work well, no visible issues anywhere.
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> index 5b121ea5520f5..e950db41ce25a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> @@ -307,7 +307,7 @@ vreg_l20a_2p95: ldo20 {
>>>           };
>>>             vreg_l23a_3p3: ldo23 {
>>> -            regulator-min-microvolt = <3300000>;
>>> +            regulator-min-microvolt = <3000000>;
>>>               regulator-max-microvolt = <3312000>;
>>>               regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>           };
>>> @@ -320,7 +320,7 @@ vreg_l24a_3p075: ldo24 {
>>>           };
>>>             vreg_l25a_3p3: ldo25 {
>>> -            regulator-min-microvolt = <3300000>;
>>> +            regulator-min-microvolt = <3000000>;
>>>               regulator-max-microvolt = <3312000>;
>>
>> A datasheet tells me this is out of spec for this wireless chip
> 
> As I don't have the datasheet, can you clarify if the 3.3 - 3.312V is the correct range which should be kept?

These settings are OK.

Konrad
