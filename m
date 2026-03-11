Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC7113DDAA
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234233; cv=none; b=Hq/CnJx+SG2rI+1I10fbie5g4ddNyV/6j/APxOUBqR3DKWfEDKgqP7t5XrOnqN03Nvb3Fn2GP/785VFq+/q74S0cZckaZQtNUkxlVbLKpxdbXjGYhxuqLWwsjP2tIR+DIFloINMfbWdyzk1hTCyz/zZTGegHG4c7pcA3s6LPHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234233; c=relaxed/simple;
	bh=5+J5TqAqGh8ioSYxiauKGxtDEKPjcO3n849+lga00bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7lwKa0kb9UOYGJO91Tg7Sp2W66hqarBH8ITakQwOV0IIlgC93U0zjkJ23Pq/hN89R+uN5pjZxu/g6hw2pyw9Jo/dXp5O8v91MS9N+LHD/FHqYOwdgcvf6qXRZ9xzjEwkN8NfkHxfED4hir5Qw6/IFk0zHzuChlbr6uuD4Ph9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erU2gEXV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfSDM6aT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erU2gEXV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfSDM6aT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8oAmX1573154
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=; b=erU2gEXVebghbm+o
	2GZccEX2u8Xd+E01hdidrZUuxAaH1uY63xkyHo82CZ97lHfDsKlxneBid2PUBik3
	o1TJTdTA+S1oJGAHR7BHq6XrH6dQQuLOLeK1deIYeoLbPlHjbdUcTjtbNBS3plFX
	kru2dm+0IKJa89gVM7IuNasdPaKKo0FbKB+fS7SDUbnnsNYvlnLgLU71vtRIqaEG
	+hctJroMVOeqCUUSi0tnxA8566PjsvE8drEHktiljxb9f20LYs4MDy/Cv92+W0q1
	uFhOZP4wOZgOKzcv8HMxyQBgQHj6d7rlWOYm8Po2Q3pIrZRtBBA4XdtvVfuo2l6O
	7fukUA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbp06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:03:51 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-417014a1276so4494116fac.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234231; x=1773839031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=;
        b=dfSDM6aTDjDV30MY1vJUTbE1t9x6K8aO3Vc625mWfqcD9M38AqbUQ6/YjubvmAM+uv
         jb3NAw9WGh5To9W16TfQBDJ9QmmKRGdFANNINUXRv4CK3QhoBK7JlsHEekkqJFaKvP+k
         OoxPINjLZ8nFcZCYdgWWe7VQk9VMPK021xgcUEbAW+OUV7JHAysqnMfFzYm4iotdl5/R
         fNREX3pxeClM3Yl+A+TJfK7mg9Gspz1/khBbAXmmDBw5a8y0klbJCpY4pqe1VGCkR/fI
         fNqvWOc/7OTZslURvAXrMtcTTH6ZVJwmIjegfz+8yRFBvqJ60iwiNPRyGKAkPK9JaPKY
         dRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234231; x=1773839031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=;
        b=vm5Nt5GMQaOP/XRJBGqetf3BHqxvZrSgicBIOb8mq8TN4qciQH211LxRigS2oXe28R
         1K987VvkAO58QYQ+9ejIjyYsDXXb2CNfDoyZM2PnDNA2VnCXgSxwE/AlhGVxnT47+tSg
         CTdc2u/ARsvveGZYmNaGkx5Sk/22SrVIW1xkWdhfRLEDjGt2XRp9OzgGBTiyTZlignqC
         P2bTgbNbWNR5dkIP/UQewf6LxO9PYLQMGi0mH/zLjJkvgs9iRIwgy2jEdxu6Uw+6bnbO
         n8IMs9YsQSL59Jdj+rG2jvYgK5uuT4M4OJWbreGriT5soGf1oCBeLkf8sDCCQ0UtPCTi
         1cNg==
X-Forwarded-Encrypted: i=1; AJvYcCXG/b+j86Ep+KlGzkXamkf4Cqco2rtmOVMn6hg5y3jaBF9SDY9oZC4+DCEw/4RKxyMy9PmD7fmrxWf82w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzogPG3YHadaYkIpQdoHLk0nBwfLhrL3vaYkHY1xO56O6ArYOaC
	o7WpgdDXZBro/f6+6hWCC+lXvVONO1k8hEb/oZwM0fPXfdW7Tz0vyQQXMmU86lvcIjXGTbSWb7X
	+19trgBh5qW5fKiQZOazEseH2V3UJxt5hLCinCBpMalBP8mbJkzhDBJsY7HA7STa7oA==
