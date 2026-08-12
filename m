Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C66283142
	for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512121; cv=none; b=fLtxtlP7FK2Ldbt+GoLkQFiyszketh5BjTzU8DzG8DW2R3QR+surpYaSA81O1eR94Q5MuNP28+RyuZY8q68U59M9jm3sHSdfEjWTMCNYpWRTLiPz/iygcYR3i4np6DSSz+u3Fz9qmHRlntfkc75SrZxf6JNT3CQHK8BDmP6FsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512121; c=relaxed/simple;
	bh=UOeGeGM67v7dCyjWmZniuu7P+Zg0l4ZErAicryAbKoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZWPbUPQQvWknE7jl6Ar1hc78FbI3zfZQATFQ0L2Q7jfHLBDA67DsllcS+DUwoRrQ5R08sc5CXpj07NHrC8Pje5mC7/aNK3QrK6tLuPLdsExoyUNppyGIgrEQc4Oux3rSEzNmITHB2lkUTwioZXtUNFXCZNVRxXdi8Bp904Gt+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Pf+bs0+l; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Pf+bs0+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786512113; x=1786771313;
	bh=UOeGeGM67v7dCyjWmZniuu7P+Zg0l4ZErAicryAbKoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Pf+bs0+lj87pwQpSb9bXWPltWbJSy3dTlTym998KMf7TmViXZMItXM6+3p7ZnYZ5h
	 L2MnfM10qWhnl0nyfXVqLtUJTThFgLmgxTGQCEMK0aOqQKPh73IeYxEu/am5r5hQNf
	 QyMVwX/sNfCkjum9DXC6oYiXOjJXy2gla22SmD+uq+HGeCtzUz40SofkbPDNyHXrWx
	 bmAJ4ISHojJDSGm825JWpVtgM8B9hF4AzPUQu9zP19l1z3PSEMrQlK6Fv0fMB/3v/2
	 DhLiOkmAJ1FhbzhPQKCvkxVD+ly15qPnmrvTl4N5vpR6/j1SqotGm34s+i0hLP80di
	 /JcKQnbsd/7KA==
Date: Wed, 12 Aug 2026 05:21:48 +0000
To: David Heidelberg <david@ixit.cz>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek NT37703
Message-ID: <58d7ddd4-1488-4c34-be85-6345138aa238@proton.me>
In-Reply-To: <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz>
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me> <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me> <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: c193ee5b99be77ebd00790053c98ff63c3185ba4
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/11/26 9:05 AM, David Heidelberg wrote:
> Hi Esteban,
>=20
> Usually the used pattern is vendor,ddic+panel-model
>=20
> novatek,nt37703-motorola-bronco
>=20
> ...but motorola bronco isn't the model of the panel.
>=20
> My recommendation - look at some video of screen replacement, stop at mom=
ent
> when FLEX cable from panel is visible and that's where the panel model us=
ually is.


I somewhat doubt the panel model would be located in the FPC cable.
I did search anyway but didn't find anything of interest. And I'm not
willing to risk damaging the display flex or the battery of my
development device just for a possibility either.
For the compatible pattern I used the implemented pattern for the
NT36523 TDDI, which is also used for other ICs such as the RM69380.

So, I believe it should be okay to leave the compatible as is.

> David Heidelberg


Regards,
Esteban

