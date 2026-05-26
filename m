Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD040DFA0
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817241; cv=pass; b=TFKL2iq94iiPt6qGKZomASaYXa6Ce7PRmwCSAhnq/MQyVT+QEn52YInlT4DtHzWT08l0Zc3rp4oMn1wDjPT/B8q8aTbysf6HRHx+pvOg15bEINUN4eeBWAsvjR9LH/vXLFaEqvmzQGlsgXTugchMCSvwBBI/m3KGWYHbjW8U3pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817241; c=relaxed/simple;
	bh=K+HL82sdn8WpJwBs+rWv0fMtNuA2tpi9GtQEa2+Vvik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjaGPtfH527N7c72VUD0NCUJAYu5R2EFJWw7OPj4APhAXHrBmzqfDUtavQCQqYA6ASSBrw198iXvdJAG1m9UOmDj6LhHbA43Q2dZle4SGcC0hY4qgTb6GQEAYtrVr80zj/Q/LU2qAR9JGiBj2M9snlgTORg82gF+A9K+4pXbvL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egJ1lzeo; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egJ1lzeo"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-577500ac0e4so3457462e0c.0
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 10:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817239; cv=none;
        d=google.com; s=arc-20240605;
        b=GQ8EUVHwc+B8a8EjwFpIFRIbU67cj7NJx1K16Zr5uTtqx7bsNJYP3gEuFvkPyAjEYr
         hf598xrkd3I+iXpqe1G1dTvWHrbfA1Ye1eTtkcF1J5nU7NOr6oxxC20e9gU2wh+QAXhM
         pilNa9PTfsOVxHfm4p/q8o2IAu6r6xKJaXyUi9uhzPAgPQHAIj7UYCt1BQIebMvEdgin
         4kEyY70jp7v5jvbK/ZICNir291zGbr/YIeBvlGIvFKK9B710DlWtp/5l2SIfilAC2U3D
         LIoIqtpYUQQP/4cYwsPjNQXeG0Y6k+s0qMdcAN+GyOXVEXZQN/e0sFSl+hU3ArjLix2z
         Wlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        fh=2IQYu9ARKLiiENSY5Dr1j+XyMg3eYxG+DMqNtjE5w/k=;
        b=lNQCPLjLcNPvWhOjN5mHFjBI8esb9WokTfG/q/hsNkJXRFcBQkRZTrV1LnQxe6vOgu
         KEa1k7OXfSQhIbM9DbjmfxD0QN5PUihHF2XWCiszDnXZbOfi5sceXpvqAc6/nfmJv/Fl
         JqeS4KDgx513UDln5OXFYBf52gRGuyYq5hoUox6zFzAM/pWh4T0iwQHEdyJVwwB4pi5r
         R0LoWXtmHNL/8Ts3xCDYcj+ABMpdjXD7FfP/yBiMNvZqRTehYoMBBK/2/PsfZj1d6BMR
         d0gs+QbBkgAqvtzH6GLW7Kzw/T8wU6rdd/Fz+nHt5BFXDk+qoBC3YQ4SctThbKJ2LysK
         85zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817239; x=1780422039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=egJ1lzeoNWvx94uz2pPQUlvgZCVM8BuzuhO+mpRzrcyOsvtFCk6NF/wDV00pS0SkWU
         n9y7ZptvmqSC+43bkhqnMDwTEkyiuugVX6X4H5hYrHJ799WnMG4dC2tcRvl8eg3vCpa3
         7hjpJPmnjasmZGRPcWUy73RFT/Md66Hoitdn36PRc87hcsEstW9pKcFKG3h+aY0xdPb8
         FHP9vsflbF70+nsV6l6ekPof6kx3nuGYU+drdbicZWcs9a/+TSYtO18xrDg6EpnXEL7/
         liEdr1W8nmi29PgkvY9BPWb0XrSObXhHGtzanYgvZr6Z4N36a0139YzfunFqH1khi54C
         /90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817239; x=1780422039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=mVGXMvYMRyLd6i0FiIE2fm5905lgOwh+4BFl4e2X+hSXngI3jOhiwsJskt9+z4XcaT
         rT7Y9DYa2rR1JKFGoGq204KS6/uPbGr+mpiMRJknSnR5+GIoOmVgiB4jm6zZxrajrjdw
         jR+HRtDqFLwpeZhH96HqljvlqZhYpEpTND1cvk7x+4CvDYwjeAUDBL70FSXltyX8BAnf
         oZphhz7U4K42dhyapycwpiWtXIkBUO89y3u/TarFs926//PbUsN3mTSvbZbtfUTIZxej
         W8ZMXdjV02Bn8Wq+KhTsdgcCi4R6quRszLaakr5ptDh2Zc/pmPduwCqZr4ron2Yp1sy9
         eS+A==
X-Forwarded-Encrypted: i=1; AFNElJ9cX7Mpaco1uUaHgql4L4m1OX9/UU/+xQ3Wza3VToHw6W+naG49WtOBvuxCdHt+rdVwQc9pEgWpaFx7eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7mIbYpTNSicuU4FUB5sj09b+DUmDRc70o1cbVgSZF42pWUuU
	1bBCAloC0oEPjbfjUbnlIosauIyH1HiE8TqAT9rZwmu5us9DjFATDZ40fMjIrvkQEgYiAgANNiZ
	fMSQRkCF1QVY30hE+xszaLIpi2z891Vw=
X-Gm-Gg: Acq92OEUg1Un4UCz08KNFHKFCrxxp34nOGhIaZt2O2Ur44pphcw6NlHHm8kEo0EDBsx
	k8rShVZESgKKG34TjIYgrsGAf6NryGiPTbgDtEK4+r0KcghSbNcKPUnsHm4Pg3OAYdHeuf80leC
	r15wluk5Ysf6MD9s29hemkVYBYcv0JhBpkVvwkVEhMyH0mXhD6A49rvfX45qK2YxO9a6wyejIsP
	I8XvrocEueyll3ZCEkou+30tPHTDQgubfGfAflNBoLxOWOGG+gyIF73a5Hdx2fidDcGy75XTl9s
	Y1bpcEc=
X-Received: by 2002:a05:6102:3f86:b0:602:8c16:b24c with SMTP id
 ada2fe7eead31-67c7c0765aemr9185857137.19.1779817239074; Tue, 26 May 2026
 10:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <177818605997.73000.9692910497119100760.b4-ty@kernel.org> <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
In-Reply-To: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 26 May 2026 20:40:27 +0300
X-Gm-Features: AVHnY4K0YHv_VhlqTQcjH1BYoi9vYxYTC8vhg9AZJCVfVLC71VCaUv3jbXuBfa8
Message-ID: <CAHuF_ZoirJ7PdLxQcY2NC-Gay6wv=m=eVZBDLFXrRYnszo8Wew@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hello Bjorn, just a reminder about this, I don't want the wrong
compatible getting into a release

On Wed, 13 May 2026 at 15:09, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
>
> On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > > generated using linux-mdss-dsi-panel-driver-generator[0].
> > >
> > > The mdss reset dependency makes the screen work more reliably.
> > >
> > > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
> >       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1
>
> Thanks for applying, but notice that this is an old version, the last
> version is v7:
> https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
> The compatible string was fixed in v5, and other patches in the series
> were applied with the new version.
>
> The difference is in the compatible, 's6e8fc0' with a zero instead of an O.
>
> > Best regards,
> > --
> > Bjorn Andersson <andersson@kernel.org>