X-Gm-Gg: ATEYQzxLQGZH05rYL0V1CUAElCrF0XnnPCaUCjiFWRRLMF+z3BdSPBG7XVji/ZuOrtV
	Z2nJmB9zvxC5jSFFr4GxR0kb2v6ILvPXXg8UtVO0dp5BacI1tAZavJ3sriiXWlw2AmZGGPQ6DMd
	+O4T2nmiWol+XQo+VOMM3cUd88Y1IhtMBDN8vZkHIBA212Z/wsCyVA0co5G6oiANgZHsCrUpQ2u
	W5h1Off9oAcnUfqDVRv/awfl14VJkcK6UBDbz/ZwBj/XyYF5GsztCp+5HcJvxLPBlgPKnwKFK9B
	tk72jYD8HSXYzsdflRPwNU3FZPWUA9XOtqB20PIU8D2VKLMcYNlX8SWQWFTXElzyzyDntu8oU8+
	baxZ716ixSEC/NANlLZBfMQ/aoowIBqJjjR5KZV8YSoNME9U6l0UZQBdqiG49/3SDv1XofGDR2+
	+Kfrw=
X-Received: by 2002:a05:6870:678d:b0:414:b05f:1ce2 with SMTP id 586e51a60fabf-4177c9a7bb6mr1147761fac.5.1773234230686;
        Wed, 11 Mar 2026 06:03:50 -0700 (PDT)
X-Received: by 2002:a05:6870:678d:b0:414:b05f:1ce2 with SMTP id 586e51a60fabf-4177c9a7bb6mr1147705fac.5.1773234229627;
        Wed, 11 Mar 2026 06:03:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de5684bsm54177566b.23.2026.03.11.06.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:03:48 -0700 (PDT)
Message-ID: <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:03:45 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W5M-ivoVBwSRaI82cWFFJuq18u3rF9cq
X-Proofpoint-ORIG-GUID: W5M-ivoVBwSRaI82cWFFJuq18u3rF9cq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMCBTYWx0ZWRfX6v3+7iYd8G5i
 0blEh8YaRVNdvwSia6VrchbEtfapA5wBb5ZagnVzCHoNuFJ5DBQqvAfcJ61+E0kCYb8691jb9P6
 O+jRJMxpsAnTd4GqiFe288Lv0dsy+9gUpfuf+F2hl5ot/JWRgV1BC9NBWps7CQNwzP7KwMtuBL6
 ni2Ol1elA36M6QFNtfnf/oiHM1GHO9MJ95Y/hjZg3ONKoujUmxNOrP3XCzXOaRstfDj5AG1bHXk
 F/70N/EF8jjLi7GkzhxUtD4rjYVpX6vcqalULShPeXZtkKlB67dR2Z7eU/RL6vEYiuen7QQogc1
 awGQ12TnI9tiSMPi+qtd8y/RQh29FcSYXE9jcBw5ig+5jPadwaL6SFHyFy/vbdCJGNqTmfbyGko
 HvwnwhbD19N7xipxsnyb6qoxROWsAHdDKxJv2PAjzEFba6MSQNZe4CKTCGENuJBVYTfUwtgSaHh
 dAI+1WIVF/MBB3Ziu/w==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b16837 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=ZEhHOJAMJ-b77FbnAkkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110110

On 3/10/26 5:20 PM, cristian_ci wrote:
> 
> 
> 
> 
> Cristian
> 
> Sent with Proton Mail secure email.
> 
> On Tuesday, March 10th, 2026 at 14:08, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
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
>> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
>> (which nota bene doesn't match between the comment in that driver and this
>> submission - perhaps that's just a SKU difference) during the reset
>> sequence
>>
>> i.e., does the touch work any different if you drop the above?
> 
> Apparently, not. That works as expected.
> 
>> does /proc/interrupts differ?
> 
> When interrupts-extended is defined:
> 
> ...
>  50:        318          0          0          0          0          0          0          0  msmgpio  65 Edge      gt5688
> ...
>  54:       3141          0          0          0          0          0          0          0 GIC-0  65 Level     gpu-irq
> ...
> 
> Instead, when interrupts-extended is removed/commented out, I see just:
> 
> ...
>  53:       2404          0          0          0          0          0          0          0 GIC-0  65 Level     gpu-irq
> ...

Hm, that's odd - I don't see the irq handler being registered anywhere,
or anything requesting that name. Do you have out-of-tree changes to that
driver?

Konrad
