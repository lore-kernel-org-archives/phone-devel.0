Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211123DA5CD;
	Tue, 11 Aug 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439518; cv=none; b=OkK1lDLLXPMOC+pzWBCcGXE1HLa/O67fPB4mtghoc4oCnyKFKrBaz34i3TQYZzGK3aB5z2zk8bT66VshUSq0CiNQmro7mz1r6C7XooL6NmSrcfYnoci86rQgHvfkKGS4l/M4Jm/emj4GLeEOWT+y9ANeXMJNkj6xynBTODcB1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439518; c=relaxed/simple;
	bh=po5+wP0U2TBC+FVKr01XOHbmY3talVXqJp7KnmOCIQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjSPiszc8dICOQai1zX/efGqNiDGueOaQsJm0pb1oaGIR5MKCEVY8x1nqjz0NduEZyE0njDlaUEzNzfWIiHyXnw5rl8TMZ72R/qfnpl9OH9FgU5tDKu/U/JXGwdQLXne3CZLjgZsjp9Lt1o831VVV5/1h9PHS0YTBMny6H6e9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boRyG9hC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boRyG9hC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91241F000E9;
	Tue, 11 Aug 2026 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786439516;
	bh=TrkFBbkecTCcsu/DhLu0OsB/6QF6n66HPvIjwvA7MZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boRyG9hC9kgOPMxjMOZOLPXwT+esiVW5sy8I+8n7pvS3iEeM3QZbE22pUBqVqxtBr
	 wRbmWhIgtTp8k3PSHQ98PM8mWBHKdt2fpAY5xbD2Ox05UPYNPVbdQ7ot6PN5yfKFGM
	 OpKM5FgcdBhb6LcV+wnM9zHOgx+S413HB0rFkppa1BsfvMWZnz/pP8FBfKpnV5ziT5
	 mgcXKmLyCiV+ltSlgDMThnRNX6Dwr+qK8SEf4JiHOGhp2RnnNkmIQ3cruXacxrYz6C
	 BUL/5ApiHXuUTbu8R1Gax2himWfaHeSznRep8zEPux/XxzrbCqNRWVHyDT0AhodD8i
	 AleWurP3JPjYw==
Date: Tue, 11 Aug 2026 11:11:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Message-ID: <20260811-watchful-turaco-of-opportunity-b8ddbf@quoll>
References: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me>
 <20260810-ps5169-bup-v3-1-a2178b2834d7@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-ps5169-bup-v3-1-a2178b2834d7@proton.me>

On Mon, Aug 10, 2026 at 11:31:36PM -0400, Esteban Urrutia wrote:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> +
> +  parade,dp-eq-db:
> +    description:
> +      Equalization for DP channels.
> +      For example, <6 5> denotes an equalization of 6.5 dB.
> +    oneOf:
> +      - items:
> +          - enum: [ 2, 8, 10 ]
> +          - const: 0
> +      - items:
> +          - enum: [ 5, 6, 7, 8, 9 ]
> +          - const: 5

Eh, this is on me. I did not pay attention that values are fractional.
You should not be a list, but expressed as a single value, which is not
possible with int32. This might be the only ever practical use of mB :),
but I doubt that any engineer would find that readable, so let's go to
your previous code - direct register values - for all three properties.

Sorry for the mess.

> +
> +  parade,usb-rx-eq-db:
> +    description:
> +      Equalization for USB receive channels.
> +      For example, <5 2> denotes an equalization of 5.2 dB.
> +    oneOf:
> +      - items:
> +          - enum: [ 5, 11 ]
> +          - const: 2
> +      - items:
> +          - enum: [ 6, 7, 8 ]
> +          - const: 0
> +      - items:
> +          - const: 8
> +          - const: 8
> +      - items:
> +          - const: 9
> +          - const: 6
> +      - items:
> +          - const: 10
> +          - const: 4
> +
> +  parade,usb-tx-eq-db:
> +    description:
> +      Equalization for USB transmit channels.
> +      For example, <6 5> denotes an equalization of 6.5 dB.
> +    oneOf:
> +      - items:
> +          - enum: [ 2, 8, 10 ]
> +          - const: 0
> +      - items:
> +          - enum: [ 5, 6, 7, 8, 9 ]
> +          - const: 5

Best regards,
Krzysztof

