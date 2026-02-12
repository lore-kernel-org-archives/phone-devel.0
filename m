Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487631A58D;
	Thu, 12 Feb 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896047; cv=none; b=GtZF/1/zyDvygHm9EgJbZ6Q+AZpkdQYtn34RzV9irPeuDCmccCelshldsz/IapFOr6fdpH06GC0Ao8GpQPcWnkHBodvNhtcwvjIUyB1SAigKmkbLRPFTP+IRYCl6wPyllcVhmm1zZECAmw3zYRwOS3pxeAeIKTBBo10iduIKD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896047; c=relaxed/simple;
	bh=jateon4Aiqe0KKjigwVbefTRycI6oGqG8zKuLU/8HSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQDZi++tsEudPXeaS4NUcemioWZwaKu2O4/kaTfPNg2J0uB0VXDniT66q/qndiajpQYlR3HtxpdQOwDqvlxHA8wOFGu4OnoS+a5p3kINOUTeZozO04SBwvWsCwjmp4awzksTvtJOVBpisdZbuejnkx9jAHea8SnORNyOdMbl/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkUhZ/ph; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkUhZ/ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DD3C16AAE;
	Thu, 12 Feb 2026 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896046;
	bh=jateon4Aiqe0KKjigwVbefTRycI6oGqG8zKuLU/8HSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkUhZ/phkSFLWbwvlQh+Erq2H7VuaxJhJvoHaDGC7Nc/ks55jZzA57kk5Ak/O9gZ9
	 yyU5o1xK40koNXCPf5etJRCzXLm+2Ut8V6zrDkSIwqs3ND46ywMwfYIFLCSt3sJM79
	 Vft5jupK9CCCNfcztRsVRnvJaRwV7bv1oVlPoho59qJ026c0vaywLpd73qIZv+mn22
	 ucuLt8YsSPkFcKu6HurPeCHPV/iIXkWLo+o0ec+SuFGbCHH08W1H11x9yyDI/GFwNI
	 P1GlvWaacLp/z7QXmiEfpK1GRnnuRddjxl6OpfZvDcWjFoXlJTeeC/I72v5dph6ykA
	 hk/CSpMwHurMw==
Date: Thu, 12 Feb 2026 12:34:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Ferrieux <alexandre.ferrieux@orange.com>, Bhushan Shah <bhushan.shah@machinesoul.in>, 
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: awinic,aw88395: Document
 firmware-name property
Message-ID: <20260212-passionate-wallaby-of-psychology-b7fa43@quoll>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
 <20260211-aw88261-fwname-v1-2-e24e833a019d@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-aw88261-fwname-v1-2-e24e833a019d@fairphone.com>

On Wed, Feb 11, 2026 at 11:27:33AM +0100, Luca Weiss wrote:
> Since the aw88261_acf.bin file appears to be device-specific, add a
> firmware-name property so that devicetree users can point to a
> device-specific path to not conflict with other devices that might also
> ship a aw88261_acf.bin.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

