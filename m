Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6B3DBD7A
	for <phone-devel@vger.kernel.org>; Mon,  4 May 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900261; cv=none; b=q6tNcmsZ2nkAOhXdvGkg1GPZMgLYQKwxJnoNO3SL0nPKoGxOl4j+q5lSSelG9ljdaHv4OKn/59GnZXo5sl6HN1FfZac3iEpmdGVaVpw6WC4d6INAfIb2bcso3qTNmbs3A9024iC5NYkkWRu0G6oXoSFZSHkC6MtOmFbHgnQ47F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900261; c=relaxed/simple;
	bh=65BCyDO9jtqHt0rIS+TTWdrkvghKnA/Z0GBZ5zaHOzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYf2NMDvDO0P3Nw9P5HyusROlVdHCMICUgSmCDVtDE0wVlitdhSiPUiA9fO2ziJQsLfRau1Jwp+rdPQ9QSosqpgfJNp6CVXBlrzY/mAfV5uu6j8KSLdpiA1Ta2zMVb4hYlV8aEmFWP8mpNYiUc3h0rh+lVEhqJcVTFfctH9/42o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSvuHGy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMhwT42B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSvuHGy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMhwT42B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4DK5771372
	for <phone-devel@vger.kernel.org>; Mon, 4 May 2026 13:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=; b=ZSvuHGy95t9IhfsP
	U3AUnAAWUZb4mq54JFS6nvzoZ9btK6EbfUg23V7kI56xOv7GPGAzijdIcg4NtuwA
	QQzmGEQyU/M8acpw5M99WmnZoh9sOA+qPIXl0bAnsEezyx4ZT6VH1emP73U+So1v
	P7dUn0UWcIkTpQug6+gD66d4Umg7wTExv3+MGH+pzOShYIhqBy74moGYuJ7yqwDm
	qW8DAN2Nh0Yov6kGScLpG+Pb6VQHKwO1zbNqBJ1kq530dm4W+d0SNFH8E8kP9XW6
	SVo8kV2gK42wvtxUL6SkLKEtx02NFmBDUEtCeGR1dxi/jjEP3YV433YmTCMgLyDY
	E780jA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejnpnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 13:10:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60feeae5dd3so349296137.0
        for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777900257; x=1778505057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=XMhwT42BYOa/tG22c5TqncrG0WSs8tKCsN2doO/JXG8VgUpTHTnSgrdBFk4rSzfJ/s
         bSbWubMyxaZbQ/J1aoiXx+Ac8BUXJQwkv1O9+6QHcbm8tMzlWacj2HVy1O9TnwZxuJmC
         0zOCXYIYB1doyquaS7YVyMsDrl3PEfskfNs5x3rvmmBlNiWQglWeS6irATSTgT8jPEbh
         DVw3Q++hjcJyuX5AmE8kmRG5blbynWQ1Lrz6Ul0sXjzDy3d3hBBIRdqYHZatQJzZxKyU
         DER3eEAiaCLU4s/vc9S6TYXaGRFiGud0IfsPCF9RxyAcUi9ZsUEbw/Gkmb6xLybr07lv
         DEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900257; x=1778505057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=cWzxNAU4vt8vj9scg+SbHaa1/TjTIHSKMp/m2xM1NGT5sYPzjsMbtcKVomAzFtW7/M
         e1D0Q7McbzlA6pY4jvz6b2/Chftym3ZfJe3OCzCLKzU2zlNEBlGWPrwBWK8fCJO4cIKR
         ZbEOmfgLB1LbXagrva6lpDiulMdSU/i/wV1g2al6c70mI8qxIAn8gGBInyN5MHzBw+Tc
         Kv+k1vnRh3X7X/4iZmRvxO7v3M9mP+S1ptHR51ZCcFP1A68VSL+f8LoJYx76VBhvD+DY
         hDb10eB1BK27Q3w2fDHHaANAO9TCL4V0lhLXkZXHyEg+6YuRDUBUKDt+3YfQnCa31ZSh
         y79Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EnNLCnyPfN3IcBUFj+wjSf315vff8z9G1BBtLh5vvHXU7sKWbqeCMqQFke0rb0Y7icMOCHXK/eGDAQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPa9pPBKC2RU4E06E9dzwyu9LVG1QZCqLmDx7MBG3gOhXHehe
	SMsqs3YXzMJstUPU0TYeG6HNou+B/IWTNn4kUO5ymiGqzFzmuVo8fLGbh14GHqtdwzUWXC41dXI
	r48LJMMRiLaXdtteqGOfEdgV26gMWUnTEu9CFq0lP6bA4qh4A0v27zQRIwr43U3W/lg==
