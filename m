Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369889;
	b=pHslgh5dlaOkbsyMLW2HUANmjrov5ZdjHDxQPmprNxb67HEABrv79KEBodUp86rWUGHF
	 8VpcU94TPiCCLX4WACPzmlMZIt/RaaNEkKkISWYuDTWB+/PgstMPS1vksNek2WiAagS7J
	 nVR2ZCqdk7doQAun51YSHMfanbCX0Pv1/9qFvzw4fvcqFtLYqZ7HYHSWd6iwzbsl74Nk1
	 BQlJ5jFpHI5nMmEbR6edQzxHSKiujwQRGeMb9FBjCpL32jLlzznTjB5J3jftRiecpzc6k
	 wAQJGTEEuuiedKQWCWWxCvyaZyCJl8RQlGXrcfLZMfN8NTpV0busJKIEh0dgg4VrDRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369889;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cw/hy6DTeEuQTBXf2lGQB7azdTFjMO5AThilZTsYoYA=;
	b=EPC+FvBdLfUHBbtDaw4CvjLho3qeNLIm1ArbKS1zcn0qhkvAEeWxa5KegAnADiOltIwL
	 aOB7o3c9z80vFikCiiYRWIMi+/ciRklfu66+X2U7uaQzpbSyFEyNfwr5QJcep9ExB5n3K
	 am4MdmCZ51AMPnmBiZM0g+Vw4jy7FoeeSajaLjyQpiRWP75JvVwYkpdYB2B1b1LLfnQd/
	 pDx64BsvhPiK1He+qRdhW85BwDzKWGpBr6uI8UVhymXoNHr7v63VQXn9UE0tSRLWWFh5B
	 l6D1qrno0lILzP4mu1oP7elrTo85edgn8R8QpxoSV70G984PPspdiUQDR3AE9jVhFUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeAwhf10;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C5606A32A;
	Sun, 22 Nov 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeAwhf10
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6771F000C6;
	Sun, 22 Nov 2026 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369888;
	bh=cw/hy6DTeEuQTBXf2lGQB7azdTFjMO5AThilZTsYoYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BeAwhf107abtmyor8kb/oyMs0j4JeqQ2W07ZL2zuK2Y4WlANl0P6lHpDFZ/7uTvHx
	 M0b71ZfhUh7G4qGtsOoUdcW8e8cGILxIpgq7Y9T40N+xGqVK9sQG7kSGGY6X+0CZxI
	 MoMIZA2VK3z5bi+l2QZ+rL03kzt18IIIH9KGDiCQ8o6JRfdzqqlUXI1KkFp1QdZKT/
	 j9fdEvMkvnA8FqaovNAQ/KgnB7TcZIE8lDfv2hNR3MUKTp/1k/gVu3AaH/rhtX/igC
	 dYfDgTIYpWJFYP7upln+YM+3JnruLXeMp6UoExvVnTolJNeTQCWgVPk6BO03NG6HCM
	 zrZnwpqbcJMcg==
Date: Sun, 22 Nov 2026 18:51:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: arm: qcom: Document Molokai and
 the Motorola Signature
Message-ID: <20261122-educational-thankful-collie-f239b0@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-7-403d763685d9@yahoo.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-molokai-soc-v3-7-403d763685d9@yahoo.com>

On Fri, Nov 20, 2026 at 09:23:09PM +0530, Venkat Yadlapati wrote:
> Document the Qualcomm Molokai (SM8845) SoC and the Motorola Signature
> (vantage) phone based on it.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

