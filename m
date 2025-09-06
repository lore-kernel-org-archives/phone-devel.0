Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA325F799
	for <phone-devel@vger.kernel.org>; Sat,  6 Sep 2025 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757185722; cv=none; b=eOFOzEdtVGBFaUJ6IIyW18kEFagakJa3THDEZmr0zo6dvosz/P/eDICC+zqID0uLwcoW8Ya1wtCiEC3ib7svgJjbggLVCIDCsunuBXWhPhvLbbB/wbOauvdtdNRQ0t2/05Ano6SanZmlRpo1u2H4TF83ycWz9P0Ak3b5t6l2lz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757185722; c=relaxed/simple;
	bh=2xJWhaYgpSKQWvTe3MLOGJATxs85lH7JLh9YBdcAAyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W34SMvrfDiF7JaSicEQ6GQKiuiJZlM6maw9kVerRa4nvkymxW72rtzLYAWQm/8+DtLSES3yzsmIaIlhldhYkbf8baHBgIcTutLoBDVFqJxyJyBjtwiB15JRAIPj10NBfO88+qOZnnd+ZBIs46/i9sP7B1R4/VqoK/t97jsJu+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/QNNA34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/QNNA34"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586GPDLH009024
	for <phone-devel@vger.kernel.org>; Sat, 6 Sep 2025 19:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hpuRj8cMaFi7F8+GiXH5kkLiGalrpmEGijsR/b2FsOY=; b=T/QNNA34UXV+oc4U
	zg/44aeJB6/7Un3krZfISTO2zQl6xjPkV3AMRNP6VrqycF27kA7PSkk5LRrXNhWU
	fKuJBMWuC+aYN6TI6q8PNAcZg7UhmWmgm4JoJZwqqkmjFfNhUXcENCKWxABzITFR
	3nU2+f1r+m1nAbl3uHHHs6+GVNga1Le5t+dRpm0EGMKqHIVoAXnJGwD87BWPOnDz
	qYgGP23CQopguDDJDzNwspEyl7maCLcXDz1P48BuJmqx3WMxv8IzfecC3Gyj0H5+
	uuU/odbe7JyWp+Cd+N06dqjdlh36VhmEyce0oxOXM6qBc+xUaFox0+EgjKs+hbwN
	OpTUfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anf99q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 06 Sep 2025 19:08:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so58706591cf.2
        for <phone-devel@vger.kernel.org>; Sat, 06 Sep 2025 12:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757185718; x=1757790518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpuRj8cMaFi7F8+GiXH5kkLiGalrpmEGijsR/b2FsOY=;
        b=lZ8jwd4xfQRgXx9SB83OID9WXLJ8Em9xthViJRcVSuEDoQr3zrTN/DllTjPaVbgCpP
         ubdO8D3bisqVmrrhckNpgRwFdEkbTdrNnlRsukNaA0UQ9tspF3bZ1a7JkNjfTMGcRM2H
         SeoWCdLxPRyncvtj/1qxIPCrFJAzMoKNl+z4GuhEFFTk0yp0r97XUzJngLsk835oee2N
         WM147PT/uF63laCUvhm6zcRTySUeijtLV/qMhzEduxQAnhQ3zas7C4/muuSw8035aFDw
         FLJEWFWxoaH20hbsFHDaw+qP2/a784d901Ta5l/Y09kva33fDD0uF2sK7VY0wNIGknJ2
         z9tA==
X-Forwarded-Encrypted: i=1; AJvYcCXKcdcGiINGByYg6Ayi8FgKsQPbT4vHOlMq/bdkArUkahWGT3oKxUu/sYg2lNESwg44pUa9ZoqhTQ5ZUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHD4BhwfHs9Y64GJASiyGErrejbZEpGwsrqDNJyyeyWJuLye+
	CjsH8g2flu04TTHWw7PojI6oBkYeq305ujFN5F3mcrj+KgCX6T+xCFy0DhIxoiiHO99bWhEnfxl
	nnlkEGsfo5SWU6x325Cxrc8cwTSKlU1ivEQHB/95W24imLz+ckt3RW52pqwDWnmrV8w==
