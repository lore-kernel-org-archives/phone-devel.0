Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420043;
	b=VH//7ppg8ST56JVjhV1NvcQH+6fxXcuiCHsSba1ENr3RU3BMCO7X8kV7vOjnODR5PnMy
	 Nw9zOkTcAZkEz0XEbgQlSRjytLjbtWTCVE+tyysspOtHv19PC7iyJrUm/hQ3itwt8D9/j
	 GAK859kDcbe2EVmP1q+s24Zp5nXp0P3WZH/bAuEj6fQinsb5/Bq/VqGK1P4bvxGno35DU
	 oQZT5R7QsE7H13Le9bwwx264f639Br1v1jlXlZ2bqOHQKPSmbBies3DvYAHj9t/xXF1zW
	 pe3lZBpZmkScV+5cUk2pbMP6mI/7SdxVZb+QOF7/8zYIbLvZZnYxFjHzt/tuWOZSy8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
	b=NqZ1HxmGxcZZRjL8EGc3p3HZg4JOCtuDE397/hN1RtJjBfo/LI+cHIl/of4pEdGcHRrS
	 /Fx40bDk98pxem8EGouHmGvRpIQZNU5d44enB/Q4B8raQt0JYo+XKtEOIiky3bbOeUrSy
	 R4Pu5CLc3F7MzDASAmsvzc/hOx7wJWmAtLVEyzeQhGmmvFsDpNFymzoWhd30c+pBgcsx9
	 D2TRf7efAIflM81sWXA0a9zG2lVL2nyyEeHlpjlyW4ktz/hohI8OIgUSlOIWti3QH8L+A
	 cPI0J7fJX59BrFU/2LfW58qLsyAKSGzrtfcMydMFG1ZXv3wPRjYXiLLwxjPl02/6L/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLhevcER;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861F606B755
	for <phone-devel@vger.kernel.org>; Wed, 11 Nov 2026 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C861F606B755
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLhevcER
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1726645b3a.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Nov 2026 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420042; x=1795024842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
        b=cLhevcER5F0cC1w/qvx8koU/5KEhFGypHAezF5O9BGPPNqIeXMakQ46AM3CgshFBIv
         Giqd0YQJGavVCxRE9Q9DKotrEQFnTzzTJvItuYlhjXZBq+xM5+WNEwhlTdovfwLXA5EC
         mM+hyPnIzlg3Gw79i5YO55EkUhlI6WrGVXTbq7M5o9i/Jx8tNf42NUwD/TcktzxLSwo/
         7me3Op8YcBEwnMQSEHF2BhTC+V+s9/fFQ6Ds/Cg5VDkufc/QRv2WOQEQUafqfwvPrM92
         1uizui1kOGViIYLowAmaZXoxuLAfOFV6yIDMb6B9GO6N1lRu2Bf/NfS0KH7epcbfdYoF
         8pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420042; x=1795024842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
        b=XzVM1YplJMVr+waZUWMaK3BnBCXYPbJ6OS1qpdz/pVqEJpP8JlkoUJdaLFJPv0EmKz
         bP9tEhjKwdy4Rk+ZMA80y85M59qGtgEykacaY+7yEsSo3BhXunfjwqIh+oWEuFChXGku
         onRlrdXqVeWXk1QxCK44uJ61ViL4wCUYv6PyhqdxjrnBVuCBBlLykhp+y7k4wcjAD8u2
         lgoi+5+geyqvj7B+no7dVt60kC6YKt4IJXwOfk7n+mrRdQEoPt2EF76pVYHSyjEBUOWU
         aO0ZFvGBupTmPqdiiBQ6ixfQY5bhh268CuzTdrcfmWIt+KRpuspiMdWd/qBzL4iQUpTO
         e1/g==
X-Forwarded-Encrypted: i=1; AL+hErGQnpk9DSpqA7ZMeh2Ud/Rrw3WJS3yRpmdAT6Nj2PlLUijiUcFJ9JZS6Y4EHuWnsQJSRNApFU2m/BbC2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jvnXFOc6hZkUZL+tcBGDrWk0FOd1vm706H2/3rbpZvbPRiXYk
	hBNCFefxAnd2vAd+i2XNuuVSOhmHhZGIwuVZCbBP+4BbcsV5Wc1C7Tt+
