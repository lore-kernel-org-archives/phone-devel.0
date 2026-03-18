Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287BE21B192
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845256; cv=none; b=LuwvfS0xBDewbmCj+igpCQ3wAjDQ7raLXLwT5l9c5lS6cy4cxQqg8YMhtgjMAlQspb1Wm2p+idBIZZEN4mWIR5phalZzuMbiLxG3uH+vAKVfF8U5INMEVZd7i8V0YaMxlBa1GcmcBpopmS9XbuPTdY3O4N5fsTWVFW+EGOfZBBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845256; c=relaxed/simple;
	bh=144QKYSHxMWmAavZR6ocyep67WF0JCwmhutuM4nZTso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6gsus3WJ5BGU04Abp8NlbkMkjSL3eXA0hmkecXXYdz27UVJeIUWYoAx4BJxju6GAiQDy6TmmwJ3zglJ9ZFOzwcBwh2SZM2Txvc+DicHaXDgR50q8Cj9QWKrFh3sZ98EREZ2DgQamQ7sVTg2Us5tyw/GffqnxxY3LJf1q5zeKO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+1WtZt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNy4rPHR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+1WtZt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNy4rPHR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICH9A42612578
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NdyUPWI+XQkYGeQQLyVUfR+m
	fd/pe0n/rlyWuH4Ovmc=; b=I+1WtZt5msEQa37RWeJbbgw/7Al5NOda6esJSlgC
	2Zawrs4f1bzfoXGPKngIx5xaJl4KtpppaX/WpKoclrhWIBloUpn8BpuFIrxGYzhJ
	PLPFKn3VaQ2PKLsrAx6Lo6M8WyvGryagLgfOx7+gegWNYwi3wW7yEfoG9ChOHoR3
	howHk0UF2/uN8pyrso8HcSOUdXAgJSzXpYojwYvtQWNEPfnMH5VATBnx/C7LPs4m
	DpzYGnomMBO+MXeWC50yLr+B5H3Rl+xRGf3K6RxuUYjV1xdBiI39VAUX8L4I0y4L
	ukpF4Km2b+w1MaQNtBfPf4ng7EIIdqtq4CDrtl5kjUDtLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdsteq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:47:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937c5b742so227042701cf.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773845251; x=1774450051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdyUPWI+XQkYGeQQLyVUfR+mfd/pe0n/rlyWuH4Ovmc=;
        b=HNy4rPHR8yyiR6Uyqgz1128w8gHfY5mN1qkoc1Cz4luMia90f8uDwvFeHz/sVMV55Z
         46FQDvHC4SI75wu0/fa1O5jXSz2zj/hcpjerDO9NCJPJazU4CTZ9fMuFbrCI8IEsI8Tq
         8EsH5zogMeFi30R8lkq9uNK/iVnE90POfGYoIJV+1o1ssl/bgehtxnKdXqMbxyGQKIVg
         00P2FT1DWFS3TQT42B5pvze5mFCwFDeqliKyw6QvEZ7k9P6vsf90fkYaOJirBFpKFAxK
         SOLnPuCxJ7ZbQjL9cHSaoKhIi+jXqp2lA9T770CBwrXqrBo3QZeWXFCV6qpdIE/ovHKy
         3+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845251; x=1774450051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdyUPWI+XQkYGeQQLyVUfR+mfd/pe0n/rlyWuH4Ovmc=;
        b=WoFavjIK5a7IyVj1Fkvngap5DHOvhgtU/EMKVaUlUWbdY3bNInOLiMnS7TNbAv3/yJ
         Nmp3+jcVeUOrPJ3/o/suzZmFw1v0IhuURpRuoEsy5rPfnBRSheX5KlQlS7oMBJx5vraf
         CaEc4G8iFubHZ8RGNRM075RZmbhWCA8zuTnBjAU4wuQ5o5oi/Ao++nVIAuKmV4N7c+wy
         F/WFVcIYRs8uKPqzGO10CLVxV7tZeTN0NSq8+PlWQ5gpVEK4T2wYIHBQeRfACCSMZUgc
         Tm+A3OZFBcyyIbuz0E52SLs87xjAj1mG3a06VFTkdEfbgC/TG0HRtmx7XtRkdrD1uYJd
         Dp5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBXkCQmPbGq+uPUT7Qf2WqbC+S3T75B93i1flEvV9T4XhevDPTevd3dGq/0Ja3QB/J8HuJ8QbUsWRwkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cQY9dJont1mmbgf5N2jP8wnY+FO0L1sEaqLfKKOfNHo/GC17
	l5Kw5M8ZJ7QA1fIoFmoaqeYmKa6/C5rBkhC7kilZmojWtW2+aHtO9gC5oFqQhlAVy36uZAPotq+
	uVMmSM5vSMeQyJokEsHTiizPULQEYM+30FLU5MdJozLziLXP2Ho8EHIwMHc1VvwWBnw==
