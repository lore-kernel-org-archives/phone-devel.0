Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0850A68
	for <phone-devel@vger.kernel.org>; Fri, 12 Apr 2024 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910597; cv=none; b=QW6HT9CsPRVHNsFo7fcDUKEZ6/ZGM7exMRfeV9p5Np4mMvwd12NQ19T3qXpxh1vITCQb5l+7+pmlDdZCP6rTFGkHyx9nvcRtUK1mSDelX2/pwqU3zRdcbgo95RJTS1gS9S0wuGo1QXP4ZDCox8wgcQGLMBMvVYO7zzsmXDhwZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910597; c=relaxed/simple;
	bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtqf/wZv7fXX68/r1Ninuld71ZMXUQhjRv+cs2a7yBRLb/Q2l1Ax3mZXDJaN9thLfEijPgOnwtl1jk7CZJLCTBpcAuD4APlKYXI2sRJd0PstrwGy96oTOlUzv7vPJqCZlassoqzKpsRbLkcQ9mFB3xVIbipUyLsUrqRlqMDztn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7WRa6jJ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7WRa6jJ"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc74435c428so632435276.2
        for <phone-devel@vger.kernel.org>; Fri, 12 Apr 2024 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712910594; x=1713515394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
        b=o7WRa6jJQjOSiSk+LM1LMe0eCEDv7pAxXn+9tRG+OHle1hjRfBQS5s4F9tkEkGlWtT
         f7n3wIJFjkHAHvZwljozZ0uKtwjuUKi0eaYYJDDemqW9FU+mGFRDmjLvyesUEIAt3tja
         lnf51I6sIlylsYJ3Ou/TPakkR8Gu9dQTcGrT/289MGzM+MGDyfAhvrwZk6tzeGHEfdn6
         m7aJ/3QPgOvSvdYopJkVKasAeYQ1rSzpt82omMLk48Mszc0FlJQkvsAhL9eKdq9Bu4ko
         MDKGhGFCZuXU0zDg2b3hNghLYlSjkxzb3uvPX6ThfTnh2diP9VhfEMM7p090E0VrH/2W
         17Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910594; x=1713515394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
        b=bEoOqOpg19CepCEWXk6lVjhd8+SKAxLtBl+GL+gTPUpNibnS/ZJaKUEt25GppTVnB3
         oEy5S8ZExBEUlIIiRmOS7nEDldeD4ohE8YwE3pDs3JVbTxWDqjWQBUU6wIgyhbsAbOD4
         B+J8h0OwLO+CjaK7dH8btaKSlgXDIvFk5/HZE0sfxoZPJ2nuyyMqffVDJUygbXXiozu5
         nGJoHRBsqazL6kHo/Zdmsf3Bbozg6Wz2jVk2qONFXTxLolMamMarTaGcKFUjUwG31CO4
         pCcGwvsDA++Z929+IzXox/cd5kEqSJg81POlbki8zDtCc/cN/1C8WpL1shasWJDPXSE5
         WJhw==
X-Forwarded-Encrypted: i=1; AJvYcCW23EGX5w47NoX89mF0B/vlPRsyOcOAByi91ipjP5wt1PwS/FoJ/hxOCgpAMw/E342rKDKnsP9OKDWERfP0rLvLOIQBN9pweaDE7Rg=
X-Gm-Message-State: AOJu0Yyl371i+xqyuBxZN/zUx0pftYjiwBW6VC4aMNEf3UPFzJ7a+lCX
	91K/8wfkT5L89sxgh45XBgxpTSXP0XbLY2NrWUMGyBRGgYC4pPIoagQuFequHobt8A0pUR579MU
	YqPrssQx1ZpH0lyus5SMU+EsACxMAuEUl+MKniQ==
X-Google-Smtp-Source: AGHT+IFFCDn8Tj8KbGC7ulaXoT+mmD8v5dmvH9Q8fuetYWLwrEUEyf1O0q+ueZp7Pg5qNbx8uhruJtp5xKm1GgD2U80=
X-Received: by 2002:a25:29c6:0:b0:dcf:3aa6:7334 with SMTP id
 p189-20020a2529c6000000b00dcf3aa67334mr1854728ybp.7.1712910594707; Fri, 12
 Apr 2024 01:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz> <20240409-qcom-pmic-gpio-hog-v2-1-5ff812d2baed@z3ntu.xyz>
In-Reply-To: <20240409-qcom-pmic-gpio-hog-v2-1-5ff812d2baed@z3ntu.xyz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:29:43 +0200
Message-ID: <CACRpkdbRxhKYNHgssFZ0Pf5_0_Gt7+Ga0OhWdhxG5eKCrZ7Wkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Allow
 gpio-hog nodes
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:36=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Allow specifying a GPIO hog, as already used on
> qcom-msm8974-lge-nexus5-hammerhead.dts.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch applied to the pinctrl tree!

Yours,
Linus Walleij
