Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB036D4F1
	for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565459; cv=none; b=cjQx54a2XPPaw/1SYzYPbxmoAA+38d8U9XFbs+1NZCfqfMLB9Ydo/vZE7xJDNJ5LEqKXhvr0JkWxxWuOZDeZyHlIkteQTwF9mhL8AzgMSYh4XPThAC6vXt4oXXHBeTIfnIl4F0v0WeD4x3htddUNDoYxZSSjq01cjy2LWMJj95Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565459; c=relaxed/simple;
	bh=zAb+/UlTEKpjblLRtzLovZ71X6BemvJ/aPgIQNATy+E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJUeMr9qXPAv0cs09MvVZlGO68EessLu51iNz8NDRvtr89Wl/7kBw3TV4JoUFN7bs8ehoW7t6Hhi2JWXqM3kW63HgUqf2A18WjPubZCeESsJOqN82tz0tP3iI3d9WHpUhsVqox49sfe6i7QhdZFrOhc1uQgegakWns1I+8sCADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lUmGZq+s; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lUmGZq+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786565451; x=1786824651;
	bh=zAb+/UlTEKpjblLRtzLovZ71X6BemvJ/aPgIQNATy+E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lUmGZq+soiASuXFrIJu7o/hPdEVMGPnDX4MvLJhHHh0EQkf4q5p4aLPRETkrCJB9G
	 ULgVXqaBy+KX//cgIbqdbzKF4Esn7A/RZuhzsrUzx9hfDG+CAWS8qeEEYEUEbEwQ0P
	 1tNSgSWgp0FmIBpl7IlnjDlY/7guuuys3sjn3i/RgD2u3yagn+ExGIWajviCnrQA6u
	 Lb8AGY+vg7m4VAWHPE1QdtEd8etZssQwHICE936bW6XSgt2Yqxh52yAJ2XZ65H2bjk
	 4mbufYQXSxCX4Lh61vhINZueEfSZQvaaw1AYlsyQnodrIxWasRVQqDcF0ZTVlBcAdJ
	 yTZijBDZ9dKgA==
Date: Wed, 12 Aug 2026 20:10:48 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, David Heidelberg <david@ixit.cz>, Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek NT37703
Message-ID: <318b749e-26db-4d74-b910-a368a9e51013@proton.me>
In-Reply-To: <05d2ad33-a681-41e4-87f7-e3aaeb5428a8@linaro.org>
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me> <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me> <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz> <58d7ddd4-1488-4c34-be85-6345138aa238@proton.me> <7097b617-90be-492d-9637-4a2a101379e0@ixit.cz> <05d2ad33-a681-41e4-87f7-e3aaeb5428a8@linaro.org>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 8c128edce5c560b4767a5a3dae3ebf4c21f13b51
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/12/26 7:52 AM, Neil Armstrong wrote:
> On 8/12/26 10:46, David Heidelberg wrote:
>> bit I missed in the review the part:
>>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 comp=
atible =3D "motorola,bronco-tianma-v2-nt37703", "novatek,nt37703";
>>
>> Unless the driver is able to auto-detect the connected panel (unlikely),=
 novatek,nt37703 doesn't make sense. The DDIC without the panel is useless.
>>
>> For example, in sdm845-oneplus-fajita and enchilada, we have the generic=
 compatible because it was introduced before, so it's kept for compatibilit=
y reasons. There is no need to do that here.
>=20
> Yeah today the norm is to add the ddic as second compatible entry so the =
first compatible just describes the pane, so here it should be:
>=20
> compatible =3D "motorola,bronco-tianma-v2", "novatek,nt37703";
In that case first compatible string should be
"tianma,motorola-bronco-v2" since Tianma is the panel maker and this
"v2" panel is only used in motorola-bronco.

Regards,
Esteban

