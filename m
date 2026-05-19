Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF63F4DC9;
	Tue, 19 May 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206780; cv=none; b=M21N/pLAflSYnop4lAIAgVfmLX1fOWFa1BYvY8i8xJz5eA7TAGYIfPnu/nyHr8L8p3dMfSgtgC/uFHzFOXxdtD4DqGH4GkfaTXB2hrzo8hcN57qIIWlGtwrcvK5ZzbFpkxUcsZORN4RGTsl6i21f0dcT5YCSbLL+jfMsIKzILPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206780; c=relaxed/simple;
	bh=mBn0MqclVglk8oOYEJcXCxaFM1Rq9ao7OxZ7jU4UsgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJmQbVNXoNKBq4fYtz81IXAqgL/lPujG8bxx+WreV9E+5k9yJ9H51pQQmvaScEar6S9xCaqTaZYRzPTLMLD+fijt5HddoPAsVDAaxOEo9rEWF/qhlmgTp7paMsgXS8ONLSlp9EVpOa2b7h4bS6wrRymRUtjIEOMjTwi1EE+vHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEti83o+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEti83o+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386CAC2BCB3;
	Tue, 19 May 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206779;
	bh=mBn0MqclVglk8oOYEJcXCxaFM1Rq9ao7OxZ7jU4UsgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEti83o+9GPifWtmJUqTDZdAFW3648kTuHBHsj+/HkjR4iChpryc159XZO5xHSAQZ
	 r6m06tEec6b48vL/4pgla9ltGMEnnGTiKElHQTZYVqvA+z8kFcliSaByEp52R9uI6O
	 ttPqgD5y5hItOfcFkiLIybAkJiz2GHUp+aFwVAwGT1+LHswSYoSBCQsNaqn9eKB7gD
	 TGVPVUDItHlGFW7Pz8latS5dMeZ0vZ22+jaIKNKw6qSK1wxP8MkeDz2TrMeu8YX4Vc
	 0l4gh3nsMm2aetzGw1ooFAeT9v4BPwO9b5w+3wii7tuYn+E02M3rMDeX3qzxAceF+q
	 IQlLrwOWEbctg==
Date: Tue, 19 May 2026 17:06:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] ASoC: codecs: aw88261: add TDM support
Message-ID: <5085cba2-6066-46c6-96c5-aeddfdf3fb72@sirena.org.uk>
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KBqObJqUEVUt7+h/"
Content-Disposition: inline
In-Reply-To: <20260518220906.347958-3-val@packett.cool>
X-Cookie: Huh?


--KBqObJqUEVUt7+h/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 06:44:31PM -0300, Val Packett wrote:
> This amp supports TDM mode, so implement the set_tdm_slot operation to
> let the SoC driver configure the TDM slot number, width, and masks.

> +static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
> +	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
> +{

In spite of the changelog this doesn't actually seem to use slot_width?
It should.

Note also that we should disable TDM if slots == 0.

--KBqObJqUEVUt7+h/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMinYACgkQJNaLcl1U
h9DFmQf8DuZC5d5sLd0pOXFn3jiruLWzBSp3peoHQCe34R4drrO0L8zMhgcOO35Z
CbrZLXziFE/BUjlF0xwNbTCbGGIQmWVO7Z+HtfT5WZMCDXNc2cgtCkzlkB9d8zjy
DC4Zmn7i8D2D+N0n+1z+JUnL6648z65bwgvxzQSHZO7YqqUBTC9YgMD8eOKf+RUg
gpPjNlrGpjQ5u8KKWrCBWZ5CqVF/GKPzAMWrf13tS9D6gTsMFc4E54mCLDF9pXGz
+IDv3mqKEFyWZxS7j9p4NhOPC1D4TdJHIE4eHVg+VP7d7EN20HfWB5cy0nJb6BD8
2QoR5jKc1CyUyXWLxOpAmsG4ZzgdOA==
=7N0p
-----END PGP SIGNATURE-----

--KBqObJqUEVUt7+h/--
