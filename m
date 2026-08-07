Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21FB468C20;
	Fri,  7 Aug 2026 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109005; cv=none; b=pIq1739rOKoGY3k3GY3TT8uGh0rpO84ILeaNsDoMeI15ypE7/QMTc2Qnmz02a2gM8ATl5CMEccooxBldjqybnymeIY0+TFFiqRQoIf5nIoLngV49Kfv69stW5QxmbX/0X5b3IJqT28chvHdIreVux26+tIRk9h+N4zRiY0lLUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109005; c=relaxed/simple;
	bh=8AzOmKPFHDxA8q+uSAZX9GWmAvClTspGZbGdrE9wVq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjW3hBLKfm9kkr9NmFo4+/cnDvhBzBeJU9LpiMNINHdCJhzCRzGBz3gx1tDo28Oe1xJzJHd7CFMEpO7+C3DcSyPi3bq0z5amGLjqWqt48/B6C3G21FEaCRCljzmkgc/MjVn4/qXkBy95gXx55yNLQavYm3zc+oZYiL8sj85bFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ILCHpRWr; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ILCHpRWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786108996; x=1786368196;
	bh=8AzOmKPFHDxA8q+uSAZX9GWmAvClTspGZbGdrE9wVq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ILCHpRWrT/i9iUVblxEpAgmMiXFzXSmX1cDffE/Z1bN7O5Rj7rGqtVrooO2CJCUJp
	 zXkv0XSfc1QvYFghNAIstWEwVQwSy2WyT3v7/xN7HuIeLDDjR+5ar5Z0Lq5XtCH0Iz
	 DBCfGdj3WlVIMD51rDjQlA29aDxVFqvqr0kEyvTSHSprjHZhZO1w29DceFxd43nerj
	 t9swyi7ELYXGVgp+JmFRYIHYfZOizIMcPAUgFJ45e4/QqbActwuB6Lfy7VRCT53vnK
	 3vPAcMYMHk6ZlLaiwDTT55r/v6E/WKU0PEgIA3zVaZrs952yabWOjzInMwTGQdbvV4
	 XLW1ifKeE7ruw==
Date: Fri, 07 Aug 2026 13:23:11 +0000
To: Vinod Koul <vkoul@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Initial PCIe0 PHY support for SM8475
Message-ID: <a9c94d7e-f21e-4b14-8e8b-e744850730b9@proton.me>
In-Reply-To: <anWNemb2WCYUwRJm@vaman>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me> <f0c1eba8-c6d9-4831-a460-980bead03c4d@proton.me> <anWNemb2WCYUwRJm@vaman>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 7557f2a5859058bade0c65992c59e17045d99b5e
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/7/26 3:47 AM, Vinod Koul wrote:
> On 07-08-26, 03:27, Esteban Urrutia wrote:
>> On 7/15/26 2:37 AM, Esteban Urrutia via B4 Relay wrote:
>>> This series adds support for the PCIe0 PHY found in the SM8475 SoC.
>>> The initialization sequence varies noticeably when compared to the one =
used
>>> in the SM8450 SoC, hence the need to add support for this PHY.
>> Any chance on this series being picked up?
>> Kind of related (since both series belong to the same subsystem): I
>> resent USB SS support for SM8475 some days ago and this has been picked
>> up already.
>=20
> Already picked up, should be pushed later today


Thanks for the reply!

Regards,
Esteban

