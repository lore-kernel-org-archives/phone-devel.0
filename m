Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABA2F3C3D;
	Fri, 20 Mar 2026 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991163; cv=none; b=lfxOvpNFBut8l1WR43w0khGHSE2ELQ3AHC1kS+GhXEp+tjty9Y2wmZ4OtclggRTNOTU2yNLCsmD8gs8Ph269Wpy15ZCL72fweT7b+GjqtGb86yfeRjC29IxZABEgAtN3yTKetVmwL4Rv1o8VCwIewGvarDCJWKPjOpoTNn8PVmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991163; c=relaxed/simple;
	bh=d8KZnHOUKc9aPKh5RRZ2INy5sMjFQ1N3a3BA8s1oSug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D37doaWDNfg2ZpS9IRlL7AFL85WHhU4T0xh6OxIJrI+zdYplyKM70ayULoYkdrG0+Gz06S9WYoGbzA92rFC6H9kqlFe06azR4yVrRwXwrBKpKX5S5p0VX5RTbB9iqpAwFVWCTxGeiEts0dQikubUREeqLTEi5yKLwkV0vKQALLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=INtXjfTu; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="INtXjfTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773991152; x=1774250352;
	bh=+XRuUNY/hs84dNZVuW3v8EtYOa8xUIu2OLZAs6swl6w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=INtXjfTu6Poa+7BLNGkevsDHl+W/CESmy3XD2c0ApIVLVTfB1dl3NAHSHycLrhB37
	 pDl5OrqL5hvo9v5jGvj+mJlv5ilzhi6ojB2QP5tsb2hofVvFv7iGLSQ/16bhmCa8T4
	 YIMp3KHJh7TSMk8DjhV1ViFJS1cWdhVrTBvI75iA35m77nK2coApTkGldgrGQdYLZ+
	 pQXhJz9JBNs5HrqpjHHRZCDy/AM/RWUdyMh+sciT73woXxu0hV4exDkzQRF5TPffU1
	 j/GmX/XxRySCCqHxzmSzoiIyLcLO0DJsnDpF5UbitXeIpswtKaoyneUK4BkCXpc8RF
	 c3C7hAK+H2A2A==
Date: Fri, 20 Mar 2026 07:19:06 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
In-Reply-To: <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com> <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com> <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 73aca8d40c90d8b6aa8bf437ae557b39d9b0cefe
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, March 19th, 2026 at 03:27, Dmitry Baryshkov <dmitry.baryshkov@=
oss.qualcomm.com> wrote:

> On Wed, Mar 18, 2026 at 11:28:10PM +0100, Cristian Cozzolino via B4 Relay=
 wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Add support for Novatek NT35532-based 1080p video mode DSI panel.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/gpu/drm/panel/Kconfig                 |  11 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 779 ++++++++++++++++++=
++++++++
> >  4 files changed, 792 insertions(+)
> >
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm doing a test: since I'm not sure if:

=09select VIDEOMODE_HELPERS

is actually needed in Kconfig nt35532 entry, I've temporarily=20
removed that select line and regenerated .config file. Though,=20
I've noticed CONFIG_VIDEOMODE_HELPERS was still set to 'y'=20
nevetheless, so I decided to not going forward since that=20
code would have been built anyway so that there was no=20
point for doing that. I wonder: is that select line really=20
necessary, at this point?

> --
> With best wishes
> Dmitry
> 
