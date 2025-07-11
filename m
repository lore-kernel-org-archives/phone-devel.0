Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1A2F2729
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258409; cv=none; b=uG7k/HL8Xj/MZ7mKQkMCuWNODBwkhDkJzeItAmK9HMkrP/PVnwh29wUy+IOXEPFLbO0oIGN24oqEo6mE4vvR/sOUxF1qfD2Fel4kYZ8Jid+4z87AFoykDcNQMyRSyHE2cqKRxoCkMw8MUeQVoQxC2XBxKrXqNkBndZnfQxZ4EcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258409; c=relaxed/simple;
	bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=badT7oflj4BTHbvnwMPUzvQIqWsnh881aLEkqjJeQK0DhG151Ry3GM9UIJYE3p0DCFGJVJPpeGgxKZfTbS50VIqCRcwfcMsT4n9aVvz50mcqQplXcCciDnUaVu8KKyLiKOk/S6C+O5Ciol7RcUNdp+8aJiNTStbbUU04ZUO0dR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9ZQpNgQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9ZQpNgQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b3316160so2492558e87.2
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258406; x=1752863206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=J9ZQpNgQAtAbEjB0+/XpvKMHMa5y2yOfDmprEzkl0/qsPH3CfQrTAXr6Np7Xb870j9
         zREf516urqki4bA8vb9SJzJv1fRnnOG6pNnzCSL/Ff84DmLRdBY5f20VBz5/2xptMo9J
         jLPhH4OjJkuqhfVSK+AJylqH4zptq0mzbEzD1MuWtpel4evb6mn9X8Rv2rEXZzwwmY6k
         7gesmyTAqPaSCnP+KL/9s7vTUnQhuWXe/GiVa9u5dZg7C2KCrxnNi3U4KhIDXknnhOZv
         FCMT1V3WuBdMIt24NvEcNtr+tOW7qUQiVBpz7QMRFYYlb538QozqmKm3Jf0QKUHWEGMv
         gVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258406; x=1752863206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su517mkk+oxzFqk3UP0BekUx1TUAeS3VlwMBUTxhr1Q=;
        b=S6ULKH5y70kg2X6+Z+4TlhpNmCYph2N8C7Su9RI6wyQRkTioJ/tMC4PdYn8K9SYJBF
         /wu/v7jCsqIGLz0QvhgWD+4KAh0jh4O2Mm61k2dPrAeXEyXaNdkMepELTXK8JjOki11S
         x7EqAqmTvrbwE7hhAvJ+9Y3ihYDDjSXRZ7t+M/KspTOQQR/RUClH42CoDYV9Fpob71ws
         Wqrz5pZ1Q3ayNqJDy1QBQiK7ChWcDOaQUsK9s5/MHg7k9YUaSWe+TTj30IS3xedYb71t
         Y/j09pPSv/5dOWGBjxmrtY3IX1wInDnNy59Z0d8ZvJXYehP4Y9mB/UFta9VYN6xpMecb
         wH8A==
X-Forwarded-Encrypted: i=1; AJvYcCUz0gsmEIrIasdYJfvZgr8tDs5WMxmOhw8wCuH5n6iceErOXMpyIAXEhPlmX21kW6XKj7MXt5oJjWK9Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6hWAznHfOZVCMKMMPZ9YeUA9GHxC5845HP6D1NPaefhdzXPc
	cvsOwb5rQOjWB4EaisFlOPl2XSolViFZPTOmVYnk28J9bjFZxhKFWVkDO7mozvp0VibIlqrznU3
	cFVzkXT8lJhwKjeDawqcKVYOGKnDf4np3UoG3tUEwpA==
X-Gm-Gg: ASbGncvw15R9oCUFG2zyEpn6GdFgoYlqvROZmvXk1vprLnvZRBgDge6X7LUSbPZYUKw
	BI1HxXxtwUNUfg2ODq8fh5qqZlho6HfeMGy8ZeXI3ilda4MuVbv85fEtUmkAyzWtZjk1aj0KRlM
	0ZtPFCTST/WNHd6HtkTEaUJDI2wKwOOvRjNjFvO8RnlhbXFWidMX1yEccaAyLKbDTKRy7HM689+
	RXpUt4=
X-Google-Smtp-Source: AGHT+IG/MoMOERMcdwRe0u2MCnKNH5c6G0Ju9EQCtJSlh1jp+ka6aa2/4j15Ntd51i+P9QmOojm9ELTDBk2mPF4JmWM=
X-Received: by 2002:a05:6512:3a89:b0:553:2ee0:7728 with SMTP id
 2adb3069b0e04-55a043e9350mr1420176e87.0.1752258405544; Fri, 11 Jul 2025
 11:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:26:34 +0200
X-Gm-Features: Ac12FXzxbq3zhEMygG1ywvm57ienmlxEOsz-4IQUAfbc1IiUJliLFPebYAlPvr8
Message-ID: <CACRpkda8+veE-qQdQf=LMFO_URiUAiFvkc2QCbJBQizqyg37Eg@mail.gmail.com>
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

Patches applied! Good work on this Luca.

Yours,
Linus Walleij
