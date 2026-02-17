Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197B1A9F91;
	Tue, 17 Feb 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771360006; cv=none; b=P/3XGCY/72yWNGTBKHmhEoj7x4+yNoQBLvpIcglWo26ftnf+lagp1IEloFgOutkgqkmBr5COTg/hJjoy2uYJ7zXIUE7ynyTpZ9LfC5So81Xm93DFB6MRv8OZavDQ4UqVWqH67ZTN/QTfDMt+HGRJzFHBWCLbmSLaCtSHLrCZpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771360006; c=relaxed/simple;
	bh=TfqrVkjjhQ67a7UsK1c6lgmC8THfQq3eSm+drD+TQ28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNfDw2vg4RXFY442J6SsMGNQZb1dn8GJlgiy17Y9n+mGfyLBY1sXucjqnfKSU2bDcxwvv/UXiMZ9SCJHZ1yWQ9jsyrIX+wOWRPGy86FykukGT+RpzV/+ek5PluHDjOuwEef3+BOJiOSRnaZFSoIbzclD7A++SlJC4kmWsm2m8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9lqDfIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9lqDfIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECA9C4CEF7;
	Tue, 17 Feb 2026 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771360005;
	bh=TfqrVkjjhQ67a7UsK1c6lgmC8THfQq3eSm+drD+TQ28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9lqDfIGImavMes8hSxkv32hGSnFhtd7sW3epyRa6pqd3ScI4T77tMGVq5ly0bV7v
	 BBLpivkPZqL2/XolV0zJuAMihHalyvNIinAy5hN/wYPxsdeJSI2AKjKNpGLJDtFw7e
	 /UXQ6X3h4k40kkHxkmN1TNt8drISWfi+XmA5K6CN5zUUvERjcVhX3Ot/j+9fFwe0mm
	 ZPAmvs6nYu8Y5+l8/MsGGecQ1VvGkSGwiYG+EMuW/kLGWX44g7CF0FJY4U9pS5Zkye
	 F990Xc/7HyRZDvQcILoR+oltQe07QfsCX8wWLSOLLrsWYTGTWYpnc5IUhvO21oTVZU
	 PaTBk5GSG9MLw==
Date: Tue, 17 Feb 2026 21:26:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add compatible for
 Holitech HTF065H045
Message-ID: <20260217-massive-juicy-shrimp-2d32fd@quoll>
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217070121.190108-3-val@packett.cool>

On Tue, Feb 17, 2026 at 04:00:10AM -0300, Val Packett wrote:
> Add a new compatible for the Holitech HTF065H045 panel that uses the
> Himax HX83102 controller IC.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

