Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2981DDC22
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051982; cv=none; b=kceEV+O0xO+z7fG18hI1C+DeMvCfumWH0Qt1+xs9u4oE16jSSkdjUAwpfhtC1RFez2F3R3Hr8dTBbzNxc7JfzY/ig2f5Li0lqhkQ26FQBPyq5IJ9GYkCqJjmTtKCAXqRU6JHA2atLEXzjvwvPgeaQDfhutuiiKPe8dXTNqodC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051982; c=relaxed/simple;
	bh=7GogWxpPrugJ/fv5zqyxrBchyhiIWbXdp8OfMS2A8Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gY+wMbjP+Ksa+ig8T5kunqRqKeTzEyMgqU3h9Jvp6fCxtoluGB8CiSea3z1nSTcq1Lb2gyBgqtpd6eRXIq+yoyGWmX9xgVwEbBLj4p0VzYwULA75TgT/RRPGiKvEPu9WkVSdl7lXMEHolLL3mj2A8xYTeb7hRiPDsLA+TV1bZtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jx02ZFTq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jx02ZFTq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4368a293339so60728235e9.3
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 00:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051979; x=1738656779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnBgBrJa4vbsUSe6NrmhzROdgjcuHJqYe6HeWjCBo3k=;
        b=Jx02ZFTqdYJVO6JVsncXn72Q+ncDYQZXkUfJbMuA0zcx81tJyAW76bZucWJ6IgwESP
         ZoYzebV/NRAciq2//W9UucuxuDPPluKHt/ga4FK+Zgo+i5mpTKwt5pnEgxIv1u8lmEwI
         R/RI5X8NODs2gZTUN8m8m+rCNY3pNx7BRWwj+/iYV/W9dp6gfIHTcu7npBoImG2i8YYV
         kWWUfN916huOZ6JySnynHvCnPdlr/SvxencjLBxFJvb2PHgk6az4o9zXesZjgxqsi/h9
         POQyqVodgcZSPMY60lDywGAahosF7G40aacND0Rp8fMMS/QJnQX3+Dyo3s9/Q/jLuXfP
         rL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051979; x=1738656779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnBgBrJa4vbsUSe6NrmhzROdgjcuHJqYe6HeWjCBo3k=;
        b=G83Qxt5XTbakRAO4rJJBOuXBQhKMt/SSvEjtuB/dSgWOwiVI6szeTmj/cuLSsZ6u9L
         xB08sCp9KO0PRSMBL39R7B4ruqL9bckvO3AQW8LW2QcC/11FpL+/YZonb0i4fFeIeGKF
         o49xqzsVnWUTaG86Kxzk9NhpYqUf1wUiFa1W6QUKJzYDWNPw6mwd06xqRckmZA5vHxpX
         xX41o19gfeTrq/OqObdN7GVTP06Js3lPzNoL27pPn0HJkumpmlle4XKQ+oz+njEVcuIN
         F4ORa6Ez7JMIKTBrFhzYSBlly7845GDgUV9+UoGD6pKwtf7DylmFp4bLPEil/xADNq/H
         TOXA==
X-Forwarded-Encrypted: i=1; AJvYcCWrUMQgbYMa9Ccf4svPmT8qoZFGkY4cRLv2lWgsN/Rbo00UMZmDcHPiGNWdByrtZLvAKy9BjErs8Iu5/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGs02gfW5WrzAsXMtf/UPi8UIqvkjIYXoaT+wtixh0Z6BJsd/1
	RUQVwRWBfFdOJyCIa1hCB8ZTqDe0RCWryeB3lx0D5DyV3mfBQhtmLvLkh77FLGg=
X-Gm-Gg: ASbGncvLBIPqt3V0dWlgGyqBH2lS3Pn7bzH3MO8sUhTG6V36I8/jzYCKoRt8kC0X81l
	E/YYncwko/zeGLs0J0ZTZvpvGDzI4sfOvdypAmnlc+9uIoQNrqn2EWx4MwtFU8n4YuVvIkFgteS
	BiCynYOQO6guwcv5nPspxXist01nHylNvIqc9XJYmv7+SwvVIPVTFSjErHsgfiPTgNrpbgrh4fc
	MS1SqXrYFdqpP+WAbHbhAdAn2fc8RbTXDlj3UNYGOtfPPq9v3ptzsttcZ9lHc6rZSwFrCl3TUDW
	CeRcXOhls7dRjD23wlO+3ATyTDc=
X-Google-Smtp-Source: AGHT+IE9OQRLHmWjothWQ6ZFid7v4K8EL+HHTqLHBN94YDj7mMjt3aARpnqSVQu4cpZZIU0UkaKnYw==
X-Received: by 2002:a5d:47c2:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38bf56555admr32927261f8f.4.1738051979050;
        Tue, 28 Jan 2025 00:12:59 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c4a160ba3sm1645445f8f.18.2025.01.28.00.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:12:58 -0800 (PST)
Date: Tue, 28 Jan 2025 09:12:56 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/13] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Message-ID: <Z5iRiHGJsDmLfM2_@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-13-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-13-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:45PM +0100, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> 
> The mattisselte - being msm8926 - requires an extra mss-supply, so add
> that as well.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts      | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index 0a3147656f36ca2616e0e3cc7c1dd808b55f3a88..f1544a7e8369c329360e235c48291a5d4c261fdc 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -229,6 +229,13 @@ &blsp1_uart3 {
>  	status = "okay";
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;
> +
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators {
>  		compatible = "qcom,rpm-pm8226-regulators";
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> index 772827cad972ad4ff032cfb9310568c5d2f0170f..73e19176eb97af569d99580c6b28fb2e0ec7f1b3 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> @@ -28,6 +28,10 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
>  	};
>  };
>  
> +&modem {
> +	mss-supply = <&pm8226_s5>;
> +};
> +
>  &tlmm {
>  	tsp_en1_default_state: tsp-en1-default-state {
>  		pins = "gpio32";
> 
> -- 
> 2.48.1
> 
