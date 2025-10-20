Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFB2F657A
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962093; cv=none; b=aMVEzJjtltcr4lQ7tZ4MKH1Xy8BBIfHOJ3ONT5L9CsfFm7OzmeMQwWbG2i2OUcr1+3pfT0jZ2ZEuDEhJSDhArqt9qwDLVqazWVL9XZNiGQbmZcwzSgxRd7vsqZrRqkeGnkdUG90YhFNbABBue9aSZaaWV15gpFDxYNtqv/pHfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962093; c=relaxed/simple;
	bh=33LPI6E72AMQx+gYv5kCkz5RE96g9h/zUVadmF0GT5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAfTondq/snumBWbbui/XvMBrgviczk3q73ds/BMRncp4LS3WKcxYmJSUkuP1uXl04lI5XU0cyPqXPbuVXwY8kuznM2J4HXVQN8tWSns7BqwoVfORIGyvgEFoS2gLybkorMBo/J+x3iedO6pWIytm1Dj/1/zMK0vpT3ZvJkY4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIzjiTLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIzjiTLJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAl45J010759
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXN6fotSa04gUPgCl+hHGvVwZiaZT4vBN793iStPbuU=; b=YIzjiTLJYy6NmBWA
	Lbg0A8UCxuNJDuP2MW8ZDKqe1BNOjphfkz4Vb0tlXcgHkbma7tZRG6hGfFUzucK2
	e18hdFnZ/EhACrSw788nr/MhJuGjj1rGcWuPoZsTCgOFi3olInhA4guNbHLpTr9d
	2sqpP+ZmR8XI/QoKeeQAy+5FvUJeKkFf7pNjLZde/EswePY4W4wHNLh4np0qrmdk
	z/mMJfAGvlhkvwl292P/yYc/keZ2GqCHm5R3OOD36MqUwmTE4WXad9nN9/YfbeYk
	IGIp0BEC9jRM3b7ORjX/LhbZPjArDisDV/dFk9FTe0fWu5PPGRfFuyi0WVM0maqI
	PcAnHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfcmy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:08:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-873eac0465eso15894286d6.3
        for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 05:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962088; x=1761566888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXN6fotSa04gUPgCl+hHGvVwZiaZT4vBN793iStPbuU=;
        b=N0wWDbHBggHGxURebPjIcCmC5uC4Qap7LNeppzMSJz1gYvaybH223eVXtUt3G1KSRA
         kyxGlx+ztNf5rVb2DAhGdKXFdA5JDKraaQqgT3r755qHQwfaLBIx9gYzifTAXHaBOz1w
         x1iLokuIGsQ1bczD848t83GNdqdnt628aTN2czi+C+gK6gdZN4GIwsbYX2T7CUmEFgVs
         UYeYecg7NAczw3unQ2OD5Dj/egaNGAeBZ6dKvCnn1ugNBiZt6+ISRt4HlGLxKLqMCHzn
         OMLkzJL6/iVfe0d5VLgLWt3oeUZMmip9Qw9hWKSrDCofGUnHb8IpgWF2QYK+qxsChax6
         djEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA7w+74U5TbyKcdxzsZhp9naFNgNoYsJwI36kN1gMOAPSUzn2Gt6UwIvUNRqnicZQHZx3+Z9wbP3WdCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcEsy1sQ1u1K9HZJRh0jNTxDhEAHBOdjoguhagHI9KRQwb9wY
	lTIULBKC66eVi8EpWBiVvOt9+aLoFOjaVt0mSAboKPto7Obrd2X3sFPqQP0/6gNIMuxAC0iD7ut
	bfYsWdsCrUYrkjIhSocN2q/uWuqNe01LjEgvmIyZxbpEj27v9BvXXbmVO4x/G1jZsqQ==
