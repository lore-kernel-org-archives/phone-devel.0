Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6E2D2490
	for <phone-devel@vger.kernel.org>; Wed,  3 Dec 2025 21:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798657; cv=none; b=eGLwt7NUn6Bd/5snJhOhmc72M2vhA7ZqOY+v5nLsBDwOG6wGtSLufUCWl3hxVwKHFFRnaOZAjz2EvvC5/e1mHGqXqVypyDl3rbAzBm5mh6JRWhdLXpDkMFhZSiyrAAdtg6Sq8Cu+zVt0fiAgqDYr/H5aFpc2+dk5R9V1T1WDWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798657; c=relaxed/simple;
	bh=PZj3jANR6/nSU6UkeOQuWgGLC3q5F/VtSyt7tbEpauE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+n2Xn9UByKl+kq3jx/xQkIe7zac8Is4sF8xWn7uAiRbC3HRKxMaJd2MjGILorRmuhSaS7U1K/bYnbnx7vUAxMtYlMmLErqxZfgR57TXQpEodN1jOWFIaVi68yjPZygbVXUgwRzIwXPRuMlrpjmlGUqVOSXIzl3lf62tBcpJGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TpsGPBE5; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TpsGPBE5"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso1708932eec.1
        for <phone-devel@vger.kernel.org>; Wed, 03 Dec 2025 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764798655; x=1765403455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6chODghEB4z80xHdOkemzEluE/IBI6XrITBvqfM7dE=;
        b=TpsGPBE58rbo5KCTYqgujRkIIMkBKqs4f7u/+pa25FqLzR0iQEdN6Ey5UXF7eF/LAf
         P0mYb4NZguqkp5XJDbG3yufvHhEewGXSKauLxZXmScxmytiaKSAKQTfce2RRpSrfvYYH
         7yrLIw7FDmVwlDdo0eXJRDB+0RkQVbDVYKS5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798655; x=1765403455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6chODghEB4z80xHdOkemzEluE/IBI6XrITBvqfM7dE=;
        b=Po1L77JCysV3aiFS/H/s4RVhiqKWDuvdgd5JJIijGrnKlz25zrK7xl5fovkePjmjmc
         HJoLICqEGshDKPbS/yU51BRkTomBvIQk9zns0ToR493mcNUS68BXdXMiB6AtiaF04MNO
         Er20QN8RPz9uDNk9ulZso2vb73c/OVNFCMJTE/b6nXb3MJeQq7zbDaws8bn7gbYxhYbG
         zc6PMQFYPm1gy0aWYRyzHAiJm2kTC/RyBvd7F67WKUz13F4/HDZ4hskJxspssfe+2A14
         c0kUO798A+R40+aCuOz9162fSlpkMPbY7QdhSLUKeut7+aUFdmE1A7bxFvjEgNAvAw9y
         hV8A==
X-Forwarded-Encrypted: i=1; AJvYcCVMeyDI/8IevisVBlByiml4G5DZ3j3oXBAXtfILP/gXJFCyPf06akirqOE2stqi5XKpDbdIU6JkwsEwtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBerfs3vt3u83TSvxSOx/bJ6aRvWQ3maVrotiSiir1PK+XPBLU
	GiaLjfxjJawid3kw7Mebr+qXMBXqR0RXflvuNtmZQEfMJyxEimc3Sy+vFmtj6f5/xg==
X-Gm-Gg: ASbGncu9SaNo7QAtREYVvhthLnY++BEOwc5x56tWtes9qEJ+z0aZNoYohkF/0MKjmI/
	YMbUPnFF6zwweTpogZmfOHpM36OVLy+JQvy7NelmVkTvZu5ctXh8UUhoI/E553ahrvEoY55zdlf
	6pjrtBAeNqCJMa4WhPKhbJvnzRpV+v+5obvtTqDk/n5QsQ+cpAwSbDXiqXRDrBSzGTyZFVkq2Y3
	1UKL38E3yeoUDSi/lEztjyOU9YxUFCWX//i7SoLCBXTdLMsiJZfopLlmgTLB++9Vuyk5yMzv4F2
	aTBNlxwgsppud2r9k8XqkpvWR7OFO6EqgHp0NGHl07lca2d3FRbfaN4XQgogxTuL1tszmKJqmYe
	uckE3OPN8aKT1Raj/niF1yuVk7TIQRv9/VMHcLBwruz3lh91BgGg4+sRjH41A9jNsneFE3f0cIT
	rfWKJKZ+QI6A3SZY52K/qPDYlf8I5xwm5HcDh6DiKlAGW2O71V9w==
X-Google-Smtp-Source: AGHT+IEIEIBW08OkV8WK/jMyO0yClG6Glkh0kZ5O3uJlxkndo5BOSqM+ZQ1/IXiO+9a7SW6sezHK1A==
X-Received: by 2002:a05:7301:60e:b0:2a4:3593:cca7 with SMTP id 5a478bee46e88-2aba3394a44mr820588eec.4.1764798655218;
        Wed, 03 Dec 2025 13:50:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:e953:f750:77d0:7f01])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2a965ae9d06sm69699431eec.4.2025.12.03.13.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:50:54 -0800 (PST)
Date: Wed, 3 Dec 2025 13:50:52 -0800
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 1/4] dt-bindings: mwifiex: document use
 with the SD8777 chipset
Message-ID: <aTCwvFBE6IF6WT1d@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-2-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026182602.26464-2-balejk@matfyz.cz>

On Sun, Oct 26, 2025 at 07:20:38PM +0100, Karel Balej wrote:
> Document the corresponding compatible string for the use of this driver
> with the Marvell SD8777 wireless chipset.

Device tree bindings aren't supposed to be about "drivers". This can
just be:

  Document the compatible string for the Marvell SD8777 wireless chipset.

On the bright side, it's totally legit to describe HW bindings even if
there isn't driver support yet. So:

Acked-by: Brian Norris <briannorris@chromium.org>

> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> index 930b700b73d0..d31ff38f57d1 100644
> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
> @@ -18,6 +18,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - marvell,sd8777
>        - marvell,sd8787
>        - marvell,sd8897
>        - marvell,sd8978
> -- 
> 2.51.1
> 
