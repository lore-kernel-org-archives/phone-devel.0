Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E121DDC23
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875260; cv=none; b=c3u5i+aaBPU8PcqHWvZC6T8Khgc6ma9WsJhFgxBtHrNh6I7ObFqMu5GN/e0McELIJu0AMhlZQk0uauVGX2lQHnbE2+AbMuDQM4fnZofK6HXbUQmhsH41TTCdBdDNb3SDURJLTDChODbVNdgxQSlsanOOBDvzoDRX4cw89AQYVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875260; c=relaxed/simple;
	bh=Tkk5MGAPaZWvRMF34kA/9GkFmW5b1voNin/0nEzEVEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnLENCpszj4CJTpRgssACKc6I2Z8cT3GXTqYd7SBaVjXc6MUYKhOnO3QKrsdAWGIax4u+e+ZG7KpAfKxTEzsLyH7H3rMJIHg74Rkn4VTk5lWHniy+ytyorWG7Bgg3OuNJokaYKz4jdK8y/eVQRwT3GCrS1+SbJfOX3Hg1XiFaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHc9ND22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHc9ND22"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SEdxAf005217
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=; b=AHc9ND22HnKrKGMl
	/7NZMmfx3/dqU2A5YAWuHnSxJrhfJtfR/3SMcPrVSYlV+4fGmF+/cQEh2taf20jS
	OcXT/IJvkG5lXjXkOAI3+jngrs6PnnrBNSkTkkiXymqdB4ixVdztWg3gUiNlDFR3
	EC7sDuKwm0vTF10ulFE3j2dr0Its86wzrtb8fw7UpuU5TEi+Mn+rJyKxRvuxrC5M
	GgbHVq936qLfUHT+Eax9D4edpnzfUNApdfhut6t0Vno0G4aUt+zgb8FqYkwo/Xxf
	kCzdzxc4CG2cag6slLlX1ufMHUJxU1iRs6dfykwLNA6QvInSRrJTwP6VcLUlVWe4
	BN1pIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevhh8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-477608e8e4aso7459641cf.1
        for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 14:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875257; x=1746480057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=;
        b=IWm3skMrO4SLgA12uCahbxSGcPjekc/cMNWUovvzFHkxxlQufILO164QJIQOkxRvKq
         R5E0oGYOtaooKW6hXcND0bzTKqo7PZq2aW4dgJKmdaXOk/8tNbwlmwX2/NXFFXON/zY2
         zTRZ0el0mLLrb6O5Tn4TbptNsxYrNI4kdUJOSaoypVpL8vr1yJSC2Lt8ujv8hhrdeuKu
         0kPuqC5f/XxqQ6u8gBiZP43ElT85JJsZW8Vs9Q0Ug9M1JMksGvDdgGr9D1NP06uSRttB
         67Pvjf5D0iLBOh3Fayx+t3nmmbQjdZv/UA8arsK85G4UMBClHT5UWBKTUz6xtEgSqbyG
         Tcng==
X-Forwarded-Encrypted: i=1; AJvYcCUm/NEXfz+McrSsKtGmKHojjw5qn/A1wYQTgoV97NmBwfPaTyepejPYGgH4i0LbAh3jqO5Et0SvFg5p/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpssdUDPeh6mPvclNYpBTI9Dtyv/I6tTDqKLUK0LxihmdTYTYo
	qTdWacfnoqh8aCodv2BGaNt1ekRd93lM9bKwP5d9m94sq3RiJvlc5Vpe2lp9ZstQix4JVZNG5O6
	VwDt19dusvuZYIF4/vYHzSfb0+kIXrFlWFGlngWZOpVKFK0JzzWjTMzYEny7UJw==
X-Gm-Gg: ASbGncvXQGjleX2NiWNrr1MrpwaKFz+E9UIx4DJXdudVSX9h1CbGWXbsqcTt96NVcI9
	3wn8aMnuU+Qc6/Nfbb8a5T4HY11QuOUGNMsjJnAEz/9hPESOKTzq9vSrSj2Udam1n/j6IZnjHIV
	b9yemDHC6HQfZuLTp0xXWzd2dM+BwpobeDv8jq7T83cBYHxjUJ5iefg6TUcUwjRqwMDpyPYWIeo
	4jZ19V7L6pZB45dKQU+qF0SEV+77jw5ZwXIeMGavX8R3eGyvTRt50EKrSduvCKTGyc24FtVpbzL
	YDzMdHzf3XlF1bvj7YIt08WfTTc/YRtZUoEg6MW/UR8AV7jGAY2hqSZA27WQpIb/wQ==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635961cf.6.1745875256942;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFlUGiKJqtoSSSMgEbasdl1dq9bofa/6X3soNz43ekcNfED3Fjt1UCrbZacjbXAHMx8UTaQ==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635671cf.6.1745875256586;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm6323065a12.58.2025.04.28.14.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Message-ID: <c2b490b5-9e8d-4da0-84c2-8c68d78920ca@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:20:53 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HOd7JyR3e1fFXALBjzf9TlzoVRRSPB0s
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680ff13a cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZSjAytOJdz4hxISQkR8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HOd7JyR3e1fFXALBjzf9TlzoVRRSPB0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MSBTYWx0ZWRfXwGNZ9QVBg51Q 0ciEW97tb3nRaDpnY0bEBx6MBnQpYTyqYsyW9/y53Bdro/57GpGrzIQr706QF3L0vRb4ozyWIEL kz2bsBGewiefddiO9RMMMsuSndE5wdWMh8r7pdqhaXWTgk7Dy3IxqWhY/3oOSLOQRmPZxSdir7S
 /gnSqpMoh/IJlzmornLa4mBiXoTrSoxCmeoxCWe1TPM1miyRzl73EjYMpJ/GOGYD52UY3PSRwNq jIKR2sLWa/4/p9WJG0B42xQ02llzWu5J5CX19kF9ZExUEI5NRxKPgoVPZXP5USCLmlRnwo9kHqc u8B7JUcspoLYm3SqiDqp0S2G1Kq47c4un9CJKXimk3AR0N7eNXB5cIXOwy4TPZvIIKFpJCjJhrm
 uG1GM8xDouPTlZStMhnHqXF8Q1JpfJ/3PRllj/zx9Lr9X56R/e+LS3Dr2rsbGwjxO003JFEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280171

On 4/28/25 9:41 AM, Luca Weiss wrote:
> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>> Enable USB audio offloading which allows to play audio via a USB-C
>>> headset with lower power consumption and enabling some other features.
>>>
>>> This can be used like the following:
>>>
>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>   $ aplay --device=plughw:0,0 test.wav
>>>
>>> Compared to regular playback to the USB sound card no interrupts should
>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>> be handling the playback.
>>
>> "should" isn't very optimistic - I assume this works for you? > 
> 
> Yes it does!
> 
> With 'should' I meant to describe the expected behavior from using this
> since most people are probably not familiar with how this works.

ah, ok!

Konrad
