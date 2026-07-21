Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA043BA241;
	Tue, 21 Jul 2026 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622128; cv=none; b=tAEedEv/cytTYrQj5mcxClLPuU+k9IUgKozDmmNxeQ9xApMm/Wmg5O/Z3Oi8sCx2iN0PBO9o8gohI5CzBxCF7suf3/6tj34wexImS/3+0twhb298SZ5E8R0hXn5n+FArNKnJ3KCS+YMLv6TAWuicGCkS3jzZd5pSy3/9gOG9P0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622128; c=relaxed/simple;
	bh=sZ7e+m6Z4c1mRQdotRU74mkZnANm2xdEVgjgdFn06hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOPpEE3WmJfLCuSx2R82x+Ut2eh9zEuzjSxe3CQqJApHjFK4SCz6mxLoCRJBGZB1muZjQMeV3VTJOy4ahiGly4O2yJ5zfb6kii/HTaTI6rncK1OmCtNrOT141Hv4U3js1H86GYtOf35/BwSGJyIHVKXuy0JsmdzoHTXr0aaPAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJpddCYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJpddCYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ED11F00A3A;
	Tue, 21 Jul 2026 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784622127;
	bh=0RHaEW0w/bs/hq1yndHK4/l1ePJNconwoidEFJXJN3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oJpddCYq4AeC9n+mxP4PQSReyMhRNyiB9J3mvOKYtPMo6PVR/xFL1ExyRYz4q/8a1
	 asidlzMtsvM5Q+RgLWm3sqkSIsOvKVZQ0gWXL9xpHnIod2Mc99fJpYi6WlM34vx7Cy
	 /KKG50FqsLPffSLPSzkTLOb7huUW8eAwO31fzUJ6ES+Fb4/IPhmG5pLQV7dMJJeMRE
	 cCj+bKC9B1RIEjz/NdOTsxLqZftqldceOYwf18ga3sODSWmvQD30/YxzbugQarVsSW
	 5klWGmayf0TmLV/UWyb3G70FtNYzenFzeyNt1UdWO3MCMUQkPlOBQZyE/FAHPUSuVA
	 9EZ8aVtSQBcqg==
Date: Tue, 21 Jul 2026 10:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8475 QMP PHY
Message-ID: <20260721-smoky-honorable-nightingale-8526e2@quoll>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-1-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-1-2d8def39b190@proton.me>

On Wed, Jul 15, 2026 at 03:06:54AM -0400, Esteban Urrutia wrote:
> SM8450 init sequence for this PHY varies significantly and can't be used in
> SM8475.
> Add bindings for the PHY found in this SoC.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

