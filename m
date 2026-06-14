Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103519D074;
	Sun, 14 Jun 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781433356; cv=none; b=RSifJ6ibR1hcuYoKM2cGQx+4ER0YbzgGOUjc4IeShGLgeM7nvq9ipKNKs9IHANcqv2F5aCB7WxvI+b2zKTpI14E4K/s4IOy3qEeXOJ5HlAy53boKAq9uQ4Ifzbsg3xix6rlNQP/4YgblcdRWmN6XOPz+BQPD0prADJJ5EfQsY2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781433356; c=relaxed/simple;
	bh=1QF+N2X8XnhDlVoAMtIFBKDi5geAr1OcSkaPvDmkDXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6MuMHlcXYq/iK6sFteDYu5Sz9LbZk/kUOAwe7byQzatUxstmgkXhIgZWTGczABiE5fRJeeUfboh90Iv+1fOrWx3KMovLC4nLi0d36azRWsf7Bv2R1kZE4ElUHqLXVJc9CFyI2RBRCHIH/6XTN5EqKcROEqLBy2FY4lekn/h/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6t0XovL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6t0XovL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAE31F000E9;
	Sun, 14 Jun 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781433355;
	bh=VAEADmbcc/MqYQEuunt2++DWQsDZgWfCQK6e2A75YCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V6t0XovLp8S9/5f3Wmq1flzwwuqCVk0EhR7r7B5P6P7n+JNLI0RBsl4C/OjPWZbxc
	 icWCTSvYir3LVwVO/GSW6wft6r800V3wSTR3fB8NSdPduMxWhDsHBXIPdCc1xjx9Kz
	 gGsmv4BmTwcKETJ0W1E+rAMiXfBO32Gdul/TO/5ZWLAvFBi0aPCcNDM1kqWxcs+EbV
	 tuiBoyZMYd25yEL/jV5x+10L4KVqnM4B0LzlMFhGq/HKuuoFpZ+dFE7knIXjCK0nQQ
	 XkW2vcFRyR2ED62nSMDhhL4qmtrBc5CsK9sIpSsaZIOAa2LuA8WqTItYXsQ/Tp82ry
	 1RU+xZTJOmxyQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 678041AC5AC6; Sun, 14 Jun 2026 11:35:52 +0100 (BST)
Date: Sun, 14 Jun 2026 11:35:52 +0100
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ai6ECJgLG_GGx3tM@sirena.co.uk>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4sUG4M8NCPEnOOs"
Content-Disposition: inline
In-Reply-To: <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
X-Cookie: Price does not include taxes.


--V4sUG4M8NCPEnOOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 14, 2026 at 09:26:42AM +0200, David Heidelberg wrote:
> On 14/06/2026 01:53, Mark Brown wrote:

> > That sounds like both.  The Cirrus driver is definitely buggy if it's
> > mapping DSP A and B to the same register value, at least one of those is
> > wrong.

> I need to clarify. The CS35L36 supports by default only DSP_A, but when
> extended to "take DSP_B", speaker just works.

> This was done previously.

No, that's buggy.  If the device only supports DSP A then the device
only support DSP A and the driver should express that.  Any hacks that
can be done to make it interoperate with something else should be done
in the framework.

--V4sUG4M8NCPEnOOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmouhAcACgkQJNaLcl1U
h9Bnngf/WupwiWbL0WB9ym1D3QF3qbHDSXJQKSOo1Vtwcxx/lGFNckmPUKycd3J9
PBI5zJ2wZ2q2onMZmpv27eAj9i0waVhvNdcFDqZnfPNqQimg/c/lewv9zjmVuBcJ
+oCiSrGHfZfs6znEt+IMntQSre4gljue2Pj4H7yxvFg0UWzNyPJXxRwfwSLELDmA
cligdZJ3hYWLuxpxc3txpaI49oPpoaU385y2Sgc8peNMgOh3FkxDXzPT+d1CwWoA
zDeAHr1OlUykRAzOUxg3uODD2zx05XGmWfE/tMAqvOZg2vMsF1gK5vgM2++2WpJ7
dgE2fOiOOQEEXYuNfYOGMuQFg4vbyA==
=+odq
-----END PGP SIGNATURE-----

--V4sUG4M8NCPEnOOs--
