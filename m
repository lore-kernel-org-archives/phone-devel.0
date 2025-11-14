Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8413115A6
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118202; cv=none; b=IJdT/stizNgJ7J0kCNfvDBGh7ODZ7IeCxeyzZKuJ//kJfDxSgHL1jzbIpNw9Ah2JtVmqTZxDUELRvSp1lT+/Gyai8kY75zsGl0AltTSYEncltjOHBPT3cRoW3jSPDjwxk49YrYsxlMjWI695/A3mPRxyvnAVddVxGG+AO2AXHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118202; c=relaxed/simple;
	bh=R8sjt2St83pI7jLwxENaicoaRphX9gMIqOZGF/00aqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC/m6cprfeuw4hlwWTt9CGTVIpWZ8vfeThFMUYtM1ErFZR3xIsJhfzY1fKj9UExH4C1vmCoAdkE2g5P5CRmY0mx0BZZgMdZI5vtXDlj1DxhQYCJ5vrCkKWl32w+dI8vX5TTohz+wiWysaBZzWBJD3I4Dzok/Ao8aNbtGpLAsie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf5NkDbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhIck5t8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf5NkDbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhIck5t8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8S25S1431744
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=; b=Sf5NkDbsIzoxNN0g
	fio1is6hSCp4F0VbBAhVOImlbSGrtkPsPOnykwY5S6C3X3+DXOvTi5vxmmfSaosg
	PV6wf/0NoqTkha1yJ7E6P4BC0gB1++ENh49zU28tEaqZwM6SbEy29EHNqwwWH8Cx
	+3X8F0SyZln8FE1mRP3LYwY6U2d30/pkkSe8iTrJARyUCizFIo7DjG2asuIm2dhY
	ogKE7tL3HTflIEoBqJ9CAfaftWU7zr6I4pUZ8H4YB3bQWCX/abr/R1vYkj/2NGZ+
	bnJjU1pzQYmnVkUuiwe6Ehm+wewO7ZvtBXoKBszjWw9IGTJ0xPgmvCXGs1sXm8S+
	iJqcGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1vq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:03:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso56228111cf.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118198; x=1763722998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
        b=UhIck5t8OWw2qBKV6CJGFShetgbE4+0O/NCeqXf49sp8LFdx39f8+shxa2un6TVng0
         vvVsF+cZ5BllxXCV6mAVKkx9gJSTC3vlMGbbmWumfNuZVcmIzsV8O9tMZTFxnXJvXXmL
         WC75RiKXRG9h5zxqB0zBPNDs/Avrgyq4GqkJQOQnZDtsMhMh+mC60EMHPUMn7e9W10cU
         4bIe7YPzxc5E4qBooWOynfLwB9CbXqmHNTALq0mw4lpsK6KTK7/J74F4Szx77ji3CEZz
         ZqgCYVnzLaItjBrdN1aMrqH1sIWPBqb5odo7XRS9TS3V9RoHsyOVhs2YARPrFfaMakf7
         nX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118198; x=1763722998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
        b=EHP785juoGD3XF266q4eHpjWGArdkwQLb/gdMRV5XiVxOxHTRBQq57rTgyZKdyNtaS
         T5QwQJi8B0GfhcHTas4Xv537WsE2PZvBNywdldmJVnstj4EOHnM+o2KGm4CuAl9+ekIp
         PEGbf8A+EPKfiyXN0oRB4s3o0pNj5pUaXkrTMRVy1JH1gr1zoI9KdaM31IdKQhdwwdAM
         DYcWuOD88WWMEyfxUdtmHfQ1bOWp6MwOmOt2nGptLd4/QNAaOKyCVuThch3xV4WDfviK
         F9aPTL6gLaUQL0GLJjbunrSCq2WalAm2VxltPFmyh7ZbUinTdTlQm24dNVyPmMlbnK1S
         nqFg==
