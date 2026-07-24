Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDAE282F1D;
	Fri, 24 Jul 2026 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886930; cv=none; b=QTH/0Xe7+e3ZaxqcNNhJkVX/qnVs6m+vZkC6msiwJw5sc0rRZ2INk7i6c9zDtk455OgZat58y6N9CqsM+U1vB+fnzmMzyZOYkSf1vQQvrfj2Y78j/RhoGm5EMQxmA9hTVT79j9vKj8yu8qUhI4Nj8Nq1IsZB5uZSdRvqu+MJRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886930; c=relaxed/simple;
	bh=Iu2WUorR4DtlBFU5gwsq7yOiJ/1aTIGP7wjdsPgsuIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ynt0nygaVcaQR8HSe+IX7vxiqcIOMcc2MwOPDRhxXNBJAlh+rFk6c3BDcyE58uBv1q1WnizRqV2F8dc5MvOOaq2AplrR8bZtUCql/UCACy1NLKTsvOPJNw/Ydtj23YCWJT/XB5R0nlrm/ZaNRbICvgn5mTT6Lg5DvGCau2TBIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4oOCKHv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4oOCKHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C1B1F000E9;
	Fri, 24 Jul 2026 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886928;
	bh=m8hReLbH9YD3Ml1mAIAC4cDkz26URQlsCwhq+beqz/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i4oOCKHvuX8ui0ZBu0KBeo8hvjWWx0pQKLneqilH1hJrnU9q88k9UrmzLWCPAqs+0
	 0v+upjcApQ9aLCP/PZXAcUliKY0qgkamm6fICf0gGVfYvVwADcdrJ3amrLxGWymWOj
	 abHQ4MiXuui0owJOzDRo14/bI5onKGHnBTQHvy/M+47ZkbrEA2iC3Wrw9HmSzDQVnm
	 JUK2wwcRPpJZ3Wq75nmxPMJpwetGaNM4YbknB1j2p7g9ayxBQIH7jsAEkwfPMvbr0R
	 SXNYQ33ICcjJsMo/mtIm6uGfrx6l/egsN3Y90oYxNk+dFzUeAOBa6XdVqCFU7BYA0K
	 qXJ3xlUEbU6YA==
Date: Fri, 24 Jul 2026 11:55:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Add support for
 PM8350B
Message-ID: <20260724-resilient-hippo-of-renovation-2fc59e@quoll>
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
 <20260723-pm8350b-ldo-v1-1-42b5428a0d3f@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-pm8350b-ldo-v1-1-42b5428a0d3f@proton.me>

On Thu, Jul 23, 2026 at 10:53:52AM -0400, Esteban Urrutia wrote:
> The PM8350B has only one LDO, which gets its power from a dedicated input.
> Add support for it.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

