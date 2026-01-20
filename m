Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62337221554
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915111; cv=none; b=I1jGTft5/pjE/YTHqx9sK4YWy0GwMPZsKHhH6nK/4oCLUjwAoB5Oua+/qGIJ+mU9oCE8M17YEMgW/ddFpLDECciTHAdi5TA9bRDv7xiBGx1NcvAqGM1SSCue9hzDEFQN0+McdVvphoF4IR7PubadxiCl+/PFeE9oviePV2va8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915111; c=relaxed/simple;
	bh=wVx0ewCEj0eGt3gTjSXza66ZpDVawBTHYhsNkFd5hfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UP+BR7OIuVqguNonqSpO5/KpHderfkKtiOOKbd0yoEFm5LapoiR7L4q3snJzEp1Xw7M9WDk2WdGBjZoAeqsfXgxfOZEQ4rqPqw3L0L8hEFcIoUsW1+hLzmhU4zm3QDIgNhYgYs7aoVnzRcxhu4s3HrflSH3fyn4k1MdRpx2PDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOC3m1f2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyFqQsUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOC3m1f2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyFqQsUN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KA94Z91347376
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 13:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=; b=nOC3m1f2KxH4Vegn
	Dk77+Uz+uHp2Qudke3ybOyykc8ZkbvqSBeucu+o+3/jH2vGY2AIMqJ+hJynClh5B
	YKDSfInbSDjV/2UsiAjBD4G67/WKCY7tAcIJCV+i5b5BImZqWL2AYNd/YOw9ACQX
	BGEEhaL1L6yuDIFsjaE+BaitftTbk5wiNrUWziELmyp2VlK+NPUxUi0VV/DnNjuD
	3F56DJB0H06mEwZ3bb4m6a9VnbmdU6gVCULPf5EyEpq4+J4b2mBxwh+aK7JPw49+
	g1LzaaCt7MAn8M2slakSEB2lUVyELH1MW5gMHG113/kPR1MJM/sOskrDl8dnPFD1
	CNUnpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdkbqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 13:18:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so114268385a.1
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768915107; x=1769519907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=;
        b=AyFqQsUN/ftR1Cv6tp1VkvsLI+ykske5pI77WGQFcWyGOfFWLITre9Tt4kSzpBk5OP
         AQZWwfrksiJFJAIXdoP/5lm0CcLEjNIqyTqGanF0GWB6aQRk6csyD5potkhvjwpO1nas
         d5MEJ/1pFsTnfcA4qTEkCkPMBXpfC9rieGVFhFZsJEVeTO0rizIZablDHn6s5SrSQ9B1
         aHjzIicgKoLANmyQZ53Lu1vu69OBiZ9NYj+pDzHCCeBsYu03wlNCZ1+SLwKwA8A9KEGy
         i6MB4PZ6rCoGYCxI8Y7Lr7j4gEgLqjRtQIA/r8/oRxTsO/z6UN/nQFWtv0LqpjPvvZFh
         R2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915107; x=1769519907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=;
        b=TUnDngtQ2b9Mcp5fcou6n3pBAxVPdX8sHBd9ENxFET+/TT/qEFJXWpCKm6jiQe9azD
         bEL9KCQA58n1zZzvV5MG9WchgUyi/kwtGBLhNKJhAKKIxUsIAompVBH9eKxb1M5SKO72
         9MRBDdydR/VVB9bypKclRPYodLw+tEJJ0PWH+vMiDXzmyrRGqEWH07qTGYH+kinQ0R5S
         bIe/AdaBjeRihOHREjyeZFMstnyr2AK7Y0c7JQwIMvLSD2G6ctqRhf8D/9/XhkcBKDAo
         iR2NzAuLuTKtMpq7ZYcAePcGizwxsEb5GhPE1tLH4qAG1Z33ZeCgFeuMRcjv8PSQJEBr
         Q2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWH36yjmUJlguwzLGcF5CezX7CGpvgujGa8wslG4k7TiAlb5oYT5EfaJH6zxch6JPlkSZMAktVqupHHrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYRPz7Gmy027u2YqhRNYZPqU7w2bK3RxDPZHpQFA50En7+CohU
	LEEQkGvUW4ebJSYBp4rlsLkAQq/iZV/c7IjC/z1tDec78XZzrH+KXpbC2f80cAjceRoL4oNlSpj
	Q2Nl+8gtlJ61wlNDwn5Fc7O1FS6PnynDa3F+p6h37skQbsg1ySh54GkxKQ16j+nxvpw==
