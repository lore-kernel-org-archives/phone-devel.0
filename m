Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263632BBE7
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117758; cv=none; b=tTP6uZ4eY8ryywgW9+WQgCOXrYAy97bZOOFicxaEg4wn6QWVNdhDJsuxZeN4pUBuHn7gMuBRBvwDkzB9/YkU74hYb7wRpfUkor/2oCalzILnqTOXSRwEZ+9LmTARbA9CN+hGuxCbexzNg3ufBjsRwUioSsR5IFHIfe1XOFNx+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117758; c=relaxed/simple;
	bh=RefTj2LFec46dsJYSPZ8tEBm1+3mD1JsxhEJXrBH8b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgaVL9QNghetbOn6Visi9FsnWF9uIelp/zRonXa977UC1sxVYDhQTAVgfvnZAbVOvmOXMkj9zhH9ZyUy68Dnb+20FV0LuyC4h15+eaNfcDt79Y/+qomQVf+30kes1pOtdTv7mmT4lMU1IMQE2cm26+B0B2e9zUC3/4LW+mhLaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzGEKl2l; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzGEKl2l"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042cc39551so1119430966b.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758117754; x=1758722554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+aI0KZC1S6i6KZFgi+7mCnlg3sWeGuC+L+mdTKqHXWA=;
        b=jzGEKl2ldjQhOOSsKb06Fha6LgYoyLdKgQ3A4Jx6N9aXyL25JkKSdHMv3WQPzK44Jk
         2e2A/q4FWpYAEoco41Qr6Fg/vwnaX2gEb7tp/l5+6uXdPDdptI4Pesl5xHH4cg7APoDM
         xXr7IWGz569kWGi6atos85QR0WvnEdd4S1KRvyYLfeGlvWeUptRQx2C+hTl4q8K2moYJ
         KCrg8a9zN4bbWJ6l03a7dIFkqLljT/+rnYA0N4ceMuPNoy+7K/CiANyoHDZf26G4JbY1
         GpdzsZ05mW2cHfUkf910zsCe55jgTVY5t7IEGWbZmWjdYhFdhCAngArPksI90WX4Wf3q
         np0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117754; x=1758722554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aI0KZC1S6i6KZFgi+7mCnlg3sWeGuC+L+mdTKqHXWA=;
        b=YzhnWkPz9HnzjNtuAL1347y9krOzmQseWwXi9t3z41Z+bi64vTbdOI9VJW3m+6n3zL
         MAyZ5SGQpVplPjouWrRMjvPjve+ApiB3ln2ETTYbqfMSmAtVH88TZBXA2rGaJU4U9XGU
         yCuFilrOf4stcBkubut8ZkPqrYYKnbfPUypWWJf9SnFrOPfsv/GAOG5w2W0Ny3JcxdH+
         w2CrSMGQlpTVaIAn5l6r2pAqwG9E082Bt8mLauJLCgALz5ksId53B4pGvQOh0Jpzn9fx
         lqTJSNMHC24dNRNz6ByPaVw6k6VXieMu8cTKwRHBGic9EGDFosh9OxxfO92LHOpLBkxu
         LTOw==
X-Forwarded-Encrypted: i=1; AJvYcCUuBPYic8ZXFT64VnALA2C0B9UB2FwGUHwe2dYb+VHM1zK9pYdmuJlCMob7rvGf7akeRC+V9PFMgfZxKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLr5JWCSLYTZ+9v3myrGDEpvvyE5ZqSoDwS3hlD7EIeLBaiuJf
	X89IzyeRbh2IoCq3VctPzYteS7ogvdO0TBVymFkFTLnWrSpRgNVYZqKG/LUI4oduv/s=
X-Gm-Gg: ASbGncttH4X87jTyjbqcc+kAhvkERFJWGyjFcRrMjTxzn2CdsazpZ95M240A32KkaW5
	J7lHKbRAknaQb6MnUaBOafiYImHNrsRD0BKq9/IwcKlu5YxlSglsu6H8i/EE4kMIC5KXe8PJO6t
	vaWh2OTiPWePylOOQjQsTSPYioR25GZlcBe+U9r2NdseWo3vM2OplwHV3tlp54SIPZlMC8UzpQ3
	y/NuarxleZdcaSQnemOhmKNTKvqetHk5qpQhnQaF9zuUXt3TohqxsPYFtxZg6JJKujcn3OJqYEt
	o8/faQl7YPMW0mbcvAyMl2NxFwRZhbuvkZtZtDcQUspOHVUwtcSp+PdRV2o3VEeP1vrrqRXmMnN
	Oubj6EAYM8vFlDJtBlNYPCCzFQwjMZA==
X-Google-Smtp-Source: AGHT+IG4Gian2+1eYXK+LJPiJ/IOk7YXX7BNAP8tJbijpr4j+Tg2SNRKcI5T/sLwoI+EVC41Iboriw==
X-Received: by 2002:a17:907:9691:b0:b04:3b97:f965 with SMTP id a640c23a62f3a-b1bc1168641mr281451566b.49.1758117754340;
        Wed, 17 Sep 2025 07:02:34 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:96c4:427:30f:64da])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347a4fsm1352382866b.103.2025.09.17.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:02:33 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:02:29 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Amir Dahan <system64fumo@protonmail.com>,
	Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 11/13] arm64: dts: qcom: sdm845-lg-common: Add
 bootloader-compatible board and MSM IDs
Message-ID: <aMq_dbLRShTVLlc8@linaro.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-11-5e16e60263af@postmarketos.org>
 <acb4f8a2-ff08-4a90-a7ad-7b25a7f4b6b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb4f8a2-ff08-4a90-a7ad-7b25a7f4b6b0@oss.qualcomm.com>

On Wed, Sep 17, 2025 at 03:55:47PM +0200, Konrad Dybcio wrote:
> On 9/17/25 3:09 AM, Paul Sajna wrote:
> > The original bootloader (fastboot) requires board and MSM IDs in order
> > to boot the kernel, so these have been added. When re-using the same
> > files to chainload U-Boot, these compatibles are also needed to ensure
> > proper booting.
> > 
> > Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 1 +
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > index 1baec758c7d881026bf6001a0a305687d7a14b40..a513cd931b3a984443183ee4e8df7b0e45732630 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> >   */
> >  
> > +#include <dt-bindings/arm/qcom,ids.h>
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > @@ -29,6 +30,7 @@
> >  
> >  / {
> >  	chassis-type = "handset";
> > +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
> >  
> >  	aliases {
> >  		serial0 = &uart9;
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > index 8c1692f86e6ceea7b718361965e78f95d39373bb..beb1372dc6c17f5f06c2044412ee1c8165858cd1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > @@ -12,6 +12,7 @@
> >  / {
> >  	model = "LG G7 ThinQ";
> >  	compatible = "lg,judyln", "qcom,sdm845";
> > +	qcom,board-id = <0x020C0008 0>;
> 
> This is almost QCOM_BOARD_ID(MTP, 12, 0), except for the odd BIT(25)
> which the dt-binding promises should be left unused..
> 
> +Stephan maybe you know more?
> 

I'm not sure what BIT(25) is exactly, but I think you can generally give
up any hope of trying to make sense of the board IDs of large vendors
like LG, Samsung, Motorola etc. It's a pity that Qualcomm has never
created a board ID scheme with enough room for customization for
vendors. The qcom,board-id scheme seems to be entirely focused just
around Qualcomm's own boards (MTP, QRD, SBC etc). That is why we ended
up with every vendor using their own incompatible approach. :-(

Sorry, I wish I had a better explanation. :-)

Stephan
