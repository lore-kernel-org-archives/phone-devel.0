Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222339B949
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453570; cv=none; b=Xk3th3KMFWTuMdFzObchDZ+DlaxeQEApk8TzWGLTdHNgJtl0axTDQ6asniFoFKwOkGCZsdSCaL/+lSQDhLcjifddJDcze30u0sjO6UeWjgfihBwUv1EXYE5vq/aG899LCkeV415IFOjCuMTRfApLFTWqlQbf6EmwEgGi0iD6Y1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453570; c=relaxed/simple;
	bh=X2c824wWJD9rQLCo8MwloCnJtDCebs7SODLQL3X6JIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MrDvvKJqzBSfKO6K07snLYkyufzTQjlXYPhZ2fq5gj0wBQ8R13KHTdGQnSY53Z2V/EFT1OG5pA0e6tazfau8xonD1CYdu7crt8xLuS0jdILBLE5ftZWA3sLAxtrsG18Qk0vGbHfRcw7t0F9JSljJGOAD6ACg+cU4lb8giuU3c/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EYpB4rez; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EYpB4rez"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bce57c132b2so1463460966b.0
        for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779453567; x=1780058367; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re2dViRE9BcyRMcKZfNc8pfEgFE/vQ/nAcDbaRjEe/g=;
        b=EYpB4rezUvYg18wCrdK46QJSgzB6ROmSEZ9SnDu5dtDfqb9r2k4XGN+harzxMcdEH7
         9C9IDX/2lnX5aQ2EYAAyWtpYhIVpCwoDeCCZHja8kIun68sOiLpu9NaHg6fTfTSQPC+d
         Q05mhQNAoqRad/Apk00Aw/bAQ/NIJDn3uqOU5YUfPdkzwSHGQQ0LfkTeYLcIG61G+cbO
         lqeopBX22lem/ezyPhJbEdGWNdiqXuRSwnuvTGtoLI1Utj/GBpF14W6QJSctFLlljqE0
         XFsGJKm4vCLNg6XrS3me8TVuFX4SwWfAbpDgsHiuvT/IjST+BLmht0RK//0d3LP1fCzv
         ztaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453567; x=1780058367;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Re2dViRE9BcyRMcKZfNc8pfEgFE/vQ/nAcDbaRjEe/g=;
        b=p4hNDfsE+r+ek8Bc92Av0Af6LV/j9GLsLp4wL9my/n6cxtr/dSvVp3iZcL0jxri4kJ
         +YJJdapSUMn+cXTWPmNAr7arr6gwyf/X3dxBmnq810P3MVaTHLLH90DEurT6W+FZaRuJ
         WSl9TaGxRpsQXZtwVYzi/T1NLTHzbJsQd4LWrtT2ybn6p4mawpUMhZAKZHxw5JWmYlPk
         xsr5l2GkemaupV0fslQAD+x3C3zrL7a5OQhLjGT0gzf0GBwBF3F8jqef5M5ap9oxd6UI
         u0H4GtGtBmf39Rs6/qI4gkJHDPrgSWV9U5JMpFURj+SF6ky2pEzDc9oWIUfqRiE8FFYV
         M5dg==
X-Forwarded-Encrypted: i=1; AFNElJ8wIN8y2tMLvV1Z5oFtASCkNFxFJQjiuX7vAtFGpTXKScbuKDWeK4JfM/la/r+m3rjV3lCDHYOqf03DXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Sp1xHc8wp4DMYsZ25hN7pyNj5fKX6i+hZu2GuxqVbNVPwsS5
	6qqko2GZhZyEEPnWq2xw2rvSSSZ4Dy2KB0Imyjm/iFOzpD2FnN+I3yzGZC0smv8XvVs=
X-Gm-Gg: Acq92OEPVjkQOmGpbJafxv2wGHA6nHfVLTsbjSKSEaiEmEq1K8ltRk0Lv7Rb3p6qCfJ
	n4zHgsqbZrPnELgm5oVtkLQkV4PyK2HoeCOCBwDacJ6z7/z0DfF4k2zsjEsERfUHoyXfzE8N7ff
	nxKmwYwEngoe9yVr7rugnXJvGEIEanI5mIpU0XaUBRga0iVDR7PKzHPSXIVOAT244kH8fswMtqi
	Yfn3ygmbB6D+MQbAwD9/qdhfFIKWeUv5FgEJwuaW6Bi6PxvvGwBOYkw+ouFbNu9Rvqv+/w0BGrS
	31l7LzZjcdP7lAMfQc9JD5pLSBn0+qTS8YNaO0vdoU17y122B81w3F0uWItB9hIyeE+BzH54elE
	EMnURNbEqDYMWC+YBLQDVeO/Rj2UuB+F/9PEUYvmN5MAt88uKDdvEObEeOCsZrpGvE0BBm+Wis2
	lrq4BxMh0ZOHbNP0w1vsW05dup1PSecEZC9TBhYf4kbMy6eR6SLfflsNagp8RzzqYhOAiZ
