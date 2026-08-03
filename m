Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061821E7C23;
	Mon,  3 Aug 2026 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741646; cv=none; b=LgsI9+SqSx0CEePm5a74HVh6NoeURBOJythriDWlicVALz9Q3NivXr9f9BSFSeWb1j2jMdA8nh8bFgFd3xH87Pe5O/FnQdXvFdOnBCGzf7bHLyvWHXnPlD6O0wtY3tKA6d8xzESOD29xhjdbtqTS/Rv0tCbhSCpstPpjrJSm/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741646; c=relaxed/simple;
	bh=ve0FnataOy6jGi9uEH2zNrT7BdRoaSTDCZW5iL/3+B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqO4kNqeiqF76Hi8joviUP9uiQffMdhY25Vo2NQ3wfIm8VS2FNvjzKFd9XXhgpy4usl/rS1QdJLtyfvOTezZktT1A8qey0hNdKwK7RNfQ3ovcT1CqkiwwkcL54zFnWhZaYYgueSg1vjdJHxuIePwb/gk5S2Mw6Xx9FxK1tqVzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFEbYMLj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFEbYMLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0281F000E9;
	Mon,  3 Aug 2026 07:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785741644;
	bh=xTNdrUnQCfW7fN7mzKO7dzOqQ+FnXPR+Uy+Wyd5b0uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFEbYMLjD0eKmmNy1XVtLf7SqxlDnKrcBEKYfRUtAm3CAWLdSkCaeA0uPkCE6vJG8
	 EOQbMPYum6VX4/8XPpgHgmeo1xVUaCDmkY0YbmxaEyIOViCpxc0bczZXWJx4ir6fDI
	 4ihRs6W+U4F7X0l4VNYFs2jCvThYxfS/woqT4XN6pq3flZjHB48NnSkuvWL7B+c1B9
	 nDw/jRxKMRcVuUr4gXwbwuj1U3Y/pHodDxG9z1XOd/Bspfm5crTLbr6FtWq5UW97y+
	 Uds0RV+a3cJQNLn0S3vAxMTBKy+32vfdcTTuqAVG4mSFAhKxbG4IYAa2t63XpkmA7P
	 qDDiJaoX4P02Q==
Date: Mon, 3 Aug 2026 09:20:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Message-ID: <20260803-upbeat-banana-ermine-4fdf45@quoll>
References: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me>

On Sun, Aug 02, 2026 at 02:39:55AM -0400, Esteban Urrutia wrote:
> SM8475 is compatible with SM8450 with respect to pmic-glink support.

"Add the Qualcomm SM8475 PMIC GLINK, compatible with the SM8450 one."

(or "Add a compatible for ..." and rest as above)

> Add a compatible string for SM8475 using SM8450 as a fallback.

And this is redundant.

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

