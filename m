Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522053;
	b=xzPdnCBx7uMZHIm/yDJcQImDauyzEH2qllH6qow+q6pploLf6pYqlJM1K9GZC34ocWPY
	 RXFFW4aKDwYo4S7y5b+A4SbPpYlRZFDA0vWtJSonApzzFjVKG+H1129pyO1QU4w8qroGL
	 OV0iN9r4fcrSq+Ka026wR08VwQDUAy3oA7lc+gm2OD/I1Wdf7Dd/oQQIJRrLRYP9uEFEE
	 mN7fvtUPrYFivb0Tap3kfeGHIOo6XNMUcgedc6hzG9IibFLzWJzVca7sVCC3BRPq+sAaw
	 ndb336lKrqr8liw23bj6htwzkjtoEd1m33FD1+RU3cmOuhUP/GpTRbEX5mWg5tiqIFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
	b=46yDdvZVzi7H8m+i6ElC0n5QGZhbIC2gzNwgV2HEWL+VhX/nIK22tEyjKGtYUrrADaW9
	 3GEFk1LnSOZORe1Xp5nKKjXAfFuaZiPELpK9SU6G6NioVOFN0j4lfdNnQGw1OWtvnLl2U
	 PqKsSMPhZKtp0bF5/XrvT0PfsRtIyj/Jpau1CPN3FHP4QstIjqQY8EDFRD/GWRMKPQ4+F
	 DEeEjDmKpvV9LBhwa5mio7wi2BuGSM0fOu5DpJLkm62l/M5gBDnHLgydyhOAO8/MMWreQ
	 6z++kCnxR58i4myQY0P7O3BdIYsLkhKKYYUTlBnXF3UwsQty7ZUaie7TkbGSCGdq3tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843B606A31C
	for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 22:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7843B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794522050; v=1; x=1795126850;
 b=QeO99b8bWnpn9F/8Ggk1UN9xt2m9As0J47VNdgcbao4xp16Eyts6kC9M1yMv04KM1IrVOeEB
 eCYEX9jzTzB2fi78WnPjavX2DL+llX+FTgC4sAnUFCMhZP4NE+NVkDrqR0GTJKwN1m1cMLwnN92
 zWGY9UauX0w2IgdGhaQ8rz7E3kOLHgwBU64ymTZBhEws6+LnW6vflt3UghMOrdj5XTV2ifsMbK5
 q2Gzr5r4FRiItMgi7RWB3BSt3YbKFAyXHiAO/vX5r7SKdVb4SqV1g5ISaP25Yax2/hHkEAEB8hS
 cFkocfTdidxrOT7r3lt4mhthQt4zpQwDJpXXJARzs5egA==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20d835dec25aa392;
	Thu, 12 Nov 2026 22:20:31 +0000
X-Mizu-Trace-ID: 20d835dec25aa392
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 22:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <4d30540910d8af03de850769e326906550b15574@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
To: "David Heidelberg" <david@ixit.cz>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nikita Travkin" <nikitos.tr@gmail.com>, "Alexey Min"
 <alexeymin@minlexx.ru>, "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Nikita Travkin" <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
 <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>

November 12, 2026 at 10:10 PM, "David Heidelberg" <david@ixit.cz mailto:d=
avid@ixit.cz?to=3D%22David%20Heidelberg%22%20%3Cdavid%40ixit.cz%3E > wrot=
e:

> instead of comment (which should be formatted such as /* */), I assume =
you could use #define here?

I could, but then for completeness I would want to spell out all the aw20=
13 current levels, which might be too noisy. Or calculate it, which would=
 be hard to read. I think comment is the best for now.
