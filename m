Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD361D1519
	for <phone-devel@vger.kernel.org>; Fri,  8 Nov 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054784; cv=none; b=K3PwAnyCCxuyOPYAd4GAOgN6w9Nvf03q+QryjDxCMbP8hGWcYJBP7TT1ZeDS+ysiJE8DcKj40cxLVFEpvzPJJw9JiN33mO5vKGY1UWgfgzHa7ttCzf4GIalYj9EwBYQBEw5xmv3ZIlNeJDItWtvzcceRuCyjz3JWVRWMJqD5jQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054784; c=relaxed/simple;
	bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7/SIm+n7RWsB7Z1pdAYFhObcMq/KY8ubHWu2Wo/haaWILG83E/4DFDp4r2ankNJuY81rBWfZwrXjP4dCA+ofvrYCWkQEkIMWXEtScFSRnuozyiw8qZo3FHCwkMfH/518MN4YW6nsRIswddL/2fn1q+VAJJR+69aFFYVsBY+hV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIKg0YyR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIKg0YyR"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso20565031fa.0
        for <phone-devel@vger.kernel.org>; Fri, 08 Nov 2024 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054781; x=1731659581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=;
        b=QIKg0YyRMjapErGJRsUl2RKKHb3FOLVeOGlnw2yofiZqrzcA05fXLf+XHi/L0sG0+c
         IOazjqX5iV8XwiHIKx6VLllJCog6mAQFvNSDRN8mfyRVO0ud7SyY9/JFGtSNMOnB2gkE
         FqYgB4vJaoXYuXQFzRLhuHa6hoaBuYFTWYrdIUzwoMOHQOQmMmJt4YVPIeLtPONpfx29
         cg78zbnEpwwjqjN+WuGrZqneYoOUMLQ14/e1h1I8dUdPWB96lVMR691F79U0TDlzsX9D
         GNZHWhFG7TI1C0OptIyosR//HOri3fogxjgFjNF9OkYBeuga1nGl2cZXTL0w/h0HGJx+
         swEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054781; x=1731659581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=;
        b=P/b+P2EURwikt4W9kEtQJ9AHStPM9Wy6JtbMFiv1i1dzcUqFGE4NE+V6KrEwJofX7F
         kJLhTgRPOPZXGw3G/Ovim3GqoR1X6ExksNcd23sbWcv9m7+ExKRyJbTYXwhcOTINaess
         hYj1+E3PM93Rhac07uUbNc0oxp4tAthRF1Cp4o7TEyrBcHP3M1zB+ZbePWzYN5IflwFv
         6qTUSu9FxU9E1qePX/6UzSBAjb/sCowXoTBgYJvQ9nIPiReWXhyk+/ss9f0mQ80a020c
         kvMoCVwa8Lp3FMmE7qvABAJfE+UkJ0av64NZALxnQkiOf1xh+KYORNrK+l1hmcT5SDXc
         jMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQk2IZWakzQhJreLNo5nla+hzALHyfuNYvGRnVjOyoJR7xeGdE0kKQKHPfHyVJv9q4NsY5fRrV79rx3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkYRpiv3XX2SNnLU94GHP1cZlkszZkHL64m24JivQ7c8AFe0J
	jZSgrxOwwH/ijduNGuf25WsHsG6mjzrln82TnYVYdofRhHnlG1pFXjWxJoLtglTsIZHCoz/l3uX
	AXEiZT4b7JzcGbMCWAVj7bWTt95tn46boxWr7jQ==
X-Google-Smtp-Source: AGHT+IGUskTynAw9BMroXZo5yveDcNBcLD4Xp+P+d+67e9FvxhQBmFNOU9SytRx952Jl6I+6VFOyzo/vbqJDUlA53Wc=
X-Received: by 2002:a2e:a808:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2ff209de8b7mr5901521fa.16.1731054780928; Fri, 08 Nov 2024
 00:33:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-3-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-3-e050609b8d6c@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:32:48 +0100
Message-ID: <CACRpkdamE0dGDQ5hY_WRTUFaiJKGEkOZpNLZ-SoXH1u=6YKrxA@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 03/12] pinctrl: single: add marvell,pxa1908-padconf
 compatible
To: duje.mihanovic@skole.hr
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 5:59=E2=80=AFPM Duje Mihanovi=C4=87 via B4 Relay
<devnull+duje.mihanovic.skole.hr@kernel.org> wrote:

> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>
> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Patch applied for v6.13.

Yours,
Linus Walleij
