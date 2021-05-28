Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D55C4708C
	for <phone-devel@archiver.kernel.org>; Fri, 28 May 2021 11:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E62C61186
	for <phone-devel@archiver.kernel.org>; Fri, 28 May 2021 11:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbhE1L4t (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 28 May 2021 07:56:49 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:20161 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbhE1L4t (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 28 May 2021 07:56:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622202900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aQqcZXWT4XqPeHd8/2ibHiQiD1y0VfjXgM93IQawBsWKOFFaYg7Br3XRXwJLYWOed2
    5i4CPMnLy8DqoaPZ1rYrLQ08+MvyTdHHd6TAmJgjWcohAQXdyK6JpOTF4hbCXR3yD9TH
    56edytofCabbK6dkc/IvLSEEHenbmQv9YXApUDfcNxdpO8UplJ+zIDbb4bxT+OfHrs7P
    L1R4RSd9u7MJ8JNaVN17I/3RZTakBCX7U65NzmWV1ZTKUt3QsU8Qwf0/BB7zQhb4bFZX
    Nwnxlz4k2HnL3e6kKkIi/mlDHuSJtMjagupA0eYYOBobpKfIgP6/JbJxo7cJ/drKj7Qq
    fv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202900;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WeqQN4mQvzS29AH4yAdf/GA2SB8Yu/Jx4YSHLw8KKYE=;
    b=bqf4cZk8Qnv8wHwLoJN03UmrYfSpdnKV1xjO0lspSs4rthlzJOqbdJnOw9bVQP4kTr
    U/BH4KXzQhaYPIez72f1hPVRbqTa/35VD5OI6RvcvtmeErJJAlfIghJJDVHYHsw5nNnU
    CH5lxIYHSbKQei7HrijXF6z0r9HpRuBPNgd03CnAZ780w9pG9aZN4ErBl78CrojgC4e7
    AkI9hu0h7N3cXvVgFJcWhUIZz+QKKRx71Ic/L4JR422WL0oKn7cho0laveUYHeotDLkY
    sRAsw7cTg4aERqRwBR1bpJtF7R/stkXVb1ZHNLoT6jsA3R8HHcDwrnPSMVzQQfbHX9Zl
    iwHQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202900;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=WeqQN4mQvzS29AH4yAdf/GA2SB8Yu/Jx4YSHLw8KKYE=;
    b=r7Zylf9UuQSufvtraDgmWTNFpCe14DxFRNNm7J/TwKvYKTw8j0M1lHsl+TTeoTF8K6
    f2eTgAgDHuPBJIKuec3ey0NYauSLZVgZGxVwXohj1PL0R+iApOUjAGfOBsmQ4nyjGDC4
    sa5jwB1+O8TZOsGXeZh4n8PgOVORTTSlu1JvCGXevsnsaQ86tzlfeFUHj9TuIs3UeXzQ
    XusYsM4XcEaiOhSciF7+xYGVMUHk7KlvGI23QdgMm40KTNdoSnXC8rzP/tS5xOO2oR9u
    6Eptxcf+NrkFWHu8K386VOg0nPhuxsAtWfFaSch+EB9IeuVgjpObdxuwu98dcaovvVzz
    28BQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
    with ESMTPSA id U0b2c9x4SBsx662
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 28 May 2021 13:54:59 +0200 (CEST)
Date:   Fri, 28 May 2021 13:54:58 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Mark Brown <broonie@kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] ASoC: codecs: tfa989x: Add support for optional
 vddd-supply
Message-ID: <YLDaEnjGmCHrUMiz@gerhold.net>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
 <20210528105101.508254-4-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528105101.508254-4-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, May 28, 2021 at 12:51:01PM +0200, Vincent Knecht wrote:
> Allow specifying Vddd regulator/supply to be enabled on I2C probing.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  sound/soc/codecs/tfa989x.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
> index 6d94865c534b..643b45188b6f 100644
> --- a/sound/soc/codecs/tfa989x.c
> +++ b/sound/soc/codecs/tfa989x.c
> @@ -10,6 +10,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <sound/soc.h>
>  
>  #define TFA989X_STATUSREG		0x00
> @@ -51,6 +52,10 @@ struct tfa989x_rev {
>  	int (*init)(struct regmap *regmap);
>  };
>  
> +struct tfa989x {
> +	struct regulator *vddd_supply;
> +};
> +
>  static bool tfa989x_writeable_reg(struct device *dev, unsigned int reg)
>  {
>  	return reg > TFA989X_REVISIONNUMBER;
> @@ -242,10 +247,18 @@ static int tfa989x_dsp_bypass(struct regmap *regmap)
>  				 BIT(TFA989X_SYS_CTRL_AMPC));
>  }
>  
> +static void tfa989x_regulator_disable(void *data)
> +{
> +	struct tfa989x *tfa989x = data;
> +
> +	regulator_disable(tfa989x->vddd_supply);
> +}
> +
>  static int tfa989x_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	const struct tfa989x_rev *rev;
> +	struct tfa989x *tfa989x;
>  	struct regmap *regmap;
>  	unsigned int val;
>  	int ret;
> @@ -256,10 +269,31 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
>  		return -ENODEV;
>  	}
>  
> +	tfa989x = devm_kzalloc(dev, sizeof(*tfa989x), GFP_KERNEL);
> +	if (!tfa989x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, tfa989x);
> +
> +	tfa989x->vddd_supply = devm_regulator_get(dev, "vddd");
> +	if (IS_ERR(tfa989x->vddd_supply))
> +		return dev_err_probe(dev, PTR_ERR(tfa989x->vddd_supply),
> +				     "Failed to get vddd regulator\n");
> +
>  	regmap = devm_regmap_init_i2c(i2c, &tfa989x_regmap);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> +	ret = regulator_enable(tfa989x->vddd_supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable vddd regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, tfa989x_regulator_disable, tfa989x);
> +	if (ret)
> +		return ret;
> +
>  	/* Bypass regcache for reset and init sequence */
>  	regcache_cache_bypass(regmap, true);
>  
> -- 
> 2.31.1
> 
> 
> 
