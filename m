Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA25407CFD;
	Tue, 19 May 2026 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207649; cv=none; b=pI3Zv1/2TKCcVXad3l1sZj2iOM1drSRk97/PU5/H+WPVaEIOiPKjLp0PBci3VctkxL0aT+iioF4aK2ozpAhvz6tfkxHU9n7gEK37nzJ8leJT5WJINn0YFOI8xfmB7tAq1+85GibdG/o8iBj0/iePQupE7+0MJvJop3MoU+y+EXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207649; c=relaxed/simple;
	bh=ELoAf8oLF/+NoPxDFNwW00zqYHr58JG4kK7pV+yDj5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWwVPeajl59Ke0g6KOlVhKOwo8HeqlMe2K+3CB+Dk5HWD6zJ5/WWXMgOcXyH020/G1Cqnt3LAEsGvY9QYWf3dtxsHxNJHkByX0Ill46J8bK+RWE8vdTEk8Gtiod3aZ3ePQTEk2XrV+b69wwUIqP8wqec8lbsQVjkSpy54u6BijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdt84AEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdt84AEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B92DC2BCC7;
	Tue, 19 May 2026 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207649;
	bh=ELoAf8oLF/+NoPxDFNwW00zqYHr58JG4kK7pV+yDj5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vdt84AEbvA7WSgg16neBn3Uk4cyujH35sOYSfAkouVaVuVdhXEC7+BoEwzqntJiRH
	 iju6Ro4mcVeapKycrKcWU5VmuFJTHSlXJBGSFpIgJorSq+E6EIrafpTqgnJ2HRruJn
	 j1nBYcqetEX9ZX3NNOaQCchgYHsvTN1bT0mkVOoceHK7EjFOJu2i9KJxEeGIcSZfWn
	 DuxvWUq9pBh7kx7umpXSmNZepppCYULuvBs08JHBVegL6lB5wD6d51ekZFeqx+jq27
	 WMz0xNeugGBQjxpfBMbe41r+FapXaLLrWgkHNuTskUY6D8YWZnUq/nY9rtR5KB00oq
	 Kq7zT1VONk/mA==
Date: Tue, 19 May 2026 17:20:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: codecs: aw88261: make volume control usable
Message-ID: <97775db6-b417-4e07-962a-f0228684d7e3@sirena.org.uk>
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ReWHQlouYyeCao8a"
Content-Disposition: inline
In-Reply-To: <20260518220906.347958-8-val@packett.cool>
X-Cookie: Huh?


--ReWHQlouYyeCao8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 06:44:36PM -0300, Val Packett wrote:

> @@ -424,17 +415,7 @@ static int aw88261_dev_reg_update(struct aw88261 *aw=
88261,
>  			break;
>  	}
> =20
> -	ret =3D aw88261_dev_set_vcalb(aw_dev);
> -	if (ret)
> -		return ret;
> -
> -	if (aw_dev->prof_cur !=3D aw_dev->prof_index)
> -		vol_desc->ctl_volume =3D 0;
> -
> -	/* keep min volume */
> -	aw88261_dev_set_volume(aw_dev, vol_desc->mute_volume);
> -
> -	return ret;
> +	return aw88261_dev_set_vcalb(aw_dev);
>  }

This looks like it was intentional in order to ensure that things are
muted until we power up (there's an unmute in _dev_start())?

> @@ -983,13 +965,13 @@ static int aw88261_volume_set(struct snd_kcontrol *=
kcontrol,
>  	struct aw_volume_desc *vol_desc =3D &aw88261->aw_pa->volume_desc;
>  	struct soc_mixer_control *mc =3D
>  		(struct soc_mixer_control *)kcontrol->private_value;
> -	int value;
> -
> -	value =3D ucontrol->value.integer.value[0];
> +	int value =3D ucontrol->value.integer.value[0];
> =20
>  	if (value < mc->min || value > mc->max)
>  		return -EINVAL;
> =20
> +	value =3D AW88261_MUTE_VOL - (value * 2);
> +

We're doing the invert of the value scale before we store it, currently
the default value is defined as 0 in the header so we'll default to
maximum volume which is likely to lead to some distress at some point.
The default should be updated as well.

--ReWHQlouYyeCao8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMjdwACgkQJNaLcl1U
h9DUVwf/XNn5pf4E2MfjoRLBrUye3qifzdbq6sD1E0/C4vuGjeCSwUFCGZOE0iDD
ayRdQ8zyrRumVN5GNoguTaWmwPX1MDtpEeUJ4Uu+Fh7kMrbARHsTXWExo8oqc+UU
cfWTPa9xNy58jBhbQAiiCXPnBSqENa8bPaEgjuI3llkOIMC01lT6smP/1NPNkeEq
vPAoIG0/ZuYODIMMrG3xCEE0SDViJCAc4fChz+vcoHptRI+EGmEe0NjehoQiZo5b
qEHcc7Ordy5INDiEL/LyEIzQnLGiHybPfVJYb7a1xhlcEeTttq/E5WGXvxTaNypL
9u8ZUs9/yNgt6YdIXbVGr5bUrovqvA==
=oZ6i
-----END PGP SIGNATURE-----

--ReWHQlouYyeCao8a--