X-Gm-Gg: AY/fxX5Vamgr7oO9W9pbu5S8UakV4ZvMLzasgtLcp97kwkWn1X/tEaRHHzUZlsHnl+/
	6NdBDOr/wbjahdaMc04OT/coRpQ5/lJtuai8O6SzpjQzP7vo9ZC0a1Xr1rhQCFFjJ7GIjqnLe/t
	R8qBWHC0u0OxwBfQ497cYKbNe0iEz4xeu0K+cNv8lCLO2x9ONuPyD/iwX/Mun1IdHjrnPwHo4DB
	cD+TXxqHKIU5Q850WqNttER04NRruiw86MWjkXtr8GMbfiHHMzb9PHAdLsMEhiFnBYe+G3o9NnX
	ip3JEMZdnh7nfIBH5Sjj70HyVTmviV+0ow6szzbX727nbPceBselfAfU9LprWh6mgzW9Yvepcdi
	FqHMb0GdTBBEHHOYItDRfEqeN7071jLpnuQT9aLThZwKhzw97turMVYQhKJqVfzUN4/I=
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr1491842985a.9.1768915107352;
        Tue, 20 Jan 2026 05:18:27 -0800 (PST)
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr1491837585a.9.1768915106861;
        Tue, 20 Jan 2026 05:18:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9763sm1330649066b.35.2026.01.20.05.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 05:18:25 -0800 (PST)
Message-ID: <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:18:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f80a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=ezRqCCqFh2AFBysmAOIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: lx5ro5oTqGpNVWEU1bArukx4NpBNOpP5
X-Proofpoint-ORIG-GUID: lx5ro5oTqGpNVWEU1bArukx4NpBNOpP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExMCBTYWx0ZWRfX7hd372dfCgrN
 vGp1RFjKzKXVS8DH2I3UtvZC2z7XJKVaZ3FK0/iZW9aRAnTGB4FOc1uxad++PsWDiDS/U7KcAMK
 HMQrfv4sxWvWuYsxsnNoGv+lK3QU0A9WLisrcg+gjdcfKyjRMV/ZWj0/n68ltAQeJs6vFtUDQ7G
 CM8KmtM+WGZkvmRlAlHp8tHewVZLuBk4CjqaDwngZs6MYNnBFhrpSwoRd1SqN5NUJlhnhrClb+z
 4d8pOS87PbOPQ4vEGFpaEXAGMf99+maAnze8iAx0RSgt4u1wMZp/vzQQrs0hN87JDUquPflk7YW
 F1g4yUNbh5CpHdU7k6xAyr7CEtMnfL8XitrRDfvaq//Ri4NNF+QDY44VrVWmdeVGWtITnRU/BoO
 r7BoE8IQMxQDxHVtdCgxYTYfS0/oAblMtEvmR9IpMeuPayjJ/YjqQbUuQyc6bScGAnTV2upcTMs
 jWaEcwic+lNjaWlgAKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200110

On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>> Add Milos compatible for the CAMSS CCI interfaces.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aec..c57d81258fba 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -27,6 +27,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,kaanapali-cci
>> +              - qcom,milos-cci
>>                - qcom,qcm2290-cci
>>                - qcom,sa8775p-cci
>>                - qcom,sc7280-cci
>> @@ -263,6 +264,23 @@ allOf:
>>              - const: cpas_ahb
>>              - const: cci
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,milos-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: soc_ahb
>> +            - const: cpas_ahb
>> +            - const: cci
> 
> Same comments as other discussion these days - I guess that soc_ahb
> serves the same purpose as camnoc_axi, so this is just last entri in the
> if:then: blocks.
> 
> I really find this binding terrible - around six names for AHB - so I do
> not want another combination...

I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK clock ("cci"
here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).

The CAMSS TOP doc (for Milos specifically, but I would assume there's a
pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_AHB_CLK
and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains most of
the programmable IPs on there (notably not the CSIPHYs, at least not on this
platform)

It further mentions that GCC_SOC_AHB_CLK is required for *any* register
access within CAMSS. Perhaps it sits right in front of the xNoC-to-CAMNoC
interface.

This only enforces my imagination of CAMSS being a fully contained "bus"
(perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus)..

+Dmitry, myself and a number of our colleagues were deliberating how to
best represent the hardware going forward and I think we at some point waved
the idea of putting every camera subdevice under a "camss: bus@ {}"-type node,
which would hold the reference to the TITAN_TOP_GDSC. This seems fitting for
housing the SOC_AHB clock as well and therefore concluding this discussion.

Konrad
