Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E343DA44
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009487; cv=none; b=uLfJe6M2PZFZFxcV7PR1AXRPMcWcSa77ygHmVXoI9xybdgApuCPxE71OEy1eHCC+QfClGvbqp/iDWc6K57BvRFDKc7V/6Eeukxx/XUjP9HSfEPE65Sh6xgVN6WPdAdGd7hPH0mlKADXbuRczkS+ARniKVrjyQxJLZrR+cT7jAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009487; c=relaxed/simple;
	bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK45cBAvkblYBDDLdSk/eATnk8h8t+aifhH/OK0mfaHYRX4ASMiLJCQfXTbadGBoWp3dPah+QTFs8jVvjVs+2LPZzsriqV83nSKH2Kdc/f87GPLdjv97ChbgIYdRhRIUXwvUP59Zo1x4rw/2aip4xc8dle+FqYXrmXEV7NDd1eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4U2sjQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2HcvOWZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4U2sjQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2HcvOWZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LD05xw3217934
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 15:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=; b=P4U2sjQQcdRJ3zjO
	mCaMrL0+DW/1ael+/16AELa0KpX3EPSOh/lUK2074ig18a1gIFj3pcs1VKvaS+fk
	KMdmTn4HBrmY3U+XQbkMOLTAFQeyJEx/zaAcb7AzOrb8OyA4+uggiMlJPT3rCCmc
	xnpKfgAC1GiO/U2qEO7cG6z1URsAMRKT3+UcwuI8EUvcIFYuJmfCDfZzohe68GEK
	3hMKrYYaSMB7wMDAufPfIA8kiji+4VvVdVwPeAMBnkf7Bq0KzpJrVsGz0es1HSrb
	FSNUAOPDN3C40fqwO8pcFVuVec/kiqw2e91xBtjn6ertO09waJn5mMRIlAEx+AeQ
	Sh1r+Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btya28gf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 15:31:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948008edc9dso568194241.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769009483; x=1769614283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
        b=Z2HcvOWZxlq0bqbF0GIaiTXrkZFle5ccsXM6HcdawV+e0JfbFU3ZfPeack8RMrYaDW
         Aaw1/FJV5NvDwetkwbdXyyISQH/eexZ8ROQT1NJAKx+WlrwupwsNgfih36vqOypBSD4Y
         afKNVD09FhVqUOQrBZwpzaIjS2sxzPnA0kpVwfnY679l1sU1t/jbKFDRk65rUakJU6Gn
         dWt5LaNeo9GT5R4h/fxIGwccb+wiM/mCtEMKd0HBRrbtbndRFRolKLwClTAF+LYsOWPv
         7YBJnRD1jsoYUADUMhLGpMj6wcyldRuttE6KanX3e3WpsCyYWqrt+cQuu9+3mZZFZVL6
         fspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009483; x=1769614283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
        b=lsGNTWzS3hrewaT8Q3Z5kMIVJglwisUDT4HwpZ5oDZLy/ePBQzmDoQD4ikRu/+wyXN
         pnw1CTGl2xX8NzJdGhJj/YnoNejerwG8wXqfdlpl8z6hm5YAM3ILlqJSP6HN4E7DQeom
         ZCV7rwZ8VQLJpt6IXicr/aZM7aKuozOL3jBiTjx3DDCHhy5qv4nz4nQt7E0+NL6ykpVR
         vph/TjwFApmzahoHKWQqg86g5XyUzzI298hK98s/G8QloD6VHcwNRgKc05YJqouNUAfK
         7zNIc4gG/TEKm7jSj5RQgnwOTwupbzzJxuCPTn866Qor9YyKETbMeMUFiV/TprHzp4yw
         4ERg==
X-Forwarded-Encrypted: i=1; AJvYcCWhKMH6TkLX5Hnc4MzLR3078IqXYo8g+DlPKjcRmi3xK00n2WuiYKsUvui6nUnWpi0TSV4qL4og+Zaj1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6E9f6rPDfDU+cRPePXbOsXnsNUxqte4LvMZEjuGDLmrt15fA9
	x8ZgffiEXaSDG6AKRAGqMfW5SbMl0ZLg0HFiV6261Z4GmG+GWD7sRixs7Qis2M5gBY6RTsuqSgD
	o7weQsKbYjfrq5DjX8x9mZKmCeLYC75SiBEEDKkmkrXQEyWidpgEAkEGErRrsO4pNo7mRZhStbw
	==
