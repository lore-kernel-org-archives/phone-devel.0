Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461922D46AF
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361257; cv=none; b=A+zlwSmrnA45W/56JpUV0kTR09CZN9HIbvr7dwMdmT3OSurDWQMgXAjGwlnBco6clf2TYdHre/fbWr7fDBVsngpYC0lXdU9o294UxNQ6fTUdP+gyRtRhesiWnG1FN52G4CZEStdcXM245Yv+2xhDT9mDx4PIAdJOGUZEuJhFRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361257; c=relaxed/simple;
	bh=gYo416o9IIzWH09EnRsTCKup+QS2AuPBTASyfAf3lBs=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=TUCrh+zE9NYuKc7L/ba83LbCCqTUoCsR4nOHf//AWaLUnh8mHahDPSRBsA4wh5haDr0i65+eg+thX3aSkoIzHKeibKnmCiNMTpT0J3glqZP7t4oZgu40rPhxFABwQIwbnOW8KE4lSrbBMB5oo4oQvypXNOMamDDAl/mFzc8D2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=c1CbRaqC; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="c1CbRaqC"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764361243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dx+rQtRDLcWj+YM9GvZ9aZmUEN7f7LnjwZA1J3GYuzE=;
	b=c1CbRaqCJnAKuRjgMufb3x1Hw3hnL4PUs4qrIRLgjLRBqmHgMts2MhKAMC24grCCw9Z/tt
	aoCr7C27Q7qJ4equHb4oB+Pc7l7chh4jcbLkbO6PDECBkhYfwe3EJCBvdXQNrSOvMUtIMI
	hsW7Gyhzfny5DyOGC1RW6y9Ktfu1YWijQaYNova7XSHyC/lbJndDzinKOFJL6jCccPthtf
	QbVgaIWDmds0anS00V/m2LNRXRZhHVaV0aOJW1hU8+UZ8rfe8eO6KiWlVPnm8LXDqIBx+L
	rzzVhn1hJkluCLX6sXlWYBBX3b/IB9g0xOkpp2ytgd/ecb3WEfVCJ/Oxx3EKHA==
Date: Fri, 28 Nov 2025 20:20:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

I did more testing on this, and the led only comes on if it's brightness =
is set to approx 150/255 or lower. In that case, should I set led-max-mic=
roamp to 60mA?



November 25, 2025 at 8:12 AM, "Paul Sajna" <sajattack@postmarketos.org ma=
ilto:sajattack@postmarketos.org?to=3D%22Paul%20Sajna%22%20%3Csajattack%40=
postmarketos.org%3E > wrote:


>=20
>=20Camera doesn't work yet (imx351), but we can use the flash as a flash=
light.
>=20
>=20Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
>=20diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 93b9a0246510..fa664b5120d2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -494,6 +494,19 @@ &pm8998_resin {
>  status =3D "okay";
>  };
>=20=20
>=20+&pmi8998_flash {
> + status =3D "okay";
> +
> + led-0 {
> + function =3D LED_FUNCTION_FLASH;
> + color =3D <LED_COLOR_ID_WHITE>;
> + led-sources =3D <1>;
> + led-max-microamp =3D <100000>;
> + flash-max-microamp =3D <500000>;
> + flash-max-timeout-us =3D <500000>;
> + };
> +};
> +
>  &pmi8998_lpg {
>  status =3D "okay";
>=20=20
>=20
> --=20
>=202.52.0
>
