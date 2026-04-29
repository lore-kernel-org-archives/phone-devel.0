Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2E40FDAD
	for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482962; cv=none; b=MRFUcbQ4iGMaA4vd4KJBHpncycA1GPebFcIoGiOxM0r7oHy0pXN6h6IvAd3HZqILhir2WreqOjECAozGl54ZFMSxopkvOEieUVNq0Is+jWnJ42ArtPTIcIr02rbyJlDZGliuQfviBmpXd6ayzAflkiIaZKGrkvAKGfGBJ7IepIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482962; c=relaxed/simple;
	bh=b8BmgDQogRwggORM8K4eREtWvgZJXefpsvQX1y50FaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLdeD09iu5kFBHSgdDH17l1mjKgPLegtjlxULl7Bzolh1aTTrePKh9y14b3igLKZlwXshqfoExyKjHpQ/4Wz1OMiDqIBUzB7WOqeCEDYlwazICK8OAIUvQ1X/4dSuvJQzo8kp6j8ZACKNcB87MPxK6fFFH+zVLZcH3kPIov5ZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cj2kWvNP; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cj2kWvNP"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso5323875c88.0
        for <phone-devel@vger.kernel.org>; Wed, 29 Apr 2026 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777482960; x=1778087760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=Cj2kWvNPSZ8mFDgOVB9IQEtQHM1eqS27Yp//bGwnOK4bEjekHtTi+lUngWTFwqciYe
         9HD3EuMMV4lgNLYbuZeJ1k4stTstVnGZpcDBxxuUhBjRnbdoy7TTx0LCRivEnS8oH4jV
         bbcuYLe8HiPyalDNy7zruBgWoLbUCw3sMSvl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482960; x=1778087760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=LmVBe+CGfxz6vXkGCPJJwLeAPSx3jLwk6s2FovAMwGt/Lbu3kfZ+EieUSHQYfX1AT+
         /2SXAwF8jGMzNW3RMOtqjC5m3NANVzRd50jay6cBjIUnlNC0So2KatXs1GjEwmI711PM
         MAsSHoB5c8gpt0rrgx1tLdj+s5d37UykPYSyI47FRnTQqDXpEJhTRJWAu9t8lveCRtDc
         9lhHvSivhFvCCnczbPKVrfzVMZ9pKGcuIA7L9lwdPcoaatDnHUwpbLhjfh/lBjEyZx6+
         wQCv3y2tEVlNqkl0PTzeS2fJvb+x0GI/lbmUj0Z8QmNgFSCGAP4iC5JXGEaFpj3m78GX
         8tIA==
X-Forwarded-Encrypted: i=1; AFNElJ/MZ1XxZMMsrdblZz8PqtNhZXHhW+X2x094EiBdRgn/OU7GQkjjHxRDO9SWbq1qw15UwCSm09wDV90LTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBWSJYT9Y54bxO30mZik5dUOj0v0ZzJC6CbPeELfYwaa8r4Yz
	gK8jU/7PkyeTVvy4AYmYXyTAM1V+Ed4K/E8rOAKYRm8Eow5CkFwg88ONn8CWGoHbwg==
X-Gm-Gg: AeBDiesw11ZxucErHa2IGEKJs7iMacMkNUC98qjWdnEHg0Ew37XQPUaY+aqAna1sPSF
	we0Neyrx+noMkthuDs+z1T1k3E1+uMssoRcI5tRDdt+Im7OwHkRnvdDdTx6Wb3onhIjEFhU20CO
	/IIHL6AmwJruMwEn9ySyy0VWBMxxH6P9Rz+32vsnhzeBcH41wyOqw9/ykfpjXzvccOwC/j9ROwt
	ATnWlixV7B5dkt0oPtMttQkvqevopqxfWznLlowXdsv6TtZXnrNj89FuhwJKUgBvGAOlx2VQjc2
	wWQlRyiV8GxAU32gjgGaC0m2HRpe5ahIQxftDJOfOaFiKigDKNBZ9o59jZnzzkYiE2hPM5UM7Lj
	IzxBQZ3lNg7/pctRxeLEMxU3nbolJcLbEt+Pe/EOrCPd7JfbEqJrgig7bO2DGIM1YJQUBZ7/nqa
	yWZikw2KLa+lVeSyJEtHqjnlsWop2pbuub6pAPcgVa2M0wDoJvth5eoaKxzfawQJhHREjdlpmB
X-Received: by 2002:a05:7022:f8c:b0:12a:b39a:339f with SMTP id a92af1059eb24-12de2a546bamr2101891c88.21.1777482959913;
        Wed, 29 Apr 2026 10:15:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b8df:3c88:ad8d:d3d4])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12de32178cbsm2889982c88.6.2026.04.29.10.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:15:58 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, david@ixit.cz
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <afI8y70U7wFT_07h@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>

Hi,

On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
> Francesco Dolcini, 2025-11-28T18:05:37+01:00:
> > On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
> >> To reiterate, the firmware is generally available but is not part of
> >> linux-firmware and the entire process of upstreaming the chipset support is
> >> stuck on that.
> >
> > I'll try to see if any of my contact in NXP Wi-Fi group is able to help. Give
> > me a few days.
> 
> so I was in a long conversation over the past months with Jeff from NXP
> who was very helpful and tried to arrange for the upstreaming of the
> firmware. Unfortunately however, his efforts were ultimately rejected by
> the internal management.

:(

> We were directed to try to reach out to NXP via the customer support
> page which yielded nothing. The current situation is thus the same as a
> few months ago, summarized in my quote above.
> 
> Brian, what are the options here now? Would it be possible to make an
> exception and accept the patches without the firmware being in
> linux-firmware? This is an old device with no mainstream audience so I
> expect everyone who will want to use it will be able to supply the
> firmware themselves

I'm not really in the business of writing rules here nor their
exceptions. I was just pointing you at the existing rules, and how this
seemed to violate them. Since the websites have moved around a bit since
the last time, here's the page I referenced:

https://wireless.docs.kernel.org/en/latest/en/developers/documentation/submittingpatches.html#new-driver

I suppose maybe those rules are there so that we don't get drivers with
*no* legally-usable firmware, since it's about "New Drivers". This is
not a New Driver, so maybe that part doesn't have to apply.

I suppose I'll leave it up to Johannes on this part, and may be willing
to retract my NAK [1].

> and it would be great to not have to keep the
> patches in a fork, especially when trying to build on top of them
> further (such as to fix the driver-firmware incompatibilities discussed
> in one of the patches of this series).

Patch 3 is a different story. At the moment, it's definitely not
acceptable. But I tried to provide hints about how you can write proper
FW compatibility logic. I'm still not optimistic that'll be easy and
maintainable, and we still reserve the right to reject patches if they
make things unmaintainable.

(Marvell clearly didn't do any real work here on maintaining good FW
compatibility.)

Brian

> Francesco, would you perhaps still be able to help in any way?
> 
> Thank you, kind regards,
> K. B.

[1] I think you're referring to this:
    https://lore.kernel.org/all/ZUQN4Ua8byy-Fsy8@google.com/
    Re: [PATCH 0/2] net: mwifiex: add support for the SD8777 chipset
