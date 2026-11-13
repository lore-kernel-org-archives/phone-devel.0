Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551230;
	b=vYsgSUoHY3tfLezy1XptAMeswCqpJQIsnljg1FrfwkFU2SOR12b85Sua4ei/j6PW4DsC
	 th/JV2BAkNibSGz7aid1LOPsPhe83QCcDm8RR9GX8ivXXPOMiFgvJLSs4GFH2fy1GwqTp
	 te3/yHAeLt0PrSHhYae07luo2Tohh4H3njJBr162DWRyrw/Gl5xc6yz0Vw7SP7XHsU2vD
	 yNI+HSHl6mNBguITo8oC5nsPnk+j5N+jnzO8w3o6cE/NbXR+fvtu2qgki7mGnAwtCINm6
	 iA/4uwsGiYrpl6KEqlF7teSYU5K4oDkYJ550FFjydasR2E+3AOAO58y+/A5/Hq5YwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
	b=YHxyj17GEktvbbnnP2bjCtzRj52L44RKHq7kdk3LHa6zZ0jqUtZB3GvzxYpkfnaU0YTQ
	 Ap0KmPka903i9yPZ7AluCz5q1FlM1Ob/hXEgYOKyL9NIuHRH3jMbnxU9GSzdlshZXmA8C
	 WZ/rcmfHEnF5+VyDxq5Reg2zxN6RQ7lvG3/ht4gHwXYbijWSLdOSAHzy2eFW94rkVxuHO
	 q3bayoSgiCr4Yhrdu+EH8E49hxXhUyJA3238SrwiCZYxBiMR78XMoFrX9ybMF0RU0+QM/
	 jAhfxUHx5PqGcn5cv94n5GPMdnl/g26cmbRAuOwjr4/9Ww7vGKIS6HhuEWCNMWAESUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27D606A32A
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D27D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso3710145e9.1
        for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551229; x=1795156029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=MUvxZhYm5+xi+SJfP8nHhsZ1GXHZRgKcmtYpFlDoXTjjRpAAhHrxK/sL0p5zR3UDxZ
         zoFe6J+qpK86Rz4t3v2DUKvCLnSK0WziR5goLmM6ybJ96s52a7n4l6ssjhqsUYaR+Jm/
         Xs9hOLXj9PE+uwryRlkvLuERCrqJTf3zLvvS2FCslyTZTd9wswIAMULtnwF8vJn7f2H0
         3wTzjD8Hp6/wsmtQJ0eNgdgUe4JwuhUhUM8UnvqdKeyZwp2YYRSg+jZBqsj6tEhsE3zD
         Pz/u5C9YRb5rfcke4Gy7OJXnRI/iCfjiVWknhEe2HE/M51peV4kwHUDOt1TkMoov2shs
         xFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551229; x=1795156029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=BX6wmugJNV2+CxxjYMts9Qce8e9tVsyspHgsvaV66Ha8SwgWp+MXp2fz1Fe2mZjfaM
         tsPl9otzh+/BtN0Insz8UaYX1A2EUocpZLlrZ0rA5xXiECj0lIl02iy2Dsg7dgkQv5/D
         59wU+QPjJU/NtRzUyqA1t11wTev9Ac877su5TC2v/a2gdpTIGJ3gwSj7qT+iYdjqdclF
         5sIBJ+mchoPm1TrWXEBbY+NkCMnd2M0myMp8PHfxeWPlf4TyuUzYRqt8usa9dw0rc3mw
         tR/q3Ld49ngDgMmKeeS9Qtw9VPUuglqmuNylt3xGO4tOd8HNWthrzFt6OPWNDjVgjIxH
         uR2w==
X-Forwarded-Encrypted: i=1; AL+hErEfKf/A7/ZtvOYQzhKKKx5IUrecDr3/oBkXRdu7m1M0/iGDkIfBXD/ijnfmbE5eVTQ2pGJefh9QJUGOdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nb362Rg2fpyYRHIskCYLkQijS4ByESVkTrslgJvJkx1JNfzix
	WlOKTJGdB8o7rF/Z30B4BAIpezWosiZ4mZgos0cBhwPO9+5nHTr4riCO+BMja2fLwrI=
