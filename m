Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB123BCF8
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593640; cv=none; b=jd7bfqs3EqdaTdVX25XZvLPdxCxSerbMD9IuLrmKtV/6XY4+BwrYcECGY7Qqi7Hk0zr1d98SuwUfE+g7k2+55PJuYRwwiPdrYLDTW0rMpGY7hK49uWq4nq+PwHDnY1bM9W1m1NgOFJAKAFZFKD8aCUS5UXyWxsMfGN9ABHK7nLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593640; c=relaxed/simple;
	bh=5cPrOngH34ZskjJ0Ie0Pe6BjzQfwk5fPbKe3h+bKupE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8IfJIQh4LQQBnPajWSQXPfnpuJT12i724jEasQIQT+bbbPkFRE99TsE63zv/QKK6ZEd6hOZLJBWLhMCVRDmvFOrg7DltZVmPdE/3+FpJDV9V61p08GGg/Yx+TtKWsyzhA1vOE3LzXkYHKhJU8lhCjfHmuiwQ613qhnHTRpuTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmLD9O9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmLD9O9L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPor2028631
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Om5CnCqBrphXA78M8+yvq9Gl
	bcxxbkcFH/cFOjrYlio=; b=PmLD9O9L8IonovYOqFTMd5qXv6tHnFtJyIECGbO6
	13U3KoU7TCkmdKWICdAk7nrZ4Z8L1zssLa2wCjOJNNqfDjJA/p0yXen+kJFAu1Yl
	BFJPEz8gWndej4RGxMFEpX83tRuMc62VbWfZTEZEsQZYZIh7cN4ZP7Xh/GJ1qI6u
	Ayh/6Gr0QH40DbRsWpVdEaFDF3d6ZieBtTPoz/CDSkWdkj2g/1TUToBFUBxowsYF
	8d7b74SRWRyGoToE7qT/0BwF3VGLAJqhAiVt3rwixIcCxEajJABasE1h/+zV2Bwe
	kEtwKrrsF1hk2V4Jn+N7I+klosSUJZ52A9Acy0xAsn8QOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh9whn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 22:13:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so914521985a.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Jun 2025 15:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593628; x=1750198428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om5CnCqBrphXA78M8+yvq9GlbcxxbkcFH/cFOjrYlio=;
        b=BoFrAcjyDztmRBrGHcN7OgyvE8sbUNEXC4SyZQa5kH68uZPT9vwCMk2A0MfVnJ+q1q
         eyn7852l3/ZVbRndNruxREH1Yd1i6Sk52wkO45HAO01JFFhCF0UQsfdi/cz3COPHLEV0
         7vqqVCsPI5Ah1HSlrtAkfwlwQD+NPBgBcq4tzPeYsQN8V+EvKq3Wz2Jw6d0V5rlxNPQR
         ZZQDmR7zUXmJRVVK/Iby8hITDXoP8QpoPz6HyoIPq3s+UQOLwEBPHXB63dtOXxpKBnLS
         mMX3EZTP4/+F/vkqHyy4DnksNGd0A4+FEMLl4/nvD9KkZ6LDxfogWnVa1aVH6phKUcUp
         Mmfw==
X-Forwarded-Encrypted: i=1; AJvYcCWhDw67U18YrPSHwCEHvK9MiaNV3vUQAueK722ZTcDDNixbqlIZc5h1yAgpduv6gupQqcn4c73TQfmEIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjbi4EOUFZnxn8ii30IK0PxbPmLXwPvlSGd0cFfQN6z564/FQc
	7dTdT4SnBXElaODFvOxuc3jbTvmNhS11G7yh2CI6Ilkbx6tlTMUXuxbN/6yEZ+6rw1PhxLP0ajZ
	mmT9lYiEzgCYx8VZxcO8D5h8ElFBjJ8BVP0dYv+LBXVSes7qeNErgSNcdI4mX4kHxp3UZcvqfA4
	R8xeU=
