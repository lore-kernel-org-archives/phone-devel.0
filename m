Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505A26ADB
	for <phone-devel@vger.kernel.org>; Mon, 22 Jul 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649632; cv=none; b=Y4B56nAPfGLCuEWUWzwnFJep2ZlsCDXW/Efr2XxJ4Mgsm7P+Nlzvs3lwuxz5cVPpdzQSvjM0kvERNAE3redVJX6fNpvBT6nSDPIlZqqZaAtcQnc92t/+/tsaprrXjW/j/tLff6PjZZuoTyWUK/TwBSIeuZG7Qa4hn+W7d0m0iTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649632; c=relaxed/simple;
	bh=/H5dtfxa+Nw4zsSc6z5aDmVUmIULoNGWM3agejyxotY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHLK9SSkGa0JEdjpZYoRb9g0ezLqHFZ117/tLWNa7YlxOVjrvcS4cWvt7IMPzo25VzcDCEXRCHZr6Dvng+80hOUnwai5uQ9aj9PZBQjaeo0SEhfyptARc1bY/+orzhMShVFZ64OFm0gZpuEDQRBO0rVvlcbsRzBKPghVmPdGrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I22mSe2w; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I22mSe2w"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef283c58f4so16935961fa.1
        for <phone-devel@vger.kernel.org>; Mon, 22 Jul 2024 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721649629; x=1722254429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=I22mSe2wKPtaWjRUbhb0Zc0WRLnoLDJaRaj6ZeN+/oR7F1Iq2lbvaNh6WqzVC02jr7
         jJq9pEvafghM5tae68p5OidJwwj/lGSzTukWTg+yzXt/0vFPpT6Q5cNGY5Ck8LXLC2tq
         fyMOMa3tLVVvPkb2R6atmBBm7QAYela1Iw6eRsC2KBsI/is+GlpucGCC10sxqSPBNdHU
         UM8IWTbzoBK+YZ3AKm9jC/V/UqLRpEIMefJOeMm2vshTekTQE7n/iDRtZTEi25uN6eXZ
         L00Fp+utVCJr7l90GadlHHZyarY2Pf6GnqQD7FOUyh3pvGuTX6rA/gl6s33NMV470lWF
         QB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649629; x=1722254429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=GWOWq7EK2UYBkFNQLpU6oVYHpjoqQj7sO7w1rgFkHYPcJ2+h6yUDBGKNCDplzYe4bk
         rU8RSLdw5XVDM30aD0wBsaqz+i5t8jTLGtKnphSVOvtGddFN2Snso0pDCzMGI/LDsSd5
         oAcVwvOxYzLUXjmamK5YJKliGkDy4EaAPTb12TD2+QxyKq2jJm3G4XhY2qUS9enHFxI3
         MQRJqx4kZA+6VYVxdAu9PihKvJQ6q+aCUOxhM8bdqv8EMkuzcxCWRrfMJH/uzfVkennT
         7biuOSxYBmQDOwhhnFha7VZBRzvoJ03MQjOulhwFIJHXwtDca2G9ZyImU2ItGXz3Qu9l
         4+zg==
X-Gm-Message-State: AOJu0YyvpmoCJU6YDPby89Z3IATCDXExzc+mnzHS/Cc76tOOJXS2eEL3
	sCd16VYczFJTaBoiBvSuikbY2PDe0zOTFHfR9SIDf6rrkoGCXQsIjVGlK+l3D1A=
X-Google-Smtp-Source: AGHT+IHfpRkiwCwyjhMtcbqX/KMogZuiuVRMVA2GKfuTw4dL3YtZnf0Zu/Vpy6wLwRiUYsUM8T5TnQ==
X-Received: by 2002:a2e:9f57:0:b0:2ef:2006:bfb1 with SMTP id 38308e7fff4ca-2ef2006c9e1mr40429441fa.15.1721649629135;
        Mon, 22 Jul 2024 05:00:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef2eae89ecsm4705601fa.68.2024.07.22.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 05:00:28 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:00:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <jx26jgbw2appm4yvcz45lisa2nr3uf7r4lvdd3i2eazl5nwjar@mk2xug4zhb7h>
References: <20240722095147.3372-1-a39.skl@gmail.com>
 <20240722095147.3372-2-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095147.3372-2-a39.skl@gmail.com>

On Mon, Jul 22, 2024 at 11:51:05AM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..8971f4f5d339 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -320,6 +330,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->spkr_iomux))
>  		return PTR_ERR(data->spkr_iomux);
>  
> +	data->quin_iomux = devm_platform_ioremap_resource_byname(pdev, "quin-iomux");

This should probably handle -ENOENT (or -ENODEV?) case and set the
pointer to NULL.

> +	if (IS_ERR(data->quin_iomux))
> +		return PTR_ERR(data->quin_iomux);
> +
>  	snd_soc_card_set_drvdata(card, data);
>  
>  	add_ops(card);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