X-Received: by 2002:a17:907:25c8:b0:bdb:4372:b152 with SMTP id a640c23a62f3a-bdd4a3b1f6emr154177166b.16.1779453567245;
        Fri, 22 May 2026 05:39:27 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d996sm53187666b.13.2026.05.22.05.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 14:39:26 +0200
Message-Id: <DIP7N749FQ7W.Q3PS2H2YAMKD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] ASoC: codecs: aw88261: make volume control
 usable
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Weidong Wang" <wangweidong.a@awinic.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518220906.347958-1-val@packett.cool>
 <20260518220906.347958-8-val@packett.cool>
In-Reply-To: <20260518220906.347958-8-val@packett.cool>

Hi Val,

On Mon May 18, 2026 at 11:44 PM CEST, Val Packett wrote:
> - Invert the value to match userspace expectations (in the hardware,
>   positive numbers represent negative dB attenuation)
> - Provide TLV metadata for the dB scale (and divide the raw values by 2
>   as the excessive precision used by HW is not representable in TLV)
> - Do not unnecessarily reset the volume while switching profiles
> - Simplify aw88261_dev_set_volume using regmap_update_bits
> - Do not add the initial volume from the profile to the requested volume
>   as that would throw off the dB mapping (if a lower max limit is
>   desired, it can be set in the UCM profile in userspace)
>
> With this change, it's actually possible to use this hardware volume
> control as PlaybackVolume in an ALSA UCM profile.
>
> Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/codecs/aw88261.c | 52 +++++++++++++++-----------------------
>  sound/soc/codecs/aw88261.h |  1 -
>  2 files changed, 21 insertions(+), 32 deletions(-)
>
> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index adc728e45f57..0e6b2dfe5db9 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <sound/soc.h>
>  #include <sound/pcm_params.h>
> +#include <sound/tlv.h>
>  #include "aw88261.h"
>  #include "aw88395/aw88395_data_type.h"
>  #include "aw88395/aw88395_device.h"
> @@ -29,20 +30,10 @@ static const struct regmap_config aw88261_remap_confi=
g =3D {
> =20
>  static void aw88261_dev_set_volume(struct aw_device *aw_dev, unsigned in=
t value)
>  {
> -	struct aw_volume_desc *vol_desc =3D &aw_dev->volume_desc;
> -	unsigned int real_value, volume;
> -	unsigned int reg_value;
> +	unsigned int volume =3D min(value, (unsigned int)AW88261_MUTE_VOL);
> =20
> -	volume =3D min((value + vol_desc->init_volume), (unsigned int)AW88261_M=
UTE_VOL);
> -	real_value =3D DB_TO_REG_VAL(volume);
> -
> -	regmap_read(aw_dev->regmap, AW88261_SYSCTRL2_REG, &reg_value);
> -
> -	real_value =3D (real_value | (reg_value & AW88261_VOL_START_MASK));
> -
> -	dev_dbg(aw_dev->dev, "value 0x%x , real_value:0x%x", value, real_value)=
;
> -
> -	regmap_write(aw_dev->regmap, AW88261_SYSCTRL2_REG, real_value);
> +	regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL2_REG,
> +		~AW88261_VOL_MASK, DB_TO_REG_VAL(volume));
>  }
> =20
>  static void aw88261_dev_i2s_tx_enable(struct aw_device *aw_dev, bool fla=
g)
> @@ -424,17 +415,7 @@ static int aw88261_dev_reg_update(struct aw88261 *aw=
88261,
>  			break;
>  	}
> =20
> -	ret =3D aw88261_dev_set_vcalb(aw_dev);
> -	if (ret)
> -		return ret;
> -
> -	if (aw_dev->prof_cur !=3D aw_dev->prof_index)
> -		vol_desc->ctl_volume =3D 0;
> -
> -	/* keep min volume */
> -	aw88261_dev_set_volume(aw_dev, vol_desc->mute_volume);
> -
> -	return ret;
> +	return aw88261_dev_set_vcalb(aw_dev);

These removals cause the following compile warning, when applied on
linux-next:

sound/soc/codecs/aw88261.c: In function 'aw88261_dev_reg_update':
sound/soc/codecs/aw88261.c:347:32: warning: unused variable 'vol_desc' [-Wu=
nused-variable]
  347 |         struct aw_volume_desc *vol_desc =3D &aw_dev->volume_desc;
      |                                ^~~~~~~~

Regards
Luca
