Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695D4A3D24
	for <phone-devel@vger.kernel.org>; Thu, 24 Sep 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280043; cv=none; b=W2csXsvIMeH0/cdLwSxhEodSoX5hxGBKqSzi5ZfDuEYJ9WOac4701l8OG2fvW18c1q0763TRfptip8nSQrDWSl66KuZVZCPgUHnvmyrKlo0QR//wsaP1J8ykcn4F72T1m+vesjZN1p58X/RXlncARBdySmD+85MmYv/9z30+ZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280043; c=relaxed/simple;
	bh=800XYnUFGFmLVgaPHONWcqohdi4VWbF2CAwETY0CmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzh0ogBcaOXnKuvrAFrQUZ+jPghhRw3ZIz97OLntSBtGMvox/iupI8zDlGcNNw0f88DvQllbaaZT92HQQWYqbXnTTZUvMrwWedNIz0vI5O/Wpc+DRXltqcKHl0oi62PEDuz4eoWXwoK1RzD3DGf3+skdFtTDM2gQeQaMp94qXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow6egLXd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow6egLXd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso2631195e9.2
        for <phone-devel@vger.kernel.org>; Thu, 24 Sep 2026 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280040; x=1790884840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=Ow6egLXdUfKSeLXNcN8inGMHH3j/Nv1eS8h+/efytKaVamRQ6LVbRzuFW7soKKy3Ob
         mrqn0EFF9pmnf0epea4MS0EuJHFitUwlwgFN4VnkHG6VCEyW9h9BkfLdpPIcmNgXk+Ph
         GRzHJN6GAgwoV397ugVtvyZuIm1sEX2dWCKER5AzJ7PZrOJ4fjz1ABPUG3k1HVbF3EGC
         U78OOQc46HLOLbHoAU7+CGYKUNRxbegg83yCO3/K42ufzixIhwwb9yacysP0W8Gf8M8g
         eajEAlBZN6RN3lvbKiAEgkkNii9A99u20tuIjfBtoVYMUPsSAi4in0VRvJK46Sm72eRK
         LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280040; x=1790884840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=wQ9qlhOpw94eRBaJfrI/sHFT/DoRMkNQzye1YAtoALK4PnPMRsJhFYZ002dBrkK1DW
         hI7jhzBb5xsrGxbQDjFJBdQbPLJ4bzxp+Q0GR9ScNG0i0HFgHLjlFifl5qNUZIsWSNp0
         2G0JSJ4/EtZEovqfPFB/jQ3eMKXFUEG0Q+H6aIev8XOJE1HqX2V8nvjv8Q6cVtQ8nhbc
         aovxAbASzwIZzsNJVQLRhFyeUHACuUX3pf2xGuLj6qte7snpxCS1WzCDVTpe/Xs1Yot4
         1qCdf4FRiX4SLCI+dUKcftV76RLCU6d+YW4vcR3C+OtCePfdXsPkm0dMjTTgTEOsVR7t
         7sDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9W75dGszRrEX8pJh93o5q0nD2xhjtIBej6fq6rocxtVsYaIDy7nQ8auzGdUBwQFFC9jC6FDogrHK7dg==@vger.kernel.org
X-Gm-Message-State: AFuF++l8bGHjLOHaXslEUDVwu5u1pET3QuiNRtersQYMaIjDCid6X7wg
	Q8orPcjcXuLUohCsl9UB1yZ2KS2zRlevkBN/sShlSGw4cKnnJCr76TgD
X-Gm-Gg: AYBFou1IQIiazzAnsJop68s+ruOOdepucqA825WREdX7fZAZDeoFY6njYEKmDrw6Hze
	RmY2Z8dGewKodca8kbZolj+G/5fQ/X8A+0uLzID4/0w7VhJRjOwVHK40Z8cgrtUdmzqgjhte6Ly
	3ahJeYl4mQ9Pn/TaAdJ4TzwxRlctyhmGwCu1mSZfyzLDdbRYSkYOxt975s6+HYzPP6ksKVsPU8Q
	Jhfufmlgs9JtavgIv5nFlaSpRTftX12ZctBU1bV2++lBRCJNqHTvJHVHgErYjQdK8N8sJOC8CLd
	PVN17w05R5BKZK/eTs17yLr9M7n90onRWQ4YsyNw30+DHkrpBGDPH9NlrI0soIJvogRxa3LolS4
	W/MC28H8R1KFjtFr+KYGpZkQ5g9pqZkf97fzM5MorVVIpl+1gjTDDez4IByAoExVH8WhwblSRyz
	6QkH3v6BhrpwB5uLT+b6h7fqDwPo3NLO6crhoSWRIS9KWPl6ELywNfJSfNuhWz5Ad9uXv26iHCZ
	2B2Gur6ZTuyUslrXCIe6zeOPVB7muH7R9s=
X-Received: by 2002:a05:600c:6207:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fe66ff476mr67110105e9.27.1790280039460;
        Thu, 24 Sep 2026 13:00:39 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069ceebsm1872715e9.3.2026.09.24.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:00:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:00:35 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/panel: s6e3ha8: Really assert reset on the
 failure
Message-ID: <20260924200035.GA194087@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>

Hi all,

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> Due to incorrect implementation 0 == asserted, thus when driver fails it
> needs to assert reset.

> Minimal fix for stable; the polarity convention is corrected properly
> later in this series.

> Fixes: 779679d3c1640 ("drm/panel: Add support for S6E3HA8 panel driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 078523df48860..835121b322f4a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -179,17 +179,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>  	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
>  	if (ret < 0)
>  		return ret;
>  	mipi_dsi_msleep(&ctx, 120);
>  	s6e3ha8_amb577px01_wqhd_reset(priv);

>  	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>  	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
>  		goto err;
>  	}

>  	drm_dsc_pps_payload_pack(&pps, &priv->dsc);

>  	samsung_dsi_test_key_on_lvl1(&ctx);
>  	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
>  	samsung_dsi_test_key_off_lvl1(&ctx);