X-Gm-Gg: ASbGncuW47gAwIHocipYzKSvhh7R0FxBYFWCwxmbikmvtH1zUWy78hYRQlZ8FvaasAK
	Ik5w/ZYmAPDHzvO0mKLpGNP8CruM9VFPwSd3ibZP/ARngAOXJoDQIJ1tO3ytEoM+bT/rT1k5fSz
	Va9gAWgZMmMTnHY+K/NLkz/xYq9XBnSnX0gKF4KqX4446RurPVTaBuJyAN9axxJl2uK3vYffRFK
	IkS4Rdk+Ad/W6D3hBSz8VCn4pFIOUbY8bff+3n8IE5RUq3/9NHIBBOsDB/JRpXzOPSLjFt+84fm
	vGRs/upG1KdZLtbqJkSHfxkQDD47dVk8oskhnTRvYPMku9LeOZ9hUG4HXPC3Ff3nwymEcFVZNfQ
	GuwIWrCFVcNcj25M32U63CovV/s0c7WOKyW8=
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id af79cd13be357-7d3a880db31mr144758885a.24.1749593628043;
        Tue, 10 Jun 2025 15:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkR/rgawQIqItRoAtofycgRlFovtJqLTPqRUHHzSmcmfKvyj/WssHDU5FcyI0gN/rfAVoU/Q==
X-Received: by 2002:a05:620a:1a0a:b0:7ce:c604:3f53 with SMTP id af79cd13be357-7d3a880db31mr144756885a.24.1749593627635;
        Tue, 10 Jun 2025 15:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722268sm1701751e87.112.2025.06.10.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:13:46 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:13:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 3/4] drm/panel: Add driver for DJN HX83112B LCD panel
Message-ID: <jjfmloif6l2pljlcbo42cdxykynrl2j77n7glq7q4ka6n2bhyd@57t24neodjxn>
References: <20250610-fp3-display-v3-0-e7e7561812e1@lucaweiss.eu>
 <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-fp3-display-v3-3-e7e7561812e1@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848ae24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=dlmhaOwlAAAA:8 a=0UYVBa6PcIZdzih26zYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: t4oeOCV9uV_vyk0cnEJsRefVKkoKi5Xr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfXzTYItQAwaC8c
 SHL5LW3qpWDTt+LIe6HYzkzeKUnU7e60Yo5KbcUaK45+z47YMX/68/RytPb79Bb/cKZmFRY9geU
 rFCCxia6jM8spCm1gQ5RcHs8f9VJEm6xnVyYfpJ01ALTYvYlFxBG+5zt8fSbO0fbdLFe1bqJRhQ
 w9aMbebW87Y5lxWsrwjNUZSowQC2va4BYfVF+m3BizOWWuIZ9EUDHuUlFh5ifCt2cXRpm6q3mNf
 m1+jVPj9VR/hdxUexdif8D9TDm4NSjo6RoElqE/ePnSGc6Wd/JCU1sOVAQj2hbaOsT8fvKXExs4
 vAkiKPMrUqxWustxQsdTgYwlf4t5eVw4z8WCfXc9Sn4002BAle0OPPkdKMD6Mz5AkCr70Q9lCSw
 UfJ3bjDfzGbDgY/TduACNHExnwPc/bMS5DxOwEREpxWWMfs/cgqowN2PBIoCNTgZhwfLurhR
X-Proofpoint-GUID: t4oeOCV9uV_vyk0cnEJsRefVKkoKi5Xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100183

On Tue, Jun 10, 2025 at 09:09:21PM +0200, Luca Weiss wrote:
> Add support for the 2160x1080 LCD panel from DJN (98-03057-6598B-I)
> bundled with a HX83112B driver IC, as found on the Fairphone 3
> smartphone.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-himax-hx83112b.c | 430 +++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)

> +static int hx83112b_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct hx83112b_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(hx83112b_supplies),
> +					    hx83112b_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&ctx->panel, dev, &hx83112b_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc(). LGTM otherwise.

> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = hx83112b_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
