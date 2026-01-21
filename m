Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB323392C2F
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038100; cv=none; b=nTcYclFkE/akIb1rWtMlJjDsGiCx7PC+/lAsnp1wisBg51NKpC5Alqs97KwKgj2GD7Lpx44yblqJ1D/6iC+a1pDaOeBwIJyqAH6SLKVueferYn3g9GXJTvQjc7dqlwqpgXiD9OTTs90vi4tCpvKKJ6TIzMT5ys6l2qgr3ZJ4ct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038100; c=relaxed/simple;
	bh=Xd/bUR6GSxx/NQjlNNdkWM8C2bxnPMSGrkWJuJSHrAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pawR2pgmVbA9fwrQEYC5EoAGcRnkGZNsJ2j2fLluapTHLqU/srV6dTdxP+OAXxkGdmo7F+al2ziEWE6TJwmqOz6FJzTQReZtWZdenPnLL/919nrOxARPJWsV2wXy2xwV+PI7cEgXOySPqr8QyB4w4E4Ce4lOPPVeOimPLI8GJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsYJEeYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bf107Poy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsYJEeYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bf107Poy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMHLTM2277806
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 23:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=; b=LsYJEeYiZi+ir41k
	/M/p7bmy9BEKyhWDeC7X1Px29QRBF022A4oM9VxXfFdXLw6K+6YZf7QSM9jfN8wz
	yB8YPz1qsU6aJd588a6ip/C+gEAB/HvaW2y46b2BgwE0cwJyCqFisqoI8rlc1bRA
	NjHtqU9lPWMBrNUcljNhFJtHnTS0QlNfvA/ksPLUsxRpOTJhRjmzfNo1GfyC/Fny
	mnkJpBLhWWestCkx+Oe7CCz1IJFjHxPuP2e1nWfcrs3x9h9rJRYOe5Rse7WHJ8lU
	Xe2fBsXNXzxx4SOeOltJ7QPkmgoFbt/nzz3hq8C3N84SQFpuf7NhLaRoJxbumDAL
	c2rAYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7far5uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 23:28:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd47227so70339785a.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769038096; x=1769642896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
        b=bf107Poyb0syVvjYhstsMkJBVxHCaeiJ0gok+T0KNmM8b4L8GCgTiZ59ZkIALCn6Jd
         YDS+/4Af2E1szgYpX57kwty0j6Z0Wn8EOQ2oDenYv8y5082Gj854oHBW1AQI2+k3gcqb
         zstevTN6Tlpchix87OiVr5I/9Yt5bD8IICJTcbMRYSTkG55UypxHKDfGH+rBvgfgrJgB
         x5RQ89K4UO96VodUUd140xYi22TeLMgn7gW1oaDL0NMyHk6epVUZ107mF16k+UQrXQmw
         OWzOO9LB8AEWwde/H2AC3AatshOIIthSDGpKgauVcaAdAMbI/C2kuNnVjs4UsUjjMwbB
         phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769038096; x=1769642896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
        b=mOY68yl+eJU9Ss7BDBMBJEsqNMwEy0ByaQIdggr9UjIfyNLP7FgRjNvBfCHF4BAMYE
         BYREnKtoCr62VdTBCrsITPEZ1hNu9uKeeGpiDiKN3pna5wx+fJxst2IpSSIxsPo4OiMu
         jI9tkcdVlG3PGMiWg9TZn+KEt8fcKFCBr8NrCaOzBcHpyuNcpmgpNE8A5UUb0x7JxEWC
         1PPOTfQ4j4QeUKa08YyUlmnEg2M4eerzheehGbz/QcVasDjbEiPf6aXZtG0m+evSuGwp
         RcWJ18i9qP5v/vttQ0b50tsWT4lmACxUEN7105zSeaCAqjekiqa8bsTiBP7t3ZYn+Myl
         y+6A==
