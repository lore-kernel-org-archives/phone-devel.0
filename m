Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA137FF5B
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640871; cv=none; b=BgcCn8C8b/jqmViHKEz1uFjqzHc46TvDCQuiUehHIp6TEg/x/2nflirFVRrgFae+OpiOm9EycMP7hA5o1ds38NaDplA6UF5tT+KTnV1fKYCKZM3v66nMjun9Hk8MGE/Kyc7FcLdtAW4SAcikx70Lm3lSPqC41Gzy9o7aKOFCkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640871; c=relaxed/simple;
	bh=q/6+vMvA2E4OZu3sbTJUXlFO5fj+YmxcRVRVtOtAQuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBFTJH6yOYtj/ZohhSnhq8zT7otAy9rm6+VuJiEOV/BcXlIm01D5aP7YIJ/thVqZHBPBfAuBY5m9F/E7b0MxG/oYF/+tICiHnyoPnOacCT0WztM7blaBR574pbFe6qk3a7IRucjPbpY6Wse7zGm3CzwRy4KbuKLTtQBEL8V0Uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDfH9+Cg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+NGW3J9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDfH9+Cg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+NGW3J9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2NqQ890129
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 19:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=; b=nDfH9+CgSmUTr/Jy
	DUyPM4HxcFXuCvnrg1gW8YY5wolyL5bmU/VZq1nOWa5t9lRzcrYw6t+Jjn7eJtj8
	qZ9T6/A0ZhwuZY026SGhK6xdzMrLfrFsvQHcEr0gFLIVbmOOMNbSAXBW2XRLpvFz
	huHSaUAAyBISbik4HoET5P6dwPYbxpv5lAPCzPY3oaPgiQCdo6wxkaf28n81rgJr
	pWIfGcCqezlnvSb7pfEqo9aGaTXCjgkNp2nfD5rat/r455oWdE/5XnftMV3Rr6Ye
	HM34D9oCwEjHsHUjUhUtTRm9IIbneprd3hDswPrVXKYQICCMPB4WssTfijCQ8xXG
	j+OPrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6ruen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 19:47:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so55623141cf.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640869; x=1775245669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=;
        b=Q+NGW3J9hHjegF1W4aEp+nrlIxN7xgGWhRwtwt5C/3q+8l2h0NWKcngBG1FlWb+uaW
         gqlOXuFikKA90iyOXY/marqbLkaZoVi9j9LI4h1sf/mY0eUGwBf+jj8xatux0PjgYFES
         i//wq9eTHvfIoXYc1pYgqoTnKYt8iT9DPY4ZrU3pghVg2Q/9KDbItWBwfAEGZ8Smi64D
         zh6iQLixQp5pWgAJ5yDnnFmw1j27cP0AEQCSICZCqSPhIg4iWKE8QxC8QBN+e/+dxFhG
         ECj3s1edSXXaLZqbEjiBOyVryfZiO02trFR5/+EbPuGE/dKVeuuiIrCosv8l+QGIKPN3
         V4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640869; x=1775245669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=;
        b=P+X/1vb1YsHuAEMRa1EPJd6+bwd8z/gqbkKkB7R6+V3net3d4Xf6Tk54+z2nYMzWtD
         bBjiQFbcVf08KU1bg5jPfz32lZRmpyiU7g1LojSPFTG1OKPWY85X9y3UAmXp5tE1hxlr
         yqRvKhsRqMPUXvdlY9t9kLHCAviSyeJLbmY7HcmC6myP7gHBFNiL9PiACYF+onO5cU5C
         uIkLHOvdOfnehHejnE++wxYqQUINGuJIzW3bqjxDaW94ZFvzNem04rpuqdyeR76Z9qrl
         tsIquufI+8R2BP+LitIafofzFarcIn0ep98JRl/OwDJ4eIUllwobBBRHTXyzMNzO5ccE
         JrGg==
