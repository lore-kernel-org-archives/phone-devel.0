Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BA3876B1
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295579; cv=none; b=SDV0opSnqhkmm7IN1vHmjMBtvFug+Xl5j7puwDr9oV1ViLuPNSPuI+TzPuwiElb83nfP7+AJlAu8VaHTDh34Hm4Muah61dgtXqxJ7or1S73yn8H9k9Epizjwk7oH8XdfXZD0lKvkv+k9KvEVXfh3nDQpv8rj5PICvfghM/sbkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295579; c=relaxed/simple;
	bh=XLg2artmRxKzfruLZRniUIT3eL89J1+Ni47kyXPCLHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPw6+gp93rJBhkaGmA5OwMw88gcIwV/Y9nnNX0B8ftx2eCCIgG6GJ3v9psLLtwsAZOp9ITS4P4I0DmbNrDzjCYhEH8EktR6cT+4UQwsMa1vCm/TD8S8p0EYACAmzmyrqVnPUazjIgprfuj50xajikyRQLLi073U91BILOKa2LQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtxNIqI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPkZfZ++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtxNIqI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPkZfZ++"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5Snbo3868705
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLg2artmRxKzfruLZRniUIT3eL89J1+Ni47kyXPCLHY=; b=UtxNIqI6nGc7lhY+
	MWubZNCf1oJulDhsgMghAj/J00ci5U4O0BhBe2untf2c1yDxGW1S+oDlR6PzhZnO
	U/DOsSUxnGB8M2lSvXUHeBzPAcRbgUx8WNGi1i+q+5UYXBbSkTRBX5wovsYSNpDK
	k13KX51rVo7WSGZl9mT5jbxAvjDYMW7hYcfcocDF9b45oahBX0xr/4+zT1TVVUTF
	NEvbH6cgDJuECWA0wz0PFokX8hDc5GLJkmx/RnqFh+SksJt69/dzrTU+T58eiFnP
	xpbgDl+kGp/DZCBgMR9mbo3vr+LfyjJ0UAGF9tKrDPn+epUQ0HSwraECK5OP0i4i
	LdoTWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8m8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 09:12:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso19401781cf.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295571; x=1768900371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLg2artmRxKzfruLZRniUIT3eL89J1+Ni47kyXPCLHY=;
        b=YPkZfZ++nOaTqbmZ5a7dO+1IO9D5N65CaZJ8z/rog4o0jCOh44pjHE+HLsoJJyew2Z
         Fe3B6nVSBfm7TezYsDFK4axd6IZSzv5tew2krEu/h6OQI2TLGCtr0j630HCdQgkZ9xfB
         sYuz7oOdaaDrCLAkDPX2MjNQLM3r79iCR7ebNcPxDO/EWjSBLsm99VoZ1jsxpdr97t8e
         RQ25TKQpsxnV3bTnYjQhbaIJ37hMlkHo6fVlWcJPh50VHhNqV2Q+eDHF0I5vi3a1qGNI
         nguxodZI67CJGJ3Xr3qfxnu3k+OTX8miKLMqD4B7REXeFzlt9cdYEslwLhHiu5tI8BHh
         wufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295571; x=1768900371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLg2artmRxKzfruLZRniUIT3eL89J1+Ni47kyXPCLHY=;
        b=Tb5UeOL0+cZcX4DFXc0+3GcTUMmeaO01t5rpRocvcjbZlJFJwTccpoGwJqsKwYvdNQ
         hq8lXW5J7hVjR8gWqPOBpMxn3YmJJXOFkuEmJg8Sq+gS65Uwy/IW/VrjNfSet39mEtAJ
         5Ay+4hIHKn88MDP2jFoapd4AruFo1TtEd/k3EghWvpUU39o1DAuM1yEt4hpfK8E9eesr
         DlXQBuxlQU98lTBJWVLF+Pxv/EIKIVqshIyiVoVqbZN6g7WfSsRrXFNgLfJ80OY0G6gQ
         X/BwkAItGS8w+dUmz8n+STX4jZ6IXZ06nEICoqB50rHy/xF2Zn+LPUQIEi6xv40nmY9h
         +zfw==
X-Forwarded-Encrypted: i=1; AJvYcCUrGZ51rFTBu0TQD0vJ+EKx7FmRk/Ounk/TJJLFUCzaIG/PU+iwdaQltE3iHospDRBQ1aiENxk9EOMVxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5X++moHVGAHrw/s9DTSrF8h7dZpYEpw472TmatNwPbRnsWjxw
	TxyAeHkciMeemBvUbGE7iQRVMNEnM2NyGunOEtY9M0McElUlc4eH+lKty8tv6HcqCSQujc+fOTc
	ksixJt19AHChzeUcLB+KGVnKclEYuakFsFUffwpsw/qlkRvoJGGq5X9/5XxKDuUu45Q==
