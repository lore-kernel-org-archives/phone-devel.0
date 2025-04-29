Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6C29DB83
	for <phone-devel@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917218; cv=none; b=QBll9jGYtUkT64HRf8WHtR5IrMQjcV2/RfvgelrkhKZ40GWuTA8228dEVcZQ+dZbChd1J6nclPKRkePjauUYLhIq4E00jTpDQhxOYYwh5erhVtirJ6t/swU39urBTtkgNWrLb/5KoKSyxLRd7YB32/tfgSaJTS8/IIahiBBrRNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917218; c=relaxed/simple;
	bh=mYwV9qaC5quGigoNDzErPL97AxB0Z1lobQFByQD2FZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq6CpUv5DjwOFgpRw01jwk6eTuO+vU58gHzC5kNCz8aiqHiOUr8BpnZS16lATGt5+nMB/8hwTJhEzJYr2aQq9YY1MRNJ8r6F4hT7uX4OOln+8PYkvuVAXZ+LFb6iYi6B7gS50YSXeUYWPcM1x180IFDFSF6cPF1Se80c9QOuz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHycyrzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHycyrzi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq63M015305
	for <phone-devel@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=; b=JHycyrzi4i3ApBuc
	31HQXK2oDNvxJ4SHzcea+VSjsiKuOh6XnUnuVU0NSB9G7G4PWnaoow/X8X+/v8JI
	a+e3N4z51LMQvSD0wBJVsjEJb0ZNuxMFXe2nB+h6KmEX+vZs35oktuv+JFGd+wzO
	RXbTekqBjlinpqhKMpCIG3MjhVtpILlI9lLl0ho/lOLvVaIFhkgF67WGtl2gPcji
	VfDwmXVWoHIM6FuFNKcsY5lmWxXrEDHeP9lQ0wczsa0+xXpnqT9fbzQF/INJgV3T
	Rr7RSKrd8lezM+BIxvGnAXZ2td3lEbBXHzwdpelMJahwDv/V5G9tia/T7jbSGw/j
	17iOSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8htut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae537a9d6so8029251cf.3
        for <phone-devel@vger.kernel.org>; Tue, 29 Apr 2025 02:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917214; x=1746522014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=;
        b=nXjd7TBDzm5qF089l09wlGiPuN9NJqPuYmVeVnO4+ybzuhFcoVL7paTlmb03pbXWjA
         5OS1TBUwuwi3UH60v+848ETeHAwS6VffaPSjBlI7kBsSfrVxtDdALZOSYayoU+RqcBTb
         FNRtFVNJttonWaoyFvWETqNMun2LqSOiBzZwMWOmwDYOtQkTdHqrxIEGEHE7Jt35SG8j
         vg4LxvK28aCH+Ae0rL7uyg8LClxMD2u4+ssKE+GmT0WlfkrKOpSWtFS1dL3eHRs9DGQ1
         yXYXestq/QvaeCGUQ9NFEsIAH63UWWqyi8RE5y0KEVLDLxLVDsxv0lblTRSH6GOG+FO+
         bddg==
X-Forwarded-Encrypted: i=1; AJvYcCVMe2w6c437ZS5eiYwmkt5kEfZ/fs+vS5CMBswk3IXRvidj+FemSvYX3mIWHOyhuR97leKzDh6Ty55mrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySeVoT/TNvoL5qo2QpJXrFzbZDmHB+1alKiy/E0aHTxurY0GvU
	MZqNuv8q/6KIDy1JXiZ0yRMmq8TqpHnmR5cOKBImfYZNTFCk3xcEhdr7Gq3giz5BSUN7ZCQaHCe
	Jen6M9vg2JYJ7frswElGHLroy+Ph6T6dGFHnBPMHNuTOnJfe4oPyYAnsB7Iam67SxyWM5yA==
