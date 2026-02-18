Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5F933BBD4
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438377; cv=none; b=kSHGOc2tea0d7qxWOISCgDJRh4aQdTmlmLcz4VNVyYMtO1h4mLf2CFipEHlhu713Fcv2rL4wE81tayA1Cgds9HVIH/Nhv3HTAG0STGWInSmqvXCGbn6FDjqUOi5YVgBUBkRutcSr7w3H/yaPFv0GvkTLkVLQcSnECnJLWHJMhXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438377; c=relaxed/simple;
	bh=EGCHzAodjFoZy8zwIYBG26zhK2m8hl6yb7/jmJpKo5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UA99DpIfPPMoyOnGpbxV775R468YP9YcpAsOdsXjjXcN+w6wjgBIVbrjI3P+YHAtX4XPmAqJZ5Q9KT96RUPMAE41wLrkDMnGu4PsrVkd5DRHY8lPUCNO/Z8Coi8lED3VzY4SaBtRDy5uEenRv1udu7Xjsfc8g6tMjVu3/FhYDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTLTC/7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcfuAgsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTLTC/7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcfuAgsp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IC4vCF4060756
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 18:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=; b=gTLTC/7fQg/PpnEg
	r4+FYne+wtNRoFdRMRBBrB8WmbJQXoxjckho7MPclKtEVybhzONWam5DnUD8tvo6
	oaeK9MtZd6//hb0M0GRm42Ew6gvIINmJbn0BaWIgtr+iUmY6gE/RwkfK9guh/WiB
	k0y2RcyZtBCaJ4oG4QIVqAM8F+zBZRrfaIx/6UtA5yNN5gW+3E+2lPqUPZyTmvO1
	G5jwPEenrFxgZrCOfFila1OG3wRsga0EertXx5Hr4Ai5wPhf/tDKEgA2Pi103lwF
	xqxWD6J23IEJonr4Jh59jde69iE+BBera4+oicBkR0FM8ZuEYEJjsVytEAku8L4v
	/+vqUw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx2qn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 18:12:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so40630a91.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 10:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771438374; x=1772043174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=;
        b=VcfuAgspV7dauuXX0eUbQDF9Z9IpN3gpDqXDWjmzmkGgVP1BiVo5IhPE/twkEowLJX
         fzNUBi7oxaGCRx7opzmm+WSvgKQ53hjZzAiiUJMGcIjRH/LjYI7O7lRVMgk3KaGUUGJn
         jOtitTdS63timTR4MGQ2zklqKBRKp2D34zg9NvMaVvcaUfPa0WQWWnuR4nUNWVzC6AVL
         Xe+zuN9hlnJ1xGxLcx9u/v4NAgC0vltQO6qiqGmaT2e3xj7mOnUIR7J8yNheSY7JRr/o
         iDuNNSPuva1DA42+E/ZnFDuW12C4BSswvL3q1qixku9aIokOQqlVMrKxJ/N1OfPw5OkP
         JBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438374; x=1772043174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qxYicnhNGlFLcggiQLI77gWH/Wu7rKIhhyFeimRe+0=;
        b=t+VLzWjTyn2//csT4ruOatFB946cllazWDRL6SZ3pzuSRnF1AuiGkxEEomSo+G2+iB
         HpbYQ4Q/gEF1/Qhh3U6fi4HesiDQgh++1Ud3KeRXxdFB42J4wInVz4Ki6J8rxNdyoN55
         DlADnRe5CXMD6WaTbYGrprY/dNxpmtHRSW58sRAVd3o5wShqDTDSCTflJEyR0Bb9dOgm
         JuXB0Jna8wye3/83nGBwCeg+6s/aEHI9AKoGBQn71yC8tmU37+bfJ+GFn8Ovk/+2WBhX
         xdi7eZ2IrfC26DZgmxfiUkn9/PdLsYUDy/MVekrV7IAmKNGCOeU8vDxc/VvunAOYCUGi
         7qzg==
X-Forwarded-Encrypted: i=1; AJvYcCUMefwkKKCehJIcuARk5agl2qNHfmMkX2SFc3U8z/iogZ3lyujlZOW2vUhBfDE5CkrZ+AGhrwQQfYx2Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCUxxwgPrW7c5+y/Wjnf36lmCO/1Ov0dBSG/Ld/ZvDOirmY23
	/q9hxlRuGhcDciOicTbqDU/2ayfOncMJUVZLKFeDbYJhx8sLaGihoWtpAc0PoMLsvKRPH/8j/HY
	JP/pwhcv2KGrL86iNFPMA+bEhDYjP5skOPMLfo6kdUAG+XWbMafCQp7Ep0MSR8EfvYw==
