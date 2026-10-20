Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487978;
	b=AursldVjYiDJVrA07didDQjBk6rkl0B6KU+VTnxsxJ9qjq3e9Woy4sBafB/MRbYAF7Z8
	 EMvzse3yP84uOIo7/k2Oyx4nAi/KQOh9ornUMl61hDGpjbgcs9U/PVjDBpFbeFRpD5qT0
	 sqyzEXdVxhLimmKnGW822/CokxVacoXDhOqIYPiz6z1eBauaPcCNM3WadFjI8h1p3/CsK
	 0NsQ1+bsVcDxPg6juwq18Y6CSFUTQWGzTTkuZSFwgjzNtFZLkkZfWeFdbC6bj4zTT8M5o
	 Rnt1TxzmC0B5/b5UCJjDJPVVJVePtWbpajcScsidNI67iXV5H48LMNkVijQ72/LmGFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
	b=J4suVv2UhIfayk9iiN4yfoUW7bNR2RUR80IRTkq0x2GxP5v9H/z1bWlLYA6RXR8M5cz5
	 jX39PlGt5Nnqwo+8JhyhUVZs5lkNAUEjkNdMN8FZennRaOM3RqDsuyNUnLYTmXi8ksQxJ
	 COAw+CSp1ItA7EvUns1/gccXShHpf+bFUv/K80qlEBNdfQcxiZQOoe58N7Jm2g5ELCOtS
	 hYrqsTC/9yD5OmthW8gqapKFrftXWZpOcfd3CmMODJDUYIWxuG0mRJ+XvxSuSXwPRn7lY
	 9fHE/rzRpy2kjyNmvzEtMehjIdlIdr0fuCnAkdoqC++jllw2cJdNgv+thg7Hjda6JWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ZvoC/0Hj";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF2606A31C
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 09:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZvoC/0Hj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1785013f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792487976; x=1793092776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
        b=ZvoC/0HjoWQBe6v4RhWlvN8gU1HwGS3CXsFeZbO9CKrYN76M87wee0pPAkvi3zWerB
         5gbyQCOC4M32KxMEbgF11ebqOvSHUnLNEK3oGaKiw/XUY6VdqRMHSijI2S0xJu6e/6n2
         4QI4NicD7mO6c51s6t8+jOaoGHYam10T2WhM4xRO9RpH/CZC+SHMlZRilh0pbhkT4koW
         Icn25SHGSLXG2rV6FXIoSwoROrRtXxGnufkJqNquKjOVxPzC+bwaXpYZNNEBm4sPtinz
         nwjDdZXQduUeK8bzZPNxIuBsFxCR/YDyVYtsWi9HpsCPzAZjw5A86NjCDccgQeav4zik
         tn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487976; x=1793092776;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGq046gGXw4XcOdGnSEHgJIR2O0gujEWvtIf5Ag1ia0=;
        b=M4RPKJaas3KGj2fi00z0nab5hxwISsLsBsPV/EnvaIRNSNJYU+Ct4+hqoMamEQBQyr
         fVTmjY15nZtcgM7i/Ecmqx+u4nUO2gSdfg1zvRIoBCjlG7bCWKSOboJHXm0GsusbeuL7
         AraYsw3CgcRjSyYt4S24Ydq0tu2oapeTm5zTXzKUKqRS1Xzd7C7dh3Ylw1zNPGZfD7VQ
         /pQMbhZfIprTO+5g8bCR3pQtExtfybb8WPcoHh+iWweNO8zIOOAkGdCQ9YB5Fx5EP03j
         ftCfIweWjhRNvs8zrg7tA4+6mnEXINCiRniwzw6to75t8MfslSlA/GgwGq11xCjEOjcQ
         RHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwHawWXPX5Z+6jbS6908M91SUL4pDpJTsX2JJbu8cyA5LzkWb8oTXUmEJYUSDGA9UyhjNPiUuMMEEkjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKv0lu9tIQtxGnQdE4Omc3dbfplkfu/Kq4TKhlqIlpc18fF4SOe
	V2YoRXDXrltSctmk6fDamQnDxlUqfL7W3jWQS+7hWq8aH6S2oSTuKpaYK+Ffpr8+vik=
