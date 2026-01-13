Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900B251791
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267118; cv=none; b=WWqL6PDr3mYzPWA9rHAnl2j2IFC7cbKX30Huf/zCw4A5bnGJ+vxw68zdx5qNi7wGTakPzZwv5yjaE1Xj3XOZ5VPKdYNVyXTkPAb6QELojBHMdZyxIhsCfuCGOjf3DjE5hInzEgJIR4+4LMuDbITWTtWiksViuLthuRwJJHtVV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267118; c=relaxed/simple;
	bh=DcdBU8InJgMguQ2iTSiZxsVXaoWbbEYqvuCyyEOFkOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrlmUU+8/Ue1+uwTfOH9HqCMzRIKUyg22sDzh8D0UE3Tqv8UyQ0gd26q+wChyimYOXiIDvjYuN4BWc+VMT/0yeZ16cafjvNbloaf3nTFWeYvoSEvx/lhosPStrj6kzZ37qU1ukTQSmYRdxjwh6LzYeZW93WPUg1qLR5ZR1U2Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGPl4eRX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htjowIl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGPl4eRX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htjowIl4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5Cx72604891
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=; b=aGPl4eRXZXe11A6r
	UgI45mqq3dzacSv9kaXo90migfZsXmnytU+6nwHiX3xV05eFH29N149Jf6qFpse6
	MYULFic3ATw5ArZHf2+/x2sYF9f210JV6UsGcHAJNdOJgAoJ/mGYpEsaRimbILQ1
	Fj2kgqZFPwRxR2ixlhqC7RkC+w7btd9HQ62R9v2Itkue7JowqAu4AOdsFjYWCPAv
	QHiN87hxzISUuy03dm2ovZt4UOedQ3loSEtVc95h58n8ml44W7ZxWU/6+cbC2MKF
	3adhwbDsYLmbJbmw3exBj4hMavaZZkCpnqihk+r6Ei28QruSnwNXHPqslTz1CXrq
	HpowZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uyrpq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 13 Jan 2026 01:18:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e41884a0so1571541685a.1
        for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768267115; x=1768871915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=;
        b=htjowIl404LE6kxmYJqSDVsFz7w50gV6bLcgVujurhKWDQXXBIB/RxQNnLFREX8pEc
         U7N3Izn7PR7KnnzG6b416DDZWT194qV1pI7QRvP7zJkZyh+J6XgItn19HstxWdJQonTI
         DxRjbi8z7ZsCKZdXXPNjQdvcRssGkzh1Gqt4PMUnDFxnRUAX9O64Z99PFvugtBko/eiS
         UsDznJs0QOUhFdGAuw16Xr/q4WtfCF94t9O44u+LxyEGMdgapNgPfdfQPJMoO1JhC8rQ
         srRjP0xhAV39/K9s8KsdAPwCFeJLBU4rgGt51amwq75owAv9rh7Sil+KQoTTkYFJnESF
         4jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267115; x=1768871915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=;
        b=CGuh4IO5p+3Q+GfkPsP8xUJwsLdUSBGqe2JKKLajufDqIOhpzBFACUpTF6w/3clgth
         wzrzDxv6zARYPsJpbg9D8fatUxWjK9zYTFBnABZ9hVWQ7qgJeWy3MZSyY4Af1tECjq6d
         YeFr6cf9/c/yvFsiWS847Jy+zZPXMn6RUZOlIjb3A0HQCbXI0jnG33ZQljwYisDJoM2I
         IBJPMa9Pyk5v/riDqjEVmmbdxquaYjLeRGV7ixWov/rzkC4bwfUqHX6jMjr5al4Q8fi9
         3UG5EJ8Nd27zN1c6r1jQLhGIlM1Bhg3Ui1JF9P2ESlbAtMBA9odanpxwSGITCpSEHl9e
         XsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpgWpx58cPfQKjMZj1DG3Tga/YuRRIz0vQ41Bsanto9zzFaDiTWxdgLtjnLcmbBl7zt/iKF+4FrskTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHx7++41jmqe1MN6kRmdi6m1YlqBaPRMRulkonig9lCsMez6xp
	DIkC245BdPBLOCCpcDLpFmzCU/s9kwvyRk1TQcqmLMbQynZ4eBjutAW9/DHytNdCRDH8n7ZTniW
	kI4RCZ9qRV/oLP39d6qvlApdVNChPpos6Xegea+XQZSeVl6RPDbZZCcOY+IcqZEjAoQ==
