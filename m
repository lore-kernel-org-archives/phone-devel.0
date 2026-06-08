Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE463B2FFB;
	Mon,  8 Jun 2026 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908930; cv=none; b=RaZveklYPhEsc4mR3jDPzQ+cSSF0V6bntBq/G1vEzKPiyoX1c+SlTBqNaR26LtwfOOlXTZtgN6FN3HFUP/b1EiwWpj+A5JQgrnZgVmmvW8vo+qscfdGA+fxpdlBc1f9ixgryTbsd72QeYTOIfyrnAEzCyZceGXiZtiXt4o9CQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908930; c=relaxed/simple;
	bh=y4BfutItMRvmH3RltnVp7QouoDix0M0zL2yCAFC8ILI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWRIbffGwkUBRd4WQ5MdSZGhB8TD8NYzj2Tuq0Zud+XH75yjvSN3xsbk5LplUkUf+CO2gj6tS9+BXhaueF5myBbqhtHrjKlFtp0CSYtVpKYEx0XUTexbJbrMfxBQ9xJU6I3MQT+86nI3z0rL/qOtHjJeL/M25LBAWTY4412dyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLrFKphX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLrFKphX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04F1F00893;
	Mon,  8 Jun 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908929;
	bh=ZaXpV5o4XSzFfGGwxH9qcSMPAHS5WLvkB+DI+9OzD4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CLrFKphXgBtfinoh+ezkdMkTRn0Z4mYfjqpSNiZI6MLfbn6GrK/khli6O8/3tTXmO
	 qmNOn7mK7zlCQ05hyjrprCaxmxYRxLQwOy5kbjvevqriqgkUMYjSiH7qxgjv7/DcxN
	 3PXeHBetCadn2A5TwzZMyKgcBOd8LeeH0lkbajGegSKgYkO7kasze6AvOzQxmn/GJ/
	 X2He2snTrjf+r86JLyfHkb8xmZeKNFjrsrcghslNhxittOHO1nUfIqaaxil9N86KXc
	 uR1XQVejXZM1pREXeN1mo5otuetnnU2ujUoH4Y2MKE2KSxF5V01FszdcSZrRZGru+H
	 drZb9UBzbT1sQ==
Date: Mon, 8 Jun 2026 09:55:24 +0100
From: Lee Jones <lee@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Message-ID: <20260608085524.GG4151951@google.com>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>
 <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
 <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com>

On Sun, 07 Jun 2026, Duje Mihanović wrote:

> On Sunday, 7 June 2026 12:19:21 Central European Summer Time Karel Balej 
> wrote:
> > Duje Mihanović, 2026-05-26T21:14:48+02:00:
> 
> [...]
> 
> > > @@ -88,7 +94,8 @@ static int pm886_probe(struct i2c_client *client)
> > > 
> > >  	struct regmap_irq_chip_data *irq_data;
> > >  	struct device *dev = &client->dev;
> > >  	struct pm886_chip *chip;
> > > 
> > > -	struct regmap *regmap;
> > > +	struct regmap *regmap, *regmap_battery;
> > > +	struct i2c_client *battery_page;
> > 
> > Not sure if this should be reordered to preserve the "reverse Christmas
> > tree", but maybe it's fine if checkpatch didn't complain.
> 
> I opted not to move the declarations around in this case as IMO it would 
> present noise in the diff, but on second thought it may have been the better 
> choice.
> 
> Lee, do you by chance know how to proceed here?

You can move them.

Please take into consideration data-size as well, rather than blindly
following RCT.  Larger items (structs) at the top down to smaller (ints
and bools) as the bottom.  Luckily the larger (data size) items also end
up being longer (string).

-- 
Lee Jones
