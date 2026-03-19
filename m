Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2352DF6EA;
	Thu, 19 Mar 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931181; cv=none; b=Qif4AspTY3bLwLWKEYNTEH9RERyZX5cJraReMDFUWIxig3ImX1mxJRzCqOvygDjSAoteIbOSY+2RFkEIGE3KzxmLGBNTtC1momJzGoHnlth8TsM0cmBpu1hilUnsFEL1aAqUzb/oxQvCD67Sa8htOlQrnp7V//4TymNbfIumVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931181; c=relaxed/simple;
	bh=HNVaOtoRdCYXT6gd3FxRG1pIEFjqEZUE1ASwiWFTJA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njs4k/7tJlIeAhsr4E13PlltXFNLLUENO9y6xeRpiL8Dqz9KNBMBOKPj+pQ3zmaTiSZeB9mDL1odCcHI0Mc1luxv4xpLzJmcI7eCuYNDGiMtCJo6hRD6CnARv+2rn4zCpJCjukSY4oZdg0anZgVfnzx/n8YuppXGqLTUtUzATT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT+ZBbBa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT+ZBbBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CD2C19424;
	Thu, 19 Mar 2026 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931180;
	bh=HNVaOtoRdCYXT6gd3FxRG1pIEFjqEZUE1ASwiWFTJA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mT+ZBbBaTwAEVSZoGmSo0Bu5a7DOA6GSLCEQjG5KZOzijgInyoCc1ZXe3SLswaLxD
	 ZWwABlAeMjS+WsfEPHFy699QHaFHFkNrbNdxCYfnA9RPErURY2QdMf57eTE7AvZCzv
	 CE2pcK10GzQTfjBxk6zIG6F7kRXrR3guOJY9qARso5BwZAEicYMv2KGJ48uV8Na4fX
	 xq3+fmEkWwUclDV+oUhFsUJZaw4vTTdyzR1wbGCLS0JJcTyJhqMkhtuGCBJ5u8WN0g
	 vwdA1ytsWSek8B55qPtA62BeGmAUGGyZeqAr1MfxJoXv5eouN07uHKBYIn5P8L0rqL
	 usewqo6lEJRqA==
Date: Thu, 19 Mar 2026 14:39:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
Message-ID: <20260319-persecute-subzero-341eda9c575e@spud>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27GuC2fY6ZBWv570"
Content-Disposition: inline
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>


--27GuC2fY6ZBWv570
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 09:55:00AM +0100, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@sp=
ud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetoo=
th")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Luca.

> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index a3c2b26736f4..3964aae47fd4 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -1019,12 +1019,14 @@ &qup_uart1_cts {
>  	 * the Bluetooth module drives the pin in either
>  	 * direction or leaves the pin fully unpowered.
>  	 */
> +	/delete-property/ bias-disable;
>  	bias-bus-hold;
>  };
> =20
>  &qup_uart1_rts {
>  	/* We'll drive RTS, so no pull */
>  	drive-strength =3D <2>;
> +	/delete-property/ bias-pull-down;
>  	bias-disable;
>  };
> =20
> @@ -1035,12 +1037,14 @@ &qup_uart1_rx {
>  	 * in tri-state (module powered off or not driving the
>  	 * signal yet).
>  	 */
> +	/delete-property/ bias-disable;
>  	bias-pull-up;
>  };
> =20
>  &qup_uart1_tx {
>  	/* We'll drive TX, so no pull */
>  	drive-strength =3D <2>;
> +	/delete-property/ bias-pull-up;
>  	bias-disable;
>  };
> =20
>=20
> ---
> base-commit: de79886ae0ce739608514f6b1ae91c14c6a9e600
> change-id: 20260319-fp4-uart1-fix-9fe390294499
>=20
> Best regards,
> --=20
> Luca Weiss <luca.weiss@fairphone.com>
>=20

--27GuC2fY6ZBWv570
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwKqAAKCRB4tDGHoIJi
0hIYAP9n7Nzbkhhzi88pEdeoxPfi4Wh3Ii/PRmgWsIQgCD7EoAD/Xxm8phLSqXq9
nUvdFafiz3mFQTzozvH1NmnawQcXgw0=
=I7sb
-----END PGP SIGNATURE-----

--27GuC2fY6ZBWv570--
