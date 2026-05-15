Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A73B4EA1
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856202; cv=none; b=V1iZWh857gFXqkTI6FiLK8x6LBiEIIquUWuUotjeWbJqP7yTdjd8wOBkePOcPyhrdxg3JE/wYlkbI3SlWSNXdDME/SdA9BvNokSnRpfnHfc/ptOQfMHdZYeAYG4vpVmu+oURTAaD4FV69np4m1LRaWnKSivOrndPqoLZRwIIcQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856202; c=relaxed/simple;
	bh=BrDnglcPpHdF17/XDXh0A5c13ePXd2Eol2zpQw9zZuM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=U9cArds5NUrv3hWgKldDMg0NdVFomEAYDfWoCZIm1+qXhLykUogqZS2ovI8F9gH0Z7yz/ThtGuwZPyvbUn1VAiEAuWgscGVFp3WXEVlmMh9pailMv3J+onsr64py3qb3ATtJoqH1Y72kQPVZGTvurhHOTXjb2P3eEvqGukxlLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DH72HnBH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DH72HnBH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b936331786dso1182024866b.3
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778856199; x=1779460999; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0Bn3ek7iAddkL4KNYP43/nukBKzdDN3DwlzCPpyg8I=;
        b=DH72HnBH0jyYKk9Yl3mn7COLlJKZxPbrs7Shr5k655sITNyb3U2tKoOwXSD6wH1lTi
         VlV0snFF8l+aIaa1yi4wu6Z+2eQL3oodtXs9QIMen5XIqtCzQWeqKf1zpA2Ju7MuBYXM
         FS/uBPqyoWVC5UxXjqTX2uCQW8+WQU2uEB/TA7D55FdIweaZmX2JuLkx+IpjBMr2ZbjT
         /wPSgdMhqLbHCSW/UMeMpGv1Jry9492ciAApdbc+BntTM+0NPRfxOMoqnb4WbHBciQ6p
         X4GTW2eeuLJ6tIHh/bPxGe8p6QZrh3WuQcAzauU9ZqBVJBJWyJ5EPhWWCTRbQ4qmIGhO
         E65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778856199; x=1779460999;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0Bn3ek7iAddkL4KNYP43/nukBKzdDN3DwlzCPpyg8I=;
        b=ZQvM5enUjkcbrFifKsk9um3NTo28cp+cAM3HLkxOfbuUjZ6ZPpdK5x8M/k9jjVXVYi
         v5aNkRTKqcd40xz7N9NgI7zuw3pF41NleAE9tIBhNz8V7jtvj7gfiQITYe+kmwZNjBDd
         BFXCfjhhvg7I82FSgbxv+0JGjpgnF5+fTj2+LD3tssrBULYr+/38Lx0KzfJH6npzJMSi
         p8bgHS3wmFSW5icyun1v35kTpayJzmsXp7mzOhZWHESgT9CKhGZJ5gTKiP2/tBKw/U/s
         DkTm1jDWwtQorN1NcvVOA23X6GWjEgAE6coHIZmmlUUDkoYELPJXcAZYNuKPsoEGqsn9
         enRg==
X-Forwarded-Encrypted: i=1; AFNElJ8AYQUqxxejMrAEj3TtYOb8Sd1qC7wjA0QoGyqSd0CD4N0h9WP2M4G7AwcgcrN6AbEHQpgN1hOQepMWvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLvPf45n2IOdM6G752E6M28gdAaA55ST9BLeYyrdqc6GNmeql
	74ECzC5K3qDQnO8phAMvCrbyxnir5K8oCm4z+E7eIduqRQzQXfcmLbJ9OiKOOphRnwE=
X-Gm-Gg: Acq92OGoKwlt6Wt2yGWqxBRppS9AbE4QseK6jeFEd6EbsuL6Yg76ty4n5Sho2A/SkOi
	LiSkKDReWHikWM2ct9vsoB1mYk6DA8emMFWBHGPy5tlUmW6mJHmSHHkjv29Bdla2QoizfrD4+6A
	PGWpOejWEfiw0MVQ0zWUz8GmvIJoILCznENbX44/5kw7UDYVBzlWdnGlXysx9aokV5Y8smfIo3N
	Fq/5zixLkHDWLcITkX28CWuP60btWw8kSkpWlcum/3WFZrjQpL2qGl8wD5RmVW2e1Q/V6R5qB84
	/pO5i0a0PKw+M4qGJ86aU8vOwLcMiIh/xmup3l82FWPwluxMLB4riKHIApq7ekhqdUQqsKBFOHM
	KZPzw9ee3rCPMH++DI+3afTLTLWdThz0I9W54n7UYCV/SqLoouzSOVfo9CHKJQrgz+TMuT1t4ja
	XLTmZYb0KSAH3O81jzoRcnF0S7u0jS0sx2cnUKGObGSoKRdkAfLHpITa07rHI5ANCMJ53A75Pcj
	BAK4KM=
X-Received: by 2002:a17:907:7287:b0:bd1:9f5c:abbf with SMTP id a640c23a62f3a-bd51798eb09mr231759966b.43.1778856199218;
        Fri, 15 May 2026 07:43:19 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm236571966b.53.2026.05.15.07.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 16:43:18 +0200
Message-Id: <DIJBW80W84I8.27QBZZD2BGAKO@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] drm/panel: Add driver for Novatek NT37705 panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
 <c06623ba-b19c-471a-becb-2fafddb3583c@suse.de>
 <DIJBNGDNXE0L.2I0H4PBDDODOP@fairphone.com>
 <4d4e8090-3216-4a41-9a7d-3d2c0998121a@suse.de>
In-Reply-To: <4d4e8090-3216-4a41-9a7d-3d2c0998121a@suse.de>

