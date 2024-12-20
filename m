Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ABB1A83F4
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687587; cv=none; b=mc7WFXe6s4Z7RN/Pcf1hSZcOXNucQWzgceAIlBBShp10NIl+P55Ywh7nyA17HwNjSREpCN72VTVA7FFglvhTm4r/b0q3DB0i1P472kMapw6ZnnDBKHCdPaucdL34MFAC9PKxB55SyUJlngYF9JPi9wfGCem7Q2z8Fs65O3GOstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687587; c=relaxed/simple;
	bh=XdUNAms0qxcM44lPFO+p4DztNRVd7br7eiAXmsu2Xq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElGBiWqZB142gqzaq3j6d78lW5ifapJYSoUhlGmoywVw3DPNCR9nW25GdDiDGN3zDbfy0sSQ2YuUEY9YmFNRyUZ3AOn5SESt7kduYrEXE7gtxnPYU1IYrgO+fqoAQOvbzsY6GftaJPQCoRq2l0F6iNZ8UdirV2MoQ/jZoBNNXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl+HCQtV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl+HCQtV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6mV4G027540
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXEjqlySniK6YJsLvzZNjHslOtB2ibC2KkifTthkqGc=; b=dl+HCQtV20lNSrVv
	bzCumTQc2DnkDsyMOmfMACe5p6kTB6BnH/ilqFIT9/PHh9Iq+2a0Z5dL+a3tFbmC
	+3YbTHb/Fx6/Mqb1fMx27jJ+uniRPfw6ATSzC4iI2g1dD380Mnm8dCHbC7gNWabv
	ZLbiJW3dVfLtZxnIAP3Mmudz5DmJPsCUP6UL1XViAIwxvf4PvD6E3CLPVhB5/tBD
	ep5tx/+83nwHiLOB0NYVZsOt/IMPK4P7VgII4jV5r8wcbkV6fqw+vfuqBNxossl8
	l3vtlUbTznPZrhuGxPSt1mHIAbJrLrmQ/EhQ1kga90iTu15asWpHMoL1NWMbbo95
	Gl3M1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3mxrfgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:39:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467922cf961so4331401cf.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 01:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687584; x=1735292384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXEjqlySniK6YJsLvzZNjHslOtB2ibC2KkifTthkqGc=;
        b=dSdsYpVN9OZfPov28kmwLsG22Rt5nToTIDe5i8p69rFcqkzgzMoQtpU3IAFW6icBhR
         5mMKfZ7zU7uTIPYrpqLtpIwMcDBzTedkagbY4/G4iNHio0tZ4qRTtRB/jgN6UbXSgGIb
         ryWDRpkccb0WI/1XZLWZgKp+QeJ4A0JDCObYhcDk19TcC5cxrXhPCLJnwuE3lKXX5Dzz
         nzBCtLIf+g0Fdcz93/DN6HZD1fGrDEwN5eIpwD1rl17z8Hxx0Hpw6lkQmTREaPPdoC4P
         ueiHRiLbpamfHwjlrleKwSq5PSXioGPsqOJcCklw9nvzLoWxqq0XusyWRly8LbU7TsXu
         RE7g==
X-Forwarded-Encrypted: i=1; AJvYcCWp4KTfP2q4LfnghBDBMdZqDCM4NL7gmiYCcMFcPWtAUKzeHw/O2otOrkttx59SC/rI+KiNJASH/OgVPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygwA6NppBIFKQz9CNCr/p3KgJ3B7FjghyUVC/hXExWIaxRPGe5
	Y/ZeU7E4GTJHX7o6VPYqyUB5Vv8f1TXY+E2ETN3ziIbqrqmgeQQGVC8YIUm0Ho+fo7LTbLKsSv5
	xCWLjNkAzsl1GMlStbuGA6He1GnsNaeTaYpjuhHir1XWxz4dkQhdokiFxLLF3Sw==
X-Gm-Gg: ASbGnctZxAuXGGGBajmhmHLbvNrBUWlR2U8ndgHaK3vGNUSZd2GsSylKfE0f4O/UE2n
	Zn0AHBqH0is+cMAvEFxYl7dLuoX3XQfx6wAwegd3odYNwGr/LP2QXTNiYajSODKAO5j6le32zMg
	07ZHY9odboPqrPTHeff4iZJxijdSa60y/5/h2DJf8PAt+qzQZzz9cSonIjxEZmtvbGJCt2SKDB/
	LUE19bWsv4fGqDJWEZxjHyg5Km9FhucXPMikNWxWWW0m8Whe+fVCk4SaDd6/uIfOKa2t62IorQl
	9vpEQTzSu/LDrugbYT6HiXKCRNsPEixTzzM=
X-Received: by 2002:ac8:5d07:0:b0:467:6eee:1138 with SMTP id d75a77b69052e-46a4a8cdd91mr14731791cf.6.1734687584222;
        Fri, 20 Dec 2024 01:39:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlpgeEfpXcAFgwF67AkPseev6b9+v7GkTVyvIxVXgq4A+FJFBQtIbM8jXWyuFZxSrcoitcKw==
X-Received: by 2002:ac8:5d07:0:b0:467:6eee:1138 with SMTP id d75a77b69052e-46a4a8cdd91mr14731651cf.6.1734687583811;
        Fri, 20 Dec 2024 01:39:43 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f7casm155682666b.3.2024.12.20.01.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:39:43 -0800 (PST)
Message-ID: <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:39:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eJzMCGiewIsVFFts35A6ygb_E4JTrOln
X-Proofpoint-ORIG-GUID: eJzMCGiewIsVFFts35A6ygb_E4JTrOln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200079

On 20.12.2024 9:39 AM, Luca Weiss wrote:
> The Qualcomm SM7225 is practically identical to SM6350, so add an entry
> using that data.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

I think we should instead add the fallback compatible, like

- enum:
      - asdf,asdf
- const: qcom,sm7225
- const: qcom,sm6350

as we've done for speedbin/rename variants of SoCs lately, with separate
entries being added for "actually different" sillicon.

Konrad
