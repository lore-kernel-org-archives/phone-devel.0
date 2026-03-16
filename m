Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756E19E98D
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631082; cv=none; b=poeSmCnv42kqye4SI3gxFzoDSoT/o9X6Qu8PhI6ZrmMPHfFWTR3nLM99D2unTurU8Y/B/Bs4U0FjwEgrJJasXCG5Uy00+PUpLH4P0CLPKdQwhoBlKYeDBwXzQvbRLGP4jpQdfC4c9O6p3rN6ysuOYvH5whLyJQuLhqVLEspJQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631082; c=relaxed/simple;
	bh=MQIo7gOyraSVkhGD0+E4X1EBQG6EFoJcEyMsVDYUAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkkKP3H4S4AbRQSq7n1VjypW0q435KEeNsmDJhgtBWQznll0Ane1378dVtHXgImJPvN9ripECL81dReEXZvXTyDPwMjdu0ablfMNZvUqgJq/pGpBFgVJnbkus4JiIyCrMCTqw2TxF3tV6JFECcFq04bPEI/nEbobDJur0RjwZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgZY4e3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7DWqD3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgZY4e3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7DWqD3J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FNn8Qx2975679
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 03:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=; b=UgZY4e3TeFQKHPMO
	r6LQfQJeV3Qn53k6CAeodM36D4WHGJUBdYzlZIXc/BaPfW8a4pgN7bjOfVsynI2N
	4Gv5Li7Rnv2mB0OkuRDUdqsLM0oG2nJSwc3vrGaGbaMWsDCt4ZUb2H8htU2KrH25
	iHaWq9Tayse/EPVAwFxjFj1ZN+amDyJfKe62a/OSx7yB3Tj2Wq0+djVKl02iBTLu
	+V+RoXafAEIan1xvli4t6tVnn3g/ZT48KW2+uGJh1t1MN87tuxjK2pg2nHZF29pM
	sAuB6k7L09ullyq6vsD9bM2Pqk6cWtoTq1R8YcJsI03pxTjWg9taQOUuAwY29Mwr
	JbGu1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7usdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 03:18:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80c4965aso2863665185a.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Mar 2026 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773631079; x=1774235879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=;
        b=f7DWqD3JjD1nxrnsM+JR80J+ZzSVLlmmx0/CRK2A9AB2nBjq4/j4pKB2rCO1PL+5WE
         Ap8+fqh5pN+Ddgui3EYCQXhZSeg8UUyPhhEGdFlI+ZA4hY8bF6kwf9yqWYu5FzD//7eD
         pQQ73SEBPwmTR0fBX/+YdMUS6STy+aPp5yZJ2sBeA3sPFnfOKKClOeu1bJMWWC7lJNTY
         MFJsgsPwAK3KxtzpbbNHdJln395C/nFg6whXhX8OLcvYoRVB2di4eKLVd7eahTgBadDb
         E09Ymi2W6wOLCTX6zIfrgfavYTUCQ5LWFhAfhSG39xO7e9EsOgRh8XfMuVhHAWXhWB+P
         KNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773631079; x=1774235879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=;
        b=Hfkd6n2YGK1f0eT72o8R6UItjfSV5hKrEqp8WuCt0K4fY3qIx1EOK8Kq5INq1ImhdI
         OMp5xnLVormlwopkugUjFGo49EKtUCQp8p39Ol3wqfXoe1cWIUjOcvmVQ5ORMAphGkCn
         HMmSCXKBkv7vdGe98MBsN9yIpn5eP3kkUfuB8vJr7ellcZcLttZlEJen7T7t/opgZxcy
         dVSg+M6r7O1idknHvT/ckzX7OgkvJN54GBqhYNd8vP8lrJvio/leAg4udgU7xJS+l24z
         z+duix8g+2DKpobQWWMGXhJj+kxqhClH4sK2nOfEAPAAf+3WR6aKs7lyivUz+9eeq5bK
         vSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJzhUcHDYc44xVsYQZBrcTTerq+MFgdjd3c8EZw2zoWP0UbeYViRmYR4R8ehkVVCt72Fa1IvCHQ+AqAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7RQCyltMFjVZU4U8PBkFaGFZnE1dJULRkqJeZHBhRzORcZ9Q
	yMQTiBKHEdBPlbrcRW1nSa4JRs1+2Q/Vt6udOemLjEFhECbliWLzylE6YfxkzWA6oNnrSpRChx0
	d3FgqhrAwXkmZwP3ycgSDaMkKFfht8drjPzJHka0/OKMW2T91DZqemw3DRyj/qeOMQQ==
