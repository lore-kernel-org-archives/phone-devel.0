Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28E30C37A
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855033; cv=none; b=r7R8aJpucJ5xvU2/nd66OictxvX9ko1ORFR9FPwkVrtKygGIKJhIMgR5/JUjZuw7tKyzw7OLvVaHHzX5nBvWgM/er/u1aCqfc2YIQiw7r1JH1xADe1QxwW+W0pq4EgpdaHfRpkdAiwPvxakYDI+2ru3XdqXI7Eo/faKUwUEPZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855033; c=relaxed/simple;
	bh=QpmnyPKSYphBXQ3BNZGR9v1yJh3x6rWQPcykMSvpr+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuwTuP+MvQn72xFuxQatkavMNvBCBMrhPTBd0pFgaYndSvakaZuQu5SYAAHG+UbEEkkWDCjoLPY/57VYpcaCkyw253OJkx9D7eWEm7ieqY/d1IuUMYp1CJidM/ZdgVL4cyrqzz/VysyD5X/zfJw+xNpoza6CdWh2y8Z2gBt7Dgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7I1v6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hk2iWOMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7I1v6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hk2iWOMp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IG1dOM4024343
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 17:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=; b=Ej7I1v6mQDpfU1RP
	waImumB5aDTkym3zLDGgpNoG1h+qN92Ky8LkPVPWTAqYdNjvdDNJxKY6fKygfj9P
	cfjHufbQz4W7+jEwtFVwxQ1dtOJZSNJTCrTC8EulOSDa1xGonv2A+3ToDKGqIFbv
	LG8/9pgIgHYjWpp6pQC1/qmlUT2WvaGNdBMg0qhPJnO67hC1I3Hg7WdpIOL8jXTR
	I+1cdFbkKUjXHeTL63N1ReVqoN2J5INqLyzeuDQu7zynHYLKMCx645fon02qgoZS
	VXFTeiG5wqc08EBkMx0sQ1e2TQHsnYDW9G+uuIL1Zfh1u5et14CHIHS4Grcavh9r
	inyCsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75rc86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 17:30:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091ee9f1d8so3070011cf.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773855031; x=1774459831; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=;
        b=hk2iWOMpCNe32zvOoxtygQj7LbBilbM49dGteu+i2K7wdvJH9biFRGkMaa8QRGR7lw
         hZ97FMOlTv1NKpoG4k9mlDzrxbqCCDZZEu9EjHeZoS71Ot5JLrStXK1MPDsaBbQF/XLH
         /6aXLF0pPfdTsr1uc8sTjJLA8Gk3P84x34lhDmyYs8S1Dz9aCmlpa6SfSLZEI3ojpLWT
         Qp6yzTjRmJUFwv+BX2vJV5VabdQfwOtmkZkXP1mRyB77fFZIcb2yGpk2l87F6MaVaHTS
         9Qi147DREWdzp5obSELfjq4qavh9Y9Tz0G1Dr4hTvAVnauHF787Q5tc+MZSrMkMbGORb
         wXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855031; x=1774459831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsdUjT6QXWGlY4sg5HjzvLmam34NpmSGVzMoRHEEyJs=;
        b=INGKqR6wndC/i0k8pQ80ZetRlZaR9oq8zVeiINLvlUzauzNITvlZrQeLCg+XPgWHld
         6pGb0UN0H7MkAtr86vRElNVCtXicC/2H9hb1qSE9Tmmry3ApuF2c8je/n1pS0ObawTFj
         D0NrYpEs1CtY+nSpSuVZQJL8XC9lZnjjOz9QXcvPxNbyZv/lw4VW3uDisypY1UG5lDNh
         W8qOQqADm9228i3i2EVDJ0bXidiIW0MKlFiPqukXI8dvl1lSysm6To6stjV01ngwCpGV
         LNO61XIyEELO2VY9EMvisEYC5Yt0/Cl+ykg5yk/RKnW3+gIkcvjOJeFc3I9shH3YS9Rk
         IWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBl53NRaGA9DNkJDNayNQFYje4NMXPoZ3l0NSUsUVELiAZlbRQBtT9kEhvai2UPMLEbC6vOqqarvtV+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhPs0UnXqQ1E5zATYiSoYIdo03vZZdnwSK9gUTIhIfIquLnrK
	wTSFuCP6/OXfqulP/owI84laTQCfBSrPz8LXn1t/PS4lzB35UtZFdDxUtmi6bVK4Gc67inZFwld
	Rhc9dLrdiUjk+1evH64LnDY5Qv5TT+W8RE8Pg98RujeKNmgrCJIVdY4p+LJFQ7/YS3A==