X-Gm-Gg: AYBFou3aytAvmwfecNUbqx7gTkKYbY2nVuRub+Z6HVYKApho1P5hPimsxJjDvNBtbgw
	nKGJjGl612UmVKulRKQIbA0csSSQoioBuiV1EYdMcYc1qnoZb0+VX47bQDDI7WFjQlqAZPS13Ll
	ea/uNKLhFDDq+6XjN7xQBYDBKiLfADgbLLILH6UavcfmT5xW1e3p/NC8rSo/VWxkh5DJO/AigGv
	MeLfCgdldm5Qtl3tzoCJNwItXJywtslrca10AUGrUbBH8//zr+svi5v96AYy6X9utGeDk40LmF0
	V656+1myuG0I9P+yme5shRVJqFern2rzFDwM+MhFq0J1bUp9/j+Q3jMIpQ67doqp2biNzX5Bo+1
	PpxY8GYIWTXggO84CBRLi5nn8Dt6X7GKcMRsvLvQ4d0/LsK7nJoxsviPxm/A1ZYcLs+roCrDWe7
	hyKKCG9yk4n6icMYBidoxx2MyJ3Qyiy4/FEo3q2yRc06qkoEenWoBUJLOcrQTyLzah3HqoA8Vus
	s26ZjBeNbuidePxfzpOqoWb5ES6PhVhO9rjML93PiKdj1Co/7q2PQ==
X-Received: by 2002:adf:e19a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e07fa6ffamr21235031f8f.54.1792487976218;
        Tue, 20 Oct 2026 02:19:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm5114545f8f.33.2026.10.20.02.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:19:35 -0700 (PDT)
Message-ID: <9bf6d1b1-d287-49bf-9755-a3ce42b85823@linaro.org>
Date: Tue, 20 Oct 2026 11:19:34 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcd939x: fix ref leak and NULL deref
 with USB-C audio
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-5-val@packett.cool>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261020082631.1509275-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:26, Val Packett wrote:
> Some code issues were found during review of a port of typec code from
> wcd939x to wcd937x, pointed out by sashiko-bot:
> 
> * wcd939x->wcd_mbhc may be accessed by the typec callbacks which are
>    independent of the ASoC codec lifecycle, don't leave it as NULL/PTR_ERR;
> * wcd939x->typec_switch reference was leaked on unbind, put it there;
> * the device_node reference returned by of_graph_get_remote_node() was
>    being leaked, add a __free annotation to the declaration.
> 
> Fix them in wcd939x as well.
> 
> Cc: stable@vger.kernel.org
> Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   sound/soc/codecs/wcd939x.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 26fe0b6313cd..56e041e70fd4 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -2466,6 +2466,7 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
>   {
>   	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
>   	struct wcd_mbhc_intr *intr_ids = &wcd939x->intr_ids;
> +	struct wcd_mbhc *mbhc;
>   
>   	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd939x->irq_chip,
>   						     WCD939X_IRQ_MBHC_SW_DET);
> @@ -2482,9 +2483,12 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
>   	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd939x->irq_chip,
>   						      WCD939X_IRQ_HPHR_OCP_INT);
>   
> -	wcd939x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
> -	if (IS_ERR(wcd939x->wcd_mbhc))
> -		return PTR_ERR(wcd939x->wcd_mbhc);
> +	mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
> +	if (IS_ERR(mbhc))
> +		return PTR_ERR(mbhc);
> +
> +	/* May be accessed by platform dev typec callbacks, only set if valid */
> +	wcd939x->wcd_mbhc = mbhc;
>   
>   	snd_soc_add_component_controls(component, impedance_detect_controls,
>   				       ARRAY_SIZE(impedance_detect_controls));
> @@ -2499,6 +2503,8 @@ static void wcd939x_mbhc_deinit(struct snd_soc_component *component)
>   	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
>   
>   	wcd_mbhc_deinit(wcd939x->wcd_mbhc);
> +	/* May be accessed by platform dev typec callbacks, clear */
> +	wcd939x->wcd_mbhc = NULL;
>   }
>   
>   /* END MBHC */
> @@ -3171,7 +3177,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
>   {
>   	struct wcd_mbhc_config *cfg = &wcd939x->mbhc_cfg;
>   #if IS_ENABLED(CONFIG_TYPEC)
> -	struct device_node *np;
> +	struct device_node *np __free(device_node);
>   #endif /* CONFIG_TYPEC */
>   	int ret;
>   
> @@ -3434,6 +3440,10 @@ static void wcd939x_unbind(struct device *dev)
>   	put_device(wcd939x->txdev);
>   	put_device(wcd939x->rxdev);
>   	component_unbind_all(dev, wcd939x);
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	if (wcd939x->typec_analog_mux)
> +		typec_switch_put(wcd939x->typec_switch);
> +#endif /* CONFIG_TYPEC */
>   }
>   
>   static const struct component_master_ops wcd939x_comp_ops = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
