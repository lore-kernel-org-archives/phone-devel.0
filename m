Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8E3939DB;
	Wed, 20 May 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279506; cv=none; b=YVbREhtYXfhu7FjTOIALk4JZlEjhF1lWlw85VN0a3OsAfdjWDYpsH2C5xGtw49keYSTnFqSLQ7iIGIX1J3Mmxb1sY3dTx+4U0MUIh+Z9Er5OdUJ2TVZipk56w6O0q3r8rtLY8fwRcow8tWy5OJJFYLIPj5zsGlwncJRxqRmFxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279506; c=relaxed/simple;
	bh=/wjwbl7a7VEtme9QBwgoYYtZlSHw4mHdcAoOc1Gt+W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7K81qIX6W42opnNE1B63ccJ4JahtecrxtgfirGG5e2QK3ZchBKO9Ic3yA/0k/f8fc8133JwsZTTHN6eOlxkBwFrWH2jTxKZkflCprdSi8M6Siu2sWaAxJytqhGLR/MyssbC8AGmitpGhAkKPksguF83MD5IDj4dLMY+KuDNtJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/EV1LgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/EV1LgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241211F000E9;
	Wed, 20 May 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779279504;
	bh=/wjwbl7a7VEtme9QBwgoYYtZlSHw4mHdcAoOc1Gt+W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/EV1LgRtq4B3JjAnulTNt4FGoYxR9R8fW0VHtsgMMifg1j+Lg8uvJb0b9vXEScPb
	 MxZUFDAH9PtO93JEAF8+amK7qnFkUpt0aI55PjYsOe+ZOlOWkXDSaVC4CAUFiZk1R2
	 sp1o2shfxeDF7MwcwZ1etpXVIM66lMhWOsOKnNQs9mT4tFCx9btzZqNFW+Qv5WeUdd
	 Ed8t9oQg6I8J93JjvYXpCROUXP7ZnjdPWHtKc/8ARsp0NFGL+LkyfXoTcIqkB2TdXm
	 j0V1EFu8pmcCFRWQYZn9nC1DkRN2D62xDOooo/o2J9tKglfYzBxkdDVM21/8qoFYaI
	 QSa2+phTT8l5w==
Date: Wed, 20 May 2026 13:18:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] ASoC: codecs: aw88261: add TDM support
Message-ID: <f21f53b0-cb00-4e4f-ac5c-3998d0b4ab24@sirena.org.uk>
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-3-val@packett.cool>
 <5085cba2-6066-46c6-96c5-aeddfdf3fb72@sirena.org.uk>
 <ea7594ae-e66d-4fa8-af8e-ac790956e61f@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T5m/kT004NU4t3rm"
Content-Disposition: inline
In-Reply-To: <ea7594ae-e66d-4fa8-af8e-ac790956e61f@packett.cool>
X-Cookie: Natural laws have no pity.


--T5m/kT004NU4t3rm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 07:32:33PM -0300, Val Packett wrote:
> On 5/19/26 1:06 PM, Mark Brown wrote:

> > In spite of the changelog this doesn't actually seem to use slot_width?
> > It should.

> Right, I hadn't exactly figured out where that slots in (ha)..

> The datasheet seems to say that I2SBCK is slot width, but there are only 3
> options for it (32/48/64) and I currently select the one that matches
> 2*physical_width.

> Grepping the tree I'm seeing that slot_width is basically the same thing as
> physical width. Should slot_width from set_tdm_slot take precedence over the
> params_physical_width() from hw_params? Should I just have both callbacks
> set the variable and whichever was called last "wins"?

If TDM is configured then hw_params should not cause the number of bits
on the bus to vary at all, the clocking of the bus is fixed by the TDM
configuration.

> > Note also that we should disable TDM if slots == 0.

> This is pretty much already the case.. but I guess I should also reset the
> masks specifically to the i2s default (2nd channel to R). Are masks also
> zero when slots == 0?

They should be.

--T5m/kT004NU4t3rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNposACgkQJNaLcl1U
h9DuGgf+MDoWQjHIAaR4xZl4fbLRWJMeAA5LDyfvlh4HKl2hFn/ZwzNuENjHVpr1
1zlsQxbL1cjSnT0ENtbv9cVEr5t3VLAvVyVyxYdRuwrddQz0nAkemdv+A+dpgauu
7XQLiMVR47Emhq0rOlJJJbp8B9uLiCVCLYnXl+afVVJlSdLDnpB7NP5kpe8n+crS
QYlAwSNn+95QrAoHYdPVxHa9dtkr2uXtH2SAWwTfP6KKUI8sBusKq1S8KJ2Z0V0l
ADsMYvD3dkaZFdDv8irQrVpTYJjwRVhkg2/RbvROgzBUCD9Qc22eLCLPlzsKT1Xl
3EAkLWdkLPSdweySWH4jHowO+fFCpg==
=n95i
-----END PGP SIGNATURE-----

--T5m/kT004NU4t3rm--
