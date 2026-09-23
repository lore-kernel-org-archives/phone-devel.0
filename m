Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93653AFCFD
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203114; cv=none; b=f/gqVucPOI1KIpxRr3swTo3ciQPb1HJ14LgGazKgFLZBlZF/Xx362qobzD04f2K8mm6XeFr8u9FiULQT6WuN++ldeA4QlfZJQpAXSlXQ0ga3ge/pRCEjqjGrBXyJPhCPFm2nWRZABpVuTUb6bQoqhiuxWjoEoiso0e89r3tBEpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203114; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEtGs6WGBDeqrTGmiw9vWyFSMQU2CMyPu2qwpnZluvMuC8vtar7EXtP3mcR0YK4lHr3DYFZrm6lIqzA7glsTK8ttgBEOPIYlIbkRbsAywT34aPhBnzzKsJxW7JXqJZce998jmdRPwGz5Y6EZQNGIAJdqynr/LOsZ8gb9hRoETlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVh6I7Lg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVh6I7Lg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so7835425e9.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203110; x=1790807910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=BVh6I7LgJiQpSqUQ8UjSkxOMl7PebDqlC8l36VtPGUP8V9Fo+PAlO0Kr3pIGhRDhSC
         IbXnYW2iOWbKkSZDrW0dU61p+0lelXCCi717NX4inSl2cft//811AvYD5YsyyggFohSy
         nopjBkxXWTKOQG4xBSHZFbrihl+ZFP5AvIzynZJwqyzXlz9TQ0LJ9vz0ccVuAwS92Cv1
         IQb7+3UGRy01Pv3TOrGICBZ2Rg6sOZusXA+tJJ7db0EpWqggRnSMkvs1RyXs7Qw7wHoz
         k5MzH/5XO3eK+o/KZ3GMrVHIZGAunBa8InMqbaaXk8vwWDtlsTndTOdxmH7WH6JH2i5S
         /wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203110; x=1790807910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=Td9zvmiKGzyWLfO5ZYuKP8w7o//FoPXX9D9ml8o4ya+nHc8QAyNI0/ArwGKYisGdOc
         6HKQJcub1i7Nc8jd2sI+4KIu1nOPYQdqCRLetNgsjGy0KSa5LgrmYuG6wD/styjT9JcF
         NRHf+angPaN+ELwovYXoMVs8J5H18P7RW9TLm5+7gaXxxBzcG5AeUcuYniiI9A90tJv3
         0vdNZ7UD7VYtIN3PwQLRTLs+Cz7oJxP+VMjepL2MXBJM7Vb3rCGJjVFei6FOl6Q4WuYP
         DIoQJj5N/9ZUBguAA7kG6mLAWF3hnRVkmURkU0Xdgq26CxprBCA+SZj+H6eJJytExsuy
         fEgw==
X-Forwarded-Encrypted: i=1; AKwUvBzLbWjL/5EYSoFWk/wa8qFitM/8F4ax7eaSoBGr9Q1iP3ottrFMHXDIv216naofyfpue0xQSNJTJULhcg==@vger.kernel.org
X-Gm-Message-State: AFuF++mdCwKan0QAv0tKCnIOqOnPiZF0BNOQPyXBMqfM/XBbtEykIjG+
	KwvfKkNBCKBql6jJT7ovB5ryK4jSMwb8/Q2sBXo5O/3MDFm8w7xvvLLW
X-Gm-Gg: AYBFou2Z7Q8UU7odCuMhZQrgMmfpCKlJrNTHQFEKMiglHdG3gLnG2Gaz+YZV8pc19qk
	ELsyBs6GUBidROUZWL318pYxLrJcnF7K1Kqju+snZroQZHyRyCi++2sjMXp97FXjuj+ejPPuFXn
	aj6+zTKg72inCz8F9gggmuZ2e8saMR2OWuUP47mZ45jvGVcZAGfb1OBRCcMQfZz25kfiAvAlSFE
	m1a4gm3zvlX6LBYyca3AZP9yWgCuAdhzDFmYzjvpvV8K1DfhF0wGuGR7WWeGH+wrMpsC+V9Ghlo
	N9err7U2BfXLE7UjwuOmga9NHMOaLPOge26pA3bCHNtQnFMpHry5dj1hxnQK4MO9VM9VRpRnrAZ
	s2k+f0yTdp9/f5E02JVkHxcJL8Wxo+fY1n/JjscQa79dOTR5nrPoPx+gNOBC229gvpma9IALgYb
	f0GFPjW8pJgyDwfr07MQa3oK9ZfcNvCMI3jbtz+bmL7eoJweKXzXB8p3+h4NiG77KDSpuXJb8NT
	pB92oXGyAZyOyOY1TeVeCKdDVY3YgTUMA==
X-Received: by 2002:a05:600c:c492:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49fe66c867fmr8606205e9.3.1790203110240;
        Wed, 23 Sep 2026 15:38:30 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b47da1sm20046625e9.0.2026.09.23.15.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:38:28 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: petr.vorel@gmail.com
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	devnull+david.ixit.cz@kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
Date: Thu, 24 Sep 2026 00:38:23 +0200
Message-ID: <20260923223823.190313-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923222521.188197-1-petr.vorel@gmail.com>
References: <20260923222521.188197-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Both devices share the pinctrl configuration.

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 18 ------------------
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..a000c75494f1c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -61,29 +61,11 @@ &mdss_dsi0_out {
>  };
>  
>  &mdss_dsi0_phy {
>  	vdds-supply = <&vdda_mipi_dsi0_pll>;
>  
>  	status = "okay";
>  };
>  
> -&tlmm {
> -	panel_default: panel-default-state {
> -		reset-pins {
> -			pins = "gpio6";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -
> -		te-pins {
> -			pins = "gpio12";
> -			function = "mdp_vsync";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -	};
> -};
> -
>  &wifi {
>  	qcom,calibration-variant = "Google_blueline";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..d54cb47cdf95b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -473,16 +473,32 @@ &qup_uart9_tx {
>  	drive-strength = <2>;
>  	bias-disable;
>  };
>  
>  &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	panel_default: panel-default-state {
> +		reset-pins {
> +			pins = "gpio6";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		te-pins {
> +			pins = "gpio12";
> +			function = "mdp_vsync";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		enable-pins {
>  			pins = "gpio25";
>  			function = "gpio";
>  			drive-strength = <2>;
>  			bias-pull-down;
>  		};
>  
> 
