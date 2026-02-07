Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2592D8364;
	Sat,  7 Feb 2026 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461510; cv=none; b=MH+H/JsEhvYYqv+mq75e/pBjp2GopsrLGNQjN8wR5kS71uhDrdVqIZFqYLJzpQhyrYDJy0pU7cshXFPYqPsPx7THyE2FuzUiJBdYwsPwQqJl+lyRzisZ+N52JSvqB5thMYYkxUoHYOPDAxu8vPnsVYlPEyH+OtxTayaZr32EHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461510; c=relaxed/simple;
	bh=Yfe0JQENx3JzBys1xX1X12sylG5H3tkB7w1ZBl0x+eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obfs9oOk3cr0Yqh2+2ddiuQiKIfEzDBir3IBTeuIKuZCL2fy43JOuTm59fqKb8y8gvWCUrU8xwPGHzIM9/iY0+Q7Ewk6hyN4r4yIBAOQgAwHyLZm2Y7mZ84CpOcYnNPPkoQjRnibOiFIlFxdUmYp8YWD4/S0Rr+6daTFnJ4Q/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL4c56Yh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL4c56Yh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5B0C116D0;
	Sat,  7 Feb 2026 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461510;
	bh=Yfe0JQENx3JzBys1xX1X12sylG5H3tkB7w1ZBl0x+eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aL4c56YhzpWOZd6f6yU7YVZZDUks+8I/U11G9l9PQD4zOAoyVfrtZ/xHwTvS5gnqY
	 +qjCDdW6YRk6OY+IH3RulTJXmArpvEhVmPPUUWm+Tske0cCn6smYWXAjFG7Ke3uQUg
	 onwEJ+P7v8RM7pzJASAWttZSrbUr2Y8xJ2nqkgGiIbD2D5boxJAibzXf8wiTC0CeRZ
	 TV7Me+O9nc0o9Rz8LhUWEIn27A37aNgPledniFgGmzw2O19G4WJ3t1kx7BoUdqw3dz
	 citAOOofu/x4eaMq+6jsJpB3N53HHcYcc8t52AyaUyq+AhM+fkFLA8iY6A/S9t/FL4
	 m7RU74gvdVMOA==
Date: Sat, 7 Feb 2026 11:51:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: fix syscfg-pctl
 compatible
Message-ID: <20260207-fragrant-malamute-of-pizza-64f1e8@quoll>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-2-96dcb37acdb4@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-2-96dcb37acdb4@lucaweiss.eu>

On Fri, Feb 06, 2026 at 11:20:49AM +0100, Luca Weiss wrote:
> Just 'syscon' is not allowed by the dt-bindings, so add
> mediatek,mt8516-syscfg to it.

We also do not allow to add fake hardware description, so above is not
enough.

Best regards,
Krzysztof

