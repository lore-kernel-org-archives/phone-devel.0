Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C920ED
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776042346; cv=none; b=iDgFR1LvlxIFlNSBr72tLzRvbHdveCCpezksSkNwsYcI6K3jxa24YHuQrw5Ym8oouiFkgD+Kuv50g00XbOsRCEGbjY3nGtD+gSeNm6koXeaIW+gsN8dR6cBi9maiXMjCH9sHjNkpkyI0mzgAMyPnBOWmWWBsY7BLGKqM6dS108U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776042346; c=relaxed/simple;
	bh=cCIual0OLi1gqaZ/WHt8iu1IXa0E17EIHXXWf5h20vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzMc8U1CFFp8FsxB/iwADI0x8mZyHVTrY5mBk0MiwHfIV9UNzWB5av1ItGnGDMWni9V1Rbem1m6C324lQXn46/MByA7TwNj1IklTqpYZ/WQ/v3yJkw8kC5uJsfQkE0Ut/t+ydJFroUa6rxTS74WqvWlDpizLeR+CGM2nEbo56Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndRG22yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffvtM2wl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndRG22yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffvtM2wl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CJUvVN1780819
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ExKPMn+q8c44eiqyy6tUy8A/
	JrhkyrK6RMgRaSkJYqA=; b=ndRG22yi2SpEqaMKrYVS0e9dd7MVHDZKwt0U+hrJ
	YoOXT+JvRHjKRltLijAWDHp8F92gPK4hERu/+kTY3YrRQN+5ufX0V4z8tRQ6FYPb
	bAK5UYRh92M9Y1tjo1e8CkmTJ7QvP/3pEE/goiUxN0QGJq+VsMH5vXImV8T2q9Rt
	JAY02TeKkYYA/mjDviDZ2aMtNHfrUHhiMDNV/C0Sh2D4h94V4CC8tCExCY25m1Um
	3fP6RTHKEN/LhLu4GlUiJoSODiA88IrIw9KtuSWFVnNu7kforvgm6FNIAupwH9u0
	stCrjczgEmz8Zi7WnrM+QDY3vOqyQy8JDhmfJEH/krNMHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0ju6yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:05:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso103285471cf.0
        for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 18:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776042344; x=1776647144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExKPMn+q8c44eiqyy6tUy8A/JrhkyrK6RMgRaSkJYqA=;
        b=ffvtM2wlQY4FAexa50ppZak8BCucIiLeg2GDHwsvL04qgWxPxWA0EfNOmOBmdnK+U4
         PAVEBfrwBK3DOcT2R+eVkvlhMJCP9vSiQin9UhSGkWCnEhhdtPRmQuwReCTWKp/wFh55
         5iAdyzrlAc23A8bJKjC9/j3TZ5KU39KBp3FWpbQQCwGmy4aIconNWHPaIWaqUB35wSmm
         mJjjoDQh3CQ3MHhemuQXDJiSpx3KG0kRucXdZrIOZPKHFycWvlJhIcEhNe1wsVE9W5mn
         DuQ3C1Vf3VjIVb0Xh+5BOwt/jH1323b3l9+z6fE+F7F8ABaXTF2ctnMemQqu2UR6IWJV
         a83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776042344; x=1776647144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExKPMn+q8c44eiqyy6tUy8A/JrhkyrK6RMgRaSkJYqA=;
        b=Huq8enDOtb2CdIkvRqPzf6NM06jHQKLT/m9g7wjo5Hd1TamYHvxBctKqqVLtyInVxx
         etxpnKWF2Yu+H7aSJB/yKJFJ4f9VH0O7hD09E8kdz/PwYyc9GEPHZQ9dlIKqZxyLWREV
         l3DdFYqL5t7CUwN50YIQx4FBE1amPWMnDTm96BINX0V06q5JHfx9B9hJNnFS8auD7yWR
         pKec+SHdi7TeCGX5J0ETFA+QKdKQGXwU8TtRQglPHqMGU5vfmYeErIWQwUAMUmaYkf7y
         Feg3T/h6i7R1+2THsb8AZLwDvyG+LB8ErAGxJ4yjHOBL4j1yCBgWy4+2yZWMjalvohd9
         LnHg==
X-Forwarded-Encrypted: i=1; AJvYcCUwL0jL9m6ZfrSLQS3ZpFCjojZb8FFjatqvbL6M/HkG8tgWHDWxIvqGD33O3ZhKDEd9g/R96nJoaPQWUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4MmwMmPWA3Zv+uybTf6uzag4ThbQ211g1++mx/cfab8qovQB
	rr1qCdu5mp3poqZSxInEdznuVJA3Ruz1YmthzxnUv6/EmwevgUPKeckZOll07pW352VPQSBJBBg
	DRij2Xdq3ZbCL0i1vlraihBxpGYzwlliD+Tqm/NV9vJCu/SLip2NRl1QzvMLwIBCXIw==
