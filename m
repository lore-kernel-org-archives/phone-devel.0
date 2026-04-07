Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A23B3896
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567769; cv=none; b=Pu+l414Pm3lM6ezsMQA0i9R4P2vfvutbA/u74NQKDl7PxHHamBCRSQj2bmY8BiyPpUP3V1q9gQAkysV1R3vPCBLbaw8i0QAqdecAgDiE6Uoz/L+tmoyhWg2hRDFGHtQqvPvwPtehUwT9SV/VBjtygUkLMd1VYIY3OZu2ziJcoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567769; c=relaxed/simple;
	bh=ZhvcqY6r1tq6QhvYIMabKOvGzftrA2RhnzWMy/baQZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZFqfxSH+6FTwiZ9x4WDFYJ53PFJ314MambOuBrIM+mG3grlhg29VW5GYzlv2YJlGmvMKkq9CidA/yxwrE1SdpFoGcpIzJnBX/F8ECkwJEJRTPZYvJkvSkjmbXiXy714e6APgudXzz1rB592peUWAKTc+taufDhKdfrM7Ff1mmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppWcSLxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgiOXDfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppWcSLxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgiOXDfa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CANbx3537479
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 13:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=; b=ppWcSLxqr5d5b9/h
	OZE7Q/KsO6xrwkRE+iJkyMXvUzZ2FHC429n0VxXDoAKUuMeeNxqlu+YiU9jT2+aK
	HNv45y2ToeC/B+P53CW+nbnaDOxNMuMco7kqoq2TpnigXwgQRJGkjmxAFhQCj/Hv
	9FlvYA1OMWAFVSiuGOKzW3gWIpt90V3EkfR/2+SrQMBzEoFvPwkjYPYhZJ4u+RvI
	F5iAxX9snpkLXYB04U1vbOQBxsBuYJzw59EqrOmWGi1y2SPmF2ESqETCHkEpFnGX
	ZJpHUlgLg7CH/sG+4Kg9SB++Zd59PFWq3IG7h6bJ23Pi3jERXb0pt5WqTC+2Hq16
	6Ld0nA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2ue1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 13:16:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-661115c65f2so630373eaf.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567766; x=1776172566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=kgiOXDfaJV5jSPXRAJSF6AA96V8D1FIJjXGQcD1/QRG/RMZPrJhYlhPBpyUZNFdUJH
         1Y9DklGoavAV0ClD1Hte3p0liu98+3X0abL4EbZ+UmaF1xYDbNFGJo2M989b3IFNuHBy
         nzm5j+90kXmOowm3UGXCaxWOBZNA+qq/gmu1CTTmwARr4msb1Fmd/0i1lWH8VeIbrjQ4
         edoC9oJkxrU/v0/tTFL9Eo+nW8yPM3TDpDdffnvaQihijP2oUrzEUVdmltQ459htiRKR
         HanrdAtOffKIyIgyjmNSEPGYyruVkc9F0BOXKObAM0WU1nn5OCTt8jGdf9js1sq80J0k
         SxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567766; x=1776172566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=DpqzcglZ5RsNJPGWV6ICtex0An5mBipt3vejvCmn3O12Kd7k/esLGKMt8yFIEAmfVH
         2N4DdhKk7BwXEwCIchNUlgC2XM5V9cqOBfvgJniV1kJU5c9O3+oJ+Ir8LdcdpcoHPRMN
         7ATG5AKvu1YTJ1AsQmGPO4l5pvAveuUXyyt87iJn9qmJY6xcoAVlYyh6lvj1ATEQ0CIg
         caNAZiyAzUavurQJV/TvpSaV9teSVlwtwBMc0MHO+sO5l0niCRrjmjCxPihyAWxlvIDm
         ZCesxG31tj142dqmnFvzliF31SBkmT4v0NfHDqZP4eSAJkZX+qw1cyIWdcIfR0VlHMDA
         DJDg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPPaGMMmRIFrVwx55TX3l1PJwDJ4NJik2vXXfTRNIwmDdNZjxEcK8ZXhfEvXxcjgg32FxDfkh0gB81Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjoaCqlPdq5SuScJMb/DkK0FwNq91ydamPdydJdJ9PtshpAtE
	Ut2HmmzDlKAS9pJuhxYwSMh4rq00cOr0V1zvpyBKGAKqD53rBSNPXjdJuebBBx07SwgzIRw65ha
	irwVKvLbT3x0Z8/JAweRki2BvdmoshZw5Dw90UwgG7Lt57mxzVVrgizFOfqQPUUOc0w==
