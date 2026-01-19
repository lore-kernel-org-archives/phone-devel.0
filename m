Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AE311C09;
	Mon, 19 Jan 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827571; cv=none; b=YDmnOG0m+1biH41A0SZXCbDW8BYhCtWkTNjw4Pcc58GUUqQtTLY2SspQl42+q0Kwy39vIbEe0Di6pkkcosSlNzx6TiH3sJ+LgddBUA2FQXLhoq/QYbACed2YPavoXemBbZYMO5lctK0qS7jabTwkY31KAA4fLrPhoov+UkNLhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827571; c=relaxed/simple;
	bh=jzxnDysdAcTE/ESQF9zJm79iO+MZrVawJLNKDFEnUd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEC981S2Jg48CbuC/t4NctvFycxxw0o5uV4wfORlGKt9XK9y56LSvCkTVYRsePs3eKjR2JeLVTw4L9vP/UxwE/VBEpVy0K71JtWhsWteuqszcqHvbKAzg0y2XMw9voo/b4ltnHnUU7YcU8ujCsHVlINMFBof7/Uj3R7+qdAQGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsQ8yEdh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsQ8yEdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECEDC116C6;
	Mon, 19 Jan 2026 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827571;
	bh=jzxnDysdAcTE/ESQF9zJm79iO+MZrVawJLNKDFEnUd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsQ8yEdht26VHg9cTEjmrmITRElpVjYHJqTljZgmaA1s44iIpaV2Zdt5v1YGeyOhB
	 aIa2YtVBu95bvA35YxVLOKVrP6sfdR0kSMQbuQHPSAj0RQDQMVTQxq6+WueqpyFWHg
	 RkHklvTDp0ubDxhaVGRR8iuRi5RgmxexsG+Ud9mEV8UeQBx58nuvZ028pvVQEcGLjG
	 l35pSDtldhTmkJ608rqSVI8t/H6ZA7vJ83O9WXEVw5hQLJCxdbVydeKEdvyCXz7x1B
	 D5Q7Rn3ibqrZ0v6vpruCtkEnJ5eSMZRDjXePLewgE1VOdf8n8buu4Sj/yFpasgba7j
	 6nSzfS7QKT2tA==
Date: Mon, 19 Jan 2026 12:59:26 +0000
From: Mark Brown <broonie@kernel.org>
To: bharadwaj.raju@machinesoul.in
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, bhushan.shah@machinesoul.in,
	luca.weiss@fairphone.com
Subject: Re: [PATCH RFC] ASoC: codecs: aw88261: Implement renaming of controls
Message-ID: <375753ae-baa1-4851-bad2-93e59e298f1d@sirena.org.uk>
References: <20260119-aw88261-rename-v1-1-d4236055315f@machinesoul.in>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="39EIWbHahabBPPx9"
Content-Disposition: inline
In-Reply-To: <20260119-aw88261-rename-v1-1-d4236055315f@machinesoul.in>
X-Cookie: Does not include installation.


--39EIWbHahabBPPx9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 01:00:22AM +0530, Bharadwaj Raju via B4 Relay wrote:

> When multiple aw88261 amps for different channels are present, their=20
> controls, widgets, and component names are the same and hence conflict.
>=20
> Rename these to include the channel as a differentiating suffix.

There's a core feature to add a name-prefix to devices which you should
be able to use for this.  See sound-name-prefix in the examples for a
lot of existing devices to see it in use.

--39EIWbHahabBPPx9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluKq0ACgkQJNaLcl1U
h9BPAAf+JelJPA0CvO6J25CbAxo7r/ir4vabzuDoV5iwiwc/HBFgzrlLs5mTuO+L
NXGH7xPKwsSQzA0vXji6q7tBOJihqgYEpRZuGLnersg8/T+axMe+Dksfsr42Khv7
drMMowSH3m5KOwGPXzNOjCyQVbIVVV4MR3jLUKC0cBqEP/3eEYy1Z3uBBEre6uBA
ij1XmNDW40r1tQrl6qYANkSO3l2yrBrMd7sSTm/zwf2hKgQTVRYJF5KB8x5b+m4e
lkF4Ql8lp2jzZC608qDeit5voI46oDRMfdvZqy9+DxFo4wm9XUuZ7mVZxISQHYAZ
3L4D7YoykUAXvaIvV5XlZJMtEnFwhw==
=Y8ok
-----END PGP SIGNATURE-----

--39EIWbHahabBPPx9--
