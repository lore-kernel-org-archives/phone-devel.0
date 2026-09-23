Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F7939DBF7
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203731; cv=none; b=fi7vmMBFuibM7BVjkQ49j7UWj8miQfUUVv0WYUDM0q/hM+9npKwN+fdcCb1AG/wUTJWR1MBeeaoVQcgaZwALKr4u4LD4T5Cu7kxDHELBUDZF9IK7GamvKeItmHCbeeA+i2H6JXF3ClCbiY8qLUW1jArZPWCOo2Un1RB9jsI9CXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203731; c=relaxed/simple;
	bh=6Nk6QdgYo95ZGM13mOWSLDDAGGI4lM1uB9pdRziF/P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeovWwo2RNOT0bLh7VIwrUaAqWqK7GEt1jCaXE7zrV0Bne8IZhorFIGSPKiYS7HYEo4zc4y1uaQXVFDpeNRubRMMrBYKPSa6jHXA4VPUnLg0GIjm+UnQBdV5Znynpedy9vrIEcwrJ+rThRlREAGa5z2yGPQDpS9SdcSpRB/Yqoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWp+f43c; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWp+f43c"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1175994f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203727; x=1790808527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bBcYE+SQRKaZ3abUhRDaAJqY0dLEhd7Hp6zqwKtzbA=;
        b=mWp+f43caqaOgJy3Me2J0R5EcGIgkYvvgdxqxJwqQgvEnPSsWuOVAfdZh7h/nFxWCY
         yEOJagKxXKUAejeaebs48LLa68oxSQttr4TTbdpfiz6CM/wW7fcVZWTzK2SASHE6ZgsF
         72UmOgwOUXKlaAvips1w8LHSxSfHrknpGZCT7oBsexbtjTegcyzc9EovYlSvDQB5JDLe
         4w7k8DB1sBkl1vpJUBFO82hB01mx6GFRiM9HfvU4EqRQnLKhxGGTYoyU/sXPyzRNjyPP
         3Igbr61kGGAPFun6Lq7g9v9K5GxVr3krukblaK/vIbK/HsW39KOOMNC+npWdYJlNCuYP
         NMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203727; x=1790808527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bBcYE+SQRKaZ3abUhRDaAJqY0dLEhd7Hp6zqwKtzbA=;
        b=vG2gl0l3TiR7/f7IgMIf+ELpERIUG6D7iuaCzoDmIOvbWHX1gZVVg3wlWRPdVE58xN
         fcdXgf4LRFxwHMKR1feklxIVIdX/2RRozcuaabBdw9458G1mgt6rOK15LZmBjAKfDJkm
         SxwF+62vPPGRUTflqEbvfEmszc6vSpGQH/rNz/ui1HwnQM/2ZsbNiJKfFOQtjfhbHEz/
         71We77Kaaxnpmg+DFuKabzW995rl39CArNU0O5DDu0qd8wirts/noJHMzxj14+EEr+ST
         rgnHF9CI5MEpgBe4dLgxvql8D7n8XOUdskIHB1KCc70HVEuA8Y8GbKjN6p6ED2ZeMFif
         buog==
X-Forwarded-Encrypted: i=1; AKwUvByzKBqIS7g7S1oJMrwsgVxM0hRznluIEv7e9eAAWvattbYzA8kIopCmOBSdtj/MKGxI1aQGSNeUDUA6TA==@vger.kernel.org
X-Gm-Message-State: AFuF++l74rxTde5BF+GZ2FrRPnkbf7mXAwWqp0r/by2zrVJOPUutK0o4
	p3GjV0m6j4Ca0xy7zOrIobnrAIRR2CfUnlqTb+nHz+aPaQvRXjNPNWkr
X-Gm-Gg: AYBFou3YzrOY2m8y/cHMTNkr2CKaam1kZNxTj0yE/ovh8+iKM41fjQGNbPh+pGvSG2u
	1F/dQxQ7KK7XxjBK3vDYI4tDdPpqqy1/cRJtcwFRh9ekAmG6u4f+J0kTvJdm+FeV0Coy1wzAqGe
	gAcibVPE0FDBu0ZOPtXsv7AwD9E4C3DIyQciThcxb0qtOlfJPLboe4eHKnScoaX4nO9yPVrbAfx
	zJQlE3QTPJSXHK3BnjvilrANq5YbHmsjawuwajx5kN65NHh0bpvTflu0CphMj+/f+XP4Zcnni0k
	hv5y9T7hz0X3Sm69OJirPozPbwgiAJut5GHf+Us4RXJIgbxwNpXyYOel5yTdoADYVwkSO3V31jm
	YRKBwbE5lpAWUj4L8JwMXKnYRWwzqzzi5IZBRVYhUvBIf1Im/Q1sxNP7iq6w4gmnpLsqVpKmo3t
	1tY6lZAzFAFLGxVekGiU5ZOp+TJfi8AvGjXoL5ae+IhRDYT3j3FLiPckhUmrI3S4AfM9Fi7jbKH
	ApKgxudiGRBsomcpiFc+K5aOh3f4i47OwM=
X-Received: by 2002:a5d:6f1c:0:b0:487:27f9:83b with SMTP id ffacd0b85a97d-48871718605mr854372f8f.48.1790203726768;
        Wed, 23 Sep 2026 15:48:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm10789083f8f.26.2026.09.23.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:48:46 -0700 (PDT)
Date: Thu, 24 Sep 2026 00:48:43 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org, airlied@gmail.com, andersson@kernel.org,
	conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dsankouski@gmail.com,
	jesszhan0024@gmail.com, konradybcio@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	neil.armstrong@linaro.org, phone-devel@vger.kernel.org,
	robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update
Message-ID: <20260923224843.GA185053@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
 <20260923222521.188197-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923222521.188197-1-petr.vorel@gmail.com>

...
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> > @@ -262,23 +262,23 @@ &mdss {
> >  	status = "okay";
> >  };

> >  &mdss_dsi0 {
> >  	vdda-supply = <&vreg_l26a_1p2>;
> >  	status = "okay";

> >  	panel@0 {
> > -		compatible = "samsung,s6e3ha8";
> > +		compatible = "samsung,s6e3ha8-amb577px01";

> I guess that keeping the original "samsung,s6e3ha8" would cause that ABI break ABI, right?

> compatible = "samsung,s6e3ha8-amb577px01", "samsung,s6e3ha8";

OK, I now see the deprecation in 4th patch.

{ .compatible = "samsung,s6e3ha8" }, /* deprecated */

Kind regards,
Petr

> Anyway, LGTM.
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Kind regards,
> Petr
