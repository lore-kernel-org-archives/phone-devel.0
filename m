Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6D26F289
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533613; cv=none; b=oUyfBDLXbTjkKvglSGwnXei/fr+dac+3j7kiwL3tKsPOqZnFdR+gCmoved7WpduDwyggcm0p8q1rfGhn8zZhUTNDJXrRLRf9jj96CA4gjbvvuLQ0ycMN09Hn40XSySEFssjkr74MQ4YbpZdP63MR939MtnAL8NmXZHzQhvah7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533613; c=relaxed/simple;
	bh=qCXkeX/+7V8Jarxvq4G+sJ4Dnz6tG5XwsJ8yBdho7tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao1e/P5bLiLZwh2LsKdWhjhPlBki4tRT1tJf5wBJvUQscm6nHwhnGE19/Uy7H6OIVgPI9szH9vT44cJHaRg3VqJ9AvV31a/tMeZIL2+xEZQUu7SAsEWIjcsJihn2YBOeoFmEOg32hNy2xTsUnNaThwt3rZYMmySyVosiQ1AQmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWhsjeUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWhsjeUI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgVke022248
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpSH4cB6sYP2RTo+n4KKNJOi8FnpNbuj7itluUrIaUs=; b=mWhsjeUItIp0k0en
	Zkmqtlr8D1Csozjmsj0ub9VyuKwG2nsLpFIRoOa/iSlyAYubLasdHdkTUed9Jrbl
	bQA6c8todY8M7n6GOyw8gI5TMAnB5+VaygehzhNZJDvmSHKunG/lJgV5iPgySH/1
	a66cQiKagtBBm4MjQkFxwxy6GnODV3ZT7uQoqiqIuP2ytdYmafsGQ4yoDh6W4dEP
	2TIeiz9UD/UfI1fdhFCNIZjIO+6nl5p2eDqMuggRJgsHD8pezNxQCLQ+Fttc3Wxw
	GRF3kon5SOliEhUSE4RjaYGRGXEYDylolz9BaHQeLiM5wiLdfeCdBivtwZdD0Cku
	UyhL7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t381kb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:46:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3415ddb6aso27160221cf.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 12:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533606; x=1758138406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpSH4cB6sYP2RTo+n4KKNJOi8FnpNbuj7itluUrIaUs=;
        b=fvYhSXT1V46AXsdw2aB/hW4PIakpFshfvP8aG6obFAVIbC+ghQyzvnV3AG2tDro5nI
         GIhRF7Oy+RnYQPMhTAIt2w6laapBfeAqhatP5GD+4fxMheiBzRglXhSoZ8RnYOEPGegd
         qbzobPgF/2NkfSCXqXo6Uls7RxeANESNJO9P3VturjSXDeeuiI2LkDqZx8AMBTW473yC
         syryeZ0QolsHDo68jcZE6PstTZBKL/5Q71VlkxMvnYKhExNcsnUtHnZpkgfHYbbaPkkb
         Xrkac5BE5J3QaVGdyej9gUP4hYn/KNylnW8zTlUHVl045ZLFxgOxv74+bv9msJw2cjVw
         sQUw==
X-Forwarded-Encrypted: i=1; AJvYcCW7dXG4ePqAS1TRzzm3DEbuMxZM+FFpv+swX551GvO8BAYew2+CU2Kv4OScutr6ejoajH7OkSYcWgBGpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAENFp5TapkvSdqKNo2RMVcuq4w0NvF/4Iq89ku0cT24RjvFv8
	q3yZsAdhsp7qMd8L0ceMJxPwtsCuTrM1qE6MNDF9evEbDkKwV2pAgBzSfsu0yj8IT2P85ajRAV6
	1gFyYIXW4JRYbrBN0eUhjy4FkulpJvcJIEEUFrPlI+WzLNyrekMKPoInzDfd6OM079w==
X-Gm-Gg: ASbGncsoUFjZXVFAPF3OK60o3C29KzfKXp6xqY2ArC4RZbNMKoIGq14J27U5c7tU/c0
	Wctdf2Io77Rjvp8bSnkcq3hKV+h3A+M/WZ9/hDVqiVUmgiLHBq0WfeEEjd3zG3WMTVgkKg+0XRr
	wSagN4CBnWv6CJ9sh77WT5JpjZx2N2xA3l3H08dca5HnnNdVA4FSXnjnFiXDRx7RrQCiLubGWlA
	0EtRA67R0mrNx1skq2TUTiDVxj9A5/5k+MPcNmkWWLv9CYghA9gOgRoD85yB2Bc1Q33JPEwzjgl
	SZWiQD+5963jwqo+Vb6h3+DXR8Or7UwLgqWI1/12XAgeTVmKdFxieZZ5qIDs0NgjL1apeiTbcb7
	sjmBXS5pmN4JnHBfgiT3pCHJX8QEznO2CD5rXY5fLMeeXw+UTOcBI
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id d75a77b69052e-4b6346f39e1mr12762241cf.12.1757533606197;
        Wed, 10 Sep 2025 12:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtJNlip6unYyAFEHPH8m7ysv5kXijpQm5w+h7Po8npKifdCR5iLzClbPTHw8tWnlyExjczeg==
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id d75a77b69052e-4b6346f39e1mr12761961cf.12.1757533605755;
        Wed, 10 Sep 2025 12:46:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56db8911645sm55335e87.9.2025.09.10.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:46:44 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:46:43 +0300
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
Subject: Re: [PATCH v3 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
Message-ID: <iarovbkt5vpzxpkxyvf4d2pwfa2i737vxridggqwfoxmvljyzp@mnhr4sgadfrq>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-1-a7729911afb9@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-1-a7729911afb9@sigxcpu.org>
X-Proofpoint-ORIG-GUID: xhrJIZaCvP1lk2My7XwClUvQST6d4RRp
X-Proofpoint-GUID: xhrJIZaCvP1lk2My7XwClUvQST6d4RRp
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c1d5a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=ze386MxoAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=v4Hecdos7qkWo24Wf8QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=iBZjaW-pnkserzjvUTHh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX5a+m+1Ixavu4
 r0QFrXpecB1lp/zQsDOAn8igkPmEWqD3orSMSLqF4HfYcQGTr0jfii+LP5S2b7Vhp4fOCof5jvZ
 xb9YmUahq3N1B1MqMPSnHonqYp5kF5bnoMOHG2q4ZFYkdPLBGInbU/hZQsS2Z4vy4wngfCiPR04
 s4M4X208oQeUKMcxODUpk57fE2vFJudt8Y37cIovbjp2fiZyyZWWcDd3nXovl4ad8QzDSOB2Xyd
 4j5qWb20LlpdB/fr4N9W+W810+TcQZfRPV6P3IVbo4cZ1XHcG7Q5+3XRJ834J5JxE2gPpH5ccOm
 fRPn6ufh9tkP4ts+CeUtx07M6Ec56YsAy1sFFqIKQ01ghNRWazsCVBCozRHSzjeuNmbo2NGKZK0
 LCwcCLF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Wed, Sep 10, 2025 at 06:39:56PM +0200, Guido Günther wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
