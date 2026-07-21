Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAF3BADB2;
	Tue, 21 Jul 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621972; cv=none; b=B6QQXc68Hah3lAs8OlNbLFYHSD8hmYNR4TL3lbBBI0HSTB4DQ9ZNTd59WH64PLTBsX7QjWe/m098XXG+yHN8jxPaL1ADgHl1OHtEPe+X8uhy9D7BjIeT1Wl7EDBKq2YXWdTwXP5QXf22P4CI+bOtpygecIs0nhU+TXlUvcUYhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621972; c=relaxed/simple;
	bh=lVtaX7Zx70XRxWSS5I/G2DvKC0wET8HQ9h61CsXZPxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0kJmiGzK0wOFj1BObmEkwb4y1Kt/4sVQnsqFNTdTju0CiVgfBBoTpV0n/q328I8X1kTic1jsYMgnXIV5WMsQ0BAXfnjPRSlqwSE29I4XnM8qwt+kIHYOncVwK3BfUy1fbvI5ORcjObdfpo01OsG9ypyc9mjLckm7etotFmyccg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drE3GvzO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drE3GvzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4E61F00A3D;
	Tue, 21 Jul 2026 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621971;
	bh=lVtaX7Zx70XRxWSS5I/G2DvKC0wET8HQ9h61CsXZPxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=drE3GvzOvAZVMhVXaAMxXtE+IXIDad2hDXr9da3M8Mnxujikf8fNdPIb4w56q1eku
	 IdsOerke7OkTKcN0HD5s0NQ7GobEHDv24wO4lgSA8ARw2LsWALs1BPVGowdjZuYecE
	 3T3JxX8XiPHoyymVaOG2QCxrct4dyHAoQmvIGvPufqdTB0SYwhofYMGbm+kXU274+k
	 WeSGRoOnXnA5ivKaz0PxCO6fYBlkabkV1YElm0VOrzD7U9AbXs+/J15eM3t7+jBRfZ
	 6NEztdWbye0oyPJ7/Fvx42OvaeOBen1AdkYaAgubALfKZPr5qWfte4H/JjgI7LGQck
	 +BX93Fctx5OZQ==
Date: Tue, 21 Jul 2026 10:19:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SM8475 QMP PHY
Message-ID: <20260721-strong-malkoha-of-politeness-5dfcfd@quoll>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-1-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-1-48bd91a19abf@proton.me>

On Wed, Jul 15, 2026 at 02:37:46AM -0400, Esteban Urrutia wrote:
> SM8450 init sequence for this PHY varies significantly and can't be reused
> in SM8475.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

