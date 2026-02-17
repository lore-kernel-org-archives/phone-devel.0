Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337112D97AB
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325956; cv=none; b=Qi7TNjpoynsmnn1tpXhHV0Zl7uQ5+iwLMCbvkVL4lrJ1ifTM0/1+5bJax6lA6ktWuQVn3HXE8CViiNAdyeiwJvGMDPyKe3IvGXd+ExgQZdM1O9nG8sv7QHfSVoG0rWpUzWULGcWFkCC6JxY7mmYJRJR2+Nq58w5mvzKjQKMgttI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325956; c=relaxed/simple;
	bh=UdKBFZQUvbvqx3KpUPesANyIGJ53xywvDu1cMen63Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy2aE2XPcXJt58y8kaxykfk7TOmfiL5er1HPTkYFWg78v9ov2VRCme2hCRqZVgnUQzgL/ff/MVIf8b1kpMeB+wm00/78WPiovZ0HuSEtL7zXy2RQl8tjYV9ktCiuVcT1Yl8liJWf2XOdx7WRyYdDwSRsHDmnLl5zwC5tgwmDGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ufbo8f4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZ6ILL4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ufbo8f4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZ6ILL4Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54SRX2111596
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=; b=Ufbo8f4ezp+nRk9s
	vHcBvmAAjfEXpLWVwhsAkOJTh2mfy9GrHdUR997/kyPtlYQ2m3qKUfLfJ6206QK0
	DLudh+l2OPDATbxcctzYT6olb+owdGdEUoqJ/Jsqhb/17YA3yuLn+6f0EIHFt4hT
	BiTT2vp8MnJhetCvuFKpP4obNnv4XKtKQ7m0tZNqL/p5Q1cenfQWbdssGMSg64OO
	v1v02Hu55EvpibVrUpaOBr1b80gR87uJIaBSbDHebwzJsx6u88S0dlBhZ/wQm3rs
	k8+plDSVQU+huh1oRB0PGxjMleFV2KT7ZDhhHs6w+W9vx7hds+skoSRjsaetol9B
	kDtYCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4grgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:59:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5064fbe2babso31109341cf.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325953; x=1771930753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=;
        b=cZ6ILL4YpYIzMMxYBuz4AvDQQ5Zvz+PD2HJWrUEGXF/yOf+2MYDElkmCpchxEV53K7
         U0MUNJ8O2buOAfm0ErU2J80wVo3jWEcQXdEvnUydRd3KTwbASSkEaTNPXoDHB5SHHH/7
         ioGfi1CkB4MT8zWjYX9sUu5cZ60AH0GgqV3VeQIJd8BifertY0spXoG6RPv1qcESUq18
         NMZmnskrxt5BLJgkckBqOsvVbLUS/JFd+XagjuHo2LHQxfJ4M16TdxgMh5NhMDGSnThx
         tDY7UfM12EjVxrn1cuhdelNT8PRI5ZCxRNorm3BwLveylhOByyReSJx44sQaFJ1Qmbcc
         /63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325953; x=1771930753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=;
        b=PlYHzgwetCIOqJ8isq42nfB9zovo556q/vn3fDPNFqRf7ddDUHeIv1AHa0UEZpsWt8
         Liy5tDA9XvZeueptROzwo2WGrzGstfu0FPK3H0Ufp1V5XDGYwEA7IHIkV/ZwBMBTh1Ho
         OhhytjKmtu1NsfSrD1YXoESyv/sopQs+2h8k1f8Lu5Cv3JhQtfBNAL7ej+5xP05UE1Q3
         ZdqUOU1rh7Bhyt2STNC+LcVYdxrbERSVj4QXMsvBwMrIFgpaeYJDLkSkd2Qsby1gzQVc
         2AQJeZRFopEE9CS0KLhqUrXqV9kiGIDudVdFaaWD1u+33s3e8u/b18XskLVX6X57q9JV
         tkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx1vVRIDmOvN+JRnC5p2bZ6C5kbojCVxlI0TgXqzaXI399yhIPilp0BvO/EFaC2KDh3wP975xY8Hw/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmCK0ZFDdiBnn8By6ng3H+C23dyr/mBnq4YKdfVqFl5EIyMeQ
	01KByB1yr8/H0g5FFzQ2mG3VInM267UKAXTExcEMBehiYXPtTv6k0JT72PpQijFL6uL+4nQECl1
	KT81zbuwsj5dEs6l0n5/0Xj/OL0OQHLDy3cfqLxK2/6WVpFoil7LdpXZAS6QtYNvesw==