X-Gm-Gg: AY/fxX4iUZZHmv1DSjx8QmOhWE4ZMZBN2tqNIPhwO4rx7k95RfLmbM0GTFZOsW41aky
	1cjmYAyQd52NRMB9tp3BBzw6H4lVG7xCwX8RjvAN/+MscAWU+oVbD/10RKcFMnnwXux69RartoG
	S+ndGCTzqEFaHz2kh2IqeL52fkjuwPEGRQnkUCQme4KrF7NbKV0KihnJUUo+cuVybdzJRfcH1fA
	hi2vptaJzOORlEMxuzxXywU1zOLoqJJmlbWz1olZy7w4KJpysIj8uV/QPaitIST5EWHJZiIhGGX
	ePgwzhU5Nrc09spvU1y+U3haK4DgNcMPoublwnKwv5ZC+t82L+H5aIJcHnlHGccwMSMa1lLxn7P
	LeXQIAgrL45GkUQR5Hoc1W0cYHNhsi16TShNH0IvbDo7pUYL3uYcDuEG9sogHsd/jGTM=
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr220042751cf.4.1768295571489;
        Tue, 13 Jan 2026 01:12:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2vHMSwPpCR40OfVYAeW9cJ77PxqDGKW0Qf9Yk3bJp7ouKnyOO45TaZOSf9Fsk5W83HEg+MA==
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr220042571cf.4.1768295570988;
        Tue, 13 Jan 2026 01:12:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4484sm19810076a12.7.2026.01.13.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:12:50 -0800 (PST)
Message-ID: <9662c03b-a012-4b3c-8061-62f71a3f44a6@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:12:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved
 gpio ranges
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
 <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
 <dd4ad11c57d00e9d9f532f40f408b637@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd4ad11c57d00e9d9f532f40f408b637@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: THw2dUh0rgL0dAWPevrVd9_wtgsQfqvo
X-Proofpoint-GUID: THw2dUh0rgL0dAWPevrVd9_wtgsQfqvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NiBTYWx0ZWRfX5BSSLId+kKwd
 E9wROeXRVJfuJGYs3MczFX92xWrFsOJa4ySgVUv5h2qN4R/NmLew7rNUMQxXWA7cAhxnhO9osey
 HVJuUmcwlbtRnq67QFklALl3Pa4XqNIWkycgVMBsKs3tu7KCivl6ue8cNv061UBYZHXwRjzAF+j
 1/qrc/8J/r0W5NPjYKVfVJu2TWJYLI5X4yQgJBcy8ZZQ7k/AJmcld3oRjxjByeXsw5ic1LvvuRk
 EXost8KlPmDQoKYuIl8HcFiQVlJcQeqvnaJkcXINfdUv2cJKDnqcHomeazk/WTvXbwzXfvT6ZDi
 qRuiWVMxyWnX6KOW4CCnICv5Px5SHys2kR38r55nu2FTKEO4RVNL8TB4RzpXL4FbTvxgDq9qbW7
 u+MdC0KExpFVjUQNr+JCsm180iIHthYM0pdheFXvouQWiBGLiBx/IdPU63Dsl6duVghBH31nOhs
 QWp0amm7ee4uYdea1Uw==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660c94 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Uyhorv2uAAAA:20 a=OuZLqq7tAAAA:8
 a=q3nTVkCIN9tcAIVWmhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130076

On 1/13/26 10:08 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 10:01, Konrad Dybcio wrote:
>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>> The device was crashing on boot because the reserved gpio ranges
>>> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
>>>
>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> That's odd.. were you able to confirm that these values are alright for
>> both the Note 8 and the 8T?
> Yes, it was tested on both devices. The original devicetree was never boot.

Fun..

>>
>>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> index 666daf4a9fdd..163ecdc7fd6c 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> @@ -296,7 +296,7 @@ &sdhc_2 {
>>>  };
>>>
>>>  &tlmm {
>>> -    gpio-reserved-ranges = <22 2>, <28 6>;
>>> +    gpio-reserved-ranges = <0 4>, <30 4>;
>>
>> Any chance you know/could deduce what they're connected to and describe
>> it, like in x1-crd.dtsi?
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L605
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L610

GPIO0-3 sounds like QUP0 and GPIO30-33 sounds like QUP6

My guess would be one goes to a fingerprint scanner and one goes to
NFC eSE (or N/C for the device without NFC)

Could you scan the downstream devicetree for signals of that?

Konrad
