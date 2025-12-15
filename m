Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86322330313;
	Mon, 15 Dec 2025 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798603; cv=none; b=JOUmmX8lORVUiQM2IMCB2OS2BzPS6BViYmz6WOJMVv1HDykOZafVB5Ccf/B7Qe5+pKn7d9Vi3whPReG9SYXL3CwrOruDIEjaBaIweDdIURIxlYf6Si6JgtEeI7q9NoBK45WQKy8lzBwK4tUcgvozuSadbPMIEe7A6rzdrZP6mFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798603; c=relaxed/simple;
	bh=2wvTlYZzFBcgQQgVgCj/ZERGMyAXIb07ce4j26xpgJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqZ4YccvHpbZkU6iv+nIsHQdXyVC5trm+lF+s6xVtldqbEkfqLGaEuYol/oS/DMkTj7j0zXGuAaOnwU3lsVcfa4BwuyXIM6LOTaE9RAh4xSErLlm2TvoPC8BfCLPg6JSUFCe3PumuRy4JyDc7P3941/PvfQzAPqQFynKyNt/Aas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1AlnazAp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1AlnazAp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QuF8eKYdyq0Lx8q7EFdB8lJKxyIkO2eBdUsXglP9txM=; b=1AlnazApiDEhlijBTC0mwxyBQu
	Yk9J4u2sl6IlknfNmDU06dEBcLn7GF4vglaa7tkWsjvCnHRYV/dgnrtoUQh1ekSay9NBjHHO1PEee
	AsWcz/JMZOQ6+LRbU027X3kDK9Nawin2HhVzyKDGC+icz4TkDs5fea/XJk0huyDlzD5QMeGuNW7rf
	MWfz30VnoGipVOHUX4yBDUDBEjdMfdN6vc/VV1KFcDXvgZfqBOnv1kdGKOxF/AiVexzV0bcC+L7wq
	cOtPdDqJhpcZGDcJAA6jrNFOu3YqTcBaXeGseK2sc6CBx77ENl9lVuCLM3eCs27XC/ApGURT6tfwo
	KkziR4yQ==;
Received: from [192.76.154.229] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV6sN-0000B7-NP; Mon, 15 Dec 2025 12:36:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>
Subject:
 Re: [PATCH v5 1/4] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
Date: Mon, 15 Dec 2025 12:36:26 +0100
Message-ID: <10855349.CDJkKcVGEf@phil>
In-Reply-To:
 <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
References:
 <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
 <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Dienstag, 25. November 2025, 04:47:00 Mitteleurop=C3=A4ische Normalzeit =
schrieb Rudraksha Gupta via B4 Relay:

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 6f97e57f36f5..2d2858ee149e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -520,6 +520,16 @@ touchscreen@14 {
>  		touchscreen-size-x =3D <720>;
>  		touchscreen-size-y =3D <1440>;
>  	};
> +
> +	light-sensor@48 {
> +		compatible =3D "sensortek,stk3311";
> +		proximity-near-level =3D <300>;

proximity-next-... belongs below pinctrl-*


> +		reg =3D <0x48>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&light_int_l>;
> +	};
>  };
> =20
>  &i2c4 {
> @@ -689,6 +699,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
>  		};
>  	};
> =20
> +	stk3311 {

please sort nodes alphabetically
(stk3311 after vcc1v8-codec-en is incorrect)


> +		light_int_l: light-int-l {
> +			rockchip,pins =3D <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
> +		};
> +	};
> +
>  	wireless-bluetooth {
>  		bt_wake_pin: bt-wake-pin {
>  			rockchip,pins =3D <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
>=20


Heiko



