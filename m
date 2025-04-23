Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAD1CD1E1
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 22:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745448466; cv=none; b=l752fhOugoydafghNloXk74S82aSKCBZFR6nAMM4yq0anYECCtX+96b7nocU5TsIL/NvlDW6+h80GWADEmQueP7s412kZ+H9CEUgnm5DYi1I8imVj4B4SPHlzrfN9yCRgGXR/2rNmS4GdvxwiUHv3hHvc+Gc3vpQAo0qCGBbHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745448466; c=relaxed/simple;
	bh=DbFZ7/j/K1EGmGKXu/FDfvVNLm9h/iduss8FipNFjck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brGL2pjgMCk0eA8AFZYlXOeR5YwPMvARuHf34E1FRwBU4DztJA66ewKaJCAXmTB8Notcn3yszqshfmQBxJn7Ev+uSHhmuvUhdZfEk8SN1442CfyD56vW5EMzEhHQfPM14XCp7/YrJMNvpPFR0EvKrFvvtHE30Ghk71IJyQuPh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFbqFKet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFbqFKet"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NL0via007637
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 22:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=; b=RFbqFKet4C7XAcmr
	uF5l93uiKoYOIpW8pKISLlNb/6aUfRkdhfZCwj81DjrkRecyxn0IKak+VzOAN1vI
	kw+YX+eCRVZB6kh2zBGWoloFdT/TuLhMVwH0gT6N68JStZEtSNL7tzVY3H1ZfiVY
	CHa4RdeututYol1HUcfFXrxVyeDNlKlJE5a9Sk0TSNKo3p+Yh9p8NxsaUBVo4WM/
	LxgE0HcFg+S4AavN2k5aoumEGjxtKb7wpUPAzlCACltegnXV/j+zLe+JLIzIhFYy
	5gx3+GvOkk4ZnWAcJnq+H4Mx64JafGwPvSVQ285T9vO8vlcFuqIO49KJVHqp+GHN
	dP9DSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bjx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 22:47:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53e316734so62858585a.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Apr 2025 15:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448462; x=1746053262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihLjRZPlLIWGlyTXxQVjwKyUINfd4mtFX1kBkVK4xz0=;
        b=eLyFfZ9e71wPL3l4alEwRCV9W8pbU6TRO54JNBIFzWC8eC95408KHRoqKQDvam06gv
         Sqjf/ZDoGQmoJ4Ue3OCoyu83864erbmhHhMft75bHKMn7l7cBYRQnaWXCwwnYh5HQcsp
         XZbFFwgMek6CdQLBkWiG3rmMY55TU5R3cPB9BDQhPNq7dNuLLtBmuKgaRsDcYV4R2Ea3
         XWev/uG2WAGeunLRewV+Q5qq7vcPiSY+Ekht8feR78N9uRrjNuN1D904YrsyR5ED9p+M
         eq3rp4SvR7MqhmoELVYk3xjT28ood/OOKno2Z4hCE7Zf2KmC+4aBVbFMXHbG88oyyhjc
         R10w==
X-Forwarded-Encrypted: i=1; AJvYcCXpbspCdpJmmRbdKIi1EjDKNMtCudYTw1xJmjXGo7c1wdBZHg0Z0b0oC29HS2niP10oFljt4u8xdO+hWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+YzCOqAzYPFN1a8ICoN5zS+kWFcjK7Fc8GC1Za1VL3ix9tgr
	rU5iCvuC0rzNZXYmFQjogt12unviCbnnn43qHq313psSQ5U26S/+M33HuwkBJ+txTBttieYPfnj
	u3UJZrnUdkm6dprrcd2pLHtyy8ph+HvPezx88kuwy49sHruXJIlz2bK+3lqAhJw==
X-Gm-Gg: ASbGncvvnA7gCaewjPFc+SPxWpv8egNG/FwUAf80LYTQGh/jkXU38UGbFJL6A2vOhHg
	00/2sF7cTemurdKAAUuoM44Tlvdk+zbG0GDbqM6uymq9hwhRJ4aD7j+iSBgmKOmUNGzNB/VUyV4
	xZF3Zss2jBfK7qvHT33jTckca65GJChJMZsGk4O0htrFYjDB3pksg2v+BRdomzJ6S5C8cDG1y/P
	Ll2D/s8sxd3PwkD7w+0CluJ/qG9eEnKwMosFgp+p4yifut1zS74ssEYCX7zQ93b63gfpx0RdI12
	tBb7cROLqOn6afLBJesA1os/3b1GfN3UjFn0DlARFmi174P1qwhFzjE2j+vV5FZfeeT7T6kis7Q
	=
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c956ed7543mr92877485a.27.1745448462201;
        Wed, 23 Apr 2025 15:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGInwM3Ub2jQ1lwD3hZid86OUOjGIyjsbPxDcJGVMhOF+7PpJenxAlmHg66u64h4q9mPPY9dQ==
X-Received: by 2002:a05:620a:4728:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c956ed7543mr92875085a.27.1745448461829;
        Wed, 23 Apr 2025 15:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3be1asm26736e87.93.2025.04.23.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:47:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:47:38 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v5 2/5] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
Message-ID: <h46amkfanqmu2v2bbsx3f4iqdwxzcgmu7ibngffn4wfavbdp2q@ho6sy346vjxp>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-msm8937-v5-2-bf9879ef14d9@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1MSBTYWx0ZWRfXyMqzWVi5PIUG Op2JXC34q8AcE9kBVD44lY6Cbkpf++zUYidS7tsPdQkRLGdvkJ6v5chwjDLoek+yN89CYawIkNQ FvOVbyKaWNeJcgSjIJ9/hV4pWPb872NtBcliOnhLEOnQr5GL+OOZF9Uw+rMNda5UrvhD5D3snJA
 TMqh2QuPP5XS3wh4pE5d83ExTDmU+5va2CNCudMb6KkNMvkL/MxV2XeabZb1aYbr5KJBS41RMnC COCurZtreE3/C5L4IfAYSqDVgH6X4pCkcRZvz0xMDeoQkI3knazo3FkP7XE/0enQdCTVTkTUn0u PoKSHkyUQPPAdgjm5AT7JUJjcWzRxZzfr+0SSKKpmU2InMFDdqseuluY1ETGx050W+QhkTbzX0Z
 Batt2EQvYp8We5cCNHgP0SABt/j73PsPFizbqFEWDAA/69/aX/1ds+qiiOIVqTQUXhZhOM3e
X-Proofpoint-GUID: Bw5eg4MYVx1V2QGu_to3Pl-KkSoNxwoV
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=68096e0e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: Bw5eg4MYVx1V2QGu_to3Pl-KkSoNxwoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230151

On Mon, Apr 21, 2025 at 10:18:24PM +0200, Barnabás Czémán wrote:
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
>  drivers/clk/qcom/Kconfig       |   6 +-
>  drivers/clk/qcom/gcc-msm8917.c | 617 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 616 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
