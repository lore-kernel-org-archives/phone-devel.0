Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50D2C11F2
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949964; cv=none; b=gfuZz5fWmwAvcd0W49BSueJ5xEHkHYYLyt1PPafCuy9VzvncTdCTEJPNeLUSlvT4FKGMbAarsKFPSupBcW3qaelGrpLnfC8ttYfP6aJ3+FsBsBPMk5aP/4ScsjzPgN7n/fpCdmdHGJcHZD/4KsjuI1fldtbJJyFvsSCuNDGoW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949964; c=relaxed/simple;
	bh=pkKqRsIwDhc+RUJiMdhK9GH1Pl3ZLZDY4dZbArFqFqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQiUlnxdxas3PWyFFMIgE/l/BOpENW3IeqqJmzxBAyaLPhzdwFIYf6MeS2cUTbFL1ApeJPSxtM8uW+u4IdtviKA9b0+IcZbPVAlDGEyXI6QegLJZWG6wbiNwd+O63Gdu3fVPZ63B7rB4RdtvM8iec9jSsTGRwGb4nJw+b3tfUKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPKn5zfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPKn5zfy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5aXV002372
	for <phone-devel@vger.kernel.org>; Wed, 8 Oct 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0UdkETRPI6ZWbVUbfsUgaXMe
	BnN/d50E+m0AcvlG3Bk=; b=aPKn5zfyCDXgHyxBiNSZBLkmEvt47oUi2RWDinGN
	uQyvvHaFX7LMl4N+6Xg7E0U3ZeVF21BWfHPP8/CZu+uu5h34dEKRoIbzQB8J0TiE
	DvOiVboPksV3SiAiPr6QtYJTignIEKkUErz5spHye4nfnnfOqKUBBAQoGQyTMiD3
	ZI4+mGUQUxc6mOcJVvXDWreZvdia3EDeMCn4p3gz5nnLqZMjoF+PwYiZKnDaCdDW
	hHwXINXjJlzCADrcoRbbyK468HCH703v1rkrq2SgJvhihFsk28r0YhAFs2+8Iok1
	tSkAzrPEffpnZnS+t63g3pd0//gAPGz7VU8cmZOD8FpGTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kraj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 18:59:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-879e66b788bso13668806d6.2
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949961; x=1760554761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UdkETRPI6ZWbVUbfsUgaXMeBnN/d50E+m0AcvlG3Bk=;
        b=RsAOcJ4FQoWXcbffomyu8fz8ecNNqyO9C2H/9QpLSLOOOb8IA74lmKBhmX1DoNe9NX
         9qG9T2XRj1p3ypFU7GJAlEE9R1ETCLOCdJ6sCcoSRYEbx5duMVBC4l2okxDjG3wu2L+f
         VCPVatbIdNmV4fzXwYrlF6U9mVD3zDdVn84+Zwypf6od/wH26LcjaONpMp0Ku0q2w7Eh
         hE2QWUF6cqZPPVB+1V352H5ZFMp5lnMbxd4PwTDsJNbrhhlqi5Jix0aEo/xuJ8PHkQOY
         gnNcXmUANvAhLHgEWcMRjcS1mwGKHCm3Wp7M5Q/7oyI9GrN79ZHCef5PYYD92E64z8zG
         iWMg==
X-Forwarded-Encrypted: i=1; AJvYcCWfwaafUpFIBX9i+yrIKcIdvkMwPib0Hv6bR3i+XXP5xdz6guW/PRel2RREtn7B+Dob1JD1FQkFFnWOgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+qxU9FfjifFIwueLH5vZj/0B5yfFJkYROLBQoJKO/KBjsN4CB
	41DHCOi2mmAVGg0bDhoS30HhwR9jWcEnwwfdGUB0Svbxr4ZwJRu2rBKxuq7k/3mRQilaSdu4+j6
	mjuBUReW0JQLXaykZtZZ/9rQr4kZ+koGS785oAhvFuKX/CA2D8pWLQ6rOjBtuAJ4ggQ==
X-Gm-Gg: ASbGncvnM5UsBh4ZdX6fe1byAoyo7NKHwXQLKSb8ha1SCiOPP1Uf9pWnPuD1CMqh6F0
	NZFUP7jNZIO/jWwJcwVkuMsTsNHNL5/u8A2jmFkIcYHyXleAi02eDnFh/0aJxPMGcr/ZltT1hwf
	T6aBc2jlmWrVYr0ItNdsPcL206IamOcReWHyfzRP8H+Z7pbi7ZAU3qV11a4lkCffZzG9qY+LidM
	OMEYGBgUGQreaghQDfSUZnYRsIV4wscm6GeaqY79j9uFJG3OXy0JuErn5sTVAJOULjFQkT88uoV
	c2ii4RCpEBtx49868KwkB9UNqUVsNOKuyZR1rNc/+Af1rZwvXSxBzRHlrcbbO3iF3fPql18lPrx
	cDuTdqk7Y3Gc3CUYYo9wQfzwVN71s55KpLqGrY/aNDl6kQACxh/Rg+4uUwQ==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id d75a77b69052e-4e6ead91fe2mr67087891cf.75.1759949960534;
        Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXzhWAKXAgn1FOnUImvO0Ih0s0vnFPkEOMy8MA4cgd7lRzHdrWt6cw5JjIrgIzgwo4fpdJg==
X-Received: by 2002:a05:622a:1b24:b0:4e3:970:661a with SMTP id d75a77b69052e-4e6ead91fe2mr67087441cf.75.1759949960070;
        Wed, 08 Oct 2025 11:59:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00be6sm263748e87.23.2025.10.08.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:59:19 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:59:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <6yp5udhm2g42basxeyjnn3onfons2k2besxfqwemnqrafsai6q@tfr74bfz7s7t>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX74sztqpiYQAB
 Nf0iX1Y1JA885kWd7pjJP0gMEEVy33YJGvZE2YaYTqT3Dqb6FFAa0pd4YQx79ChgvUiGgfk7G9r
 389x9lsg+iwmMU/PZHVimpvn0ZArlfuENVQhtzC8Wa719sgPhltKL/+Dug4hUOFyptpCWEzKlUc
 CJ09ZOh+8Gr+WaQY2d3MlucI7okeRBNQ0HjpWR7h0Gb3jkGdt+XCD36CrDM/c5Cxpo6EAtk8M5T
 eXTV2mCmV1dWPKFsKnVekxY4h5EchEJOAMhGUrM0UTdOl4Olg6rmVSdejG8khJwPpY8hCvBZ3IE
 IWbaWcANFtPh3D4mmRjq8kXstdefzsa1CLuw1ieMrnszTCnxYZfoRQjbd5N3blxKoE25FvMSAW/
 J+zjwkrUV9ZtOk70SxZbH2IR5SyF9g==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e6b48a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8 a=SYGtE8pA4Zq6nJvkfUIA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=MZguhEFr_PtxzKXayD1K:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: d-c1CktsmXlslAH8UmBjF39DFL0tkbJC
X-Proofpoint-ORIG-GUID: d-c1CktsmXlslAH8UmBjF39DFL0tkbJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 04:05:32PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 402 +++++++++++++++++++++++
>  4 files changed, 417 insertions(+)
> 
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },

Again, why can't we use defined compatible here?

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver s6e3fc2x01_driver = {
> +	.probe = s6e3fc2x01_probe,
> +	.remove = s6e3fc2x01_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3fc2x01",
> +		.of_match_table = s6e3fc2x01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
