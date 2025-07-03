Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA2923909C
	for <phone-devel@vger.kernel.org>; Thu,  3 Jul 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579663; cv=none; b=OqLbslyRIYbbgZSlxf+Pdj+RBXRmxss9A/p8JgLxDR7WBwkNr6YOhUJdmrZx86KpGwUFXN+Sx3uJdpc6rJ329mTzbIy7LFBcDC2aRwFYqk1v0DUx6egKxm+5KjapVkqlkrzLFS8sy1ZckBk0pcvF1gnAqdCH+TvAVEVE5wxFmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579663; c=relaxed/simple;
	bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvqBOHzHuLXAA8LG5jTjV+2rAWnh1/Sf7wBKkiimRYsu8h+/tIj7cVKO0kLle9l87M2Kd4ZQ8Gor54Se7fQAN/rlo+K6ysOmz8At0pq6SRzH20jED5SCl9+lzunIDzxCqEIa9d36iu+Z88AooUe/1kQAlcYJUgPq2AnQff8Y9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LH/PsIz4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LH/PsIz4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b544e7b4so375167e87.3
        for <phone-devel@vger.kernel.org>; Thu, 03 Jul 2025 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579659; x=1752184459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=LH/PsIz4Rdp3SZpO6iSO4RMi70OfPm1+90Unk2x8B5XbUjnIHXB7dpdjgq6tDRF+28
         nkqoaNOm3WVyYFejAqUT+gzgV+eO5EVsTAjxso65fqWpNSZEWs1bWFDm911HaBDkIJxX
         ZlnBwIR8Mg8d6qTxyA9v7yaLm2erhEbGpWbbO+ChWfUZ3V5QTtTqV5vr0vN3HlBA3ea6
         hjb2AtcKXgcrANkiWxyB+kiLcknGBofa4bJ82rJk8Bqg6wHOoS9pX3LijxfgEJtonbrO
         /Pbrmz9e+0+OpNtPdzLOTmXWDV6NYprGu1OKQVYcu4Fsj0iYooRzvTIQ3N35KPgtAeSh
         JR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579659; x=1752184459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=WTqwy+ch4RzpsLnQhVUoTgeezpoWRwgMMeU22ksaxBMN6Qhbz6W0GexlRnkTD1fbl+
         khosFZIHg6XS+IAP2t1EgAT+PYofwlbKvJYZirvsNaurhMWAkxOLA8pQ+CvBI/D7XBRE
         teCx9mWfCqM1wT2XWbWPTR9L4QrPSkPq0GnZigm642pQ+t1vQ+5vBjXyl7ChIcHK3UVg
         l8m5lAqR65lgAvgnAdMmcFh+eIc63uFfeyl1RV8BFrw3PjM8DiVmHwZfTaO1O1OvSVln
         PWvUuwMOaYWigrtjH/DeJw7kw0C/0wNOe4B0sRGNpxmUt3JhgK/I/35RHsjB/5KifbEF
         OJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUqtBZDDX1X2y0zd2OAYr4phnnVG+/mYPVuMvkX9HdKgEVhi0W79hU7z6kgKXzvRzkZRQDm2kfey1dhqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hQmEI0Bmhn1elSCJRretA2GUzLWm4//i8LlPtPrGOG+xOAWF
	xHttrsvSn0MuXcnX1Awq5oqc2Eid6TMgne6N8USjvOEb6fmjRgbdvUEC0QSMh//Jt3diDVY5hT9
	UPNopqEZa6boLaXU1tDxUvuttpknNSIAwUOaBZXniNw==
X-Gm-Gg: ASbGncv2w3zUr4gwrwg7yqd47r/Pkxlo/UfKUlN1tiTX7K09klb8TvpoiWpyQK/KbNM
	m8QXcHmpPfxbFTH0i57AAtVZbhCzwnhPoUjFDHeLTc22Z0bn3rkMmw7rgu/440Epj7bSKpIe9Hl
	rihfG/VYWwXRanw9ckhNJL/mZxtmoCqRTn9dCh0rlHATY=
X-Google-Smtp-Source: AGHT+IFckUZv1qDN34YL9xP78RpLLOjoYJYZ+wKY65GHTkc4fwzbahypUbKLt2uekYZ4NWpbxz8d+9N/6fdIiPphiOQ=
X-Received: by 2002:a05:6512:252a:b0:553:d910:932b with SMTP id
 2adb3069b0e04-556de26ecdfmr19471e87.46.1751579658980; Thu, 03 Jul 2025
 14:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:54:08 +0200
X-Gm-Features: Ac12FXz8bSnZw_fU0LoXZXBdvuWYVqNdvL-IUi3U2zwuKMo-p81WILsJ1A0gEfI
Message-ID: <CACRpkdZ8oHJeHydLcMmtttJiKSGybX7vmhgPDEjD_4SDoxvCzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Document and add the pinctrl driver for the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm=
-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-pinctrl-v1-0-ebfa=
9e886594@fairphone.com

The patches look entirely reasonable to me, as long as the DT
people are on board with the compatibles I will apply the
patches.

Yours,
Linus Walleij
