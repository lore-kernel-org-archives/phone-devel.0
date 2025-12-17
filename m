Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A05314D36
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971833; cv=none; b=t0xs5q8HHwRoLKsk281cku8Bs8ZxI9e1SumUwx1rOzDQuGNf218Lhc77ZlatkEDjCWqG8a2RQLJtHJiYkHfe8w/hJdO0eV2C9apbv9rMM7a4s1N5YAiYGj3ZPTvF6oC1VBLBBclpESt0tMYPMyqUf5KAlIMMYEsyj4XkhQXI01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971833; c=relaxed/simple;
	bh=AOLk/fdBiFe7VPddTQoahAL+GlZhzF/mifTE/7Ua7fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnLL8UFwFMlBxDvBEwIUxNcryTlDu3k0smahb2vtDzh3Gt/ler7jgS2cyE5aOsait2D/lJcDlYyIJdsbNF+NhDU3YSvhUC3Sh7ooBasgnMZVSHzQNK/w8NsaAXl2LmCgGoLbKtcMdyPEf+dlehzFc5NxgEsf/q84IWlbxccWZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdhf1FWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0fVkXwd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdhf1FWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0fVkXwd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAgQwp1903883
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=; b=Vdhf1FWP88mUbqhF
	2X9T/LZgXIcTZrNqQAkOQgRgVNCMyTyyvPUG8dCmdFui3rrh890TGEOBSlLUQp1e
	TW2gLy3R0xEpLtZQlBZ0QCxPmrYreFWT5f1gk+p2cu4mFwK419AWEt5TI/r/D/2Q
	EaDFLpgIyk6JgIs5IcpBbq4aMEaq4qb6qgVgJP5G3w4ZsovZUsqzxfk4DYfYFpk9
	hmFSIv5FgUMEZySIYfCiSiNUk2zUJxySfiSKMQgzSDQgE7boQs2RrvtZXINo+W1A
	ME0sNCAHizLfz1BeiMA/C7FJ7vm/R0f29B85rrJdlStZ3svwzMetIYHiQJlmJhsx
	NTbVIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331dvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 11:43:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8887c61412bso19799346d6.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765971831; x=1766576631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=;
        b=I0fVkXwdYwp+lgctL0pG6JgL8rEIGIO+YmEG+3zaMiar3gvxCBVm/y4uMDQRUG2olH
         e/SYWCPJBg339JtgbXXFqndXT2osa06njU2u+lxSjAakRYOZbVRksUhwdhqKryvV+ny7
         0PNEhVrn1mQ7cZPrPr5M1JgN0NZELfZFMNUiW30ZIb05UISl5NFydeZdZUqdbNIjwq+j
         8dFaBcRJwUQMIW2+FiYu4o2F7Qi5EkJqz4EpEzRQLpgGQM9m/OxSKFBzAgmkIAUvRym3
         X0jSo9Qs8qTkQsmQj2//7OswwICmwaLHHQ3yazyiN/eYrrk0+wH3u9I0tQ9OgmOIVIL9
         RJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971831; x=1766576631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=;
        b=DyKg2QH5xw8yzDRZOvHxKkqzPo5g5gxlXAXFu8ss4TsJMxZosA4uuLiGtX9WcWaNCn
         /CYIfwy3Ebzdh71wtnBIZbxglidWhdXqx3dPP8aLnHFkzUWmPi7ewLMYIMjwTsnzVc5c
         wmOppiY3OOrdHlY3Mqp4bkB2EOJN3+1P//0UVQ8Jy/SDQYBxhrbbB8N7gSZ7fyTPJAhd
         n5OfxUZ1/nWzTM3BtVioBcbNG9KqOGTVtrg0GGM5MLKeP8pobYGO7CM+7zZjIuS0KRau
         9LA7Z9EfV+aAL8Fh0S/LKYspUC45Z1Nt92Sa9PA0THyDEud56tXWzPrTbUPhZx/p/AZ3
         PqCA==
