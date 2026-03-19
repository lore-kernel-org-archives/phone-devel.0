Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86B36BCC5
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888853; cv=none; b=qPtwNjm7HcrXFev8UTWGwdxOtFTKUe+SWR+kj0tmqJy8OnwB2WgzLR5TCKFYqkH5jVa61R5fb3wsKS/23bjhYuxS5w8rY77Na5umTgiS006oEDcjPJKpjdYXZhRHe0XzJA7S4HAGotKisXgfW7pxVFRz0iJNPNBIqvlzVawglfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888853; c=relaxed/simple;
	bh=cwtugtBfxOb1exevIwwKfGheyVyy+1Dk7e+nOb7j+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utcapOT3DDivlgXFm470hsiUqq5IsjRUAKYP7gA9bDRzgLboHa+azNPvJOoLAcvz9wytU+ABxUCnCuPedU1Rr8VpDloD2EPiVNvgS6jBgKd0eid1XFlY03zKxhHDEEWNT+yIXaHU8VYAzO6Ae/2R2tUil0Gf2q4wjhCVDHVyR7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx0ie2pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4BYY0LY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx0ie2pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4BYY0LY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62INlp2l551102
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zr55jwjPMr4CipN/1sygJnvq
	rz4xwfpiIiHPxxrHDZg=; b=hx0ie2pfmgdGEhRAVhR9FDl2jhZcnRl6Ppzx868m
	iofY9UgiaU54YSIuaJvbiKsFaTwSydwa1ORGyJcmynTGr3ADtW5orx9ved2cO4DU
	o1pYfo9s1zlqYSRCWjK/CUzaLmRP2yGq7BgsPZn13RT2qBHvZpE27Q8Fr7o0E1Tw
	/FIegp58HHQUURYCmlxoqy3IWo+ebDpiua3AEE/M3zU6NFxdHyzfgGXIFfvz/kM1
	p0bwMRlkRT4Cx4PDdQI0c26QNE5VQriky3aURkMRBXPZ+T1B/a3UWyvhUa8ntjxx
	8mumGVis6JS9VVZlMN8des93uVw4lCa5DPSl4QNEvK1/YA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g55sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:54:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso14286071cf.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773888850; x=1774493650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zr55jwjPMr4CipN/1sygJnvqrz4xwfpiIiHPxxrHDZg=;
        b=E4BYY0LYwXXJfyOn5eM6/TYWcrrk1kkKymQuIyEhN3ZmRJI19bfHsri2T+Ub+nwwa+
         SZiDF40TYzWBxWffTccF9GulVOz2fKS13ahuCp2mB3c5MV9TePg1tgmnb4zCupmyIKgy
         gVHpG63m9U4BXZF7f5UD/2wM+vI5gpUIedtpuNMc5UdDYlX4memelFkyf2ca8Ba0+g6I
         Fr7A3/G59n15WVZ5ZXTImR7jOK9eZXUlLXXYkmxrKUZSmbTQ3H1Y4mW9RMrlO8gaoc3D
         Ri2rlTbrqYX8ntIPcQB360NQrBwVKcTrpDnzR2GdnHOPPLdeYSxspoXfZ1EcbjwzyTHh
         y7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888850; x=1774493650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr55jwjPMr4CipN/1sygJnvqrz4xwfpiIiHPxxrHDZg=;
        b=cGkeLJL86oDLrsnDAPzdtACQqQLvnArP5/aLE5ypsk9dLbz60oK0MyEPIHD7/be5uu
         zluIquZv5Wmj744MdM/kiTdo3/iirDRdQfU+NyB3pYdLRHcrcEj9q3kSqD8ILwZTpRdA
         wtRP9BVALTuG668bxDFTihwi5w/D4RbabI7lK156NI+UB8QUc2YHLlQZSizi1G0Cahy8
         CZ2f8JZTiNzrv9AvHIWXTzWxAoHFeyHW8qADu4opsfF/ITZ5mucQtYS5OdscvXmIpajw
         DXIRKZI5duieoAiFpXcO9FUVAWldgJN3GdZ7b8yVKynKt9TEPKUGlgiKwbklFB2CvXGL
         /pQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWR55sPaRNHT41fCpviyMz4fDgkaggJ/bb1sR/kpqB0wAqEdmANrGRIqo1o50aNHw6TQP0RRE9FMq8pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPLdzrXtwn10iCdf71IG+vBBHaqRTx7ihRgrqZz3Yo4VeJiVN
	yn5f8yUskR/k+L2wIotinqQOfdP+VkXpKMSYBMIdlUWUaTfSeiL8IfXPMdB3PS6zSMg/9Qr9MEU
	sNcVjtADNrkapC7yutFZErXdaDKnk1hbdZeOdBUL40PvEctfiLRFYBlophXPubLZoEw==
