Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565A720DC8
	for <phone-devel@vger.kernel.org>; Sat, 27 Jan 2024 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398576; cv=none; b=n7FI543Q2acqiktvMf9kjaNdA3S3y2Fu+JiX6v/230aFjfTaNH3kgdZw6EWEFjAgh+Yk6HVH87wSp+hsmW+Hy/NGT8TLZfE8d15ApVON6Db7Z/TIye6M+zh9EXRwSUI3FYxvNbQcpJbfZqd+hyFabwhxzkvQvTLFZ8KrbJ9U/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398576; c=relaxed/simple;
	bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hl2TtSkm+16H0LWZmJxu4bjbjD7af0prNv0MQuobto779BUU7vuzFWeNjRNgfEv+QD25wi9rpbGdaBzRAYedftm/Qp8YD4c5ls6y/h8NniUBp7ucQvqsNLKi2gbAhDdEgDvOSDookmIz/y34TDFE95w1/NsaeiqnMz13tSfIGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpfmGgUC; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpfmGgUC"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783cd62f1b5so103118585a.3
        for <phone-devel@vger.kernel.org>; Sat, 27 Jan 2024 15:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398573; x=1707003373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
        b=GpfmGgUCzBt6GWD8FZab7OoSg3wEV6+Q89BeHMQDsO/fsAkiSvbomXq58QNB2qAKgR
         oh+QeOn8F7vso94xK+/eHtvYcCkUrlx8h0MfcpWDqQBC51s2GsMs2Ux3G/Ku9gB6dnxx
         feqWCcLKGl3Mhw5ccRANO1MBh+F4TWD8XqPWRyueCVvduWZTJ8MTjUYvrjaq32Cxl6vC
         lo7zJyeqpS0IuCFAtPap38X+wG3BdqJ5SzOCfPeY0iSQkESRNm0sbfYkBZbZUj/6yOtI
         dmoTZPYcKpA/QHJgcNLVs6mwl6RvPw9o1arwbUZ+cAf2+sZjsPFh1fK3vlmCljDBAFw/
         QqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398573; x=1707003373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVKbaMpkpPl4OamNNqyBIfrPPvBb/CuhmBwz5z4c778=;
        b=Xc5o7kzN4553+JUS+WuSH7p5cRGzgG+WEB0lj44fTEPRxKoC+W/rj6AHlKqJXBm36/
         LTnf9lOYdQ5gDEZVjsEE+yweR9Wy/33ksre5CzayWKDTL/aiRoQaXrILkiTiM/opCoYu
         rKTq+JAg3T7mwaRUw4mq84kkwdp/bw2ce6gL8VrWBHFLDqYjO7BoQOOjVbaWkLwBoRBQ
         +PfyP/TSj2+pFFuFtnOj0NT8E4e5sw3nmPm1og+rwOPpK1K/ac5Vl7N6QAJtZKUiicRh
         EVAQlGUfwHZZ/zx6qrEze4QWBQeGoTskGb34hpI4QLSHn9+ub+Z2ydoLAk3RN/OgnTzK
         wuag==
X-Gm-Message-State: AOJu0YwFJzRh6YpfJBxBlegbmfURAainQ2BXHXwEUAic3rh29Rne4gdu
	WUP9yZmRZMghQ/Q6Lso5MYln843DeXvCKk2Sf2WPFWhfc+pGQnG/DP7zoqj00bvcVtrLXKXvv9q
	actZs5moPQPzm7tTAcQOb9OA5qEH6Mss9r8N5lA==
X-Google-Smtp-Source: AGHT+IEgp6Wx5JnuWyXYHz8pZVr0cnqh2sFmftzNYViLIBvxeKcfFE9nBHRj3w+ge53ptzIE4c2ITaNbwP7ir3iKXKM=
X-Received: by 2002:a05:620a:20c3:b0:783:df74:8f97 with SMTP id
 f3-20020a05620a20c300b00783df748f97mr2269258qka.148.1706398573145; Sat, 27
 Jan 2024 15:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110-pxa1908-lkml-v8-0-fea768a59474@skole.hr> <20240110-pxa1908-lkml-v8-3-fea768a59474@skole.hr>
In-Reply-To: <20240110-pxa1908-lkml-v8-3-fea768a59474@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:36:02 +0100
Message-ID: <CACRpkdaZGc1z8y7NmS=xeHBSFkOe4agMaSBspcikTnrbaeB8rA@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] pinctrl: single: add marvell,pxa1908-padconf compatible
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 8:04=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess you will merge all of this through the SoC tree?

Yours,
Linus Walleij
