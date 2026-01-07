Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983A1FBEA8
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767762332; cv=none; b=sNQ1SGsSD7m2N2eDOUxQ52YzvWODZR6KLaX3n4I/7Iq5NH0S0poON6BuOYJ9EfqzwDZKUTeL7Te/2oYtYAXUAyQXV515F+cKfcjjEjYic4aWVtGr/Sb4e6c65PThbYqZvY9JBqBdOlx1p3etXzh6sY9maes+WBymjjwOi+TVr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767762332; c=relaxed/simple;
	bh=pd2/fcqUhJclWH32KEWbh64pvXRMyiVQrFA49oFqlMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJv/h6vAHOoTuFE6RhOiay0+qWPBbMPaBFISbA3/WbJ2qingbovvJbl1PEJNEU2HngWLIrlH9LRT3DCZSdeHRWrRZ87XsOCGpCPOfmtPekkiYju9GMbJaCDuPL9B+WLQGr1/2j3UXPyqffdMjqD6sW8xFp+4eal/d7EHWIJrBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcyRdJkw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcyRdJkw"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fc524cf3so1430461fa.0
        for <phone-devel@vger.kernel.org>; Tue, 06 Jan 2026 21:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767762329; x=1768367129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KElYrA/rOSwZEsZrUs10djaGaBsLTXTb05RNZ4yG4gk=;
        b=pcyRdJkwi5Q4ddoYEs9LdcYzz28eRTj2mcBqi3D76R7yTmtFvT0qc/97qly/NK3Ouq
         eRMFQkxoOomaytTcVqriiwGjgPWsOythSo5JpPWqYZKotB1Z+TglA6GKKuABfgvTaPO1
         r0fo0o9QzHCA46E8xDY7cy/2wWU0IyKEro6T2bkt7s6bZNL0Ztal+bXVv8yckJFltD24
         ZBOEe8Hx6ZDqwe1ipB3YEpOkzVfqoFhHU6E36msAhuqHHuVR1FvNbtWRTaOg3v+TPdgE
         nGDvlTRC6ssQAeYHeyitsV35sUQo66X0+eD4lEUTs9W4dcjrqCZ4RdJKeFd2TlYHnK79
         /F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767762329; x=1768367129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KElYrA/rOSwZEsZrUs10djaGaBsLTXTb05RNZ4yG4gk=;
        b=qL+neWUx5cPx2072SnOehvMXJPPy+Iir6qmBmRVLkQ1TNbC9YeRoqLgrIJ6v0yl5mI
         PQuVHcF6knMle51lRUy1pA113R/8WagoevTsJlBXPA0sGYYeV0+u4PiHwnjZJQQ7ePcq
         lC9M7efXFqfULfMJ7KFqiyzC8I0NQfSSPIRJwAHTfpcpr4yvkEAgSUpHdEivEmv/+A6z
         bttLOLg2azcpgmZTDj6hwTNyzll2G3z3i9ugAVAJ8M/lQ/Jh1QrYylHc/MzUZGu8Bfxy
         pkL7fT+IfsyKrdVE/yDuH7r+4EtcHEPjr5Yf9iaLw4FBJrWQ3pR97iTkSlXJKRks2QQp
         xYLw==
X-Forwarded-Encrypted: i=1; AJvYcCWhAArrBAvUzSdFh2bgS4arK9xjD4auZfiac9vn6gyCyGjJmPXS495bzV2O6IkkAVPElmLA+uC3pOwsjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTRppcWS6wowiKBNH27OoO8tpNzZqfs2nmShiqyScpdK/uZK1
	JIr5lx0DAqOcDCWIb63cql1sj9n5SdnKGiB9PeAJMA63wrGs8p+E1bfQiu1476GHk+Y=
X-Gm-Gg: AY/fxX6vN3ebdwJbFMvdIJW4c83wB74PMjcL+fbzXAeDqo3aWgLMqYgxl4ltLReHMQu
	gAT7Z+5BT1i5rfnF7+/gAtIAJJPmG/zqJxCPhwUF6i9li1Aj6eMjqFxwaGxuPrOJL6bXhpbyG6u
	IP+Z3mw5ZYU8gkeWtIRmGmt19Z5R3RJoTyXR1puMy/P2RslY0XNNwXmmWZ28NWeLpk9MBhusMV4
	+qHUQDedLUKMb0zXAVtADcTGWmkX9pEqRn+PxJ/xMTNSIWU7IKJLTNHeJ7LFz8RForjIgRyVO8a
	oHasoF8UEBAmqV7UnN0heQwvihz22OcwJuvTFX5PX588JrgYZ9q4Xj8rQ78qxwCgUb8XiWeUJ7k
	NzdOwY5Fgc9GD00BRMNXNBM4F/Nvu0nVyGTwo1dCc8znWtrg/18yTTbruhm0ECk01sqDvuhnm8u
	JPHXiGqFFz6p22FnoH+e2ncxwSwXDFxCfc5WC9mY0vZILwVksd5W3Brztmd3HBgfl34w==
X-Google-Smtp-Source: AGHT+IEiZZ20zSl7p6JXD26XIIhK+kk4PNHiCUsnUoutwqu0xYqDlZyc/SSOIPlJXZxKrfSpdnUXNQ==
X-Received: by 2002:a05:6512:3e03:b0:597:d7a1:aa9c with SMTP id 2adb3069b0e04-59b6f043c1bmr252030e87.3.1767762328756;
        Tue, 06 Jan 2026 21:05:28 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6addaab0sm693410e87.28.2026.01.06.21.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:05:28 -0800 (PST)
Message-ID: <bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org>
Date: Wed, 7 Jan 2026 07:05:27 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-6-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index ed55646ca419..ec447fe3959a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
>   		regulator-min-microvolt = <1050000>;
>   		regulator-max-microvolt = <1050000>;
>   	};
> +
> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_front_ldo_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	cam_vio_ldo: cam-vio-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_vio_ldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_vio_pin>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &apps_rsc {
> @@ -392,6 +420,61 @@ vreg_bob: bob {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	vdda-pll-supply = <&vreg_s6a_0p87>;
> +
> +	status = "okay";
> +};
> +
> +&camss_port1 {
> +	camss_endpoint1: endpoint {
> +		clock-lanes = <7>;

Please remove the copied bogus 'clock-lanes' property, here it has no impact
and here it's value is just some random number.

> +		data-lanes = <0 1 2 3>;
> +		remote-endpoint = <&cam_front_endpoint>;
> +	};
> +};
> +
> +&cci {
> +	pinctrl-0 = <&cci1_default>;
> +	pinctrl-1 = <&cci1_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_front_default &cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};
> +		};
> +	};
> +};
> +
>   &gcc {
>   	protected-clocks = <GCC_QSPI_CORE_CLK>,
>   			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -490,6 +573,14 @@ &pm660_charger {
>   	status = "okay";
>   };
>   
> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +};
> +
>   &pm660_rradc {
>   	status = "okay";
>   };
> @@ -508,6 +599,12 @@ led-0 {
>   };
>   
>   &pm660l_gpios {
> +	cam_front_ldo_pin: cam-front-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +
>   	vol_up_pin: vol-up-state {
>   		pins = "gpio7";
>   		function = "normal";
> @@ -547,6 +644,13 @@ &sdhc_1 {
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
>   
> +	cam_front_default: cam-front-default-state {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

Likely this one could be omitted, the proper and expected GPIO configuration
should be done by the GPIO framework itself.

> +
>   	panel_default: panel-default-state {
>   		te-pins {
>   			pins = "gpio10";

-- 
Best wishes,
Vladimir
