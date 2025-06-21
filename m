Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2036156C69
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500669; cv=none; b=lOarU2WZRMJHB1xmU6lyN1zSLNCrCuSTZngq0rdWiA0yBm74Rv4edzdiLUtPgXsu8X/HcfmOykqJHJC/HSuj2YHlIghdlqLyemK3WPr3vZqZvw+itMz1cpeXSzfUA5JRHnbo9iGmbvpxV4fZTuZaGtyxr76v4KBjdRZDYmuhbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500669; c=relaxed/simple;
	bh=CZZT3WEEDV87AgzVeppysTU0hqzypFYvVqQ6fABNIxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEMd/CFfpJEPiDM4WjsbM1DQ0rqcktJaXwqTdIlmPuIIAuWbInSeDh35UHENdltRvhnepAxWLUxIz/FR6WM1wypXWLd9m1AEpDp8Jx65vWWSlgQRFSmyyowgmVabkxom3Tjj0BEaFALr6M/DpVwkyxeZlO1PhsjmuUVDIRtbaiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfUG2dFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfUG2dFE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L5Q9pj030626
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Orq6xVb2NKaaLqSDAmeRwX94lHqJJdwkdgnmCDoC3WE=; b=cfUG2dFE/RicYKGs
	Vc/QrdzjZphcahHjfuSO2/TQildoS4dWYV3saCC7BMGYEQNmMU3uVYJjPzMV06+N
	PcmjPc4EZmFPiN18cPMjuDuP6XauQtmICkxqXNio6moUV/LFCBDHFaarsHLCFyeW
	s+4jjVEdrB/Lilb2qfiUy8FfhigyhX6yuuF6HyizuNX5nWsFidMImN7G7u0YD2kD
	RwP2sBkg7aQvSeQozvw8aR99P6mebg/WkvS600z1bP63iNl9tXFkSJfFJ/2WPnrN
	2P2a1cX/uMeFwxNy6MQ4GhIUelA3FVaQ8Idee4UiTxuMRCSfyDL+TW/s2knXJChw
	sj8ruw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpg20b97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 10:11:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso516516d6.3
        for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500666; x=1751105466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Orq6xVb2NKaaLqSDAmeRwX94lHqJJdwkdgnmCDoC3WE=;
        b=A7HK8HOu7nOtjUiPVhilZvdCl6SlmETFzvu2Jfx6UXRpBFOZHnpXnSk6QM2cLu2VvB
         0G42mZ9WDruAucKu+5W9dgdda60qruDicyAbKUb7cjLFKIy2LUbpnYQUrv0G3ZXQhcEk
         Dc2nbtZv2OFlYki6KEL1m+Kk+gWxN/MToOmxyROuglKT09JgUSY6Q+AjJk7J6xlY9ad8
         DngmLKaBG+8PJx6Iz7kz1oOb1+TasD2H87R66RsEGdbQzRwMr+ebsGSvYO6bqtfkgLDU
         RYCrVH2BzoizUv74id99VaCchBB7LVwAsiSSL8RAbmpwCWxZf/7V0YgxLBFG9Y734Wx3
         KC6w==
X-Forwarded-Encrypted: i=1; AJvYcCWD16kNw4WSE1+gU9VF67/E93ndWMyH6zOPN8CFr/BUnFQRyk1cIdXBYacu6CgBaywO+Q4o1qO3hVEwvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1KbZ3/EvwiY1Aewi7wrWHgjYlONabpietWNQOvKLjhkkJhkf
	ffWjeh/Nd79Cuj5rdvsbqo5gMMwdywk+Z1Bv3ZaVYND5v3fpxxlxBpmfdrnZbjyrqP0YAVzkraW
	3Y/AMUbd7fgYFZNoUk2KnlahMm49xSkg6Lidvo0Y+Yume1Hky8GRrQREFSlqtUj9iyQ==
