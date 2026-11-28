Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863167;
	b=ZNuii3X5SdEKh7yk1eZOBFwiLnf13CyBx+GGXvFnMVsHsBOfmHtOEETf5iF7r6t9f3+K
	 GkQNy4pM7CciS0qyE/4aRKloLH59omtryEmS94ABwUaTJtpGsrGYfdK2js6Fdcn2dFoPA
	 vLB/0CGELcngvRFlKLkmMY+ZsHbllbQHXrVAOYOhC3oh6OvN6cgQbc3531jHsKUiFQZB3
	 yGK/b0mFh/jY4FClHql9aFkKrj7nBKxYYAi46L6Fg/RVveLeKFkQp4HcL3Ssp9g3dxDu4
	 +ZuZW+RwmuNMOBGzize48//2W6i8yvBy7MePR5g34AbMmAs/fsFXbtFXRPK6AgU72nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863167;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KlHnILjUPTtjVoCWz6pQ3Lktg1m0yXJ/ItcCfbuWGyI=;
	b=YpkaQvsor4FkyEuT2hBnxyiiRpd2AONweIVciSRFd9vGscam4471Y+1CXF/p1cfiIwYb
	 qg+8SrrOkbiCAyav08AC5zxYQeNxZJQsj9CnRHswUWZhtBg9gq+BCSctnKHr3exauopOJ
	 fX9Shi4UsVIJQLW/CXTQpDuwtPA+XiOGvtdw+vZjmyG0bMEwdam5AFb+QijsweR6IhxI6
	 u9IlqgdAp2pUTe9UKbO5xbaOS3ABWQ4v1KeOyjgwLynuAu8z50cis+20qUz8O/mCZLFtv
	 2wj/8Psequ2r2ROAyGSHqnN6GJi9YmORiersMAUfy8kYtUP/ejyxDrVh9GlGzWpOU8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=K+sBPR5y;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBBC606A31C;
	Sat, 28 Nov 2026 10:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=K+sBPR5y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795863164; x=1796122364;
	bh=KlHnILjUPTtjVoCWz6pQ3Lktg1m0yXJ/ItcCfbuWGyI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K+sBPR5yN1xgXKNq5BF1dgeLlntdcnzXXf1CSyHKGHRGQf4pL2dGx+O6LaF3HK764
	 LHCrheTsMPVFj6Z9qPBGp242dXeWVUFmRNxA7+GeskjqMfZxGbuHpOhYPwaU74DkyJ
	 BK7J22vq1+A/PTsainQjDu2uCZSGpfOY59iQMTW2N4gSqkHB7JZs8dE9pj0wJ+fa+x
	 wGQ4WZdlKNmnoUWFQIdbFPh/I71qZnRql+76GJvJztLkbJw6tTv8HzNps0NIwUFGzt
	 CN4MhzDnh1g1MVnsO6TK0M6nKihiaICHhrfByAcN/MZAQYgAvsIi22yvt224mhcy9t
	 xD/r+bm3tBxVg==
Date: Sat, 28 Nov 2026 10:52:39 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Message-ID: <ozzQ46TkxnIE8zoFks-r8Rm4I2MGBrq1Ys2tEBV8B5IjFow5fHkZyAR10oOavJAoWHNumRPWsxFjQB3AOPOsD-DHYmo9vMO7gc4zLhm07jA=@protonmail.com>
In-Reply-To: <20261128043629.67417-4-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com> <20261128043629.67417-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: ce35320c6ce7da8373b685fc8c31552bcf20b7b1
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Saturday, November 28th, 2026 at 6:36 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99/G99+/G100/
> G200 and tablet/IoT variant MT8781) SoC.
>=20
> MT6789 uses the PMIF-SPI arbiter interface with the same register layout
> as MT8195/MT6833:

mt6833 is not upstream, and mt8195 has different offsets for pwrap.
Please either say 'similar' or reword this part.

> bank 3 interrupt registers (INT_EN at 0x450, INT_FLG
> at 0x458, INT_CLR at 0x45C, mask 0x180000, matching PMIF_IRQ_*_3 in
> drivers/spmi/spmi-mtk-pmif.c) and WACS2 software interface at
> 0x880..0x8A8.
>
> Register offsets and wrapper parameters are verified on
> live MT6789 hardware (iKKO MindOne, MT6366 PMIC).
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Aside from the commit message, this looks fine to me. Though please
wait around a week before sending a new revision. This series went
from v2 to v5 very quickly, and Angelo and others may still want time
to take a look at it.

Best regards,
Roman
