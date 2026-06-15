Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BD353EEB;
	Mon, 15 Jun 2026 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515053; cv=none; b=auxrFeyhVO33EszX81ZhAR5wJ1aFkO8NwP9kd0EDtfNQSM6nLsIJY3SMDisC5R9jNxAwW2uLUgWnAqmmf9OfQPNseUyiTnMSeGFjhX/SPm0Fv0RFgNFOt3G5B/ztl0Izu/csn53boASHnxDx6m0cDxTPiYEl9EWTTnoHrfWAmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515053; c=relaxed/simple;
	bh=sUN1mggEBsvNeQUZYfEsFlExB4nn5MMmyNrc+xQboLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJKxF0Hya/C2INsQpkwlddFB3Ai0ZZGYtBG9qT40MPQOBvypwFfGac+S7LbLNCrflZJjAkfMp51c9vz9ADoe94dWa4DXlgV4VcHnmUZyxu1LRM8G8XPoatNHwLVjxbCT9mxdPmgnHyNXtRs1/i3fo3Dh0YWIYYcP/l9IExhWNms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mpb+BgFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mpb+BgFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03D61F000E9;
	Mon, 15 Jun 2026 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781515052;
	bh=sUN1mggEBsvNeQUZYfEsFlExB4nn5MMmyNrc+xQboLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mpb+BgFsw+7A0qUi5aHSlxex14BAbTk6I++U0zGciY8ez4lvx7WpwG+e1pH1XSZ3M
	 ovXb4pNne9USG2Ho523ENLtgwxwq9zblIB4r9RZXAGkDWwReHND5fZiMIL9pmZwtCn
	 RGnC67HS0HTX8uBRRdKziZJg+I+3nM05lOk4SaxLqG+k9cEqpOSVf/+/44jtq9ctVP
	 iK3Vvv50UxhBgx1v2XtujNL/o4IYMr4aLKKVYk8t/v5fl+gOP/ACI9890Mz3MCurpt
	 ANGMu+7g41+OpprAVigK9pFgEHrDnaXj0cBhaHRfQKUzKg8sGorG+69eFWyD3sOlRF
	 uSM5xb52sniMg==
Date: Mon, 15 Jun 2026 11:17:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Amir Dahan <system64fumo@tuta.io>
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel:
 panel-simple: Add lg,sw49410 compatible"
Message-ID: <20260615-amigurumi-kagu-of-prestige-ecae6c@houat>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="afkgux7sdtvsh334"
Content-Disposition: inline
In-Reply-To: <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>


--afkgux7sdtvsh334
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel:
 panel-simple: Add lg,sw49410 compatible"
MIME-Version: 1.0

On Sun, Jun 14, 2026 at 05:08:01PM -0700, Paul Sajna wrote:
> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
>=20
> It isn't actually panel-simple-compatible, and we knew as much by the
> time this merged, but I guess maintainers needed something to prevent
> the dt-bindings error going off while I was working on these patches.

I had a look at the patch and discussion that commit was from, and I
didn't see anyone bringing up that it wasn't actually panel-simple
compatible.

If you knew as much back then, why wasn't this brought up?

Maxime

--afkgux7sdtvsh334
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCai/DIAAKCRAnX84Zoj2+
dt4gAX49UvOe2Zj08VKwUKpsZozNFe/Yoeizs4amVYEac2pNv+aAF420ATx6l1hM
5i8fITgBegOFQFS9CgjhrXP4pP1+hSO4vcQ5SSy0pMGsN73XmQXJJAjapYIp85+a
eXguIesxmw==
=F+rc
-----END PGP SIGNATURE-----

--afkgux7sdtvsh334--