X-Gm-Gg: AeBDievy+xmQikZigq2UjzEmEPU7NOSNNiAd93XxDyYxH3ugfmzv6BFv8Y9vo9YuHsy
	TzKbVa4zGtL+xdFtDGlGFqgb3R54KA/4RXcoRvfV9mtdGHZb62xBmGhtnx5/1KTBKhu0Ab0KmGQ
	K4N1d6ipJf3bO/jL0cv5T9sHsR6uy7BRYLLH8GSc7xxlfrMlUtZW+m7T6jDDztdb+Gr6siY5VQA
	Q8WiJC3jp3uuuBKs9a6GxPyUGmlhbr6TB1884XbsIrSTekDB1NhGtTGKjbqMkcMih+dG6uve0TX
	z3Yhv0W7jBdClow0crheFEO72QFdncWJjOu7fRnzE8TxMiM7ZziNeaxWt7gtv972W6HrASSDnji
	inj3UVwh8/4UFOVqgVu/4waj1elVt865f16INWNiEVD4+hzl9VPf3fX6GVLp2b91Idbuv9RYRWv
	L2zTuJEwv7UVAftg==
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279800e0c.3.1777900257429;
        Mon, 04 May 2026 06:10:57 -0700 (PDT)
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279764e0c.3.1777900256820;
        Mon, 04 May 2026 06:10:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm149037266b.45.2026.05.04.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:10:55 -0700 (PDT)
Message-ID: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:10:51 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0MCBTYWx0ZWRfX6QmW9X+NQ7gt
 BfcQnaGpZ1cln4p4tCSYe6VDzd5SAM7H9Q83150BxESBlXk7YJCLpAgudZr3KV7QKlM0alGKoLj
 +lOqEY7UvDXL8uosx3S9dvXnzgRKooCsF8RrT1c8sTW7X4QEOASwPehEj5vOfAlnoLjIwJ1zwnH
 9g+4rBwtFa0GbDmjCM8Ns8+3bWYoz6UvHwI/Pb5NGCQ8APRJx/gAB1XfLUQef2wHDt+kNLqNP+D
 aAv7oUBz8dEaMtYxuQLfnlQkXvPjYD9O8p3vANOJOzfbx5SgXo2wrvI6SdJONQZbysqWah7x21h
 dahYhJbyZ8MDtz6EJokXPtvG+jpmZeUwcQt/WbdzzzTqoDTGzu9ixrojNj/IbK/ClfyURATmYGc
 SbC71yUnilud98faIabKb8zcuRD8UIbbnLKtK+nJC5/C3KvDFQ91Qei/gUq6cDWHRNdTYN24SjD
 Uao/PA+A2CpusbvfpSg==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f89ae2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1iLxIbVeREuL6hqEqU8A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 1Td_Cnp7adRop3XtWnE9BBiALDIcoutB
X-Proofpoint-GUID: 1Td_Cnp7adRop3XtWnE9BBiALDIcoutB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040140

On 5/1/26 11:20 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>
>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>
>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index db72418b7195..d8ac495ca7c8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>  
>>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>>  
>>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>>  		pinctrl-names = "default";
>>>>  
>>>>  		regulators {
>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>>  };
>>>>  
>>>> +&pmk8550_gpios {
>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>> +		pins = "gpio5";
>>>> +		function = "func1";
>>>> +		input-disable;
>>>> +		output-enable;
>>>
>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>> sequencer?
>>
>> If you mean that it may be needed to toggle it with specific timings,
>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>> access to some docs that I think should have the answer, hopefully should
>> get it soon.
> 
> Did you manage to get anything there yet?

Yeah, sorry, it got lost in the sea of emails..

The PDF talks about the electrical requirements of the clock signal and
the section titled "Power-up sequence timing" doesn't mention it at all,
so my assumption would be "OK so long as it's ticking before you power
up the WCN"

Konrad
