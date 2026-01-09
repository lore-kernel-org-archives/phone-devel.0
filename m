Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86631984E
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767992708; cv=none; b=apHlyyynnjWt16LTmv7ENTHc5VYVFUGDULrLHZ1Cd0PUULkGj9SnHgwhNcIHsWqsf7pCYBgkB2URgvpjomRM0HhzQd/p6WEjAeuZZk0sQdtfN8OiKQ99TW/WUcZXcCa9fUBJZr7fVvWUr5sM7WeTHO3T6xL50oKksuGt5ihc8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767992708; c=relaxed/simple;
	bh=Jx001Gjk5byTh/JNhBm9LSIvMEMN1PQnYcManLzCvts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5Rn8MyNIAzEUDUJxAR0RibjHxNpHI2ULE8GCI4ZBpHQlLztCPqzmG4bcB/VqSvDt6nBDKkvZePVlSE/OoYst5wyUOy8d/R2GcsnvuYA6/Prg4gN491D52B7MxqEfU73MpN9GBJ9XG1uNCuqaVuFj9z35HxYPDLSj59pNs1s+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLJ0MJ/W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLJ0MJ/W"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so38560375e9.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767992705; x=1768597505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY7PcYrtAxG4VqNQOc4JV3SfdlaH/jPuUtHmha5rUHg=;
        b=iLJ0MJ/WTjlzxs8WqXIchxg3PCS+PcKThs/hJVX5cUz4nrjcXyCfZvJ6Nf/Ya5olX5
         gidLdCkgXaRw1nwI9ApCOHWhz11pDV89W9zQOCZ/9QzG6yWxTFjacn6tfMEyE4w5ZOkU
         J/Gp4IyqlBZaGNayIdkpono3bvrADlenXZy9JnMvdFiVz2cb7msNRALyIWh0V7o1HHts
         WlmdIZvBF6quGQ+NIGpMjAVLx9xgVKijkqnou2/DM6e4Iiwpo/wbwLZnk/7R1m0Ry9xb
         qsJgAXALoaXqqmlOdpBBAGEcz/JPSTww+FlUS/AQIwmCBBIxp6gp7CdAhWAI/UCPpH0o
         twjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992705; x=1768597505;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY7PcYrtAxG4VqNQOc4JV3SfdlaH/jPuUtHmha5rUHg=;
        b=nq4qhOapzgoxKjamurAkOQRJT08SAPHgoeeAjmgFuWTpV7bi3jeBVxet//36CmfMVf
         gT4aDMAICyX7x5Mpj8X7KlbrxTCzpG8AfbepwoOj/deRDhb6hl8/j1GUGBZ6fMb5z6YW
         z7gvesN/EXuLHQRixFvZgEqTB8gD9Et9XsG39EF/un+001kahLrvyRn4DuI3f85fi/LV
         hGN7/IdIgaeLsMs5he8H2Omg0KHv1mfPjln5C2JvJaYFN+WQWdgrO/dZCLfXqf4k4zTL
         1TvTkJPhe1dw51r3yq7blEwS0uxc1O5bW4c/HGfjetzc2qaC7G78kfytD/CiY/QN+S3C
         9ViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZDKyLK5R68NL/mwpJteqSwbte6glSWSxtxok6ulujn/9N7xc+nuvZJewk7iKCDpw312IqAWzmcCou0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YydYMzQV4PzuUabb3MPsGGTolw9sgEaDxMfsf0EOBVZhMqV7R+F
	vUEPF7ar3ykYG9YjHn3xjC4uuqvBS3XZa0PzBtDlfuZ/XC0euXkZpUYt
X-Gm-Gg: AY/fxX6Ra2w7QGAZ5RsaKenDNgKiKozursi5urEWjmW41kKmnpVBgrJiyfjHgHc6jcf
	D/s9PODzhQAvUKfN2bpQQnhEc4zKNbN9DRRRg8+azSAXixSpKKe4e4X7EFVwHvrl4jinj2wehdo
	sFKl8uixptOT7e8oH9S092eqJCIfuhhdutma+uE1l2pidfoQajKiWYGirwp2M5QXL59bPqhQNZW
	/ZziJkEurovfJDtvFbLtRl17NR4OfRW6asaTlX4SfE0objyRqVgy83f3TnZtMPvyO7lrKo0AEv2
	Cuxk3e9IYFa9ayhCZRHpQ8lZcChSp6B9c0eowdG6f+ZSIzgMXrvXxb7jKFeNq98n//0a8CE6cgD
	NIZ2fIxFs0kmRd/Bzs64inlnf7iSOINRPG+ObxDCSMwzvBjCNTFNzpqYrvKyHsNzUoOgwaie0A3
	DrUJiIXzWy00u08CvVPYvYpnQrOGo3iwVX96R1X3TlxtKIhyvw
X-Google-Smtp-Source: AGHT+IHdI7W0Gnaxz5WrYkHIDSlle5KiqkYcIeY+eBK7zSr0o5F53BUSFNiHrXhvpqri2QnP4xitfA==
X-Received: by 2002:a05:600c:474f:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47d84b41294mr119773275e9.25.1767992704938;
        Fri, 09 Jan 2026 13:05:04 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm221687775e9.9.2026.01.09.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 13:05:04 -0800 (PST)
Date: Fri, 9 Jan 2026 22:05:01 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: david@ixit.cz
Cc: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
	u-boot@lists.denx.de, Casey Connolly <casey.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tom Rini <trini@konsulko.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Simon Glass <sjg@chromium.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org,
	Simon Glass <simon.glass@canonical.com>
Subject: Re: [PATCH v4 2/2] configs: Add google-pixel fragment config for
 Pixel 3, 3 XL, 5
Message-ID: <20260109210501.GB140231@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
 <20260108-pixel-config-v4-2-76a2212b69a5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-pixel-config-v4-2-76a2212b69a5@ixit.cz>

Hi all,


> Introduce a fragment config for the Pixel 3, Pixel 3 XL, Pixel 5.

> On these devices, U-Boot is chainloaded via fastboot. However, due to
> additional requirements added by Google, the image header must have
> a specific value for the text offset.
> This is solved by setting CONFIG_TEXT_BASE to 0x80080000 in U-Boot.

Yeah, to workaround for kernel change 120dc60d0bdb ("arm64: get rid of
TEXT_OFFSET") because trying to put it back [1] was rejected.

Thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

[1] https://lore.kernel.org/all/20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com/

> Reviewed-by: Simon Glass <simon.glass@canonical.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  board/qualcomm/google-pixel.config | 5 +++++
>  1 file changed, 5 insertions(+)

> diff --git a/board/qualcomm/google-pixel.config b/board/qualcomm/google-pixel.config
> new file mode 100644
> index 00000000000..999d4e45268
> --- /dev/null
> +++ b/board/qualcomm/google-pixel.config
> @@ -0,0 +1,5 @@
> +# Enables chainloading of U-Boot on Google Pixel phones using
> +# newer bootloaders (Android Q/R)
> +# Use for following devices: Pixel 3 (blueline), Pixel 3 XL (crosshatch),
> +# Pixel 5 (redfin)...
> +CONFIG_TEXT_BASE=0x80080000
