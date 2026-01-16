Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9D224AEF
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557154; cv=none; b=ZexmNlaUyEKOYTc2dMhvjo5mrVgk0EEF4M0E6m7qpLKd76Ne7DR0+U99uYhO+IlDOcPBydzwFdbdQVSq4c7fadBu7BOjWB6jQzlUEJ3SqdCUvQCoKBHSga1xOb7gBKW3VB6qi0lLhMyyUFNMfzLE60XmykzPGuh4m43xHXV0/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557154; c=relaxed/simple;
	bh=XFZavRyoo/GcZ+nYMEPWIrtkLwaggwm55zfwFeWAdxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYC3pIh35LSsjlPS6pewWgYLG8HfapJJEJteH972bTIsO8cBqSPPB1xknuOaWam1BMZqhpuVv7J8ualRFksNFAEpMp1P5tv/NBlkS0AkTGLkymg9T+wUqTX5tMa5KoyDC5s7epkqCV57I9CI9zaExSEyXuSLfP18eCOJbes1JTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAfuvwPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4wF9Rjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAfuvwPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4wF9Rjz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G86JF63192448
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=; b=AAfuvwPEJzTXI5rK
	PIzCyupyzO95egByORyS9dAprXtfsii2X+Up6a1+GRWvQIa9HAKuokSFsF3dYWLi
	5NvJUUwoEGGQbbaDY0iq/4QTeb4l+SzRc9J/wRRdQ9gR2zoahLPRgfF9FDWX/sDm
	seFDcOOZyo7D3m/kIWqgzJYHjrsNlNL+hKGKMVBqYoLOmLs1jDA+sJRLDjBJn+VM
	YpT2lwSLzcGXwlbzUVxUehyNThX3TGMKrmIC56N94P7xPwy37hjGYK1dcjgJa6x0
	8iy5QrX8kePbdiJtIHRJFIAyjXysNnMa2x+E6EhEoTP4IRgtRcJiacj6fys/6PKq
	EEsdsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968hpq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 09:52:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890587202c0so4115886d6.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 01:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557151; x=1769161951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=;
        b=H4wF9Rjz7fBxh5rGoT2hcTHsjd32DuK4aXUm7Yrp+uDiACKI4JU1rZO80ayyMoBneZ
         hAq9y2yPojVNIeknBEjkmFSK7bv6WH4dt/U53rqeofnVhY8CAp3qIZov1h/6BT7XOCU5
         SYjLMqqxlmGWFdT7fPri3HGko7orZjkLzmjM+u47HYbuT6jbsFyjzRldxdQ9R29Z4Z18
         uLaItDxX15aNInWlXrE6P6mVzQCHtRv6gJoLIVJhi6i0d/a/DjTZbl1Kblipyytetrsf
         jw6s0ZzBc+9IuOsct4VlvTSuaX15KFx9Kj0YhINXbgKzUH85FDtQLGP0gmE28mAFegzm
         9omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557151; x=1769161951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgzvyyUoS1nt6OXKkWlbx24PxE7R3inU1X13PpTUzkw=;
        b=EXxhPwbjXX6qovaP3vZDR4naF7vnSeICMnXKIukuT9HezSYJXMfmcPfZbeIc/pWbCM
         l7AM7neiW5HryZugbc9eo1JHvfobZfYtY0jn5+ItK0MMIrIZis9aMQQ6Ansge7Xat9pz
         sAQbbHTyxLzcxOptnz8K2uXdAdyvlXXU9qDOebYww10BUUNpzkkWPoodzuC1YGq/Ld4q
         xWqAeDAihy7euEsem5BHsU6X62SLJxMXETFpLEvM8k57cyXvCH6cXFspxoqsOviqowKE
         bSJBCPnOo7ZK0seCxOM9zI39lPr7cH1RaeQnDG/slmWK8M9rj/++4J3jH/cYI+TTkLPb
         tQqw==
X-Forwarded-Encrypted: i=1; AJvYcCXbHA2gC+vlR/l7+9e1wlL4uewmYbD1NtL45tXs5XGLFnWklhn+Z+VuKo4kN3cKjPxVwJyOc4XxKiVFvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Ft+z4gm2RQKm5t0kLf4i9IK/sPz3jlGwdQlQzgEjlJq/DzIY
	SoMJCbtmNrP8ID3k8eRMDGsaMd+EuD4YBgO1YcQnF+tCGF+LU7jmM95lxAvNcEmEWSeFdE21dNA
	J1hB/cR4HgB3AdWza7vdJ+hOvOqpgcFcQv+NWph4JyagiXAj2Xf2FZVBXnGPLsCy+sQ==
