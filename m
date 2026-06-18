Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF803FA5D4;
	Thu, 18 Jun 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796152; cv=none; b=DH+N2cphkdt1SXCwI07jWVn05LBcE/B9CwE7qbpwqlrgqRZx8AugndTg8e6Gz6ZQgEwrBkgNDqNt+UtBswzB4dx+MOMMzvGWKT890vq3TEQCfUFV6iTkIhnXJhxMShYVP1WnwuJ5ExcyOWNBCvVO3NReWXzKBK+NrkmD3w4rdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796152; c=relaxed/simple;
	bh=jSdlNlpM8SAob/fGvaYLbUYW1FfKn1bUWerBX6EGHS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebmCTkb2dzesfOMgXMBGFkEIfNYySrhopvmxK+MXMs9h/kPCdcy95eRfbesYTt9WmK9hzK0gJC8YgKY+ZmEljlFjQ0QYn0k7xriuJPI+N0oUNQ21aq4dAjSHCj5K/f0Mboa0EJsGTrf0CydDXLUyZOsmOsyciPT1W9KeaIp3sOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCYWCXA4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCYWCXA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDDD1F000E9;
	Thu, 18 Jun 2026 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781796151;
	bh=jSdlNlpM8SAob/fGvaYLbUYW1FfKn1bUWerBX6EGHS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BCYWCXA4WBW0a7fOg9IHEBtPOvt4tAiLJQCBJu5A247pvIg6g8zrZqkpCgituH9WU
	 U4HyXCKQQTCFCbXwePxJLY/YoR84Hz1VyBcO6Hk7Bq++HcYYC+MsXNf+uG2H2QgtzE
	 tHSYz/hhqbOK8hUycbYK33jM+q6y+Wm5rOLu6OO4yCV+N47cnFbZGP6bimMYALa8Fh
	 hSrClZbjnhoe6Pkf45gaevjI8voZq2AYTApVrTAuclx+rRW9F35F39tHXUn/6IQ24l
	 uXWfsd9CyNt2Qa2iDR2RjeK+j8HdGzOaPEAdzdvFV3E5kpiXLuL8SceqVB8ujO/v7k
	 f9MyiavN9TkdQ==
Date: Thu, 18 Jun 2026 16:22:26 +0100
From: Mark Brown <broonie@kernel.org>
To: david@ixit.cz
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
	Bjorn Helgaas <bhelgaas@google.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT
 schema
Message-ID: <6d0187ac-5b52-43d7-b874-9739a62860aa@sirena.org.uk>
References: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QufLE/0Kc9+EiCqz"
Content-Disposition: inline
In-Reply-To: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
X-Cookie: This unit... must... survive.


--QufLE/0Kc9+EiCqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 04:33:28PM +0200, David Heidelberg via B4 Relay wro=
te:
> From: David Heidelberg <david@ixit.cz>
>=20
> Convert CS35L36 Speaker Amplifier.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--QufLE/0Kc9+EiCqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0DTEACgkQJNaLcl1U
h9DTvwf/ZDqT6lHklGiiZ/2ew8XLNomY7zRAa0SvFY7yLpFRhNuHbhhFE8O6/nVg
ayPBn+RsMYmy6brd9UIzOMI0p7h+KU9u4VbCsy5dY3IErlqkSzk/sYiJDRNDJeN6
QQ+93JnormAA/cFEscwNsB2zM94v51AnC8hpTGdPD6uixRi5lWP4/8v387HgkOcp
64x1dRAghOwQ1pGQsEVQYTGieF5ex/w68MQUabzgzavHOPR2Lgefi4b3LfUjkAre
eicUeTAd3V7EYaTtaZXwBLi0JsZM9RObcazADuKPcvMDVIdlcZdATYg3DQIi0cJe
B5Vn5Y2KRtF6HczMRhMfRvaeflUdPw==
=SS80
-----END PGP SIGNATURE-----

--QufLE/0Kc9+EiCqz--