X-Gm-Gg: AZuq6aL32867mdfTpTvCS/YUI19HYOReWoiXJuDFZoGR+EvQtv8SmNoD7TwCCdeB6WT
	I4osDYLpjNHsAkxueqFmjxLusWxY5eoHqCfn/bJrB1QPH5tPsCQl9hNDYyHjvbVdmgA+BgWs/0h
	Z2JBGO4pZm3Rwel2zuAaeDOVwvm/zHWqK8WLod1Fqy3TdxcPpTgaFwqK3bWMifVabY/HErTc0Ft
	/WPj5GhbglGcaE6rmVJk6OyqXjZb+woAatESj9JcrPl59kAD0MJT17dsLIunfZKGyTYEuWy/lgN
	Y/Yd6wP9d0ecf7FjC2zBLeplJI8LYOqRLPA9QTR49SinSqLoKhArKvcLQKG0xDLepNI63I1NNFY
	jiNj/DWeJNrsE/bdPKuWalug7B+SyBbVDQ25ElMjBimuwSFvHXEw=
X-Received: by 2002:a17:90b:1348:b0:341:c964:126c with SMTP id 98e67ed59e1d1-3589380276emr130935a91.34.1771438374187;
        Wed, 18 Feb 2026 10:12:54 -0800 (PST)
X-Received: by 2002:a17:90b:1348:b0:341:c964:126c with SMTP id 98e67ed59e1d1-3589380276emr130915a91.34.1771438373715;
        Wed, 18 Feb 2026 10:12:53 -0800 (PST)
Received: from [192.168.29.32] ([49.43.224.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35887899158sm1783264a91.5.2026.02.18.10.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:12:53 -0800 (PST)
Message-ID: <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:42:28 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
 <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wrzG889YjgxodFEhUFrxCtWwLi_kIRpl
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=69960127 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=8ET0PZbB28S/dExBzKx22g==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=BC0RzjFpySZ26J9PUKwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1NSBTYWx0ZWRfXz+yrgAcDh10N
 iUNn2zPJIapU4CUp/ulm2kfUhbZYjZ0sQ/jwI4Rf/zzFhVCnYFuqDYQQY1WX9D+27VsxCcUBRhB
 wuppkwBCG/JW7aGeQqW69dYMOCSQ26vRRHLFBImw7nMOUDTSBdMH3+R+Z5pfzJJMP/8lOPhpki9
 PkhpDQKnJtMFe/dTCT+gNy0IlaBVlidHGISATj3U1PqwHiqnfSq8qNW9gAY9LRLHwIffM1fGZaM
 lmJESZ7MvCvChW1cmQDV1DXLJgsjSKHWzEi87tjJ0DW9W1sQsaq0K9hgz4R1JHfCUphgfXY0rm2
 NrwOhN7m7qfyLkFJqtOzicI3roB7N0HoP+NLLFZZyoVH795+3SDPBIokZ5JD+F9gTmO2DmiJSch
 niZv4IKdXjiEB0Dh9jvpaYWkMlbs7ctpO1dgqpZD4GrKm5HunzpASsJVO/W41s+s+wry4dS+tug
 HyIxv5c2HZYG26X0jFg==
X-Proofpoint-ORIG-GUID: wrzG889YjgxodFEhUFrxCtWwLi_kIRpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180155



On 17-02-2026 05:31 pm, Konrad Dybcio wrote:
> On 2/17/26 12:56 PM, Imran Shaik wrote:
>>
>>
>> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>> SM6350 SoC.
>>>>
>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>> far as I can tell.
>>>>
>>>> Though when stopping the camera stream, the following clock warning
>>>> appears in dmesg. But it does not interfere with any functionality,
>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>> while the clock is on, and 'off' while it's off.
>>>>
>>>> Any suggestion how to fix this, is appreciated.
>>>>
>>>> [ 5738.590980] ------------[ cut here ]------------
>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>
>>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>>> and keep checking the hw state)
>>>
>>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>>
>>
>> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
>>
>> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.
> 
> This is very useful, thanks for the insight!
> 
> Is any of these solutions specifically preferred from your side?
> 
> Konrad

 From clock controllers side we can use the BRANCH_HALT_SKIP as this 
covers both enable/disable scenarios. But this needs to be checked 
further from consumer driver side as well to handle the NoC voting 
properly.

Thanks,
Imran