X-Gm-Gg: AZuq6aJ94a+lYU8O/5yd8tZdzQIWeBOU6f3R79ANjruYcKueRRCUbpcwfQGZLgLGDe/
	6fSBELJxRq0eEPQgdfVPMVDIoz5M74CzPdaUGfAYq2puxHMUuPRUHOHVoJl3ctW4ACZwJFcqnDW
	hh8iVpeD7Nc3biAjiNrfSzZ3aD/t69hB7y5hh2xR6ey/uzrRqWmv2A7PhQkRsu/C/bVQ6KuwW3v
	PPZq9LeBJQP11EpECnUorZkRNBUF13w5gf+v+/VU5dbU3ThZWeWMT+3Cufb7/Zt/kpmSPFT5x9Q
	ycQj062VVFq6N7qld5xRXqf2kfbV6G0Hfd8ZKeNGutzOFx2zkVOmOmuNXXoQUfxnkEZHS8X1m7N
	qWPwxV9J6ghp+RRSPTith3ML13wPmZMESVshWyLOfl6SOzZWETrMIxaUReI4IUeSAhVM=
X-Received: by 2002:a05:6102:370e:b0:5e4:9555:8984 with SMTP id ada2fe7eead31-5f1a556805bmr3562930137.6.1769009483225;
        Wed, 21 Jan 2026 07:31:23 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:5e4:9555:8984 with SMTP id ada2fe7eead31-5f1a556805bmr3562900137.6.1769009482784;
        Wed, 21 Jan 2026 07:31:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580eabee8dsm2085168a12.30.2026.01.21.07.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 07:31:21 -0800 (PST)
Message-ID: <a51b1fab-c630-48b8-8b58-2a906ee31424@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 16:31:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
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
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
 <20260116-xiaomi-willow-v2-2-4694feb70cdb@mainlining.org>
 <01d254f7-8c62-4061-ba7e-f358f1904ba5@oss.qualcomm.com>
 <90a74369a2c4d9453de733a46fdd0ef1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90a74369a2c4d9453de733a46fdd0ef1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=epbSD4pX c=1 sm=1 tr=0 ts=6970f14c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=tG82vpoCcTU8gc5Gbs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 3oBhpffNaS5aStgrm0h9YwQdLEhxD3q9
X-Proofpoint-ORIG-GUID: 3oBhpffNaS5aStgrm0h9YwQdLEhxD3q9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzMSBTYWx0ZWRfX/rrE+JqxUdtK
 SEMf1rJHH10JCW77thMIGsRcyXYVxaDJkooLb+ciHJcM2PVdW26guMnU3aMEKM2Y5PVNGCFUarh
 NLc+N3tyja3bXSu4mO/Ox3kmgDjLMDhBwHbfy0YUBfqfJ+ylpLNAZJRkH09ItPwGNIwPduph9Jq
 Ym4FWgf1QCX38mYi4zspySUgzvTe2KMfwilwIBQX5nN8pzc9Su/gWfxsyGgjIGR+8d1s9Wo4EeH
 02zQpgZH8ltIMYiq2p022TVk2lG2CPychPORiWAy2j7tSwcXYQUifvk8z6dAh+UDZapv5M3xWmd
 6xpEvMGpT39uz+DVSAdIsg/puas038Klr+tIeLAPomWIn7SDyM4QzqnlQ1ZV8LdLCzioRjdn0Zs
 2ccVziQI2rdMmsQyTLPrlThZbUfly3FNAmoxdWtXTJ7ga7Xjt/mS4doV2KF43mR7vfbtImzDCKR
 x7EmuAZY/I65aORqDHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210131

On 1/21/26 3:21 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-21 13:45, Konrad Dybcio wrote:
>> On 1/16/26 4:54 PM, Barnabás Czémán wrote:
>>> The device was crashing on high memory load because the reserved memory
>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>> Change the ramoops memory range to match with the values from the recovery
>>> to be able to get the results from the device.
>>>
>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> Have you verified this new and improved(tm) map e.g. by booting up
>> the kernel with memtest=1 in cmdline?
> I have verified with cat /dev/zero | tail | sleep 5
> I can test with memtest=1 also

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