X-Gm-Gg: AYBFou05qLsrWei54Buw5mwhsLbgLtspUHAgNEZ4VJvqYuvE6x6LP8uUxEctEGB19qx
	O3S50p2jpDsOwHTZSGhssDaesWKaiKuxo0wqW9teW6d0rMAPXqB1Q8AHIYQuTV+2EPPK/TO6JDN
	1uAM4NNG2c77L3I1MKM8sjRL0k31YAeasGdys8Sho0paGU1aS+2gckGYydxzvibrqaw/S62USfQ
	TIE4g3XxcdQx2x3th+EEyQkM2NCbil9rBr5H5GVdgaIGvLZucBG+0lmmuZO+vGU3yCjE2R5xlQJ
	XG2u7cD/9xkCwDITlHee6yQGzf3O4zmo4fxDzSTCwRfWCN+IvUHgATwDUU5r3idFDK2aKDqWDgt
	8D2NTXJVqzy69dOCtJbtPlUzqvm8rdBr0V3yaDSGQY8JdJbr14vp5V+NTMSVgpCbE+q3t1X79Qy
	XjFF6HzB5RdqfwnoXLEACNbLWPsVstL4plf9tPiWf67f4cT/NrS8TinVkPFJ92Ofq9f+VfxoQCi
	dmGrXsAPieCII1A5Ae8Fq3JSj6AAr9SjGhXRioh4O50CXY2BJemqkaeAG3E1Y/Wb2eEyR+dMtOr
	Hvj7V8J5L895xmEnNclfVHwdH6IyL79xJIyaQd01SJ9AmcIZ1ivuuYKAJ1qb9xhFT2K8Qpqweg=
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr36037725e9.0.1794551228841;
        Thu, 12 Nov 2026 22:27:08 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e29daa5sm133039875e9.12.2026.11.12.22.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:27:07 -0800 (PST)
Date: Fri, 13 Nov 2026 07:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Marc Lainez <marc.lainez@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
Message-ID: <avatRCrAgoPjV7rP@monoceros>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-3-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwyna4jkd5v6s5iv"
Content-Disposition: inline
In-Reply-To: <20261112170841.2189322-3-val@packett.cool>


--mwyna4jkd5v6s5iv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 02:07:28PM -0300, Val Packett wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. That introduces a bunch
of unneeded build dependencies and of_device_id is already provided
(without these dependencies) by <linux/platform_device.h>.

> [...]
> +static const struct of_device_id qcom_qg_of_match[] = {
> +	{ .compatible = "qcom,pm6150-qg" },
> +	{ .compatible = "qcom,pmi632-qg" },
> +	{}

Please make this { } (i.e add a space) to match the most common style.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_qg_of_match);

Best regards
Uwe

--mwyna4jkd5v6s5iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rbYACgkQj4D7WH0S
/k7nbgf/b6/rA4kIW1NyMoOtnNVBeGIHHHNfMkct33HHb1h0CiT6Hd1RLEJ6HH+F
sW4pjg7G0QStID55MbOeFsfsHKUaOEsaLwutZ3fATturnz7k7RZRvLfAjNtR3k18
hiWFbFdsTjH6SuQ/g7OijXpDO+E2v/5FHg8g/V0U5xwL0w4sWAME2Gxrc9Aed+1Z
yb1H38UcmdaYkNs0WgAyYt2rGVtGDyt5nQqLm9gBfrCvoxDzCIxgiXJ61C9JMF0t
UIk/sLbujBcPF2qrtmodX0CUE07kBKD7PV1TOWjB7Gcz+f3E/X3eQGPNNOk8mEQn
pqgA7hr5DNGO6zRenFbDHgtssAhenA==
=HgBt
-----END PGP SIGNATURE-----

--mwyna4jkd5v6s5iv--
