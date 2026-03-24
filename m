Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA11BBBFC
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317911; cv=none; b=fbZByYf2x1rEuuyF2c3GHSAHp9yk6ocPYQPOZVKF6m8cG/yWRVEGwh202pE2q3H9vC3fPWvOGzJ5fvJ/taPhW6BzfN32Eru6JGI5XKM+rY7CzcrXWWMU1shwNR6INVA5oQsVtYRAtBRgTfswbfIpG/DiP727jB2jNGGQPQ/J91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317911; c=relaxed/simple;
	bh=+ehVjjn+FFP1aRjNxMvD8VGxFjrfQtZn+7RGgcX7Sic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=issQTSbF42tD81I1coV6R1eN435MxzntLkmEdpfs6SmUlkm0aeLRdNuece9FrjmbgGbbBscFat/bIbuRu5jWrALcsVhNqJ6Cf3trKO3KtabMe0gzMfPAx2vOFA0iQwbZelkWAl4Or/zs+VJnydyH/kiOpuXfjfqHjta4/cA6bu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzYjxuNV; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzYjxuNV"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfbbf35354so464976585a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317908; x=1774922708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=nzYjxuNVWsy2FAJrdUup/mIJSbRkLFV8btqoBVKVP6d3j7kaRWMaVCI1a9kj5foQ6S
         dNkE2Ur1Mcd6lE2LZ5+/gkgtKM0ls0uYRXYuAvYgnJwg+bmjKkVlRZlObOn3qVfzTN8R
         HH4viLyYStE366bC3xc700XYNzdbUVq2FgELOFvyEMqN2gmUOAt3r4ZiWNVE20yvNN8s
         BZDDAHTmYUNlIhCFRyC4WVuL2lmUGpr5WNwEPmhwmvgqkyhcoeiw3yGJ/gahQExhMZ+x
         +q2lDIpIk6GrGVGXcvcrj1qxwqJSTezPv4CIOUaxx7371PuaZH8t9xo+WPcqSHRODHgI
         XPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317908; x=1774922708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=F6O7LiCiI5aSja+CZOjTUi7z/Uk5e+3Boxq/f6w8qUL/QbjfmjSDM74OEwonIbK9BE
         4vJ3gIgbmIo76ejI30smDwGFen/8GooLj+VdiCcon1KNUuKKQuGuIrkrlYXebcIKHWED
         TOGMSyS0v+6NgGLCJ9ro6AWQ3Y66d5BIsNzs9+5JS2vTHDu/M49L5G9/61AxGomld/5L
         8uXVcclPz4J/jC56uSmGbFGQHhfl84H+44MQPlSlYQug5vx1zpWPSrrvRB73TG9/JVp+
         vRskKc/91iMFtTXUuiVSJtGcuu8matoooe6NomZoyhRZpWmXfquAQcojMYfOb57qZ7Tl
         ionQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTnBOyiKYYwCiibeWBmHTSGZGM9kxwygPSCTVDCWQ0v6EOZmKrwmYHynhR5zE4xT2HAdRimBBsDLFTDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrgN23WRrkQihly8dzguMc0RSOh3gj2mGKXlRb2Z5Wi99CKcOG
	JhBchdd5lHdEJAwWbfePBqpeh9Wrsz2QEyLhb7Br8o/Bg0xEiF5GVLlb
X-Gm-Gg: ATEYQzxkfXGHi/v4TFw3OO5JEoOkoGCT6NmwP2j7z/+dZb60Y2pgoydSyRiWFFIrfv0
	wui+/lkDhhMKTWiUptB840F+2Xuj1nV+ig5BdfqsSl5tpxSSEoYwwjhfKhyfOLdNx0YdLlPddwN
	XAO6Uslz91+3CLhGICS4NWDT596bxs47X94BcNv74YAtpbjOBbnUfkJoWXkQetfGIsUfSyDdS5Z
	4+BI9xfz3wsTwbFaZvfglEYqZY5uoI5U+W5kSi3E+duSZ/6LAcls/lztqCDlSVUedq8SvxyhHDU
	5u/1fA7BHtmhRyAtEjA9QYcu5HK8KLwI+7//c9wZcT1TlqdpH0e0q+LK1Tb5Ri9vO5AI8BG6hzF
	+Bpk1cIqcRYhJVErvKL1oFSahOE4PG10niKcfMr0nTLnqQR5RlugltM2mWtigHAz58kJryRtgHI
	Iyvp4kgbGegBgCuKJtvy/H5cSFkL27oVMivhGIXVBGcYz5jPuIOcUYhBV3Dk16uwa7Ww23oPZxL
	20c6OatB5j5+SU=
X-Received: by 2002:a05:620a:4543:b0:8cd:bfd9:e2a2 with SMTP id af79cd13be357-8cfc7f33feemr2140906985a.43.1774317908192;
        Mon, 23 Mar 2026 19:05:08 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff5d486basm50081285a.45.2026.03.23.19.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:05:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:05:52 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acHxgIsyPiQTeqCB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>

On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> On 17/02/2026 01:27, Richard Acayan wrote:
> [...]
> 
> > +&cci_i2c1 {
> > +	camera@1a {
> > +		compatible = "sony,imx355";
> > +		reg = <0x1a>;
> > +
> > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +
> > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +		assigned-clock-rates = <19200000>;
> 
> Extract from #sdm670-mainline:erebion.eu discussion:
> The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> driver can operate only with 19.2 MHz.
> 
> I assume it would be worth it mention at least by comment here.

This might set the series back because the devicetree isn't meant to be
written for specific software, but it's included in v11 because you
already asked twice.

The frequency could also be stated as having "better software support"
in general without mentioning Linux as the reason.
