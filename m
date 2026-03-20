Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF7346E40
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992386; cv=none; b=tGeug4iobugQq96poJdp3ASao6maa6r9vDUGv6DFf1pwlgvQbC3ckGEmbdYf0JGwT9QDsmOqVW8e+Vd8wzn0t6UkKPJvvUUbTtZSBSpo6/xPp+/G1cwC6npY+5DaIRSRI9GjEpN4XFi65idf+ywVzaWXNdJ0Rc4Mn0t9YBr70k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992386; c=relaxed/simple;
	bh=YHsd+LM6JlYxfw7tk3vabZwEeL2zTPZ0zzwjD0iqJHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmnhvZ8XNvRDufW4hMEbM0MQORSKvEZng2RE/bKGTwERUsHAJ36vmKmXG5rKqdqaiDfgT14AY4SfnDFgEyk6ESDscnqAeFgwbX+Rmb2Ec7xsHfVWw5wZ7lod1r2oNFgdy0MYAPlgwOEoGRFgH5xDgeOky4YSbXLOIai+oLKU0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmdwroOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJlBSN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmdwroOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJlBSN0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Y9oq3558007
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1JvBC9OODow9TYPa7jEqKZFt
	uz/xNa7SSOiJgEze6lY=; b=pmdwroOBvURECLSvdzRVuRYwGVCdCkHMUPG1Yd1b
	Nv56Q4c6ydDJ6g7ZUC+ihzFYtI9fxVTMjPT2RdC+tY6QqdDoca9lIxTd63wN476R
	5kigQ/mT6jpgjWCChzmxpwse3Dwyh4MI4a1gPJ11kR5UALTjlW29h60EElpQB5Lv
	WeS2nEDyHJT0XzGeANILFaRDySsR41S+bObGha0hzPTffvqGJNBzdo2HNwAiUr76
	kX1kaSsDgrU3JB4Ig90Nnv2+DQn1ijftvZWGM/1cEM5+0qjdnEnnz7n0Y4LoMGwR
	WYDVttBwPrLTgQxOfxtvAw2U96cAa4nfGevrURQ4ssRfYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1gsewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:39:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f474fae1so263672406d6.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 00:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773992383; x=1774597183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JvBC9OODow9TYPa7jEqKZFtuz/xNa7SSOiJgEze6lY=;
        b=GLJlBSN0BIcqc3rBTtMV5PnptKwMs2wkLiDz5Wn6B85QFmCaq5zcdvmXk2iBxt/NLP
         RZWUtuUySVGSpSKjnUAvmstdFzLqyNsfl+OefmEDnJY29wehDhzMnG1LDILOt4feeRZY
         zFp3Kn8RuipiaBXpGRpuP6panfZAaLyHkG9fAeEkWgOzXyJ6coBRt8VavjAsI4YKD5kQ
         aNSbfSLDprKT5tENC7zSAGmd04YHPS73X6yxu6EW0NwfPR+kqmj696E73t9jF+yaFrfy
         IkhAhoJTOProNiS5fLEnwwBTxfPIEjPazX5pRKbzHSLRA5wFet1ESB8TPW0+0/DeCe5T
         WFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992383; x=1774597183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JvBC9OODow9TYPa7jEqKZFtuz/xNa7SSOiJgEze6lY=;
        b=aO/WvOg9VpITdI6nAI8A9EIqUu77P6Y2RKNsJYR/MyxNE9WKXJRnm0PzM8aqOqGrF3
         wWKbMpWCUqd7tZ4AU7yAnB+LSOlnaJD+3cff+dbS3rlwMen9xqiPaiIzDFPUyLLcrqnF
         IIzfSPuYIEOMh0V9z5PckcVrCfy51drFq+DzXntUisWZqGaYJ2Y+dha0b1nmNyPTEZPa
         p+3ruaPcPjg+xazqidFDfjX6JP/xg8BeEvlIkWPvHrRyaPeqCDrzSCcc7K8KAoUelY2a
         Lpc3bb5c2be27la1kYXBIra5QwhqZH+/EOaqoNGMDKTTKbqoMX9gn89pa10nbudsJ0uK
         gjEA==
X-Forwarded-Encrypted: i=1; AJvYcCUDP80PPhaJJFO0TndGbpXzZODltS8HdACG5Pk0NcnMNdAJk1W6Z0XQNIw7kzKLgJQ+iVjgbgpjl3gXCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBADwbax8zp8bokJiNhtPCZYvBOUjevwKcEIWUod1gqrgX2A8a
	P4mgQou7Rl0niVCEWnzFlE3/oWa2ThZs+V8gignsEj2umIayffC8RU2o3nZvnNe+fpUrtIUBkTH
	8sRBbPKUneIiovCx9xG/+n+QvUVvgYuOOobHOuCXd5Uc7st6naCRK+CDcDcUJPO9bqA==
