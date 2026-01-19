Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F630F7FB
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819351; cv=none; b=naKO/mK9hx/QH0jKmYHVFCJdJ8KTMGDSrx7Yiwhmidi+Y2oopw0Qnjh1v1sSDWTPVM85apbIwm+CzB/fDyKa6VR4oXToFwe9RYG1MRSpBmC7Jk8qcFA7TxxjCYUSK0EjbjZHJmnNLaJ/T5f35YBI72P5Faxfn32bvfAVUk5GdME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819351; c=relaxed/simple;
	bh=2R641ZIy/0ksPVXsny3MynG5oLz92O5+Nn1C1IcdByY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGwqTmRNz9TYd7AWAVs+wd49vXShYVOIhhuKZYKoqcXk4u1+Ri1gFoCgHYS91V/j4OoFCPJ3ar0hzLYCxzVKRbwOHVLJFnZdfjhV4/jW/9JzWXVAiDMMOvmADxZVVyRJul37yCASasauVDmDG+EptMnYaiCclyJOQ290+E+wfNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNNCX05P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8V9canc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNNCX05P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8V9canc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9111T903163
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=; b=KNNCX05PXmPfDvV4
	SbmxKwqUv6U1TxpOf8r9OVfaPy/RcWM3YF9LGK1DknFBtWSxnUU6G8lQ0+zcUSO8
	bhT22rG5Hn2txX3TKwC0KtlbxARhRkDafc4+XsntZ+wof+h0K5x93zZOGC0F47oU
	Z8YMlDoPnr2vJRh+nVFoc4jVGuq8gWa5XYd7h6gTOpiIapEusDIDWaqzigih0lUO
	LdtEgWzgRdJCZUrrYuH1mCSYoEX20eDFPlXz+9blbKMZTvv97rDZT/td47KMvhDt
	X57HtZvDItglc83Fk6sl8bVWbgQ/IiSXiuT6UScXCU2XN2liII66NziXWJj5ovPs
	F0kb+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ysh2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 10:42:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so115092285a.2
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819347; x=1769424147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=;
        b=c8V9cancPElSNuexoSVGuHbN6baUQEmPSfK6Cvy3DbNlih4zBvUOcM9WTLLASFcKfi
         Uqxc7dP+2biU0Rc4e7b0/HJ0o4XFyO7yP9F8ji6+Mkv3NMp3jGhATCETKdtENXZ02snr
         gmUXWJfwo0kD+lBkt5wdROH9mJe7Z2qIUsbOb+3SwDXqMF5y1YVUE6J/TNxEUQqjAoaY
         9FUp81tzAQuSgTVeCZ93V6Ix5ksS7WvgeVwBB76OXkMs4vrQzE/W9fd03VTufDH+e1Xg
         Xv5QDZGU+F2U75nWuYfYgmoDkRG2hHxQtKQJvasKd9YdrJbu9+cs2Rojo0RA9KCcsnw+
         TV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819347; x=1769424147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuIe22kbHwk+OgnXV6yFQ/rH7TlMnfgjZttzcIdG1kk=;
        b=qHLuSxN0ngo5BZ2ncKnua8C9Ps/VZij+Ol7/ffclZRM6x6OAus2VfOlRdIJP0kUGvF
         +Enwz87QsTnqF2k77ZXVCblBpKaFeHH1TLFZrFw8EEOG3LHsLfnWQe6Nhm5ZCoJCveMr
         XaMXKIhCqblIWKqI6beZYOc2y2auXlmCoffrHtsLnVPMcK17rVk1JB4p3xYxsCguawAu
         UOmYYrSdFzpCJrlyndCWpRsasZcTUZtP0owGoJ02bZUp9htmjg/tUa7ViBnHUk004is1
         XHk3/M74xILMcWptMu8G8HLIzUv2E65o9BNLELsPNNJmbPqVac0Xx7xhhtfnQZ00btX3
         d4TA==
X-Forwarded-Encrypted: i=1; AJvYcCXfYeluukp4H2cw42dSf7FqGBFs93Mokx+XbF6gNS0sVJKIKSrKb7F+EDMpWd5K3G4jwvQfvnJyvEzcJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlT36B2cjpZZUT+9fue1Kr29FDUUmYx5fNvt3df3VvW8cHOVI6
	skHHtPup3PRj6I2T/bG/Q8BM8LhrXx4n4hkmFmawPEZZvF2IkfBh2xvO5GRbc+/1R8T0riaGW/N
	5IWpkqEWt6ulf6tHQK5r+arxwmtXnp4QyF9WTOPiOCX72O0+5bhHdWtqiHiZTm8Nw/Q==
