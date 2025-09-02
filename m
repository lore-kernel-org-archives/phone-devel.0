Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8502DAFB8
	for <phone-devel@vger.kernel.org>; Tue,  2 Sep 2025 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822541; cv=none; b=eUjGeLnMioBi7MtdSM1GJMqtxIF8pJPTD4t2szNhHLRc4nSoalTD4UbgmflvOEpzIusyPR4DZQGVOMRVgjX+pmlupr0RmrsXBspQ9il7BQqpJu0PWItNUW1B/hN7vW62ONpiT2BBAUHi6e7TtyHisjJTVP9KuxKBwkh4fjqTarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822541; c=relaxed/simple;
	bh=akGpi+QtTCgfYTofF4Pk4tpeZByYbVJ+RjDKLpVnM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fhfcw+QbfI/xlL3YRBPaVdAW/hNDP/CT6DWtI/ODT+7DMeiea985OO64L9HXV/BUru6uk/xt0SIvDTh3eRy4wnCtQE4rRZA0YA7BRRDNpAMh0mP97YpwJuG5AUHfYHwy7yLbMnXPaBWqHMSRZq7U+3JBiFYfl5R3mH16dqZDwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idsb4DJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idsb4DJV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AGivf021595
	for <phone-devel@vger.kernel.org>; Tue, 2 Sep 2025 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=; b=idsb4DJVLCwHX/wd
	dLBEgRWQ5XfjnjoPCs7vnuCRGJDdRCLaAbT5T9svXWbSJnjAlyb3/SWGWuOXj3nU
	Qf062q356QCUP7EggKRkCFJpFN80p5bOLKePqvMQ+knYwQUYRK4AOeYvjlNkcp0B
	Mc0bbXRe13v93zHGHvugMaUGyLlbRd+iWqVdOTLObCSNW4oStfcXJFow81/iP6hy
	oTt7Qq42AOjVxo4tLmcNly88otHG5A1q5+jjW/t6ic29337YqqsxkJ8cJ8NkDG21
	ReeAlq5PVBOhG5ubWXO+i1jNO66SVUvqRx9IF/hi/OGahlLGwyFigblyPUyCj8B9
	XN0p8A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s0562-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 02 Sep 2025 14:15:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-52dae4447a7so124729137.3
        for <phone-devel@vger.kernel.org>; Tue, 02 Sep 2025 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822537; x=1757427337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=;
        b=sOjiirXEXQwBwrdFtalHTmPvyYwE/WeuLWqV2ctQMZpzcm9Y73MOgGyIakBFBfk0RO
         GmNUBSi+CI0OjZ6UE1D8et7Ldwkad7JJT+34lVkJvjNZtOQCo/WcYwUqtu9PmQsPykK8
         mMuRQt3ulkYep+szWB5CLA21Yxj9QxGtvFzKXKJ2RchxtbKHpuKOpgZGpDuv8SvCWkui
         w5Nza6rW5VGD3gVI2BObDKiiWdkrobmRNLM2Ln20P7Iy7fLtboSh+mH/Lc/4pC9yBTbi
         MaHW/D9JgsxT2we/wVRwjdTcaM1MUDvk9JlCufp+lAhxLTf5ysY000mUJ8+gX0qFZjhI
         XSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4jg/XgC8DbTKDIPJRbYUa8Y7q7rFuHkPddfOqk44f0cGryhsQL/0er+MK64VG4Q3Kzj2/I/oUAsb3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcprbbL0w/r7l9uiR1VZ8Qcxys5xgPW/34UpSiFHMXQjDDfmv
	pNlEmToa8hrzr4+1Y7LlgZ0rQuOgN54DfnIgfXUMVTj/t8hWbiCcmc2NlLt4Vw7KxYL4DNPrxBt
	EaeFr6hB7BOTqIyvyikXjtZBPq9ekLlH1Qb3r32nH4YZy8I3xccFcTQw3ZVMVqv3/nA==
X-Gm-Gg: ASbGncu+eQeHfEc8n6f5orEGy+U0dHRjLPNMUBRaxru+WSZPTQDxy3V5CLc0ZUawEVq
	ox4bqYI/FFAS6onb2Lrv+/EmWm6c69Wzpq5OJt3lXMb8KFdWnHKMNuDqNNsUV42hRWhbDey+Ta5
	vLTdq19eF1xVI7QGMZ2BNPWGgyZMp9L8AIPrSAmCwfrJohEpPaFHe4XsqsjxWCsePZzfR41eLjH
	UdgHkOhwP0WjbLD5eGu9GzhkBimI6Zj5AELnA/SDK9WUYdjXGo29KOjbqhUkvodXQWvuJmuyiyY
	CT3xqJiD5SYj5QVJoe0v61+I9A85PfzYEY2aOlv+EKdLGe9ztJW6b/gIGJKsSzibHZ1ZkYH3Htj
	WhPpHbIeQ/fPhzWEtVKjylAl2n/yrcsz5Zx2ko6ppseU92FTwY4fM
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570509137.20.1756822537061;
        Tue, 02 Sep 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjsqepLP76zUIqTQQBX9Us4UoXPo5VPCLW3VzTnrFgAj+u/0dS6AteoLKyMgNUBFdMU3pqQ==
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570468137.20.1756822536291;
        Tue, 02 Sep 2025 07:15:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827b1df6sm730194e87.143.2025.09.02.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:15:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <gkkxxd45xclwjs6cp2loj4male7wobeacbshvjasolr4accz64@vux2ou4wa2wa>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX2tB22du6CwGU
 Jxu8cKh9dtiTX5G049pRpj4X2jx7UItfzEMYN3zJh1BVDP3CO2Ra1gPn8ORJ+ihDqcqA/oYFaaS
 My4M0BqfuGEaKBq8KJ8p8v6tAZVG2Ik9M/lzhHU4cZ9/e6+A0YwJmGdJTCFJLiyy8t4VkEDgm81
 1EtQx2OFAPLw29AlfHuXGTy+vJoN4pmyiOMXmBUBKPj+h2rLKTe5T1ndHWkhAieNVGa2gYB7zy2
 BGH+qyucVEVVFx8ghR8CZizPzv7CI1a78QonTnR3exP+mZRsMZNTlyqsqHv8ivBjOijDCIRdqKS
 YDvpQuSW4r2FQhbx6dOEvJEIxlF/G+P8G5FDwN9ZkEQ2mlXmsmW6RXHohCtOCxt6or718bPAuT/
 QL1vDEIm
X-Proofpoint-GUID: SOZ53YIPM1GixPS8HfST-LxrR-qX4sPh
X-Proofpoint-ORIG-GUID: SOZ53YIPM1GixPS8HfST-LxrR-qX4sPh
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6fc0b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Sun, Aug 31, 2025 at 02:29:28PM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
