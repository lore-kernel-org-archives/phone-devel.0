Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7CE388E7A
	for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288000; cv=none; b=cYmfm1fKl519ks398M5QXl5QoOcjywKMqPgzjnIJiwcgOqabWghvhl+IrsKblcBZH4AxX36f1FAwN4jzf1moOk7IKv2HTKE/Mer/sjRBZJYePcfvjbPnPqL7oFwENyRJl6rUPdGeugSHvH93nKhVTNNgOcdoRSqs+sBK9gj2mb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288000; c=relaxed/simple;
	bh=PoMtRmBnrxMpeXjVWALlkhZR7MOSmDLg/HtlBaZghvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPGn4zXnRHTWVzxSaXnsTvz9U201XV/wgV7gkEvxto8fBgDomzMRpj7b088B6ri5d58u7TAFATm7Nhrh5smh91UnNrHYTOvBK/gq0pA8me8nA0bl91f2d0SK7uGdimcBSMjB2KvuOquxditBUcnGZ2nm1KiO6vcXjbahNp7bQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDVl8/lF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yud/1KlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDVl8/lF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yud/1KlW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tt6t2522416
	for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 07:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=; b=eDVl8/lFMFgqjYfH
	AFR7LjZRLmq0AqxHum60bHAqvrRwKxSQxDx1OE9VlZBvf5kzQNoMSufU6wzsDBzm
	GXYzM31Ce8MgmT3NwysyP3bltFNp2X5vh2GmeMtDDNBtIDEYPLaBh7WoVHgRNShG
	zcT10bL+D8l5nvXz+jttc0d1h1MlOz4J8GTNvmAr55mZJFIVRj3aOPgYAs7x0PDm
	LUXdcAMz2h15PdtlCeNF0S1QOy6z4Yej+FHtVBHdfEQ8mmdsC2hpmyE7bX7h5TK9
	+CvH9dPQMK7vnnNtppUL0fut1/ifcM7lIDZHoTElgfWiwg/q+kNX6DvRfVrbHP38
	Q+RBaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajh7xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 07:59:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5198e72249dso816351cf.0
        for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287997; x=1782892797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=;
        b=Yud/1KlW4/G0j79IGVQUmIOXhUqC+K7VR0GebGu8vg52kuuswiZJ698YBXtWEfcCQf
         hDZDTwzFjWK3jwwyNubM4l8omrVkk5I1vBSvizuMu7jHzIyIFxK0SDJjD5d22mpTjxPQ
         Lyp9wWxGVszz6Ra+rWHsBPm90pEuoesdkfJRnMZjvEwz261ObV50M2u+G6M0hYfjRock
         HQGvadByBFsRQXIP7HgAgpw+10cuhUgtEWQN2hkssJAYrZmli2JMwV2sDyh/z6dT6hkx
         3LCXCYGQ97EpNO6U7Dq0UJPx7Bw5PXEalw8ofEvt1YhungaV+NASKXgS0tnQUjQlYtt1
         jOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287997; x=1782892797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=;
        b=QC+EhZWoCIQCIDe7E6N1psvp4Icv8lQB2QBzipXgHbodjOcjYxhv36rk5R96GJsViK
         O01HxEXA5ATeipL5DTsD4fy2H9v9vuquu4v7rN54dvbjt78TCnfw0nPN/47D5JiPxh2X
         zgZp2wRKdO+vbLd2+BRMIbTD9i30qvLudt4EXVLvlCS8MK1BtMIrgCojuUiDx8UuKw3D
         ShKEbLP2Zqm8Lzkv2e/puSTIxIFghb/yYn7X4S9avleqsqZmoahbjwYK5/0r+ahluBk7
         KT5KwB7FuMlzoQNeiZe2p9e25AGfQlr9NkN1nmVHngu97aVkZPrkM1Mv1EUNgAFqlnzN
         9rEA==
X-Forwarded-Encrypted: i=1; AFNElJ+sSiKCfi8Rv66V/rc3JrnNPXYsfW/B/p2lCskuQ/lp36QDMIJngUWhyVHD8liWDCrtMzhuuJ2y1egitg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1R786/Jniv5kSxG12R3wJL8FwS68U264QC3Su5g2Z18n8Ao4y
	RQLd5PO3aJje2PKb/je9ZeHWrrnXI3KVm3D1juOaaKXolCu60rn8yUsOPTX3EBMEoGfNuM+wA1+
	H20LfaogQ3TyOWhaEYMpAvCJOpEbNtNIWfPEg1mImCGT1G02j619twmjFBhcd9sWMfQ==
X-Gm-Gg: AfdE7ck07KGVi+h0uqFq3wZWxylP2NWDl4NeEVgcqWU3Dsn249sh973wtn37eRkWJOD
	QYl09WVPg7MSFZO9mE6vL6ukAE1bRZC+d4s5yj/oY19VTU9qvRVhfoJzOU5k9P62p1KX2BsS4fq
	i/XKV18gv/w6Y2q/AoMAe+MYGNw6KRPzNlWoRJ7YbKqF1yUI3D3l8UpXkH4KxFlgvWLPrs1XBJE
	6xuVGBappUVH89SuPtq8RS1Iu7zBIytIpO+7yYoR/MqtHAAFYbUCMsv7zAIhsTj6tUoECipstdI
	+/JZYU7hjDOI0s8st2dCr7ms1Q4FzckJbR4GiVrP8Q00UfFrusCr/8/0lDcB6eICx+J82lPvZvT
	IbP7vr202f55zbA9z87wBnf4CW++EV7cS9x0=
