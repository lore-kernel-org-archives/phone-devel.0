Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99139C015
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842376; cv=none; b=EerA1qx/qbzFT0J3cnUG5tmX6CliSbXH7H6WZJAYH+O2oQuolkf3qFu8B1uzQXaTCewelwcpj0wS8B8pTl9s+zhi000JzbcC7vmJazMgjnRraNjFxf6+W2CwzV60qJnz6Cg06pL+kSCZyhdBCi5v6g4lK+do6r+nwDaM7isNUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842376; c=relaxed/simple;
	bh=GYRqtEFORIGvBXtjHRIEjsIKBIBEvrSiUzkUEEbUTL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP03AMg6NrFCniJUmU1Ub+VlxglGCjWwRWfj7BwEF4Bzzl9ERSqUxmKwKWE48IORdooy3NeWI3rTYCUbQUBwaWHA068EtbUKYuNihV8Oc12B+1CxxD/d3ePkwczQ6g5yvpZLM7bO/WHxm45u59o9+BQl2ddnW8nwTsp1hsK5Roo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY2l0Gaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dy6qCKYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY2l0Gaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dy6qCKYu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5YmGc3795642
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=; b=HY2l0GaaIOTOInh/
	lFpvlr8nwTsjS56jmB7h0lPRnvOanPA/m/eV3BcO6oG5eMK2vPQdUEp4gJNnF38m
	XPzngmatmyIHiMrJLkxDkdoF9xrC+Zt57rUipSc9dzWg2ZtPCDLvK5z2inJTgk2s
	BFF7u53xBs69A24v+0fL4xvXgxXQcmj56gtNh+ADEYvzie4wRTuJhfo9WLqiSLgO
	x8ipv9BeW8TNAncwLGXl93rgMkV7kSccbsmAqP4Ue8JoLqb4C2iEXvBF+MW2wHRG
	vKb/vFWvPtSn0sXc9zf/MKjZnIkGMQB8PScv4STA2Qj+xP1qY6j9oorZJBfepGDW
	/gDJBQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stvd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:52:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9511f903b16so420452241.1
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842374; x=1779447174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=;
        b=Dy6qCKYu1gTJSyr4LtWIPQP1jaVOpQNHWWlJPvt4VGpvc3hM1AeulShAAdHtl5VWXj
         BXoDt1A4oSXHl0zuBQsr798O/t+63Zv+bDM83D8d86kZ06kB5g/ACDnkoCWozsKZWNWM
         MvVqrSTUlNXoFFfrQMZMGYJZraJo6FO4BTH7FfIxSfFWc6J/l2FHsYXreK92OhUDbg2S
         KKzmkDBPL8x8xzF1u2cB7EDDiWXfZ954sa+Vik7yeygDKJ2/VQv9zsG0E0e7y3LjPT78
         6iZnJ4CxPSN1AeaY6Fn/k4JVPS8Xi9Bteh9SrhKc3dFHQhdIbi3g6cSqE1XixuYLPOWU
         tQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842374; x=1779447174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=;
        b=joWQloJfaDZJWgk2R06y5YvW87yxMXUwoaNa54UxWZiwNKYJD69n53CWtCwMbQFQ7U
         gi95xW/969t4DqmG2DwAYDNw7a6uJDZFn9/IIDGsGm8SKiXaBqm1P+2kIpGNwDU5Bp8u
         SfrmUjRp/NNWTKMMpOhC2UxEZbcccUbYA3orUehE3PY5w5BNvFfXcqsrn+qcFvWfVn8i
         VvgZe+MX/ooZTtzyAOXc5grXrdwy8UOPqgS3tmRxVfCwEnCqHrYFGMQYgm5o745THvhs
         aeo6FIp/Ylu0eBqDEdjnW6DQJ5MJ/MTBQOXHh2Kx1LuGQ0Q6fgwOWn4OJ1TToz54Wkrb
         ZWYA==
X-Forwarded-Encrypted: i=1; AFNElJ+GyAh4uudRTdqSwmMA+E9hjMj4pTRz97nTD7PlWbpRdr+MqeFjGhhUJ2M/GyCBEYJ/gdAhTDTJ3LosiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6A608tC2mnDBal0WMnxqcyrYMjoVyfwnjTwzJFA3SsrnKZ8s
	43eOHcmsG/G98Adp2VZ/vYVeUNs6xzO9I9e7Hg5JMqw8Sj145gix8Zmbdki2+3BLkreMYpYa/ts
	8svSlIkZV8ObDin9aMSwJ5siZBNIAw1CxZG+g5Rh3kpS55c8l1v/K0qIBdqvoQE7B8g==
