Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70C3932C9;
	Wed, 15 Apr 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240473; cv=none; b=Duj8JYthDCkf6rMXJDziV8k/1W868+qbwXWTOV1ddsmfeW7L7X9WTFuXR9POUNV+z5YUSged8iCxK11hmrPQZnN6cOzko8DqAmG+gsFm55o3Dumg3lnG59L1kUohlcG+YCRjEr0YBjjkmLxW2/E5Onj7dRF1S4FQTJeuB+kD2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240473; c=relaxed/simple;
	bh=RHlN0QMRXHtR8/1/0yo+MqI5T726vo8pxmIb3K0oTbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBiOsmryYixvu8PNHto+A+rKKZbjeKwY5V+x3+9wl/sQ+roc38y16iHnMgBAHd/RMexz8aX0kq007MWYPYJJ8HFvqP8CCgqRBFWhQac7xKwqvzNuwJlZKywT5s035/Wm3EumpeuhlSeGpC9PEFq70qTZLEjacOrO5FcagHIfWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa1RVf4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa1RVf4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFF4C19424;
	Wed, 15 Apr 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240473;
	bh=RHlN0QMRXHtR8/1/0yo+MqI5T726vo8pxmIb3K0oTbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa1RVf4Fd7oSCt3agDC9Po7WXxxU+Gl8PPDCLQddTtcwFrbScDNDY3kskBKuGH2nn
	 OJy0oKm/vE48VNvuBzw1EqjO9pBBZU/wfgVr+xSr+LSRNM6Ec+f0IosOrPZofT13qf
	 xfcTuPOg0c8qhK5mtC9wGaaj3Wr4qu83XRMYxaDIXVeDCdXV838gYRH11PFw/OHS1I
	 P9bepX4jYNZ+S4SeCibE8hJgZBHtbeuCUUr+qMagsvj0eR2YGAY1VKC9UAQ1RUneAB
	 jki98kbSZCFGh5g4E/GBopj1kAdInQVzJanK/EUOSjTQVncX2o2deBYyK/hFEUampZ
	 C9KegWKz9s8Cw==
Date: Wed, 15 Apr 2026 10:07:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: qcom: Document panasonic,eluga-u2
Message-ID: <20260415-strong-diligent-limpet-ee132c@quoll>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-2-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414184429.168612-2-linmengbo06890@proton.me>

On Tue, Apr 14, 2026 at 06:44:48PM +0000, Lin, Meng-Bo wrote:
> Document the new panasonic,eluga-u2 device tree bindings used in
> msm8916-panasonic-eluga-u2.
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