X-Forwarded-Encrypted: i=1; AJvYcCUk3IGXkHeKnNEO+VHrxFhH6U3NSQqwj8/W9QdsTHr8VeskzmOAiJMvCkTFLyRv+ykTlmLhpMogr2X4Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQHslCH381/0Hnnc5H/jQEKjzg8ojhVmlFEuzY3DnI4t2yER2
	YZwdvkmUNz0ODX0YWCMwfL/PVdeT3DlO2YH/wUVkOXbf5dlu8Z73D2ywbzGbym5+I703Kxs9NIF
	InFkxHgA6T1nL6m75876HpKWqHJX6kWjW6aYg1mMbYdaaAWn4iVTbHWSW4dF37wLzoA==
X-Gm-Gg: ASbGncsa1abMtiPSM2og6x1OaWrs2EEUlelxio924C005VjqROxmU5AJ8kJ2uEoFr/K
	PWfqq29SK2HurFR4zh56btD67u9aklnET+L945u86ZjCyedqDM7HBkKRLxzbeSO82FGKAJNF0XB
	uE5yC60m4E1vsp+GMNTeaMRkR6mzDYFHHpY0H/29/o2kT1pOYE7GqRTI45SYHjItuQ77I9J0DEL
	9Y/LZAF6vqqrClAGSK5EoMqs9eWOKJbXAYGWIXqW5n1SJUq0teXEuqQEJjtfJmty83iM4g2MGcx
	OUd6CGnDkvxIp5ZLRGJqkFIZ9BSJI/VoKAseHNa4cC9D7EOpJDfuxbo1dn2RZYQDE+BCTH9mbmB
	p499CXlsNXHDGiHn8wWde4FkPGZ6/qVYlzB31lebenuqNd2gs060PgDE8SoZEAB5wDdLdntfC3k
	pnhRGX1DZ013c0
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4edf20a3de9mr40782421cf.23.1763118198142;
        Fri, 14 Nov 2025 03:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnk790PmVPOn1c7OeBtDwurCO7QZI3gzzVeXmoG8GqrbzlotEwQFNkCiIoA940ETO47ZtSJg==
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4edf20a3de9mr40781771cf.23.1763118197632;
        Fri, 14 Nov 2025 03:03:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ced4adasm9135771fa.26.2025.11.14.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:03:16 -0800 (PST)
Date: Fri, 14 Nov 2025 13:03:15 +0200
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
Message-ID: <ac7fri2okl3bvzvfnjxg74x5gekn74ii5sslvldfw4ioan57bj@w63zkvngpi4x>
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
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69170c76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=ZFu0rgk015Nm-26e0XUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX8Tkv1+jx27iw
 JdbPb5/PnEEAudzeiyKVIZwvgjXmiJKdebwEnZSoxJwhmETtGTaEBjetrC/H/Jh0+fzX+JWvQht
 dd1CyvmpeVYzUtYHbbDZxnfpxqVJKmOdc8YmD4VzR9oB7snx0/7XMNi3S/fAzukudWV6dSJ0tgh
 JUecqTe6ko/VcYB7Y8Vr0hRit+ozGef+28lSXCTJwZqAvKYMAVmlbWXTxjJEvEAsezUse382TtM
 omUHqU0hZBvZC9YV05y6b2M19tZtbY3Hf3Y4jFvzClRvyHvc4s9RLgot7uZoT73sVbX36U2wY9A
 8b0RTIRCWgofLsh0vgMNKKLBrsS/Zn6N7RuJxiyZI5WqtSPdcL2uFKxvf/oTJnJTPc5HX/4kbht
 2A7tlM6EDeVeUPueBYc1XI6PKOvIUg==
X-Proofpoint-ORIG-GUID: 1phPlpppfd_3a5b4-c6HJVq6laoomVXj
X-Proofpoint-GUID: 1phPlpppfd_3a5b4-c6HJVq6laoomVXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087

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

This seems to break several gamma-related IGT tests. Please consider
taking a look, why are they broken by this commit.

-- 
With best wishes
Dmitry
