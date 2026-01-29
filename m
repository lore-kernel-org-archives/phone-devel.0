Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F0352927
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685553; cv=none; b=OpfyFYASf61rxjlh90J+EiGlQtLaBwpbfC9hrl1WXnD+KkpO7FRWkfbcAyK4G2/ETMIntgnsr9MvqEv0eOoxBamqj24ySmPYInDPoUjc1wC2wPIMR9AlHuOIiPff7OaEh98hVZOvTpN26srwyvo3oqgV7hEU9C3/CupKgZ+UHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685553; c=relaxed/simple;
	bh=XZUI+1dfgfMKqsltluvNOpJlTGT+hBConju38yjh73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Esh+szrmaUvlXOZrsJJOswGVTo4jcsAKrvAcnNGPM38JOmdnyjx867R30VYt2WYzg6GTe3HobNKlkEtC1dmf09a2hQrJ0IIEIY7fb7+FadC8SR9kE75Mvb4ZhepXerfQRMLNU8jr1AAU4JC7mYjExS2CdC2J0UJHCw9YCjpoHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez6vu1DW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVo++lRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez6vu1DW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVo++lRi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAOx9Y3900264
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=; b=ez6vu1DWTOlYSQZO
	i+Y1RkPnD9byy3UtGcg79ftZtzjRkfIv+M2aNTlvgcj9Xxo5JZp7AAdfOv/zi7LP
	8phFX48FYKxh+lv0SuCz3+La9d0H1e4DL/+U+HY0p0cpOHYLAG277bh3qI6lkTHE
	kuZQNrUZqb7/V3nl6Lm5kn3N96nCu+VwhUoeiup5T/62KXYUpeZczHiCUPQMX7dz
	dx3gy4FXJ2V3l7F5YxXJhMA6oD5vogal7n0zR5MQ4/45E7NZJoSOyl9/Ra4Y1yFU
	07J6J9g7LBIsBBaNZXX1Ogz2o+aUUxIqD71P6hyV1NUg0yFIBOR5aHl8k2h5Rtit
	MnHjQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05se8537-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so27477285a.0
        for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685550; x=1770290350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=eVo++lRio76t/NMTuz/IFyDFKrkIVl0H4/JP51AcsqjWcFQUCLxHuK/0bcLrr8RXHQ
         YGLmvqVtWj3w2JW6dynnh0sCc7rpcT/DqraNw90ssnsf0LknTDxAO2OCGvZAVAQf9P0g
         CmhYlPZDYBT96Mh3/yBkhRPWWcG6wifRocPnq4TRsX3cFOaYbFV+DCrFX7rpFLEmSOEW
         RK7aux9rCB5/gyZ10LlAZfPRhRars9Z/cTDH9MSntpAVtjKk0/Kqif0wsss80NavjF9S
         vT+moTbPzgwUY865IScSQp5BqHBgznNMRCOYz1vvYqk4fzfU1QirTeYxbWF5lG1pxWry
         Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685550; x=1770290350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=iO9nErpWzU8Q3hoj6WwvIAmoj8d6Apu8DzfqyceBWPUNnVy3HQtpNYxUmtw/6M3hSh
         srJP7CMzSlw9IG60C349/0/Uwl9JXutxpmDLbXqMBrxXr+lBy2cm8sXzz45E5MDueAb1
         GVzC4RkpcyZExjh0Ar9LChznxcyu00vZZ5e4BKoDTkc9pzxLhgvGsTLbpRbmj2c5u7n4
         awgrv8fyMCh94k8VDoeMhqDiG6xFoA8MWD1c9g14iqHX2U79+aiFXrnUgxqMHPGPJmKd
         jZ+wjF/MAQqFKoM3aHHuMdrHkWUupGVamFmU0ES81pHWZjzabLaDVdbvDwJpUkQg640s
         JHwg==
X-Forwarded-Encrypted: i=1; AJvYcCWFJ94ZCYSO1FEYH9R6tgFOrrKO4xqfyQwtizPc6CK4GdZuG4eTE1SI3Yi094kBsVIjVwBgOr+IDJk+8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1NmWvoOjxweVDWaUPa6W23EggEsdFsq1XrK8xcinRTAMUfCs
	gwP5b1A8ekSxH0WD914T8HwqIZnoD/pjeYz/zlteSJ+IfcYD8hgm938UW8SFN9xWQaH/ha40ssN
	JQrA609wE8amVsC3lYwDEqqaJ/1oWN33Mk40To/vAmQz4BQQi3HB18EGJbWDN3BJiRA==
