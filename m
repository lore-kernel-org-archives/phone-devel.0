Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D1E260565
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527252; cv=none; b=DIL+gkfL8ggRsnVZNPbJqpwf/JV+y83hg3GGkdyk1fjhl4Ev8L2OvQqSYDMbuo0/puY27VnIizmY2OBCxNlyXP+9+YDpywV2G5Hb5HmBDA2PQsum8LvTt5nJA/AzxlnSsK2ROnRtPYXUpf4VD/oAiJmlFpEvSmWN5rlzEn8mAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527252; c=relaxed/simple;
	bh=G6/+Z79zN1BitB1rxd5ycgiHbexAelcV3x5+AN2kjw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxviAIcKViN98LSFBpeImlvTCRrsQ3NKO1IxbwlmSEI7flzBDABMK/N2cnoiHHQ0xKAmNBEh5WqeUGxU7QoKl0Ywt0hfcaCUF+JDuNozgYy2nd2rjOe9mwmc2BoCPMrgMG8cD9Fj74oa97RaNUjpu/FmbbpzYvwKiPOncGB91Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2nurJAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2nurJAm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BUhT3011750
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W4YL1OpJRPmnZFVokp2U0UEb
	pH44QU2Lfe7m8vc6kdk=; b=P2nurJAmibskIF8qj+aRbLX/H6mcVCplWCQHlKra
	x3zl+iGbxMoSaDMLJVtiRwhEsZI3u5+PBB+q5GYC5B6ud1hGOdiKuF6THo49xGWd
	fQDhSC/0kwpSAZb/pEUI0YviEDYucvbO2vW0v5y6OxoQ1CCV/+WOvlWDDl5hAJcc
	kAjYfTPGOceAjuyQg6ZwwuuMMtPdV1xPrjBURjgaQa6XupMVl3IsT1BmfIWdVZ56
	Iiyg/KH5J8cv1so8+Z5syJLWU4h7vaMSWcVqlPzlNrrt6lN74ZLwmJL/vViJYw2k
	wMNKh13qDVOMGxVqHSTlaKfzjWITZue1ia/tXEk87zi0/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hup3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:34:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4bf1e8c996eso61966341cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527246; x=1760132046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4YL1OpJRPmnZFVokp2U0UEbpH44QU2Lfe7m8vc6kdk=;
        b=WhWrW5gptFQhTaCy7bZ5G+7QBs3DCgVNsUp9nJUfhFuJF1mqQiBtorQa//NHi1/Epy
         B/N32YXnir7ZIolIFL4B0+p0zBdcSoIeTMBqlZwRAfdsgdLfZwy3N0FlpXUmbCrJs5Ir
         DJUSkR8d+BuV1D0Ab9rMYyuKOegj4MQ9qtqprDdprKGshY+u2Hhy9xhNY+J5OJlWvU/T
         pOkETvJ9wSAWeAJXJvFjnG4qNYI8cvjN7qj3xdVhck+KuEcjeDg4Yp8kObgyLRIJv+RI
         8TNcMMhnSnHjkHTDlt3qiuFIFJaA9iJnqrtgR0Ee6WbA0tqyXLmr7HbTQFsqe5hWRX9Y
         7EJg==
X-Forwarded-Encrypted: i=1; AJvYcCUddolVxWaVUB9DoiLwIqiop3kK66nCvHS9SflSohlZ/F4JHI0HV7Sc9Oz2438JgAjT4Dx6ljTMqMNkKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoll9rX/zIR5QkVY3TcX6jC8NjnjnKco6wif6VdKySLg07mNe/
	pS4NHygLdPcq9IKsjzEbFCKiP+1SZCw3BDlmixuQkNy5Iiq8khOU4bEmmUPURgNULNzgNyL5E5l
	95diEzRqUrMPlgBBK4zMbFbl89DT+SZHEuoG2XBryz/9YoIl4ePK1RLlgRHGj8YHqkQ==
X-Gm-Gg: ASbGnctgTMd4mp2/hcYW+qltfOIAZaB81+Suq8lR4To8ls0Rg8h+4/On1cni7q0CzSv
	w6dSUs4YrrwvNPz2oI/Oexz8701q0Az5i16BENDIfydo3hbvHj8vElD7Nsc/xhkiJ/ZEmFExawj
	R1jmh51Fp9HO/le5e5QD6cVgl8o7RYH0AMU6eRFvH6y+GHKiccKDLWIMyxeadpGjnQXSh7c9VWF
	Ug0vptkeq1np+CcXYR/zvN32f0K2GtGXXQEgzdNjaNV5NrmQU5uF0CimrROplNqgnRw9p0GIf7W
	xpTTPl5uhkzi49X2rL7O6kEzxuEL19BZEHdfFZf97+Fz5hXnBQU9XHzY1tJvZSdQodIW2PiTZrg
	WR0Zh3rkrCWIcA23MLRvVRuYh2zNJ6cGsANoR+vfwNGV037B8o+wJQ7XAlA==
