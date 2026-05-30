Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C01E5201;
	Sat, 30 May 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141080; cv=none; b=RNSwbUZvCUdFgg9V6wfKyunASW3RLqqhTlM1PK1REsyar718lXN3DKC8KfgxbEkZF9G55o0Cv0lTcusfT0UcaRqJAKu7SgnVnTyhhgp4bXRY1S3/wBQ0yQWqR9TpWkyk6Ufd1e4Y/AjLHWfBZmsqI+/fdPTuiZD7JUtgaCAD430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141080; c=relaxed/simple;
	bh=2aiI1r3zg+/0XbovJ5OQbberURXSE8VAoUFWJIamNc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6o76LatWQhqChcZ5XtLTWH/a7iatOLijYSBBCvYEzLXkF4Ot9zKq3PNgjKcLCQaXagr3p2NqqrbSzTFroRZdzy3JB0Dzo199t/BDAgweNCWM0tswiREtL2hrQ+RyTT7vAMsfc7E5tPbSrDRRzloenosZY4YKnIH8rmjOuXNPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV40RShq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV40RShq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817571F00893;
	Sat, 30 May 2026 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141079;
	bh=sdc9x4Y45qdWvGNfTfHjNpjsc5UtJuGGAV9/b/Q37m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TV40RShqPgbGb8hwuMkMEi9WQQGcrGn7pCA0KAV4+E43kJI0GPZ0QBl3NRBC9OY0W
	 2zBNE6fgbYM4p4lGkyzIdPk9zj6gvOyLQMhzMCcNKQ0POAK/k0yxdF2TS+2V+dusaU
	 jtgM0p1gcG0YNZK8/wj4DnYzj5pWc9a5Cql91Bo2OoUvZouuGx2hG8HNztQGH/DehL
	 34UIfcKsCVVHNBkTOD+wg9YTHuQVCKiYDpYg8dAAvKdYTvEaRVP4eBi/8D8SMQQSax
	 LE5AuNPbtx7neECT6VaOtL4QvZjYRDDI7QomrS8isFm+B9JMgk0+TUZRPXoRdv24dq
	 hlM8/M1BhNctQ==
Date: Sat, 30 May 2026 13:37:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Message-ID: <20260530-cordial-civet-of-enrichment-89eacd@quoll>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
 <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527-yukon-eagle-v1-1-98119d64a71b@gmail.com>

On Wed, May 27, 2026 at 11:08:01PM +0300, Erikas Bitovtas wrote:
> Document the Sony Xperia M2, which is a smartphone based on the
> Qualcomm MSM8926 SoC.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