X-Gm-Gg: ASbGncsEhQwXiK4A5GpR/8e6/mrJRZ0D/9MJUIxO9nUpRQIhgUUxOajLe5qHYR3BOFX
	zMZPDUw78e+QGDfnnv3k9EDvvguHeGuFXh/JR1SswJO8gaijguywoqSlcV1blO8f+Q/qnTr7Z/1
	lfsx9Ab4g4Da5Bc97i9Fv8ttqD5MQfxyr6ehpiI6sVHVEazAf/ZtgIjXqDAXSfIfXBjtyuNpZwd
	sKskvaGL7GqkBkHsKoF1uGFEUFhSElBb+BmmtQ3sjKK/SXs1i8udXihMip1X5jxM+kKWXnrNHxi
	HS449KqLJACk2GirKMFrEGngmXbuzSD1SNqieK23yZjnyvUkiSX0cva2pRrmJiFW1tIE2ZcFJHi
	Xx6A=
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr366508385a.3.1750500665811;
        Sat, 21 Jun 2025 03:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI5hLRnCZ0sPSXDM3AR91gKrHB4k2pwB/s4SqmDLL498a11aGnE/v060gc2/bExJIzuAgw5Q==
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr366506185a.3.1750500665404;
        Sat, 21 Jun 2025 03:11:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408300dsm339519466b.95.2025.06.21.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:11:04 -0700 (PDT)
Message-ID: <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:11:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: Luca Weiss <luca@lucaweiss.eu>, cristian_ci <cristian_ci@protonmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht"
 <~postmarketos/upstreaming@lists.sr.ht>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
 <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
 <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfX2u606ddG/zTE
 yOMvWXQfKjHUQ+k8XS0D2VK0BHZx4iPfN3msg9cOlbTzwrn0FEzTK6e4HkCOQ+gWq8fw44SmI2M
 Eq0cDSKnXjly3d/6NdXFV0FRP1Z5dP6tXvU7G9qajyP9cynAzepYcw2fReO3DItvbzi1ZM2eLUQ
 NpdcnW7jzoA4EYrs+qwca+fJSWA88rxxrKb3GM7chAcJ/rlfGohISMvajI5nIVjqrOMSmWdlR9M
 Tp5gN5qPuDsJ+O11gLNfNusHlNFEh4kA4SS6SD3OCLot9jkVLoxx6G6IzfzkzZdoC8DfbrR+Do1
 +rjUtjr7FdFRKMYKrziAf6uecFXjK1qXBLC7YHxy5o7+XANjOzpxB6baxBt3hRhBfUi36nhh1K5
 D1HLM+wal3biIEs962HsOkshEKYIDAYrpVzeq4mzl8nLe7dO2JDpAo8vbbv8HRBWxTDoBs72
X-Proofpoint-GUID: u05ZLbL2jax7my08btLTMiqrbzm4QOw_
X-Authority-Analysis: v=2.4 cv=fb6ty1QF c=1 sm=1 tr=0 ts=6856853a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8
 a=1bQLa7EovWpukNELjvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: u05ZLbL2jax7my08btLTMiqrbzm4QOw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/21/25 11:27 AM, Luca Weiss wrote:
> On 21-06-2025 9:07 a.m., cristian_ci wrote:
>> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote:
>>
>>>> +
>>>> + reserved-memory {
>>>> + qseecom@0 {
>>>
>>>
>>> qseecom@84a00000 ?
>>>
>>>> + reg = <0x00 0x84a00000 0x00 0x1900000>;
>>>> + no-map;
>>>> + };
>>
>> Looking at downstream devicetree, every reserved-memory nodes with "removed-dma-pool" compatible has unit address 0. OTOH, kernel documentation [1] says:
>> "  Following the generic-names recommended practice, node names should
>>    reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
>>    Unit address (@<address>) should be appended to the name if the node
>>    is a static allocation."
>>
>> In my case, downstream devicetree shows:
>>
>>         other_ext_region@0 {
>>             compatible = "removed-dma-pool";
>>             no-map;
>>             reg = <0x00 0x84a00000 0x00 0x1e00000>;
>>         };
>>
>> which will be 'qseecom' reserved-memory node in mainline devicetree.
>>
>> OTOH, 'qseecom' node in downstream devicetree also shows:
>>
>>         qseecom@84a00000 {
>>             compatible = "qcom,qseecom";
>>             reg = <0x84a00000 0x1900000>;
>>                          ...
>>
>> If you confirm what you suggest, 'qseecom' reserved-memory node will look like the following:
>>
>>         qseecom_mem: qseecom@84a00000 {
>>             reg = <0x0 0x84a00000 0x0 0x1900000>;
>>             no-map;
>>         };
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> 
> The name (qseecom@84a00000) mostly does not matter at runtime, it's just a nice label we give it. The reg is the important bit that gets used in reserved-memory.
> 
> But actually re-checking, I don't think your reserved-memory works right now, msm8953.dtsi has
> 
>     soc: soc@0 {
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
> which means that you should only have one value for address, and one for size, so "reg = <0x84a00000 0x1900000>;". This is different to most other Qualcomm arm64 SoCs.

reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;


Konrad