X-Gm-Gg: ATEYQzyLe4rmEyWaypL6Dq73f38GNI1Q4CajtWHEIIah2hcQG8tke95loupDfOgBX6r
	AoQni5a6rTFEm0RacVp4KJh7fN0DFrz+bRtUy4wolIdDw2Y1lDJen5lIinjpBNpW1LuQcsfi4aO
	Jur84N9kn/C43svmlBj3WQmLqKbWjK013ENtDPbEft68zRUJw38ID2Tpoa4zjKVgYfU6V8c3Th1
	4sgC+itxM2xQy3w/5eD0za8ae+L0BbwHtJZ+z3S6O7CoOsux7+6VkSrFwFt0ScfXB9kvsKTqqd8
	+3kUiuL9rrRctnIkmIVbIXkbur3UUYKvH6CGxvi2k3Wy03qmJUgX7VEBgXx4c7T+0j8RdRGM9sz
	fOD4TAHzsS6nJnsCXeBCAJwTw6pNF9dCe+FWbqrLgDCpp2/ZJSQZkzmW2Cd2g6PA2e9aO+VuMrj
	eJ5fX4/s2NR8GM27pctyLpFJ43g/gTFkxHeVA=
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr43951331cf.35.1773845251149;
        Wed, 18 Mar 2026 07:47:31 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr43950811cf.35.1773845250534;
        Wed, 18 Mar 2026 07:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7b7a8sm591096e87.80.2026.03.18.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:47:29 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:47:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Message-ID: <73fyiqoxxg2gg5244wkukepdfw6lnguq63si22qsx2ueyna4hu@l4vyykvn43oo>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-5-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-5-36b69dfb760c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNiBTYWx0ZWRfXy/tqQlgHP07Q
 lZxKOoSl0gomZDKHjThqS3DpaKyQHDw2s/HToYWmK1EZYLWvt5Y1Y/TooTnZ44PbW2adGz0iTuU
 +HqvGTWYJWoB2A6gJSXjHGzxvydKzkagxXTaihbhNsWupo5AVhw+J5mHxL3BYtP4vTLbdJf+U7i
 GJgy8jysbY3xFtA23j9NBineJ3iC8FI8PUrm77RH+S4hF8CLSJzTmkrLLnAHylOlxSQWFol8Yoq
 T7iSelcCqN5KFDx9aQmC/1pZXuTJYFfljoe3+MohUuNwL80982LFpZ9xoTTtTDekFWkbomexHLL
 zR92PhI+zH8I2e4cXy/Zv2azA8Vb+XOhAjZmooRubZlRBhoG37OGruxr2Bj0qFhd9GOgo4QxSYr
 TbBwjycygR4t1y1UjZu2T2/OnKy289jleATiXPYZ8LpwVZUO7JGXx//CJZQLra7IQ7M58bUfh4Z
 cY/jPmW26VEsXOJs5Og==
X-Proofpoint-ORIG-GUID: CM2rayclKWdH33pXZgnu24toCGjAEiDI
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69babb03 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=yhfjJl8z3IGHiU8HblIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: CM2rayclKWdH33pXZgnu24toCGjAEiDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180126

On Tue, Mar 17, 2026 at 11:12:35PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Currently the panel driver for tianma is broken.
> Disable MDSS to prevent DRM taking over the framebuffer.

I'd still hope that somebody can get it to work. I'd start by using
prepare_prev_first. Sumit reported the panel as working in 2020 and I
have no doubts that it was the case. Another option migt be something
related to the dispcc (see my [1]).

[1] https://lore.kernel.org/linux-arm-msm/20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com/

> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> index b58964cde8342..d1c7bccaab500 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> @@ -36,3 +36,13 @@ touchscreen@1 {
>  		touchscreen-size-y = <2246>;
>  	};
>  };
> +
> +&dispcc {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> +
> +&mdss {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
