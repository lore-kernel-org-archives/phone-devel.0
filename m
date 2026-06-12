Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF432010EE
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248997; cv=none; b=Fwa3CBYtk2CJnUn4ttk2o+mCNXOTuy6yrKeGa1qATlXottBqCf2/0yWQPwVEJDS3GJdn5Rgw4Qn4pGF18R21N+JA2MMwekXPsv3un/3Z8v3rTwPutsm29ExOJAfAjjv/iQiW1hzdv6MonkloE+3YXcH84LD6vXMAF4vu2T/ucTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248997; c=relaxed/simple;
	bh=C6nioGT+ZISvIG1N+Tqgxip3eObb0+OwM7HPiYZlLMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB2/95DOXZtoMUjpWt1QkpKyMA+3syR/9T8evoV//GpOBKh9o68aeCTcGuKS39cGQamHJZE4dzGAjxmu8Ve6VG6kL7kaclRC+QRfhk7cDmduMZfNYxwMMqc/T3yBM+9GOQNSZmyEhkaTjijQLBwPblDSL4NxFgnXmF4+6+i0Rds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwKrzARM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JB3wACWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwKrzARM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JB3wACWP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BV2j2548102
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oi02IyzSr2sjg28TGbtMd8Pl
	3gIGWlHwztSqBTj9Kew=; b=hwKrzARMcTQhsrFdvIsZn/qzAlg7kEDPSZhEWjt7
	Z2byHXJe0EU9fhILDX6Y7/KJxV9io9bDE+aN3kY7JxgMRKhxHNVOipJ86zpR/4ER
	pYj3yvVpGw2OLYu3cdD0cNxJYWM/w6oDVH4k7/TyJO82o3YL+iMag6BIZpb9k/I8
	XSftKm1s771YfesjyHfyJaceyuL/EBm4tEXNEwqUFLeNNK5KDoULunbyVYHZgkDm
	/MEdAE5bCvZakblrN7mYe6H2jOpJcuJud6EFC5DzU1oxK8HAQ+LS1NxtN1uW+Bmo
	JjeKJkR+IU7fBg5D7EitRiZ1radArMrND+lLo5pFNpfvqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ut56e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:23:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517ac42d958so11239871cf.0
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248994; x=1781853794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi02IyzSr2sjg28TGbtMd8Pl3gIGWlHwztSqBTj9Kew=;
        b=JB3wACWPWxiLnLjpPPqLRi/lOQ1iGxtDYQZvL4cr991VZELczcIJlja0E+0NI8UnV/
         lDbQKUb545JjhJdQNwePGbrGiY0Sl7N+ne9m3s8luPTOkpOS7oVjpny2TsrJlKYxJHqg
         3KDbZ3ZpmQy2wSy5btSYMwJmymRFhHiC5SL0C34dvt/SimfL6sJ4GKVfNxjC53yiLhpz
         IVntTqcNTp2eWEyKcvv9rLdq5VU7UPW/h4o0HkW2PSrQjN8JUBXBrlxUGY6oqhdFXvAM
         RaVrc2/dxX41XmLgtsjt/GMdpt4lKO/jGTmDgFEevohRLpvEv9vSeOcKZkkgsa9gDKQD
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248994; x=1781853794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi02IyzSr2sjg28TGbtMd8Pl3gIGWlHwztSqBTj9Kew=;
        b=ODnMZa00w7Geg02b0/MjLfH2MZFuEtDjvPxexMO0HKammjcRuiwmeJdLRwIAUcnzS9
         8w2kR4+H4QRSQPIGdj6Q0/Ihb9yyTHJT6NCairk5AwL6psZ9xLbVVxoUcHDohGf8UOuS
         P+ZcpkBx9S4k2NuGkYWn3GjDFIv52AVY4c9MozTEXZQbOHAC5rfA8430lVlVRIWg5PDj
         EVib3ByKNPKBn0CDFMyP7qaeVB2/Va0N+/ImhMlDHe+6tqxhXxG+al9ZYah1CDaJLoxz
         xuMmNEhWbiPzMhmiZiM+fgFt4dhP5lA9EUGQYejr5CiQkDnD+uBmBJojV+jnD8Hi6+Pc
         c6lA==
X-Forwarded-Encrypted: i=1; AFNElJ/9oUyIH72Mf2RXpSUV4Mm3Mj4iPGcfSQ7n63VT0Ii7u/aVhm2BTckeu9ad6J6JhER05+Eg3EYg8Vxr2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOImTA+hVb9C7exeQ3N7+9st6BnlWdOWOanSoypNwjeb4Kt6Zb
	LaYuhX8zoytfok5UO+yILjJ/191jGCkB5TISZdx8qn6/YzVQEGzVh/Pjt7vv41Ywcb5wvS27Uay
	Wi+2VFdYhjfX9truXJJZYyR5qHkTAFCWDRGKKlBck5s2WEzYZ2+ukyLl6Y8rXyjE4ZcrS0D7dHQ
	==
