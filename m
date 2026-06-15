Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85FC3AC0EF;
	Mon, 15 Jun 2026 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501988; cv=none; b=LhSXDckj2syrrK35zwOBbvPSbs2RkKJq0QSEemxIYS10LsF4Gpmm/TFN3OizxK1g4gRbcGNF6ibD+b/GQ0zt7DYZK6cTCjJEPIUw14x0d/I2S1JejtOPR/QJUXo1ygmYmuh6zeTBacKpn4cMgo4uPPjSLWgJrPfExpQx0S9HOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501988; c=relaxed/simple;
	bh=aEF6Uxs4PezwgrsigNr9pS+CEPBWCWyBGIkrB+KaDFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9JijKtJBn4nAEQTyjpm9u6kCHk2c54SOPpXuX537HN+GnIfFB4d0o6TN2bkR6gG6MBFji2GX6IGqZVefzmAv7wsqprW6YxeE3M1R2RiWeA4KAEgPZ2xTnoLUHy3XN+u3mQ0CpFM5FxuCjnhjeLzENqCzEWvrUBzCAF3q4mU7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft1EVUXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft1EVUXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C8A1F000E9;
	Mon, 15 Jun 2026 05:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781501985;
	bh=ERkEO9VIx5uSJjdM+32cpS9CjGbH5ZoswAyC6QclK6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ft1EVUXD0kq0QWbOzwfjY8rJUQfH/oj/zpPK7mPCsRgU2mbuIxJ0kAuIf8pcgEwin
	 wgQlHLN1EBwoALjc1SgWzYpDXnwFtR7FXItT1aKCGXIr+LPLbxLvDjNAqZHrd1WeVr
	 e7vVL6LjW1P4rexm5jIdSz5hnPRL15e8xvtir7W/Ra/7Q+k3UOjgkVVr36E1Wnd7z4
	 7qNMM7OpETuOgKXmTP0XtBebaqu6tv4PGxcb6JZanNlrVcuE5zLFSTH7fmU5R41zpQ
	 pbCdmN04gZiGG/QMmdEIofWDyrD555zrvG2p90n2ZU5QLHlfa7hNS9/oTNk+Yjy/7p
	 k8z359kGeET7g==
Date: Mon, 15 Jun 2026 07:39:41 +0200
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
Subject: Re: [PATCH v3 2/4] dt-bindings: display: panel: Add documentation
 for lg,sw49410-lh609qh1
Message-ID: <20260615-outstanding-expert-koel-3dc2ac@quoll>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-2-07f4134441bd@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260614-judyln-panel-v3-2-07f4134441bd@postmarketos.org>

On Sun, Jun 14, 2026 at 05:07:59PM -0700, Paul Sajna wrote:
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "lg,sw49410-lh609qh1";

Ah, and you never tested this, so I should not even review it.

Be sure you test your code BEFORE you send to mailing list. Our build
infrastructure is not a replacement of your testing.

Best regards,
Krzysztof

