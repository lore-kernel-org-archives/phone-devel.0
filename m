Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B83C4554;
	Mon,  6 Jul 2026 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319873; cv=none; b=cFh59hPWKX6ha+kzhpOrz5zE5Hf8wyxP8KOZCMh+ihXwIPf8qWaGSU14xvdj+PWLF7ABJkxdtiiSh1AimyaDmelyCTM3DkGR3uq4cyvQt71VA6ROY0m0Y3SHejEWBujggyT8T2AoTrvMY+rAe2+iD8tJOVHMaObwM4OFpSZZKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319873; c=relaxed/simple;
	bh=HJI7FZAjpUx4o9rhUwSsfkvA8KX1vbDArDb+/k4LWqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hefqjRUG2Cf4Iqk62ay1XlWEsq6LTD1KLfxZujAuCO7ZytfI2abGnsfxtQOQx8DwMT5P/hMNRhKGp7CTex3ZZmjPwh87jObHRXQFgPfmEFEnJtk0UcljQzrc/rn0P7lEKXyWtiZg/0amTHq5cHNSUu8eUEJ86kYZTYlXWObq1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfbiMcsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfbiMcsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200751F000E9;
	Mon,  6 Jul 2026 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319854;
	bh=73YgRbUeCWVO3WMQvCccZKyou54xiXK3sqNoSYXL4G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bfbiMcsHf/npH8uhSLbuJA+j7TIE6G/TreAB82oT+COSIxHeh8z7JJEphvWIRd8Zf
	 Vs3utnjlzc19MDjt1JjtDclJth0Hqj4MjEoP1LT/XIctmsraSItmikuxgwuBh1+S25
	 Wp9iNzIjYhMkrgd3ezshbKEk+/Y4+23MtcfRqIIYhPfyFU4/dZkzIBnpl4WHCOFTZY
	 jy2+pEHqz/D3jNyZKBY5Vvxn5Kz5zrN5X+dBIEWZi1s0/HOXy3Wu7EtPvxOQ1yp5e6
	 qduNh8M5XfDjfqz2ygyQkS3CR2mYJgr+Xi8EbocnDUU2mvllPLK8qb/m9FH5QCsW6A
	 NW82GVIB+19WQ==
Date: Mon, 6 Jul 2026 08:37:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Message-ID: <20260706-abstract-garrulous-roadrunner-1fff20@quoll>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-1-d3b17005ecb3@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-sm7125-samsung-v2-1-d3b17005ecb3@gmail.com>

On Sun, Jul 05, 2026 at 01:30:27PM +0300, Erikas Bitovtas wrote:
> Add compatibles for Samsung Galaxy A52 and A72.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

