Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208AB2DCC08
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645708; cv=none; b=fXPFX9EpFXWcGkxPucd2YTD1lOfWPdF6JUyh327TLreE+TGIAwYMZNjJKOl+WzhtXoagkpKvFqNw39X6WFAlq0qHJK3uywu8uo1zZTQ56F9B6cyBDKWCRSkU8CRKRMBM9vzFraDrzWmp0l0teVeEWPc7r0aArSWDxGKscJK+MpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645708; c=relaxed/simple;
	bh=wPqImp611aCZjTLetms3dJbHlLAZwRO5YDLgqdiV4I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psDVaVajZQWqenkzKqHTh+//+cD9NJ6Qta/I5B2asq2DRLmuhau98Ci7wmqAN+ysJdwHl4TcM+L2MYeCa6tV60m2Nrbx9+xPCx3wYOA7ARtMlSaL8RCYVzAOHiUWhTgi+kMMo30UauOyLWpNX+/345ZX3rS4aqi77f3PcH0kT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6uWQEdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6uWQEdv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GFCnjG017038
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9zBcpy2TVGpV6SdEbPYF0b4m
	pBJ4QckghSj4HE7U+Z0=; b=U6uWQEdvwc0Atp6F/+uCApeLSUsymXEe4pHLtXao
	i8NlEGgPilQYtDRy5RAmjrXbBMIRWy1dEEYOrvfitNOJvjF8ezUAohNAJQrIbxTT
	sGJj4JP47vIt1OZxxyPhy/baVufsqdQF9qwwPceQ0wgJOLKrL9WC+OxFPNlTW+4I
	HwnP9YgD9Yfun3o081dWWNpjw74Fa1qPOFSmckY6Qaq/wDCdgBUXJHQMmJRIjVay
	4JvNmf0BNXza2ZsheozKSGcBwzHJIjCVqhcBIcIGL4x/34q16diC0+XQ7T5Ll9Sz
	+lpQlgRhGLI4u1Ub0a5J72PhLOIozLPkYO25V0+a4S7jIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkhm3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:15:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88e35354330so555623985a.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 13:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645705; x=1761250505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zBcpy2TVGpV6SdEbPYF0b4mpBJ4QckghSj4HE7U+Z0=;
        b=GS538TJHdx/mNHjviDi0S4noi/tm40pbedhWp9PLXxPG30NVHL7THBUj7YLm7030TE
         1FKo24urW0C0e2ypbq4SzZ5PtEbsM3+murOO5t7yHZX61cmbGfaez4UE9XzkIlmbRLr/
         XDfO+kTmSB9xAvEO8P5k4WYnV7NGYKtpe6aiY47wqC605u2D0QRdwu2/hrDlGWotQiDw
         VgKdeRl5v6HWkmNbnBmlEDmgtBXKFkwfufk3yVzUwNwJ0WDFMPZst6RKkTiD+me9uTHT
         3AKYZySNJKxNMDVr16VA2P9X1PNdO5gunCvEIgC+8FKIhygGKOKw2e0yyOly5bbG3acV
         HrBw==
X-Forwarded-Encrypted: i=1; AJvYcCWdp/Q4Jb1w6SPDdbxPlAIqMMK/c2oj3o11fI3G9VKALZXW725mD4rG253Ttw+hyTYiTIOSmyMlj5OcDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7cjC5mDEFYvZdTGwS0Q4DxmM52e3eb3h/x90RpF4PpiQSnER
	8R47IPhb/Q9l1zGRclsQuLlwTrWLtaDb2hAsUdsXdszSrL3hlKhrgrqln2pEs1c+KjNjhnUQUCO
	KyWFgdDpjKi6awdEh9lZISvCuCrgXLA0kKQWASp0dsfrW2tUZrjhQ2w4HWcONuUq61A==
X-Gm-Gg: ASbGncsMG25AFwQf7mfeB1bW5O2vo407blTTn2E+Jlhfb/qQItMurLJuZ+TpIR3qUWR
	yOJogMSOk427DglvL+QcKOaZjGJIpjjRY+d3R8qMUHFkJVuzVGYPEyj+TynBG0MNNQIB6y2/zyn
	rPiyQww2d8R/JWmPkUnEThnquMGZgy5kkvxl0B17Tg7uEHiHQ8ZLAy4ZWMijiBkzCZkfbTNkiFT
	pMOPtikramCkvK8ZjpZl2FpO+/RIrCcscvj0/Ez0wjHZyUpOHSiYCtfbQrfJRsE51p9mBpAE+ox
	NayADH3npKGL8q6cgzsxTeVtbHYjDn9tRb7velEC3vURyDpBAjmIpKjoe3TKbhwgMJMnZLUtnu+
	ggu2nnW13STKkJ5jCi4P1oOlxofPGfvUOb0fA0038WLcHt/ShAvcSBTdxjzckgx0uc57bipDOUn
	rPEqXXbwRZ9dU=
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id d75a77b69052e-4e89d273e19mr19028671cf.18.1760645705051;
        Thu, 16 Oct 2025 13:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe5fnMVrV7X7OK0iMbXtKG9SypwzE4pSZ+g5Jctt4v8KdtBGL8mmMoU8EYU/SoOlRUrLoUiw==
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id d75a77b69052e-4e89d273e19mr19028171cf.18.1760645704394;
        Thu, 16 Oct 2025 13:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088580ae2sm7280651e87.117.2025.10.16.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:15:03 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Message-ID: <rung7om2fvwmfyihgsnn7j2b6pak7sjt2ayzy42ovugroti4jy@wt6chj662llr>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
X-Proofpoint-ORIG-GUID: tb5qOcrGw64aQMe6MZaChgzSBHqhENcT
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1524a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HryFia7_YQCGBQHkU4YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tb5qOcrGw64aQMe6MZaChgzSBHqhENcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9D9y4dLoipCO
 5Z2VhGfnkCRz1TpjxqQgWEND4gu3ayYVEbf/svbw+QIGVU+bb5ddt4bjJa+syg/tfRRNDHyK8pl
 QuPwcjJ/CLUK5fVqF3qjB+piK/cK3hq2fYL4QKOQrplmBrrONT3ftzHaW7rJ7ammjd+STNtV4d/
 /NnKJ81UXrZV0vpQoFbQ9wTGebIoRCF8S0c9iJT73HfJXqlOzr+lQB5cMN9H2lQ/j+MQ3JHShJv
 ksOc3bmweyXtu0ND/8oeKJH1pLHfGVXgVZlNXn1PnmDbAhiFAeVOou+OqGMaspjZQ8fX1bNoua+
 LFsL9TzSCwwkOUHCg6crFl5KjczPJE2kNSVdbI5a4NJiSwPxzsscFoR46fScQOlzoZaLrvPdTd1
 JsSLgIErArJsAOwSbOEzyhhUeLjkng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, Oct 16, 2025 at 06:17:02PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe panel Tearing Effect (TE) GPIO line.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index a8e87507d667b..b663345de0214 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Isn't it GPIO 10?

>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
>  		pinctrl-0 = <&panel_default>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
