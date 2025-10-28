Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18E355021
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686625; cv=none; b=FqMBnOaK9xv0tY7b7UDXqr4kS5AZwb1vj/Hb3V6v4JJS1xdfr/ASMeLhQrdt9W81RWBYt3mojzEsZeR8Jga1E3vPN9R1QCCa3I8pGhpPeioA2nIsNWE4mQlRxcFOqN4p98UoPObEhr7RUidFwK7cXnqNp4YCgyURr7byRrUH8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686625; c=relaxed/simple;
	bh=WngYaf9I9c2jzvtYx4c/BLYwQWN7XC1wBLWZHDIqVpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0OZslvFzTvzQetadL0hgkeyYbwD+2V9u9Z+uD61+Co+Mk3ln3+GrIlmt+2V6DWmmN4wLccf0A6nKcPhGui7gMWJYnyFdw4/oLYBt+ItyL6ICaTQBjj/qETmdJWWrVbGmUJLc12i+r3+i44mFKRVTwmQZJNBLtXgM8AITqZ+2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7nBaMX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvuTF4Pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7nBaMX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvuTF4Pc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlc402503464
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 21:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=; b=G7nBaMX2wopTqieT
	FOuyo9eyoR2LoFSFbXdxnJSnyIK/gpHEg0nKoO8jmyBe2pEvVkBYmhBo5bd8vMg8
	srXwJ9KT7g1LW1oWa2JfIcip74CVBe6NhZ1PH1SywrMmz6sN+8MaLUH8J0Z3S19b
	vqSIboFmODQRGPBMXEo6hWW1N+bfyLZKP08rHjCvkkRsp5jaIrsIK9VZHy6a6HKk
	AJ7DrYyPJOGUZZnywXiLqhyeCVokPe/+P5zcOx8UJ0tBgUu9Emm+EVHhIdFKPIHP
	AtQ5lzY3Z9c8XzMd3OtsN9+HX+wq6tdFYSnjTGlmYEManY6r5bgK0zYqjT76F36W
	c2y2+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g736-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 21:23:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e89f4a502cso196933681cf.2
        for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686622; x=1762291422; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=;
        b=jvuTF4PcZ2WAEsKjEn5LHD3D6LHoi0mMjrauIaDJ2tynfqMSLzheoV56G3kaXOQ5ei
         J0QWfg5NiwvVtNbUzTZp+Js6Qfdl90ipKPzOiyg6dVBVAvetbHCcNP1l5Mc7KLZMMUC5
         soh2fQyjx3T60/Ri9goGaHZBWxdt017HQo+Jxhw0EsDMpYlIVu1dTX1UvQQb3BflYzSx
         80/BSvpkMxDhbarEE9Hf+fxM+p1WHGdLsbFEYLH4LMwdJ9xljZaw1kRSNq/TwhHxyZ/j
         ynr6a+AgAK7kO+RhcncnotFOrsShzJkTpNIlFluysPFSQv6ElYsQ7U5cu42MiuHr/jul
         Bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686622; x=1762291422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=;
        b=uWeFxF8Giq0LAtyNgxwM2LW3dU7mtauftbkOFBrNa+T4G3UJoJi6GMUI89YE/QkAgQ
         U16xsEsZlCv5kcImlgZNQdShZ+j1uMNj9LBdauFLhUR/qPbWbyf77JfRjIYFBxhyjXSN
         XiZdFf40wdTs+emL2ixMaQsvFr98iakSiA6pWu+Numd7OECD/4hpeqyt1EXRzvnqpupZ
         7SPTfq8jNzYsLRvOiL8XWUOYfqRqHorKn6EmvXvoa5rmbp4xmaVSvv1GLN94nvmYi96Z
         RNusNZ+0NMVe0hrghEmPVZEf8vMI0mjrb4wbTEcAsWtl8zv8txyRx4tw4+S1mf5iHR7+
         Pr0A==
X-Forwarded-Encrypted: i=1; AJvYcCU+0h98nr6s7dZaK+XprFF8kxSoyp3X8cl3JNLHdb1MAVgEfi+Fcg+s18wpRC07HxVehJloBq3XVxMdwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoXRts77ok7OM4cNFkQUnfPeMrkKAcZZfEPu2Gxkt4H0nZm28
	bFUyE3peSC2DSyozdJR7cY66lSim7O2m971bPcHnsIoZ+QgKIEAv2rDa2ZFCyBE20PECl6JXLDv
	jakzl5I7wWnjNz/1FsGGWzCXwaP1FSLF8C4BhuQMri7s9u1p04rfjSv7Oqa84vL+1MQ==