X-Gm-Gg: AYBFou3YaRo0qDxRBE6G3+n/sBpi/KB3+OC1Ur5CBx7Yqemdt6QuCjv4pkR8ry0bh6V
	x4LAHK9KATT57AcGBfMUvrqoeAvx1dN3RVJYJYtEt2Am7+UfeKiX7zq+SMFd/QkTjtKa3ilusSW
	g68yAKgX+baC9r8fki2C4XRYTNPmdsPVJBvQVtCJ67TiVzSeBGtVePmK2/QI62/V8ATuTlb9D3y
	FSRIbgDlzccYmFD/f5CssHkWActpkKjdA6iMMcz5YgR1vZtYftmFVSOAXKdXGUSi5N6jOLyEy7H
	E6CvCuAUfCgJuUMPg3xzI/qrjQjKpPnCnqBkPNS/Fu8Yf3/0jfhqIHtqZOxYnOBxzVd8SmHVArg
	AnODWxgBV7B/urueRR7pe4BdXQAfrggiF7TJrzf52CVRKJDVO+SJjs2n59+gzmRrSIE0KhoJiXe
	Grvt+ah7Z8X+wlISgPskpNmbxW/hWQ16bcYN8HXefLExVGFbH6ldZTDJULDZPRWRp39Y7sRay2e
	O571EqMcJf5yo5tRXL6vjLXkeDe4bWJBwstKBq+ipwODVMljFWR4ezPi6Umf82nOYiakjz76b1P
	oSl0sSETlax5V2SIoYXZnRbkabhE+uMSrXmzdBUUCnzGs/rcde79RAma20KKhQGnaNoZ9/Kete+
	t3Yczvpm4tmitzgsu
X-Received: by 2002:a05:6a00:4193:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8bc1c0b732cmr2911078b3a.23.1794420041911;
        Wed, 11 Nov 2026 10:00:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3da61sm2331243b3a.35.2026.11.11.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:00:38 -0800 (PST)
Date: Wed, 11 Nov 2026 10:00:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henri Ommer <henri.ommer@gmx.net>
Cc: job@noorman.info, phone-devel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] input: himax_hx83112b: Add hx83102d support
Message-ID: <avStFjE4coB0C0q3@google.com>
References: <20261111163354.36751-1-henri.ommer@gmx.net>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111163354.36751-1-henri.ommer@gmx.net>

On Wed, Nov 11, 2026 at 05:33:54PM +0100, Henri Ommer wrote:
> The core functionality of the hx83102d is software-compatible with the hx83112b. As with the hx83112b, firmware flashing is unimplemented.
> This commit also adds support for touchscreen chips which do not have a reset GPIO, like the hx83102d in the Samsung Galaxy A20e.
> 
> Tested on: Samsung Galaxy A20e (SM-A202F)
> 
> Signed-off-by: Henri Ommer <henri.ommer@gmx.net>
> ---
>  drivers/input/touchscreen/himax_hx83112b.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
> index 345ece27fe74..04c9c6aba396 100644
> --- a/drivers/input/touchscreen/himax_hx83112b.c
> +++ b/drivers/input/touchscreen/himax_hx83112b.c
> @@ -7,6 +7,9 @@
>   * HX83100A support
>   * Copyright (C) 2024 Felix Kaechele <felix@kaechele.ca>
>   *
> + * HX83102D support
> + * Copyright (C) 2026 Henri Ommer <henri.ommer@gmx.net>
> + *
>   * This code is based on "Himax Android Driver Sample Code for QCT platform":
>   *
>   * Copyright (C) 2017 Himax Corporation.
> @@ -132,6 +135,14 @@ static int himax_bus_read(struct himax_ts_data *ts, u32 address, void *dst,
>  
>  static void himax_reset(struct himax_ts_data *ts)
>  {
> +	/*
> +	 * Some versions of himax touchscreen chips do not contain a reset
> +	 * GPIO. The downstream driver only resets these chips for firmware
> +	 * updates (which aren't implemented in this driver)
> +	 */
> +	if (!ts->gpiod_rst)
> +		return;
> +
>  	gpiod_set_value_cansleep(ts->gpiod_rst, 1);
>  
>  	/* Delay copied from downstream driver */
> @@ -349,7 +360,7 @@ static int himax_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> -	ts->gpiod_rst = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	ts->gpiod_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);

This should be a separate patch please.

Thanks.

-- 
Dmitry
