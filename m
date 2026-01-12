Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47C365A0E;
	Mon, 12 Jan 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235574; cv=none; b=QP2Ctvm7/B6BOhIpD3twzJQVcLsVvJXi8OELz1yQVcldRYNOurajxfwXpUJq7z9KO1Ki/oAmu62D8WhfKyAB7G0C49KNMHlV5x0t/kxGBZ2AdrLbPillHaVB2AXUUeJOOOD2EdLWa9uLBz4vBCXokOzRfRPrKJpm4WiqBoalECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235574; c=relaxed/simple;
	bh=NpW82Ke+nzxEz6aeANGPyr2oNuEfY8j0dI+XrayeXKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnqlylRAmeSsRfy3GXNKU2rap8wdunbFv7qYPzc5eMLll3AOI2crBJ1XiVnVlv2e8l5RsqScoa8v6+8iiyOoWcktZlcx/JzN5HL2nyflKn0WqJbdQVO+ZA/2BTpgd+LnxhOZrzifGGUXk5IjP8zDk8F2rU/zWyUDJssrkqIcIow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n06VKge/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n06VKge/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F8FC116D0;
	Mon, 12 Jan 2026 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768235574;
	bh=NpW82Ke+nzxEz6aeANGPyr2oNuEfY8j0dI+XrayeXKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n06VKge/OPw86uOO8f9x/O9tjaPOahKzfucvMrkSuCKeGGgAHqFw9OQSgCwYZq6Kt
	 b1bYuv0eNOhSAajtYUMFIxo+hhePDgxJpLdflH7n9BiHaQjosjLmnnwyOu0acBHveE
	 hFmKaNOqlLnHy3WdEoL5vUgZD1lOHJQV3jAX4dtZMkIcY4WbZKEn1QyWjPV2WI9qrJ
	 b4MH5R7dgWPvXai1HVQ1DY6kUHZdjFZlzBVfGC6uRnkYotD//JPiho6C+wn96eepbc
	 HPd5CItwA0nrPi/2CgRGFYrfnN5cqUMQKmLz6tocThMcL/96017mwy211oEhtJODIS
	 g4Wm9YakQSOVg==
Date: Mon, 12 Jan 2026 16:32:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: document dvdd-supply property for
 awinic,aw88261
Message-ID: <15afa51b-4f58-4f74-b7cc-cdc28e08a689@sirena.org.uk>
References: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
 <20260111-aw88261-dvdd-v1-2-83fa0850d561@machinesoul.in>
 <9249c034-de8c-479b-a9c5-f1252e0beba2@kernel.org>
 <5e47fe91-e150-4b5d-a669-3a7beeea4f03@app.fastmail.com>
 <1ab13178-8253-4dc7-9143-6684ededd8f9@kernel.org>
 <19035a09-8b6b-4590-a816-82350c1389e3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrF9UZFO81zOJzJt"
Content-Disposition: inline
In-Reply-To: <19035a09-8b6b-4590-a816-82350c1389e3@app.fastmail.com>
X-Cookie: Surprise due today.  Also the rent.


--mrF9UZFO81zOJzJt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 09:57:46PM +0530, Bharadwaj Raju wrote:
> On Sun, 11 Jan 2026, at 9:40 PM, Krzysztof Kozlowski wrote:

> > You mean the bindings were incomplete?

> Yes, the chip needs DVDD to power on.

> After looking at other codec drivers, they generally make it optional=20
> in the binding but error out from probe if it can't be enabled.

> I'll resend the series with it made optional.

No, if the chip needs the supply it shouldn't be optional in the
bindings - it is an ABI break, but in practice only for validation since
the kernel will assume some supply is there even if not described.

--mrF9UZFO81zOJzJt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmllIi8ACgkQJNaLcl1U
h9CG/Qf+JmZRQSxDtOocqqDM+D7XZV+cZrbfn6MjY41taCUTQvjsXaqoAp/yFW8q
BUqT+AM4c4p8XaitsOpEEdnIaiQc8UyhGfjcui7/wqPOhtIvTJ45rQML6U2diydc
1TMUcjJn4ezLmqNrHxKAQfyP6uWrz9wcacUli+PFU5trK7VQPy+1yTsv9/jOln1R
zG6TB8dtgbZI+H8ALeH5+VHbpb+i18chQe5ig/B3YlpZgB/IrnqFfPyKA9wPxD72
oN54dWM/JAwIO+dLsiudJ6NR/FWnQqRnX/rerg9tVSmuy/oTk1sMsqtnnviJD8yQ
MdcoiymChbXlDomlTc1BJPY2lCeV6Q==
=zmdZ
-----END PGP SIGNATURE-----

--mrF9UZFO81zOJzJt--
