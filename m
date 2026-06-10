Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F5403B09;
	Wed, 10 Jun 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089132; cv=none; b=aiWyYPoCuzqR7Z5pidqFOuYFNL86ExCccI/Tn4jiu9Psch+OArq2Tivu03BpvRrAkmpq3xIWpmaXkDVLrH+mxBXYQQaLWSBG25SnLRVKy8Km/7lIs6Xpnw715vrc4TCVAjKoODrfQbVGfUBd2WbATy7ekQNkBNNV0do9WObAeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089132; c=relaxed/simple;
	bh=NmdinjyHxF/fIyT2G04rr9xV3v6p21ep4MTgBtwha50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDthqaiOWIRw2uCWwhhzzk2Ws6vn5arhU6d3TgI4GWKYLCDzjPtalFoXBh9oDVinJ2nNYe2BQms99Oxw9B/DstOSWNaY6arAHgl0P/rMrTooIHHx0ZKmBBlXD7JrRDFiBZPUWC1X9FzQYgWdTFtUjFfu6kvELxaZgBb2F+QmTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsNosMwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsNosMwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC531F0089B;
	Wed, 10 Jun 2026 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781089127;
	bh=kBy1ftOH0spfNVWjIV7Ntkw3pqs6LML0cP/jONPpwTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsNosMwq4bKiMs5RBf7mOYdv1RLHMGJupqb+byWs+/LD7mgKrNe9GxhVTj1RPN8La
	 nsqB1YNuXDO8uR0tLPTHjd3+8LbbuqjZl0YfC1aPeV2/HoIVxRYjc07ZYiJxaoQEOF
	 v6hMIAqsobSJdMWXt1YdmmWz/yi/1qcb1j+37ztfciEdFIyWYMrrpvySWp3r/hXX5v
	 TS3seEi4FfqTBsL0xhJzRZF1dMnpT0YGB5yg9o7lR/veq752ZXDwpYoKIGKE0KClOm
	 gPUKqFbHDtazesfDlDhnOyRnLFQvxur28bdKMCbyK6+SDnHJRxo/9TuhO4/6DvCFxA
	 URiutjp3L+0kg==
Date: Wed, 10 Jun 2026 11:58:41 +0100
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
Message-ID: <20260610105841.GK4151951@google.com>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com>
 <20260608085524.GG4151951@google.com>
 <ZyFElwT1QjOADA-7NXdGRw@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyFElwT1QjOADA-7NXdGRw@gmail.com>

On Mon, 08 Jun 2026, Duje Mihanović wrote:

> On Monday, 8 June 2026 10:55:24 Central European Summer Time Lee Jones wrote:
> > On Sun, 07 Jun 2026, Duje Mihanović wrote:
> 
> [...]
> 
> > > Lee, do you by chance know how to proceed here?
> > 
> > You can move them.
> > 
> > Please take into consideration data-size as well, rather than blindly
> > following RCT.  Larger items (structs) at the top down to smaller (ints
> > and bools) as the bottom.  Luckily the larger (data size) items also end
> > up being longer (string).
> 
> Am I to consider the sizes of the pointers or the structs they point to?

No - group all structs in RCT.

-- 
Lee Jones
