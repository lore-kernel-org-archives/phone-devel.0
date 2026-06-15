Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD32857EE;
	Mon, 15 Jun 2026 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502025; cv=none; b=n/iSnm6A+ZRzg8PoRSIBBkxCSUt9pDti2LRJlrKoLcietNP1YaGE6laSr/O8Xy/uNWt5Gt1LHK4c21IpJxoEHq+Mtc2ePEWw7aPw+STPc4KK4AsEf0u6O8kV2hz3Wt3ON3FEqhHaL43hzsqAvK1/SKwwwNchCorQwYJUZRQ842Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502025; c=relaxed/simple;
	bh=3nd5bYwbfranUDsLQNDkRnJNrUCCfh1WpV39N2ZAhVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oyx6iDUoe/QmZ2IKsZfy2rnEGjyaht3ZzPVP8BTVTcbMTG/EUyEMsMP0oWCl7rI3Hhj6EEUTv7gxkdiBGYtZgtp/aQ0xiytzjWCSr/B48qq8Kh3B0YH9TsWCTyf5rTfzw4VpQLzGLvRqV4Xx/UiWLuw4DWb63ZccFuquoAjC3EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dApx1DFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dApx1DFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8071F000E9;
	Mon, 15 Jun 2026 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781502023;
	bh=oVTv/3ou6eR5XuLEVtIdX/3BAp0B+266W+IcpFKpsNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dApx1DFA+fLTeSiE0bZBg6hGVnXoGtF/B6BhcP+9xp5azw8naWOGEjZmco9jUvyUj
	 moxe+gABu1eJpuGEHLu3cmZ88c0fyLBwdKSZQmq0CxeR0sL2dIia6BRE7VYBiCjvC5
	 x4o5FK3LlJw/yJ4HStVQS+hgqzh+CvKYGXd9w0K+02PDbrpdg18D8N0ABhTFPsZ0gj
	 cO/y6Exc3hZTSUKvJWQMuAfGpHMwDTZaKPEoIWvbOZ427NNpvj92qWOmTVK5qwpwiQ
	 vU8Z2nejoqkdh2fCexBmJ5YrIwDOo15X3cf6zVU3/3uaj4gKM0/BoAYQ1lq9zF92At
	 0xHusHTN64Zmw==
Date: Mon, 15 Jun 2026 07:40:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Amir Dahan <system64fumo@tuta.io>
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel:
 panel-simple: Add lg,sw49410 compatible"
Message-ID: <20260615-jacamar-of-angelic-aurora-1e4cba@quoll>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>

On Sun, Jun 14, 2026 at 05:08:01PM -0700, Paul Sajna wrote:
> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
> 
> It isn't actually panel-simple-compatible, and we knew as much by the

This is not a separate commit. Your work is non-bisectable - this commit
leaves undocumented compatible.


Best regards,
Krzysztof