X-Gm-Gg: Acq92OFDpJKYd9JK/qOYLOv7Xq3FNvJjq7HgSGRDq+9LkpjTGtgDY3cRugzcx3OusEH
	I/xZz2oe1gPiW5I6nnminA/8DrUZvNHu0xKb5Xv6qWcyoNbGgChIblNyj0Y+mYUqXmqTmYmsRGI
	658Kk6WxbhDjSKvFYTpy+jSqsTlJrBn6FkmZcSG1kQxqfrvZ3J22cychLEu67OtvoaD/3wCd/dm
	sE49EkYtUGRVUYF1rU7/2hbprcLD5/HgBAPbs+1sO4MwpkvNSS1dfbEy4F6YuGJ2iMY3CucZ5Ek
	fDGDPuoe3nM+PXjO/6Xgy73SVVjty/JbeDLreZ8CRU/Jr1XvQ3bp3JU9ISqvudSwZqGdtNyWnyF
	9rbT7MLcMSrRpCyaYWHoladhlWSD8rRvaLWWAVAkYhW9QLmFCLY12cyzygZGzeNS8HBUKCxO7NN
	H95xmHZnGbkEw7QsSQlgRAU8P91nN/prIUqj8=
X-Received: by 2002:ac8:7c4f:0:b0:517:71ac:83f5 with SMTP id d75a77b69052e-517fe1aa0fcmr22361221cf.3.1781248994284;
        Fri, 12 Jun 2026 00:23:14 -0700 (PDT)
X-Received: by 2002:ac8:7c4f:0:b0:517:71ac:83f5 with SMTP id d75a77b69052e-517fe1aa0fcmr22361041cf.3.1781248993841;
        Fri, 12 Jun 2026 00:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ee7sm297670e87.13.2026.06.12.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:23:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/mdp4: keep the bus clock enabled while a
 CRTC is active
Message-ID: <eopgalgvpit2o633qqma26nailhgmktuhdwhrthh3qgkyg7f45@qjcxwiw2x4yk>
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX60/14lAMxjJp
 GbDF0SE5AQRD3xu/s2QKYtU25DDBUL5DLGZRHvtKA9QHgxuDY/CDcQZjxLa3C1kvDyaAYXt36M8
 zHGVz8WSwGFQFk6dA0NmDZN6it/zn6U=
X-Proofpoint-GUID: eZxzZX9jtLJ0dilPvU3hfbfT8yyp41nO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX+KYD0pAkQ3ED
 41Pe7ATzibHHH/qZBbUyH/3GTakVdaBq3IKG4TKEBficurdlel7RndAJWxQLuVUkRmiOS6ytRxQ
 xTYI7+O2KTFXPQdzVmrwDp3QLdYLQqNsrWh6/HCdH6ZACqqKwIO6UVd85yvvnA3pzLA2OPtiBy5
 RWL6EuTfxSw9cVYJxzZY72SD8Cgvco3CtCS+z4EZ/YwLqymaAWKb2Be3PkKt6R9LG0bw2lm4a/G
 KTSopGTkVOwxUrSQu5/ALoNYEjqvFU5D3wq68F+SSPzfBHhoW/T16L6rz2HhRDimVdhTe4ukZjz
 dd0VnPrexyhCUGTd6b9zSsNBjbAJfombe+Zs4EPFhBGA3H6rc0caSTxn8XMVdYcwF8si06jts/D
 Phz/S64+jVRC3KRqYMb0MRpkfFjH729RJsIsRq02Nut/OfLuL37H+bIsi+PCvS5XkJdEufOMXP/
 0Pb/+D0ZmVaBXfJFG7Q==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bb3e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=DVHo1nXE2ezVO6JEMkYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eZxzZX9jtLJ0dilPvU3hfbfT8yyp41nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120065

On Thu, Jun 11, 2026 at 08:07:46AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MDP4 scanout continues to fetch framebuffer data while the CRTC is
> active. Keep the AXI/bus clock enabled for the lifetime of each active
> CRTC so that temporary MDP4 disable paths do not gate the bus clock
> while scanout is still running.
> 
> This avoids display corruption seen on the Samsung Galaxy S4 when the
> display pipeline is active.

Please describe, when do you observe a corruption?

> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  2 ++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 42 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  6 +++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index e8066f9fd534..9e53c9d956ca 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -271,6 +271,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
>  	mdp4_disable(mdp4_kms);
> +	mdp4_crtc_bus_put(mdp4_kms);
>  
>  	if (crtc->state->event && !crtc->state->active) {
>  		WARN_ON(mdp4_crtc->event);
> @@ -295,6 +296,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
>  		return;
>  
>  	mdp4_enable(mdp4_kms);
> +	mdp4_crtc_bus_get(mdp4_kms);

This is a bit suspicious. mdp4_enable() already votes on the AXI clock.
As the CCF has enable count for each clock, it should be enough to keep
the vote for as long as the CRTC is active.

My only assumption would be that the CRTC scanout happens for some time
even after the atomic_disable(), but without a description of the issue
it's hard to determine the cause.

>  
>  	/* Restore vblank irq handling after power is enabled */
>  	drm_crtc_vblank_on(crtc);
> @@ -137,6 +170,13 @@ static void mdp4_destroy(struct msm_kms *kms)
>  	if (mdp4_kms->rpm_enabled)
>  		pm_runtime_disable(dev);
>  
> +	mutex_lock(&mdp4_kms->clock_lock);
> +	if (mdp4_kms->crtc_bus_count) {
> +		clk_disable_unprepare(mdp4_kms->axi_clk);
> +		mdp4_kms->crtc_bus_count = 0;
> +	}

Is it not taken care by drm_atomic_helper_shutdown()?

> +	mutex_unlock(&mdp4_kms->clock_lock);
> +
>  	mdp_kms_destroy(&mdp4_kms->base);
>  }
>  

-- 
With best wishes
Dmitry
