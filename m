Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374A78F29
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876607; cv=none; b=cGW6sCBQpzUev9K0cUBrTDJG54NmE/3O6BGwuzfaDleEFmtUBj7qc9OLTXmz+W4+lX11EKucDd//1MDwt7HuknjLAzNabduyzmPOZsfrZfXky6MAlm3xoqCLYmeFX2Byu0dFwi9U4o8AZ085e2jmJGAoMDi8uq4TNB9hglMmNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876607; c=relaxed/simple;
	bh=YTnMjhzE/BjUN0TK1uZwvOxxyGpbZ9aQZQnvvzTr+X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtXI9JboPqcmj+qgBTnP4rUnhfk52rfVFLr2WnRVD74xiV/byMCI0yuhYy1LkiJoZI8L2Go1JqAeKcihrN8WLaBzZsPXlR5gg3kzu7b2OEJb9up8V2HD5X7gng9/oWMgPOS3Fy66TKQioYM2wjaCUFOI9drBH1pMEBb21w8MGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtCtNG1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtCtNG1/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACVi9023775
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=; b=LtCtNG1/HwSWHBdS
	4mMMkVl+BOOdBiSvGrOBFUydhM6ktS3gC36g6q0ALV84mzpJmnXWrwAbeuuU7LCI
	kZMXysl/YuY2AVKAf5wzFM4Qva3EPIr6/Lh7ey60Yrkk86mqi9lo/EaKuJo6W+E3
	b+BM4tVFCIoU1wP/Etq41dwTrcnVsZAOosefbWpWDzOCWOfI4mLCarc6l3W+qPwc
	dFIhZ23d8e1mATwots197gql9CQ6vVN+Tz1LBcmmo+8JD2VuoJDSH+MfaK7K+dqG
	9DRTtRaf8CtI6UuN8Ph2VuanXJ+m4r9cvsnqSXrO4dGQOBisIAu3XcNVTjs4CJfL
	9EocaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmjf57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476a4a83106so6802031cf.2
        for <phone-devel@vger.kernel.org>; Mon, 28 Apr 2025 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876600; x=1746481400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=;
        b=Y4IBGTRqTeLhM9GUo+CFcMstGH749BOHc5fmXMbTU4uCMaW22Q1LaVEss2WrZwqzw6
         5gRitCGnDtg1TcwczUIPRmt992xKkaEh0r1m7ASeX3XodacEMrjsYXAzUdEs1cTguPYI
         iX9dfd2acwO4puitQYxHJN3caaZhyPaXWPb5SQF3t8NXluDlN0kimiTYZSQuqqx3SOpd
         FYoV/4wy7syjappx3uem/MKlc+hJg8w23GbCYTt4FXBHHeZNl/wuNVRALKmEdD1IONAL
         B90kFHGRz9ZXI6lXGplS2Qa7qdiSoqWrJyI2xZsfa4mL63gItYfj6LdvbU38FOKqWhEo
         O7cA==
X-Forwarded-Encrypted: i=1; AJvYcCURWemrbJDjwzQs5h1/0M8fpd2wvIQ/cBEG7Ns/39+DbaB5VPjxb6sozrLGMyRvjPC0Y/xP63FNCzcURA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQMA7M2p4aHHbT1yn5wdPFcszdxf2AuhCEn1MgBLGAoTzrX3A
	ZwWaVFD8h5g9axTIUgGfiuFUoWAT236OH0ZgcsYcD1IgVWthkp3eudE5jg1VnL9hfT0z/jktyiA
	lBdh6ioQXF4UEDGWojKO3ljAv6MrNu1MNX/Fg2Tc65Vtq9hKjiIwapa3mWF4i6A==
X-Gm-Gg: ASbGncuwcZ1f08mr++eJMnDx5iTxzz9T+UH+ahalwiYOw4BrGsj4L/vQTWvfTK7RC69
	vBWXZ0yC8yw1UnWm3+g8FDMzl3CY0ddcVeHhekssgH6lu/NeE6TTQY2Uq8kjg3kwUNABbm0SlJg
	SuI17OOol7oVMOw01AaLtLjEU0/9W22Gf+QRPOjUGs9jdTnq4O5rFY/0k0+PLkk64aFsUfWoWso
	twq2yMHpQ1NfRb+3vm0tT27F+NbsWKQWWhz7RwtyDBbk+29xHcApp423DidR9l5yQH1lfvSuL1H
	4epwIC3RvnLdYLuDGP3492zLvM53pd3L/ADgAr629z234akgeW78JUrfI7vY1P+KjA==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89377211cf.7.1745876599669;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB14JfdvwUEuts397Yzw1zfG/EZZ6u2NY8Lwvpyqt/0PuxJTkGDBKBH4rJkTKOaxHlOXgrcQ==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89376901cf.7.1745876599300;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm677449966b.169.2025.04.28.14.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:43:18 -0700 (PDT)
Message-ID: <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:43:15 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K1qk5QPJhfDqfpI7Sy6kuSrzAc5nrm6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3NCBTYWx0ZWRfX4s0KIvBh7Ogy NDCJnNYxLruY/ZWG3ZuwPNYQXHQDvTZrtYIoDLrocuEn7P6Q3vfj/6OVrYiFOOxD3lamLFDnTEF p5qEvGmRINAWTZot6NRgLKpcjO6rsQww9i6VIhPXRhzxtmYdZzSv7Jk9rMpJAflvaSyDbqWhnW8
 Zky6MdqBcU5ibB9kbQ7/sHIrkzFUrC7+bzSw5kTr0svUnIZA5stFICzrAX3fDtzQQ/rWRPiW2i7 NLfp6yNRd3wYolHkXbJzD9m5TRrk0UROkZnYiJHdbDj7JasOywd/rEpjk5qN+gUcOdHxKRr6jjr QMXM3iZUjuciyQeDBFd1UFEiY+xebuq7C80bqMRTu1tfa1B9J1AC4nj0LdAQpOGfD/AocyAVIch
 oGuvwAklQggPyL7z0G5jjd50P6DUv4p+B3MZqakOED6OBvIqmB0y/wJCkqy5DCujWmh7hdUP
X-Proofpoint-GUID: K1qk5QPJhfDqfpI7Sy6kuSrzAc5nrm6n
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680ff678 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=u-BiFtGUy6h0pWOPBk4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280174

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
> 
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---

[...]

>>>  &usb_1_dwc3 {
>>>  	maximum-speed = "super-speed";
>>>  	dr_mode = "otg";
>>> +	num-hc-interrupters = /bits/ 16 <3>;
>> Where does this number come from?
> 
> I'm honestly not 100% sure. As far as I understand it, with
> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
> I've checked against downstream) we declare which "XHCI interrupter
> number to use". Without the num-hc-interrupters property we get an error
> that not enough interrupters are available (I assume only 1 is then), so
> this value practically needs to be higher than the <2> from earlier.
> 
> Why it's this value and not a higher value e.g. 4 I'm not really sure.
> Downstream code looks somewhat different and "max_interrupters" in
> drivers/usb/ doesn't come from a dt property. I'd need to check more in
> details what this code does - or maybe Wesley can help.

I got word that it's simply hw specific - please move it over to the
soc dt with the value of 3

Konrad
