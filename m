Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8F1E1E04
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 17:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250151; cv=none; b=r/z/AICtpJJQjVKgtOq/6trhNdZKSOJmh4dM5bnqfYcE9klimnfbWF8eDOs6Xdc1ydVJt8u86u6GWAuojR8aZX0gUKZ8oNOv0Bx0EQ5o6csZADW6jA2SGpj0To1S1yUSe2cmDCgygz4asQJsuLTT+JoGK96Tr++wynySwSbd7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250151; c=relaxed/simple;
	bh=j565nFHJHn1mebFOxFoCZYLC7GLbbGX08KLa29DuT3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU5WVzhLmrzUnGNb+TEMXsZh8srI/Hvtac0kQpIFGDeoMc14jPlBIc/eW9XaTXA6JY24KDiulMmo2ra/nCBpxBzkh1RWSNuj/pkdeRZWHIeXNGvwe8BY44OUrJxYhdhgXqjHqiJo+iJCp6oKMnytVywcphiwM4b8mOM08/eAG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0ZtsFbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eP3tu2Ia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0ZtsFbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eP3tu2Ia"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPR6G3763539
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 17:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muHpxzp0mWPMtZXrnlHeN3Ky
	e5NXimJKWqyDnE2yCnY=; b=V0ZtsFbpdQnnyNQFamV4ZQY28x1B0+H7xzHfvdLJ
	MnALC/9UVit5qx+ZzMPrbeDRG7efFVOvjTr4VXjDWThcL1MVP1eALYiSmvNs7SLN
	fS651V0Djfw2o/SOJNVWaOmscOz52uCppGfexd8ma8/R+cEvh6uM/gmEBVMmXy7P
	+zKWuZQYe0N0Tyh8O2k6WwtQufSu40SqEYTF+8yDE+pLEzcJeOHYVEVN4GiVMZle
	tw5Gz/FaRt4Rk+daGTIGRA+8U6GlzXN/De0znTnNS69V116ZiZB9gmKbmi/4sJwP
	UjHLjLEAVA0OdTuB2FPlcnODhcpswiVTLDwun78tFqchrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrt90ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 17:02:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88883a2cabbso91912506d6.0
        for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766250146; x=1766854946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muHpxzp0mWPMtZXrnlHeN3Kye5NXimJKWqyDnE2yCnY=;
        b=eP3tu2IahnC4cK755OC4vjuPhtw1Q8gSGBhJ+CaQgpb33O99spVBOjgmjpcz4bDW4c
         gTqv9+kkmdyRMUNUQHRt5gjBZFg35SjrdMPQLATwVNfUZruxbzKraX6KPorYh7zXY1zV
         j6f639PIC/NmXfCns4DHOQbGoSoriYbeFwxlMrsdD90vnRayHhSWkmWq0RdX/hAkBryg
         kg7UZMHgvj8uhyhOq+XxQSV5688WqAx8gZJUPhE4wNdX3I0U/yiMpXyhg/jcJKhJ32d9
         661OdDtZBtlX0ehX1RkQ00AGNjf6/5rm3ip1oB9aByGn+00R8QuAZk8S7iQLWNNZVFBY
         Dqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766250146; x=1766854946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muHpxzp0mWPMtZXrnlHeN3Kye5NXimJKWqyDnE2yCnY=;
        b=B6GGH7rN00nLBARwKkxLx8XfKiz7nYjDdQyuWA6n0yw56ADCd556VMGZ8wCTlfEJfW
         yhCyCM090GpuD3e9SO8YSoK1Xc+EQFshDkA7xvXoSbX2S2y+bU4xoYRDUQSb2SXyD5iN
         RfC55illtV9hKj5J5FnElFGJRoEMrfTz6Je/o9/6abzlXBYSsXQTqdxVNY+xcCDEuWuB
         biyWFqGqmOIsOWDVYRdspOLXkZQrjbdrG3fUnkbVA76lYAdiKdY5qizknseCtPffqcIB
         zBbFV2YmYGEGXCvWaPmdKUOeA3N3xwoHdJhC10d/LYih0SE74aPxmSn4tPopWu+CW/tZ
         bSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOB33NOotnQjIqGCyX7yvUQyX5MxbTMiEDW3ER5lQbDbsXViJB1jnVxEsoeFHk831qGIPbyd/FkqNJbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9yqn9bR6nPMqvjMJQQB7hmCw8PeFFlJnxi2oqmaq7NHFGLYp
	+pO48jOGa/PAlP9VKJplNJbm0XUQJkijQgyX+g7908yfDdfi2JrPqcvarfxg+s74hBETbHADXhJ
	bk13RyGGTrZf5tL8o9LYyXHKtrLXpE2WlCXzo/1XC+LcpIkli1tXRNFzJJxZbMhwGnQ==
