Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD832D8777
	for <phone-devel@vger.kernel.org>; Thu,  4 Sep 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988426; cv=none; b=nm1NH+nshCZuhF6FWz5eGMHHEyVMuNhA/Jo1RVMshMFRA2orxFD9lwMKbHuf2KJuElfA4r0X9PIWpu1vZZS5Zc0iJ++G+w7rayKAUsWMEvOYmY0QI/+K+EXJazqSYPZnbTa+CckZNSQjjExHpjpcGB/g/IAAKVBAzol+tWDbyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988426; c=relaxed/simple;
	bh=WSevKUXT8Sd3MNuHsHxr6/qElbPatDgVFUDgAsLQo28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcQj/UYi2rsQyoE2TflrDmCladnOQTfASLmU+m8WpfTQzYhYPb4QRJv1Pd2aFTSJdRKqFJ9rA3iAhNEPGtEj+IvdX5QS5eryAIKG6FIOgCAA8l8YjBw9n3snP9AqD82AcfM2hCOeSS5E6B5geAm8RXb83oDDnnLx3a9WrlLDqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF7F4rPW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF7F4rPW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XAl6007684
	for <phone-devel@vger.kernel.org>; Thu, 4 Sep 2025 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=; b=lF7F4rPWrOffjepL
	rsGbLMBcrr/o0u1vA79M2CB/+mfH5wIj83TWwnJh+F+QRnx3WlwOJGXmt9JB1Zkd
	2P0xkeVRT2bFXFmBFSZKTH/UYUJUyn4x+bOy/okVY6d17h5B0U06b2zJC8zA37uA
	UBNmqU84QUn7dS6Bxqo0Gf8grPibg8Qt6jBVhF+gx7y1LLByeFw6AMM2BECys6zA
	TeJAqx3wbGlenM4lv4pmV8mWVWjT0CArCYPUy73HXYM1jiM9QjdbLWZnQW2bccaT
	bOFOk/lOnxPTxp6ipcWk1m3AWB10fildxvoYY14Q+N2zlJbD8v4AoACNSLqIR64Y
	EPePRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8yasw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Sep 2025 12:20:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so2278761cf.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Sep 2025 05:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988423; x=1757593223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=;
        b=S2P6phfy/QT9Jm1wG98ZIi1Eo9wDewZ7MWvM99nizazPMA7VQLrdMcySL/RoXt2gZ7
         gnC2ZiOzeZL253kyjwPW9j/fuMuiNJL/P5vjH86f8Pk2kqe8ijB1mT9eUaaw1L0YgHKV
         8FDff5rdbAdiTQ4Gus2MPDRsyKzv0VkdgfzPxXbElPEPAexppjtB3qZt5CbhjcTHCwAi
         Mxfaw8tcbcQU1FZGQIy/eAOHHYJi8pTxLDfR1qpdw8vb1Yh/g+//bCmPG6WLUE6IEzbo
         qB4X3CrbVLdTE+7bv0rlvnlSxWMldbHPpMISi+kgrMJtkNbJZYhX05Ky5vkVdkkX0YCi
         GhtA==
X-Forwarded-Encrypted: i=1; AJvYcCV2QXFh7E+SudwqIZWrWV5haGbcfoAyOYPlpe5LRBZrheqXIyVvXOB4HLIxzS7zTPIHFLAKMkuHwnWP8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLMkw+JK/37GIUYYPFeCseVG478P+mXqLbW7jMDB+HQyX4hbg
	lfQ8pfXLqvJJJ1O+E5y1UTOphzSqRkzE84eKP3+76qo3ySQHp0gMNIzgvWMscU3iYlaU1WvX3hg
	Jq4Ujg/7SG4Mu7aS83paxTH//UrT9hZbso6hm27DuwaLtudTyxUNv3YgAYsIBxNocGQ==
X-Gm-Gg: ASbGncv4ETSzb7I4segYCZRgWayhUo89GzxXN74gt5ZzkE9Hmn59JvPchuaS3BJVf0L
	oZPvV2zqiS+0Ib6qK4Y9qc7rbEPpFtkr+O1NHSLkoWqRBYXgCCpVa/vtr4YQ/eObRpiUzy9x93g
	kwakMA6UEG9lMnNTSmhCRxJjl957H45fW0G4lvfUKsKFGYtTacA3pj/rR3KgPJyQRtvjV5/fCjC
	Wn1q7YZHIFpE7cOYYpfLa3Py8Yv0bG7FcE2Ps9Kt3IW4Q7PtsWJXYiCHPUWyLK8X7wiCw2eEI8B
	mtflWsZVmfZktDVoOILG88vTBRXaT5m91kMX6g5mKGWu51lcaOyBu8F3DzOP4FYCNnjVHZFppir
	7wkqVHQNlmJU1wClCmgz+4g==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b5dfdc2c5amr6767261cf.12.1756988423064;
        Thu, 04 Sep 2025 05:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq92zIM2PJ5tnKQijo/OGWPykJlP80988PfhS9zLD8jSYpTvRaC1PomVJTiMQsaS8+adW20A==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b5dfdc2c5amr6766811cf.12.1756988422416;
        Thu, 04 Sep 2025 05:20:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413ee67a3sm1164960266b.24.2025.09.04.05.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:20:21 -0700 (PDT)
Message-ID: <95b40735-367d-4702-b2e6-01c9c5604e5e@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:20:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/7] arm64: dts: qcom: Add initial support for MSM8937
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
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
 <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rWLiivhAzE8J0v7P2ArcVdI5ozBiP1Rw
X-Proofpoint-GUID: rWLiivhAzE8J0v7P2ArcVdI5ozBiP1Rw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX6bBMeybRX2GM
 Z7RZUIOb5OQPe9Ous9sYoe7SS0GYmeOjQ6REzLhwXc48/wW/Urq4BOJIZ0/+8gd1QHIKSugEYGL
 whFTnHsUHooVVHDBml20u019fh/G2Nhz/RQy5HlQ3XjBzHcKDW9tMNn0rMnlfeoL+f5QClED918
 Vox5LkMBUd2Wbrupn+aQmt7MEDFBi1mHNl5eYMcc2QIC2TGvmAcmIx9cWVni8ZkBjp8yzCdq1cH
 566vJjL+Cq+c5caYEw8yNgvY1IQ0ngaHQPar5tdR3sdxvHUQtd0KUrKwyueCWMiVWoAz74vbKhf
 Kbsme8EXhCDGICyMabDTcwbV08oZJn3TiroJqnIiqEQfOydmCxRCBxA9G4h3W87ZTiOiylXlIFf
 UYp73h/E
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b98408 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 9/3/25 11:08 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

If the bindings checker is happy, I'm generally happy as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
