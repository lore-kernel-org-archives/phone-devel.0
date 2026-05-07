Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9243366073
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144962; cv=none; b=I4f+XkXl2wNWP7g3sNMnWE0RUqPNRnh4yt8yPP0yZvB6KWHm+HdP+SakSVJy7GP079Gux1qsoPN65nw0MowFN5FBlPtwFiMllkxHH5xQN5eu6U/WKi03xLUa13gQLG5ggmUA1f92rq/Lb1Czf5s0NSIpGRudFnKqe8R/M0AOAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144962; c=relaxed/simple;
	bh=Bfk2Frt3E7zTPbYxmZt4nXzn3/dE59B90Tlk8czzeVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPFtZ8NRFY1jFKPhAfCbFseKXNblVMXzOkGEdHaWU+Sa54eHtAiQAdCPYmsP8qPpUrsXED57TSBbQ6qnYZcQon8n2uAkOPYXY1vZPmWWU6XBU82nrhkTUJXF56lBxE6fYSKiGX8eTPo2yHswv7Pfix3QvwlSPVAzIBC4n6ublCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSy67VyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9WrrU8g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSy67VyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9WrrU8g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LEEX3463998
	for <phone-devel@vger.kernel.org>; Thu, 7 May 2026 09:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRlv/vWMWSGrGcfgYMRuEbAIZnTMixwhQUhla57tg80=; b=mSy67VyC6fv61xBc
	xL59k9x8r6RFhgDslfQzQhNkrQOL6TaqwDzdgZ2lbQtNhS9I8VXKySW0QSfq3G/B
	WH9jDkkaOBYwq5lRyRndPazgL4i+iJ4Wbj/WDaKr7Dq/DBX+R5iVrTs0yCx5/Bml
	GgeSZJz3zlr+dve2ckR+oAfHjQjKYBTMH6P5scEgcjhct612GWcjZeQ6qQKMfXDp
	2RA6rlHlidW8/lqELqxaSScIVTQFx6TkPHPUhKnB+riWPMWHwRiSIQUdF6y8fR1V
	vYkJUpHxhXGxnSR1E/DdA8DArLLAtITT8+H8RR24Hjneni3pxbrnWANeVeoalHDg
	lArFzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn1bpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 09:09:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5102a9671c8so13557761cf.1
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144950; x=1778749750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRlv/vWMWSGrGcfgYMRuEbAIZnTMixwhQUhla57tg80=;
        b=G9WrrU8gGG07myNzlqpAlVKBM4Tw1pehpBti6mJZ+KIUhMvQzmkgVl/DKtSS12qdmU
         3nfHs+7FMWgAAI2wr+CTAopQW5B520QMujPs+uuavpO6ZOlGYAMGcwIv6BQluojtTro+
         n7z+dkH1fx17+zENIZ1Qin77P7xpMmYfNQE2iX68ULo6Aocg7/A9yfrIrZaRDyUuPr3f
         MQDH2OFPumjNDOF7YmvvcE4lCsD3ye46oUpHozrfrvMD06KrpeHumHfv4g+Ia4Kmrid8
         KzvXXku8kUnAzS6dJIk+h6wg/2jM5vlzY1YmMDpkcAjRtpJ8vnY2RMZDutAlPNVKpNgv
         PDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144950; x=1778749750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRlv/vWMWSGrGcfgYMRuEbAIZnTMixwhQUhla57tg80=;
        b=mem99MTIH8OJ4Ge+okM3+iFCe4yfYT/O9WZw+KPjaP3LUX0R8GcIlF5lmeFCyECNG2
         kRcQDr3HF4xSW5TvT27FW8D2sCr0JdTi/0Xdu+mTMkgPcYsX1i/JUpgwwj+uSk7vhtPK
         tso/1uL8Zpz0g/qUDm2EWITGxNtZaoXMl0jpMypyaGthVgf5OeF4nFk2N3huPuAcNjls
         Qsu4jy3Lw7dJpawBwjx1vwzXLL0EOCEb8i16+VFeShMkAuoea39J9b5BHga83mbVw2CX
         HfzaHmTnxRW9q3R1WSfnLUG6hCeok8QmPEowtWnPImAVX8SwZfb/nu2HA7SCw9BpHy0y
         +fHg==
X-Forwarded-Encrypted: i=1; AFNElJ+nvHsQ1K6q4hZiOfD99afUHM+1ioKZV4AFPf5JoNFlMVDeLNCJdrxkfjS4K5EOJX9xdxi0D+RysxFJkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSfAv2BYDdUOssSNZvHbRn0mXkgiFREP7AcUaznhNo01ZaSfZ
	rxlrxQlV902gV5UwLQmt0h1ng0dUeFfUft70hBf5yCQVaEN38atVEQLWuue8mekk+hmyT0s6hjl
	MnRBSuRfSYhMksCVHk//eoZT3zCK+3P3dxFSsHN2PAoZDR4OCWb/2ct+/sgwxDOVN6g==
