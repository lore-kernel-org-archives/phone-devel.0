Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F651E1C1A
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662968; cv=none; b=LZkGpIeLhI+91vtRn5mYN/0SXiREr832r8RGNShAsM2+RYdeZTxyRXmVcnFbAgCf9lTiB6qTZ22Vbu2bddzjFqjN3KpXYBQJCnn7MlUWQltLh2JzwlJVd7/Y3ZxRhvLsWPUu79qfeUKUKXL5aZ3JCawXhFN2e5IIBwoUys75Ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662968; c=relaxed/simple;
	bh=treTBaIxZoc3jdxAPHMCYgFICz5n9kyVrC8UeP9/WSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPN5RTW6qr4TYpUgBEyP8sei7BYqMBUbWqweFcumhQ8B8nRH4fz+NM5ri/C3MV5Qafvh82+CjZbSYK6wYAijMGGVtRcXhAwZQzgSJGo2RNKkgaKHz75/pXF2gYH0LBfbFfwDWxhOVXJ460eOf1uta0ulFtPDGmPfbxVenomXzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikVxrvTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikVxrvTU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJTLte016335
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=; b=ikVxrvTU13ys9n6N
	jaLLgH1FaPL+nIYUpFJPW7Q409nPG1nghVHIT6Cx2I1bRUnGTqQYaYpcknUVlAZW
	Qd515P9l5wS0CXUIXBha6uLcHrCyNbrn1gg+cn8BqUsMIPb2arDJOAuU/ED9u1Co
	ornb1tJSAxhEU4uRJZ3pHG2Ct4p/LS22YDGHOu1dsBCUam9Znu1hp3Fg6EJ+T4JT
	S4P5Ph/luMP/LjxzNt27frSZMeHtEOMRCC61liIXC+rmIW3wYIjF3n4+/6s5nYHz
	KE2ouncoT/DaqRlTIPQJu3RNpP9ykc51eXyvXr72x9Fr/aFf4Qf/bwrLUgihG2Wq
	jRfY0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjdra3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 20:36:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ece59c3108so10507286d6.2
        for <phone-devel@vger.kernel.org>; Mon, 14 Apr 2025 13:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662940; x=1745267740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=;
        b=cX5gAyYtOpB4TYrTlp/KffUhWaYWzdoRQ/yJqCLkc8f2iXOQlS8D/Dpb1pqv3Ff5PI
         z+hijY3mgx2rR9iwtaky8eKOCxM6v2O9WBDHN/T8RHZdjKtPzrWliIvLfwF7AMpW2jvy
         yiODUi3rp7/pvgEomWKskBWjHOeYwYdQpN/G/P7NUtNATVVrmIbztRt8obX8jTPRNU5d
         uTyEtsLC4T9qqnBXuP+b+7vmrsytdftswbJrNZkZ80HD76m/Gpp6g2vhAq66pCk3Me5J
         MlvShHsIctwLSFI2necEriui21mJ9v02Ls2hW0apLGw0rQuqdCZV39U2/72qhO2QQ807
         le4A==
X-Forwarded-Encrypted: i=1; AJvYcCVW5wDhry3/1H4mEwNSDIdBuFCDf/Kqu7FYqpE3qzaRqcCVBkydIpDBaPXTdzORBTQ7s8yctk47p7C8tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyyt6ZP1zc+5aeRHh4HrEYvxa/ruSmcg+dCdQm+Rhy2XIWCi5w
	RcqWxg5o3stX2Ux0NjSlY6PVpI9hARvhafLsi2mVXm4qI9zjjVx7nttX7DSrZpXczAzog7DUoJS
	1iSR4BEHS0HyDoYZFX4zUUWc6xLNI0NAlsgt/+XengstZAig+iv+u4LzfN1kQoQ==
X-Gm-Gg: ASbGncsw9MqiZVWtOlcz1NMElsRP8O9vpzi7Zlo+kOHD5Tr3R88s8D8DKrvNzySw+vO
	QlRjAo57D+RqQixdDFzy41OMYTpKKJVg2Sw50JuJLnrSM1TQ7bQ2JMrkaY+0NBi61u3QrGmPmTS
	fdu/6E9nxeojfdfBJixmqLTwRpf29dvWdEq+hcfQOYiFFooM8jFtYWkt6NgyyUo4a4J0ekw+N6U
	E0gFlkxfMqw4Kl/ZEVuKpv3+HasIU/WiBPrAlSsIIXnvSk6FlYMojzxzF3yRCQI6SDB481gmbT3
	2cmoF/LYE9frFMt/KsHJZ/MKXezfcgYPWIKEklRn89azKaZbm9OkCdihtr3aMr0lhA==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694924985a.14.1744662940200;
        Mon, 14 Apr 2025 13:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES94yre95taymhy/asOVTUHtSDJQP8JMi6CuPlrYL55wGW9j9JqYzSQvw7vL4wpMWwbjEpGw==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c7af1d0611mr694923685a.14.1744662939794;
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc195sm993479766b.143.2025.04.14.13.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Message-ID: <9c21f321-1aec-4b36-9e3b-026ea9a810fd@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:35:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Daniil Titov <daniilt971@gmail.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H7epmxudizpB8jZg9i8GvEsfblnPhjVO
X-Proofpoint-ORIG-GUID: H7epmxudizpB8jZg9i8GvEsfblnPhjVO
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fd71b4 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140150

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
> which are different in this chip. Register all the clocks to the framework
> for the clients to be able to request for them. Add new variant of GDSC for
> new chip.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +static void msm8937_clock_override(void)
> +{
> +	/* GPLL3 750MHz configuration */

So this is a variable rate PLL, I'm not sure how it plays out
with your frequency table - it looks a little different to the
3.18 version

The patch looks good otherwise

Konrad
