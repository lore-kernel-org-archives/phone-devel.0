Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C12701B8
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233277; cv=none; b=g+L03vbjjz1cR656M5yy/5/b3oWtO2CAegmOLCZYEJl304t42AjAVYgwRlFhoOBDfqNEGk/9KdeFGKHoooi53WmPaE/sX9qcHX1wHMUbVLMO7r/OUxTMbZxsl3J5Cus9RdPbP8hlQUiE8r6OVcEvEALNjDxOWGxFLhuXkne4bnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233277; c=relaxed/simple;
	bh=1Psjk2nRaHfHDd8xvc4KgUjjkgHuvgedYWJ7MpRosLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9kyhhPtXP1aetFhkd8d94gHHjv7HyF3yBvjrvswJP+gWpniKKrqRYRb9G4+RG8irwlCwcmoo7ke3xywbjTy0ryjGcXCT2IHpiVkxuUUgV7LXx2A5g3aT5MchrZ/kvFqEb6vPzVaQc0UqcgebGhjvZIM26YKpUOIJoqKSRL+x7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEFaIkWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvwrFhwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEFaIkWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvwrFhwK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9g6C4248694
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 12:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=; b=CEFaIkWPEoRifqNS
	H8nTnMFU+83FdF3a/oOL7udbSYymg9pyZTKcOXbMqnAenMnvQOf6vbNXhV2FSapA
	FN7o+TGY2AjtS4rQ85WOsf6sMb/CqWiwsUwxlsfjFEul/cGbf71PXxhllDcrZFsE
	SURVgac13cHiBsPJIIkKafEMzzqGU2Z/g8ewsQYvtBwEGPDmN3fsoEqcbpy7IEfS
	ovg4vBcKoTeHKka9Ih778yij9Nu/fJkzEC0VqqOwrFyO117mg7J0UFQFkidtiLTq
	KYOEd/dNDQgDT5WIxR2FrAU/YHYT1yoBlIUXnE/ncSSNLjDSAT4DFWyLdGCiZp2T
	NTPsXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv13jw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 12:47:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fcb63705so53184126d6.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773233273; x=1773838073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=;
        b=HvwrFhwKCEIfZayOZYk9VLoFFHo564YYR/NzsxxrVVmBk40vXjVirdk+yQlZMIg0yk
         joajnVzrAabbD4vBFGGIvvfkr+4zps2KQqrXloLKVW4EiMDuBTMbfYZL4jddNYs95HqI
         lEkWdjFTGOH5hnAaCTBL6SqxZm1QhZagJLfSXwooPOZMmvwqm+3GYZXHkz9xiIECvLbD
         HECStBrCB9sbJDTOiJMDqwS/7AP5MidVuR8XvWw+uPnVm6U378MFe+fLIn7i6ufFbwBx
         mJi8INeMBNbBvLgMzOmQ0L/bvq471WJAT68md3BAOaCiED3T3nE8cfqCRw+PIetFQsSR
         42FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233273; x=1773838073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Y2CHFwj1sgN4QWWRsY4MppwS3vloHKyBvjpPhe1hYQ=;
        b=f7XnYSx7J30m/EpZwK/qVJ872hSj9f3MENHP2wTXHKtQPmG+vDvHU6bGRRWXINKuML
         fang2GzMvCqb3sG2EA+onOO8XJVgyROuekl7skFkNfRnmrRd763d4DElEMeyPq1jn5B/
         FmjK3hGXwRuvLwUYhzxjgX5Sho2Ek0fTokepkBhJts5AjDXB6hDKNH97seYlEGyiIP+J
         soj6IwKnzRTmqwM/oe85m0Ss8LuFZE2iRHrL5aBo7C4WByM4XdCMwH/8QRQWUyZdKz0s
         2diO5dxpjkDUyVfB15Bj9y1upesE0JEuM+pBDCValC1sy3XKnipM1KXTAxBRY1fu2B/S
         m6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgRqRiYwWcjNYbtWH1UL3TOT3UeG24xstPlxMj1QjN/i7pxELZ8FuHwKlRIpe30PbW/sPuiVs4noOBYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3aWA+9Zzia4Fr9B+2IXHfYt2kJFI/UHFCGOmAq+CYNMOx7ua
	+4uPt9+ikXF3r20bwvhlPShSLsu5KUKDltJJ5ndG3ZaZkI9sSaaNXdXMRbv8bPFu5aPRwtbOEgG
	ZeiaHdCPFiDvC4qTzCSIRX1uK70wY8rtinHPTjN1bXgI3tPMZrwFX4b+uMV5zZD7WwA==
