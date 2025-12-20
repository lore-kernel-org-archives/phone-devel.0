Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FB275AEB
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249453; cv=none; b=JrGMuSYc7vlrwKW9C1ZvzORm2RfF5bohQ8wKnG7GpADKO9bAHFXptRuNptmWLvCeJ+UvpayhkHEAhcsRY50ivD1Bql8/vKfCGCGQj5V9RUnZQypBfcu3fnKroEBUSJG+zZPF4ZEk958qeOHMSjZggbXeXdST6OtHAd5QmYBustk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249453; c=relaxed/simple;
	bh=V1J6jegOyogaGAsF0mcTQ/UdeNAjWE0BVnbAjMA7mhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMVkVPsAgdGcItJFDFSA79D9eWW+WNj8PV1AG5IVVZH9c8k4N2zCXyEP+p8urSUQaK3arIyc4W+2N4agt5YEN1KScuGwMJY3PUgZw8O3aWMgupPaMeXWpqdUT6bu5HsZyTMnJizWaxHZ25YFJL1HEkLymq7u/aXW8IafnFFCbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxIM7VWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP2FhUno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxIM7VWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP2FhUno"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBP9731404214
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uFf82mLJBjZjNx5KkB24U4aM
	KDWvcWa6QMSouhjlBAg=; b=WxIM7VWZk+e+IZM5ePFc6mJxWoikxG70AXWQemKl
	Sqw7hQ8IuJYKb8g1C1IjAvK5eDTHljyi5M76Bn9Igg0xyJXNufPtLppXcfGdILPJ
	bAFsuNG62sm6atSuYY2GJWpWUmrWulVLFwumcXAKFGbI4Pw9IthsmbQwIZxsI/o7
	Z6gdLVx2TYEYCxiVVVmydGh4FWQPL9o8ZNQ2JpUMtGxYuY7NfuuQIoKaAl4OKFno
	OWYFQb2E7e83r8Ir/HPdF6a0ZPX9I6Q3sG87G8fARSAS3D2ungknArm5cjtmVIPJ
	JvOToRr5FTyMN42IPl8Eoy6PCv05q3lJgqd17wDOBajzVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mydryhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:50:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3a4af701so65649746d6.1
        for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766249450; x=1766854250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
        b=kP2FhUno8NZGgbkSruaIt+4/brw+M8Z1ZmzwdK7x31RMkf7i7c7qpqSQbKJ8ZCvdQ0
         dcnh0Mvqeg1JTZXIVjBjDXxpyqsX/6oR2WdSeF2ZW67dw1W126qRRBu+fdz19QfCe70X
         FcGsvDqv5VmVt2dk6aOdOVq6RpPUBK4rAJCFn4Q0KL+Jik/ddUCobq5S7+o3n/Yf90oU
         2MBEI6lm2n1eck/C4zugS5n+NwwkNa2H+D3c4Um3kFFKykAfoj/AzTCyVhKTSEf1e44+
         ZecfQ3Jo2m+eMgIOU6yt0ABNwdxx88BoxKWFyBcZJ3DWGZtJ+euZwb0g0zUYiWQgUE6F
         RCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249450; x=1766854250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
        b=DRfQWVRup0iogFY1CimrYupRwN79+FSAu3F4wPk2iqViFZN1hepRKlow5poFAigjLN
         mtFf80Sj2XstlcQm+4Zg1sVoEaY9eNsGoO2QEqaFxM7HXwF3K5dyBTFMocT1ys1KZ6Rf
         g7c5qNDtGb22GdkG2+Pc56hvQO4ZRhy/dBgEW/UrQrXDYzvttxEbPsf3TwCEv02G663d
         iRzGVWZHhpUCJ66NOMILNb3VBSY797Vt7mbzvfjkj8cgB3G6Ikn5s+MuinMR3zIuWE+Y
         CQazTmYREvBiJ/P/bPOGMhRU4dmRYgIaFCcrBVdT3cKbzu1ZogbUPjtKMdeuMa0Ej2NP
         u+bA==