X-Forwarded-Encrypted: i=1; AJvYcCXXqZR5gpSDTcQFghP1caKZnk/V+3FY9+LGllhZfZLOsxMBmgq28oYYfJCuo2qwvmYU0Xf/hivQ0R5RGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrP9VpjvP3ekL4+8jinZ9/NleFmksfeFtiRb+OiNmwyCW4SkT
	oB/oA0GzBUFdS10MX/bRq222J1pwCmFKmymHl+YkG+OTbmgqcnXxchJiarpgmsMbcJHMJgVPloA
	rQGF3jMY0vJonY9mfA3QsDymS9nhsaxxi/z/a9XkBZ/9E2X8VwQ7ETYt40H1H3hJ7qA==
X-Gm-Gg: AY/fxX7tYWVJtwDnk86d6W6B3+WY/Y2suJDsv/Tp0UONFvcD0GF46KqAejDgS+JcDTx
	h340VK0dgtkk7y8vVPGhB46A6Z/CQGfOCSQLTTAB9xelAR+f/uCYyRFo7xaZL4hM9N4HDzC10Kv
	QeT8G3DOWyYjJLUQxJMxE0/OA9vhWNDtByW0WNmA12CgcjSEAhi1Vn0/xFgDC3IclGawozubQtE
	ZCrnO1H7PPhCOjicQWDZPDWch4TaGtO0vJVzHKXWI8P37fXP2oQQXNsCEBIwr0TfkJ8VAGKWvBV
	PzS1iqKCKph1l/n+XLQRONmVPnAKiaMFAz003nMbuU50P7gfo8lALPOQcUcMkoRHKbYhhLvxoGB
	UaSare9q0Nd2OIO709OWAadbZmEgtWwR88ISfHSLhtbQNGRC4ETWjftn83BCQvEjWNw==
X-Received: by 2002:ac8:73d9:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f1d0672490mr128131641cf.9.1765971830716;
        Wed, 17 Dec 2025 03:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAgKwfKGGZDctaZIOos+XWywvYp44BmYdAOut+z3apzNeFOakzV6Yya5sv5OGB2G0AmUYl3g==
X-Received: by 2002:ac8:73d9:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f1d0672490mr128131511cf.9.1765971830268;
        Wed, 17 Dec 2025 03:43:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e817csm1939729866b.19.2025.12.17.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:43:49 -0800 (PST)
Message-ID: <c3e6664e-5de3-4423-9953-fd0a5cbc45e8@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:43:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845: Introduce camera master
 clock pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
 <20251217-sdm845-mclk-v2-1-7028c2d09145@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217-sdm845-mclk-v2-1-7028c2d09145@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MiBTYWx0ZWRfX+fpKzzyetwIs
 9CPm09Lxxpi4m6VYtgeWyOCsNdsE18XlxrST5B5+f/FVynbSCZlJxurryuYhLGpYa2tBBzSQtnZ
 kXs3LkyIk1hYH8yN9QM/v8gLftWvIHqzeqagf701bk3NQka1RapArb73cCT9ljnL66BxLEQwfO1
 SqhOTL/NlvKVfyg1nKF4KxyMYQftaV8sAz1qlddzVjQfI+kiqvy39jGME8fyGv2eCE7xJL/sf8M
 LxyxFlavDN9wIsutsYgb3Y7+QtFJgWXpvZmOEr4OodicMcPZOOX4YAkDrdxEfnWLWW6Nf3mnc+A
 hB906wckXgnMlyFQPG5TBqFA+r/IOtxyeq6y7MNVw4uRPxGMWR74amwco18dqxPQtZk0NSUJo8P
 TjeXHcMmtTnMoOC/kSWod1VsuTT/sw==
X-Proofpoint-GUID: w4Qla2ftfkoJd75YEdsDZG2zS05G80tu
X-Proofpoint-ORIG-GUID: w4Qla2ftfkoJd75YEdsDZG2zS05G80tu
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69429777 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Xu5O6cxXq1gntZcgiy0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170092

On 12/17/25 12:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Put clock pins configuration for camera master clock into the dtsi.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