X-Gm-Gg: ASbGnctRNocus1uHXMtSA7RxSw14GIaz8QERMVwsD2eBv9uC6lghiU8K/O203sJSocQ
	Beft6eyi+G19QoZfAjoUgheNoqHgNIzqYTLSDcSCRnwnRgEedavQvBnOqOi9ePIWMAlqSTZL6hB
	NMD8q0FA47tEYpOEypP8aIVT/7mP1J4i1Tbug9gPFfD4Hnp/T97IBzgHLE6D714hrXXkaAa5MPc
	WZYUzzrhOCPOyVFpHuaBwGasVC8GPbeYM5AbAULp7jPtSmt6P5179gVs+mRf72F/vQ3iF616qeH
	027VX3XzECp13UVIiITxWF1H2t7KtA/MItB14Mq99X/hjGkZdBqSuOKe1FXIjiD0ARJ6s6y3aho
	D5+L8j6r7vyLSos3Xut+U1mfqrN4SMbyXQqRkfLDv+5oeS2YhIqhzRGBcyDhaHxxSGpDS+dE5yU
	Xc34UzrAkDFRJw
X-Received: by 2002:a05:622a:4a13:b0:4e8:afdb:6f56 with SMTP id d75a77b69052e-4ed15c4caa1mr10464121cf.74.1761686621628;
        Tue, 28 Oct 2025 14:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIxBrdIO7mfWQKtvDvRPRtB9L8H/kLm56MKcuYi7AAbrvZ0yHrj06ejtcwIC3X95uJDXxrIg==
X-Received: by 2002:a05:622a:4a13:b0:4e8:afdb:6f56 with SMTP id d75a77b69052e-4ed15c4caa1mr10463691cf.74.1761686621070;
        Tue, 28 Oct 2025 14:23:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f749easm3402826e87.89.2025.10.28.14.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:23:40 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:23:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        nicola@corna.info, David Heidelberg <david@ixit.cz>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Message-ID: <gmk7aho74xb2wwlc27t6qaozfnqsjjyccmzm5moe53tyzuwm4o@ri7cfoqz23ks>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901345e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=WrUPyqytC3nuxuxCNLkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=iBZjaW-pnkserzjvUTHh:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: 9xeS2K5j3fzdgH_HemLS-wXqp51ZhF5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfXzEpcZJID5NtC
 TITQoGMPPa46FSQgXmHyiDH77eKTe8fxoI+MFxKc6piImk/5yMGpaflxS1Fb1x8D42BZXwVcZjS
 Mtr4gzEu2c/z1AYdJgMZxWQWJQpJkTRIWbr2i2CSQaraRnOZaiu2J1/c+tU/a6AB1R/gbFW8Uev
 Ln/PuPbXvg/BD2KZNeFWAMRrHFtmCO56FVMIhG02ARPfVFdy2mWh7JB5S+4RH3pp2Vp9ijfck35
 SaCz5MIY+QdmKn15aM6CC5W4uKt8yPQEZiI9WjfXQslJMQCqtRkxTHu1izpHtM3Ps6vsxxHqMx4
 SqUhCR2oRO4L2M/BTgm3/44J1wSjOFJ1Jw755hVYJ3h9fcKLStLoZwqqAudo3MC3cVa+EWeI0AL
 TvLGt0DamYz25SdmWw/cMy4n+J3DXQ==
X-Proofpoint-GUID: 9xeS2K5j3fzdgH_HemLS-wXqp51ZhF5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180

On Sun, Oct 19, 2025 at 12:06:32PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.
> 
> The patch was reviewed by postmarketOS contributors here: 
> https://gitlab.com/sdm845-mainline/linux/-/merge_requests/137
> During review the patch was tested successfully on hamoa (X1E).
> ---
> Changes in v3:
> - Remove memset() after kzalloc() in dpu_crtc.c
> - Simplify error messages in dpu_crtc.c and dpu_hw_dspp.c
> - Use 0 for DPU_REG_WRITE() instead of reg = 0 in dpu_hw_dspp.c
> - Link to v2: https://lore.kernel.org/r/20251019-dpu-add-dspp-gc-driver-v2-1-30c8cb79cb17@izzo.pro
> 
> Changes in v2:
> - Fix gc register .len and .version in dpu_hw_catalog.c
> - Apply coding style suggestions
> - Link to v1: https://lore.kernel.org/r/20251018-dpu-add-dspp-gc-driver-v1-1-ed0369214252@izzo.pro
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 86 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 54 ++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 26 ++++++++
>  6 files changed, 163 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
