Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9662D7384
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533632; cv=none; b=kxnemfRZDkKbDRxTHLPxCWbnB64CbkYjScSeo8rxeRzbK6bwmsN+4PIeyy0aNOzD2uEryABC3BpG8p8CTlBoPSxxXfENJ4uh8cWbczF7thpdSEcJY/JSiS/X94A+aODApKCQ7RELl4ovUorI/NQ557Y3nFVhRyzmGMdd80D6fx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533632; c=relaxed/simple;
	bh=arXJ99FEtVlUyZcOJU0ADHhqC2hh3/FlYeg8g8sOrQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVCcVGyImt1haP5ZfcOmKBStfUR0bUtRHrD7e+VGJWDHEv49o7BgWR9xL0UThf2pET5WCvIKUyUCQWAvjmpbSl3hYrV8F1UQXJAJM6WlbyYmcFgaxrdH181BL+joFhk4Xb1yxnfqsrO2SLUh7AeUUQRKXXzmfreyV1WtJEfdMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAWVem7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAWVem7L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgaqX024126
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XSyilMow2vsdCL5NWrpdmYD5R/cfL4yovE1XWW+4Bw=; b=oAWVem7LqKomNZNd
	9Gzb1TpJYmZvI6vdbrVFFukkowNwwd7gzUigmzgefFIFFvWHIzxbut7u0EzIL2DK
	V5ICK+qYJkBN4kp0XK7WwYd7J68A6o7TRq7PTvSMyFzi/greCpt/XumiokjXEX2Z
	elzyPYRW7IvEIAb3qt18vYYEwmmPXEPdx+guGr8jo6HKWamA+ghy9FiZWSejQbyS
	aGNqZ3pKPNHyo+/rEips7AsBYaT9gGRXnOQlEGxE0o5JplN7YceTpF6l2Y38WF1V
	IxsqYXZ6bCouuaxfzNbawrXQwOHjucBanCppde3YsLD1Irtef1gXjnFCfyBbjqjG
	tdAHBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m50sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32d323297so449981cf.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 12:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533629; x=1758138429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XSyilMow2vsdCL5NWrpdmYD5R/cfL4yovE1XWW+4Bw=;
        b=Cmaq5NdoueEypUb9VB9ZEN1DK2g/bzaeG+pbQfZzuJZ77xijth5mvJ34QrJR1mSqV1
         xM2jn/cTa+8mk55Jz6+TPiVjvsP46KZXGRyeWeqhYtfrAzlW/7BNXssIpTiAo5YeTZCa
         bwMbA5OPhJt5+db437w0Zpf8DMZ9hPCUtGHovh81d9aTaGj8lH38DnQ1lIOVfTJNYC1z
         8D0kdbbmGMqu/ZajSG+9zz8LijlZ8S3GmZKcJj06ItA/KZRHzdwzHCgWrgRh5fepXLGX
         q2856OSHW4Wz1D7L7XkWxAaoeyn1j0Bk2HFY3AHe+IvKDFarhVMp1+r8h9ti+pROaccv
         oPLA==
X-Forwarded-Encrypted: i=1; AJvYcCWCzH1Zpue3LI4MaVTk2xjh0HPIVUGGwWA1PwoELnLFwo52wpcwa+9HSvBBKy9iDCkmjQy4oDmhPIt4zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmWsFuG2cDan6Ftm86pU8vTfawX8JcQ0CuZRpmMKluZM+g5se
	y1WfBWzdLyGKNkacd/xn/hOo/sigsBct47Ji4bnCW3dkQsJHIvD7pwMmD2yC6OdHQfj9Ce8VpE/
	p+twoA6+U9Zws8Wmxt2+LOPw/NHAvA5TKQI6KPL3/3iqx9+oYHh1gpk8vBEEqO0KY3A==
X-Gm-Gg: ASbGncsmL4Td8Ib5bd8JvJMOSwWpNhWQZhxCqPfVKplTiAn1NkAWtkR1a8R624hx+bK
	vBA7yTXe62+QsjzxE7hXrjwUMrObpL8agEP9juFyh/kjz6FNtkFjl0jE+L1h1GKlfT9t9z0f2q/
	07ozWYqed24cH+6d6SEmx2+8mY94crGoGaDye8oRdUNYCUXMFxeffB9rRjqQyZ8m3jZQWZtiATT
	1jimHso9m7wbZseo0QTwid08IPBVbBsdLh+pLebWs2FxloPTFbzqurgBGdnNcyXKcaeB4e1jmfs
	QESXYOgQAcStxlwocZGEVyZMkGWRCpnBF+/VG0VyirbRoCJsz60UDlkyHwhpWcM+kONYLIPmh54
	CuTgRV7XkngjyDPqxy8cEbWECjkJF3nw8/1l9hhfz5mjoe1dr8/Nm
X-Received: by 2002:ac8:5f14:0:b0:4b3:50b0:d7f with SMTP id d75a77b69052e-4b5f8464d8amr166081241cf.61.1757533629372;
        Wed, 10 Sep 2025 12:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8wquYMa19XEyPw/QfhleXZDPv465xQ6dUWPMr0z2Sj2aWYLvr2qI9QQ8LGJkWNi7M4zEUYw==
X-Received: by 2002:ac8:5f14:0:b0:4b3:50b0:d7f with SMTP id d75a77b69052e-4b5f8464d8amr166080581cf.61.1757533628861;
        Wed, 10 Sep 2025 12:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d3354sm44101601fa.68.2025.09.10.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:47:06 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:47:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/panel: visionox-rm69299: Add backlight support
Message-ID: <e2xzrkocmv5qtiuquccdmph3j56iezzerslyi4csazcwgmtjkp@ft2h667uhccz>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-3-a7729911afb9@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-3-a7729911afb9@sigxcpu.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0min+MIGbcOq
 SX9DeBBJPqurc4U2w8cCtckVp83DYSRbFoJ4BCycKmvjSgvFDUCBEMhc0r2vsNhU3ZKfg3ThlED
 c50c0Ga6zKrFVul56+SpyW/1CU2ZrmEmLycDvt71wQG3L2IuTYPLCu55QxzRdwUFgyEcJ5wn1pn
 0NbBuixGmJD+T4oGfaZpxrkdHMeSqk2TmNLkhtYzzS96jxwVDoEqdBPdC5nNJTDNPcrkWowi3OD
 T9ILW0ojpsSW2489WZNxvu5c4fJ8sE/y13tNlX37Rr9w+D2piSMCCiY6zwhgp1jxVqOrgY6TWws
 wCHJdAGBThbNO13UReRjHr2Dw9QsBF3Ux0x4DdHychqYcstxNZV7ekSAulxESO9tIOaT28LkS0Y
 szq5xoGV
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1d5be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=UV-YmP5_J7MdQozCVrMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: WU7oqD-8sQkiQSTggfCTb_kvoYlqrV5A
X-Proofpoint-ORIG-GUID: WU7oqD-8sQkiQSTggfCTb_kvoYlqrV5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Wed, Sep 10, 2025 at 06:39:58PM +0200, Guido Günther wrote:
> The shift6mq's variant supports controlling the backlight via DSI
> commands. Use that if a max_brightness is set in the device specific
> data.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 67 ++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
