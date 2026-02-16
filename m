Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0292DEA6E;
	Mon, 16 Feb 2026 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227308; cv=none; b=HNXo+uKMDaqW4V2Uy0uM/3AvDsU+GGJKJOxaT6zgoQmIGRfPeWYoOg3Uq8BuA0kMYczAuuDY9vecUkV+vtIgpUHywz/p2RtrT5AIGxIdGWEiq/9lLOtDVTE0nf+BUetdCQZSBNSoIbdIaMnXV5AZGoLjUdWPspNiP1aP4S32qrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227308; c=relaxed/simple;
	bh=gnzEt398uZtH2O++2gOHMqgPcImiyqyySn1jA0hWOdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu5RPjBtuAg7I+BZ/U9agILtDgKLh8Qs2Pdt1vSbe+rChpPxOsGj319h7Qwbfdv/sC2rmHPKRTh8c0NLFB/4Br5DUPUbmGJq8pdFBHCBFc3Ubq3umEiAC0mNs3CRp4NbylLlSks+KqBqfuzrhJj4Q2YYqkpSN355rk29F5+IIIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeRckRx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeRckRx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126B7C116C6;
	Mon, 16 Feb 2026 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771227307;
	bh=gnzEt398uZtH2O++2gOHMqgPcImiyqyySn1jA0hWOdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZeRckRx9nEbFKuQzXTz/SJM4g6+paINTcJRTo+2ixezVOupuPfw2IIIhdLKpDHegu
	 8l9m/+PV7aBLLznB8Zbrh46c3CPmYqerqJrKM6QHY6izsChOUcOzyt1Wq1Hz7ZoCjM
	 sLUNl0PcX8x9AZ84/4Rbdxo/0RKJq3kdnsavPIwmqDbarQOILaBd6vEdPwFrqgy+y9
	 jJJHwWtHQNDfF6e0mToBImepe0TtvFB2h2sMpcoJG8YqnluAPGv+LtPix8q0WApTC5
	 HFjAo1ioe2Ta5DbOMVCwjyeNjgVGOLeSm1DqWdgb4kKtUMQrNBmKM3qPmxjiPlT6Uz
	 qhlLeZI2ep8Yg==
Date: Mon, 16 Feb 2026 08:35:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Message-ID: <20260216-qualified-inquisitive-iguana-dd748f@quoll>
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-1-9ee6b89606a0@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260215-wiko-chuppito-v1-1-9ee6b89606a0@posteo.de>

On Sun, Feb 15, 2026 at 09:02:01PM +0100, Paul Adam wrote:
> Wiko is a french smartphone company: https://wikomobile.com
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index edbce100cae4..187089eef983 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1819,6 +1819,8 @@ patternProperties:
>      description: Wi2Wi, Inc.
>    "^widora,.*":
>      description: Beijing Widora Technology Co., Ltd.
> +  "^wiko,.*":

Domain is wikomobile, so use that one... unless wiko.com is the same -
looks kind of as, but then use correct address.

Best regards,
Krzysztof