X-Gm-Gg: AeBDiesQEJ0e0nnQ20ZyNFt+VsatQVeQBO69nW5M0t3GaTQdG++KPe/050a9wr88Uzd
	BV8me0ARPrzz1qy8p2JNhmGZ+haJL2PHoUOFlCohkFxyAJzJDaXk0VYsLKX1RPcG9gjel8oiayR
	GI1o7lIWbOFpElOoatsmbgAyrrDI3HJ9uM0SmxDKpGdqR+QtiqIMrC7QJ1eAWu/KsO0fE4yp79Y
	94Zggp7SXobg6sb+FQHQ+zi1T8wAskB3O41qig/nmYY6FZ8+Dbh/nmGjKuO3Y5zocHOvzG4/qaj
	YZ8JrkG3AozC9jAn0CuPWPnpkeDso+fwwjoDvDSYO/dSvbUSlFEYPi6KdaGCMnl56YfHlHsUGK4
	bc1JobfqZrfrFbUBofXscqsxX6qnOiFSJfQ7FtHFhKQvpyLH+AhKAC6gb+tcmJHq5
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805577b6e.6.1775567766085;
        Tue, 07 Apr 2026 06:16:06 -0700 (PDT)
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805526b6e.6.1775567765296;
        Tue, 07 Apr 2026 06:16:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm567712966b.15.2026.04.07.06.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:16:04 -0700 (PDT)
Message-ID: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:16:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NCz2Dbeitnf30i5qK6QPD4gJH89CAzc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNSBTYWx0ZWRfX0NaM+RUvmXVv
 7KED2IJGAtr8IvMupokVpFWEmoEXtjhds2HW+7K18cGHwjvhiopE/bfjPPOR18ZJ8uV2MxE/W1n
 EQV6x3aUL++7xRWiQi4TlRaumkSjYDtqHxuH8vncir9PVbc2trqfmcE5LKSk4s8KmCvSLZ4Bu+C
 zIB6EE1NMsu3Qq6vGOd+ThVllVVtn/8878hBlT7n+rxFSGCvPljF9fqvqc6xMfnzYKQ1B8JsDvt
 WLXPaM0J6srHS3NntbljqrVg1dsc4XOcQ3bGLGMDBbQTRbYmeo/GCYlbNabIjaaFCBwJ8+mg2Wc
 gtBGGiGDP3gBgUAqTotXsix1MYuIt4q2tzgmuv3r61ECXz5XKtRwLOKoRaXSo2WXDXxx6yo/mJ2
 panOruCPYy0HQhtUwUzyKE8T+2ML/9H6vnRipFgYbWHshdYJ9I07/lVY6tG+e4sMX1SpRHkYO3O
 EdNXWQO2YSGagq1YOHg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d50397 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=iIL34To0PIL57gYWuS8A:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: NCz2Dbeitnf30i5qK6QPD4gJH89CAzc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070125

On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>> Configure and enable the WiFi node, and add the required pinctrl to
>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> the missing pinctrl to make the WPSS stop crashing.
>>
>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index db72418b7195..d8ac495ca7c8 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>  
>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>  
>> -		pinctrl-0 = <&bluetooth_enable_default>;
>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>  		pinctrl-names = "default";
>>  
>>  		regulators {
>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>  };
>>  
>> +&pmk8550_gpios {
>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>> +		pins = "gpio5";
>> +		function = "func1";
>> +		input-disable;
>> +		output-enable;
> 
> Hmm, if it's a sleep_clk, should it not be handled via the power
> sequencer?

If you mean that it may be needed to toggle it with specific timings,
possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
access to some docs that I think should have the answer, hopefully should
get it soon.

Or maybe +Jeff/Baochen could answer faster?

Konrad
