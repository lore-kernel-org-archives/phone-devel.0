Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852032BF23
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325819; cv=none; b=W4bNV/zYIv+BhEhMO1t4areNQzhl+AbEa83Aw7y7wUrfeRugGwIMMHC9AmmUlb8C1nMhGjkaNXhw+794hVDRlPB8m5XdBEPspqzitSWm/gP/CiIgVnuNSDloSwJIOAx62nOQWwrwrt550/pfg4tfu3Iu1j7UCg83UeVFdoW3iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325819; c=relaxed/simple;
	bh=QZYHUupLS+Gm1n7arQxFjLloO9nF/zVi5QNMJK3LqvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKCwuGSFNbqSG1cWCH/R6zArjsQ2+fgM+YKOSVeSyUJuUkMagvidZSEmtjBxI7VYAqeC4heq0I+y/IFue5yQLnRxiaMY6t3AVa4otSqfxg/6FVX/vwZbSqG+VL90Knw0UnlytetIbweXLLGoVbFsiH/DAtIC1D2DlZQrwJKwIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ma1/YQ3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbnpS7jO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ma1/YQ3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbnpS7jO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8CZwd297219
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=; b=Ma1/YQ3qmY3TLf18
	Gn+ErqDVtxERXfRJJViNqAP7tkcxRsnJgztNrpkLr14TzOKO3ZzORJe2mhTvUXMO
	wY5pmJRjcc8jRqZrDlxAwuCr/GqWjZd+OPT8vZK59HX+qfDBKWiZaSYDYNiE7V/1
	1QfU4be1dRBRH9nHxTlpKe8wC0W0pCkoIxCjx/ziTXuPmebhLeTc5Oj1BSpsQ/PT
	AMqQdC5TJWNkJxv3Pkv0WDCETx515kzPgzmcgbKXe+7b5v3gLBfbcyf4QDMipIZh
	NItSFYh1ju8Uu5e+egRt2i849Bkc4f+dnQYX+xWTicbIZ5lHKmzwx8BNARJ0SL/7
	xdYcKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t1n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:56:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954a05270eso25142166d6.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325817; x=1771930617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=;
        b=bbnpS7jOJGn9mnXhKKMpJakeWJtcQYVEXWAfDiXehibY+gUg+0aCWtgmVbR88ZzVz6
         CcwKtgdWMTgsuzcQ+MojkSMp3xpFm26KMaIyFU7qLokShBQ0H02b2Dm4YhbimSElwyZG
         vtdcWR8/IOokfMAu4RppWMOnUTSceGittctao+OHwjbCFa+QMYDBEqnOfLYMhMA361jq
         IwhXDeUni9OjZsEpwtwH4ZuCf6Wk6tZHIl0W6H/uwZpt6rFf8BPP+/LzW/3xjRapHjsl
         3WABec4Bhnxq6mmTB4XkVt2knQa3VJG9lcibApT9jmTHoD7Xyd/z9gDvlKyz+2VVJHFN
         XpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325817; x=1771930617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYcB9AdgA1egVr3whC72OpIrj1LCjITZa85dHRBu664=;
        b=vBLk6OHMvb53wZd/Y7dDdpN4fZG2oRQDwNlT4cpLFFOpdcK7AxuFU2F7CTw/DcmP1x
         5XMcEhtsidBCs/WO47FwABdOAxXSeaJbAqCHu0eprFUWE1YapfwKvZjZYMRaMu8Bi8p/
         rMLijUTFKsJ2fb+i5iTXFLHIC0l1iTA+9ztGnoZvXc7Esga0GKnW+UnwSaokbP6d6ydJ
         PDOloxlplNQAnuFs0pex4Rjv3hAmY2CumOdRHs/Lf17oTi0xYGwKIKWLmegWM6fm3YWH
         7pOgq6dPQjaGodXnThnDigA4YUso34xPVrmS9oA/zMjZ6PgIjS2ftfS0JOrHbFgeJ26+
         Mpag==
