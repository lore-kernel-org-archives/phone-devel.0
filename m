Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B9372B5A;
	Fri,  6 Mar 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785319; cv=none; b=UBEkOTT9j2E1NxWu60jjKMKwmPYH8CdJZbpkiwHzNBRQ3MrU6PJnSK+b0zXOM53UfwaGk/PFcS5uBdP1qfftkHLrwT7FkZ+nNZPnLgBVIC0SPdnr7xJXOnNDlnA6dqI5k5SCQBvVz0ncigwpRejD1e6XNCTfptet2/cqlA9GRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785319; c=relaxed/simple;
	bh=bwcXHgMXXwwNeKgsDC7lmXwiCUcXfei4LSYDSM+Os7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwZt5XVafSJ5V5WUg0nF++xsn6o62FC9a2SlwXI8IU4tPKceLVMkOroWCo4c2roVfk7jaoCZ65OABeskEyfCkVQWnk3VT0UQkWGo1klFDVJg8scT9boF/KLxFF+ilN4zUOHa5LJlGoyJgQqmWveWZWSfKVDLmh69gs/tb2vxEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXNd8oLu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXNd8oLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66D7C4CEF7;
	Fri,  6 Mar 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785319;
	bh=bwcXHgMXXwwNeKgsDC7lmXwiCUcXfei4LSYDSM+Os7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXNd8oLutUCq6sGbTXU//Zt8ry25EtA1BpLXlWuGDo6lVcR9Xok82boslNfBPJbrC
	 /SJTkKI9fSBXmxq7Cm7ZiHFcfUt3EBNvs7UEgUyywXT/vMWGdhzPE5l6jTIj6hyjQJ
	 A/DbhXT+xTzDCNhWxKVj0zsmj38vygsnj2xWkkg+2/W2kPeljJwmdeBpzjnMUS6iyv
	 sNq7UOwFopVax/BDHF8ViZXcc5us6ltOWKcoBAY261DMRRWqF0uGhchGW26/ADzvJa
	 /dOcmKaGljNRteCfhM6GBTZp0KQArhzw5FL5QVUwwIHpjpKnW+bVgLgTPVn4gD7Lwt
	 vJ6i0N1W4kwzQ==
Date: Fri, 6 Mar 2026 09:21:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: qcom: Add Redmi Go
Message-ID: <20260306-daft-squid-of-whirlwind-afcea0@quoll>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-4-436f1f4b7399@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260305-riva-common-v1-4-436f1f4b7399@mainlining.org>

On Thu, Mar 05, 2026 at 06:28:36PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add Redmi Go (tiare).

Squash the two binding patches, please.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

