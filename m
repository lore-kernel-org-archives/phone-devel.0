Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09F22579E
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 03:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073283; cv=none; b=lED82t/poI7GPyDwHx+Xd8Ncm5POR0R3Ue0Y4g8Lh9/R6QH2PYIBhe8/9VxZ/cGvmvXsBjlSUXUSv0zvnu9K6fK2sEqssHkzMbfEmpnOYGAWabkKb0avD13GSjQY8pnTLh9BoZaVRGjSk6s7B733wn00SWbOEiqg/EVkAXtI9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073283; c=relaxed/simple;
	bh=TPJtm4SJOctddJ8jFpftgRdBDxhtifxnOZSBD+9CcyI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GOPpGkz6SedFr7QvdIQLvPAICiUWbTYdAdtXnBE8nPZrsqKN1OKdCZvuvOpgJ1cvjxp1ynj44tlVKIKWHzjXmce7ohajR3RJm8q/5n8p67MSb25fq4KX16Dh+bypHcNKJgJ8A4ML8ssEt0w9K/Eymz3AFXCNuWzT6JXt4WT5mTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LeJ6BGzT; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LeJ6BGzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786073268; x=1786332468;
	bh=TPJtm4SJOctddJ8jFpftgRdBDxhtifxnOZSBD+9CcyI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LeJ6BGzTkCayTRhy9IWoe43gl4oezsgpVwiH/rXvd7queZ26Agx3BLkad/EH/HNiq
	 crnhtjcS+Qly+VA01EyGJuqlF6Oq3EXnZnU5yQSyTUbZFRKEIHHHvMVzSxQovNHU7A
	 Ym/IovqrTmaKqAMX/kpJAbC1mDVRxOqVZq9zzB8x0Dh4Ffqgs7oxkXsw0hFrknGSnh
	 aJs4YZQU2JGYua6IIq86B/cahTT6MTcHDYuEH3wRE93+zb6vI9c0EdFdeb6q+kkB1d
	 OmE97kdfQN8659SKSxgxrMp0JuVqxG56DYCyCmLqaMH7+nkvHYUSGacWm1E4IoYl8Q
	 am39RxytMfkwA==
Date: Fri, 07 Aug 2026 03:27:42 +0000
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Initial PCIe0 PHY support for SM8475
Message-ID: <f0c1eba8-c6d9-4831-a460-980bead03c4d@proton.me>
In-Reply-To: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 67781fc1a0af1802f91f0ba9b76081dad5b9c44b
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/15/26 2:37 AM, Esteban Urrutia via B4 Relay wrote:
> This series adds support for the PCIe0 PHY found in the SM8475 SoC.
> The initialization sequence varies noticeably when compared to the one us=
ed
> in the SM8450 SoC, hence the need to add support for this PHY.
Any chance on this series being picked up?
Kind of related (since both series belong to the same subsystem): I
resent USB SS support for SM8475 some days ago and this has been picked
up already.

Regards,
Esteban

