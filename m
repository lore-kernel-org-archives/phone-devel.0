Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35E3803ED
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294354; cv=none; b=B6Ol2AHjRS0lXRVkNdly1mXkEfZuICGvc4pBe2KIv8WjvYinbyKp950kpQdbXSgTCRi7DlCqQhHmFRIfVmwGjEhzdg/wDdS6S/wbxcyPKdN3qB0xihEkX3qrvANxbCxv3yYbNR4L/4FmbFHRDLcARiZR4ZrYCAy9xPc9U1nAeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294354; c=relaxed/simple;
	bh=MYVpvlzSOVjOCvsPeYESexAjv7dAT3KEzdLpa0xc2IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1e9dVua29kbnvdE0Wm5cOTnUdC+yFM3wQ4jIXLYd7pAESKWe7TcCcrHRGlKYiAtAXiBQF0WcBrdp1xzBVSc8umlL7NQH6ZLsiEP32Gd6xmqsD2HVrrvq/kf0r4pX9HiKIL+biar3AVOQAzHaI0PICgUsWeAXQhTAG1irA6t1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGbyjE/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc5YUaMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGbyjE/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc5YUaMR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nRkf3735049
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=; b=jGbyjE/nyE4cMI+G
	8+ZcKc3q19HIGMt7pNWhzN8Z1wILioluZDk4+YrzgFlf6byeJ/iz5OTfDB+frLmZ
	SE7fh4JC3Iw7wSXpIPahyy+5V9wzkKi39CWTPQMLZ9BalLDGt9w3qPdmN9MzmN3K
	70bp/cI5Q3Pm5hmQx/3ZPzC3JIYFbpcHLRy4il6ae0owMWNcjkD4ZoyEeHUS4SEN
	485FBV0jeGMQ9uaVcyxQiWGKRRMrnBEtnhSGVAiDevehBHPo4l/94rhPMT1pdqUG
	V4xuYBqqTeqU8hdT4YluvXJviJaiD/ns7gmJIARPdOrVxUT0/7sF8ur1sISgHEgP
	IAVkcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878gj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 08:52:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so264700985a.1
        for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 00:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294351; x=1768899151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=;
        b=kc5YUaMRuPM0+Xg1hYPyX/v6L4jCHcl0N0lg0/HcTvH9f9Qc+Bc3sjBHFqPa9lwtCZ
         elZIpZt25jyVLT/TV9UixFiw97IXYxsWUsRHpZYI/TKo9S6qz4PFHM2TQVF6Q6GfHM5Q
         LrwwrY0b0O/NohJb6jfUqcZuUVONgaw1KK0YWq//9SVCk3JFm9W3tLI5GhY+dxXbAowf
         +xjc+HulVjaz8cs7o9Bvl0oHDq1lVDTfTJwrDRGrYkC1rUmkT2tC9b6cnbbowgw4axbo
         xfz3O+5lfZxFqOq+M0GJE21PvuGOQXsoE3RJXQxHplx28yKi0Pdg3SY4VXU5+g2oQI6G
         0srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294351; x=1768899151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akSlLBvxW6+m4cNwEhhn8aCcDRvgKbnoX5vi2x8CPOs=;
        b=KjYzYrNgZDfU9wCwzNVH/SNO/WY2AhYzsnZdhQo0LjRS746PMrL0Wyv9NWMFdDBzil
         gXX6ePvQgBptG2B/bwVFDEc5v1FfZVq/t+49X/TWw4vcx0Dw7+mjTS/Jgmm/8xcH/VpE
         XVyxby0SYTxz/d5DM3hzh+t89lTfS829veBryYtf0ii/ErwZymmpeFd5BlR/FNW3PhWT
         uWXPfk4lOEfSudTxs5d/aIWO1FkNOxnF2mWvqG5SA75n/Ffe+0El2BhJY03FjRJVABHZ
         4DbBHQ13cNoBQLLFlzYNEZJMGy37dO2uvlC6ZcuYCxDuPyguXrTksq0Hx9Y5msRsd6Np
         42jg==