X-Gm-Gg: ATEYQzyd9D/FVBQdLbhW6FwMfCixAvGUQMyJ/0mIRH3QZvQ4WUPglNcBxpzzyqTS7Se
	hgsdJuDpZr+Yt+5oT7s/L/FOuV9Z6qcdGRx3d8JHuJs2QZay+satWS0Z22Dez14CkaK47Q+2Cau
	V1IObDSE7wlP+QoX51/qqUQKn1GPphPGY0q48mhAOfE7+ZY+ezfXFLTbfbkHjqb6PzICp2+NxkX
	WYIld2N0l8WoFQhtQYsEdYkaF+ywNOfLgQauRczHf3w8MOZdrbMr5aKi737pHRoNBqhctF6Z+h5
	wP20pUYI7vetblLpmUTe8EUv7bJHkeJusK3OqH/FkLmhwsdZBI2yXuuLuZ2xhJCAOwbfN1pFISY
	SCeAXWMla2jNJkeA0l+oifYZCJOETVRhpvuv4clc4zTfRAdIUGSqU9nS4Lus4qLym0snrOXE6QK
	VDK/U=
X-Received: by 2002:a05:6214:4c47:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a668804b8mr20351496d6.0.1773233272892;
        Wed, 11 Mar 2026 05:47:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4c47:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a668804b8mr20351296d6.0.1773233272292;
        Wed, 11 Mar 2026 05:47:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de4795asm53950266b.18.2026.03.11.05.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:47:51 -0700 (PDT)
Message-ID: <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 13:47:48 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwOCBTYWx0ZWRfX6AMW7xDif7xz
 fNgsXmVURSKzCB5Rg4lC6SirgZV/860huuzT2iQSSwZuL6iAl1XJXtczxqnZFPHAheswS0UhQwm
 DlHDDEFj4xtc+Q8vmlOSZepvwPSnP1Aiu87OoE+6jvkb1yFQo90wIbqGzoVpbMI73QNyDxlU5/A
 /3Yr5Q0vGnB40sGZ+0YJ8J4m/XuWR5VIxiyFS16A6UMQwrxqONiQjP/5wcAR1LGCqHHDz6f9toH
 Pqojt7WegzFnLjT01EHECKTZghEl6hIWM6mp4ohMgj/dPfUYN/tOnYJnIrGR26S6hMbE2p+CkUN
 taCAAWIJuqtGWCasi5ftAcLI7KetdpPEpUrnuLgDle2/oomYE8HcYQJxz9nRUk4VCl+ResRPNaF
 SB7KNoI+lA0itJCi4dvbRA34MDhTsoFHRxIkTxOnWz9gSYtIld7QN1hJY+RnQVzWtw9pFE/I8xd
 hv1EKCTtWzSficXFchg==
X-Proofpoint-GUID: ipRcYMw8cGRDi_kSTenvjBAR7BZrM15g
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b16479 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sfOm8-O8AAAA:8 a=Qi8LA-PbnRB-KSu4gE4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: ipRcYMw8cGRDi_kSTenvjBAR7BZrM15g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110108

On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
>> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>
>>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
>>> Add it to the device tree.
>>>
>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>> ---
>>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> index 7b2849405462..709ea6fc9fbb 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> @@ -94,6 +94,31 @@ &hsusb_phy {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&i2c_3 {
>>> +	status = "okay";
>>> +
>>> +	touchscreen@5d {
>>> +		compatible = "goodix,gt5688";
>>> +		reg = <0x5d>;
>>> +
>>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>>
>> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
>> even consume the former. Trying to read through some of that, I think
> 
> I think you need both, take a look, there are enough users of
> ts->gpiod_int.

I said irq-gpios was necessary, interrupts is not. The only retrieval
happens through:

if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
	if (irq > 0 && irq != ts->client->irq) {
		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
		ts->client->irq = irq;
	}
}

Konrad
