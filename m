Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EC2ECE91
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958378; cv=none; b=r+0/jfDwFaJT+7QgiDjMu2mBiwzCYc83/9b3RtaeTkRlciM85mAK9Ng7gDeJrgOuQuvqj4G0d5eKXEiiDqwe4d+TZZpMt+IG6ciJ/4xYx9pm3KM3DzzmFEjJgp/bThGxTspTaH42bmpYiHQZaMl2vsCaltrwVPkuyu2hzYEJyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958378; c=relaxed/simple;
	bh=XD47O9TRxnWUCcBap4YFeLUUHeVW6Hw0uiOjDC7QDf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgHtAN9TibEJUO+Uj8BJVpGSZlW06ZG4nPfKpdG6PG788nc8O6Mqzm4T7sWi/H1oYi3+7A/7++tyLq2pfmlxO24Y1yHbkbdaA+l9YhmTV3OB4wK45+LkZJnF8osNymt40Z386ZrboLTanZtsEp8ce1nZYPlYg2F/C1hTPiX3+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0PMpr0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0PMpr0g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMrtgT025582
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 11:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BwZA/OA1ZRMqrTJrXUO28pcOEUZxmfCKbigqTbLybU=; b=E0PMpr0gLIIeh0CZ
	B4q4Qm8CUYNqdxQVLzNi+7F+Fmd0XaBLkUWsJdMTgq7oR3n7WcIYV49I/s3eJzPS
	M6ytRZ/5Gb48pV0qbcHFwxzN6bQ7iWi+iPkD877hoKMW4VUsx/TEHSUb8/yaDRrN
	PV3aeVtkQwfUEAj8P7qQsbj6h2O+TYWsl3UqkOJMzLJ212m8IqsQh344wDUFyLaF
	xS4TDquX4potZ59p7KhUY76j72ylI9uywRZ7Yg33dfBdMQTJyu4vwEo9sMc9snwp
	bkYMu3E93J4tlZpZAam+dnMhhomTC8rxPpS/Fx6ul3GSUeyhd+eX0Jd9YA793/kV
	TaAS1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfcgaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 11:06:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8909da7f60aso1521154185a.2
        for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 04:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958374; x=1761563174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BwZA/OA1ZRMqrTJrXUO28pcOEUZxmfCKbigqTbLybU=;
        b=xN8A8iURM1+W2ZvYm7T7PRkq1a5XjfhHSU/pa7Ww3e6xwFwe5vjuwPdNTdlRKzQQjq
         bLLbtGVueosm89ZDCjN6NoYga3F8ugvzDErl2KK7BGf6ZyD1RQArsgVoV5/7IZ8cRVGW
         QXhooo+pk+CkRvfG65vQQJ9Gfx2lCucyTh3O3jpxkfQoYSpYOZHoAwmueALFYnI5B6RJ
         +63EmXH9SrPhT2BQ+D6bXJA2QaY3c9s8SMpIKex2vNtLY0BeeXjyBT4lc5+Ct8U4hiEq
         o4jJY2yLhWjks3bH0isM5fvCqJiOBXm6oz8HGfx0S0Rtr5+ryBag7rCg3oL10wVD0zM7
         sx1A==
X-Forwarded-Encrypted: i=1; AJvYcCWXZzVsXSbP2tnbm10w4G+eQwe5bOc46VZ8wZyUeWoxCCuoGNFCEEmupJqnbeVBtDzoNBX/rA2AMKKj9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJHc7kOr8f2nj+IK4IeAy3+HjWAZtcIhVvRMtyolr0jaL7wny
	FQMPGwCY8Jq/r1ytoxhjjiJsquCmduf++lVfoUcfTlpt7Lv+Z8pzANxvZ3doumav4/qNLoXlmP7
	dycFqKQ8XT4eu8waIQL90dBlN5+Lboe+ztmHztHeQrXoIzhAl37hYfbL0Iq2U8tJBKzgm6MTIDQ
	==
