Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71121638D;
	Wed, 24 Jun 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337427; cv=none; b=uRK7oJja3SOb5UyyuTAacgIRYslM4d0qwUVoJIiVZAX3VfOSZd2fdIs5o94Ga+xYtR38Obj5j7/FiKO3y8siT9pThD5K3qyntnR/vhPZiDXyzyXtuDSTiuDQr4KAWf2qtBiWfAp8rjhFUv1APdZjd/rq2GF6x/ukRXdaaBwU4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337427; c=relaxed/simple;
	bh=WmAK/ogmeQIgKmJeBDKVi3kiBLxBeRE1V9T+DFXBUVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=slEEUlSc62jDjwRg9j23lJ6jK5dcwMk4TH1MvaevRSv9Oeze7ntSpmNFMHDvWllG9sssetF+gPzNbz46MVqEuxN+OMNT6iWP6QZpCUyM3ot8rYKZvPHlNcKjrtbL3auvscpvqHf0IU0GyLwBbjqPJlJUe0p8AKpTxZRJ2XaSOmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNcO5HRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNcO5HRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5C21F000E9;
	Wed, 24 Jun 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782337425;
	bh=vy8753oEDHZ+TgVjM9qVb55/Ynl5ILjPJGo5LoGz+jM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=GNcO5HREJAlA/HfdiQU3O6Kprnk/YXWiUkXROCgIMx9Yekfv+v81iAsFSO38cCjMg
	 66ql1wS0KMukDH9DSLu+nT63Sx58c1KprVxl1BXSqAKy56o92JpnyJd41QXehqYxpI
	 1NLfKXFymvVc9w+IaOPnefDg7VgbQE5keoFJtUXh/X6ilKFrlLT8Xl/Y/3m8aDkVE3
	 bkFMVj/I2VFFpfphWoSr11CucyCU9yoDXoaBQoBmCaQQf2VeiP/25aNFTlblVUtDcv
	 zg2HmQHil7Rbdl3LjPeR6ZODSKb+/snsDeTXiVD0rvL8WGPmKnYMMmwa8xHGKoMux3
	 TZyBw8CwfMRjw==
Date: Wed, 24 Jun 2026 16:43:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: david@ixit.cz, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
	Bjorn Helgaas <bhelgaas@google.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
Message-ID: <20260624214344.GA1031014@bhelgaas>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>

On Wed, Jun 24, 2026 at 01:17:58PM -0500, Rob Herring wrote:
> On Wed, Jun 24, 2026 at 11:02 AM David Heidelberg via B4 Relay
> ...

> <devnull+david.ixit.cz@kernel.org> wrote:
> > +title: Cirrus Logic CS35L36 Speaker Amplifier
> > +
> > +maintainers:
> > +  - patches@opensource.cirrus.com
> > +  - Bjorn Helgaas <bhelgaas@google.com>
> 
> Bjorn is not correct. Generally we want a person, not a company list.

Haha, thanks for noticing that.  I definitely do not want to be listed
here; I have nothing to do with this.
