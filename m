Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7115217F33
	for <phone-devel@vger.kernel.org>; Sat, 18 Oct 2025 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760805693; cv=none; b=YMh8cqBruBwwv1Ht4/cP0j3D/MlfGY5nPdu4t4uYj8PRcGA007F9V+c7POMZqMYanC2K3pAUD7Nvo6dMd051h3PyrdEJ9shXAPvIeTCroZC6sUE5eT1jSHCAI7cglomgazl8Sfem9a/DGc+lXuKtWSdrceUoSTHHvDOOujbyMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760805693; c=relaxed/simple;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cm/+h17jvo0zzc1chMVpEnmYUreULMTYoSXT0Gr9a97yLheIcJnRJH7V9/Vcol+lAKN9dnPjdWHdUaNCYS+lu0GEiCvJVechjRoBw2qeowu/wYf93i5ZPOBsxCNcheySYpKDuq2hiAiAM0S42FNY6A+U9VxahnV/ZKY66ScsYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=k0Ut4Lyc; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="k0Ut4Lyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760805682; x=1761064882;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k0Ut4LycV//jYlWaBMAJ2hJ8M5LPwV7IhEgdYXu7kaePsIzKfZXMOgK80sdAk9BBO
	 SNjUVe1Os7HeLVHr8e2nny4qK002WgWpSHm45f1bPEvTkzQZ2aiqoO7CGwBlyF7pmw
	 DOi7pfWbV8vZ9J+wiagJH7NtPiFL6hP64egxmGqqx6RXoRmAdw4bnA7Ykr2GqdoCQt
	 ps0FiehroiVMdDqIotmq0mwgst4q3eiqHxrukqTUadXqRNCqBoiVHNFZUWFMQ3C9Rt
	 6+4ocmLZhYXp5ry1D7aHHyJNWigcANkQwHnMzFvQgYoiynmMPKqW518f9BitSCc3Er
	 UcvBNInyV7OBA==
Date: Sat, 18 Oct 2025 16:41:17 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketosupstreaming@lists.sr.ht>, "cristian_ci@protonmail.com" <cristian_ci@protonmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: Re: [PATCH 00/10] ARM: Add support for yarisxl mt6582 board
Message-ID: <lOMHa6mcw10H8qfGsi25ljIEyIsio6vgGzJvT9FXWc_B4uI2kpes8OP2z_2VqnkVvQWwmQUInen4YOGg92ZgN8vbZDc1KuWNvwxjFIpBhgU=@protonmail.com>
In-Reply-To: <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com> <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 7710293a5ab96e00a613212a51e9b751d2db05ca
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, September 22nd, 2025 at 13:05, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> Il 20/09/25 20:23, Cristian Cozzolino via B4 Relay ha scritto:
>=20
> > This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> > board, named yarisxl, based on MT6582 SoC. It also includes some
> > preliminary patches. More in detail:
> > - patches 1 and 2 add support for mt6582 to platform code
> > (verified by looking at generic mt6582 downstream source code)
> > - patches 3-6 do some maintenance work to mt6582.dtsi
> > (I was unsure if squashing timer node patches into one)
> > - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
>=20
>=20
> That's simply great! Nice cleanup and nice addition - the only thing I ca=
n say here
> is that seeing simple-framebuffer is a pity, and that I hope that your pl=
ans are to
> continue with systimer, clocks, spi, i2c, apdma, mediatek-drm components,=
 etc :-)
>=20
> In the meanwhile, for the whole series
>=20
> Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@collabo=
ra.com
>=20
>=20
> Keep up the good work!
>=20
> Cheers,
> Angelo
>=20

Hi (sorry for being late)!
It'd be nice add more support for this old platform, though I've to say tha=
t I've got inspiration from MT6572 patch series and this series is mostly b=
ased on that work.
BTW, I've tested this series together with mt6582 u-boot port (installed as=
 2nd stage bootloader), always derived from mt65xx u-boot work.
Since original port has been tested on mt6580 and mt6572, it's not too much=
 hard making a port for sibling SoCs like mt6582 (done) and mt6592.
(I've also managed to boot successfully a 1st stage bootloader mt6582 u-boo=
t port but I've not yet tried loading linux - and testing these patches - w=
ith that).
AS mt65xx platforms share many similarities, I hope more people could take =
part and extend mainline linux hardware support for mt6580, mt6572 and mt65=
82 as you wish.

In the meantime,

Thank You very nuch and=20

Best Regards,

Cristian.

P.S. I've made a mistake about cover letter by making reference to a number=
 of eight patches, while actually there are ten patches. BTW, that's not im=
portant at this point.
