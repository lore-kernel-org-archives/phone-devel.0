Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7B1A3175
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416457; cv=none; b=ctzjfO/aHooeEEEM59QXUOFUrCAqcRfw26mfNe6epbPedTGQioQMmQ3H3doseyHatZIYRieKpkAvPQkCkoISi1MamlAnM5zKyAnixhw0ohPCoNlv3orhYIdt3Yr7czWm/IF0mZU2kvKenuzHmG17XRXYxPvwEkBIQdBsakh/CAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416457; c=relaxed/simple;
	bh=Ph0l8bR+Uh/iYP/SWlhiMjeLVi3TEspfupl8tbIi5Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQlN2DpIFXJ1JV0aP1gPnUJgpZ0NFdOKCOOsDQB7L+FwcGEGCrCKorkQSh+aXdvpLkm0VuIwsE3iKoR/AAAewcLsaN9vMKizzNIAk/PaEvI7v03IOZYfS8U7Y/DsC0wO5v6mDhqjsdG+Qir0+BN5509WMRwtUeI2UEHtIP2kBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeLymmwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeLymmwS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAOVu2004247
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=; b=DeLymmwSMCbIy49E
	r5QVfafjNeO5exfLzXBvDczdCEQWbWvZ11WkESac/Rq0arZQLUSoJaELhn20+YIZ
	sC+UQfw+/VMJJgLlZanr2oEEhZqyDuTtnboBdB5iMjHldgpGT8ppytlhB/+pckxS
	5BGXW+ki9ikYF7VAuGSy94VON6HvUbcVQaS6BYicOMI+nz+/dPaqOIMt1DD66Uco
	/tJxpKHQvUikXqBi/4DOWR1wK5XlafuCwOIGZ0hRKMymFHxOmTLTnTlK3OsUYoxS
	0ckxiVqN9S7gSTClq+tP/+yjl/eoLxsYVYANw5DfUqrXoT7lVDMSr+/+5VG4KM1d
	7zRTeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy2a70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 13:54:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54734292aso123537385a.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416453; x=1746021253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=;
        b=ZkLSh0OiwhH3rPBlZoAagpSvaKO+DtFv5n395Ou+igO4EXoo2Tb+8k0NirxFum1N5p
         9Gyw25CiohFfigu7Q2TBtxbA6Cke+75gpgCKpZtodGZ/5xU5d/esNgRpBzg4KwloX9Tr
         w2rJ1AwtACgs+73pbis00JJQZraQin1ps44hqHDxGCRMDvcmfU0RVrPB0osNubXkqnT1
         +FusaAcxB4HIJtp2MP2afVcNOstMeFgms0QJDeXTn/PwWEQDIhpso7CDJHrsg64gIcuh
         h4fg3PEBgXjD2csXh6CcDNsU6FYZnn0WH9E3leY7B5Q0pEjQrsBOjYXLRinyzkanEBRP
         5uoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjNWmiRiEHb5P3oDx8hqXlOOqtVUDR75ZrDsirfgnz+bm/B3/wIYZbW4nXSWOrQW3otATYeRjkdg0WHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8RAN4AxLy/76Zk57QvaV6dyenT+EMcZP4wbTEFFjv4vxLrRz
	iOgbLWW+SnnHe6v6ucSadRDCfaBSEoLRTYLo0azn7zJjIbyAUQDdnQWXJhY9kaPPeED1k5Ijof5
	Lzdw667hCYIbuWXi3UmnGovFXHYN3fu92MFo3YppyPdthTQjT6V/m6UVchJBGUQ==
X-Gm-Gg: ASbGncsBhoCueXhVM/tw825WDzvCRD8aRCzbDm3EyHlU52vro5Tw0UTeH9iFGAchKyP
	Kmm6G3OG8xlcF9iBzklQVsLI41ttJNuJTo0QGAbMuPsDb9gBifR1GmUQjYW6g4ahCF6mTuTSEWs
	fnToIv0WMKe2bbm5H9ZlCCD4D+ldcMqcch9EuTVXijqP/Aj9H4WFvWbdNHHLuzmoe2ttGbnxWIM
	XOuVBwCHv+zkeSA1t+R7FDx1nYY3M6MHh+mNEU4Oi/b9fdVHP5bMNJRzFpHno8xEgepDLrEZKln
	wBZ5Nn63KdXF4lC9NMD7zl5pQoQcp54Wsb8mI0PAh/rpkNoViVRzviGu17l48jAlccc=
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185090585a.12.1745416453377;
        Wed, 23 Apr 2025 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GSKl5nOJGI1IDLlBzmI6OWMLujvoHpe4eYG3KxeTMc/rjtv7PPTjZDEBvTI5D7TyWEbafg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id af79cd13be357-7c94d2cdeb6mr185087885a.12.1745416452864;
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbbab86f15sm299799566b.76.2025.04.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <da5f63ad-3206-436f-9b0f-4e966b817fc3@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:54:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Xiaomi Redmi 3S
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NiBTYWx0ZWRfX6HfPJvtDXzD9 p4PZ4E+++aIQLn/PaKdx4p1M/PuhpdZjQaiUull8FzrEgyVT0/Vm+JjxT4+4RmGJvFYu2u3CfaG JnGTQ8SnYL2STBXg8IjI6gd4ZLT8JyAOhBGIoxhWvWR0lLgqv1Cwtmr1Fj1JXIBWuBaLHHgnvaL
 LKj4E6yVe+U5TrWNNIKt5/7CLRufoZIU2vtGYyJvQgpmR8+yzy0oWxUVqo02FuBPCnGT+KhpFEl WMwwyVtzG/84TyG8bUFmJwc8zX1KSArnhRaaSEi02XjHftktfNDgCzmxo6YbhcGXG2zmHyo7t8/ fBgqzQwAXx0fr/AndBrMzak3ypQI1qjZj8tYD7YXc5KAuhWnhJ39o3l8L8x3or5bzx2msDYcrvJ
 f/XeLkRAG43Tm25s56eHfg4txWF8XwA0ZEp5Gy0xqTPY8dKymrt6DHhjzByTfjQbXa7NGQN1
X-Proofpoint-GUID: XXFhNPuXY-QAgQEM9rXwAOCegwt--ggn
X-Proofpoint-ORIG-GUID: XXFhNPuXY-QAgQEM9rXwAOCegwt--ggn
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808f106 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=VJhJOi4SVWMle1XIrLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=731 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230096

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