X-Gm-Gg: ATEYQzzWEe/9EXtVZIuyeOTt7aJ9+Ndn9z8CPmAajxHsiEXt6n7oogZNepc/Aq7KZjn
	nTdyyqcc+eNc4ZXf6/ji3+RLayE1GAypF9ylaylIlWP94vccpGjYIzu+ecR0VkfBqNtMQiZA47V
	j4kCxHnc/4nN/CqyIqYLGkoYOlzQC/5cdJuVFPRH6ersj/8C4WIfe7W7HMul4/v3ZWGJ+G0+JlB
	yhHAfqqjt6k7YK86Q8YZYAofyJqAS7r2EqRwRaTm5i5oGLGkKEHGWOtnbQ7lE10oxh3a/myWqCr
	5D50uW7yxCfVDaINqJLcjaTER/F/BYimW+jKbpJBPBgxEb+no7QxF/xV+eyGwtxGt/CkzD5V8Y8
	VgGfqc7XDh6lKHkyC77Hgrq5rRz7oah3+Z+MTFqmtdLbL/FCBt65F58x5ECi4oHTgqA33fHeW7B
	1H+6VmfJ65RfeidnJmDYrmLBAmzMAVdM+8wgY=
X-Received: by 2002:a05:622a:612:b0:509:2231:977a with SMTP id d75a77b69052e-50b247666c6mr5308811cf.30.1773855030545;
        Wed, 18 Mar 2026 10:30:30 -0700 (PDT)
X-Received: by 2002:a05:622a:612:b0:509:2231:977a with SMTP id d75a77b69052e-50b247666c6mr5308061cf.30.1773855029880;
        Wed, 18 Mar 2026 10:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c11dsm687273e87.22.2026.03.18.10.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:30:28 -0700 (PDT)
Date: Wed, 18 Mar 2026 19:30:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?C=C3=A9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ registration before
 atomic_mode_set
Message-ID: <rydbi6teluxhmilj4bn47ds27i7uqsjtv4bd22s6cxpxcnt5fw@c6b5e6r7cxm2>
References: <ubxvfyx4tugfliwffrrlbe2oliep6nhp5dbpjry4vmamldz2ow@qncsubi7heex>
 <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0OSBTYWx0ZWRfXxLVcNlja48P1
 dJoxXVz5KhReWTJyWXvvDYSvGfeQwrdfQ5P2U4Dzf6x4W7gu+dYZ0N+1X/y1K6iIQLHxMOhgrFQ
 xZo3NE3rxOy0zSaHV+vkSpD8cAqpy4WjSQmdVTpx/TBfHmVPC5lWOWNLhumd6r/eK3+mWFD7x5l
 tZ7RTT4KQToa/pI5XxChs1C6OrcFvaKT7RpXmnNnUBhCv1jwqKnYI7Fc+i4ecwJ3KKi8OMoXqtA
 Mc0ifyagGIrYdM7sLZKawNiY05Wn2nGdO8Aqd66HHQUjhFEOTPj9HnsiKodve8tIzHH4WoGxMYs
 iBK8/TrxLBCa1OXRWBiM7KwDRIYRZ7NL8SA6ixOoLTD1ZDzTFQPx4Fdbz84mTQ9SWPATl1ySngr
 ujh1otiOiTmr0r6jx5elDTvicbdiBmxxlMviRcfjPyjh1bmbIADbs9eqRdR1LurS8+Ct5eGwXbw
 Tk1FEcOKBzJMhlENVIg==
X-Proofpoint-ORIG-GUID: dgiyJK6rnPGVgVHCNBDW7t9ZsDYbsHZs
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bae138 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=LCWlJkpBAAAA:8
 a=EUspDBNiAAAA:8 a=h7vFti6rFQqOaJsGGxgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-GUID: dgiyJK6rnPGVgVHCNBDW7t9ZsDYbsHZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180149

On Wed, Mar 18, 2026 at 06:17:00PM +0100, Cédric Bellegarde wrote:
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
>   [dpu error]invalid IRQ=[134217727, 31]
> 
> Since irq[INTR_IDX_RDPTR] will be properly populated by
> atomic_mode_set() and registered by irq_enable() as part of the
> normal modeset sequence, silently skip the vblank IRQ registration
> when the index has not yet been initialized. This matches the
> existing pattern of the master encoder check above it.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

In future, please, don't post new iterations as replies to the previous
one. See Documentation/process/submitting-patches.rst

-- 
With best wishes
Dmitry