X-Gm-Gg: ATEYQzyDq8ZV7Q8vR1kPoAYi4LjhoPNpsBdAd8ANFydXAllWOquXtZ0MwWktJj4+Eyq
	MUuUsTpGkflBKc2VaInhOhuEStV5U0rSbnAI6WLJusKFn5Ba8bMtZGoCm7cXz52EsYETzjSrZ5Y
	+aWcOkLpIJOqvCsqg3Bi80lPVV7OqEw4wB6RJ7S2Fx+JI5ncZhLBBIY1/ehU49bnnOfs668IeSr
	std8eGD6aGtffPGOCNIbHarRMcAmM7VoBt3WEu0YruCxlqNRppZyQfN2U4/Xx4voO/IEbr47cKZ
	0uFwddLIi2U38na0aTtkN4PvJh3/qObCDWeoNwCZUSPu4NIn0R+23/iN6+mcae2e/VXx0GCsTk6
	ZDsMKje4bNoyewzuN7y3cUBviGMYzS7iSQn6hlWc8G9iq1INR1qVcjCQcx7xnf9MPJ61slXDqAK
	XvcEL99zEMZU6zBG7KbdfB+lZSMn3hLp4H69c=
X-Received: by 2002:ac8:59cb:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b14889319mr77055191cf.50.1773888850371;
        Wed, 18 Mar 2026 19:54:10 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b14889319mr77054921cf.50.1773888849825;
        Wed, 18 Mar 2026 19:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5157108sm9573101fa.1.2026.03.18.19.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:54:07 -0700 (PDT)
Date: Thu, 19 Mar 2026 04:54:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <jin2ecagomu2npjnqr6ejpair6d4uam3djznuaodjijqi6hilk@64ddbqaezuah>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-3-c1bf8917449e@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-rimob-new-features-v2-3-c1bf8917449e@protonmail.com>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bb6553 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=sfOm8-O8AAAA:8 a=QiVCaVSgwpAuPVqWOeAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: uZfg3s27RBWTIWrRFkYnr4HocMw0j_v2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyMCBTYWx0ZWRfX65gfb3QkVZBi
 lqfyjJIgeTFcq64rIm02/1vy2GLj5FV2YXx2sOc36Qmijt+lZmMxyA1hCgiHLqoVQFaOKfLJsk6
 7KOvBiWdu32ohsuPpy/UbjnPCGZ4cG70bFvjj1JtpBki6UVENLShz1bfAG2daFOx9jqOyClaQ+v
 c+sjZqBSlAgGE/lj16IGthI+hbOdqgFYthkWRXE6t7VheezvvOZpF+iLRn26/47pE3Y98sKLj6w
 h/NgtXYsGjOZDMS4mTV0S4YEUuYT/6GSdP9okMG6vJjCNKDRtGawN1IAb593TJjDNJzYQYhPw4C
 pSvcH+bvkhRVgjV0zu7cFtEVS4z8hHH/jFkqA8vdiInB45naQ8HlOzzLyr7ijY+KpKsVfle4Qhm
 AjWqXd8Wqx3vi70R0UI3UF99s2UD3aoFVz6rXQrE5uu3s6sXHRBkJyu7zTeJzC/XVWiyaYsP0go
 yUVB7+pQv6Na48nQS2Q==
X-Proofpoint-GUID: uZfg3s27RBWTIWrRFkYnr4HocMw0j_v2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190020

On Wed, Mar 18, 2026 at 11:28:11PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index ef4faf763132..de287c8e9686 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -78,6 +78,13 @@ vph_pwr: vph-pwr-regulator {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/msm8953/flipkart/rimob/a506_zap.mdt";

.mbn, please. You can use https://github.com/linux-msm/pil-squasher to
squash .mdt+.bNN into .mbn.

> +};
>  
>  &hsusb_phy {
>  	vdd-supply = <&pm8953_l3>;

-- 
With best wishes
Dmitry
