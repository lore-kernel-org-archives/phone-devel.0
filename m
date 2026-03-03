Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7339098E;
	Tue,  3 Mar 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520092; cv=none; b=k0sC2FGbd1kv5sW1lnSbpnFrMOJLaN+IOvWtqb46EHcmT42ecHLCEabp1f4SVn/esvjJpvxVGt5hq2tWOKAudKdAFRq91ROIqCPx/0sdHSn2iq1VC5fdpUn1ELBbIckqvnBkTX1KsJTCwXSHvfMJVz+WDdGpRna3IThmZPS46qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520092; c=relaxed/simple;
	bh=5b01vw+dI31pEfzdNoEriDTH6BmcZYn60fZeCzwVL7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmGLijegaKLG8aP9JngA/cg7jZXHtOat2uOBuKqabCBXDBHxXl8jMcqri6U0Z5sNWKQc6nHVdlsISo6k52OTpiglXwJhjGDOLTvg1WLfi5/Pbv3OD4dSOmzSjHnSP6fLPsphAVVF+4UhQ7Yhn8hV7BfTMLO4/Kv13HPhpwmyxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0Y3bwN+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0Y3bwN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEEEC19425;
	Tue,  3 Mar 2026 06:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520092;
	bh=5b01vw+dI31pEfzdNoEriDTH6BmcZYn60fZeCzwVL7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0Y3bwN+sZmMhsd4N8pWUZxbF7mEl9yqlJdd0sP7dNLjfXbJn8bMLyphGGRSieZ4t
	 qteQlXPwJ8pntMWt8Hh719HQTMdn3RhGCkM2uCEczMP9CuRX1KWTzppfoWpXqCheff
	 l/i4KtamsXdW25ryJTLoC2zVipWpF1QCIpxpZXQJG0fN4VAPrpat07fCCPmtNt4TH1
	 QxbhNsC3964gGognYhUYED+0dlUAQ7uTX+XrU2USONrJNJ+3FarX/eaaBraA1Ulu4L
	 VwpsgDzCho5RVS37kmErb73EaJxmpeRpjlG4X4s++TnOFn4qW3L6VLe1cHRp/CHNk9
	 EaeiKRY0noBhA==
Date: Tue, 3 Mar 2026 07:41:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@mainlining.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC IDs for SM7450 and
 SM7450P
Message-ID: <20260303-imposing-modest-gecko-a9bcbc@quoll>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
 <20260302-fillmore-socids-v2-2-e6c5ad167ec4@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-fillmore-socids-v2-2-e6c5ad167ec4@mainlining.org>

On Mon, Mar 02, 2026 at 02:10:15PM +0100, Aelin Reidel wrote:
> SM7450 and SM7450P are two SoCs in the 'fillmore' family.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

