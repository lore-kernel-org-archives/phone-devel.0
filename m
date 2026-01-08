Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001C2874F5
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888917; cv=none; b=DYArDD34P0oXJPlxGXdhkkJbHyfYSFd7Sge6GpyNwe9vjcimgKlAY3dC9sTpDerUvi0Qo4SnxwLy0DOIFTrVS1jqfMKPJdgZ5tVHn7fLatHKtlo2KuhbB+V784nWBcrxNsbunKnyMYRhLvBfEJr+Zr8FHNaFL+2npIWCveYP26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888917; c=relaxed/simple;
	bh=j4LAzNIFv1X29crUoE72s1k6VUje/cLuwDzuY/rKTIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNAbSZqv4cn2/8/XJytipg59xc+W+VcN5fm+SE1zABWCe0jINKfw5ftmf4L8uHuDoZE0dbFdHOJR4+EtI88YkSQr/8mmmbIQ5bPNq52jzQLSIW8VVQXzNnGUzSXiJGZI1a+w5oE8UOEsRUclM2feZpLVARthZBvexKbJ2iEn4OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZArFabZw; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZArFabZw"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8427c74ef3so516572666b.2
        for <phone-devel@vger.kernel.org>; Thu, 08 Jan 2026 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767888911; x=1768493711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiQ2M263m7QTXKwLN4tDC8aWCnEeeTKjVpkEGAomMY8=;
        b=ZArFabZwnHRO+5HQOSypDR8Qtxfrhb12gyC94qD7c3L6AuTihTcZm2LKJqDGZgcuNh
         5zi8mzBDxlkl+z2JnrRb9S9B9blq1KU8S3sxumq6/JRRxYg7OXwa2rWi2ASQ8CmHZQSs
         kvhKGWumaOPuyjul47I8NboZt8TiU/XtRxGA0gvEah5CF1HihzeHvU3aNBBM6Jz1R56t
         6vEQSDu5Da8FC1KoSSoGYLHkACifqidzzWQKuAqS7EOVzQ5qJGhHQR1Y6wIOf/FR3mOs
         ZU+PY6pFgXqFPvSoGj9a/mJs3SsW6uA3q1on3Q9qZqb57YX7lhv5p0ICjxr+VM0gWDqN
         0+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888911; x=1768493711;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiQ2M263m7QTXKwLN4tDC8aWCnEeeTKjVpkEGAomMY8=;
        b=wRbuqVReCApLDC/ez01EwQWKqHXWqxZYamYuHTsgXqzUBmDry5ygeBc8c+lz/Y2KCo
         Q89ChY+j93r5/gwLl0Zia82JI1j01kVoIWqI+F/hVuW3o1CSTDL8mj4TH7kCio09uwos
         mDwm9KMq42HBlFQVJNLVYQui+KdhhTQENFOBxTihb/GDOQ+1UVPj7hzdzhQKZWObj7l1
         cy9SIwqRdPKPZ0CkRZ4wy9D4+6nU43ug5u/lrsza+3P4r478h/nkrbaFqRFiUjU6EUNP
         WsOdm5lW34XgNnqyYbE4T5l9SM/fMuGoW7OI5CFGS+yCb18InUCby1Ey9LRK5HhP/WTG
         JcMA==
X-Forwarded-Encrypted: i=1; AJvYcCVNfvFEtZZySnnJxobR0hj90R5nKbfVvT2UsqEppJNgN1lxRnzwJaLle70pO1q9KYwQbj/6cZzCHCyrtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIr7Gp77Etp+Hm/7b0UtSu+1k3zgn4nEpx4b5b0omDo1GxICYY
	1A6Q0dfIlyUrmkhMabmgHKDEMghHGunzEEuzrDBE8e6LSxYacw8fFiCUfvGVHdOiKhk=