X-Forwarded-Encrypted: i=1; AJvYcCVwfTBe6YCnPa9KJ87uf85rMyRjc51CgXVltlitR0tQd1aoUeJ8sE+rHJRkWzJCNktFwy/nbFP5FCb7zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTkxcNzfPw1aHHGKoduXvu6kuWYw5YF6lk9BAVS2s0m4OWKgC
	PpsfAkUROZ8UmXsrWgvKJcU/74XGAxG/0rrJywYEbedQWhRzu9n83Goc5jVihva1URkmiMNFTWF
	jHChROPwDyoup9AQU0dOIz7TemxKXYYCT8qqvF7sP+4OQLnk0d62Gdv2zC3qOyoH2OQ==
X-Gm-Gg: AZuq6aIMbPk6Prul7hbHhrTQK+dxeNDKtqXU0QAEbkMX01w8NxXQXWh1Wj50UIwPnsq
	E0khULLRwR8b5p/+LljXAzDZl4QRfyDw9kJFpp33oXZ+9Ir+am7VnJCDAaO8R+FWJg+zgc78eiM
	9Ym3SrA7Vszo6FlcFyRSbJP9WEcA5AsinmcyC89uD5/mi3kuGqmAgO1+U5MlwFn/6KIZY+9c3bJ
	28loAR/lTmto4Yf7R4oIPlErgucZfzz+F8STQFmiHbmyCOIK8lNUlhd7WXarwmFzeMFMfp8Z1bW
	uM4bQZ+W6S2zlA9cGJ2SJ++5G9oBXQOx+jssOBkfYUn3EsHOJ8IfjIxb8ex6Kvw2ryxy79x57cM
	xR2Exp4VX10bWUyM/zeSVL3Gd+lfEsH0JjRI8bgV1HnXoYoAL8IR133eoSlFzK5pKwDm0FxFtAH
	NNzvAgxs4frwtZ6VoW/N3JRRA=
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6a693b459mr2526856085a.49.1769038095924;
        Wed, 21 Jan 2026 15:28:15 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6a693b459mr2526852285a.49.1769038095495;
        Wed, 21 Jan 2026 15:28:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:28:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        nicola@corna.info, David Heidelberg <david@ixit.cz>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
Date: Thu, 22 Jan 2026 01:28:11 +0200
Message-ID: <176903808261.3665431.13908299143545119394.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69716110 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=nOrPF5vehO7w3AbniEYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfX2wOCF/oyqQxF
 8o0ZLoNyulIpyryHM9XX8+5E72dt4zicjTtibfi4lcwxtYg435lqxwa6+fHQujD1Xe5rqrTv6hS
 Nmzeib4kq3XJdOtDsbfQC0RLz7KC2TzNFhp01fFqOMOri1065CfM3zsB7/ZViURSGPpAJGWHkpY
 kYvPscKM/h8QpAVVKcf/uGaT5XORuS1tlwLeQ2pl47MAbO0Ux8fjvB9vCiB/Fdmm7yINFoAs3Dz
 g8c5F9MhSiEOGnWMal5UK2nZdq1kAyqLlXz+1F31eB2ONYlFJyija2Ir+3TM9ZlW7C3cfIKKk/+
 Wk7Z/4rOLHfZQShlSFQuebwkny8ef9fnt0g8Ht4GlaXuqrYYMRWaHmlgwcK0M07Kcrndmr6CBhR
 QynjYXxc9LJn78GFuZrhVJsiFDVJTsv6B+y2+dAEgvbSFJOpz6+1ZHQ8P8BcQneXc0e96v2AflH
 FlUsUVolB7hNcTHtwUA==
X-Proofpoint-ORIG-GUID: w0W0kuVwhHK-thECd67SNGQQiIIYz0-f
X-Proofpoint-GUID: w0W0kuVwhHK-thECd67SNGQQiIIYz0-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210197

On Sun, 19 Oct 2025 12:06:32 +0200, Federico Amedeo Izzo wrote:
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/39a750ff5fc9

Best regards,
-- 
With best wishes
Dmitry


