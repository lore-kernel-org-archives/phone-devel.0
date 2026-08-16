Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E053E0C5F
	for <phone-devel@vger.kernel.org>; Sun, 16 Aug 2026 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786914580; cv=none; b=RMdPTwtexW4Rfpg5t3Me2XU7b38CO/m7PMovA3j1+dv67LPEwgbQfbM1eDTkgKL33grKcFWw9eJkCVGCIiyklQs4bDc2AT7IGCH6r6Y+FFWzDdMEvpQ4uzr5YZOJc5oeVCqH2tHSIcyMnaaYVSY/3+7EjTe2MNPvUMchRYfLqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786914580; c=relaxed/simple;
	bh=Uj/dU++QgsXJZiCHN91cmenO1QUkSucty5TYoC27qhA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rkonw1OhBvaHUTuUQvxIKqbbv9BiiQNvaNaOq76/mXeMph8fkts3i+uT/eNMnMPNu1hF7UyplsDe7LueaU8BcJP/MI5cLYJrmi3UecDdW9++WJLR0r/AYs7O8vFprqKPM+gUX3ZfmlAPFpzRH5Z6YcNtDt79EF0mBdgW2EC1JXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RpTEfKed; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RpTEfKed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786914564; x=1787173764;
	bh=Uj/dU++QgsXJZiCHN91cmenO1QUkSucty5TYoC27qhA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RpTEfKedUI8QgMpvHxLemEHZ2aJQ2yFkiJt+j3twPmxFMUa3xYa2ITcR7IrDleB5q
	 juS0gtoyu9WqkVmoWpZtEW6dA7YZ1FJVEPWZxy5oztugNjJHhteF1bMbC+PND8EP5F
	 8gzNjoqDDoRi4/y0zxot6exOoqjRrEhxHNMtbX8pwLkncnkys5dCWtjGmhUKNvY9rN
	 Pb7VfoU5ctdozr+DR/cY+YV0FrbPaomLU73oCH1jNxi6gWVdj3Epv5BVzbrrKv+b8g
	 ZTcc+Ey+Vvqslw4KGptkQZdQSrOvsaFBjkbejcvHLNqKG1+9IMoOWXtEFi3RmOozDd
	 C4ZivekBkMA2g==
Date: Sun, 16 Aug 2026 21:09:19 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <63ddcd44-23fd-45e5-be71-e4a13a4deff3@proton.me>
In-Reply-To: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me>
References: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: e41530e26a7b9c512048acb291e820bd92ae546d
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/2/26 2:39 AM, Esteban Urrutia via B4 Relay wrote:
> SM8475 is compatible with SM8450 with respect to pmic-glink support.
> Add a compatible string for SM8475 using SM8450 as a fallback.
Any chance on this commit being picked?

Regards,
Esteban

