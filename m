Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50C43785E;
	Tue, 11 Aug 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455952; cv=none; b=G/IcXCKLLP1HjJ2QPSoWDBUp9TlZIcudZO06aiV8Vxw+f8eWzP3Zk0i1kcT6o/PEbCioRSfpm9FUPFXwIJJWMOvo4xlUoblt5FExE0Ul0JeWatsBIX/UJMsbv2lWQcY303lRn/r2CDIUv5/UFzSaBEkt1ystTXJa/LkrjFTIFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455952; c=relaxed/simple;
	bh=oK+tJ8ePVa/STdgtlw7yhKAMmZR9w2BdcebxCJbE5ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upWkPQdqK1+WC2yC41/fJEHa05WKViE0DaRyD0PQJn+LIicm+b3Ni9xF5rScTEOTInlLkN2qH5LGsKcvNKNWEUfESxXYXN5+rt9dYR2fyUbzxS2pS6MPJa4jUvk8fElWN/UIrsfjAH5BGKWs6771JYdOanBZAFNonob2tqasKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1nBu3De; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1nBu3De"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103C51F000E9;
	Tue, 11 Aug 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786455945;
	bh=WJsn94m6kic0rpMASlJenrkAlsCmPp1NHeAGw6wWVxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1nBu3DebBwuYpYckdodFKUrP+ADbfP/H6DZ9Y7liRp4zCqpa1Em/f1dsmucYYZlB
	 uKxKK9eBm9rDvJXTNMBEGOeutrmvkDldbUFo/u8nLPptd9AD9CTlMepHS0ndurXDNB
	 E8dIWiONEFU8L85VE5esCGzLvc/K5IZrmyCwsSBPHRdEAwTUvtAT04th3lNApzi+q/
	 /OlB/3rbUfl9L/OyH2IkRBWCgCVZyGX4+uYz01IvoOl1heuAcBLHr7+bJ5lrRae9NS
	 sKgu9vcmgiAnVH5ReVr/rNA90/4er3MqtptduNrGJrk7/9FUK14kTH0wFhR+jIvihj
	 ogEfyug8003eA==
Date: Tue, 11 Aug 2026 08:45:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Manuel Traut <manut@mecka.net>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Ondrej Jirman <megi@xff.cz>,
	Olivier Benjamin <olivier.benjamin@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Warnecke <awarnecke002@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/4] media: dt-bindings: dongwoon,dw9714: Example
 shouldn't imply 1.8 V
Message-ID: <178645594369.2062848.622744149571079300.robh@kernel.org>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-1-7b4d90788f9f@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-pp-pro-camera-v1-1-7b4d90788f9f@ixit.cz>


On Sat, 01 Aug 2026 02:35:20 +0200, David Heidelberg wrote:
> The datasheet says VDD should be between 2.3 to 4.3V, usually around
> 2.8V. Correct to prevent confusion and extend description.
> 
> Fixes: 2a96b40f366a ("media: dt-bindings: dongwoon,dw9714: convert to dtschema")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