X-Forwarded-Encrypted: i=1; AJvYcCVUpSPSxiNwb0LOKk0IJSOKxEM/DkHCFnVjuOLVFzZZQ2PK8FZdy9XwGzhzmKhFd2XvTD6qsy3UIGSvug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmREuHmQawk1741nKn4T95UrG8no7MEgZ5hi+dnPSE/DcNOd5y
	ae0G9aLrgfWsHAuPUvtgcGx+nC6AOnetZV6COumCraCA4IdLBHKD4UMi4Qj/wdlZOPhjAPzTFbM
	sZ8e+f/l2WJFTN0rsR/cLAJyVkQfKbKEya9ZpSPxBARC3W4cqgr+E/YpPQj0/fSDHbw==
X-Gm-Gg: ATEYQzwZaBDqWZp2QTTBlCx3xG6sVpu+7kEurJICxl5PiUP+ChxfUOLsRrR3r8UvgUV
	9V0aQbdLZPmJqt0mPccyRuIRvoaNacNvm5RsGCVDN4KXQ9siESKj59B3S1e+l/dUABjDDRNncXW
	pAxodT1F9q3qjAXHOu7BEp/so8ED2O596I0B2S1S1oSdhXeXUnwMLXRWt0bQopjzMXsCXW1nTpo
	1Qxj4D/4EXTIOw2cL9e+VhtblHFkfZEIk6lqY61gl0twuasEWcVD71WQpoZuSMHY1Gfti25Vh8k
	k3JEIAj9knGKI8C0wodFA4ZLHuR0e+qOI/BpzjEZksPPDWs+YL2+opmluSkxISaN919NBK3P2RQ
	9qJV8848X/7+My7ehtMeCvdT3RtU/dsfAiq/A1kfh7Nwzu9Cwmxlw5LRuEjPoCJQxAuw1dAZGcB
	8gV1PmX0KAtOD5/owhwttHDPCIFkIk6paQ
X-Received: by 2002:a05:622a:4812:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50ba39780fbmr53426871cf.56.1774640868704;
        Fri, 27 Mar 2026 12:47:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4812:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50ba39780fbmr53426511cf.56.1774640868259;
        Fri, 27 Mar 2026 12:47:48 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com,
        =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
Date: Fri, 27 Mar 2026 21:47:39 +0200
Message-ID: <177463970790.3488980.11725092140153098793.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
References: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6dee5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=3Bny_bJLngoGic2QnrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9O4e797n-WqlF0zV9SY3D38eBbQUnGwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX5ijrKwgPYu22
 yJQJh5k6fBZwH4aw3u+28k4c+aSIZ+vvw5ne4+Yx/aJeBjS9a7+qNqpC6MzSEU307KAIfDj+Ch7
 540+YoiaTS02zfwyepNiIZkU6asXR23PZ2L5Ny8ohd6uJ8ZWhSQtOHnU3pCWngwWY95ZE5T4gDG
 03BVa/vlpdn/kuxkVp9/39gtcVQFHVq5Nuxi0bC9prRATxVJ+YFlQK0vBiRi8ZVD/+IcAFas1tj
 Zrym3RYTaXpwYhQUsJqYsBe3xsc1ocJEhKR/LURUKhvoGj8hXPBC1tHupFpz8qrSdF/OmA/AELx
 WTK28VQaNZzOqOXTRiIN6CCLD/+zghfyu9JH1OMWCv3BSMnkTheUi3kvahIvQa11DlTKJQA13q8
 mAcrzOTLjt8e0J3Yr4baDgtL9NIOlHVCTS+xLB/Hv3fIU+ekwf9Wn8dD8QlgxJifkSMRI9/7deM
 BbvTEuyjBD5kkQcOyEQ==
X-Proofpoint-GUID: 9O4e797n-WqlF0zV9SY3D38eBbQUnGwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138

On Wed, 18 Mar 2026 18:17:00 +0100, Cédric Bellegarde wrote:
> dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
> at any time in response to a userspace vblank request, independently
> of the atomic commit sequence. If this happens before the encoder's
> first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.
> 
> Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
> invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
> values of 134217727 and 31 respectively due to unsigned wraparound
> in the (irq_idx - 1) macros, resulting in the confusing error:
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
      https://gitlab.freedesktop.org/lumag/msm/-/commit/961c900628fe

Best regards,
-- 
With best wishes
Dmitry


