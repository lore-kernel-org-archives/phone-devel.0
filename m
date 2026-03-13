Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7738655A
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405686; cv=none; b=M41+7kLIXpSShxFC6nC3JP4IOumQq+90SSSRAJc3bTKeXXcKENetcx4yNPeB1/G/RtX2/TXVhjEmdxT9icxJ5s8bnUpK9TasWKCc7lcrWgQEDHaNBMw3aX2Rm6rP1upmHxx8LLT7C90QixdD8b/dDaB6d4PCp9tnVtX+Oz0KSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405686; c=relaxed/simple;
	bh=93fRAfe+M0UwAu1w0RFIgYxUtQJMPFt4/lW4UyUjK6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOZWWCUZh3nntyXQWQqQBIULPwI80NezZ8y8rBE/v0gTN4epgZMYqQE4AdkmT4YvhnsPRk+y5uZxGOMvKMdahywZQw/dzMcu+kjtxDoAlrzRgkjSbAnKC6LWW9omrTqzzOFu7Yx3+8mY2luRHo0817X8sKH1njSXXt0v1aGHHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en91guIE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJCygq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en91guIE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcJCygq+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iO7o2262702
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=; b=en91guIE1xJVHGFe
	KuQf6veMM6uWUiKz8haYPV25bd+QkJwLteLqsCNyi9e7bmKdn1G3ozdA9DMQtUuj
	pVOdIC50C6siotGCWcI9EvHQ1Ce7sw9QC7yzsOCRiGI8QbeuF4dYIsw0mOuCrWIV
	FXLzudpJB1v91jCGGzFFBLqh9HNZ/v/NvAiOiLtXnMlpLR6wTTFY4l3ftu8rJqNc
	XBOiFN3/ygBliefszT4dg4R/KpUmpiuN3lo808C5/FMqRYJk794gfOxmJa3Wly2S
	YcX12ePOMdgwhUxp305Kn6BTfVAbQYrwV3psbTfYXFmVNNalxjZ162f/bhj6Ohqj
	xp5IsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s0cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 12:41:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8e89d19bso116810685a.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405683; x=1774010483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=;
        b=JcJCygq+olk67OzuKs/K88pUc871OLjBlZIbOlYNCEBTy1oWd7tAw0UwQPdhgEWG4j
         gxB4jBDebAz8yZURd4sAJYdxdZtg7dwA90ZDPenFrOfiAgY68x+vb4aUVTWa3wLmy6ls
         3h2dUUKAKOI1uZ+WFXL11tiwrR0J7TG30LexIq436BHX21v+PYPChCo6qqW6RTNJUhtI
         hXUgYFS7vBIE5RNfKsP36yIEizefj2AV1eZdGnlgjx4A7NvcMDXErLBOt+AizAiyQ0Gi
         OYG7Pg2havp8gmpC8dUgScz7ljtityH193pJDLH9ssMdodvFaV4uSBdUq3x/GUJTrdfS
         HFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405683; x=1774010483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ARqNHfgmw+FzkOHRhQHIR9FE9jKNtuPOMxUqU8/Zws=;
        b=DqIeQ+96akA00hazRFpFXmfdh+IfmNrxsI/Yd+/9leXglyn5OOID6dbcNYmysf2QOR
         ITJ4NePCz2i807Kb0bZvfWMZ/HAJh5azpn5W/+qHo6IapGDTen5xk8qJPJeJXdY/eVmz
         ANvnMnHmXrbxFwFlcYIAibhRFw+L1lzHLudepCeSPOMc4++99rgqZr5xIIfl68ZzNQc3
         AKQ/P7bKjU2zl+J6eaE+lEDIHO7e9LtRnWFLgV1OQUasbwfVe0vw6DNt20ai7vHyu53Y
         9Ykd3x+6C0hdpxVsRPvnu8NcGwYNPzO5Sr7tQKj0zWw0ocGZhEMMZeamEhU3zlB2ZDVJ
         RnWw==
X-Forwarded-Encrypted: i=1; AJvYcCXqjfP55gNrLNTxfsh5BKV7vFFeJlLOKPeVv3b5osR4QalhjtX7FLwYvj78v/ZdIE1McpjoB7YSMxmKog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnatLdJeeL4pu6h984jCEAP3jumu5sar3qGN9Dd2dGVJql6egZ
	zOinz8CF3RZIQWGT27imz0SMnuOFga0c26ru+BRjNyylFhChlQ9Ua/xJU1nsxdkf0lMkH35dYWr
	9SYZqZkwqYmfdbCRJfgTA7zd9rYLBHC0UfncmQ/Bi/IxzqBhP4PhXMf6ClW3UqoyLIQ==