X-Forwarded-Encrypted: i=1; AJvYcCVHO7mzlZtDuDWLnIDF6J3mHCVfQDHdArvsP0+01I/KeY5caRo0Tc/18Hc6Gp4hmwiTp8FawK1aKQjDIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI0FP1AYTfSF1U3i/G7j1AM7UuOjsaHG1yQRdHAbYWHVECsefJ
	lRERBzQDUqGQkgO2JclH6ejr41O0q7wxJ/PsrTm2vzz5iqpE0tG45GN0CYurRazJx5u7WrNOZyD
	Fa3Uy+ehqBcac53XDt8R2ibDDyoJl6Yhc81bcOOUDfKg6Y0k07oAZujQd2MfL6us2OQ==
X-Gm-Gg: AZuq6aKAWjzjri+i2M2mmYzkW/t/0e5L6FfuT4x4l2m8VdjB3JiXzk7zVQSHUzYygYJ
	tzYQKSJjOmkrKi4iZJT2J+20GgSFu6CWObsvfyYygbTYxFQDIePEFIhxGhWvQScanJQNVGhJpRa
	noXA7Ha7mhwgoAS0ddef4/ezu03zIioo2mU2NFp2tjlnUnrOcdkzcRoGw96IgU+cZdBQOkQTRTk
	zI4sqdtD8FF/b8u8GXpOJ2zoE9lNVLP7Fz1AXcH2mzxHoqE7ngowXPRxgYc/2zRsdnJME3k43vo
	hnRy6ihIgxVWT4HgNn1alde21r7gxaciFTLr2LgwO8wpxUwppBiPeqG9aSyLDN2mERlvySTUwp5
	raxru0DyFNELB7mrYIW6zG5tQVEskP2HaBkSL2MnbKquqlP7i0jxrePdpCZEEKNsiMQVUdn7a3H
	GFrZQ=
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr142266176d6.7.1771325816943;
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr142266076d6.7.1771325816453;
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73860cesm334181066b.23.2026.02.17.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:56:56 -0800 (PST)
Message-ID: <218652d3-8b6b-45e3-ab42-93f83bf635dc@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:56:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
 <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
 <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX8S30vCDV5UAv
 nHovKzIRR4KcDk3YqfuDN+hgwLELcYgUD0Ac/I19HzSiNE/Ep+ZUPsqFwf8VBgL+gShCWC68irk
 KcdtSDWSSmYb7Rug2ZZt7bUA1ccHUeJ1UhWMt2tpCtHGx6mH2pcfEycYjoVe60YTOhv7+vOYokL
 jQwQ4ROkEHLRS3sjp2H2fwKFHCFELg5cYXgODpiNo1V8qQJqpFICf+2BSRs977xr2KIj9DIKOIy
 iNSKUQrxGI0KZHNSYyATQzwRoljfUNiV0qAN0SMrwuCojNsnk+K3o+rSueMQ6uty/7gfZpjQATq
 PxaU9NYj1ja2+HxiWbilulAI+Ced3byxgV5i5qLvniCrrwz8f0QpCFbD1XCBaX8P3xFGxFMz8Cq
 wZUkWJHL5oqLrFl/NY/dnAkxQoKjOBCpUVfYzHzHUGBrC2L06n7x7kh15tqDAyJufG4x2WDl7Iz
 ABm61NkftXZHs/Hk02w==
X-Proofpoint-GUID: FIi-tN2ZnujexfsyYs-XmR6c69RdBfnk
X-Proofpoint-ORIG-GUID: FIi-tN2ZnujexfsyYs-XmR6c69RdBfnk
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69944979 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=duMsrziURTV0fy3IIjYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090

On 2/13/26 3:24 PM, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:50 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Configure and enable the WiFi node, and add the required pinctrl to
>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> the missing pinctrl to make the WPSS stop crashing.
>>>
>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index cbe1507b0aaa..75f2b3a3e572 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -232,7 +232,7 @@ wcn6750-pmu {
>>>  
>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>  
>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>  		pinctrl-names = "default";
>>>  
>>>  		regulators {
>>> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>  };
>>>  
>>> +&pmk8550_gpios {
>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>> +		pins = "gpio5";
>>
>> I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
>> would be consumed by the PMU?
> 
> This way of doing it already has a precedent with sm8550-hdk.dts and
> sm8550-qrd.dts at least.

OK I thought it was "new" (quotes because some wifi cards required this back
in the 8994 times).

Konrad
