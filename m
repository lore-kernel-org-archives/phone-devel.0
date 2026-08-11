Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BD367B84
	for <phone-devel@vger.kernel.org>; Tue, 11 Aug 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458518; cv=none; b=SIzeoIFOuW8GyHkRsyxjRfaqdtfgzcXVnVSkFw7ApYKuTBHKEPqM681dDuREpr9HjlBMXqd2IZDZUhYF804zUi20E9hpBiFU6DyTzYP0+jkdSpu2bqhUVc4CDufr8PJ8C4/nsAT/RjWHtuK5h+SAlnskqiZ0BGw8fIq2F/XBjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458518; c=relaxed/simple;
	bh=0M4hPtMCZnS9VZteKTZhp9qh2fKhCW7nMyH65uA8L3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JC3NQdEwZ7q/reawSvQbUWCLPjJSHBpYAeNmnu9KQQrfxddCuTCZcWXJPGo+i7YEA0MWkGNMjY60yOYVnMae5711lYawCLqwX6wwR/qKqunMhy51M9URO2CnY8gEGAnGGi7MFF8d5eBzb4O65zC3ZPZxaxdu5cUyYKEvkipnABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T6Z3OnYl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T6Z3OnYl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de008b020so654575f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 11 Aug 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786458514; x=1787063314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15/Bnl2VxSh6SuH4L0zNteMsMCshNZVm/S5m2oTyH2U=;
        b=T6Z3OnYllA/aFR13y8UaNXDXNtGwzBoH1kI8u4DSg6ZJwHf3Wd6celYHrObMMn+Wip
         +Rd1YmcCSFjpxaCEYxbYKwVCKeJc4WbyZcEct6lWed8ZTlMwijwaepybOUjEEObPYB06
         D7ouVFtb4wZMbL7zgC8AkXADEhHBNglVygEIRCn3z/WexZyvwJrcWpuUFtmj+VzUqkhl
         6RbuQnyjdyd4WCv2UCE278er1BtaY8+/NeU/y8U5h2/iPaIkAHEIUirNBRd8Xg3jwDTb
         wwDxVf5fue5Nd6YQnfSgy7bb/7meq8Ycv48pcMPEf1YDhL2Wa8iEnadM/cMvHk0zR/yo
         x4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458514; x=1787063314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15/Bnl2VxSh6SuH4L0zNteMsMCshNZVm/S5m2oTyH2U=;
        b=EufgYw2jqpdxtPqlGXtxw3as2D3vjv7U0PuJIR2RjeM9ABaH1C/Q0pWF/rOxg8DFZT
         EYZqeo2wAB6XNxgLQ2Mo2utNvJWJphWnl5Zwd/tmuuGPw++JPA2LKjESgaCX8e6r+vvO
         2dDmxBHekoRN4YCBKbR5SYp3u/fS0AwUEDr9b4ivSAWkwymtmXRZOZdbioEdJeGw+Dko
         P2JWA6tBii/3uNGLf23FFuhMYJe4BnaaUuCgyG8EBBykjgEEL0Clv/0LE00P9qhf7n16
         8U304AoHC9LHDxucAgEUN4lvL1sVCPigeukNOOJ4yssgoIoixiIzgcg0WVb2vwszrvNI
         5PWA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6SZA/x1ObbRgI7bP6K/7K8QBnza843Q6TiKC23v3MuQCFbOYNMEbk24H+1aTOoVp68oczRWUb8XmJrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsbHARRTyA3w9IjOiSzMKBam3Ecx15f8VDAOhPtBmT3ALK6Me
	INn9JUKvYoRoYFxhBIemPln4fpzCNZuA3xIrdk/Lfr/ZXfgU/9RDEOtVcTddBlLWBJM=
