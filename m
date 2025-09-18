Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5032244662
	for <phone-devel@vger.kernel.org>; Thu, 18 Sep 2025 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758165227; cv=none; b=hamQYcdCxjWb0AAA8lXScE+tsq08CYjxv9h47CMeCjdM4f95BBvcbcaBjywgConzPBEL8sYQglSJUbUl3h4BhqLo5GKPwZIYS7K9sqd1RI7iOr1wj/HRUB539a9cAmRMttS4Pe0M1fm+b2xGAil6W29yRzSwk3PRw2VgoVDkPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758165227; c=relaxed/simple;
	bh=YLB9N6gmZttqN3dj9DYbtbL07ZYsi0AMIlIAGL/E+k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUK8RnG2Zme06Jy9g9uj8ePqaSy4bHZN4TostnCJM7F9g6tZhYcsbRKHs9tTLOThTJWRjcxhKGLW6zvPK8JkSw+GQTNJEAgwVCDODlVKDcXPiz4/4cF0EZpr4/mMTFd6oFeHUeFG6+pMl9J4pzkeZHV8/Ymdx4UB9dVpU5QnXWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6xQEeZF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6xQEeZF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGH4r3021466
	for <phone-devel@vger.kernel.org>; Thu, 18 Sep 2025 03:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgXnef439whcjQWQt/wpg0NP
	2fjWk4IePfL9cL2LWx8=; b=b6xQEeZFPRUsItf8+BB/QukLtZThsC2RiRFyFPXl
	a+vSTRR+0c7SFQkjdnJVClPjdZjxqLcLSQ8ZyGwNFsWwQmWpkBnqKJaUpUTkkKsM
	DOpAa+KMNjm6ca7L/G3sPKmuwCywajEd6SWvTITUFtOZC3AmoCtvwuwGnYpNc/58
	E5whdDcvHay8+x6hZ/Fu5jCtZeASn+8nLb7K1mcsn07M0WFUcRWuyP39IWi9f60c
	3HEuIBYiXE2iU4OJHcEt0rHUdyFfQJACoInixMa0C2lHSZdtI8Z/ErYLMVzLkioO
	MrTYiiylQefq74fve1M2NXxzegczRB02qvhEXlgZeosMog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5cqpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 18 Sep 2025 03:13:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e5f80723so9329991cf.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 20:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758165221; x=1758770021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgXnef439whcjQWQt/wpg0NP2fjWk4IePfL9cL2LWx8=;
        b=Bm52cJhvzOl9SXSUeNXtPp2rZdfFME79LdG/+a3gg687qR65HQoYd5NArz1bOUGBJX
         xpGyeeirLVwtK6zTShPJhneja58Cu0OZQYs19jYRYCk5S1R/G0OQoHh/Qe4Dso9SHdsc
         Dd92nOz0JeA51j9oFOV6qMPtKt8Z2tqvL0aK3r9UO55FssYFEkd71vwqAO0ryIu401jq
         cW5DIxL6sKnU4PdwzUmoPZKp0zzBK9W0FmGpbneNVapAGPYz/yhCx9dImqrd7FMHaUfp
         6D3soUodBTmrZDFFSqBi8I8c7CO9nWUCipkDJH+i1UtHvBFftlbr1fg6FrbSSA3C2J8O
         d0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa/OXx0FdIE7C5ScSFAzvacHAiAbuP3R24Mhvhwq745uBsRyT+YnCvQtsEfdx9Q8mT6Fhzs36RFMUyfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6Vv5f+Nx4hhsk8wrnKfa8r356cPSsqYDRwVVu4IvA5KjVV2h
	6/zbSjJf0CHB/Vt4uHt78pkk87gITikkGNyQ55TanPO5nUT7V2RMcuZscx5zJKLEvgNU6QjsKFx
	s9/NTGQpHIIYKgpH5OlgiCUGuaYdhrUkxKtPP/TWyJlK6KCaw4hG+fFaG5hhiHEr02A==
X-Gm-Gg: ASbGncsqj8ucIWaUqVCoj7/IV3cedJnHaTzDF0bmLx5KmGxkWI0uEuWaHpO0PpnapdH
	wJL2K4P72W+mm5FmhF9AvxLSfxYHuiKpTciWaDSTkoJbXlWqreJj9K+DvDSzCXlbF1MJRkxya53
	4wEPXi9zGSPN2ee9cBwkwbKQPFFqv7sqVC3qD0dsTHsqI4ywbSj2sqomgD5UZPz2kbQWRmXMYR8
	WGNA4eEjEAt1ejqPMll4De8Fv++hMP/Me8A0PXZcAoG2KnoVBzSuzKsAxrKmb06KC7lVggywV91
	vMAtihI1w7V161g7KgI9hGGCLpH1rs5wW3PJ6kQ1C9R1RPU7R687kH4pxEolWzdfYLOa/lhWaFz
	LXDom/DWjtf6uSaZFCVtlwLlqO7nYkKez5atmlSOhLLgWTo04F4w0
X-Received: by 2002:a05:622a:2309:b0:4b7:a901:19bc with SMTP id d75a77b69052e-4ba6a5db7b0mr59701661cf.41.1758165221263;
        Wed, 17 Sep 2025 20:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnefb5Hxfw/Z0HHsqSJG0jMtUgeRbad0eX9dMseGcUg0UdFsWs5oM9xS/vJyeGJd9w0effRw==