X-Received: by 2002:a05:622a:5912:b0:4b3:4c51:6436 with SMTP id d75a77b69052e-4e576a8bd08mr72164631cf.35.1759527245691;
        Fri, 03 Oct 2025 14:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy+3kSImpi2dnK1969anWSjGH79bvORhdDetuzMl1TdhAMHPPJiLDqxiNwnNn37xrRWCUSrQ==
X-Received: by 2002:a05:622a:5912:b0:4b3:4c51:6436 with SMTP id d75a77b69052e-4e576a8bd08mr72164081cf.35.1759527245029;
        Fri, 03 Oct 2025 14:34:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2f2e37sm18858961fa.24.2025.10.03.14.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:34:03 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:34:00 +0300
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
Subject: Re: [PATCH v3 05/11] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Message-ID: <r6rkoqffwbkk3b7zwxli57qcm4ianmgghzkscezhvn7nuo6lgo@gjsy267zm553>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-5-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-5-b14cf9e9a928@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX51e04QbMExCB
 gtrKxqvzOAR1ccqiKIfMJStJL3uuHAqEPJT1Bwsl5ybGXJlSScn+YAxwGkMtNjSlusyawQyTQMv
 7NOZLF8TTeAyznPw8WM5q40MDZd0haSkPIe2I0CUDCCnxyDWbCK4plYmJX+PWAla8ps7EuebPJq
 RPzTK/cd9iaQSXHLWf259HK2SNdwyDAzVdZM/D6poghLKet7PKutu1HKvmUjhskgcZyaxr/VRX2
 pV4meXbLW8a/fZHh0UW8IftnqaNX9lBUud6Czd5SzBSM/RFE78wmCdzHrZcNkqwoa78SWnCSSYy
 Ac24lek0EY+EhdgUJx655CKsoP12KyRf3iRxoETPBGpeVzfw69R4JG986aDkc+ewQa+9fnfyKck
 1ANkFYjJdrBdcUdc6HG8CudTtHlAEA==
X-Proofpoint-GUID: 87WdiIR6i8a0N5sR9vZiNJAF3YENVMLt
X-Proofpoint-ORIG-GUID: 87WdiIR6i8a0N5sR9vZiNJAF3YENVMLt
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68e04151 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=sfOm8-O8AAAA:8 a=nYbUX3P6sfHOS58npmgA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Sun, Sep 28, 2025 at 10:05:28PM -0700, Paul Sajna wrote:
> Also include other supporting msm drm nodes, including backlight
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 82 ++++++++++++++++++++++----
>  2 files changed, 73 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2..aa338612433f9ac3b07363b79d8a3b8e0eedd98b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -461,10 +461,6 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> -&dispcc {
> -	status = "disabled";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -532,6 +528,10 @@ led@5 {
>  	};
>  };
>  
> +&pmi8998_wled {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index df65b0e32b195d2f668883542cfcabbb9bde8204..f45eb1dfe55c562142092a4239758609fa3f2e47 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -13,19 +13,6 @@ / {
>  	model = "LG G7 ThinQ";
>  	compatible = "lg,judyln", "qcom,sdm845";
>  
> -	chosen {
> -		framebuffer@9d400000 {
> -			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> -			width = <1440>;
> -			height = <3120>;
> -			stride = <(1440 * 4)>;
> -			format = "a8r8g8b8";
> -			lab-supply = <&lab>;
> -			ibb-supply = <&ibb>;
> -		};
> -	};

I think, you can keep simple-framebuffer. It will be used by the initial
booting and then will be replaced with the MDSS.

> -
>  	/* Additional ThinQ key */
>  	gpio-keys {
>  		pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
> @@ -61,6 +48,47 @@ zap-shader {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	status = "okay";
> +
> +	display_panel: panel@0 {

You don't need this label

> +		reg = <0>;
> +		compatible = "lg,sw49410";
> +
> +		backlight = <&pmi8998_wled>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +		width-mm = <65>;
> +		height-mm = <140>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_sleep &sde_te_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {

'mdss_dsi0_out' < 'mdss_dsi0_phy'

> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
>  &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
> @@ -78,6 +106,34 @@ thinq_key_default: thinq-key-default-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	sde_dsi_active: sde-dsi-active-state {

Please keep these entries sorted out.

> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_sleep: sde-dsi-sleep-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio10";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sde_te_sleep: sde-te-sleep-state {
> +		pins = "gpio10";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
>  };
>  
>  &bluetooth {
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