X-Gm-Gg: ATEYQzyLUba+rhoZpBwuFsCmOWP8jcbBUF5Nw1nmbOaNZDQxXDreSzXn8+opjsB2hmx
	tjxbLmjR5jSs936KoZ4XVYTH0oXykYSFQMfHaQ/FKXNVuiwtZMZyZSzOkUAaPXYasqMMpH4H7VD
	NgW6ceOVJE23/mZfd77JadHLmFnmgjSodxufVdGDkNKc4e+aJghghSVtp3h1JU3oD5zS2c0aF61
	lz4MZ0eoWliXPBiMASQq8Zhrj/02O69JBXTXpccNJIoiiKlrGkTjPYKVsHqFbvkT9tX0NM2gWdG
	NJLaWFKnwVaQ2cNmEJyKFt6Gv+H0wWVcnMaonKCYZpla8cBS+tv0JeizVjByFR3jACxd3slsGXs
	JCMtbOEJGdUUTncHbHW01eEDcLuBzJ7zcOgE9+SA5o9RvSD05jprvPTmpEVD3xD3mBPJtmi2/fX
	Fqlu0StWT1jLNm9tXi8O7fSvIDQ4jMI1mZJkQ=
X-Received: by 2002:ac8:5d4b:0:b0:508:fac4:76ed with SMTP id d75a77b69052e-50b24796847mr86992091cf.36.1773992382906;
        Fri, 20 Mar 2026 00:39:42 -0700 (PDT)
X-Received: by 2002:ac8:5d4b:0:b0:508:fac4:76ed with SMTP id d75a77b69052e-50b24796847mr86991921cf.36.1773992382466;
        Fri, 20 Mar 2026 00:39:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972ba78sm3909261fa.5.2026.03.20.00.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:39:41 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:39:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <wqbpvsy542sij2tb7uxksvaokca3yseednhu3omiczytt7hytx@r2jxzi4tzt6j>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com>
 <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
 <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1NiBTYWx0ZWRfX3aHZQ7kjP6YP
 orvMtDI1HoiRleM+zEGejhB3rVpIjOAPTXoaq4lLXUinVloMAxrVbqFlHlxGkLL19EgLgwT5YqR
 pXtb+g9ni4XQDdkEJm3nxTaogFvdmVAU/jOtN1LP3Kyqj3Kj6YZwDK5nbDkhIUJa+zKqZXL2gpF
 q/ytt+V1dSuiCyb76Kwg4yYskKQoJBbGmrSQ4IfbJWCfZTr/dOZtKr5y9wKLrpsh+EoF0ICd5Cr
 5ak0kJv0kU4ZQmC9N/iONtieaWsG35IcnwxyFzTv5RVQnNqiUHTxZ16KrYBXVr4dhixyQQ92W4b
 xEqS1kEKWBDyw7Ij1y290oQfITnD5dK/pavBSaUibAB4vkheWwGg45kRHzCUHiVn1Ki1N3gK84m
 /GOf6tfiGxHVNWwjET8Mm6E8vP3ZjXkwZe1jo5IX84y/Fsm4EcroJ/jWRfslAfBrAI/9uL3ROj9
 kUG5RHP7WdmrAZpgpsA==
X-Proofpoint-GUID: X0Rz2eLICRasaJdzaXTUZAr6A8HJrgCX
X-Proofpoint-ORIG-GUID: X0Rz2eLICRasaJdzaXTUZAr6A8HJrgCX
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bcf9bf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=iTJjJGd3XSQqdiMV66UA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200056

On Fri, Mar 20, 2026 at 07:19:06AM +0000, cristian_ci wrote:
> On Thursday, March 19th, 2026 at 03:27, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Wed, Mar 18, 2026 at 11:28:10PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Add support for Novatek NT35532-based 1080p video mode DSI panel.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/gpu/drm/panel/Kconfig                 |  11 +
> > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > >  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 779 ++++++++++++++++++++++++++
> > >  4 files changed, 792 insertions(+)
> > >
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm doing a test: since I'm not sure if:
> 
> 	select VIDEOMODE_HELPERS
> 
> is actually needed in Kconfig nt35532 entry, I've temporarily 
> removed that select line and regenerated .config file. Though, 
> I've noticed CONFIG_VIDEOMODE_HELPERS was still set to 'y' 
> nevetheless, so I decided to not going forward since that 
> code would have been built anyway so that there was no 
> point for doing that. I wonder: is that select line really 
> necessary, at this point?

No, it is not used (you don't use corresponding API functions). You can
drop it.

-- 
With best wishes
Dmitry
