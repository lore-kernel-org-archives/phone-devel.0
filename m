Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB122333B
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533642; cv=none; b=fwlsyCkhNrGcafulDy859H4fmQyuD+9Kjfyx2DN4AqWdrMTYLkxE5q3sJS4rRlkqIzNqnx7cNg20D3iU8A1m92IkJCuYwZvmwqlzeHhdw0yKMhzxSLCc3lv+8Vcc7YRGrps7Prg/7vdztRMbV6WHTO57XpKp4CemI43VfzlistM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533642; c=relaxed/simple;
	bh=npGzIDwXLExMInt2yrKS5c+f4ljnI5Lwz0v8E6W6QFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeS8XKm0zi/I1gbkhVBsJtHdtOBZNmEE7ie5jkt1ZvR/M++mNNLC24Lm05rbG1WdRk8QxngDgPf6yeymfWIoDJCzqAdacKrQZvT6T7KR+G5DwMDwN1G1QFvjAZthM6VpxHc+CQK3UmvKBkHWytFzVdWYAgJ+JD+h44GmRfaGVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjYLx7WN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjYLx7WN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgDBM020403
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLXhPL9FJVDyu6T4fbEau8ar8ycdMYElzWEHqqMo78U=; b=GjYLx7WN5XLj2V7C
	pl8EgH38N29bOv7WLwGL0N9OYxijUxefqMyNLPw0YgNa0E9tBHA4wEHMvjrreDdH
	Ld/pmFiUymLijafanjQTJM/UG88FZ4AjimW6B35xXwVnvly0iubeh/RWFVIstVhE
	YHzrDBo7w0xBweCQK5MdANnLfjOjG/MDXOYhSfNIKSEg+rxW/bPRWypkszIyA4yJ
	dRaGs1LcHCrKNkfllMeCNDkZPxJunAb7BRLSWn6xv/XXhvecVMEwpkHTD3ZzLnQt
	pwpvH2hdhMXYwtwMVKzFKiLZqgVz2tGCmjLfpPF5H5XD/AgtR4gZKdfBfShjlipA
	FE6IqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc295km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 19:47:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70fa9206690so20358336d6.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Sep 2025 12:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533638; x=1758138438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLXhPL9FJVDyu6T4fbEau8ar8ycdMYElzWEHqqMo78U=;
        b=goGLfTgnMtK++j1DKSn9z1n/DtxSf402jR8FEAyHzD8OUvvV0Kq+9OEYvu4nKCZuir
         8dhGgonrMUfZh96PejuBdkX5I8TPyBGLauZMkeAJPGKJ1XXP11drqDfIJ/V0r5AfFyzO
         5xgH6bLxTg5KCugtxFB0mDzF4Mpot8PRqDZQikd0DvaRfIHA4ozygJYONtjgiRbZ3Uhp
         rs6F7g8UzgK089WD0gXpUzbUF8U0ECA0dEs9JPbauzkvmXz4eRzLlXmvniBVRrH76qgp
         hNe/eDq36deZv/i2cY+HhvoWIyriFum7APTORB7zNdv2fnDhNeT6OGq/vKqGjY1/QdsH
         tsDw==
X-Forwarded-Encrypted: i=1; AJvYcCXiIMvGYdUlq3x1cp71UbitBQMAym7ju4Je8zEX0HV2WGBj4rXoJ5Cl6lYB5uY12MULDZM4269lTDPkKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MAP+ZWqDcXo0AiAigydM43ENIKHWAkIE+Wtfqcb5IoVibeLc
	+zFcz/8HRNi0n+RrYxkezGJlyESNcTtLajxk2az4m0auogtSgqYiBasg1YSs4Xw0phXV+a8+TIu
	VNvIC1P2JyNfKtJuWxJlaRYyZvex5D9JWykmgBSu8PzOgNpvmVi9yEAaxOcuwpnFk2kYZQL3Gxg
	==
X-Gm-Gg: ASbGncv4ZtFZc1JKzrCu09Lb4dEJOvVYqI3Z7AACLWdiCSanDWI6ZBt3HFUPxiqhcT9
	cq8A7r48FDh948axb0kLQe0GkOaOnrxG5XJugkpiVkxkg5O4S2PC0hz/hlfo8tEhn51EzmQTn/Q
	YQehCN3K6BS9XwwJjRQQh2bz+/tq124Xve4liZHDhBjai3qqYXUMo8EyOVrC+hJIzLMOdzUbK/D
	iDb/xtmh+xW96Xc3QDx21hPu3u31yKW2i7A3MXOAv2Wi93S0+Y4ZQqdGKgqjibQwTUnfw0PvFmD
	a7ppeS9JUBJZsLtwkPWrTBBmcBAzEFWv+x6sbkA7ms0m0ZyhLKzhmGhXXcfI+LzYivQaailNCzH
	RSvTKAwCU/dlbyoBEj+znk1IC2AM41Zqt3ndIPRNWEM5ZlTMcE7ts
X-Received: by 2002:a05:622a:15cd:b0:4b3:48f5:88b2 with SMTP id d75a77b69052e-4b6348b1c33mr10716991cf.37.1757533638410;
        Wed, 10 Sep 2025 12:47:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgNXrsRUYzdbRq9wwySHuZY+rdXhThZXn2B/OhJ//KGcMcId9h/P8g2t2/gTV7ZLqZAlLuA==
X-Received: by 2002:a05:622a:15cd:b0:4b3:48f5:88b2 with SMTP id d75a77b69052e-4b6348b1c33mr10716641cf.37.1757533637954;
        Wed, 10 Sep 2025 12:47:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56db8911114sm57652e87.20.2025.09.10.12.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:47:17 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:47:15 +0300
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
Subject: Re: [PATCH v3 2/3] drm/panel: visionox-rm69299: Don't clear all mode
 flags
Message-ID: <memqypjg544vwevucbo3ot4yp2ooblbpjjc4vz3zj7exvjamkh@y2yj3effj2e4>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-2-a7729911afb9@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-2-a7729911afb9@sigxcpu.org>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1d5c7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=feprlWPuZVWlgCd5a1gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-ORIG-GUID: x_iIvpN1FzQvb0Oc_9BibeT4Rz9o9tEH
X-Proofpoint-GUID: x_iIvpN1FzQvb0Oc_9BibeT4Rz9o9tEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX3333bK1bK2xF
 cm6nbkq6ejCupupieG2Qls62q4W92v5+b+CS9iowcnwLVDtsVkhJKsIbMu9x1Ye4QfoYkkyaCj6
 zowVmHJ6V1ZjNTVB+arU8N11O/zzFxmOi6irMEyh7ZLIDSDnx60iC6uplixtLc26n1+FZ3SgqpZ
 RozM87jLvi6stUgj8pRqZPGuPi1bVYIBFPEA8WYlc16YipftAOSVqiZgHkLvVFtr/V3r7voZkUk
 kkSOZbdXWQfWJON3grvFotEXe2rLH/CsbCbWb/weCFPefuENWkMgyrqFYUnXDLn3cF39gn29MQp
 HjFJJi0+mCD1VNqi/AdaVDwzt1ITgwHFrmO5E47phaQN1ojD7AsrpbhlgAm8rxGQpwWMBwHtF+U
 2bR0Ckmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Wed, Sep 10, 2025 at 06:39:57PM +0200, Guido Günther wrote:
> Don't clear all mode flags. We only want to maek sure we use HS mode
> during unprepare.
> 
> Fixes: c7f66d32dd431 ("drm/panel: add support for rm69299 visionox panel")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
