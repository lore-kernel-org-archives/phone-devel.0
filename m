Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C834751F
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617520; cv=none; b=q0tDOHHyp0QOJ2bV4k9z4B8SMZFAM2/uZlN7ripfAZcZdiQGqsyyAF1jdOc/G9+TulH5zYxdGkgZSogOf3SiW/DsowebqV8Nx4d7C1YenyazFDeU6gAS9zaM+9CCRy4RkqOcA59tyKWrsdWfMkktjd51UTDF6Fg314juSzplqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617520; c=relaxed/simple;
	bh=LRIaBWeDz9XvpY2K2lqiFjzIrt3vcupGzjCDyTLA+Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDhCU4KASwmOZVdBtwT2UqWytdjk/h8AUzy9HHjENzHgbELFIUlDXUWyhLOm4r91uZSub1hmXtwCp/0G/8QLq26FgiufCQZuEpeV6lby+oXa/khnX1iqM9ZpKjfjLx5b/TKkaiVtIsGNm+kWd50lwrrDv5+HE3MDrtS/g9FnlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnraOnxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/g0NmK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnraOnxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/g0NmK+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACBOv3455371
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=; b=gnraOnxaePe0uwcW
	fMNONOWu2c8T4AgkeRo1zRe5TdLRDXTRSZdLr3jk8Cvk1lopmGQcy7u84GpSrmqC
	hqvenMoYYtBA7vkowH6OiNBH3gm56yayy/JJk/zy3/07pRnKEVphQJ0/ctm8Dj17
	+p2FvB3O1i8vCI32FgngExrvMhbAp5wyDXPyId/wnYco+ArDmwEHyab6HSDzmZSY
	bBJNwqZIMGLNDDJgHOjHhio5fz5pnd0BPPbW9l3elLq5NFYnxvPNPPB5Oh0k5HbZ
	vzJG6yudQphewCrWROzarE41HuRBoIMwJ9CjDnbsNQIAJxOi+g+vGPfWqYMBF5K6
	KNZtew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkgyqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b9d0162aso50381685a.2
        for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617517; x=1782222317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=Q/g0NmK+pCWeiAu2CuzhteNDeEHvaihYXK3lnz0kXyHJv3l8EpXHSaSJBt/ggmhTsd
         HBil8OzTN/35UO2PbSVQbXEwyjXV2LW8ymGFCvvyrvIdhPPfUynZEXgL004zhYO3gVBi
         WNMzJnBeGQSkT04axQ+Ir9cp00qJhuvSkSnVtY+HvjhSF+cfRVut9nIVC0Kl6CAI5TiJ
         xCzHgFGujHC37knASJcVuj9dMhlFjZRDme6y933bBeuUCKicCtAV3kega/hi9vB1QhOn
         0u2SGuh4b1bBJIlpdoRYk9F61BG6THOzBvNnH+q2mlGLWUrrx/VAFNX6IPMhs5FeEV5R
         xX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617517; x=1782222317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=KEuOciUbl7wPo0JUlJunjSEh5nZVmqAyl0RB159BfO24y8Z+GGLclunICrEJDrrVuG
         NeVV1UXf5hCtvMbCUSwAXxh7ZSvwelzL1Ub02xcucAjqpfuNJtZy5jbxb2SKc8iZV/Jl
         pYAucYFAEDRU3Rd3jB10+p+wf3vl8qLuyEP8d++3UQxT9Ud+OZLlhxZZsmxUhKxX6Ldw
         Bz2Jf+5xYSjGDnHgIrrNwrSKUHyQhwBw+kEwopbyZ/m5HVLxWw4GJV+i4sITqaWuzFFF
         Z4GTt4/uzV23m4j4H8oS4QbLf4YQwOsVEMVTBUFJv/FyneBbn2ZOatt8KqXfs7BPUEpB
         oAuA==
X-Forwarded-Encrypted: i=1; AFNElJ+qI3CrvLX/eo+je2OHxXHcdrpuAOnH+/Fn0Y39TAydqP8tOTxV+cJLTLqRLcuvX940AxTkp7BdjxXOxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwztX6amEM7VGAL1jjkAcvZiYWZC21btRYLDpROo2pmRC84d8IT
	cpjho75+o0Xk9ShrNNKY2Kiz4yzz86OjKshD8rRNBvrYbns6AEu4eU9RbX+RRQntozH0D4N8ykN
	ehJLSx2KDo8W6iKobzU7iyANuFA4WFscDn/Yy+PlR5s7+Iio45C5Ku5AvN/jgmdYngA==
X-Gm-Gg: Acq92OEsYabYCsR89PhfZVw6MrO37ayRcg+qq/y418jUMHnfkJZeqHh5mPsYSaKYje8
	kF8ZS+pCQyn4OlnWF89u0jYkZD+i+NO/+DmAbH0dGc7hhKAbMFZdCAQpoQNo+g9Y/9Z3wUzSYRC
	NQ/OkBeCosue9czbo/M+Sr/sRXYUA2IhfeeIoJbXDo5Yti9E73cf/n5fJnFox6KwPyoxQhm4hlY
	x6RaRZUGcSNQDjV0U55XnAcc+fxYe8VpGs6kMxumxBX+klvlHwM4DehIyfJetXmTGfh5LbivhPI
	VcV19Ayx5jwQvPchXgPmUbEZdyEBB37cGkNrFD7neR33Mm3hTWu62tobkIffYWabn6ugJlNoTbU
	hXh2OaSirrnbooPifug8/ApF5WYE8qbhnpMBeda8+Lo45ag==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393885185a.3.1781617517214;
        Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393878585a.3.1781617516736;
        Tue, 16 Jun 2026 06:45:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm667680466b.13.2026.06.16.06.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:45:15 -0700 (PDT)
Message-ID: <46bc1a3d-37e0-4b8d-967a-950cb3a48200@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:45:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UiHmW26DkZqgBreow7KRAE-hU0ws2QdE
X-Proofpoint-ORIG-GUID: UiHmW26DkZqgBreow7KRAE-hU0ws2QdE
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a31536e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tLzcpL6T6jtHObjfa64A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX5hpqjGm57kso
 KxRboX4i/FxOMEaEqiNsPewmnUEaEzCIlxhcrHzUKnYBhz/gna1HOLaDcqGb/v/bJudVBiyKGkR
 8dz2U++iTvlDDN7DJCol1HWcOwDPy7dw5dgoayT/ud2DN/ujvI+mDQ5tlRp9iP72AjV4LtY1JAk
 fI0kjjkUlz06E/ik4rsyO7QpBphiCFMhDGtqZUAaijlghKuCJlHze3eyL2vg0CowdEw095vbFqg
 oDqMdyzB6qV/Wpx4ooUzO29tL0AXHGuM2Fkg+fkam22q7C+FYfXvO9+YVt7tyraaPP9UJG43zYE
 TIKetUpF2TKPEeDaxyxIiAkjRVMgu8krRq6ZSDd+kAEiSJrd1RH0CU0MoDY8H8SC8mXH/o9zl2w
 3LlsGDbj2KQdaIwQy0wgVLXYvBu3vigKo2kN9QgPIHCQXjNogdps/9Ztoeff9L2i0KcffmgYbKA
 Vv6qtzG4jdc6FvAoNwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX381QV5zkqUNo
 Lm+8aobuRkszcZcAVEOCC9eKCz962c/iexyyt1FwK2tiH02uPPH/dFaojxwWhnw8Zh0q+pSBM5Y
 gNRRdYCAyYNWtUOMAj3noUfWkssKugo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