X-Gm-Gg: AY/fxX6WbgEnzJcd2DFvFMnJtNrAxDTJ/AZ6h51i88gelzgZ6aq5pKOreMvMuhGfZqg
	FAQpATnmD6aoxMoJMf/nmnjK7Smf7MsCyV60kcWlSVqDKJ8tzAtGIpmP3BTI5He9+FqMv8nQ5/Z
	GluPFitiAH2SD4j2R73GKNlYa+vq/U+PevRKjl3pyFVmU6jfQi1AJrulWGEstqcvNZP78xLSlhA
	pTXhCjLUCJJLH4qB12TkUgfLcZAhS2ISIj5Xzb2+joXit3185IptDmQwDrnzwi87u4OqNs0F+ls
	FeHzor85C2f1RikCNWCaPZ7Js70dexStJq+7/hxSNyEwoh80q9+CiasPh5N6ulU1JVo6F60WwyO
	wkRHgrmU/M1FPUuCwDqXkLN4VHLj2C0U3Bw70vgAKGJjA0spAhdUe/HVz+BeyfuhCnVQ=
X-Received: by 2002:ac8:5e47:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-502a1633ca4mr24349851cf.6.1768557151470;
        Fri, 16 Jan 2026 01:52:31 -0800 (PST)
X-Received: by 2002:ac8:5e47:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-502a1633ca4mr24349641cf.6.1768557151060;
        Fri, 16 Jan 2026 01:52:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm188219166b.60.2026.01.16.01.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:52:30 -0800 (PST)
Message-ID: <e0f33ac2-331f-4ab4-a960-6bd8bcac7306@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:52:27 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: David Heidelberg <david@ixit.cz>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <723357fc-a785-45d6-8d49-4c00dd4f340c@ixit.cz>
 <ff4d697c-2007-4b2a-b66b-dc86053a20a6@oss.qualcomm.com>
 <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0da3c96e-4f20-4bd0-836e-73d20581954f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696a0a60 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=4BfmCM-U_7t85Gwu0wQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: ck1_8ytf3ei4-4lBZPpm9XETL2qxPNEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX+hpW49DxcjYD
 mTDtUeP+CU8XuOA359aa5DFF5aEuyH9WNoXkKUAt+QMMANeLZPLKbDOC49AG5zwy1+dPqW+gMaE
 GX6dsw5tCeJxFTE9Ul9py3s/zq0cv4cv8IWcwn2vab7+S3iDi0Rm6BLY/r2KxNDXurj8bgrsclk
 nouFSApHte2E65WWz7QQkXfddZJdCJG4yRqUJmLtFBxFO7LpXjSu+YEygsuLtJDsE+emDz0lwml
 0u8PCI5FXqsSOcwuQPA5F3K0XP0HaO9fgpzRadPoZxVrc3Ro4DRjt9e11UUQk47ehPS/iS9YhGi
 NkQUSR3wzMIeim6ho8N/VyFMRKeI5gRwEd8ghhpQ+eXi2SfV/l4KbDeWiIoLUYi0l8BIIZhV8Kz
 ZlAFqwD9qpiLWQlGeAdf4T9oxLiz+DeHvzYkND3gSl3bEgIJoaEYSbN+7mpVPzeqac9iz80ObvK
 ItkZSVzy/FwenravwJw==
X-Proofpoint-GUID: ck1_8ytf3ei4-4lBZPpm9XETL2qxPNEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073

On 1/14/26 10:55 PM, David Heidelberg wrote:
> On 14/01/2026 11:28, Konrad Dybcio wrote:
>> On 1/14/26 11:15 AM, David Heidelberg wrote:
>>> On 12/01/2026 21:13, BarnabÃ¡s CzÃ©mÃ¡n wrote:
>>>> The device was crashing on high memory load because the reserved memory
>>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>>> Change the ramoops memory range to match with the values from the recovery
>>>> to be able to get the results from the device.
>>>>
>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>
>> [...]
>>
>>> Hello!
>>>
>>> I suggest one more nice to have improvement:
>>>
>>> you could label framebuffer cont_splash_mem since you already touching the node and testing the series.
>>>
>>> Then in additional commit, you can replace manually defined `reg` in chosen > framebuffer node with
>>>
>>> memory-region = <&cont_splash_mem>;
>>>
>>> For example you can look at sdm845-oneplus-common.dtsi
>>>
>>> Tell me what u think
>>
>> If you wanna do that, please call it framebuffer_mem, "cont_splash" is a
>> Qualcomm-specific name for (roughly) flicker-free bootup
> 
> I have feeling someone recommended me to stick with cont_splash_mem.
> 
> I think, since we'll be doing the mdss reset anyway in sdm845 (which I used as an example), I can do the rename in our sdm845 too then without any harm? (no it's not flicker-free takeover :D )

It's not flicker-free because the OS must cooperate in that process,
whereas we currently reset and re-initialize the entire display subsystem

Konrad
