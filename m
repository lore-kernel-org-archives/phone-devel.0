Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B93905F0;
	Mon, 15 Jun 2026 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502044; cv=none; b=Hn3ckufg/9lSq1aq7xIbVGQC8LqRsS70ViWYwtW1R0zOS2xjkX9JsD67uKoE+Q5SBQrRJ2nR96cPsSAvnKj2OuuHHeS5j+SXWCz4cTSHC+kijHuPN5UEhqfdf97H1xWpgIV86T48h7CtiF/aHqmcoWQFvLe8BbiCP9wf4r4iD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502044; c=relaxed/simple;
	bh=SvFQk7Oo4XXJYs6PDPkxOA4r04QWB/bycDBxrKH9PCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uus6HdJ3+dqzoGU7rUT54v29sISzVchsNHGmK3hrjUttMtlcSOElE+5CNr7BbTiSFjzfcuSmY3dSvbnxXP4ts7suSlg7LbGUv5RKKwTV9mrF2eAYp7n92P5JkaECBGFaNafzoq29oRkoS+oSFFuNhJdx//7hrwtdz6VA4jXr9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abhgOm2o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abhgOm2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E61F000E9;
	Mon, 15 Jun 2026 05:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781502042;
	bh=dDVcmZyuekvrV/bG465ak3v4VzU5afIIbXurQUsiLRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abhgOm2ormq9i5VHIdfl5jLbLsiHoTSn2RzNPGRI4t7IzJYHyTZo+A4/hN19oOWSy
	 GoX1d41wlOuDMv8YuXS1KMCBBxDkN8eCcVCJa1W3tzHTZY5jMwcVMeIxCNrMeJM6P4
	 B+f02rwAv2dmFt3p/3tbHE2JLjlvswSYeuxJTL5rY7stIG8Pz66SvoOZKwzxD2aU/f
	 TflxzGZQzRQarXKcxfoi9D1yvdIjcXymtw45L4ZCjtAR63oZy9HLgS5XoEihxRwWSJ
	 is3dHbkuWbNlH6DsoBbunrapeVBRiMBQyBit+N2bpTK9+V0gMBpDn5XQb5HLVGZXql
	 FudBEJJjUdRVQ==
Date: Mon, 15 Jun 2026 07:40:38 +0200
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
Subject: Re: [PATCH v3 1/4] drm: panel: Add LG LH609QH1 Panel with SW49410
 controller
Message-ID: <20260615-purring-shrew-of-defense-5a19fe@quoll>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-1-07f4134441bd@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260614-judyln-panel-v3-1-07f4134441bd@postmarketos.org>

On Sun, Jun 14, 2026 at 05:07:58PM -0700, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@tuta.io>
> 
> Add panel driver used by LG G7 ThinQ (judyln)
> 
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Co-developed-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof

