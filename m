Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C027FBBB
	for <phone-devel@vger.kernel.org>; Tue, 23 Jan 2024 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706030553; cv=none; b=d+Juwz6piXTJ+IZVsyAJWmEovrWNpQL2OBIjzKP3kOGwHse7U4pBIUbSGYT9KBoSePB/DUGtAY5w3vQX9bVhOTt6y4a1c/QXX43IdQlerzEWmMUiA86gU68h96+dy7vWPxUotRNM9EtIrWJfuGYAKFBxVfpos4mzybjIt5JtNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706030553; c=relaxed/simple;
	bh=1Hfc6n+pM6KQNiyZQNXhNkFf773fzhUlASTk4Tfi3oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ro1Dn1NjkManUy36LYSq2ZlCwwRuvoH0C284s2eyHBK2GmfXJYlkXU3kBJuzY2T8MU/8VxA6hwQ3b+TTem+OD269y6VX0LZBTbIhcZDtCQUPOh3/OCXG1BlE8cnX5hQG+i8Wp7zwRoMwyiFzZCtK0rzM8oDaVAeDJARfK6hhzkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmMT0kqH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmMT0kqH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337d5480a6aso4389263f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 23 Jan 2024 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706030549; x=1706635349; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Hfc6n+pM6KQNiyZQNXhNkFf773fzhUlASTk4Tfi3oQ=;
        b=ZmMT0kqH8TvUD3gM5p5O90FrptpqkFMA9wSGe0G5ip+Y05ycwi2OKq2fkBmjiZgKzo
         Yf5XRSduF4j8q6XLhQJbjQSqe+Deb82QXBJ/BAxEgctBteQQS/424fATVuQI9cPM+6Xx
         0K+Fw0yFZOyqX0Qk2y1BIG4VjMwyHapqFtoU6LVkiefqBWPnTmM9dtqDnBy+wNJFp4XM
         hCAlAjpckhoqxVIrHmIqVrHTznRXFRKX2FsNkvhkKLCtn4o40gTh33A1SvFowFQrWaAB
         3qtke2qgNlHbBttjzKDYusXQdt+FC8b0XLUjizG3o8yvfcXc1FoXNYcbLjsGAAp61hDB
         WUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706030549; x=1706635349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Hfc6n+pM6KQNiyZQNXhNkFf773fzhUlASTk4Tfi3oQ=;
        b=SvJf8n8g4hXWxVsnuQpeqfw2rb+gM5oVMjyUrqtzuMcLYy1CZ8IHSASJmZDaPeyrgx
         X178tw/lG+xhBn8UM7nAZEH8gTZfH479C5mIlC+YKfrX84POTfUPpIrgZK0fwVcxXvCy
         zgr/edtFP50ujtHpBVOvgWH3VocHj7tBGK1llqLHpPkjoI0CpIYWl2kUEhKQBormJ5Jw
         nt5EI3ug2CIEuggAWsV4rsKPFUtnnWs6PWwd26BmUKeZryT/u5rXAIj5lP2fLEXPXJUi
         mp2S13pae1UaneYzK/bVqpzc4pSwcHqh5qev+nDfDPWKcrxiCJW7uI/EBc4VGsfF5Jkl
         ZvFQ==
X-Gm-Message-State: AOJu0Yxc+2t6TiQT5XyRUb9a2Rnc5EYcBeAJRHdiAljblUJRRp4LrXyf
	Lt0RdEkzkvMms6w3B8UOSOIOjfiLswul3Y2bpM1Nr2OYMYQsUSkBMOXce6WHiYo=
X-Google-Smtp-Source: AGHT+IFoO7gQRGdGA6peiV/mTL2CvpmYneI+ojl6fbQ6l0AX59DKNiE6xTLu71LBrqA2E5JpU1OYmA==
X-Received: by 2002:adf:a459:0:b0:338:fcdc:ad21 with SMTP id e25-20020adfa459000000b00338fcdcad21mr4255272wra.49.1706030549105;
        Tue, 23 Jan 2024 09:22:29 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b00338914eb90dsm12032927wrt.82.2024.01.23.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:22:28 -0800 (PST)
Date: Tue, 23 Jan 2024 17:22:26 +0000
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
Subject: Re: [PATCH v4 3/3] backlight: Add Kinetic KTD2801 backlight support
Message-ID: <20240123172226.GC263554@aspen.lan>
References: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
 <20240122-ktd2801-v4-3-33c986a3eb68@skole.hr>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-ktd2801-v4-3-33c986a3eb68@skole.hr>

On Mon, Jan 22, 2024 at 08:50:59PM +0100, Duje Mihanović wrote:
> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> support for the KTD2801.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
