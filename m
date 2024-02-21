Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26078376E2
	for <phone-devel@vger.kernel.org>; Wed, 21 Feb 2024 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514412; cv=none; b=tuhO0M8VSlkKLxAnXsZkTYCWjBi2N59qteFAIDI3O7TiwFR1iUqrrPkYSdXCVq7Nz9/dzssonvwxnt2lh8XMhjZCqjopvJehVxVE2jQsxkzk7xUXKgz96Ftr7O5/zKLq4fuC3c8jAYSxfqDiJGiWSh6B8+ewwd5tSF2Cm1iMuK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514412; c=relaxed/simple;
	bh=t6Jx31rq5xX7REiRG38utqdz4b1fpoQ9OdaCX+5oH6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0xDyvuAL5ZjKQ4G0sYNb2SV+5YRWHaOpO8lJNwnFgaoVqxn6vRvRGKZ0JASi0zC4OBHEPwSHX9znahAvfFupnmHLMjrRlVm7JBFX3kCKXsfKHx1srnRaa3sO+3Jm53FHKfh59zYVsQsLTc9Nat/Vn6pxhsS7p9mJCq7+KGEbSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+AOcz7e; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+AOcz7e"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d01faf711so4042101f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 21 Feb 2024 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708514409; x=1709119209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IS7GmUQyf4Yyr+5gHh+d/StyGrTtVUVJakHsBQ6JDE=;
        b=h+AOcz7eu1boC0vHSNLbMnZgvn8VVxWe1wSbQEy1wox8oosxGCNa4raY1wzMV4IOSd
         aPKR75PgDzTv+Af91Lqz5Whe61mtVnI/zty+irFslmn+J5JiBxgGwWn+tNe4OZTJNWtC
         AI+LAYtSMxiatdMs0HD5WPIJowWp+3ghSHLAAMt+a+9F/9Meq1CERhOnCsblEtTxwh0w
         cHMiAC9sHw/Z2fb41YEJIusiDkRgvyCe/kc8SvpH24kkHfW3MFdhooB2Ro1QtuBgBf2o
         IY0VYneg5yn+cb5MgsY2UPiYO4j+4mDPa17UCa2EEVAICPYK/DXjqvCReV/J4f6zoUFW
         TyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708514409; x=1709119209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IS7GmUQyf4Yyr+5gHh+d/StyGrTtVUVJakHsBQ6JDE=;
        b=eA6FNVEyr3mWkOrhB8EArBg1sm0gnT13aJzH7GmWDrQDp/kcbjVOHaa6OURtjQGcWg
         l3PDuMmKphXG8cBZwoj45/aYBlld1jT1sq/cR+efitJny36g/OLEoMem6u4va+u7O1gQ
         hWMXYEX8xc1WWlZMxMlyZ8ZDjvCfmmGcMPTcIVFpRkeab7ApVa+iuwj2wVJBFjv5BEKo
         C5JdJbNHM1k08WRwq+QOKIQ2uU8BwJzcljpBoUfyB36ofSbftn6FR/gHvLz5TxM7519z
         orTsBriqe9pFQdsQMdwY063gzLBu1/aXP7bNq4EDPsSjbHZ0pga+OAWQN6oGdWBGK1Nw
         UlWA==
X-Forwarded-Encrypted: i=1; AJvYcCXNkslw/NIul4f2K+CLiFRT1eGb2l99/7UztyHVMLCrlP3TjWtA6kWdKeAJIEyHvOA2mtFbUGzxoM2s00p6QC+O2mmLp5tj+6n2QNY=
X-Gm-Message-State: AOJu0YyPp0Zk6u1HGYvMrVA3/uC4byw9p3bg5eNb+IMm0PeNSXceWwV3
	jm8sqpT43BdyyeYTJUW6DYLRE7ZrVi9VgNeonu0Ni4VWNyYpMNTtS8gnMEEK2y4=
X-Google-Smtp-Source: AGHT+IFiJJDtB9EWh/YWcgzszDlU4x8SjMxMWN9afl/QitAi2hghHKAv2cmSNEg07ItVMniNr+hMeA==
X-Received: by 2002:a05:6000:1841:b0:33d:839b:113b with SMTP id c1-20020a056000184100b0033d839b113bmr630280wri.15.1708514409453;
        Wed, 21 Feb 2024 03:20:09 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bn7-20020a056000060700b0033d3ff1cb67sm11304851wrb.66.2024.02.21.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:20:09 -0800 (PST)
Date: Wed, 21 Feb 2024 11:20:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"G.Shark Jeong" <gshark.jeong@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: lm3630a: Use backlight_get_brightness
 helper in update_status
Message-ID: <20240221112007.GJ6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
 <20240220141107.GF6716@aspen.lan>
 <5027630.31r3eYUQgx@g550jk>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5027630.31r3eYUQgx@g550jk>

On Tue, Feb 20, 2024 at 05:43:32PM +0100, Luca Weiss wrote:
> On Dienstag, 20. Februar 2024 15:11:07 CET Daniel Thompson wrote:
> > On Tue, Feb 20, 2024 at 12:11:21AM +0100, Luca Weiss wrote:
> > > As per documentation "drivers are expected to use this function in their
> > > update_status() operation to get the brightness value.".
> > >
> > > With this we can also drop the manual backlight_is_blank() handling
> > > since backlight_get_brightness() is already handling this correctly.
> > >
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > However...
> >
> > > ---
> > >  	/* disable sleep */
> > > @@ -201,9 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
> > >  		goto out_i2c_err;
> > >  	usleep_range(1000, 2000);
> > >  	/* minimum brightness is 0x04 */
> > > -	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
> > > +	ret = lm3630a_write(pchip, REG_BRT_A, brightness);
> >
> > ... then handling of the minimum brightness looks weird in this driver.
> >
> > The range of the backlight is 0..max_brightness. Sadly the drivers
> > are inconsistant regarding whether zero means off or just minimum,
> > however three certainly isn't supposed to mean off! In other words the
> > offsetting should be handled by driver rather than hoping userspace has
> > some magic LM3630A mode.
>
> I could also try and fix that..
>
> 1. Treat 1..4 as 4, so have backlight on at that minimum level? Probably
> wouldn't be noticable that brightness 1=2=3=4. And the backlight will be
> on compared to off as it is now.
>
> 2. Decrease max_brightness by 4 values, so probably 0..251 and shift the
> values up in the driver so we get 4..255?
>
> Or would you have some other idea here?

I think #2 is the right option but shouldn't it be decrease max_brightness
by 3, yielding 0..252 .

Only nitpicking on that because, given how old this driver is I'd like
to be conservative. I don't expect there to be userspaces with magic
LM3630A modes but there could be some that assume #0 is off! Hence I
wanted to make sure we are on the same page.


Daniel.