X-Gm-Gg: AY/fxX4gtkWH44gjpHh79prlj9iX5LFb1PsbDoRtvMJHNQ3W3zBPmY0qmzr/Vmv30bB
	oW10XvBeq4TVOo1pK4OKJGdczG9CePC7VF0ch4teb+lEhGAOS4Lfjc5NMRlzFoiS5oE9eS33h66
	HCpT5SygImI3eS/7njMc9qzhTjtrcMesgpN0JB+1CsHfc4LBtONLrDWdv0FJ1jiEYxX4eWSLign
	QhD8op9OsoBuPZySckel8FGBx73NgYHfVWXV/0cWnErYkCwJHAPAxi8Z3AO4c3wS9LHjhuA4azm
	K1BAiY1I/+4zLI9j81f92w07iripGc7evaJCRFP8hoFgXFbPG8ERzTJpEfuq02fAZ7qxfejPw6/
	n1P0/lFpOCN+x4k1ZK7fV1IAoSK7VpbDYgli1hgvSvJ6Cc8bLvOHOxsKLFMVczdKfKJhfOyhJK2
	XUzbovIKBLYsmCY4rac6CBbJw=
X-Received: by 2002:a05:620a:290c:b0:8b2:a0cd:90ef with SMTP id af79cd13be357-8c389407515mr2700220685a.70.1768267115373;
        Mon, 12 Jan 2026 17:18:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLZI1hd4woXlXq+FYN7ag5gwJwSjpT2Ga+pQiFR32NkRsBGaCGTDamRbr7UbZnimayaujyqQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:a0cd:90ef with SMTP id af79cd13be357-8c389407515mr2700218085a.70.1768267114909;
        Mon, 12 Jan 2026 17:18:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea275sm5094320e87.1.2026.01.12.17.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:18:34 -0800 (PST)
Date: Tue, 13 Jan 2026 03:18:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
Message-ID: <2da7ufltv6xfek62j7r33lrgppd2zm6oahhhiwz57w3ckcs3fn@xcclze4oalo4>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
 <abd31188336b3322b9322f1e6791320e@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abd31188336b3322b9322f1e6791320e@mainlining.org>
X-Proofpoint-ORIG-GUID: -9j1i9NjeqNtVWgia6Om2ARRwamVFIo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwOSBTYWx0ZWRfX9lSZryBtiPZP
 ey4SASjKtiCi9A+PA4Amsy2L+da3/zt5RyXUxyCuLedAiorHvybU17onynoqHpMzcqcXo3BsPX5
 4n2k68joWnPvfJXVl1TjaeWSo16BT0pLRRTRQCmsJsW8TzIU6x7aLFrkdMz+x+GCvL7Ws5h3+3D
 1IFt9nJ0gzvI1oiIWfYqMpuXPpA6UPFcVz2PmckOXgOmmqIx8L9ONataW7IAhAyA98ViDnGiXuW
 R0JWTpdloHvQT61ONYoS1HBsLXfZMeapm7YJwUIdwXGo1cxZorbIUcQDf8qaRpgCY2NoEnNhTK3
 ppsGNhZlK5/u32MTvUSLvdG8fFffkqvpWOH+FV1xaD+5LOMWI/CNJg7G0Gw7YxRH9wfelAh9WSJ
 X6oPUbl1cWxclSO2Lblp7Yg1rdy7OatBdHmha/t+WlEZm73xcqOcYlG9RLeomjPvJCqzevjmYjo
 YsrjN1i0WlVbyaMLlCw==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69659d6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=GsNEW2zrF1RCk_DmH1QA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: -9j1i9NjeqNtVWgia6Om2ARRwamVFIo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130009

On Tue, Jan 13, 2026 at 01:49:58AM +0100, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 01:22, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 12:41:43AM +0100, barnabas.czeman@mainlining.org
> > wrote:
> > > On 2026-01-12 23:15, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
> > > > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> > > > > the only difference is willow have NFC.
> > > > > Make a common base from ginkgo devicetree for both device.
> > > > >
> > > > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
> > > > > +++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
> > > > > +-------------------
> > > > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
> > > > >  4 files changed, 318 insertions(+), 294 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > index 163ecdc7fd6c..70be19357d11 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > @@ -1,304 +1,12 @@
> > > > >  // SPDX-License-Identifier: BSD-3-Clause
> > > > >  /*
> > > > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
> > > > > + * Copyright (c) 2026, Barnabas Czeman
> > > >
> > > > Hmm?
> > > Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this
> > > is a new
> > > file just the file name is same.
> > 
> > Following Konrad's advice:
> > 
> > Would the following addition to .gitconfig help?
> No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and adding it
> to the stage.
> > 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