X-Gm-Gg: AY/fxX6Pp6LV/7HJ8I3oSGBUFjHWSKBIvpEL53pFWu0eX1nGIZnrgvl0cqCCpZgVkyI
	VUGbBcKohydB50us9U8bqCi2SPzW6gD7pH3wvGa/XBiZmM+y0014DEKdMNE7maspoxJjsLh+dJQ
	cs/emoNJ1vgAwnts3dAi2jiGaSIhzIDISrej6spscNZNg/SqOpQryNq0IyN/qH2kT5tipqcGnlQ
	aCV2EwUaTLv4ywVa0pV6Vs1jH5UQa2pTMg2L21fkMFgCiU7fAwBYi0PGAos9tMxSqqFOTN2DoWt
	eS/0Nv98vOwxOgbcUkE4O5W5IsR31zdESVmNxAGEYN7epV9b++rIEjCckuqRj7+FRT+YWvsLtoc
	3zxIQdaCPIuzMCT+pWOWxGDxCUi1x5ulF8kF19CEFJu/9izYlztNJRYh4sz2UKx9n4NA=
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr1086076585a.8.1768819347450;
        Mon, 19 Jan 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr1086073885a.8.1768819346978;
        Mon, 19 Jan 2026 02:42:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f8dsm1062421166b.36.2026.01.19.02.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:42:26 -0800 (PST)
Message-ID: <44f65bb6-616c-4dd9-a7a1-ee62d5d217cb@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:42:23 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
 <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e0a94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=nLAr1RRQX0DeaXQ0ftAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX/dzKEVtrvnVe
 XAGNo3rnrKDyVxUeKS0+pFTyWbwpN/MwUnWoghYAsR+rD40UmWmMRq/eQ82WVe/7EQObccB6TSS
 yKNLQtgiHetGp6jqE0RUPxt8Pa7fjjS7kMGv20tMpV3k96mdgOZT4oK3tmtvXXlVsUOToDFAyig
 7KqjpSCKqLSNHsJ2z0kUU590QQDX4wmLCyFu6gm8q+q3Sp+v1rZeBRP4btNzc7QdlVxOMQZei+V
 I7SDS3vnL2jHmj8mYZB3WAtRoNCHpzgJLGJ+Mv0HlmHpLn3ZyRAXN9wASLI7sMk4uQpFE9QGbaE
 nXUXEZMRxGytMIfs2+S+jO6NmTJ+ASuGC2u2AMpII8z0QM0Gb4AJOV6mA608KAaHJ+9kCbd5GD6
 xIKQkEfQ3FcrroSOUePux09ayVg7dsBkCLIr8nFFJ5s6Qe2TzZHho7zutwEcUk2AJhdsj3VthW7
 BM+DfC0+sAuOWM5zmag==
X-Proofpoint-ORIG-GUID: nQDyudPrXa_S3Ty5t-oxvWBTgWqSDFkH
X-Proofpoint-GUID: nQDyudPrXa_S3Ty5t-oxvWBTgWqSDFkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

On 1/16/26 3:54 PM, Luca Weiss wrote:
> On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 2:38 PM, Luca Weiss wrote:
>>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>>> camera that are connected there.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
>>>  1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 7629ceddde2a..c4a706e945ba 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>>  	};
>>>  };
>>>  
>>> +&cci0 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&cci0_i2c0 {
>>> +	/* Main cam: Sony IMX896 @ 0x1a */
>>> +
>>> +	eeprom@50 {
>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>> +		reg = <0x50>;
>>> +		vcc-supply = <&vreg_l6p>;
>>> +		read-only;
>>> +	};
>>> +
>>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>>> +};
>>> +
>>> +
>>> +&cci0_i2c1 {
>>> +	/* Awinic AW86017 VCM @ 0x0c */
>>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>>
>> There's a driver for this one!
> 
> Yep! Already got patches to add the required regulators & devicetree
> support to the driver, but since I've got zero on CAMSS so far, I
> couldn't test it more than reading chip ID.

That means the digital part works.. I'd say it's a good enough
indicator

>>> +
>>> +	eeprom@52 {
>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>> +		reg = <0x52>;
>>> +		vcc-supply = <&vreg_l6p>;
>>> +		read-only;
>>> +	};
>>> +};
>>> +
>>> +&cci1 {
>>> +	/* cci1_i2c0 is not used for CCI */
>>> +	pinctrl-0 = <&cci1_1_default>;
>>> +	pinctrl-1 = <&cci1_1_sleep>;
>>
>> Let's keep them per-bus-subnode so we don't have to override it
> 
> I don't see any upstream example of that, would the pinctrl work
> correctly with that?

Hmm.. I assumed it would.. and I assumed we do have examples but
ma-a-aybe they got stuck somewhere in the review purgatory?

If you'd be inclined to test that, you can add a pr_err() to e.g.
msm_pinmux_set_mux() and observe whether that changes as you
interact with the sensor over i2c

> While this isn't necessarily pretty like that, it does work :)

It's the right thing from the hw description standpoint.. we have
a huuuge amount of peripherals that fight for the same sets of pins
(which is part of the reason why you can't turn on all 30-some QUPs
by default, and depending on the function+QUPindex combo the pin
requirements differ)

Konrad
