Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4848122E
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999547; cv=none; b=i9ohikQ2EvbAELInxBhlxrgQzCZ44XzezjLBbmhomelFX18p8Gpo/Bd/h8kgrCIsUbkl04sZhqKaFWUrvU7kwo1fib003I+JyV53dvQZXhi5Yup6HnhN6LEt7Rn92htd2n9b/QAo0gMkinyBNheliTwsIaoGM+JFmchqUJodMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999547; c=relaxed/simple;
	bh=G4+FPG7lsr9cdLya5zE4pmWXyJuqYHbmPTf8gMOA978=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhzUztA2TOusrVimWPmXacON1E9OZedA30AYQLI0oM5IeioYHv6lfLBURCyqIChvU+gTSdijV2YXty/5U+4HBrfvJCUM++fkdX6n9HI39NBq83Zj3fFLWK9NiWUrMdAVtuXuSuM2mRXmaBYNRGkoO+0WV6IZLJMwcTm9F/gVFXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTJtBKpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdRSmx3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTJtBKpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdRSmx3W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LC5JiL2353913
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0wgyzjP53pDYgT6DSPTCMkOEuzt2+jWBFYYtjNfK5Wc=; b=VTJtBKpjm3UfYAlB
	WgLTF1zHVtwEyzLcJ/XLLJSClBLfQRMhP54ePxyYwFbrefPau/1Xq44z2213AYpg
	EG+QCR5Nr1rZXDZkul/KOEiG9ZxX97NWhPZ4+9glhrdhG5bjxXBD+K25jy7Npg96
	sPCoZu+maY9YmED3y5FvhJ8pRi3cZr0b4HczKYDBkfc0Ib4qVS6c/xRKVAz27CT8
	eyjSP7cqGdvgMgkRVZ6zukHkMIgvTJEZDV5isRsFAyFCbq9MwbESgJU26EglQz5w
	eKw6e31nFY/tzix+gmunzHWrGR/iRCF4Ehu4wnx22Dbwh5ZidFjYExkxmja+VeBz
	D0Q1lQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmpsdb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 12:45:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso75195085a.1
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768999544; x=1769604344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wgyzjP53pDYgT6DSPTCMkOEuzt2+jWBFYYtjNfK5Wc=;
        b=MdRSmx3WtfGVoifwUjsFLk3r3JDAOtVggCiDKzx899VggytT77OnOqmEQq1iucySd8
         QK5gfusEP2tYoE9q0fi7x5aavyrRvnvEC1fcdWVzAQAho8IkisgWEVv/2+rGT/nNcqAH
         XzVlNlwYD8CUf2gob7IfLZH3GrSXjDb2md5f52Ih3gCid0GOA+PwJn2ryUu6my0LNG2e
         XJ7ry/fMW/ISSXEpvjtT2q63kmSp8lip4EjgTM0oo9wTmkuTrlN8NgxijYGS3lW4QXdP
         J+3aDrWTYb1nCHOFPf4l978MdstteHH7HB+M7qgnWmzIwc3O++RTWhzhYScmrxa8h3Ci
         Zlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999544; x=1769604344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wgyzjP53pDYgT6DSPTCMkOEuzt2+jWBFYYtjNfK5Wc=;
        b=qhN2jMoUwcz6DuBhz3UkOgu0ntRozdVKnLO9cQohBjvKdGRGUkRXm/hSc0BxHosLbD
         mEO+Q8EIUEgiLzUVWEplQK8gpEnvVtN1rqjN5R9kO1GCcZHcXFqGnpgojrNB4TFVsXTM
         kbe6AiTvNZKy0htPrEHs4UeESgde/S+BkmczZx1JsMeYm/wHKL7wMEwWhxJeJILcbZ6H
         N29ZZoXMhCTkY+i9/+0O1WwZFMxq6hC/KaTOOASh9eyBlqqMelE/QsdweGrH4BtAITEe
         9hRMOq+TOChj50nKlbLoSx+7MEFNTxgCUS5Ggm1/WnPcT2TxXla1sO1p93xhFObWzRSF
         Ktug==