X-Gm-Gg: ASbGncuOoCslFAsaKCUMJFhfgHWJS5jQWrU1jnTfb6FD0XCA+XcjQd8hJZxRvlvoKPs
	gEARmKmHh+N4BPBnksh6I49OVx6ZzO9HEN4a65HmH/MPC5kt27EvYwq4m7eC2z56TsV8qJ3NrXF
	7mit1PmcCpeP7fuat28OOE/2TZ22sl5NHPDJvxkam8/bpcfGCgMqgOdbVMEzO7jZn224jzbImBo
	YQJHtCQRFqyv7I3yHlodQkEf9Yxn/gj3RqszLWAUScjtDEVcOojtZohTtQig721Lqp88OOCToRH
	YMldqg8Tcerzsh9w2f5yoaw0kUn5+bq6gKajKxhnGp4WycE6QVuwOiXdbtjkVvv6YbaAnja4OGm
	xje6UjSZ3RLuUkeyOPqGxG7nYQvetG0e/PZCrNpfjB29k2tArzoqls5U8
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr115733501cf.4.1760962088522;
        Mon, 20 Oct 2025 05:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAxgKzIAcFSpHxOq4gtrj/4OH9lLOlq/BGeVVwcOTFLyLCTJYBxkyYpkGmaHl8NF/KFdtpCw==
X-Received: by 2002:a05:622a:2c9:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e89d30dfccmr115733091cf.4.1760962087934;
        Mon, 20 Oct 2025 05:08:07 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0366casm787927966b.47.2025.10.20.05.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:08:07 -0700 (PDT)
Message-ID: <36928f42-3603-4e01-a31d-8f9e60f54009@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:08:05 +0200
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
 <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>
 <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KrPpevjucELJt1f0a9lNEDChdXjhm5LA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4nIvfksXf4KX
 trY5Isgnp4R6C4d56gUUAcB4QM2azYMPjCLtB02ddVWSuPrfYtO3FmtxEIzXErlJl5QDT4AaJu6
 kGS0AkFogSwOSgUzTZkfqtEmQ6gt/9iXpkKNRG+mmEFwZkqnK1xIRx9eUxjiRBpxXYZTISUEuP+
 enNJO+j0EcVNs//06Tm4smsDQiqU0cdF7niJP5TGFnPq4BavLWhmtyN/8kLtma/WGfoRYGSrLXk
 gAH6CvzfUmol9MW3Y5wQl+tc8seES/ywp362KFiKHFzjrozXVIsjabuXOpMVxbkTfn+xw3JINxB
 gDAtTaFXoHcLP5NENEhPfZ7kIn0xsFlst5iPPqGcO5AdryGEJ3h0+KgrPH8+JdxprIoeBkeqepU
 Z+phDv9fvw3rua7fMQ642IkGuOSuXA==
X-Proofpoint-GUID: KrPpevjucELJt1f0a9lNEDChdXjhm5LA
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f6262a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=xF4_qlAILLPsp1LD694A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/9/25 12:10 PM, Luca Weiss wrote:
> On Thu Oct 9, 2025 at 11:22 AM CEST, Konrad Dybcio wrote:
>> On 10/9/25 11:16 AM, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
>>>> On 9/30/25 3:57 PM, Luca Weiss wrote:
>>>>> Describe yet another regulator-fixed on this board, powering the ToF
>>>>> sensor.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>>>>  1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>>>>  		pinctrl-names = "default";
>>>>>  	};
>>>>>  
>>>>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>>>>> +		compatible = "regulator-fixed";
>>>>> +		regulator-name = "VTOF_LDO_2P8";
>>>>> +		regulator-min-microvolt = <2800000>;
>>>>> +		regulator-max-microvolt = <2800000>;
>>>>> +		regulator-enable-ramp-delay = <233>;
>>>>> +
>>>>> +		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;
>>>>
>>>> You may want to define the pincfg/mux config for this gpio too
>>>
>>> While I wouldn't say it's not good to have it, there's plenty of GPIOs
>>> that have no pinctrl for it. Downstream doesn't set anything for gpio141
>>> either.
>>>
>>> I honestly wouldn't even know what the 'default' for a GPIO is in the
>>> first place, or could I query the runtime state from the kernel? Is
>>> /sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
>>> solidify this in the dts?
>>
>> I normally use /sys/kernel/debug/gpios
> 
> Oh, if that works at least the path is a bit more memorable. I needed to
> check quite some files in this directory to find the correct one.
> 
>>
>>>
>>> 141 (gpio141): input bias disabled, output drive strength (2 mA), output enabled, pin output (0 level)
>>
>> but this seems to be formatted very similarly if not identically
>>
>> Generally it reads out HW state, via (among other things)
>> msm_config_group_get()
> 
> So, you recommend setting a pinctrl for every single GPIO that's
> referenced in the dts? Shall I send a patch to add all the missing ones?

That would make the state always deterministic and it's probably
desirable yeah

Konrad
