Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D081257855;
	Sun,  7 Jun 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828525; cv=none; b=X5nbXBW9cMG7iCP8y0r72uH8yXa0sR9KwcGe6+krqbnyU7zkr0OGXGIExIFzEsoVSm5TfzlLAKFweP2egRhZ56aL4W54WKE7Zs594lsHMzP+qLTcZdHFNecCfJjD9Bep9tTZ0k+eIZqWghDxwEIKIew7NkI29kmf+7QI1Qwp/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828525; c=relaxed/simple;
	bh=sB9DQeRkuWeZiSHTms9NV6hjc3XvirX8YIcp7h1Z0jI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=Oich1VenkdNhZsO8wYuy9tBf2m5PRENYhMhXmgtmupSmqeIY+3zzTBuHE+AqEhGgxdeW6X+rv2pShAljRT1g5195ksXdiqxP5sc+47ZAllYucSkPckv+Hwsn35uZrxOUkg0xrNiLamlWjENB27jxDrEIXAlqrDKl3qjxEzYlP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=Ei3346eb; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="Ei3346eb"
DKIM-Signature: a=rsa-sha256; bh=mO4758l4xD4doudJsBypWffgPZyM4fYzNrX9tTyuI3s=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1780827561; v=1; x=1781259561;
 b=Ei3346ebznbzoY+9Qon6+dNgqo1xRE97BD4hbG8ZKJcmVwiQqeq3YlLx+4PXyFu0RH/mZnFr
 uIgZ86jwee0wLUX2j9PU3suUzGr27NJlacuPbsa6Bqp0ECpiVEg/HnUOZ2/G0NtaCnfvJ3v+htX
 WihFy6Xf1r69CPAV5X2sEAGiAMRf4D7ZVm5NRzZrPZKXtKvcjIoVdMlAJwPz6hKr0SjMLTdEkO0
 ME9AKNuyvNk4sef9Q10Mz54/FzHbMLAWdtP/JcYZTLbyN65S8XdeXye7AAayaQFJTVNhej+NHfc
 8TVcfYurWrTqiaW/NRLX/E8WvyODd9HUmZSRHY+oolNqg==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 e04f78f5; Sun, 07 Jun 2026 12:19:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Jun 2026 12:19:21 +0200
Message-Id: <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
Cc: <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, "Lee Jones"
 <lee@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>

Duje Mihanovi=C4=87, 2026-05-26T21:14:48+02:00:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>
> Initialize the PMIC's battery page. The battery page registers are
> shared between Vbus regulator, charger, fuelgauge and camera flash
> blocks, hence the commonization of the page.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  drivers/mfd/88pm886.c       | 21 ++++++++++++++++++++-
>  include/linux/mfd/88pm886.h |  5 +++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
> index e411d8dee554..73102e638eba 100644
> --- a/drivers/mfd/88pm886.c
> +++ b/drivers/mfd/88pm886.c
> @@ -16,6 +16,12 @@ static const struct regmap_config pm886_regmap_config =
=3D {
>  	.max_register =3D PM886_REG_RTC_SPARE6,
>  };
> =20
> +static const struct regmap_config pm886_regmap_battery_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D PM886_REG_CLS_CONFIG1,
> +};
> +
>  static const struct regmap_irq pm886_regmap_irqs[] =3D {
>  	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
>  };
> @@ -88,7 +94,8 @@ static int pm886_probe(struct i2c_client *client)
>  	struct regmap_irq_chip_data *irq_data;
>  	struct device *dev =3D &client->dev;
>  	struct pm886_chip *chip;
> -	struct regmap *regmap;
> +	struct regmap *regmap, *regmap_battery;
> +	struct i2c_client *battery_page;

Not sure if this should be reordered to preserve the "reverse Christmas
tree", but maybe it's fine if checkpatch didn't complain.

>  	unsigned int chip_id;
>  	int err;
> =20
> @@ -105,6 +112,18 @@ static int pm886_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to initialize regma=
p\n");
>  	chip->regmap =3D regmap;
> =20
> +	battery_page =3D devm_i2c_new_dummy_device(dev, client->adapter,
> +						 client->addr + PM886_PAGE_OFFSET_BATTERY);
> +	if (IS_ERR(battery_page))
> +		return dev_err_probe(dev, PTR_ERR(battery_page),
> +				     "Failed to initialize battery page\n");
> +
> +	regmap_battery =3D devm_regmap_init_i2c(battery_page, &pm886_regmap_bat=
tery_config);
> +	if (IS_ERR(regmap_battery))
> +		return dev_err_probe(dev, PTR_ERR(regmap_battery),
> +				     "Failed to initialize battery regmap\n");
> +	chip->regmap_battery =3D regmap_battery;
> +

Nit: maybe this could go below the chip ID check so that it's not
executed if the check subsequently fails?

Also, I think the error messages are missing either a definite article
or an underscore. Same in the commit message title.

>  	err =3D regmap_read(regmap, PM886_REG_ID, &chip_id);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to read chip ID\n");
> diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
> index 38892ba7b8a4..2c24dd3032ab 100644
> --- a/include/linux/mfd/88pm886.h
> +++ b/include/linux/mfd/88pm886.h
> @@ -11,6 +11,7 @@
> =20
>  #define PM886_PAGE_OFFSET_REGULATORS	1
>  #define PM886_PAGE_OFFSET_GPADC		2
> +#define PM886_PAGE_OFFSET_BATTERY	3
> =20
>  #define PM886_REG_ID			0x00
> =20
> @@ -128,9 +129,13 @@
>  #define PM886_GPADC_BIAS_LEVELS		16
>  #define PM886_GPADC_INDEX_TO_BIAS_uA(i)	(1 + (i) * 5)
> =20
> +/* Battery block register definitions */
> +#define PM886_REG_CLS_CONFIG1		0x71
> +
>  struct pm886_chip {
>  	struct i2c_client *client;
>  	unsigned int chip_id;
>  	struct regmap *regmap;
> +	struct regmap *regmap_battery;
>  };
>  #endif /* __MFD_88PM886_H */
>
> --=20
> 2.54.0

Reviewed-by: Karel Balej <balejk@matfyz.cz>