X-Forwarded-Encrypted: i=1; AJvYcCW86HQ30w+gItiB7NhiVSFJYX5fwGI3Q2Oh0hG1+L2as+PYtOcnYvQtAWZQ1vLeno/o2ltYaKI3pNp/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljDujglnT3en94l19obqB8DZxkVdk8ZhBGAxu3wTvn3OG+1bo
	At726TtWYwknXv5Tl5R5Ssleq7Ret8GVd7g6Evt4SKKMBFB0lslhWsAaedTTTimrl/vB/0vRy8D
	xKVs94mhc0ilh22Xprdx6AtUheUyiI8dNmHAaXciCu3tdNmV4v/5NVmvmWtIybpCTng==
X-Gm-Gg: AZuq6aL1sGRZxMfsotg4zWgpwGyBAE+b3sepgzuxIgekPeFYQPyNUTGQscMD4lEEG2+
	MxtLuxyT6adgL6JFxF4sS/t6bsZqrTk0/+9D4ez9uV4pNrMc6BeXhIj0CUl9FlVTvzSC6iPSKQS
	g/ReXICbrZeUp8WY1PUcZLLOXJe1BozoqDEO+m4OLrCNFEhy9MLTYEAMyZ5QPvH8vu/M35Qzt5H
	OQvlo86Yn72gsgrPaJLxNv3pF+AvbypnlazPddxnSWDRcEl0Xj1M0IWZvQOAv5lt5zzjqkJulS4
	DLn/vDvrlWxSHK5utZXsOXU7g4zrRMg8hvtVAj4ZDqQXZtjmugX6h+A7ufFwbNOei3jNKKuYZQL
	HJmZyZYQV+zOMeoJ1kCvuED+kx6ixwTJ3kHE4tdOxngfyVDFW4wbZ05HiTftEPm8UhZs=
X-Received: by 2002:a05:620a:198d:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c6a660afdemr1968715085a.0.1768999543869;
        Wed, 21 Jan 2026 04:45:43 -0800 (PST)
X-Received: by 2002:a05:620a:198d:b0:8a3:9d53:e1e5 with SMTP id af79cd13be357-8c6a660afdemr1968712085a.0.1768999543386;
        Wed, 21 Jan 2026 04:45:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9763sm1487409866b.35.2026.01.21.04.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 04:45:42 -0800 (PST)
Message-ID: <01d254f7-8c62-4061-ba7e-f358f1904ba5@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 13:45:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
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
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
 <20260116-xiaomi-willow-v2-2-4694feb70cdb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-xiaomi-willow-v2-2-4694feb70cdb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIcLElZC c=1 sm=1 tr=0 ts=6970ca78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=xRCo5Bcgn4OuC-SBfZIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: VsVdW9KXApyP86T1_b5h8mvememdPbOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNyBTYWx0ZWRfX9wgrzSbaNVzz
 rH/usKv2ZRxQNBVzEk5dTfkqVdEugINf+rf4NG1pfdqwPiEfEowUYuUat4BQc3KZ5SgShLFenSW
 JGAkSP+q/S5X6osp9awXU/CmZqGVyBfsGZ6HXsZ/BYvkLDMiSWkhu2pL6DK3bsbTn1ACqoBTSr5
 bAVcc6Jd2cuCPRK6TL1kICizH2D2rVaDoGvHALRkjpsJlX/ryWjI217E0aPa2KKsO7vE6NC08a+
 JGEapU7JBp0bYEH9UdyupNqDFYIliArr5AcRLtyijUhcqRj8UbAGXP/lCWJnXCyB80Ic6Mg5mZj
 tKgkadoAHXtxoFhGfRIw4nhs/QMe9zCKu6doY/E5xB6N8BRNnQcBIcSFxwRwP8N0iVG+V1IkApv
 Y6Yw8aYXuCYBye9HhjAfsvUTMtD5t+fTJbvba9bDxgSzG4PaVV/1f5fmMlgbdVDQ6gtVYNGEnRp
 bssrBOEhdt97hkx5Z0g==
X-Proofpoint-GUID: VsVdW9KXApyP86T1_b5h8mvememdPbOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210107

On 1/16/26 4:54 PM, Barnabás Czémán wrote:
> The device was crashing on high memory load because the reserved memory
> ranges was wrongly defined. Correct the ranges for avoid the crashes.
> Change the ramoops memory range to match with the values from the recovery
> to be able to get the results from the device.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Have you verified this new and improved(tm) map e.g. by booting up
the kernel with memtest=1 in cmdline?

Konrad