X-Gm-Gg: ASbGncvfoivc9XMITOrp67vJkigNpNBlFd+vJE2Ak5cNj6fBxIa/7FOm9LcDL6QY1vJ
	l3Ced1F4K8l27xVXSDPMT7h3CY45c26IGXXwP8nGmr4C497LkqnQ5hxKI+f1BkVBUFU8w0u/m7z
	HRuLShBj7DTsFdC56gTIyIVHC6A9sTpALMn/BoMjT7BLIGlFMVW83kVdjEwFeps1X7SH9orBMwp
	sriBioOdw7JQqfzdy7sNqDWDC3vTGtn9eA9WcyfpgBORBGSqY6gqk5rquWdBVCJrhmb6Wr2QK+O
	md8vrlpwmDzfM05DpjCjIobFNH4m0UUiQtcvGIWd59lujH4u8F16/+GcZHq7liYlipkvpWGiDFV
	Fy5Cludqxdq/OztPRwWbJhJZEgERhB3jG/ax9ee/b4ZIiXBA9k2jE
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id d75a77b69052e-4b5f8569a7bmr30141781cf.57.1757185718448;
        Sat, 06 Sep 2025 12:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBHVkE+CeoTO/j4tRuQhgwEhDnLJtNxMuvyvwILGNlEC4co/sjVDfyLwdcTLZ4+MKJhjWWLA==
X-Received: by 2002:a05:622a:15c8:b0:4b3:50b0:d80 with SMTP id d75a77b69052e-4b5f8569a7bmr30141421cf.57.1757185717959;
        Sat, 06 Sep 2025 12:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56340b91bfesm204716e87.22.2025.09.06.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 12:08:37 -0700 (PDT)
Date: Sat, 6 Sep 2025 22:08:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
Message-ID: <ba7y3qcuzkx7hinxraimuem6xnrrfxbj3giz56nq5qbmg76uno@kr6dezsumy2s>
References: <20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org>
 <20250906-shift6mq-panel-v2-1-aa5e585d8717@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906-shift6mq-panel-v2-1-aa5e585d8717@sigxcpu.org>
X-Proofpoint-ORIG-GUID: qpp0jSucuqD5lO9QK0vkPdVFDhAB5S23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfXx7HH6aPwqPYX
 81q68a7anBtyqM3NYC8Dff643JAv0GdbifRZc0lJ2OhHhFZ/mw6OiZQg18pbYiN2WbfOoTRxWpw
 dsIK8lY0wCttWq9KjbJky4I6zqkkmKfd5r03v0zJVGhTsvq/J+4o1/1udqnDBls0JlV2RWNC4V0
 C8nsidZljyM6bWe5iZfeAT6REqo8Nh/knNYbhP924Og+v/3lNBGWUU2OSp26F5QzZ48k+HGIaSi
 vVfeFPooclWF39PuSttVlw01O/FKcWmSHUHLGa6olck8/Sp6gRMprdbIr2u+bTeVA1gZqgfalsi
 t+5ThJamWp/gZrhdAGVKTOHq+wiMjOTXNsAJBnHOembgowoJRPw3MXm9o/hLru3ObPniUPTagNS
 UtXNVq5J
X-Proofpoint-GUID: qpp0jSucuqD5lO9QK0vkPdVFDhAB5S23
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68bc86b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=ze386MxoAAAA:8 a=KKAkSRfTAAAA:8 a=4ZTaGgF3X-K9GTDKzvQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=iBZjaW-pnkserzjvUTHh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004

On Sat, Sep 06, 2025 at 05:17:25PM +0200, Guido Günther wrote:
> Make the clock frequency match what the sdm845 downstream kernel
> uses. Otherwise the panel stays black.
> 
> Fixes: 783334f366b18 ("drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq")
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 909c280eab1fb408a713d84051a1afbb252c45e8..e65697ce6f51c7d64b786da18cf44b16de5d6919 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>  };
>  
>  static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> -	.clock = 158695,
> +	.clock = 149360,

clock = (2160 + 8 + 4 + 4) * (1080 + 26 + 2 + 36) * 60 / 1000 ?

>  	.hdisplay = 1080,
>  	.hsync_start = 1080 + 26,
>  	.hsync_end = 1080 + 26 + 2,
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