On Fri May 15, 2026 at 4:36 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 15.05.26 um 16:31 schrieb Luca Weiss:
>> On Fri May 8, 2026 at 10:06 AM CEST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 01.05.26 um 15:52 schrieb Luca Weiss:
>>>> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900=
)
>>>> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
>>>> smartphone.
>>>>
>>>> The panel can also be configured in 10-bit (RGB101010) mode, however
>>>> currently it's configured in 8-bit (RGB888) since there's some issues =
in
>>>> the Qualcomm DPU driver when driving this panel in 10-bit.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    drivers/gpu/drm/panel/Kconfig                 |  11 +
>>>>    drivers/gpu/drm/panel/Makefile                |   1 +
>>>>    drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 +++++++++++++++=
+++++++++++
>>>>    3 files changed, 425 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kco=
nfig
>>>> index 979109c27b9b..59ab3f29d8ef 100644
>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>> @@ -624,6 +624,17 @@ config DRM_PANEL_NOVATEK_NT37700F
>>>>    	  Say Y here if you want to enable support for Novatek NT37700F DS=
I
>>>>    	  panel module. The panel has a resolution of 1080x2160.
>>>>   =20
>>>> +config DRM_PANEL_NOVATEK_NT37705
>>>> +	tristate "Novatek NT37705-based DSI panel"
>>>> +	depends on OF
>>>> +	depends on DRM_MIPI_DSI
>>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>>> +	select DRM_KMS_HELPER
>>>> +	help
>>>> +	  Say Y here if you want to enable support for Novatek NT37705-based
>>>> +	  display panels, such as the one found in the The Fairphone (Gen. 6=
)
>>> Duplicate 'the'
>> Marketing really wanted to have it be "The Fairphone". Will change and
>> make it saner.
>
> How about "as the one found in Gen. 6 of The Fairphone." ?

I'll just make it

  display panels, such as the one found in the Fairphone (Gen. 6)
  smartphone.

>>>> +	  smartphone.
>>>> +
>>>>    config DRM_PANEL_NOVATEK_NT37801
>>>>    	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>>>>    	depends on OF
>>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Ma=
kefile
>>>> index 0d694acbfbb6..94639bc58ca8 100644
>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>> @@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) +=3D panel-n=
ovatek-nt36523.o
>>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) +=3D panel-novatek-nt36672=
a.o
>>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) +=3D panel-novatek-nt36672=
e.o
>>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) +=3D panel-novatek-nt37700=
f.o
>>>> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) +=3D panel-novatek-nt37705.o
>>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) +=3D panel-novatek-nt37801.=
o
>>>>    obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) +=3D panel-novatek-nt39016.=
o
>>>>    obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) +=3D panel-mantix-mlaf05=
7we51.o
>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/g=
pu/drm/panel/panel-novatek-nt37705.c
>>>> new file mode 100644
>>>> index 000000000000..27bd8072ccd1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
>>>> @@ -0,0 +1,413 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor d=
evice tree.
>>>> + * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
>>>> + */
>>>> +
>>>> +#include <linux/backlight.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +
>>>> +#include <video/mipi_display.h>
>>>> +
>>>> +#include <drm/display/drm_dsc.h>
>>>> +#include <drm/display/drm_dsc_helper.h>
>>> IIRC this requires
>>>
>>>   =C2=A0select DRM_DISPLAY_DSC_HELPER
>>>
>>> in the Kconfig. Maybe double-check.
>> Will check. Always difficult to figure out the proper dependencies in a
>> fully-featured defconfig build.
>>
>>>> +#include <drm/drm_mipi_dsi.h>
>>>> +#include <drm/drm_modes.h>
>>>> +#include <drm/drm_panel.h>
>>>> +#include <drm/drm_probe_helper.h>
>>>> +
>>>> +struct nt37705_panel {
>>>> +	struct drm_panel panel;
>>>> +	struct mipi_dsi_device *dsi;
>>>> +	struct drm_dsc_config dsc;
>>>> +	struct regulator_bulk_data *supplies;
>>>> +	struct gpio_desc *reset_gpio;
>>>> +};
>>>> +
>>>> +static const struct regulator_bulk_data nt37705_supplies[] =3D {
>>>> +	{ .supply =3D "vddio" },
>>>> +	{ .supply =3D "dvdd" },
>>>> +	{ .supply =3D "vci" },
>>>> +};
>>>> +
>>>> +static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel=
 *panel)
>>>> +{
>>>> +	return container_of_const(panel, struct nt37705_panel, panel);
>>> Either just use container_of or build something that respects the
>>> input's const-ness.
>> I really don't get what you mean here? Why is container_of_const() bad
>> here?
>
> Because nothing is const here. It looks like an oversight or as if=20
> something should be const.

I checked and include/linux/container_of.h states:

  Do not use container_of() in new code.

and

  Always prefer container_of_const() instead of container_of() in new code.

So sounds like using container_of_const() is the correct way.

>>>> +
>>>> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->sup=
plies);
>>>> +	if (ret < 0) {
>>> Common style is to check for errors with
>>>
>>>   =C2=A0 if (ret)
>>>
>>> Here and everywhere else.
>> At least for regulator_bulk_enable() "ret < 0" is actually more popular
>> than just "ret".
>>
>> Kernel doc says "Return: 0 on success or a negative error number on
>> failure." so a positive integer should in theory never happen so they're
>> equivalent.
>>
>> (git grep -h -A2 regulator_bulk_enable | grep if | sed 's|^[ \t]\+||' | =
sed 's| {$||' | sort | uniq -c)
>
> It's just nitpicking, not a blocker.

I was also curious so I dug around a bit :)

Regards
Luca
