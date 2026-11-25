Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632600;
	b=i+lMmbfgj9WsuPH8v45aidl8hR6tCHx1UIf4ZtCE9dbrxX1pb+nhpAwXg7IyhBkW21ad
	 Amx2dEQeDYeaOPE5S/EfWYA3RwU6iW7hGOL3L1K0NtK27Pu56mABHDqzesR2YEoHN4vq2
	 H6M622HiDFG3i1kBuQz6U0cEHa96C2ODKoDX5Qk3D1f3hoUUFlX/QctSE/uFMF/gne9Qr
	 PU/vW8ToeZeyVXBxOeIF4IORFrxom1nRC1W1fBMdMO7fqvqFPB6jGv9FMkpcoh1+JlrqT
	 X0sQ+2xC2zgPgTLn1MRymhAjdBZ9+8HLZxP3oCSad4u3qplcVefr1Y6pFOeLU0i2s6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
	b=MWTijyfm+U+u+HX7KGVULlIka9zUaDOjPWhjeU1KiB+C00W3Ey9kvBDeK6zJv1470hzc
	 zA869M+HlloTAdIK31JAlJR+T4qqq8zLrHGA1GmysVRsmKMT9/+DstqhWnM++vKaUBzbg
	 6rSvpV2HJrh5SDVYsPlmwgLDYCHWXhYM/5R8l2eurJ5jNOiwntilFYeZJ8EmkLK7hMf2h
	 3RDbCm84qmqN6ZWz2LhpTRkIZbTUvv+oo56nLwwTLak93pNz4Kn6wfOv7ImnHzBT67rGT
	 WeKiL9qNEvsGLyo8EgtYUFtu95UYfJhrPNozluE1svXebmze72tjpWZ/Z8Dx2x73zBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670FA606A327
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 18:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670FA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3864755f8f.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795632598; x=1796237398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=PdvPemKwVto01SZ+tm7zotUP4fvFTPNg7Ws6EaMlPmBd0Db2HSC3Dmj9UppBpaaUKo
         pFWHbBtbiECzNwsVOzrhMIMAqY5XnABvQjLc88+eXiHu+9DtYdQdvk5NTqJLwRCbtwhb
         9CNTbsCeqQ3+wN1pEqxynB6E6qxkdazrMMkCI7XxNLdDI4CX234R1AmZaQjCbneEnnD8
         /FwlXspWWMA8fxZCFfeaiuVdCjuEt80qMHAeYBoBnk/9cpeIc68WmsJY5qmniCed5y2X
         eIOy36OI6bowksUmZu6oRwkqKgbuRoIzwhRc8vHQCeJ4XTcl4dpC9M+bL+DVuhVVrpBN
         UVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632598; x=1796237398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=TwGznXgGCEo67a3zSxAR1mXCyQgZjVgT/tfcI0eK/1WQHtCKG1U438yP8XPoXDIq+n
         a0yLbIEDRCK6IsSh981PAoRB7KX6XY1CoBUkogZCXJpX4FpNmeXjui1lgIewxsg8KJmr
         xujEt/kn3+fcZZbVti5eph7X5m98dstsCHFZMzmeUOZZlWPoUtNAjPmNkwkP1kFPs/kL
         KmOkD7lVlr9agGA0wFoSLF/cTT0dY75E+L9lz+J0SvoyZTl9oJbTjJFw84vI8rO8Yuws
         +H+YBRdyJR7R4p7Ur8KN3tVX5Zk7Vb2gGxRUkwDmWm9yQAkl+x/MthiG/zaYeFZ7pPUD
         A4Hg==
X-Forwarded-Encrypted: i=1; AL+hErHJAmUVcVVDq0Ww+0ZI8StDbE/L2Zf68pTSF/MNSzTCuM8dMgmmg1oQLQk+N/MZr11TzF31GSCaCCrTxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z98upDvHIvEQKdLsShfFevIiMN6D+cuZq8lqGB/ePlJ/xxuGY+e
	lu4DJoZuwZWJFmRY8qCLYqLizUj+3E6221TQNI9y1qvyYJXfEXd5RzojsHFTxY6NFys=
X-Gm-Gg: AZFdTZcOW0lEvWeMAZ9c1mI/JpsrkS7e6GkjVUEEfJLX01DbXE5Q0QlKkcw2gQIVpsX
	2oeY0Sfm+2uOEXRXYCf/zqEgFZ3IrZJXFEyLQbaeoEc5/HOj5cVmPks0Ze9eBVjGjgkI1Gwqrjz
	pUynoAazTdAism9v7Yp3uxZiPxkxfceCRvBu+qYoji+WwEyLc+tJhTAuJOw/7rx8mhDY99vJ33h
	jr7TbAKDS3KFX2jyA2DFSPikAf+NBDdKti9a8gWnZ0Hte0AeCIB8kpN27fjT2qDB38zVpko8XZC
	q3TMnASOnq9ADdYtvecxXWgZbiwi3ha6w6cJDZoSuSL6akdBvvKaFtyB+sPhkzz31o7N6t9XrXy
	ubGvkuQjdc8OjUU2XS45rAWxQMODKgIolzLMlFWZtHxs0BcUR+3q8MBoqnc7gYzsPPpuZYjbwUq
	54l7dF/4a4/9pGeh/hNEnBIQbGoX3eeJZvgy5gaSSvIVxlCphMZHIe1VEl2UdtgS/s+6TGGHYJo
	5aFHO25SFgnvCq4Gfns+PcO23XbNgRFSIVfbcRXss+b5X4dt6QVQpt2oor4bRcuf685QgPi3Qja
	5Q2i0ont+xR7efZ7p5Cq60XkWeVUpF1dnAks6aQVyxfdoJRlYI16rhvJdHCRhDxQ6kmwBVGf9jA
	irMeJ00svVQ==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr393393525e9.28.1795632597466;
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:84b7:1ee8:d497:908f? ([2a01:e0a:106d:1080:84b7:1ee8:d497:908f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm555244145e9.3.2026.11.25.10.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Message-ID: <9dcb4721-a756-43b9-a8c6-34922dd4a115@linaro.org>
Date: Wed, 25 Nov 2026 19:49:56 +0100
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
Subject: Re: [PATCH v3 2/5] drm/panel: lg-sw43408: skip backlight updates when
 unprepared
To: david@ixit.cz, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sw43408_backlight_update_status() unconditionally sends a MIPI DSI DCS
> brightness command even when the panel is unprepared and the DSI host is
> powered down, causing sysfs brightness writes while blanked to fail with
> -EIO.
> 
> Pass struct sw43408_panel as the backlight device private data and return
> early when !ctx->base.prepared, matching other mainline MIPI DSI panel
> drivers.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 92cab6478ea61..7f7d7b6b17f61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -181,20 +181,23 @@ static const struct drm_display_mode lh546wf1_ed01_mode = {
>   static int sw43408_get_modes(struct drm_panel *panel,
>   			     struct drm_connector *connector)
>   {
>   	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
>   }
>   
>   static int sw43408_backlight_update_status(struct backlight_device *bl)
>   {
> -	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct sw43408_panel *ctx = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
>   
> -	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (!ctx->base.prepared)
> +		return 0;
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(ctx->link, brightness);
>   }
>   
>   static const struct backlight_ops sw43408_backlight_ops = {
>   	.update_status = sw43408_backlight_update_status,
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
> @@ -202,17 +205,17 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
>   		/* HBM can go up to 1023, stay safe for now */
>   		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
> -							     ctx->link,
> +							     ctx,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
>   		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
>   				     "Failed to create backlight\n");
>   
>   	return 0;
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
