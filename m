Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D83B05A9;
	Mon,  3 Aug 2026 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793152; cv=none; b=p8zJlWM0cnX+CtvSRcdE+/zeeFh0HM2f3hz1Q2LFiic2xM76dVlioR5LA4I5rp3YZkN/ilXVfU+f3EkXoGRhwXxe4rDdq/qabIIHxaXGEL3PzxER/ZGsGR9/P3NbSNu9X6bmRevOHA6m+dpNj8I7whrmXAnd+MR2hjXMhPYkaxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793152; c=relaxed/simple;
	bh=1eKZ244Lmy6bf6DXmqYIibMqKOERDiyUj1094P2o2pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMs2+RF2QfyB8hSTVALWEK0ZIheHbHKe3Sho4JRUW67pyzUjdy81CcXPLY5gdRYWvkipcvJ2v1qW04VtBtNe9c6sXT5edWsFSqwhLlKBgoCqh8jELmbixrmq1n9AqCwxBrxUtikbNCYakvCc6oaZxawU3TNIyffq6HMYU+ZNmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/2iuiMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/2iuiMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973401F000E9;
	Mon,  3 Aug 2026 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785793150;
	bh=1eKZ244Lmy6bf6DXmqYIibMqKOERDiyUj1094P2o2pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z/2iuiMsELzNzb68s/mp0XPzEff9h7c2vjnbAFdwVlhaAz2Hg9646Kz0ob7n87uO/
	 HUyeAdL/qkR0l0LGGexl5Brpx/5Pge11fvQLVHcTjRjg01vOPDqjn57PjFf1Fmf0iu
	 mdWBUFE6fAueyxwwSeJAmEyJhmWmAJfBL9p5w+vg/Z2rL+IxVb8lxps/a7sGsvrK94
	 CEKOaod/9nq1hzwrs5QzKyCwMGUeGjdyQpDzbwP6WJHrjpp9ehwsG3ZWpHBaFlKLNq
	 Rz5/0WiJP1sGgDWFY/355BbUHleVeP9xkkO2bV8NSpE6bEmtmkpqYtcQcUuaJicG0U
	 kQPB1DqTrr8zQ==
Date: Mon, 3 Aug 2026 22:39:05 +0100
From: Mark Brown <broonie@kernel.org>
To: david@ixit.cz
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: sound: Add NXP TFA98XX TFA2
 amplifier binding
Message-ID: <467bc583-b0d5-4b9b-913b-0053dfe5e69d@sirena.org.uk>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-1-4dd55cdd658a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="znd2vZhPfXf+jTWJ"
Content-Disposition: inline
In-Reply-To: <20260802-tfa98xx-upstream-v1-1-4dd55cdd658a@ixit.cz>
X-Cookie: Prunes give you a run for your money.


--znd2vZhPfXf+jTWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2026 at 02:42:40PM +0200, David Heidelberg via B4 Relay wro=
te:
> From: David Heidelberg <david@ixit.cz>
>=20
> Add a YAML devicetree binding schema for the NXP/Goodix TFA98XX TFA2
> family of I2C-controlled smart speaker amplifiers with on-chip DSP.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--znd2vZhPfXf+jTWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpxCngACgkQJNaLcl1U
h9BLBAf/XkpYCwWXR7nRrQXAMB5vXTfnmqNukSbg1JIMs2mOzLhzyjr+WHME096q
SDbi9Hg2BqriGxtARQ35bdDEvpSoauIaM6DYIxU2SSiJ8dJoigyCHD39VCkR7Dtl
Heva1uX8ivkOw7JnWwk+4JOHpDmigkdudtm0Alkx7NVv3MLXQsz1U4hwnLL/cp7e
wFs+4g+mykOfVQVWAb2E7xycGJ7AlKi4R1eQre7k2zCY3RmLt4BkoEPj4/BHIi5W
fKrWlkb4vgLU7FI8bRkUKC5ueGwBFV5ZtQAY/tkIwrDgQKS+YgVeVOJBUGyEKowN
TQBzgK+E/Lp/Bh0/lj41B4kUla87Eg==
=xfFr
-----END PGP SIGNATURE-----

--znd2vZhPfXf+jTWJ--