X-Gm-Gg: AZuq6aL0kcHnYsnysG3YVlpFBhHuL0iUXuJRKa56nmQBNBPZmpqe4YWmj9gSfLUf5F0
	DTGPLTzDMH09bLEfQaYXzwjO6pXe2UtRB0EkRZqlGr6dr3SlTxC/AA1R6wVy6q9XZ0nnlJyXLOk
	RgtDcnDZNbqy+qUJQbpemASLsbxAy7yjVJw1UghAJzyupvBb7hmujfSSgmt3jsYrfOfgo32/N8H
	B/mMZj8r/ARUZWeW2abCHiWuXaOA1r+M2R7cmfHt71s88ZsWKYXdMmMYiP5JL3Y+/6pv5E2bzFB
	+OZn2z9Qknaz43vyOfond0WJvS5LVcwCLLbT6BV0toa037Cj05JmzD8lLESLutjNHDtXfQbeXGU
	kMGDSxRoUHg1Fy+bdfkSRHQW3Pr+dm7SHEhHbDeAZ00x6Z3gCDLS2CtIa8D5iTMseOUs=
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324007085a.6.1769685550014;
        Thu, 29 Jan 2026 03:19:10 -0800 (PST)
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324004985a.6.1769685549534;
        Thu, 29 Jan 2026 03:19:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm2677629a12.34.2026.01.29.03.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:19:08 -0800 (PST)
Message-ID: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:19:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 96QyLMs0mzSXY7LxE25fBJVsMkB4keUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NiBTYWx0ZWRfX9NgB7IfLcbZy
 1gCn+ms6e/L7CWD7WW1YsRcoULARxNqp1fleWxGMs/aFggL+09n7UyidVnW/712aCpgXiEV5kI4
 bUKUJcaH5h4RnaIQqujw/Eq6due5kDdBrsmN5Aiys+3YM/wk0psbj0KyqgcPRSZ7bC76Dyxftui
 r65RvITAD/59TDrVawM8c8K6w83sCat80/VC+nvDK2wIvjAKRiQyPq9rZ5vWQaiUY930ZZyrPQh
 ExjqcPrt/BU9vfxxnxqe0mozOzYssB/t4V7fqdk60YEPlMxv5nraiWua79tUg1iE5fhLBVYXW7J
 MkKEMUlovPhzwL+KQs8mP+R458hZH0BUDzFIDlhm4WBRlloUm8sX5BsHejW7jvDzWzXcrhGCRAl
 cBTdQtxhV4YQohqPuD+SDmXvOqlOwaJd6BPC2ihERVKx7OMhtM++RfGM4WMSG0tqskFqqSTFOkG
 /mJwsAztKf7UF4+P4sw==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697b422f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=8gWlQ0A84ExjddM39AAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 96QyLMs0mzSXY7LxE25fBJVsMkB4keUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290076

On 1/29/26 9:32 AM, Luca Weiss wrote:
> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>  			};
>>>  		};
>>>  
>>> +		lpass_tlmm: pinctrl@33c0000 {
>>> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
>>> +			reg = <0x0 0x033c0000 0x0 0x20000>,
>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
>>> +
>>> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "core",
>>> +				      "audio";
>>> +
>>> +			i2s1_active: i2s1-active-state {
>>> +				clk-pins {
>>> +					pins = "gpio6";
>>> +					function = "i2s1_clk";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> This looks suspicious for the clock pin.
>>
>>> +				};
>>> +
>>> +				ws-pins {
>>> +					pins = "gpio7";
>>> +					function = "i2s1_ws";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> The same
>>
>>> +				};
>>> +
>>> +				data-pins {
>>> +					pins = "gpio8", "gpio9";
>>> +					function = "i2s1_data";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> And here.
> 
> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
> active config for these pins have "output-high;" set.
> 
> And fwiw this pinctrl works fine at runtime for driving the speaker.

I tried to find an answer.

A doc for this SoC says that i2s clock pins should be at output-low
(2 mA) when muxed to the i2s_xxx function, with no information about
bias settings (perhaps bias-disable), and in sleep they should be the
same (minus the drive strength note, but 2mA is the lowest setting)

I am further confused because the output-enable bit in the cfg
register specifically says "when in GPIO mode"

Konrad