X-Gm-Gg: ASbGncttVwvFxsu3PHfNpbAqz+0YLOgtyc/fAT/ZMsuHwP0axwAyeHkPfJWhNuSiqQz
	X+JHhbEvdlKUb4vGfBj7gUnqYroxlFO228OC6HxBe5ZKX+HWE1ICa0kVGdzBB45uLeLg14571nw
	B+Xel9YaagMnEaRcc/hzCLElGs3Ngo9yg+NhVxMseaBk/ggXs3Ff2ObSAjaKb5fA5e4DG80q5rS
	86eOWIOm+GBED0SFFPdcFzfafgcrrwwcUdx20aK6tyie+9mk9WVrNiYWy2uKsP4aYzsufdnVLzS
	mVU3nNzUYtbFaEDTLZEjZEb0iHRgHEBHnNxO/AljX5zT/ZJI0M/ZX+mfHoDL2k0kSJ4Zd2h2vkI
	yVXLMKkDFx9HeaAHtytK+Gjs+KwbnC0ba3Ac6rS8J+EeMNETTmKWluK1YprEWDCuauCQ2wGeL4B
	m1YrMMdgNrZ4E=
X-Received: by 2002:ac8:7e94:0:b0:4e7:20d3:ca6a with SMTP id d75a77b69052e-4e89d1fe501mr164423971cf.1.1760958374527;
        Mon, 20 Oct 2025 04:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqN48xKzVO8tsbOssT4BHqejlmeJeQVsIvc+vCF7ac+0u79yDBwEFK00zcEyTRO+XdmrgoVw==
X-Received: by 2002:ac8:7e94:0:b0:4e7:20d3:ca6a with SMTP id d75a77b69052e-4e89d1fe501mr164423621cf.1.1760958373998;
        Mon, 20 Oct 2025 04:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec0b68sm2422752e87.42.2025.10.20.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:06:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Move address and
 size cells upwards
Message-ID: <i6uiemrttnnjfcc35xw3ux27g2wih5u4kvn3ore5a76ust6l4n@x7sfe34penlm>
References: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
X-Proofpoint-ORIG-GUID: ciyDemb9mqJtTpV_DWbvznGKtzz_2QuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX8YWdyuTnXB+W
 tVK2YLfaqTGnzqJky+tDgArvUtuOpIaKa63hzVcdePjLPDDVuZRPwytwRY4RSqnz82IZuSZhOhO
 bEE0gzF7uoDk7vdGvAuj/5Dbv+4txfK3szvI+CnTV6XXZJaMk/XHIrx9oq85eBBFrLaMPcnAeLI
 w0FO6CDcAlHAij9/PvGbHhCCE0omx81Rec0Y+ZMZv3FMZvznn7dzqsXoWP8KpVWGkBdOALqIGdh
 qr9M1qZuzHiiof5FMCd3ByoSTg1LMYRXTOwHInNdpgQdAeBc3QoXkOVVnTcSTuYGNfNXrVy1SOC
 zDTXOVi9noefO2Anaf0VnfhXSVbu24VCh/eZHJEv6BjhfyvG/QEtxrjLavdrVEH7ev8/rsrQDB2
 UINjMgEasINkCL4a1XV6JRhy1OPIoA==
X-Proofpoint-GUID: ciyDemb9mqJtTpV_DWbvznGKtzz_2QuM
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f617a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ze386MxoAAAA:8
 a=_PUjjehnJBWPTTrYcrMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On Mon, Oct 20, 2025 at 09:55:13AM +0200, Guido Günther wrote:
> They're used in the parent to describe the panel's reg property.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 89260fce6513..44e7b5015d26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -472,6 +472,9 @@ &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
> +	#address-cells = <1>;
> +	#size-cells = <0>;

They are already a part of the device node.

> +
>  	panel@0 {
>  		compatible = "visionox,rm69299-shift";
>  		status = "okay";
> @@ -479,9 +482,6 @@ panel@0 {
>  		vdda-supply = <&vreg_l14a_1p88>;
>  		vdd3p3-supply = <&vreg_l28a_3p0>;
>  
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>  
>  		pinctrl-names = "default", "sleep";
> 
> ---
> base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
> change-id: 20251019-shift6mq-dt-e4b9e7dc7169
> 
> Best regards,
> -- 
> Guido Günther <agx@sigxcpu.org>
> 

-- 
With best wishes
Dmitry
