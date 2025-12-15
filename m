Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8C1DED5C;
	Mon, 15 Dec 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798705; cv=none; b=M7MqkpH6izr5IqfkM5gIV8TvM7SEb3W/cFR7zIUNPs8qT0vG/Qv1jCiecq5g7Qyz6GUaYJCxPZYzNw+Ot2RV/zGIpFyWQM9P9HtT56mfpyZycMjzW+uzbX2ML6yQ8MqslZQw7TaL6jVtMIj4st8JtXRZ11/LNNMaAy1A7R9jZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798705; c=relaxed/simple;
	bh=zZmqmz09nOBmIi1tPbhi+eCZRo0nzYR2QjYerEQFEww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVr68cA2vQv39bCdQfYPseDxvZs6xCFtcyeEepneUhT9n9Ri7CLaHc+wEx5pZGxnqZXqcpmajZPZjJLmGibqtUcpsJ4CqE5tL6TKzSfry4xH7WZLo7Os4KwT5lhf0LxqkqE9/s5dV1JJIr78O//XX3eviQhA+OlVej89l7QmV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OdCBfSVE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OdCBfSVE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gYPdjCs2I4pKStwB8vwr/UnSwkBP0xQatRIbmAK/KFA=; b=OdCBfSVEdv2ReAg+WKWx43rNzw
	zcUqPS79qXRZQ7rP82AHOeQJ+ncOzDbBwLM35SE2VJAQ64T5tEd7NH4cInw4KoYGyAnTiDm4UdPfA
	UkAUmCuhbZqV3nTd/Ix2Rs0xjLGdy2Zb6I+matGxiVOM0EXd1vaBcx5R7tKwo9WfUBFHZ+p2BKiRG
	xgazN6dei/Fi1iQupd/lK4pP+xsJUNtRG2zq8eU63V8Lzb5GACnF3Wax9pwiyXIHpQle/fwAsqAnR
	/Nvczwt37mvB+Wm/pSFCcw7fvR6P0E69z/Vsk4gbx5Ja2TrI2YY8nVf3rqHBK1xAjzkcr2CxCF4Av
	BCy7klPQ==;
Received: from [192.76.154.237] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV6uA-0000CP-HC; Mon, 15 Dec 2025 12:38:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>,
 Pavel Machek <pavel@ucw.cz>
Subject:
 Re: [PATCH v5 3/4] arm64: dts: rockchip: Add magnetometer sensor to Pinephone
 Pro
Date: Mon, 15 Dec 2025 12:38:17 +0100
Message-ID: <7420522.MhkbZ0Pkbq@phil>
In-Reply-To:
 <20251124-ppp_light_accel_mag_vol-down-v5-3-f9a10a0a50eb@gmail.com>
References:
 <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
 <20251124-ppp_light_accel_mag_vol-down-v5-3-f9a10a0a50eb@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 25. November 2025, 04:47:02 Mitteleurop=C3=A4ische Normalzeit =
schrieb Rudraksha Gupta via B4 Relay:

>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 15 +++++++++++++=
++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index f8c74b43ae9f..03721d71766c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -553,6 +553,21 @@ mpu6500@68 {
>  	};
>  };
> =20
> +&i2c4 {
> +	af8133j: compass@1c {
> +		compatible =3D "voltafield,af8133j";
> +		reg =3D <0x1c>;
> +		reset-gpios =3D <&gpio1 RK_PA1 GPIO_ACTIVE_LOW>;

reset-gpios below dvdd-*

And for completeness sake, you probably want to also add a simple
pinctrl entry

> +		avdd-supply =3D <&vcc_3v0>;
> +		dvdd-supply =3D <&vcc_1v8>;
> +
> +		mount-matrix =3D
> +			"0", "1", "0",
> +			"-1", "0", "0",
> +			"0", "0", "1";
> +	};
> +};
> +

Thanks
Heiko


