Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9A1C878E
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735897960; cv=none; b=UnEae9YGtYX0Wtc43mUwA1eSA2Hx4gUaovU2nKWJQekOMmUH0MFkEdmtlbavJSeQfqV8jKYxEpNCDrD3kpTbDQtfmq1NWS0KewzPah5YBnpy01EqW4G7phkKNV51ljJrp2Iz0E1lynoWBoTBKwiTC3dQEQlri/wbujnNVWLDGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735897960; c=relaxed/simple;
	bh=GAEFu1xWo+vq9A7a78naTFeqfSW00xJQU0a2ijC81L8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CFE1uQSpDJW1CsEiX+xHL4KTH/JPOLzuL4nIREO1m/aje+wUodcssfas/makPueeY+tPUzazmV7MGorPcPZ6/bUAWEdntjzL1ExtAAWN+GbjKbXWOG3ialGojaSlOiI7QFZvel8zwaU7QSuc547KKK9c00AxqwTEXgguiT029GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nuu6TpXQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nuu6TpXQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6a618981eso1991698166b.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735897956; x=1736502756; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bkg7Flo+OpiEi1p9H/02JXt2rT+BbZkhOhMB9gCKV0=;
        b=nuu6TpXQZUWMaRptwZ9mlxpNZSRaNE04Vt163B8QXXPRGu33ihdRhguFfFCTWRz+vh
         dhNB3kOMmLJCa2LYpaJeqH8+3Xy/mquu9gzaHdCg6AT9TnzL4+BB4pJf8lOUoU0+N2XS
         8/SvIBeo07eB1UySICDSXHwDqUeHtpSfa00RKBYQSre8DPkZDT0ZoD8+pX0jbKjB+Hyh
         Abd7zY8rAiBT8YzHp5br6yNVAy/Sf+JTgVijdSl5Wtemjzm97mEeyJUMAoTHIpEZPwN9
         eX+xJvz6nHUcSl0nBanC6JmxSbHZyNdpNoqfa8aozOXdzBLe7fix+Jv8ZzvlM3V9Titb
         h56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735897956; x=1736502756;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Bkg7Flo+OpiEi1p9H/02JXt2rT+BbZkhOhMB9gCKV0=;
        b=u5175ANta9bT5vu3um5X45DXlF1k5v6c6A5tl6U3DzL2RCmPDCTaY2WMFb8IBI/a0/
         UJjS+HElrgFW6s0IHw6FnzZNdBD+k8Gi0Hofnw1HSbNUbY3y9W3Q9uG/ecTibHNH+cfm
         u9jxa8etqVcvzkT/jucoMJP6G5ctxe/LOG9CRQZkTK8jZ+PY1+QjXHEpXV26aH7NMfNe
         c2MiFREv9+Uco6oVC9Uadd588QhRoYClNtQFSQk277AA0b1Jx8vGVFCAa3ZmCzbUvzm9
         unj2Ljhf/ZMyGkDg/o4s5HlBB8aScjYcZXqjdmzR3aPe3/6vF2cLN0P+4IcAJHVxazF6
         XTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQB6kTNOlor0gJ+SZ87kZArWDN4QJJ87SHREw9TGEJfpgezbE1oCZmQahIcVTr3lGX6WoU0UdZTsEOJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkBILudDMs0rDi3gpNcxDSrhHOW5VTkbQk7a0gU3c/XBCVA9J
	pxetkCUfVXXUTCvLsZDtCWsZBeM6GwexuBKQS1e5SlSzdab8yUjOKzSH5P2qOGw=
X-Gm-Gg: ASbGncuYt8DsiQZ6+mbxV3ZOk5u9PSzulmfTZc4yw1WYRGoZYcxmV7vK6Kn+QEVl50O
	0e1dO3LyXi01me5mvEtDVi486zKgguExc0BnWfuzv8KRZAu4zNhAyXpW3f6hl0v7MNjRDKX2vNB
	gFxfvfpGkw8YhMiI4liYtVQrbUyisecDGj8mWrawgDv3ci6mdekdQPP77WVDohW2KyXbPlB09m9
	Ko3prfvHJwHona1PnoYa7xOyPWbNV2V29PlYDlUwMYBslYC9M5djrqXTOL4ZO98GpK7UXH4Sizr
	TnIGdleFgsQ3i5E=
X-Google-Smtp-Source: AGHT+IG8YuxqFunIcm8OWjQjnqMCuQk4ESRUGe0Bz62boxuF4DFyE+YgKQ/UVpnkrUFDSFaE7ssBFw==
X-Received: by 2002:a17:907:724b:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-aac2702ae51mr4867844966b.2.1735897955707;
        Fri, 03 Jan 2025 01:52:35 -0800 (PST)