X-Gm-Gg: ASbGncsrfp1OVr1B6vnyFIREqdW6QZfZnDf5um1rWOFyrS9cp9dHSWg84jLodBuWuF0
	9Af5yD+j9xAmlHu2DHoMFqzv0esSQS4/nfoLjXITBIheyY2EClA+fn9b+44ZeG9QQdXhKVoTDAq
	SfjIFOI5gJwa+MqXABs+8flG8yAAYTQgE9D4Y+NFLtxbebDgvzC7oWOLELzzmwehrjbtVutQSHK
	ycSRE5/VkU1MK1YCyzHErvHoTLvuNEXOfQGAztteuZ5Qlsw3P7bTth9V783aN9GS+iVO8k7P6YY
	aRZCRojdRqh29+E5Wy3QFCwZqhfVg+5xdh5rAYvaq2klVcj7AEWCVApOdvajE/9F+w==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13381271cf.7.1745917213862;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoe3LY+sQejWrjRsXICpmmof+c3/tmw3k1mD2dd7DkiBAR+7Wx53r3CiWHkEswrPutog4ATQ==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13380991cf.7.1745917213331;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4fb5ecsm747910666b.71.2025.04.29.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:00:12 -0700 (PDT)
Message-ID: <a1b7d6f9-13bc-49ed-bc4c-40f4c2fae8e2@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 11:00:09 +0200
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
 <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
 <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mMiz7YR8CQrVO5KG_5Xsic1CQM-wbXvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX/6y5IHxYRHHP Ohr9wiLb6I9kp+1FPK0N0i+/aBdBFM2TGey/6YKolZE2vsaEdzQ5/BlePbMfWigsPQSAjNgOfKF QaVpdeLhuzgWwFTrgPOSEWuyl6xv21vncJJ7V1zhFXsC/bExjwcCdkugwg+Wpo7iiiivsfQVNte
 AxBT+7ZzKmY1nbSvnvCsoLSHwlPss5Y9Vqc6fzePmC6qEEMTQzHhxll7Zgbp7QGxGg1HXgAvkdU XxTlEyOScYooHwBRdGBpjoYspp9FiBqGJ4WY2J6sb3kBFsjxxo3IzpXlzvgSuajO+jadbFrvcTc 6prpZklz1rJRzb5r2aTJJPafGlFYZfxVanSU/dmS30hB1HrdbJbam41s/D6JjNTR20DL8khJVV1
 pnmOPnZCx1nOnj6Cpctyy0090eyew1Uir0/X3sixvpAnMWR2mNe39rlbwWjpEQrBo4aOGvE2
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810951f cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=Iso9NqdAnq4PZ9IQp5IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: mMiz7YR8CQrVO5KG_5Xsic1CQM-wbXvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290066

On 4/29/25 10:55 AM, Luca Weiss wrote:
> On Mon Apr 28, 2025 at 11:43 PM CEST, Konrad Dybcio wrote:
>> On 4/28/25 9:41 AM, Luca Weiss wrote:
>>> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>>>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>>>> Enable USB audio offloading which allows to play audio via a USB-C
>>>>> headset with lower power consumption and enabling some other features.
>>>>>
>>>>> This can be used like the following:
>>>>>
>>>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>>>   $ aplay --device=plughw:0,0 test.wav
>>>>>
>>>>> Compared to regular playback to the USB sound card no interrupts should
>>>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>>>> be handling the playback.
>>>>
>>>> "should" isn't very optimistic - I assume this works for you? > 
>>>
>>> Yes it does!
>>>
>>> With 'should' I meant to describe the expected behavior from using this
>>> since most people are probably not familiar with how this works.
>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>
>> [...]
>>
>>>>>  &usb_1_dwc3 {
>>>>>  	maximum-speed = "super-speed";
>>>>>  	dr_mode = "otg";
>>>>> +	num-hc-interrupters = /bits/ 16 <3>;
>>>> Where does this number come from?
>>>
>>> I'm honestly not 100% sure. As far as I understand it, with
>>> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
>>> I've checked against downstream) we declare which "XHCI interrupter
>>> number to use". Without the num-hc-interrupters property we get an error
>>> that not enough interrupters are available (I assume only 1 is then), so
>>> this value practically needs to be higher than the <2> from earlier.
>>>
>>> Why it's this value and not a higher value e.g. 4 I'm not really sure.
>>> Downstream code looks somewhat different and "max_interrupters" in
>>> drivers/usb/ doesn't come from a dt property. I'd need to check more in
>>> details what this code does - or maybe Wesley can help.
>>
>> I got word that it's simply hw specific - please move it over to the
>> soc dt with the value of 3
> 
> Will do, thanks for checking!
> 
> Would you have a reference how to get the correct value for it based on
> downstream or the running kernel on the hw?

3 should be reasonable for most platforms, but I don't think there's
a clear value defined downstream

Konrad