X-Gm-Gg: AY/fxX4W2zZJS4rvrwoVi2GS695vXkpvn/k7gKVZRwX2qmVL8LJHOdcEhZyF3QCGsgr
	7xWwE262KZc1YAThgr1zICCTdTSfrU8JqEFBd1Rr5IYlh9YubobJrqbhRhwRmoaqHyUKp3THchP
	O6NSNDJAlBFP2LWZs4IjStAPtl3/ImwgHsO1eY2F2TzjhU6gWDH97L14RsL9bHyOXVxUexhxNdD
	+4uK6Xy5jHc3geZ8AzGI3mugG0DeLdcZ5UjyOS4gtWbTmO/hJ1GwHlk+DcYPT2mqofNtfx4TfaW
	6052WsZ3MzNg2hmyhO42F1IaJVM/GB7+8KCwI7PtWDya+k7LDqVlIHmFo0kiA7aTGwjbOAgq3U4
	hzVHn/muI7zgqiIB/xs7VmAFDSSD1j95rAQ72BmsijrDrS82ieuBidDtz2uKXxjJ1F5dHDz+MPg
	vKyAXkX7ptRZGOup7LLmzENpI=
X-Received: by 2002:a05:6214:5082:b0:88a:2b73:db72 with SMTP id 6a1803df08f44-88d87af3aacmr113092156d6.55.1766250146508;
        Sat, 20 Dec 2025 09:02:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg/1RBfHw+woAUc0vABdJ/opFRYi37tNkSwPvNj8QYal/2x+X0HQjAbtdaZCmo1lf7JXhkXg==
X-Received: by 2002:a05:6214:5082:b0:88a:2b73:db72 with SMTP id 6a1803df08f44-88d87af3aacmr113091166d6.55.1766250145815;
        Sat, 20 Dec 2025 09:02:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186f957asm1600493e87.28.2025.12.20.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 09:02:25 -0800 (PST)
Date: Sat, 20 Dec 2025 19:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 4/6] drm/msm/dpu: Add Milos support
Message-ID: <aez6lla3spda5au6krk7z65gbtis43ww7tf34tk6pyc6o53ulk@x64q7r43ddi7>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-4-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-4-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: 74Ap7vJWN_2MD5bawpgCTPoYCJ2VhSbj
X-Proofpoint-GUID: 74Ap7vJWN_2MD5bawpgCTPoYCJ2VhSbj
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6946d6a3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=-pIA5zGUeOoPg8vqJHkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfX6YkfYbk+haEX
 2K+tezdzrsorIeTPCE6QrhihMP/89TrbYGykzvftdGH6moybRmmUBIytVgdfNZ01UoKDua1L56z
 8WuZisyDS3cKHKLmp6ilasrvag52hOp58RiAJ96nTha9PKumC9VaYGrKdkwQvcOBUUFqP6OEAzm
 VsY0I96OrPB1Rjdm51akyaAi5vZ1l6NXK5gHsWMSBD+6HT2/GbqfEYzVT9D3kpY6MGZPpBWt9b4
 D8oPKMUJ9rGrKvdFCVwaA/iA5J9bjyN2PfMQsYONiaaH0JQlzapvIGid7t03FnilO7dP8sWkEu3
 5oYLo4My4LUt8WU4EEGzPy3vLJcO2cfKb1Kr8qbc7i8qu+CSg3qt48BIbDiu9lEwJVbboRaLJFw
 Nc8t36hDMZPShSs3/o0YnnAF3s3/RgrPcMVToaC7MqZEjwU6mvJrSH07CuVIAavunk5IX7zWQnw
 e62yn/6xOG1n3Lb4UDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200149