X-Gm-Gg: ATEYQzybXlhvzfFeEe/U+A2u9FK+bh/XUytHilVRSdbGiwhJwCwOAlz3yRKGcIxhclC
	S9xoaYY8VlsJ1iJ/7oyN3XDZo1jiUmOA7G9v8wGknDiOsCj7BMiA458SRpjQG5CFyNuzyWqk45c
	mJowZQ2lIkSTKCnyC5c9zRH7aCDnnCRZbvYcz6k2QVHafLs5QQFBWG0V5zaK1NEGECtIPwdO6ZS
	n4ZXDkccVFrAeJEwYEB8qozyWFIvqo39EZodnG2RYHiBqP+nb82hH09LldPvIa8umYuJIviul0O
	pLmlXyAzyYrB0fsTQLXl2wjUG9mfi48ouF1QrBBCR790cATn1kw/tvJuBK14Nuwp6GdFS/6QfdH
	DEuO5eYqlNWzBxjY7H/ZR+35i6GK6eeZVYpkj4Y/3FyosBOVfJx1ieFsfP2HAvXWI9AfbSF19/G
	QyEtUzZN+xLSSPH3kcN/+krO/wuRNBm4jLkvE=
X-Received: by 2002:a05:620a:29ca:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cdaa7793a3mr1718926285a.4.1773631079327;
        Sun, 15 Mar 2026 20:17:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cdaa7793a3mr1718923685a.4.1773631078859;
        Sun, 15 Mar 2026 20:17:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e47csm3234895e87.28.2026.03.15.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:17:56 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:17:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kaustabh Chakraborty <kauschluss@disroot.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm: panel: Add Samsung S6E8FCO DSI controller
 for M1906F9 panel
Message-ID: <36cglvsoch5vvlyyanyh4zuqbpb3mxlb463dh4zddr2ceu6kwt@mbmcwckg4meo>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <20260314-panel-patches-v4-2-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314-panel-patches-v4-2-1ecbb2c0c3c8@gmail.com>
X-Proofpoint-GUID: CMQfhJTCgGqvmfRdGOT66euDHDtVOSCH
X-Proofpoint-ORIG-GUID: CMQfhJTCgGqvmfRdGOT66euDHDtVOSCH
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b77668 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8s1cotv8QL1OgUCTKcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMyBTYWx0ZWRfXzVnlkah01LJJ
 2f3UcscZNkwJ8n3M9mJG+JFpqRKVTjg/zuL3nxSwDF2vEgj4YdVKmFMh++kfqCKoku9Y0do2CbB
 H5F/K9osFno72UPn+DQRV3Hsyt2KqnNuZzzqIg+nrwb925js+2WStBFVcWaNI2eGW/n1i5V50iD
 +mN3kncDR2M7ffPcxZpmw09UZn2zYS53Y074dm4zytccojQCuH5J0KF732b8ikICeLbWI0p4y/5
 lTypNp9Rf2J2DnY1l0cRVccT02l2Td3+T2bPNZYLN+f20/SzGLIUyFLKkE31pcfK/EqI8y5wkIv
 RUcb79U34VXQ52ruMj748Kb9IabW3rFNq7aI/KyNBXtp3+/oKwFHYA3l+9tQuUDPCxUXyfTt1Fe
 GG+71JpfYC+LOUe2b+I7m6w+xUExW328HSoeyEkxjksWWsj0B0MqPX0TCqWrTbRNBFa1C1wo5Fe
 mjR+Ci8TbbiVy9SPzbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160023

On Sat, Mar 14, 2026 at 11:46:22PM +0200, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FCO DSI controller for M1906F9 video mode panel,
> found in Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> ---
> 
> The downstream dts claims a max brightness of 2047, but seems to ignore the
> MSB.
> ---
>  MAINTAINERS                                        |   5 +
>  drivers/gpu/drm/panel/Kconfig                      |  13 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 301 +++++++++++++++++++++
>  4 files changed, 320 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
