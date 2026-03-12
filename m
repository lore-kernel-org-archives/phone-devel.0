Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41C33A6F7;
	Thu, 12 Mar 2026 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304076; cv=none; b=tt7S8j0SDFYdk3VYXf/rLoNbGIzeXi9pbS0fD8gzlEYuvJsPV2RKVF6eKB2WgOHTbn80C5AC5DL9xd6nP4Y46uDA8xgz1ciRnb4v+rzBASJarw9M+7mH/iONBU2cDlHhI59C8N/rTSpwyHjJqdQSPRdFlR9gvCMouyowhLaWaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304076; c=relaxed/simple;
	bh=kAVPbUHOPEauVX4ji7z7DwgBGJ3id0IXL4Uk2Bj/dMs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqzswtFoTfBvYWdaFHkDYeNC6oQwBpzRaTpriUi52Ey4UQyWmcojs3y0CAH7F4fIdPluMVBai4NcRFyx3lOmadnXTkJMpFlxGtrYp6kfS8+dvH5Slj+G3G8aRS2qAEoERFahyUSqAa7NKdsY3ePRFGPuPRkkk+NXZJ1W899Dsoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CMQLsGk7; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CMQLsGk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773304058; x=1773563258;
	bh=t3JRYEaTTfsm2Ky7MxiycRSWgHtEl/Gte6nrmwb1bIM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CMQLsGk7pSO5Ng/CrZjpsokJB0a6B/pKDgFSKBB5XTjnjQeEiPmUQTQBRTUAsvstM
	 rxCc9NmyDYb4lKZzJpsIO42aYkMyxkI0QLIkAlIAoeBOxp0JHvR2TQfHeHRt3rMzcG
	 vomZ1yFkvRre+805m8WVFfkC+ptCXVeQygZHSEAbpqG/80FIAO427oGw6uAfTbw1ig
	 zPM9M74z7M/bGoNx7fF7D4sr6TDFrFhqOxB3S/g3gDuUhnTd0x5m3Eknbws4kv79pR
	 nymxUXYsuwxiwNOEl+sEjlVyh+qyGetOuLaqSF/hCa7am31uYFDMlDNkbimhWjeQDJ
	 GSjH+dLoiQlrA==
Date: Thu, 12 Mar 2026 08:27:33 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <xftpHWQbO-34K0sCpyznwHTYxoNo1CMY1NyFzsDhEeM0s59S3Rqvu9tmdlEk6VAaxam3HVz3Bk7_7m10FEn3X-3Lc2HMVMxWUXkB-Olgt6Y=@protonmail.com>
In-Reply-To: <kvq4py5svidg7c4tu2kxwpj6fnsod66kq555pwchd44nfdjejk@yvpk4ismso7r>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com> <kvq4py5svidg7c4tu2kxwpj6fnsod66kq555pwchd44nfdjejk@yvpk4ismso7r>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: fa519c905e9f51896a873557cf26c22f69b1db27
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, March 8th, 2026 at 20:27, Dmitry Baryshkov <dmitry.baryshkov@oss=
.qualcomm.com> wrote:

> On Sun, Mar 08, 2026 at 04:52:42PM +0100, Cristian Cozzolino via B4 Relay=
 wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > +
> > +static int nt35532_on(struct novatek_nt35532 *ctx)
> > +{
> > +=09struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> > +
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6e, 0x80);
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x68, 0x13);
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);
>=20
> If this goes to be resent for any reason, could you please insert an
> empty line before 0xff, 0xNN wries?

Just to be sure about such request, should I add a blank line before:

=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);

, before:

=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x05);

, before:

=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);

and so on...?

> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
>=20
> [...]
>=20
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x11, 0x00);
>=20
> I suppose this is MIPI_DCS_EXIT_SLEEP_MODE,
>=20
> > +=09mipi_dsi_msleep(&dsi_ctx, 120);
> > +=09mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x29, 0x00);
>=20
> MIPI_DCS_SET_DISPLAY_ON

I've done a double-check through NT35532 datasheet and=20
include/video/mipi_display.h: instruction codes match exactly=20
those mipi dcs command enum item names you've mentioned.
So, would I have something like:

mipi_dsi_generic_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE, 0x00);

mipi_dsi_generic_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON, 0x00);

?

> > +=09mipi_dsi_msleep(&dsi_ctx, 50);
> > +
> > +=09return dsi_ctx.accum_err;
> > +}
> > +
>=20
> --
> With best wishes
> Dmitry
> 