X-Gm-Gg: ATEYQzwUqHLj6lnjZnC7wyhiuelTP2+90Lt0B4WQBm4fYFQdeWIXfKnJtj+LBg0kJAC
	p+3eSUB4i1Q4XgGp/ZJ+BPh3AtkbOycJ79V5NLL2p425/hSoGvoMq+iJ3UpHg4y4IMAmkvDhpX3
	9A9FzT0G0VN1Rp6Ebb8anrKo8aRVwpMIJqvm0pP2c0E2kpKXkxESXlRa094nq0LiDcEhNwhpD6x
	vsWVtz64/QQKNlhs0FLkj7bvUgXEQpl863APM3xjruPz/sgqvNpPtJffy0FWPMl2PCcsjoJoWp4
	GhkqqEwKMV1usNRTWHfyKBv4fJLfF13fAzpSRjaPlbvP5ijvkZw22PlkMS3GxoESje69pL+Oe4l
	yKeeUS/ezGREWSnNJOmDGtHP6dwZu845K9ECNFP/0/DPZ9NXgMdgH33q0xczfIDKI7oukuO6SQ/
	LIuHY=
X-Received: by 2002:a05:620a:4512:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cdb57c3792mr324911285a.0.1773405683053;
        Fri, 13 Mar 2026 05:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cdb57c3792mr324908085a.0.1773405682574;
        Fri, 13 Mar 2026 05:41:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b14sm43894766b.51.2026.03.13.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:41:21 -0700 (PDT)
Message-ID: <9f01beca-50c8-43a3-8a6c-d2efca2d90d9@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:41:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 51L-oVeKrPPpF20YcpexEJ7g3qPw6ym-
X-Proofpoint-GUID: 51L-oVeKrPPpF20YcpexEJ7g3qPw6ym-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMCBTYWx0ZWRfX0lyXDRfEtwQL
 SROCyfZ0A/R/HZL/m+PBUdRkLJ7w7nwk3nXMVXZrc3Gq70FmgZgh0mv9c8cK/FDeIS/u7HU+l+U
 l+jW+zaKemuzmSRKD6rdnmSodwrgdVkOnYS6aButc1OBnIeD8NkrlUmzPLwpTVjIx9o0zcmc2cR
 7n2Fu3gIeJRz5MhdleLCLKsYqhaonhhQNpzwkoJxzaFPC5MTtQ6h/u4/hrztC3M6c7cK0LU3VUx
 fQ4l97p8D2A/YtRSPiom/5DNWop2qvE2ghBxpfuInHzSIvAEFaNAA5r1fKOxphAifpg56o/isTu
 AF9AmREo01fFAdbJLGwhEWRS4FIXdxL8Zw0VZGPTp52QdNBZSFjnsD078BALjqmMsGHBDQ5EGS5
 DZ1UKQW2FN4BVYLTlViHBDRAdd8LGKm7sWPzwq4bDFtlYlE3C6jE0l1STURhgU2y+FZ5L58msTz
 +8VmP/YwZC7dbw1jaUQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b405f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=JgvLXVqx2Q9J9S3OATcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130100

On 3/13/26 11:40 AM, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>> parts.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> 'clocks' to the PMU node to make Bluetooth work.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>>>  1 file changed, 174 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -24,6 +24,7 @@ / {
>>>  
>>>  	aliases {
>>>  		serial0 = &uart5;
>>> +		serial1 = &uart11;
>>>  	};
>>>  
>>>  	gpio-keys {
>>> @@ -215,6 +216,67 @@ trip1 {
>>>  			};
>>>  		};
>>>  	};
>>> +
>>> +	wcn6750-pmu {
>>> +		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
>>
>> I think a fallback compatible would be in order, if the data matches
>> exactly
> 
> That'd give us these changes
> 
> milos.dtsi:
> 
>     -+                  compatible = "qcom,wcn6750-wifi";
>     ++                  compatible = "qcom,wcn6755-wifi", "qcom,wcn6750-wifi";
> 
> milos-fairphone-fp6.dts:
> 
>     -+          compatible = "qcom,wcn6750-pmu"; /* WCN6755 */
>     ++          compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
> 
>     -+          compatible = "qcom,wcn6750-bt"; /* WCN6755 */
>     ++          compatible = "qcom,wcn6755-bt", "qcom,wcn6750-bt";
> 
> Plus 3 new patches for dt-bindings, with commit message something like
> 
> Document the WCN6755 WiFi using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Does this sound okay?

To me yes, but I have zero insight into what's the actual difference/
whether there's any. Maybe +Jeff could spare some details

Konrad
