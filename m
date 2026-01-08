Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1883009F6
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894208; cv=none; b=SEtjDbS8dDGqGm2lSve8iu1vr3RDsciWCfHAT/8g0sQFwTUmm6ZeN2eli4HVVZ+gMA89/wuLmOY3aNHYmRB09DpsNHgtc52fOEGkjimLitdVs8HOpVAbMqynNdnrrnQxZrJnb1s9F1fhhhfK9ZcvCLfjywaJOnzyzu8CT/D+gmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894208; c=relaxed/simple;
	bh=ZcQNeKDblC0togYftGoB5YI+zH/8WuW18RQGgZRkc8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+VeUQDdL69OfEFScawXIwvsBdyQRMpM/CV/IguJnULdcHPzFFK6/d1lOSEpf1kwJuFLI+FasHQWAxSTtuwFbvHf833v2xNnKRgFaKrdg7wXwN6kXK4+pk0Dzg4OYj79vg/p2w5EQQ1NFC5wqYhYN9aTr2DUsyWVH2gAsPGhmwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ige6Qd/d; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ige6Qd/d"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7baf61be569so2331377b3a.3
        for <phone-devel@vger.kernel.org>; Thu, 08 Jan 2026 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767894199; x=1768498999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vCNHB3lCIVC67sc2QISk0+5ANY7HH19lb+3n7pNN738=;
        b=ige6Qd/daAV5GbVO20lE0AxRwKfPXNLlgSyibasoqtH48yRQm3rQsk4U6WGNX35jRF
         Q6RP+yuaJSG8PrzDt64B/YhKYFFOnT1XmdfpSLmVTjVXf6ulgT9a+Cywm4wwkSyRAcpZ
         DiJoN0pJWWZfh1iWNiug8MjhphCjaN2weyANk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767894199; x=1768498999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCNHB3lCIVC67sc2QISk0+5ANY7HH19lb+3n7pNN738=;
        b=VgWzoDF2uI3sfIFb9eUCKkmQxgXVBsnbGQQHUIYjDZa/ohrb0sQkUn7OUaZF4UnHoX
         ppt6HE1AeXMcMR+FYQXJ+Fo7cF42aOPxb2qoCDiOueibKdOqyJbAK+tEx8K2jdftXWyg
         piVd9DVfgzcrdI9Nmkjrq5vFxsO+OBuDagapzU3UZ3f8Xq/PshgP8poaUBC05CQ/hf1f
         1vp8LhIX9TrkfkrzwR5nKPiXrh21d0hQ10Z4UHod/ptrw78HqhjTqoqW8Pn3qypR97Dt
         fhbLFVFQv6Eak3upWET/AU8Z1N5wdLBoY+Lr2SGGdx+fznJk6h7TsbkCO48ZO+u/GNrk
         joFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvo66t56USKkME3n3Xs5EfwGvgguR3OggM/8nzF/3EUCN00nyiGhL8QHN7csTzCN/0XcwA1VMFva+xtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY9/CL09o777wN41BDIb7ygCCc1Zd/+RGXEDi1NciKvIx/aS/K
	Ou4pOLcOoczcKxSrgIe7Hs4JVw/v6lqDBO95EuVqe8D13SbTZgrCQFwG2vtnG01KLlpbcU4Ektl
	wMx7b6AfaoYDxU5OOn7T50k67cD22cE/AjWTSL3Ml
X-Gm-Gg: AY/fxX4+VKtIUTTrj/HHakWe4d8GNRrAeesBZA9ALlV97cWb+B0gUYYzg6TGpw+DayV
	3EgorAJvNsXFSEuCJqh43JQHJRt8ePXGCg4hAUFMDg31Zw/1pVGfO2IW8ge+8VDR8r+NEPz+rlp
	ZvkuYblC/1a0qvG1S+E2xhreD8cck9PvnU41vZonL2by5CO6q3BIagEsaLb1maPuQuzd6UacO0/
	aVEQ4b3dc12Jra2LeyIJ1L+47EVNku5cC/Akg4fv0fvk9zD3YHKJxlkBJ87vK0JG8rshuJmwf1J
	9MNZ
X-Google-Smtp-Source: AGHT+IFFi5xC5ddFn0DjhbM5af4f+yeQJYolLLy/wXfDituQyQc/NJOZO/Q3IfIPaZxrtCjn6JSYcF9TOWejlU4OHmg=
X-Received: by 2002:a17:90b:5884:b0:33f:eca0:47c6 with SMTP id
 98e67ed59e1d1-34f68c27d86mr6334495a91.30.1767894199501; Thu, 08 Jan 2026
 09:43:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz> <20260107-pixel-config-v3-2-02a25e3fdcfa@ixit.cz>
In-Reply-To: <20260107-pixel-config-v3-2-02a25e3fdcfa@ixit.cz>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 8 Jan 2026 10:42:20 -0700
X-Gm-Features: AQt7F2rHm35tMBWaCsi0XYwhBjdfX0PJ8OUZIxci620AxRMyQHhZwuKgpcYTASc
Message-ID: <CAFLszTgJyqYvwyb=KCtPmEtbb-aOP44seR32kufvB8jn53T2Dw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] configs: Add google-pixel fragment config for
 Pixel 3, 3 XL, 5
To: david@ixit.cz
Cc: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, u-boot@lists.denx.de, 
	Petr Vorel <petr.vorel@gmail.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 13:28, David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> Introduce a fragment config for the Pixel 3, Pixel 3 XL, Pixel 5.
>
> On these devices, U-Boot is chainloaded via fastboot. However, due to
> additional requirements added by google, the image header must have
> a specific value for the text offset.
> This is solved by setting CONFIG_TEXT_OFFSET to 0x80000 in U-Boot.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  board/qualcomm/google-pixel.config | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Simon Glass <simon.glass@canonical.com>


>
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
>
> --
> 2.51.0
>
>
