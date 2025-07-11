Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3932F2352
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258242; cv=none; b=DA6kvnOudTq6FddSBseURfKziG9GX9w2OhyrzWXmyurEU04DOYCwMBfQS2cMAUD3wMMgrQKJfwlC/GDuQKN9R1vLzRNZTnGdXpid43hELqPVSXb9c4sGhh0zMFbCHlXilanA8RzxB973v8OPGBQM4+khJMI6y6eF9jhw/rXXh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258242; c=relaxed/simple;
	bh=oqnpzafFV0ZoAjP9+YkXIuQgzQ7Z2BnDR3jdUDfSn1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3c2EtpqypF43MaEte9SS6vnTjit01W+hkBkAZcmo3oSBy1VhPwsEZSPAisFc2HIrky1UK8OIVvCn9a81K7rPTSZVEvVZ9Csxy45C0RiMiG7YE3Y9Gk+AptP5XBz2SJO2E9a7SFnWzAcnqf1s6qY+srEUe8bnyqwP0SXo4yv6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoHqdOg7; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoHqdOg7"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso21048791fa.0
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258238; x=1752863038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=WoHqdOg76g00mtNGc9b6mI0r8aUJGHSi/kYqVz3FrcupjrccaiUA5E81IOhiSNG1DS
         DLOLJj05TSt77p1GeeTXxr9G7XXwsKmTy8wbas1cYl1PxEnhR9TqSpAORx054LeQCvMq
         cquUu8MAw2D1CblyKwDcaeKBzE8tIsYqLUQht4J51PuY5L14IDVKK/hD2Gg2JaIQcqtT
         QmM2XQ5/HFiU8G91SFF1z93mV/IaHcalFlT1hEJhIilbL4rgm1eVPW+JrmTFvCZWJW/N
         gDs4Yn0ISsIdz8vEo5U3PqeflH3xamUoMoW4snzw6NTBR38aeOGU+bArfbAw7WbZ0zPr
         HF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258238; x=1752863038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=J+QI5Jdfp6xEwjWUMedjreoVpAiNH59J/IjIFmyCMeYialt1wZ+WnFy9wxlVLZ+j/G
         HnKPFBv+wsJkwUdb8u0OuhrpTeYWC29oTZFvGFoKLgNE+JseJ1d3AJY5DrxDF1RQmI5H
         EsSWBHat0PVGPDfHzq4493jRtneHF7BfAXZ61TGA/BpwWd47RBbSsJMErbD9fSboytfp
         HvE7Vp4a1WSrbyiP0bdLns6sYTlSeljPsRuFAnOr/KWI2xbupFmprgxAEGe1xQTpPmId
         00RCdjn7pPMe+jWtzdLVTs8aNiwKgCakXcb8HV6VZqCeWzS83bm0WhTjloihyJNacUhp
         bRzg==
X-Forwarded-Encrypted: i=1; AJvYcCUCCOLtQSE5vWT/360ZBqUkl9i9Z/aP/xSv4LQn4w5W+j2yTRyT7FV4T6oTgg69KkmwKr+72aGO3eNQqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xJqWkZdSPGwGjpYw1em6GVqiO39bBBGR3RvP1pdRfr85EIlq
	AgQ/h5Q6DSgtq4K3T0SecfffHWmoXofdrLhIJxlJFfd3FqN8NTu6Imo688svn+EPNJmxa1PpSrr
	xU+zQTFEiql7OFi4dxlW2+OThld6f6zMiYbLwaHIwDQ==
X-Gm-Gg: ASbGnctksOB7AIGh1QfR/nAPJhiEfUKHiHB9IEUwVrvXbd8kXbo/oomZM0BLpSwrna1
	LOde4yZTP9P2jEIth5KV6Fq0q+LUYz2ZNe4RP4qIpmEnKyt8+WfoiepaTuRsqRTPCHF4H+IDQEQ
	durltHHWIUataqx3N2tj0YYmd1y8K57Uv/ktFiaqQhBotk31wSpNM73T4iSQa8mIgHywQ4DPZ4k
	8pT9qY=
X-Google-Smtp-Source: AGHT+IGtCjuAm6H1PqMHwvBz6rzeqlA0wEu1fJowmdiyHYt3WhUGaKpgqvny6J1SrAMvLEx6RSED9oPi9oqyZbgq9O4=
X-Received: by 2002:a05:651c:1118:10b0:32b:47be:e1a5 with SMTP id
 38308e7fff4ca-3305359ff3emr9390161fa.39.1752258238428; Fri, 11 Jul 2025
 11:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:23:46 +0200
X-Gm-Features: Ac12FXyyCEbHvtTkJzK2mrQiawaykksuUjl6fIr0994V2EB5IcqiLGuqcPuxELA
Message-ID: <CACRpkdbUo21S-GPPrTpwhExVqm=XbE+juQfVo=VddOks79La2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add support for PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:46=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (5):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
>       dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550 support
>       pinctrl: qcom: spmi: Add PM7550
>       arm64: dts: qcom: Add PM7550 PMIC

Patches 3 & 4 applied to the pinctrl tree.

Yours,
Linus Walleij