X-Received: by 2002:a05:620a:f0f:b0:915:fad5:9096 with SMTP id af79cd13be357-925cb33c4d6mr894296085a.7.1782287997417;
        Wed, 24 Jun 2026 00:59:57 -0700 (PDT)
X-Received: by 2002:a05:620a:f0f:b0:915:fad5:9096 with SMTP id af79cd13be357-925cb33c4d6mr894293885a.7.1782287996987;
        Wed, 24 Jun 2026 00:59:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5eaa64c8sm629274366b.26.2026.06.24.00.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:59:56 -0700 (PDT)
Message-ID: <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:59:53 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
 <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfXzmqpXKQX6KV0
 vMJGq7j8fB8zeuQwjrNqxHn0G4CNV9WUQPpkGsvcaH5HZ3jTAlyzMekfeJkvrRRCDYFo0UcJGE4
 35iIrg2sMp4Lx3iVPUdKC0WVW2sQCvU=
X-Proofpoint-GUID: EWsyRcyWtOOa5SsIqp29ll47SlabGtTa
X-Proofpoint-ORIG-GUID: EWsyRcyWtOOa5SsIqp29ll47SlabGtTa
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3b8e7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=XHLXOlM-ELWRbcIoZxcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX3+aDbuSwvz/J
 E4YuSdf4/mwDHXBR5dIYMIip/8920KfEGUFoTx8eDxarRIgDQFuibR4l8kYZQk+NLL77yE5iOdI
 ws+Y5LCZwIPPmXrwf52yaMBRUdV1Jq72XKdanUg34362or3z8mHMmJPKVeKR9p2eSEoNnC6nvTb
 tbtDgxaEdWdxWBEfqVlbljVMhQCpNZy7qHWawFM3Nq6nTWskaUhubRg1x7E4iy83w6GPAN5R0fa
 pevp+VSXGWLpcglQ4GoDwF73ksLsi/55fJdg/UggT58WCJHYVeI1+WHGIZhKFpDBunp58k/FI31
 dGKY6nX/dLGEvHDnnLB12DB9jEtpiaQ/6QdKUJVPTmvXGlrIDgbxGxUsx32NIxPTO6DM8e1GqnA
 ICugaKXcqjZatlEmXfiKdq8invwElKXzPFOkEBeiSUW1vDkWvRmMAdbU6TbcbS8Vhe0RB3pREEJ
 okc6HzKfJ1xwxIUZktg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240065

On 6/22/26 9:05 AM, Luca Weiss wrote:
> On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
>> On 6/12/26 3:46 PM, Luca Weiss wrote:
>>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>>>> pinctrl subnodes should be sorted by the pins property. Do this once for
>>>> kodiak.dtsi so that future additions can be added at the right places.
>>>>
>>>> No functional change intended, verified with dtx_diff.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615..62daef726d32 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>
>>> <snip>
>>>
>>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>>> +				pins = "gpio48";
>>>> +				function = "qup14";
>>>> +			};
>>>> +
>>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>>> +				pins = "gpio49";
>>>> +				function = "qup14";
>>>> +			};
>>>> +
>>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>>> +				pins = "gpio50";
>>>> +				function = "qup14";
>>>> +			};
>>>>
>>>> I understand and support the intention to keep this change non-functional,
>>>> but this pad "gpio50" is for qup16 also, right?
>>>
>>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>>> * UART for qup14 (OK)
>>> * SPI for qup14 (OK)
>>> * SPI for qup16 (no pinctrl)
>>
>> "no pinctrl" meaning "not defined in the upstream dt as of today"?
> 
> Correct.
> 
>>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>>>> for qup16 function, I find all of these are missing on the original list.
>>>
>>> GPIO_54:
>>> * UART qup15 (OK)
>>> * SPI qup15 (OK)
>>> * SPI qup14 (no pinctrl)
>>>
>>> GPIO_55:
>>> * UART qup15 (OK)
>>> * SPI qup15 (OK)
>>> * SPI qup14 (no pinctrl)
>>>
>>> GPIO_62:
>>> * UART qup17 (OK)
>>> * SPI qup17 (OK)
>>> * SPI qup16 (no pinctrl)
>>>
>>> GPIO_63:
>>> * UART qup16 (?)
>>> * SPI qup16 (lane 3) (?)
>>> * SPI qup16 (lane 5) (?)
>>>
>>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
>>> then SPI qup16 ??
>>
>> GPIO63:
>>
>> QUP1_SE6 SPI_CS2
>> QUP1_SE7 UART_RX/SPI_CS0
> 
> That matches pinctrl driver and kodiak.dtsi at least. Still, the data
> sheet is just wrong there. If you have any contact to relevant people
> there, please let them know!

Please share the 80-xxxx-xx number and I'll see what I can do

Konrad
