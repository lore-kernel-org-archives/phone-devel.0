Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090B2D6409
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001736; cv=none; b=cmoYAx6obKsC/smgCucpgHEYZdFrGATo/LQcRUAYq7dTKicgNo+eyx8fbM4ZlXaRF5jBV/7MbV1eW31tFcG5iUQJSBxpeg3Efyt9Pp7VTWs7ZtsLbZGnTCTtMEDtsj+GotiWv6EjPst33jqiUILjuAq0VQcVWZrRVVNfidDwYtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001736; c=relaxed/simple;
	bh=m7sGX8LqCBcYJzEU1J2asHkmcl3RgvVNGFVvSyqxM80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuzDjPqzSzIMVa2rzSeomQv+SlrKsOSYdXFYltuC8Fx8WymPDI6LSm8p1J1JKQfnlgXE0XEfJTxYoecBhsF3Wt1EiIUu+7bQAXFu5TTRMzDadm3fGshw3hLxejdh3bPfS1zG6Rs3Tg2tqEizd90OZ7ZUsRlx4qP06qkqZ/ZxF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnUtvOoY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnUtvOoY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V2vD031740
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3T3F6rzbdmMoNWAMnngme3yze4tyxfjIoIeOdL7FrsY=; b=VnUtvOoYef6BeyDh
	OTKFhLq3V9F1shdLdIxD8fVMC0o1z3NstclYDBqMCIa9xqApxl5ZnvvfcGw3rRbJ
	4u+iRhtnm5EwIaa6N48mDdYFeq7Y46G/0MhaEMvncRhLyTqFMPPjEopLkN5UTmvw
	xHUXJ8Qoe0vYCkDQW05hrZW2XK5rwxsz+EFGE0jIsIpwgSVM6mGUf1aLSbs8xX5D
	b6Ei8IzzW1+80we+b9r1oTPsGAqIDSQTc8E0RwJ9E40IPZDZRiGIdZK3wccJkLLa
	LqdnQ+XdphUDyLpiVTgDE2mZ4aeL3p8B8g3Z3V7OeqmNj8Dx78pfYHB/X3lbKM7E
	nZIsRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0r520-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 09:22:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd729008d7so2869561cf.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001732; x=1760606532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3T3F6rzbdmMoNWAMnngme3yze4tyxfjIoIeOdL7FrsY=;
        b=mTEEelTRQNc15j1PQJTL82zRvYOzl4wWsbw2lD45ZAiORKlQJubfWD6IJ/0Mp8IXmh
         4RicMwuLz21yLRy3v4TEX85qnuYLYxh8QH+gS4FZIBfDBnSX8NC7Ss9uPuZslovBWc96
         AHc136Jqg4aAEJ9XyRzqcZU992619M9h1GmAupCinfODjxw5XxVXhSvh+IJ9u9CdKs2e
         axp1u9ijbfupsl42n/3I+BKIwHCpSj6mc5toMC7O4N6wj7oSUqHHwg2T0YFR1PWZt0Gd
         zVNq3NzmmH8TxQjeDQbCkWcB7gKWuH49rHxLxJPh+5Rdz8ZhG/Z/yctVHpdbE+MjGl1w
         UkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhZsy2c+pz7SQEZSI6GVm+xjbjzMk/uhnsIYSXDQAZOEtO+uZ1YzN5jMlnc7SGk2XVn1aloIKPkQNbjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6ZXDpdw39FaJH3SkJoz+ROV7BG+KvH/bIqRhjVbt50QCh23m
	bZ7QU3WYFAoJIj/ba61vV6FPJZyiQNyKuDqggR+JoUIB3/6iu8C4Iu6fVG3nXhfPYVSwzIB7LCL
	7cTHqxuyqkCFQU3B4zreokt8Vn9ypEibZPitUqWTEUmfrD8cOJ111n7/8OMMsmpufpw==