X-Gm-Gg: AY/fxX5iKG3q/EivcHNzQnM4qOrhT4tl/JFeTeKYsVHf1UvqUIh010veTsBMTxUMjx2
	6+64/Ofw3mVfXYcUPsX1QLF8KSasyROlOBm9U1K3HXbTG+CdX826+eaCTBrgc3vW1upoCAeEzTN
	NCivORxVXLgLv+jCVSbMqS4BZyOdRfo9yb+joMQbiOLN1o6kMS53Z01Le+DOiB96vl14+J09TtG
	xAmgYk9sYIHwuBqrmNRnAO+cheU5tYUSxwGAtD40nA2mwDdnrY3hRSukC6Bbp3FNaM6Bp/2cXnK
	/EOcXmmx2i2/Pn81FwDxE9G3MruXjnjA58jxQtvsE2JxjSBcwT7STn9kyUO0Qre7PdXSrygss+W
	X25Z34jYVqYMdbH9dxGj29xaTm54zi3Udq4j3zvTDXC9wKKg5+dwRI6v0mlOOKUJbjdPmYaka1Y
	dt5M/B4uFyjI7idJqtJohpAdVlkbhIayQcHcE5v05rB+Uj2g2JKcU=
X-Google-Smtp-Source: AGHT+IGr8gtZPpqzuM+ssayJZ4ogdjVB7iKZX7c1OP3fHg8b3u0L+y9v0plDphOgMi5NRBEGal340A==
X-Received: by 2002:a17:907:3e13:b0:b79:c460:39a4 with SMTP id a640c23a62f3a-b84453acb55mr663991266b.56.1767888911090;
        Thu, 08 Jan 2026 08:15:11 -0800 (PST)
Received: from [192.168.1.36] (p5b29e30b.dip0.t-ipconnect.de. [91.41.227.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3229sm828256366b.37.2026.01.08.08.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:15:10 -0800 (PST)
Message-ID: <51f32da3-e87d-4e8f-b221-0adb9af4bf93@linaro.org>
Date: Thu, 8 Jan 2026 17:15:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] doc: board: qualcomm: document Pixel 3 / 3 XL
 support
To: david@ixit.cz, Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini
 <trini@konsulko.com>, Luca Weiss <luca.weiss@fairphone.com>,
 Simon Glass <sjg@chromium.org>, Petr Hodina <petr.hodina@protonmail.com>,
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org
References: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz>
 <20260107-pixel-config-v3-1-02a25e3fdcfa@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
Content-Language: en-US
In-Reply-To: <20260107-pixel-config-v3-1-02a25e3fdcfa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/01/2026 21:28, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> U-Boot does work on Qualcomm 845-based Pixel 3 and 3 XL.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>

> ---
>  doc/board/qualcomm/board.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/doc/board/qualcomm/board.rst b/doc/board/qualcomm/board.rst
> index 642c5095261..e5dbc9816b9 100644
> --- a/doc/board/qualcomm/board.rst
> +++ b/doc/board/qualcomm/board.rst
> @@ -38,6 +38,25 @@ with appended dtb, so let's mimic linux to satisfy stock bootloader.
>  Boards
>  ------
>  
> +Pixel 3 (blueline) and Pixel 3 XL (crosshatch)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +blueline refers to the Google Pixel 3, and crosshatch to the Pixel 3 XL, both
> +powered by the Qualcomm SDM845 SoC.
> +
> +These devices use the common qcom_defconfig with the google-pixel.config
> +fragment for configuration.
> +
> +Use the following commands::
> +
> +	make CROSS_COMPILE=aarch64-linux-gnu- O=.output qcom_defconfig google-pixel.config qcom-phone.config
> +
> +The DTB is called:
> +
> + - "sdm845-google-blueline.dtb" (Pixel 3)
> + - "sdm845-google-crosshatch.dtb" (Pixel 3 XL)
> +
> +More information can be found on the `Google Pixel 3 page`_.
> +
>  starqlte
>  ^^^^^^^^
>  
> @@ -131,5 +150,6 @@ Other devices with boot image version 2 can be built like this example::
>  	fastboot flash boot boot.img
>  	fastboot erase dtbo
>  
> +.. _Google Pixel 3 page: https://en.wikipedia.org/wiki/Pixel_3
>  .. _Samsung S9 page: https://en.wikipedia.org/wiki/Samsung_Galaxy_S9
>  .. _DragonBoard 845c page: https://www.96boards.org/product/rb3-platform/
> 

-- 
// Casey (she/her)

