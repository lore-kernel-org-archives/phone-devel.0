Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1CC3451A9;
	Tue, 21 Apr 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787179; cv=none; b=Luv05quimbcRI/R7PL5BFTY7nwcJD6DA/5NQRG07+aKctKfo839M69BVB4bk/T5huggeO4Py6tSsdHDzM5pWXaHbdnThMi/b8CqxyhAu1B62M01zNIcbDFJFyH+xaYls0Ws/lt11nJcXkaUL/3JhxnzTz57yqP4HU/yEOXKeKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787179; c=relaxed/simple;
	bh=fTGoZqbpjcXXCp4oWjormj2WNVpeTuHMzeLUw+C6g3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjNXk5kWbQib8ZmUSmbbiy64AXs1biBrUVckaPaHLZxtdEcn+jHZA/in20Du6P1g8wCiBfCcR1G85ho75jH5hY/R+CJxxapoBu+4b2oYarofMI2sNClNzCKUWwIr4T/aSgLCSDuLEGa75uo05UqQ7hvxifC+EJJHEQsMee/MBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfM0hGss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfM0hGss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD744C2BCB0;
	Tue, 21 Apr 2026 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776787178;
	bh=fTGoZqbpjcXXCp4oWjormj2WNVpeTuHMzeLUw+C6g3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfM0hGssv9vYULv3l8phleX68dPNIIEeIyrCqswnKQz68huZXp2GN0ROclXyJpQOS
	 xWQvCE7lt8m00hF7ifDmSqrFGKi+mrGiKbc5d6i7T99vKE8VwBzCBm3+W8KNKWnwI3
	 ioIwTZ4tbOqxophnwa1LBsN/HNznuj7rjFq6T5fZdWmbHoY5q3iFYg8JvzE2DvYx8M
	 ALiY9BfN5SZh+SyDRLZi1qBa5mSkXBK+dFn5PYGQ6Ga4mcI53Pn8puEfTUQON3aWQ7
	 6YrTuSn3rGqazly7E7MA3Wacfq7g1nBjEPQRNMBjqQcmBMDRcgxAogY/OY8abJsL+2
	 PisgfktBE8iIw==
Date: Tue, 21 Apr 2026 16:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: aw88261: fix changing sample rate and
 bit width
Message-ID: <ddd25025-74ac-4363-8be7-9d2c70f8e623@sirena.org.uk>
References: <20260420213250.215465-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/x1biggMJ6PXRWHL"
Content-Disposition: inline
In-Reply-To: <20260420213250.215465-2-val@packett.cool>
X-Cookie: Jenkinson's Law:


--/x1biggMJ6PXRWHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 04:39:58PM -0300, Val Packett wrote:
> The aw88261 driver only worked with 32-bit 48kHz streams so far due to
> the lack of a proper PLL initialization sequence. Fix by selecting all
> the necessary PLL settings based on what was passed to us in the
> hw_params DAI callback. This replaces the strange downstream routine
> that tries two divider modes in sequence.

> +static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
>  {


> +	switch (aw88261->sample_rate) {
> +	case 8000:
> +	case 16000:
> +	case 32000:
> +	case 44100:
> +	case 48000:
> +	case 96000:
> +	case 192000:

...

> +	default:
> +		dev_err(aw_dev->dev, "unsupported sample rate %d\n",
> +			aw88261->sample_rate);
> +		return -EINVAL;
>  	}

The driver advertises more rats than this, including 11.025kHz, 12kHz
and multiples thereof.  It's unlikely anything would actually *use* them
but it'd be better to update the constraints.

--/x1biggMJ6PXRWHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnnuQACgkQJNaLcl1U
h9Dyugf6AxpcdQtD2uaQCcqWsL02d3CrTsCZxBi/r39EfAIfg7Hsct2vfyQ9ytOl
3e4lShraCdiyBXx/KS7TywTpeQVX7K0XBqcyQRtK7TxUX1B3a/laboz5abnS8xjs
Z5QPT3/Sz/t5W2+G+BHohsPZ9nouI6CvylLBK8VSq1ahywkz+fZ3H5DFohM/PpXW
m2I/7xQyILa5NGz9Dh21hFhOUB3nEqRmJ+qglvlrzSrPB4+v2x/J52IyFXCBORqy
VLC9AG4AbTX3OkgtfccUf283exKMUQVcDmw0EcXbwZALDZ3g5AntZADmSxxtPAvZ
9i2CRbOpLWg7JrGtuURiMcWLnLzoLA==
=kjeZ
-----END PGP SIGNATURE-----

--/x1biggMJ6PXRWHL--