On Fri, Dec 19, 2025 at 05:41:10PM +0100, Luca Weiss wrote:
> Add definitions for the display hardware used on the Qualcomm Milos
> platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 308 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
> new file mode 100644
> index 000000000000..75deec923897
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
> @@ -0,0 +1,284 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#ifndef _DPU_10_2_MILOS_H
> +#define _DPU_10_2_MILOS_H
> +
> +static const struct dpu_caps milos_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH, // OK
> +	.max_mixer_blendstages = 0x7, // OK
> +	.has_src_split = true, // OK
> +	.has_dim_layer = true, // OK
> +	.has_idle_pc = true, // OK?
> +	.has_3d_merge = true, // OK?
> +	.max_linewidth = 8192, // OK
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE, // OK
> +};
> +
> +static const struct dpu_mdp_cfg milos_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494, // TODO? maybe qcom,sde-len = <0x488>;
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 }, // OK
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg milos_ctl[] = { // number of ctl is okay, base probably also
> +	{
> +		.name = "ctl_0", .id = CTL_0,
> +		.base = 0x15000, .len = 0x1000,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9), // FIXME?

Why is it questionable?

> +	}, {
> +		.name = "ctl_1", .id = CTL_1,
> +		.base = 0x16000, .len = 0x1000,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	}, {
> +		.name = "ctl_2", .id = CTL_2,
> +		.base = 0x17000, .len = 0x1000,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	}, {
> +		.name = "ctl_3", .id = CTL_3,
> +		.base = 0x18000, .len = 0x1000,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg milos_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0, // OK
> +		.base = 0x4000, .len = 0x344, // OK
> +		.features = VIG_SDM845_MASK_SDMA, // TODO?
> +		.sblk = &dpu_vig_sblk_qseed3_3_3, // TODO?

Yes  to both.

> +		.xin_id = 0, // OK
> +		.type = SSPP_TYPE_VIG, // OK
> +	}, {
> +		.name = "sspp_8", .id = SSPP_DMA0, // FIXME name?

ok

> +		.base = 0x24000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 1, // OK
> +		.type = SSPP_TYPE_DMA, // OK
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 5, // OK
> +		.type = SSPP_TYPE_DMA, // OK
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 9, // OK
> +		.type = SSPP_TYPE_DMA, // OK
> +	},
> +};
> +
> +static const struct dpu_lm_cfg milos_lm[] = {
> +	{
> +		.name = "lm_0", .id = LM_0, // OK
> +		.base = 0x44000, .len = 0x400,// OK
> +		.features = MIXER_MSM8998_MASK, // TODO
> +		.sblk = &sdm845_lm_sblk, // OK
> +		.pingpong = PINGPONG_0, // TODO
> +		.dspp = DSPP_0, // TODO

Yes to both

> +	}, {
> +		.name = "lm_2", .id = LM_2,
> +		.base = 0x46000, .len = 0x400,
> +		.features = MIXER_MSM8998_MASK,
> +		.sblk = &sdm845_lm_sblk, // OK
> +		.lm_pair = LM_3, // OK
> +		.pingpong = PINGPONG_2,
> +		//.dspp = DSPP_2, // FIXME?

none

> +	}, {
> +		.name = "lm_3", .id = LM_3,
> +		.base = 0x47000, .len = 0x400,
> +		.features = MIXER_MSM8998_MASK,
> +		.sblk = &sdm845_lm_sblk, // OK
> +		.lm_pair = LM_2, // OK
> +		.pingpong = PINGPONG_3,
> +		//.dspp = DSPP_3, // FIXME?

none

> +	},
> +};
> +
> +static const struct dpu_dspp_cfg milos_dspp[] = {
> +	{
> +		.name = "dspp_0", .id = DSPP_0, // OK
> +		.base = 0x54000, .len = 0x1800, // OK
> +		.sblk = &sdm845_dspp_sblk, // TODO

yes

> +	},
> +};
> +
> +static const struct dpu_pingpong_cfg milos_pp[] = {
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0, // OK
> +		.base = 0x69000, .len = 0, // OK
> +		.sblk = &sc7280_pp_sblk, // OK
> +		.merge_3d = MERGE_3D_0, // OK

none

> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), // TODO

