Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6A332634;
	Wed, 24 Jun 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319312; cv=none; b=NcwgkFLpCot/qDvJ3QgWKGx7QGTG6/xIf7TZNn7sm48OlV2QTmNbf6+BLon7jktb+saKgVfbfxfvem+wpBOWo+kGjJ9BsjNi3Cn7DzfSg1ivXrajBAxDqX+qzlNXQoUprawjpC7Fv7LsdpTj5s0It+M+ShtY+QgEKlzNEIXFU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319312; c=relaxed/simple;
	bh=J2aJFye7qw0zAAaRz49c5ypmfmauPSq8exrx7lA1qGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0V+Uk+i1QyhC+xqjsM8JkiXBbGGI383pmaVqH2fVaLAjvsBrGwxUpONyPIc8vU/zPHNBX0Yr1uED+blmdJ8zEvLEXtmu9pYen8rzGYDNZLpAJzjCQoiJu2Nir794v6RtGgfAQXeNx9Cm33MHNqfdFVEfxdNwr7Aes4yP+VnpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkHMEs4d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkHMEs4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF231F00A3D;
	Wed, 24 Jun 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319311;
	bh=J2aJFye7qw0zAAaRz49c5ypmfmauPSq8exrx7lA1qGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkHMEs4dL0nTOaHKRTqDTF2fum6Ajp15WfppVqMwGX5hGqu+n9ooo6LpTRK9YIoty
	 j51VwQ6TeZqomSEG6mC6k53D6YiRXlM1q+9U+GwzijG1TL7Bg9/mSxJrcWXOE2Iyyd
	 97FyT24VG4bZBBZpnxuZ9sRMryT+b8lyAu5wGYOdlur5WOUNSfW2ugC/nxQuBARPD+
	 sSRv/WZ/0iB1ONtodLep5RWHjFQxDhQ945FJcwwqHqyO0j1AQkYrz1lAvuQ9AZYnGj
	 H7A3OAmOiJwbZS86JN8JNPgzRYFkksyIFJoYCRv4S7maxwEyJDmg4BLnNXMt6YbKJP
	 z62lVeJZet6qQ==
Date: Wed, 24 Jun 2026 17:41:46 +0100
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
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
Message-ID: <57a5212e-1daf-4859-84a7-f941bf5d2d23@sirena.org.uk>
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zm9T6AaH2e200DCp"
Content-Disposition: inline
In-Reply-To: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
X-Cookie: Your password is pitifully obvious.


--Zm9T6AaH2e200DCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2026 at 06:02:25PM +0200, David Heidelberg via B4 Relay wrote:

> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#

Other bindings include sound/ in the path.

--Zm9T6AaH2e200DCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo8CMkACgkQJNaLcl1U
h9Ctegf/QgYRDwoBYF8BJKmYi1Wo8rz4Idn1GeANEEy373zxLRbzBZjpv1q7zG8Q
Akka7QXMyHtakKZ+/Ny+gj8PufccKh1u7KsgxG0u2tSApJSPZovuvP2g4B9azs4i
3lgx88BalXF0pDduG5uAPf1zbCW4nbFDy0YaUz+Lc+tVjnI6eNrSC5mVlutso1xS
WIHHmvbKJvsgCeowknt6oJRlvlYuM+RUI0xieXhKkaUdy9Jk0dYcQfGnII8GCqf/
NeaOoBv7wIGZyLd5OE3mEEwj1IDBnCjP+G9f5wZxUv8eZkCiQh7eRmT7iPlIvdUj
gHzY4NQ838MvgJdaI2Ecz7S0iSe8tA==
=a9Ps
-----END PGP SIGNATURE-----

--Zm9T6AaH2e200DCp--