X-Received: by 2002:a05:622a:2309:b0:4b7:a901:19bc with SMTP id d75a77b69052e-4ba6a5db7b0mr59701451cf.41.1758165220724;
        Wed, 17 Sep 2025 20:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44a6asm322233e87.30.2025.09.17.20.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:13:40 -0700 (PDT)
Date: Thu, 18 Sep 2025 06:13:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 01/13] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Message-ID: <jpk3nsf3ol2s7vtn3qtrd7tqvk6n26pqjwuxngrut42tdhupp5@2a67whu3bkyg>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
X-Proofpoint-GUID: sWj9zYrERJLG3uBwh8dbFnPJm31hF65i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5CR2xXIGR8CN
 Z9dU7UW7jpweyBnJ1xH1bTifGibQ43LjM22CfWU6ia3d0Mbdd4yZsgPH2nf+zSFZ3XZwAjjJVMh
 /hO/86PCg/oplkrZSj8CLsAP5N60fX8kJImTYwjOOvKYfgA9XIdIAK97qDBBK7eXMLY/KOUKrsu
 pN/uF2dZhHFi4FgO6NESzja6lZ4VoUw+cN4lI2szFcdTv9o2OtjKSI6Gb1QXo8SVo8iCuQYOcvf
 1RMtMhKLTSyId6D+bRXFm6/TKTxHvX0fMzOApENE8FlLXGrxaP9yrFp3oidLnGKGHX5SeOStB0V
 kA5cduAPOOv/MKGFWBsHa2T+q1SGtSU3A1xp6f/BpATMVzTfxTUzFgdguv08ynm17JHD/ZneniK
 y7ddzYdt
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cb78e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=irCUxjHa2X11G76fGokA:9
 a=CjuIK1q_8ugA:10 a=5XHQ0vS7sDUA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: sWj9zYrERJLG3uBwh8dbFnPJm31hF65i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Tue, Sep 16, 2025 at 06:09:47PM -0700, Paul Sajna wrote:
> in accordance with:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Please don't continue commit subject into commit message. It should be a
separate complete text.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
>  1 file changed, 62 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 99dafc6716e76e25aad0755e6004dc952779689f..82d6543835324ed92300c4ed24c51f4b79321f99 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -38,11 +38,6 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		qseecom_mem: memory@b2000000 {
> -			reg = <0 0xb2000000 0 0x1800000>;
> -			no-map;
> -		};
> -
>  		gpu_mem: memory@8c415000 {
>  			reg = <0 0x8c415000 0 0x2000>;
>  			no-map;
> @@ -99,6 +94,11 @@ memory@9d400000 {
>  			no-map;
>  		};
>  
> +		qseecom_mem: memory@b2000000 {
> +			reg = <0 0xb2000000 0 0x1800000>;
> +			no-map;
> +		};
> +
>  		/* rmtfs lower guard */
>  		memory@f0800000 {
>  			reg = <0 0xf0800000 0 0x1000>;
> @@ -482,14 +482,22 @@ &mss_pil {
>  	status = "okay";
>  };
>  
> +&pm8998_gpios {
> +	vol_up_pin_a: vol-up-active-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +	};
> +};
> +
>  &pm8998_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
>  };
>  
>  &sdhc_2 {
> -	status = "okay";
> -
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
>  	pinctrl-names = "default";
> @@ -497,55 +505,8 @@ &sdhc_2 {
>  
>  	vmmc-supply = <&vreg_l21a_2p95>;
>  	vqmmc-supply = <&vddpx_2>;
> -};
> -
> -/*
> - * UFS works partially and only with clk_ignore_unused.
> - * Sometimes it crashes with I/O errors.
> - */
> -&ufs_mem_hc {
> -	status = "okay";
> -
> -	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> -
> -	vcc-supply = <&vreg_l20a_2p95>;
> -	vcc-max-microamp = <600000>;
> -};
> -
> -&ufs_mem_phy {
> -	status = "okay";
> -
> -	vdda-phy-supply = <&vdda_ufs1_core>;
> -	vdda-pll-supply = <&vdda_ufs1_1p2>;
> -};
> -
> -&usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
> -	/* TODO: these devices have usb id pin */
> -	dr_mode = "peripheral";
> -};
> -
> -&usb_1_hsphy {
> -	status = "okay";
> -
> -	vdd-supply = <&vdda_usb1_ss_core>;
> -	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
> -	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
> -
> -	qcom,imp-res-offset-value = <8>;
> -	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> -	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> -	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> -};
>  
> -&usb_1_qmpphy {
>  	status = "okay";
> -
> -	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
> -	vdda-pll-supply = <&vdda_usb1_ss_core>;
>  };
>  
>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
> @@ -586,12 +547,51 @@ sd_card_det_n: sd-card-det-n-state {
>  	};
>  };
>  
> -&pm8998_gpios {
> -	vol_up_pin_a: vol-up-active-state {
> -		pins = "gpio6";
> -		function = "normal";
> -		input-enable;
> -		bias-pull-up;
> -		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> -	};
> +/*
> + * UFS works partially and only with clk_ignore_unused.
> + * Sometimes it crashes with I/O errors.
> + */
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vcc-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vdda_ufs1_core>;
> +	vdda-pll-supply = <&vdda_ufs1_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	/* TODO: these devices have usb id pin */
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vdda_usb1_ss_core>;
> +	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
> +	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
> +	vdda-pll-supply = <&vdda_usb1_ss_core>;
> +
> +	status = "okay";
>  };
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