assumingly correct

> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2, // TODO

Yes

> +		.base = 0x6b000, .len = 0, // OK
> +		.sblk = &sc7280_pp_sblk, // OK
> +		.merge_3d = MERGE_3D_1, // OK
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0, // OK
> +		.sblk = &sc7280_pp_sblk, // OK
> +		.merge_3d = MERGE_3D_1, // OK
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +	}, {
> +		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
> +		.base = 0x66000, .len = 0, // OK
> +		.sblk = &sc7280_pp_sblk, // OK
> +	},
> +};
> +
> +static const struct dpu_merge_3d_cfg milos_merge_3d[] = {
> +	{
> +		.name = "merge_3d_1", .id = MERGE_3D_1, // TODO
> +		.base = 0x4f000, .len = 0x8,
> +	},
> +};
> +
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg milos_dsc[] = {
> +	{
> +		.name = "dce_0_0", .id = DSC_0, // OK
> +		.base = 0x80000, .len = 0x6, // OK
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN), // TODO
> +		.sblk = &dsc_sblk_0, // TODO

Yes

> +	}, {
> +		.name = "dce_0_1", .id = DSC_1, // OK
> +		.base = 0x80000, .len = 0x6, // OK
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN), // TODO
> +		.sblk = &dsc_sblk_1, // TODO
> +	},
> +};
> +
> +static const struct dpu_wb_cfg milos_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2, // TODO
> +		.base = 0x65000, .len = 0x2c8, // OK
> +		.features = WB_SDM845_MASK, // TODO
> +		.format_list = wb2_formats_rgb_yuv, // TODO
> +		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv), // TODO
> +		.xin_id = 6, // OK
> +		.vbif_idx = VBIF_RT, // TODO
> +		.maxlinewidth = 4096, // OK
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4), // TODO

Yes

> +	},
> +};
> +
> +static const struct dpu_cwb_cfg milos_cwb[] = {
> +	{
> +		.name = "cwb_0", .id = CWB_0,
> +		.base = 0x66200, .len = 0x8,
> +	},
> +};
> +
> +static const struct dpu_intf_cfg milos_intf[] = {
> +	{
> +		.name = "intf_0", .id = INTF_0, // OK
> +		.base = 0x34000, .len = 0x280, // OK size=0x300?

I think, 0x280 is correct

> +		.type = INTF_DP, // OK
> +		.controller_id = MSM_DP_CONTROLLER_0, // OK?
> +		.prog_fetch_lines_worst_case = 24, // TODO
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24), // TODO
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25), // TODO
> +	}, {
> +		.name = "intf_1", .id = INTF_1, // OK
> +		.base = 0x35000, .len = 0x300, // OK size=0x300?
> +		.type = INTF_DSI, // OK
> +		.controller_id = MSM_DSI_CONTROLLER_0, // OK?
> +		.prog_fetch_lines_worst_case = 24, // TODO
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26), // TODO
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27), // TODO
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2), // TODO
> +	}, {
> +		.name = "intf_3", .id = INTF_3, // TODO?
> +		.base = 0x37000, .len = 0x280, // OK size=0x300?
> +		.type = INTF_DP, // OK
> +		.controller_id = MSM_DP_CONTROLLER_1, // FIXME, only one DP controller?

It should be INTF_NONE / MSM_DP_CONTROLLER_0 for now, it's an MST
counterpart of INTF_0

> +		.prog_fetch_lines_worst_case = 24, // TODO
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30), // TODO
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31), // TODO
> +	},
> +};
> +
> +static const struct dpu_perf_cfg milos_perf_data = {
> +	.max_bw_low = 7100000,
> +	.max_bw_high = 9800000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 35, // TODO

40

> +	/* FIXME: lut tables */
> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0}, // TODO
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff}, // TODO