Received: from localhost (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf697b1c27sm470866666b.122.2025.01.03.01.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jan 2025 10:52:34 +0100
Message-Id: <D6SCGVFPV04C.1K6MEAYA72ETY@fairphone.com>
Subject: Re: [PATCH 2/2] Input: goodix-berlin - fix vddio regulator
 references
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Bastien Nocera" <hadess@hadess.net>, "Hans
 de Goede" <hdegoede@redhat.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Jeff LaBundy" <jeff@labundy.com>, "Charles
 Wang" <charles.goodix@gmail.com>, "Jens Reidel" <adrian@travitia.xyz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
 <0233a087-67c4-482e-8ef1-9c8dc610f9fb@linaro.org>
In-Reply-To: <0233a087-67c4-482e-8ef1-9c8dc610f9fb@linaro.org>

On Fri Jan 3, 2025 at 10:27 AM CET, Neil Armstrong wrote:
> Hi,
>
> On 03/01/2025 10:21, Luca Weiss wrote:
> > As per dt-bindings the property is called vddio-supply, so use the
> > correct name in the driver instead of iovdd. The datasheet also calls
> > the supply 'VDDIO'.
>
> This is duplicate of https://lore.kernel.org/all/20240805155806.16203-1-d=
anila@jiaxyga.com/

Oh, any idea why it wasn't picked up since August?

>
> But it's still valid:
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks!

Regards
Luca

>
> >=20
> > Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchsc=
reen IC")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >   drivers/input/touchscreen/goodix_berlin_core.c | 24 ++++++++++++-----=
-------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/i=
nput/touchscreen/goodix_berlin_core.c
> > index e273fb8edc6b92bcbad0fd35223a841d7da7d671..7f8cfdd106fae03a6b19758=
2bca4eb61f80182c6 100644
> > --- a/drivers/input/touchscreen/goodix_berlin_core.c
> > +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> > @@ -165,7 +165,7 @@ struct goodix_berlin_core {
> >   	struct device *dev;
> >   	struct regmap *regmap;
> >   	struct regulator *avdd;
> > -	struct regulator *iovdd;
> > +	struct regulator *vddio;
> >   	struct gpio_desc *reset_gpio;
> >   	struct touchscreen_properties props;
> >   	struct goodix_berlin_fw_version fw_version;
> > @@ -248,19 +248,19 @@ static int goodix_berlin_power_on(struct goodix_b=
erlin_core *cd)
> >   {
> >   	int error;
> >  =20
> > -	error =3D regulator_enable(cd->iovdd);
> > +	error =3D regulator_enable(cd->vddio);
> >   	if (error) {
> > -		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
> > +		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
> >   		return error;
> >   	}
> >  =20
> > -	/* Vendor waits 3ms for IOVDD to settle */
> > +	/* Vendor waits 3ms for VDDIO to settle */
> >   	usleep_range(3000, 3100);
> >  =20
> >   	error =3D regulator_enable(cd->avdd);
> >   	if (error) {
> >   		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
> > -		goto err_iovdd_disable;
> > +		goto err_vddio_disable;
> >   	}
> >  =20
> >   	/* Vendor waits 15ms for AVDD to settle */
> > @@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_ber=
lin_core *cd)
> >   err_dev_reset:
> >   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
> >   	regulator_disable(cd->avdd);
> > -err_iovdd_disable:
> > -	regulator_disable(cd->iovdd);
> > +err_vddio_disable:
> > +	regulator_disable(cd->vddio);
> >   	return error;
> >   }
> >  =20
> > @@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_b=
erlin_core *cd)
> >   {
> >   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
> >   	regulator_disable(cd->avdd);
> > -	regulator_disable(cd->iovdd);
> > +	regulator_disable(cd->vddio);
> >   }
> >  =20
> >   static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
> > @@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int i=
rq, const struct input_id *id,
> >   		return dev_err_probe(dev, PTR_ERR(cd->avdd),
> >   				     "Failed to request avdd regulator\n");
> >  =20
> > -	cd->iovdd =3D devm_regulator_get(dev, "iovdd");
> > -	if (IS_ERR(cd->iovdd))
> > -		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
> > -				     "Failed to request iovdd regulator\n");
> > +	cd->vddio =3D devm_regulator_get(dev, "vddio");
> > +	if (IS_ERR(cd->vddio))
> > +		return dev_err_probe(dev, PTR_ERR(cd->vddio),
> > +				     "Failed to request vddio regulator\n");
> >  =20
> >   	error =3D goodix_berlin_power_on(cd);
> >   	if (error) {
> >=20

