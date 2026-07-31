Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3551352015;
	Fri, 31 Jul 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516999; cv=none; b=eypaPRCmgXfwFOBwXlsYiDd5c8uDw52Dw4irgPuHKqW5szC35xTGak17BdE5OxfCKO73ncdZ9X/CJgbQMQ2deMpYc5w0rRn1vogQBcJHaw/lw4Tgbdgd3IbqjvNr7s42GmymQz1UXWZ6KZcabhUa+74r5ebEv2Ig/1FGsvsAfSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516999; c=relaxed/simple;
	bh=eJOcLAJ7eVoZBqoBrQdGKqb8aUUP5oC8a+WJ1mRuseM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MSEhVkp8Er2U+cCJ7jOxb2TAN4jKKx7CBkfV31U92cbGO5BzJ+YUQ1skLEUbPdYZAz53Tx29ym6hcqFFfbGcrvsk+bhFJfTtGfus+7Qa+9dAijtc+2TTDAq8jQRJ2irKBk/o10eLeCFA7frIETgenitn9Te3Tc6CCGuhhKrXLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dgmpd3vP; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dgmpd3vP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785516989; x=1785776189;
	bh=eJOcLAJ7eVoZBqoBrQdGKqb8aUUP5oC8a+WJ1mRuseM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dgmpd3vPnTxr9sAjZbUjbN7P7wGHbKTshgzl1xSmIZjKUs6UtuLct8sTt13F0Z5yq
	 02XpS0sou75yPNev4Fl7iw5B9SLsxeZMmRTOK38kS/Lap+/lagUGaroJf9C3vOI7eV
	 vgKhh1928bayMwRjy/b7f7QeFgKCSgPQNlfbbZolDAQVUqAKK2s4umEGfFapaiytLO
	 v9i1/skjwP26Aqg0o2hWaql5YAG9Cwh+3naHR55GIcacnN2CtAZH3Ew53lE/L/mONr
	 c2tweJaN0qk8ysnM1u7+g8/nxwDl/DZ0lDdm4i2WiAQJ/xPXzoT/6ms3aW1L76kY2k
	 j9y72IQcqa5Jg==
Date: Fri, 31 Jul 2026 16:56:23 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <29e34ae2-9bfe-499c-80a4-25490ea2e410@proton.me>
In-Reply-To: <b300cfc5-b6be-4227-905d-d69200fcf857@oss.qualcomm.com>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me> <20260731-savvy-piquant-chowchow-f516f2@quoll> <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me> <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com> <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me> <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com> <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me> <b300cfc5-b6be-4227-905d-d69200fcf857@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: a80b82c8675d5b428e9ad2a1107736a217284402
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 12:42 PM, Konrad Dybcio wrote:
> pmic-glink provides three main services:
>=20
> - UCSI (Type-C)
> - altmode pin assignment notifications (also Type-C)
> - battmgr (battery/power supply)
>=20
> In that scope, I believe it's no different to 8450

Alright then. I guess I'll just go for the first resolution in v3.
Thanks for your input, Konrad.

Regards,
Esteban

