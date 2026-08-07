Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4936F90C;
	Fri,  7 Aug 2026 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088831; cv=none; b=oJEKXMkWcEzjRGozsxeg8NabAbpqUh3IEaJ2hvjIqoEnu0CQyDFXhzoPHXnnoXi+HAuVF7eyPN6pF0WrPdJDuiUYJp86/pNyYQL0Ju4qMvOmvdcAv875lxYIHci4GKBKcyKdgrNCt4obcKcML9GMKZsdWvQoDUgtBeqRH2mmdSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088831; c=relaxed/simple;
	bh=HvesN3mVdyl/+DFAk0hnjAcs/fKEmePJU8NlfZi3WxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmPj3aowq1LcwSy5tDbzWX4q6wu59BEJ98igUhjt9NrPzeyL8u5F+g2dfjgUs35iP11Zttkq2dwk256JRIOgnrVGE2uYMovcRvll+z2fY0rjImdB7BG1afafN1uV+UU3JYpQ4ip1lINAA1ioLgjVEvFK8ZYn9xzWM6f5qNdPe/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLZpAlI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLZpAlI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2591F000E9;
	Fri,  7 Aug 2026 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786088830;
	bh=BfMr0s7HAoputFERjTs1A10wPfKvLBl6kvW4bF7N1hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLZpAlI9CYl1PRLy4rN5NbC6rVLytnFNKzKoZa0m0V8nIdU97XtCHGG9mKVBlvF4C
	 +VRX8tEZfrbBrd+yGJxoRT0iXqMDqG4AgvcGCnS8jsVuQXXD4AZEe39pyQy/+eJN4q
	 F3dvE03EiyFtMlSPONRkXLbN5iKdFxC5gPCfCBNWGzXXz4rzRUuCnfCTpghB0n2zdF
	 tcOx1hvrVHRsAtvizNJdA2CZzLqUOGx4rtr7ztFQol5SsDhFzA3zndgiXmKIv82c9G
	 nrqcjCtVDJKokfGJE6SMseXJE0NV1iwBXJEhju/IstovSVrZG04cQBWCtVRVC3c0rn
	 oi+xq7RtBPRZQ==
Date: Fri, 7 Aug 2026 13:17:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Initial PCIe0 PHY support for SM8475
Message-ID: <anWNemb2WCYUwRJm@vaman>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <f0c1eba8-c6d9-4831-a460-980bead03c4d@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c1eba8-c6d9-4831-a460-980bead03c4d@proton.me>

On 07-08-26, 03:27, Esteban Urrutia wrote:
> On 7/15/26 2:37 AM, Esteban Urrutia via B4 Relay wrote:
> > This series adds support for the PCIe0 PHY found in the SM8475 SoC.
> > The initialization sequence varies noticeably when compared to the one used
> > in the SM8450 SoC, hence the need to add support for this PHY.
> Any chance on this series being picked up?
> Kind of related (since both series belong to the same subsystem): I
> resent USB SS support for SM8475 some days ago and this has been picked
> up already.

Already picked up, should be pushed later today

-- 
~Vinod