X-Gm-Gg: AZuq6aLLIB7t90wQw5k+3+4c3bD2cyF9L6H121AZpWYarKvhhLTyfDgHPl0LSEju6D+
	zLampfglluNFOTElC4RGuOneggmcveqfOeAm0I5w9oXykzcHKtroUJjmhiPkR2J7wl/TFm5p1xK
	WXQswjdoH47JVUH3Oc83+tH9arlDPI7GAYS1NOUwdAU+g/F1DqzlGEJLAZsyGdi7K0QKWxl92LN
	18xRqeeYXofVnhQ1qY5C7B6PumpW3mCyAbjIqVNdBnQZ3pl7x1TWsrNM5GNoAmq4SPHBSl3D6yL
	F9s/m0ghHKwZ4PbCxK8JF5i3WrifzXxwBLiX651K52J52hramBWqnNPWDXUp3LrrvRWT6ub2R+b
	eRSEeTknGZpDBZQC7/jpbQQbMDQWrWWCeD5uYtQcJK6CGqOu7Lfcs/fVZwYnMvzXJCfkFm6UtWA
	Wyg/g=
X-Received: by 2002:ac8:7d0f:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-506a6814447mr143961721cf.6.1771325953563;
        Tue, 17 Feb 2026 02:59:13 -0800 (PST)
X-Received: by 2002:ac8:7d0f:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-506a6814447mr143961581cf.6.1771325953193;
        Tue, 17 Feb 2026 02:59:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be01sm2447598a12.3.2026.02.17.02.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:59:12 -0800 (PST)
Message-ID: <bbe7bf3a-74fa-4e87-9c2a-0fee1a80f2d1@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:59:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
 <4u6yutdbpmsaz5t2rzjtttvvbf5onkckkdwxqma672pqnkre5w@zagnzqwl7ju5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4u6yutdbpmsaz5t2rzjtttvvbf5onkckkdwxqma672pqnkre5w@zagnzqwl7ju5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69944a02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=creFfYD69OIjy85eYnMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX0mLKjUJDveLT
 DKniC+tjLqK2DmtQgk/L4biihLH9VXWm8PtHsoRe7OAbxWx7tBtd5XeADrpaPr9E24FUOyIFcmz
 RuCCPCg7pfm99i1adimwKBIld2tDrWRXKUjetmrgSoLWvZz1zd7JrN9FU6gYt/NrnKAbs6haWzC
 PkYOZyzdtFnm04jwv66QkS8f8ruEPZF4nsddNPjKNo1FWIQ2kbA0RDES2v85jUMiqeo537eadvs
 29+ZtLSAdAGR3BnGtvno4zGkA0RJfURg9A9NT0zfm0Ry4NAKfs2X8oeslaHjDP7xrmv0IKiZRmK
 y2N4Rqtx04p+Q5vgX8x/EE+ZPou5KI9QVGaF93pdiwe/d5q5HAr4XMv5Sw8vULR6tS8/TZYopuR
 q3RrApWePPqsBATlvSFnoLNA9p0NOhbGEPYjgRngG9Y3qDURpatPAxnwK5DwI/TJKfsxuvxNHMY
 Ff3cSYzcWu7K1ln1MTg==
X-Proofpoint-GUID: fq1hN33iUTGwddyTnze7XXLrJ2piggbQ
X-Proofpoint-ORIG-GUID: fq1hN33iUTGwddyTnze7XXLrJ2piggbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090

On 2/13/26 3:31 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 03:39:44PM +0100, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add a node for the WCN6750 WiFi found with the Milos SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 46 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> index 024e1c9992fe..80feb3e9d3e2 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>>>  			};
>>>  		};
>>>  
>>> +		wifi: wifi@17110040 {
>>> +			compatible = "qcom,wcn6750-wifi";
>>> +			reg = <0x0 0x17110040 0x0 0x0>;
>>
>> This reg doesn't.. sound.. very.. good..
>>
>> The size being 0 is of course wrong, but perhaps more interestingly
>> the base address is a register within the GIC..
>>
>>> +			iommus = <&apps_smmu 0x1400 0x1>;
>>
>> And this is a PCIe stream
>>
>> But I see kodiak has the exact same setup..
>>
>> After digging a little into the driver, that 'reg' is apparently
>> indeed consumed, as a base for PCI MSIs.. I feel like there should be
>> some better way to express this.. non-everyday setup
> 
> I wonder, why are we using it directly instead of relying on GIC? I
> guess it is because we need to map MSI registers over the PCIe IOMMU and
> then let the other side write to them. How is it being handled in the
> normal PCIe case?

Looking at the recent r3g2 patches with the second switch enabled on
PCIe1, it seems not to be an issue there

Konrad
