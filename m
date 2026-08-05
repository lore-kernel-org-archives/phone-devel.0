Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CC45518E;
	Wed,  5 Aug 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970602; cv=none; b=uAJJxlcdMD7rzZaXBr9s++sH6/MUyhVbojgGHA/35C4p8u/JdfJU9TS2Ikv6+oxKhLORdug3JF/5xzWJPDq/bAtlfKKGxEisPfG7xOzmR+MlZ9y0EKv2C7pFKjmdvpMjk+/guV0HkQAQTnD09X2pnMnKbYPI1oaloGFfacJO3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970602; c=relaxed/simple;
	bh=07HKGFW/al0imxq0pYVJrQriMtzR6zWZG67Qi84KhPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGB0nLDLzCcUEZPijrV2gUp44kaLeu7O9v81nrZT8Rl43FafrCBVuu5AxMw41TYHdkjbwpBEc8wZVbWDv1mVnTTEL5WY8HJvJDnv5CpAYRir1aweliwnQ1xE21sRafoeT+1cDDFcrN+GdP4KJsAJnDKC4dmMrmHmztL6nRUrVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HQTXtAmS; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HQTXtAmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785970590; x=1786229790;
	bh=07HKGFW/al0imxq0pYVJrQriMtzR6zWZG67Qi84KhPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HQTXtAmSRN6rv5/CntDPr1aDld2KlXnc2amXwwx/HK0wtFYK2Zi34WMnnrED1/R6Z
	 vhjRRhmVJY+jfM6QnlPlB2JoAfdD9Vgoe9BKCiwn+t9TiYZTen9w0mWfMsCjRknAKm
	 0HN7Ka/ZbSCCdqSOAOxZ0Mbk9Rzt5M5jAIMc83aDlUPKSIHV516IrkYCLHpEj8JA/k
	 eV6ahnlD7tgo/nsTToERbXlxYzNSTi2ycB4gxHR/QwJv0g3PiRlHIETGiCngSvVKZC
	 UzayjQJe6KU6v0L7xPLzrxJHZ/whoRb3Z+eKCtdxiRm18fefSLmNrH1zH6S40vX30o
	 7+AE52aCANx+g==
Date: Wed, 05 Aug 2026 22:56:24 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <1b4193cd-3b31-4376-adde-84251655eea9@proton.me>
In-Reply-To: <20260803-upbeat-banana-ermine-4fdf45@quoll>
References: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me> <20260803-upbeat-banana-ermine-4fdf45@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 7d38fb9f8eb22293ccf2ed7196e661f7e81686b3
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/3/26 3:20 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 02, 2026 at 02:39:55AM -0400, Esteban Urrutia wrote:
>> SM8475 is compatible with SM8450 with respect to pmic-glink support.
>=20
> "Add the Qualcomm SM8475 PMIC GLINK, compatible with the SM8450 one."
>=20
> (or "Add a compatible for ..." and rest as above)
>=20
>> Add a compatible string for SM8475 using SM8450 as a fallback.
>=20
> And this is redundant.

I'll consider the feedback for future commits.

Regards,
Esteban