X-Gm-Gg: AR+sD109WdjPZSn9wKJSeHPf5P6gAsjkOhloeQEkhKIcCYdpGcF1uMDZ7HylyEtL5Ov
	PxyF549g1+rn3eU7P5QFvFUfi2ydE7Fg+KAaoC9zTcuCobLCUz+YER1PpDRWlzXIzwwx6Ek73eo
	KNOqDRYrg+V01j6IbzyfEEHLKb8BTe3qdANfIPEhf05FIEB3/5D05Upclbo2TkLa5yBkx5RcHn9
	o6vQ7FcOwQ39C1U1swKSuoJM8St0t0O6T7ly3RmM2QETOfO4Ie0D7Xp6sRMSIeEG2fjENxXQv0q
	+HwG4qWO2wVsiC7Z1CSVBGFt+S5FjJXfiXFhX+NftCopFzvXGWUckz8xNsLA58KJY6yPEx8Cbob
	HDTPw+oW6xrsVZwoj/yHP4/D+8zAXmkQj+jy7TPGrSz6Zb8NnXXbHoEHQaenS5Z05Ztvvgmowi1
	BTfABCIoGRmc/UloLAt3IuReiSBo6t3GTkLSLuEvY5rj7ttGd3x45/qkqtsGOTOXQRgfVSBFUOR
	WhcRqhBREfrbWsRcGN7/uaNfL/Ut+welo9rURgo9K+AGDLLEi50
X-Received: by 2002:a05:6000:46cb:b0:47f:e7f7:370f with SMTP id ffacd0b85a97d-4814ff0bd3bmr471948f8f.10.1786458513493;
        Tue, 11 Aug 2026 07:28:33 -0700 (PDT)
Received: from localhost (p200300f65f017104853c3975fdcddd6f.dip0.t-ipconnect.de. [2003:f6:5f01:7104:853c:3975:fdcd:dd6f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4814a5be2aasm4934080f8f.13.2026.08.11.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:28:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:28:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Novatek NT37703 based
 panels
Message-ID: <answxKBHSJNR-bua@monoceros>
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
 <20260811-nt37703-bup-v1-2-34ad42b064a3@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mdziawi5h7yhrhrs"
Content-Disposition: inline
In-Reply-To: <20260811-nt37703-bup-v1-2-34ad42b064a3@proton.me>


--mdziawi5h7yhrhrs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Novatek NT37703 based
 panels
MIME-Version: 1.0

Hello,

On Tue, Aug 11, 2026 at 01:52:34AM -0400, Esteban Urrutia wrote:
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37703.c b/drivers/gpu/drm/panel/panel-novatek-nt37703.c
> new file mode 100644
> index 000000000000..5858bf12a310
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37703.c
> @@ -0,0 +1,467 @@
> [...]
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>

Please rely on <drm/drm_mipi_dsi.h> to provide the definition of
of_device_id and drop explicit inclusion of <linux/mod_devicetable.h> as
this will go away soon.

> [...]
> +static const struct of_device_id nt37703_of_match[] = {
> +	{
> +		.compatible = "motorola,bronco-tianma-v2-nt37703",
> +		.data = &bronco_tianma_v2_desc,
> +	},
> +	{ /* sentinel */ },

No trailing comma after the list terminator please.

> +};
> +MODULE_DEVICE_TABLE(of, nt37703_of_match);

Best regards
Uwe

--mdziawi5h7yhrhrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp7MYsACgkQj4D7WH0S
/k4ptQgAioC+Rr2A/Y5d45JoMyxiVG0O3RuWg9gDYCChFxXDJuKOWL12djmbG2Mm
+06Qy0mRg7Mf2XwORLM24txg92KtS9FWg454A4qeINt7TvZ1/FupspVlrxBKWwgr
jUs5ua3a1C3VIeM0safbs7w3tNhy7oo4o1xS/ACn4e4U70YZNxqooS2dpdcrx5qr
ObEH/mpbsEseluUZtEF8I5R+SbniO+25spM9TZXM30YGcoFiMKhHAoYzPQEbwKPE
RYsXTMMReO+5alsUjkAUfkQWzErZe05Sl7YdX3uMaxOAP9gSYa1sgToQU4nijg/c
RYsE/7R7AZASm+U0u+KySpmqyhqXMA==
=HQGs
-----END PGP SIGNATURE-----

--mdziawi5h7yhrhrs--
