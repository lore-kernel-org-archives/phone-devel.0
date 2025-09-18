Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E9238159
	for <phone-devel@vger.kernel.org>; Thu, 18 Sep 2025 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758159895; cv=none; b=RwTWYRObs7eAs+T1CzLdtwesNHr5A5ytrv9njp/Df6veG3Sji6mrYn1chg1fGxB0CoYvMqatub3o01uwzT25547Ye8CPYoarS4hI5MoAZDAemS5mv70vHeIa9U9VLUcwgCl/mMZrg1etMY9jxFHbfrUqacTtT951IgbXPQ7TTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758159895; c=relaxed/simple;
	bh=ckofcSJyVceBJiaHInKCfYw0lV6zDNQ56NxqvQs/lmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMka8LM4qwUF8147XsO8Vf5PoS9td2vvpZVZFsCYbJKi69Ft3mwb/508EhissD5K+Iqo4vVTZ/H7Du40W6kOFU0EssGgBiD/eNDbnbOcSWFnPLZRHuKQj6LPQGAAtVsryaYaoGMoJcnGpKQ5wHrAFDtQrNDX01tYdEcK4NIJ1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYjQJf2w; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYjQJf2w"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3515a0bca13so17723041fa.1
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 18:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758159891; x=1758764691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz7+GW3tG6h1ZR0T3uG4mrds5eW7kOQK7SR5mlNPDFE=;
        b=CYjQJf2w5nSfPM3bFzl03AJKDG3PD3aFvkZz3cMhcWVngb6mkKPbe/Psb9n1/PmYrv
         SX9ruzNoXVTGja3upaudGFDknoS2APk0uBw9DRq+nNFRjLraiwiVGCjnUfpv9Nr5KLXM
         dKeENMTLAEet3G14HsX2+/I8cTVJc6I0RJ7xqJ0UgLmo1vO+SrxETz6YAdpFp966qFzz
         Dc4KpzI6g0hUmYIblQk46V0jJtJ+oG3QS0k9bFO2i7jn/oeuLQN2Qb5xPmHvnKsbRrhn
         hEjjSidHeoW3UKbfZDcuYfBbtmUqCQw/dohG0A0J8LuSy4iDyYtzOs01PsOQ9E0PvYRh
         n2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159891; x=1758764691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz7+GW3tG6h1ZR0T3uG4mrds5eW7kOQK7SR5mlNPDFE=;
        b=tP1IWDqvbOfj/G6g7sdwIz+zZVH835lvbeUznsRx236BozQGB/GA0O6vZOWm9Kn5o2
         W3QlM96sUVv0ZLWgwEvK0rMcB+JkFYmmhual9niZ/lD3ncdU1CZdSBID5aFjuGWhwbSw
         Tl8+/cpZoEWVL3VJTeTkdbeoT/843Y0p19OV/07IOz0SoVPWXJhl/43UYVH7WH0eWl2u
         72ZBqTJBGEpKxLIKD8T6IoONNXiVgoeFaNvYI9PvaFQzSv/SgeJIbXzB4dAnbEnWq3Wg
         FCGedjJlP8ugY0vB3qKVZL+BPOAN0fDCjfvPfrdqg/FMtP//bEaL9T5EAfSDDAJX2DY2
         E94A==
X-Forwarded-Encrypted: i=1; AJvYcCV1u5ErXIwxjOL+w+flftYTsrOvjsEidNRHXoc+UrB5tYcdR1o+AiS9rNXZG4wCG+91J/v361F8wKHKvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ydt6NsmCZgN5Q4PamUQLrV4n3iDkFlSD7+9PmJ7PBTZqslT2
	GV0StKboRFCCxNHE7pRK/RpP78IlTcnVaDnr83n9L2o3gMFkNQtLYF34oMdfIU8dVDwSrlNvug1
	EpjXtw7s8QcAWRUP1tZtY9/BK6WtaNXE=
X-Gm-Gg: ASbGncsOkiwNn329a2rG4FD3wxhGy7iqbQIC/hPmB29UJiSkS0btGdYemiKg8nnAYd/
	XYzpQJ0fcb2ntT/OqBfdRzv4Ykh0HwD80kG6cROFIZfQJ1AtmjVaGEAKGFSSvio9P3mg7weN2O0
	/dfl45WfXcjSGIHV0jD/9VJm6mhtEbOo1F2zhy6t02RB19WSphZuVu7OenEF2nIaRyO93mGkR4V
	xdvkHZ1Aow8VKBde1cf7KOaYEo2GzvQ/CkIdPc08gMCN6NpTE/KMXfPg+69YXQxT9TStPbDayHU
	2Wg4S5rtvoC8Glh5j28kfyMzyA9kf47qCTfoQy7Ya8YC+EqiorOMwcYgKnEQyvA03a0=
X-Google-Smtp-Source: AGHT+IGKY+1+g/lwbiYKvlfzeD60pboVHy/VushKXhZ9OREfWE89ojCi15z0JD4b0huoAPEOkCpfqDMpDym4MFAiCK8=
X-Received: by 2002:a05:651c:31ca:10b0:336:e22d:804a with SMTP id
 38308e7fff4ca-3617d39f44cmr3083251fa.17.1758159890386; Wed, 17 Sep 2025
 18:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-3-5e16e60263af@postmarketos.org> <772be3c8-751b-4f96-8ed1-fc8033babe74@oss.qualcomm.com>
In-Reply-To: <772be3c8-751b-4f96-8ed1-fc8033babe74@oss.qualcomm.com>
From: Chris Brown <crispybrown@gmail.com>
Date: Wed, 17 Sep 2025 21:44:38 -0400
X-Gm-Features: AS18NWAao7zpfSXjjoiJ5q_TqFb4cFreK3KCd3ZLhmeDLmO-Gp6sqoEX-RaJuZg
Message-ID: <CABN5=wHEGyCOc5XoON=oVFUJUPaAn3B1QQDvP+ZZPYi+ULitpg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Amir Dahan <system64fumo@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

Source https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi
Small assumption on my part that "fg-cutoff-voltage" has the same
meaning as "voltage-min-design-microvolt"

On Wed, 17 Sept 2025 at 09:47, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/17/25 3:09 AM, Paul Sajna wrote:
> > From: Christopher Brown <crispybrown@gmail.com>
> >
> > Values based on lineageos kernel
>
> A link for reference would be nice to see
>
> >
> > Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > index 49225e4fa80e5f45a36964d5d733dc238e4413f8..be488891d0ab01c5bfd3762514fbf1c3bbf6845a 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > @@ -37,6 +37,14 @@ key-thinq {
> >                       interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
> >               };
> >       };
> > +
> > +     battery: battery {
> > +             compatible = "simple-battery";
> > +
> > +             charge-full-design-microamp-hours = <3000000>;
> > +             voltage-min-design-microvolt = <3200000>;
>
> 3.2 is rather low.. are you sure?
>
> Konrad