X-Forwarded-Encrypted: i=1; AJvYcCVyVddgpXhJHYcMeGKe8hIY9xGnMD7lEZrF0D00Z24xZR7d73xhM+TTT+9tM1z0yUMur/Z7+wz0sYfEmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyugg3xmWDjh7bmlf8bGOrk4V9rXc57To+oB7RQd1bh71iy3LV9
	2YLaLO/cfGFnLBWARo76hjLXE35QIVCDJWoPWayX6rD86K9X//mZviX+jFNwh/qQ80yiQro1RT5
	3/mUfg0kISNFMtfsLEztif5gRGAEv+INL2SdIfxDSQScZyIIalUdnuVtBIXLvvbnMaw==
X-Gm-Gg: AY/fxX65Kc7hvdR3J+Y4WzThuArnM7mxtsdh+8W18t7y6fSAArThs8VvHZBwIRb8HD2
	DgnMtOgEPfEQ6JRm7blKW2gyBpp2ugU11XTHUSdhagjwvJBu/gjN6nGUimkOE6AKOka1I3bdraH
	imnhKCnxbTy/lqSYPcFY5jBITiUK93uc3REmpNb8F+Wk8WKAjFRam6JV6kq0/j0XEn2bZcaKOuf
	lLR2KhXCzOACmG0wX3QbWviT2EKFlS1janaTzKBagb/z9UycsVYeGHPLl/jLoVjiKlDnqCJlXAn
	Dq8M785cqwUOrDhfTmIzSR1o1ZU0Gr0bMtetun6WZHryX7AULN1oPzB206JYyE/gGkW6t1sJ8+I
	MJBZGP1pJH6b3PiYxZBX1mLnzLzeTXDn44X6Oc6RTX+h17O7vFB5NwikrBCQfJIpG+AaYT2kKi2
	FQyIKfcBBAaBOWjlApevmlmzU=
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id 6a1803df08f44-88d850fb9f2mr89852946d6.59.1766249450485;
        Sat, 20 Dec 2025 08:50:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBxCqI+gr/WocZ4iNPcl5owbDZ5ubpYXfDj0Gm1KEKgQ7LzgELWHUHhzlxo4GL/MCnBb74OQ==
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id 6a1803df08f44-88d850fb9f2mr89852676d6.59.1766249450044;
        Sat, 20 Dec 2025 08:50:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm13654431fa.18.2025.12.20.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:50:49 -0800 (PST)
Date: Sat, 20 Dec 2025 18:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
Message-ID: <kjqlk27r2wtoiuruycnw32sggmlaxax43l2dvpd3idnbq3i52e@pyltdthhzgsn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
X-Proofpoint-GUID: rslml8AZkVb--xTk-83E-VgLsLL08iYv
X-Proofpoint-ORIG-GUID: rslml8AZkVb--xTk-83E-VgLsLL08iYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX3XQQQUMQ5fen
 3C2Vpe6JQltmLBYe3gV/0/3s7HN3uOHpWc9BCe36mYAmp6Jkc7JCxPJCKTGzM4bgKi7ib35nDri
 WXfICGLkA5ZXHb+AVssf/fgwZtXgHFPKoObKKLjCiV0+d5NtqTaJqeuNoyqfLiLCPYNdH0kxDpn
 MSnqSqHHCnK0pBAkVL0hClQburpDtcaaKkpIIveeIET5+OUoWtBpBX3iDbgGd+vazLz/EdkJQkM
 yeONfpxBE6QBOdH+LK0Gu/5X9CClIYpRLWz+egdgbodNXPUNRLP2W70NCokVZrBFyhFMTM6rnQ+
 /QQQobQij5BhjxbtUZoBt1GnIBo0pXgJgbnB5tlCNNCmLuHN5DXV8UUa25+RwTmx7yRJRikTI3E
 tKrmAr0n+5AGLj1WyF3MBwmeeZJH+/yOinKqb9Gno9MLuEQLpHDZi1yYLjj3XgTJ6OJBHOX0/nK
 8G8CT0/Af2fv7GrNkdw==
X-Authority-Analysis: v=2.4 cv=N6wk1m9B c=1 sm=1 tr=0 ts=6946d3eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pVFFj6NhozAmOX4LvaEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146

On Fri, Dec 19, 2025 at 05:41:08PM +0100, Luca Weiss wrote:
> Add DSI PHY support for the Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> +	// FIXME not sure about these rate values

Seems to match downstream values.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_7nm_98400uA_regulators,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