0xff00, 0xfff0, 0xfff

> +	.qos_lut_tbl = { // TODO
> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> +		.entries = sc7180_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = { // TODO
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105, // TODO
> +	.bw_inefficiency_factor = 120, // TODO
> +};
> +
> +static const struct dpu_mdss_version milos_mdss_ver = {
> +	.core_major_ver = 10,
> +	.core_minor_ver = 2,
> +};
> +
> +const struct dpu_mdss_cfg dpu_milos_cfg = {
> +	.mdss_ver = &milos_mdss_ver,
> +	.caps = &milos_dpu_caps,
> +	.mdp = &milos_mdp,
> +	.cdm = &dpu_cdm_5_x,
> +	.ctl_count = ARRAY_SIZE(milos_ctl),
> +	.ctl = milos_ctl,
> +	.sspp_count = ARRAY_SIZE(milos_sspp),
> +	.sspp = milos_sspp,
> +	.mixer_count = ARRAY_SIZE(milos_lm),
> +	.mixer = milos_lm,
> +	.dspp_count = ARRAY_SIZE(milos_dspp),
> +	.dspp = milos_dspp,
> +	.pingpong_count = ARRAY_SIZE(milos_pp),
> +	.pingpong = milos_pp,
> +	.dsc_count = ARRAY_SIZE(milos_dsc),
> +	.dsc = milos_dsc,
> +	.merge_3d_count = ARRAY_SIZE(milos_merge_3d),
> +	.merge_3d = milos_merge_3d,
> +	.wb_count = ARRAY_SIZE(milos_wb),
> +	.wb = milos_wb,
> +	.cwb_count = ARRAY_SIZE(milos_cwb),
> +	.cwb = milos_cwb,
> +	.intf_count = ARRAY_SIZE(milos_intf),
> +	.intf = milos_intf,
> +	.vbif_count = ARRAY_SIZE(milos_vbif),
> +	.vbif = milos_vbif,
> +	.perf = &milos_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 9f8d1bba9139..4d5b57d6295f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -555,6 +555,26 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>  	},
>  };
>  
> +static const struct dpu_vbif_cfg milos_vbif[] = {
> +	{
> +	.name = "vbif_rt", .id = VBIF_RT, // OK
> +	.base = 0, .len = 0x1074, // OK
> +	.features = BIT(DPU_VBIF_QOS_REMAP), // TODO
> +	.xin_halt_timeout = 0x4000, // TODO
> +	.qos_rp_remap_size = 0x40, // TODO
> +	.qos_rt_tbl = { // TODO
> +		.npriority_lvl = ARRAY_SIZE(sm8650_rt_pri_lvl),
> +		.priority_lvl = sm8650_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = { // TODO
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +		},
> +	.memtype_count = 16, // OK
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}, // OK?

Yep

> +	},
> +};
> +
>  static const struct dpu_vbif_cfg sm8550_vbif[] = {
>  	{
>  	.name = "vbif_rt", .id = VBIF_RT,
> @@ -725,4 +745,6 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  #include "catalog/dpu_9_2_x1e80100.h"
>  
>  #include "catalog/dpu_10_0_sm8650.h"
> +#include "catalog/dpu_10_2_milos.h"
> +
>  #include "catalog/dpu_12_0_sm8750.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index f0768f54e9b3..1f6b14f1c4d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -749,6 +749,7 @@ struct dpu_mdss_cfg {
>  	const struct dpu_format_extended *vig_formats;
>  };
>  
> +extern const struct dpu_mdss_cfg dpu_milos_cfg;
>  extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
>  extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
>  extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4e5a8ecd31f7..7afd7dc7a0b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1505,6 +1505,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  };
>  
>  static const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,milos-dpu", .data = &dpu_milos_cfg, },
>  	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
>  	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
>  	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