X-Forwarded-Encrypted: i=1; AJvYcCUWkFuFZRhyb3xgw6/zwyTIRfhFQnxI73+q/cPIz4tyKoT2DyICtcncAFUZhHwkfSagNA3dXOZGgngO1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtFDHzWiTMxewiMkMMJKTI8HoBqCSCdpzYwqlLTgKzEPGRZWr
	Di4blHZereIz0LJB59KIkK6MAUKOTP2QFT+xQkBLgbdh27yH09HTUOwX1BMMnWLWwhqPKP+MiIP
	Ww9sDNlrLQ1EEKranTY8+hWDhOyZELRz1xVbPQMO1VcESmSErJuNkLehemXWesUqPlQ==
X-Gm-Gg: AY/fxX6YxckwfmAfdidMGjXaBD6dXw8b7uZUCE4Ia49+0FcZw5AS815xGiN7sE/k6oJ
	rQa5Sq1LCJyYjh+6gRekLw8G9dH1+AzH9aWa/J9cEEdELifTJbWLckkKdmzhYKi3JvjDn+ADLpY
	gkvGJvhgGk4h8G8UbZ3sk9pHE94tMJNU1cKLl6cpIj6PVCmMfQXZk47lPgrDvOf9kJzJ0DC9Mkd
	uZtpkSW95xvr2zeZQSzj9WMvub/6bmR1K7KL+lI4ZfdssW1/K+lxI9v/U1zAvodtcGrDYQePp0k
	RdGtrRENxqOpauO9Cmj+74OvSvqn7x/BqVMrWdOiOBPPeqlFfOJtBzDxq+GONiUhFY80lELPS+J
	zIdu4KIq5yA14OFPOE4xyJrW/DL/6+3+iMy76pAea++S83bA4LrJ0RyLfpf47u9yrCsI=
X-Received: by 2002:a05:620a:f0f:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8c38938b477mr1976258885a.4.1768294350741;
        Tue, 13 Jan 2026 00:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe3HcVWbu4Z4k8wHtyc1vE5rWOAggNipetl5IuElZ4I9M3hRUy+qBAyoWR8QocyXaFxxBFIg==
X-Received: by 2002:a05:620a:f0f:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8c38938b477mr1976256285a.4.1768294350310;
        Tue, 13 Jan 2026 00:52:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d683sm19788252a12.34.2026.01.13.00.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:52:29 -0800 (PST)
Message-ID: <69ddd3c3-e3a9-4dab-9c0a-4d5cb3763a5c@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:52:26 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id
 and remove board-id
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
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
 <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX5yhUchOa9lrq
 9/29gDCQ6GHmY1BCdqRUnjxgC2Uot5IUkEt6jMCNc75l0ve+dkhe8mrFZtCQKCzTv3dL9SvES5x
 xYN6htV86NNHw+05LcG+P2EdkB3gKg+ONwA0oacJNfKeLOIQvEcgGLVVcEqLWnFxYT3xLCCJilI
 VcFYze5Uxg+cXWLgUmcSmmiuqwuY3C6cQPo9EywnPDPhVGjt8tFwWA1+BqA0z7CXJCUGULJGbEo
 ZWV22Q71ApSPSpCsVCyJbsixHiqDXCujsqCtJrCONzhevRmRKw05EPSQE3RFfuMG+LL+xZ2Zjrl
 H2n6vb2SVBRu/5tBBFHuprqbZe7HSKgS+dNxFJ8W5S6YKnt23OWWbaHgeMO506cIFqN/4IIfAVs
 TYaKsyxXSiCX+lJtG/FlfeR2w9EYPYXRZDkWnBIVdFoF+yCm1nxuSI5r/n5pY+Xp7C2GICu/2nO
 PAdTLUsKu9VuZDbD03Q==
X-Proofpoint-ORIG-GUID: 3edbgky7thQIfa1Ik2LKEzaETmMmk_N-
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=696607cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=4Ix3DnIw-zF4zot3V68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 3edbgky7thQIfa1Ik2LKEzaETmMmk_N-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> Correct msm-id what should contain the version 0x10000 and remove
> board-id it is not necessary for the bootloader.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