X-Gm-Gg: ASbGnctie/6hEIvTwEKmPVo0CH9CiqN0bSc1yCzCyRMsUJ2KGef53WX0E8tTaj8Y7T1
	9Bh+fFmlBk2i6iOOfnsHmyk/yKd63ZTaJQfEZL84s8pYbg07hMtbFwiyJ4k0mgxYrxCxRcsUSUn
	ewtoIeANGyb7wcbhHGx+yILCrTJ+SNVgQDsM9h1bW+0W2+79rfj0xO4IGYVC4RpLChdJMEmzvYa
	1NhD/xy977bBE9zRpbzWbMhY6AaRcWe1NQHCSpxgdU52Vc/G9EAMHfeqpHOAB0SOLga1uNoCjNY
	SPzDntL75PxPDW91JVQY9UrzXBBJ2LMzKAce4L+3wgayrRFvFyOGNd1bIXN6Gp26RGEH1jhvwJr
	5NaVpwOcIoMA/ckBJG2lcWCaUYOs=
X-Received: by 2002:ac8:5991:0:b0:4dd:1a2f:4881 with SMTP id d75a77b69052e-4e6eacb81b2mr64073821cf.6.1760001731541;
        Thu, 09 Oct 2025 02:22:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2X7icy3lg+xeOQgJOky5fWzmyU3gLm0qGfVSTXdz1EXkq1QfNAExgoimdotZtxhJlPB+i0g==
X-Received: by 2002:ac8:5991:0:b0:4dd:1a2f:4881 with SMTP id d75a77b69052e-4e6eacb81b2mr64073621cf.6.1760001731041;
        Thu, 09 Oct 2025 02:22:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f2d60816sm1934249a12.0.2025.10.09.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:22:10 -0700 (PDT)
Message-ID: <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:22:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
 <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
 <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e77ec5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=-BH9GnAZmLL9hDugqCUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: dX3LmgNBsBavxlYQq7mbY3V5fIxWbgtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX9MgSEPsSaWDU
 6EcyM0dPNGTa0N+Sn1iIFequBrZbK/XJi89YgoM3ar/zhoZyPfIw17ofKefbWABIEQmqbKWdYQ5
 OndXt11m0dAxPiF5tnSmVQFEfEcNFYl9polaGl9uwcA4XO1pAKro+tPi/E8XTxXXWFYzNyg3/TG
 1fGZzZi9LPM4cDcWGi7p2lHa7H543G50Tck9D1h9ar+TNxy8KPftfDoN8mVmDTb8gnmgV+OzgGD
 k5pNDw+RBTUHKAZWaTV0EmuSuqBoNYuA9rrBSsW40f5JBDyykKVhTkRfub0uBFcT98ilR0BTz36
 FyDrZgPM3cwAxPFJtJAbBq9OjKqdtySehXCMmRclRs7KO2lmpPUaqaQ2uFHbyUUgkrZ8HvPMvv2
 Vt/4ua2yroFkeMSNPGNkQ7HamthfOQ==
X-Proofpoint-ORIG-GUID: dX3LmgNBsBavxlYQq7mbY3V5fIxWbgtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On 10/9/25 11:16 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
>> On 9/30/25 3:57 PM, Luca Weiss wrote:
>>> Describe yet another regulator-fixed on this board, powering the ToF
>>> sensor.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>>  		pinctrl-names = "default";
>>>  	};
>>>  
>>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "VTOF_LDO_2P8";
>>> +		regulator-min-microvolt = <2800000>;
>>> +		regulator-max-microvolt = <2800000>;
>>> +		regulator-enable-ramp-delay = <233>;
>>> +
>>> +		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;
>>
>> You may want to define the pincfg/mux config for this gpio too
> 
> While I wouldn't say it's not good to have it, there's plenty of GPIOs
> that have no pinctrl for it. Downstream doesn't set anything for gpio141
> either.
> 
> I honestly wouldn't even know what the 'default' for a GPIO is in the
> first place, or could I query the runtime state from the kernel? Is
> /sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
> solidify this in the dts?

I normally use /sys/kernel/debug/gpios

> 
> 141 (gpio141): input bias disabled, output drive strength (2 mA), output enabled, pin output (0 level)

but this seems to be formatted very similarly if not identically

Generally it reads out HW state, via (among other things)
msm_config_group_get()

Konrad