X-Gm-Gg: AeBDietBwfIsxKNl9ZADwk6LW50j4WY0LP9Re+P3n6X9v6icKLHBjJoAiS8xjGIB9Rc
	bYdasVSVsTablZTmupKvMf4/I7FjScxj3Wuuk4ao6NeOpnadAIunYnFqN7rrjLEmsU6Wvmk8NqN
	9is7eWdAtEsbzIMdsd0qhLFgtgzFM4wy4gX7CPqifHo0jVXQlVDZyvRYmvxgkX+W4L4lkxTKGGq
	tHtlsA9o0hxRGwl2WJeivioLIwT1jKv2a0q7NEfDlhyTxyTNe8Loa9Dw3+lEqCVx93xHDUVaFRr
	Crgce/4r5zo18ssXOTfZeHVcqjGgN5JpKccVfyskY0Gwc+RRS9cxDrGYger87+P09WVi9TcDPCX
	VSrFkJmBP+Jx5jM04dZ2M35d46BBEQ5Z3E6QWIUgXn7e2FNGXCMSicmYi9P0Ga1q1BEIm4m8gpA
	1ATNWNzMEwAlHy1ZVJMirsRygUcUBXR6iF0nRXcBAyhXiHYw==
X-Received: by 2002:a05:622a:2486:b0:50f:bea3:9490 with SMTP id d75a77b69052e-514621f48damr91366741cf.60.1778144950612;
        Thu, 07 May 2026 02:09:10 -0700 (PDT)
X-Received: by 2002:a05:622a:2486:b0:50f:bea3:9490 with SMTP id d75a77b69052e-514621f48damr91366531cf.60.1778144950157;
        Thu, 07 May 2026 02:09:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a882e3589dsm2004459e87.30.2026.05.07.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:09:08 -0700 (PDT)
Date: Thu, 7 May 2026 12:09:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 1/2] drm/panel: visionox-rm69299: Split DSI commands out
 into enable/disable
Message-ID: <y36bb3gilquvtkgcwwo7kti7efxij3tnjn7lzuv36g25eymfr7@kuy3xas4lcrx>
References: <20260427-visionox-rm69299-enable-v1-0-fa7d62d26d87@sigxcpu.org>
 <20260427-visionox-rm69299-enable-v1-1-fa7d62d26d87@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-visionox-rm69299-enable-v1-1-fa7d62d26d87@sigxcpu.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MCBTYWx0ZWRfX4UQTW3hPyX2+
 BWS1Ga2yHGNdYGY9ZzLRMiHGAmSKuQfEIhJ8C+GRiysdkk4iJ0esRVPJIcQ8bLXJKZ1hFQ41gte
 YRwlGi83pGykpfOngRQ0gup8Pc0LB4e4IbCfWjGZhGdOZ42jNSYY8OpRGvOExtWh952mWlzDpZp
 622PXRVpIVoUaXnxnPWhZK19nl+KAJR6mThKlX/yl4WUS1OQifTZolAcZjRdRRhPNWEq5o7ScSj
 QZyCiAmDzOezfTUjX+0mS1CRvd9vhLPezjpgHrDEflaTGeHOdFRDgdeMFi8rPICD4p7cHuXgAaM
 s4pQHOdc2BBJJqDHmSeRMomRpwbX8qAqhquKg4jWFGa5EaIbwDpf0mgialgycrbPKeossnudQ4J
 kXKRdQJ80tD2aOfZP6wb7TG7TeSjWdp4ZPOAivEA8PC3C97R2+HryTnLOatAnF417mtdWfbSZLE
 VWH4ZozQ/hUcg9whPcg==
X-Proofpoint-ORIG-GUID: L4F11uuzapPFfasTU0M_IQvG0yxnrju6
X-Proofpoint-GUID: L4F11uuzapPFfasTU0M_IQvG0yxnrju6
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc56b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ze386MxoAAAA:8
 a=P5i0MRGMJQ-gJ7s2cWYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070090

On Mon, Apr 27, 2026 at 03:56:06PM +0200, Guido Günther wrote:
> It's when DSI commands should be sent and it also fixes these DSI errors
> on every screen blank/unblank on the SHIFT6mq:
> 
> dmesg:
>   msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
>   dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
>   panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110

Unfortunately, no. There are controllers which can't send DSI commands
after starting the stream, which means that all DSI config should be
done in prepare() / unprepare(). Granted that other panels work, I
suspect that the issue is somewhere else.

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 77 +++++++++++++++-----------
>  1 file changed, 44 insertions(+), 33 deletions(-)
> 
-- 
With best wishes
Dmitry
