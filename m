Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8473E49D9;
	Fri, 31 Jul 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491957; cv=none; b=rsc9UO2vEXbeuHF9j7mSV/E72apTLr1XFCm+2djFuExiXLG7v+zsE1bqb9oMx3RgDiySyqUprMsW1UPa0SiDlYkNuPkY7q2dTHxZHOiF4Z6JIs6SMYzuSjrtmVKLG7CznCG4vT9nPRs856K2/5m7Rfgk2djht97fDpsCWzO4dAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491957; c=relaxed/simple;
	bh=5edyTaIA4fin1umP6uA3kB1KbdiPRP4h4MhGwuuATXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQwsWUDlhLwmzv+lYnbY9iOSw1jXxHiozlLe2RCmY9SHsLsD8WVH3xLlbEYL9t4r4KUJf/Ls+GuuVkhZrlomcYTq15qKLZDKriN9VXAINkSZItHmSA24UVvq11SC7be2U+p/EF4muG6XRqe59ytMQtgR9DuoFPdB14mgOrDeC8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoyLtRJY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoyLtRJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776161F000E9;
	Fri, 31 Jul 2026 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491935;
	bh=5edyTaIA4fin1umP6uA3kB1KbdiPRP4h4MhGwuuATXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UoyLtRJYAYFwh82RO5jpcHABMz/mnzZhfUmDKxldN3m1mMqaPbMEdYNV87LhpEqkL
	 nLaT4ZTgi2h0uwEAC2efe2n/RcI1U5c66ZD3Ur8PiO3r/BZcrqrUnA90gqX/bbQGZA
	 7YhMxVqSD3CFrFwcy5TmQusRvMm3U8Ij0f3VKAQ9BNfT6p6aBJdQPs/CTB56fgEWHN
	 nNsiFrc34SGqAmVDq9JrnrgQkQaPuz1G23Nk5fijIFtzLbWQkHWCTuUMmabBv3E9Xw
	 j//rUeIBRSBuJu8pbSy1uE80J+YRvVYJYWQ0UJ8bKhY1NcOjn2MwokodL1E8G8D3Dr
	 8uqChxbeFJdBw==
Date: Fri, 31 Jul 2026 11:58:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Message-ID: <20260731-savvy-piquant-chowchow-f516f2@quoll>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>

On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
> Due to a different process design, SM8475 (4 nm) SoC takes things from both
> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.

What things? This is just unspecific and not useful. And I doubt that it
is even "different process design", because how one would know that?

> Add a separate compatible string for this SoC to avoid possible confusions.

No, explain the hardware compatibility.

Add foo bar, which is not compatible with baz because it uses bam bam in
different setup (difference in registers, e.g. XYZ and ABC),

Best regards,
Krzysztof