X-Gm-Gg: Acq92OFFrqWy5DuPVlfCh5FmPGIGL/sa30QUMVEloo/IMYlGYLR7Sn3j08GqxXW0J5y
	gbZmgmYjKHuNZ0o1xWNzNUbtCMAlD/278Rj9+3TU1+XYYar3ZnPW0TWfr9Txijvxp4rMsDj9Nyy
	o7V64B6a3TqajOhe97dQHtPs/LzQkx+hJPypSggz0v2mcOfo4D7FglPsQbL/1aLpeX3iEytxtZy
	eZKm4wVQnRHVbSRSBZc5TmRMiluxcK6uS+/UfFkwsDolCSiK5jOgqLt+Z43P+GRmzpaaUXVJ2Lj
	484toQzSurqFymJl+gK2oZMil0JPs35M65gyO8ac7M4j3RdHVcn8DPxzDkMViZRvcnJIVjj//IE
	kJ2I32cH+yzyO0aatCfwFZGu9DMOSt9YoK70AZShHnA4qZny1A1CONg7yHK0Bwsr4E6zO3PAF2u
	snr+M=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr517883e0c.0.1778842373935;
        Fri, 15 May 2026 03:52:53 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr517858e0c.0.1778842373403;
        Fri, 15 May 2026 03:52:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm212603566b.9.2026.05.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:52:52 -0700 (PDT)
Message-ID: <bad20423-de93-416e-896f-002e7c05e4ec@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:52:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
 <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
 <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX7tT9Vs79Bnsr
 vcoZebKg7pFjq0u7qfLiXJAU1Q6fsgHJp0ey1Vy0o6DPb3H2SRMVKVUzeyEvFOoaizt5qRfYQU7
 xUEGKwMVURTvkjpnoNR7vVORLN3WxBafdxFKirvAm9Ngqg/0vzRT+82jMpbgjOfKpCBY7SIj0TG
 5jGQ67TxDLyk7AT5Cpc4efiSgob8Aup1yf6qFvFXkNRCaWaHT/iwF3JHZcD9LoUcQgYx9PY0fSP
 ihKVxtpP4JR4S3fB2gQsHGTEmD2gHZ/9EZ/K6gKQy7kreqjbZywLVjcwXyjQovJF0czKwme+jV7
 O5yoLjynoijAz3bUD5Li/Fvbq+cBA8CWW7FjsAMx9XxKLU/44UJGMM2sJ9IhIVmu1srVRUKQAZd
 pgPgf5rsvvFIj2adQwuQCrv27iKQzPE2fhZeKmeQ2q7IFNW/4OFKS4PhpRetoYSdVgrxaYlK6J8
 ttJSExQPBYJHcUkQ4DA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06fb06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jmRdrQK5CiodBuYeE2YA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 89nn-gj0tgBegVcB_suaDJ0nMUx5AHSl
X-Proofpoint-ORIG-GUID: 89nn-gj0tgBegVcB_suaDJ0nMUx5AHSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

On 5/4/26 3:21 PM, Luca Weiss wrote:
> On Mon May 4, 2026 at 3:10 PM CEST, Konrad Dybcio wrote:
>> On 5/1/26 11:20 AM, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>>>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>>>
>>>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>>>
>>>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> index db72418b7195..d8ac495ca7c8 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>>>  
>>>>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>>>>  
>>>>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>>>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>>>>  		pinctrl-names = "default";
>>>>>>  
>>>>>>  		regulators {
>>>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>>>>  };
>>>>>>  
>>>>>> +&pmk8550_gpios {
>>>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>>>> +		pins = "gpio5";
>>>>>> +		function = "func1";
>>>>>> +		input-disable;
>>>>>> +		output-enable;
>>>>>
>>>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>>>> sequencer?
>>>>
>>>> If you mean that it may be needed to toggle it with specific timings,
>>>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>>>> access to some docs that I think should have the answer, hopefully should
>>>> get it soon.
>>>
>>> Did you manage to get anything there yet?
>>
>> Yeah, sorry, it got lost in the sea of emails..
>>
>> The PDF talks about the electrical requirements of the clock signal and
>> the section titled "Power-up sequence timing" doesn't mention it at all,
>> so my assumption would be "OK so long as it's ticking before you power
>> up the WCN"
> 
> Thanks for checking!
> 
> Is this an R-b then?

Yes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
