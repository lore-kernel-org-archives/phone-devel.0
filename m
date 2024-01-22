Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323D4CB29
	for <phone-devel@vger.kernel.org>; Mon, 22 Jan 2024 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945837; cv=none; b=qeANnfUhrjOt6uGa6RHbNLfeCYnzwOAfsn+BuG8aKygBviZmufh4J8S0ryP3QxGMIq6Wwbo7W2NU3ZqfItfaX2CJj2eidfV58bVPJIEw/I74GHPtSU5uShn2csD5Oh90PFdxthp8FbfrxPyxR+PnuRwSjs43MywxKcHziywR1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945837; c=relaxed/simple;
	bh=xLPMMOi9U5aA2QOUyNYRwdev7zD4A+KnUqD+T4+EA/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4B589bBKi5jJz4OnS0cpIayZ77SyGxsnL3D3MUkTWc1z7sXywTuR4MPyHnZzXO5nmweq/0+zC+S7QjOZQG6Ln/lmlocNAonEcsoJXcP6IP/otCopF3dHrnGSuGylOhH1i5VpO0KJ7pGEwb87PqZOinkpcfiARC9xMeXhOA9kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3SK6Tjl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3SK6Tjl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-339208f5105so3004912f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 22 Jan 2024 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705945834; x=1706550634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
        b=F3SK6TjlNfQnBS4iXAAc0b9u8u04WFz0BR17agbw8LPd7czINCOtAvlubBLCcdN8SN
         Iptkxj8v2kLA1hD8xExxhw//T+icNkTpoyiLV3tbzGANVQY8vtzflRJ4r49vQ/iL+d/C
         T2e6K3UOUeJl3D94hie4a2pHfJb0Lp+CWygjk7wPIWElGw2A0AZMOntSoFSLLEXc9IVc
         LPDmA5F2W5g9kOfjmr+DYpXc9hKbpTnEN5jQ649bqx64YApBYnLYKZBdI/3OFrstB2jA
         HJgRegE0xklM7YWjyHkSVYILVlofiME+Pzn1sqc4YipxIbM57oRgigJtixgInp/J21m4
         vVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945834; x=1706550634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYGuiuUN/VCPpW9oWOQ4p73+grZOykVwihNpjjDuv0Q=;
        b=lspyN5CxTZGn+ntYUVkeTdiY6NqtKcb4zkN6Mq6595XEPHyhpEGu1XizQ4X3PF8qCF
         QJfsjMdnJfHNbn2grp7hufgRegDYHwczVo/UF8ZT7PoTF56+B55idH7ekbAMtos3JjLI
         LIPoR1IQGiICfSuGkFmeUCs+oxNJqe12cLEwW8OEYew6+A0VF134FfjM610Ze2wXT2ot
         0ZMATnN2sCL3XWtzg90eSVIjGua/xHpTemUfxD2Zw6vbnTMdmJ4oZxHwPbvwZ0qlkm+k
         //gGZoxhMOizxZ8vqA5KYA12H6L5t7H6LFCAxZevr5t+wyjGyTew3aytrvnfrTOtlFJy
         cAAg==
X-Gm-Message-State: AOJu0YypHZemCHKN4KZsGj67W0p4CLUd5h4LED3LuyBFtjI06ltYdN9o
	KORgYVxdCTcIKFhQB7++90Z7aB2BC6ZWC/z2mX8W6hBGjNn5393rjCUtJJ2ZcMk=
X-Google-Smtp-Source: AGHT+IGMKjXfBPPqRjfBziR7QI5pQ0EzWnQZly3+fsLmJWUOsG/MDJPaYvuxqQs8u+NniIHlytAXNQ==
X-Received: by 2002:adf:a199:0:b0:337:bdf2:26fe with SMTP id u25-20020adfa199000000b00337bdf226femr2086857wru.161.1705945834114;
        Mon, 22 Jan 2024 09:50:34 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d6a8f000000b00336898daceasm11996072wru.96.2024.01.22.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:50:33 -0800 (PST)
Date: Mon, 22 Jan 2024 17:50:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Karel Balej <balejk@matfyz.cz>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122175031.GC8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240122165011.GA8815@aspen.lan>
 <23373359.6Emhk5qWAg@radijator>
 <3603320.R56niFO833@radijator>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3603320.R56niFO833@radijator>

On Mon, Jan 22, 2024 at 06:26:04PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 5:57:53 PM CET Duje Mihanović wrote:
> > On Monday, January 22, 2024 5:50:11 PM CET Daniel Thompson wrote:
> > > AFAICT nothing will inhibit setting GPIOLIB so allyes- and allmodconfig
> > > builds will always end up with GPIOLIB enabled. If we are happy to
> > > select it then I think that is enough!
> >
> > In that case I guess I'll just make it select GPIOLIB.
>
> Nevermind that, it'll have to be 'depends on' after all:
>
> drivers/gpio/Kconfig:6:error: recursive dependency detected!
> drivers/gpio/Kconfig:6: symbol GPIOLIB is selected by LEDS_EXPRESSWIRE
> drivers/leds/Kconfig:184:       symbol LEDS_EXPRESSWIRE depends on NEW_LEDS

Can this dependency could be broken by declaring LEDS_EXPRESSWIRE at
the top (or bottom) of the KConfig file (it's an option without a UI
and does not need to be within the if NEW_LEDS block).

I'm aware this kind of change could provoke an argument about which
sub-system the expresswire code should live in... but I think it's
a worthwhile change anyway! We shouldn't need NEW_LEDS for this.


Daniel.
