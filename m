Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0414B950
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776305278; cv=none; b=rzBrZyA0XxTyDg9cEvwTj7ZN9Nk7OEg8wlaLAqmRDks9UgqqjLKDIusM/LQO7n1iQbZH0GXDUsZBW7tHO6DmOIfkt+ai0WQELyHenYLYVGgyq5og+btVa8FMiztWxIwn482N5GCM53HXP1o7Iy7ndDm+2DwRDPnb1nxVqjcoJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776305278; c=relaxed/simple;
	bh=kLV2gmEqZTbzpg/+kgChtK1IvtfTklo7fcABvu5X1mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSbT+d55xe15hV4roh68hFAOpZDYIOZukq/ciGSJwOc4m3YkgYE0Zjmxe8dgfeMgfPsKebDX3OdVhkUrkx38acZydPqdFnHpNQfGIhIcesU3e3wp9poKvXM5gh2cENFr4ZwB0EHgF7JYUugZhw6MUxjH6eGLSWLDZVmXmoJRmo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un0F9wGj; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un0F9wGj"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d6d5e45c43so904126685a.3
        for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 19:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776305275; x=1776910075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4chQeqQ2PHe+PX11zkrN7TC+Z5lJzf/WQwlK8ZX4R80=;
        b=Un0F9wGjcnlPDmMZr1spggHsArtKec+N3JL8mn1ssQzV+pzPtC3PRH9GAMx4VEGBKo
         Fq3/Gs4E2xEEk3Xgvwa7BvKH9aR9OUSP/FWLfmYzKhP8vIkWwEnylg0xXw2vW9q6YkKg
         pmSlm3h2rwGnZO2b428RZv3XXjpD7Lg9qFIwkN1FdM0nWpqQpnAB6eSRHkceSD6wTfZZ
         eRNpO+cPQzliBGoVcqtwjeZQoSOz9Xa3GdJd/llmj/C7va5ci0ityke91t3fZg8mpI+Y
         brI99b4ypgeJCltm0Q+bpJmQ3mQftWkO40a7CqH8OSVC4BZw/o/nI+ERGAbkL1g0fM4n
         HsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776305275; x=1776910075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4chQeqQ2PHe+PX11zkrN7TC+Z5lJzf/WQwlK8ZX4R80=;
        b=aG5A6FTm3i+4bvXAM8gqFwV1xVw0mJz4QNLWIg/wTI09zm+py8SAulN0BecHoX3bwn
         rKRBcUsQRIen2UHWy63NvUIZeZ6kVCj7PCn1N742LyIp8vYIZXzL9dUXox4s0ixzVR1A
         RUDCRtC2pIxRdDq+YpA5ZGNx3bmhJiu0i8yRSXu+P0Zq5zIXEC++l68v3uTWT3OBrmHF
         YHrjkUmSCCGJExDWw0tRNyh9dnq/rcxLXBCi8fePRuz7JcJ7tSzn8A2ScKlr89VKCCYP
         OfkB/aCbuvZjBEbxvepUpfFWuU3lpevzu5QOmXCnvt6Z/Sfp+BzA+T204Jl05saefK+T
         wygA==
X-Forwarded-Encrypted: i=1; AFNElJ/NOQKl2YeYICkDbdcTulUyu2hCYM6I+s2B93eFBJNJzwzzE/NdPmoXl25dvNMvdr2Ep+Ic/2FigUGT4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bky3zKN1Toa0NYl+E3QkQCs6tBx6vqek4tLR1pQHRDi2UKou
	AD5tQnEq+Oifl7YzKMOCkkcb2FdxIixyZw3t8QySJID1jEvEJEshLfit
X-Gm-Gg: AeBDietOvBEeQ3Ib1x8BJlj3dNLyRDi7f0tsSgto1TWs7+k7fBfLMkkKxyAISqMxCe9
	MicGDZlztHGH9VLMKvagBvFvHcrSzWeV44CcVEjM01S2qbuadIRF5SKco/a1Xm/K0oNeziYC2BI
	2H/53A1SwBIM8Kl8TfQ8yB/3Q/MgSnb3t9il0UCXYbOAQlfFd0O/1HPnBUXSsjt4GqIS9bJn4+s
	MKdh8w6UVb31aUchtH3+5DD4wX9Xibx+dHDhHsMReKJFbcFUku/T5S5GNi1nqgPWUa0VAJo6Uzz
	rk0083jUaVFwYXldReuR9zGcDppfgj+cL87Qh9o6zZxSENZ0QzHLkC6JQiIv7s4LbPS3KH7NZoJ
	J47yUk3+xk34i22mFBpK7UZ5SqLjzPaX2Lc1BpmwkWrOe+ZwXd/bZVJ841cnSGwuVAezB1xgjcU
	KbPlI850Kcq2Uoj0tHX0mnLoayTNirF/caKQfb
X-Received: by 2002:a05:620a:2995:b0:8cf:d5f3:9a1a with SMTP id af79cd13be357-8ddcfca7aa9mr3612178885a.51.1776305275080;
        Wed, 15 Apr 2026 19:07:55 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4ef33af5dsm260449785a.16.2026.04.15.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 19:07:54 -0700 (PDT)
Date: Wed, 15 Apr 2026 22:08:35 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
Message-ID: <aeBEo3TCCquUCD9J@rdacayan>
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>

On Tue, Apr 14, 2026 at 12:12:10PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The IMX355 sensor supports multiple external clock frequencies,
> including 19.2 MHz and 24 MHz. The driver currently supports only
> fixed 19.2 MHz input clock.
> 
> Refactor the clock handling to make the PLL configuration dependent
> on the external clock frequency and add support for 24 MHz. Introduce
> a table of clock parameter sets and program the corresponding EXTCLK
> frequency and PLL multipliers to maintain consistent internal VCO
> frequencies across supported inputs.
> 
> The PLL settings are adjusted so that:
>   - VT VCO remains at 1152 MHz
>   - OP VCO remains at 720 MHz
> 
> This preserves existing timing characteristics while allowing systems
> using a 24 MHz clock to operate correctly.
> 
> No functional change for existing 19.2 MHz users.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

We are in an open merge window for v7.1-rc1 and there don't seem to be
reviews currently, but I tested this revision on v6.19.10.

Tested-by: Richard Acayan <mailingradian@gmail.com> # Pixel 3a