X-Gm-Gg: AeBDietMuYfMqEe6YFREDMGP1G9/c62FC3i4e4H6DLWDn2T08kpBMZ+RGJRmzBjuNU5
	WGSE5YuBhfh3PjorJILctGpPWw5fQapQULuJe54ZEnoDd6W4lBfoAfk2dQQlnyk596YPKltMPXi
	W+Zk3HXKn9J+BTcI4T9bkzWPdw4dOibjPigHP5Rnt+F/sTS081WRHo1Dba+Pa+WD6chpPE/OGCe
	d/V9JK4RWTtaEcBO5jv4vFwcbW8ASNAqgqlzz1436vRcZPurWUB6q3G/bXeuY0X+XKaDKG0N6Ct
	y+xlGq2wSPAEPaN4TzhejMi9gn10ymH+bHmg7kpKq28CURiHh1QTVvshbs0SIjSaUr33kVCnwFv
	YWrUtgIBWgR7PmzBftHGndn8ZB/z5HTDA4Sgz7Y+QpNbCVbuCUgK4xMpYH6BLG+rCcYGqqvfMSV
	Y+SgyzgxIpG8J4d9Ro+gQaFsrrC33xmfbL430=
X-Received: by 2002:a05:622a:aa10:20b0:50d:85e4:baa3 with SMTP id d75a77b69052e-50dd5b7c794mr141156901cf.35.1776042343625;
        Sun, 12 Apr 2026 18:05:43 -0700 (PDT)
X-Received: by 2002:a05:622a:aa10:20b0:50d:85e4:baa3 with SMTP id d75a77b69052e-50dd5b7c794mr141156581cf.35.1776042343166;
        Sun, 12 Apr 2026 18:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef00327sm2226085e87.73.2026.04.12.18.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 18:05:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 04:05:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alicja Michalska <alicja.michalska@9elements.com>,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] drm: Introduce drm_panel_prepare_for_mode
 callback
Message-ID: <uckcm7zviwss3jdjrapzd2fpivpdkrdbpcgju2hmrayulfzeaf@2tnli5evjtuh>
References: <20260412113851.355944-1-val@packett.cool>
 <20260412113851.355944-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412113851.355944-2-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAwOCBTYWx0ZWRfX5TQtcpSRWRb7
 hXzKNyLZdmony5Wof1I0im4dSvOieMTwrePi9HRM9C+sLVMm/mDoGFTclNGrJEvVKT91qJy4Mbq
 /yET/yXeq3ZucIWlMg9Zuobqj8GCuxjXFITDmfUwydr18k+fWc+c8Au5lV7AxnQnzTDKKalFOmF
 nSG5QGHqC5S/O4P2MOX/XtmugJ1wSLHhXoZnm0azULl9+qQkB3GwZ5M1zH8bpII2H99OAERyDV9
 SVUtADEPufba0anC70WcK18QsJfW13J1kQJOTF+H5Cub7cWpGm5WG2SogZDdD8Li/SoKQHIlArB
 W5ffrlEEK75PArc6hna6UFC7bMck+vPRziTDDNNXjxpy5C+d0VCsHBltR0mWxvVKBP+OzbEJhIb
 5LQFfHwkVZYnIHM0IHEafz9nhlLE+X+ZV57bnLbC95E60/3kDXVJNaKHK/yvv+pj1HVqhWp7296
 lzd9hQx9l+FGGBk/NqQ==
X-Proofpoint-ORIG-GUID: _9gzktCLLwNDT8DU4H7HHTqyPg4GBlaW
X-Proofpoint-GUID: _9gzktCLLwNDT8DU4H7HHTqyPg4GBlaW
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dc4168 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=TM553TlBOhhBRnBKVesA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130008

On Sun, Apr 12, 2026 at 08:00:44AM -0300, Val Packett wrote:
> Modern OLED panels often need to vary their prepare commands based on the
> mode being set (resolution and refresh rate). Introduce a new variant of
> the drm_panel_prepare callback that passes the chosen mode as an argument
> to allow for this.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/bridge/panel.c |  8 ++++++--
>  drivers/gpu/drm/drm_panel.c    | 15 +++++++++++++--
>  include/drm/drm_panel.h        | 12 ++++++++++++
>  3 files changed, 31 insertions(+), 4 deletions(-)
> 

A (somewhat) better approach would be to let add .atomic_foo callbacks,
which would receive drm_atomic_state instance. See  the discussion
around [1].

[1] https://lore.kernel.org/dri-devel/nfc6ih43gjpi5u67fpkkxgwwygv53grdldq7tfp5iiukrkiy2u@53fsrtezzkyt/

-- 
With best wishes
Dmitry
