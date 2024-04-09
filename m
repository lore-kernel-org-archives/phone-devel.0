Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E213156F29
	for <phone-devel@vger.kernel.org>; Tue,  9 Apr 2024 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712687968; cv=none; b=t9k2zhQobCYdu9p/0NYHkzYZBclQnLT3P1YdAEsDXMVBFElgQ4bDt7/bMA0ixlUXAaCQhX/rPD4E+0Fdck5jOGf003aVYtmAIxWreHsDRHYrz9utCrwYj7l8IBAdO3xYRaow4cuAqx93ZrRjgXxn/akZZ64ZXVm69l6U6Nwknsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712687968; c=relaxed/simple;
	bh=BwPr7SrsQf4b7g+pojJ443HjHLELotWIZE/wilGloq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETYkLyNDPQYmZFZo2Z86bhcdaMYrEJ2hsKoG5Vo4l39nqK7JFaoL12vewcwh8RibxW5jtGirRMvKzwdOPJVTO7pXTMktipHl+34ClcDXEidNJ33JPrICa86RsVMBepPVOqDjojUMw8X86QCWOIbLCwTQmZHc3V8/zecyu+ZB/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+7syKAS; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+7syKAS"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-617cd7bd929so52778817b3.3
        for <phone-devel@vger.kernel.org>; Tue, 09 Apr 2024 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712687965; x=1713292765; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hAdR0lfI/Ap3S0wzwjpUHjQuKqdM6aVtl85wb7tRnRA=;
        b=O+7syKASBx2JiFlsf6BUFWTgvb8hzJc1kYl/sTbv+8cPiBaRynz8Gbcm8FlAELTX+m
         /l0SKde+GrmSENTVJydNz3kLE420nx0i+Ang2TYm9BI0i4Yvbyj/6XrOEBaabpfK7TLp
         nR1+C0huxdZbrnNUdWg8Zdsq+I9VsFm/B8NYahsJpdIQ1cGqzlWHw/dUtwt5LaKoIVJM
         FZF7LiqqdVlwwV4gqB56ml1T7x8Utc60xBYQcFlNn7wj+z2UdvDO6UmdkqWHMeyGmBf9
         5unKzwqIU0O5N5Azvb8EvL7u151ziPbwU1i4UJJvP8NhcMY1OL78frGZyAGXGT38yvOe
         moGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712687965; x=1713292765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAdR0lfI/Ap3S0wzwjpUHjQuKqdM6aVtl85wb7tRnRA=;
        b=nGbg97RQ9voOb8MNqLcidHLgwFMK34MEBVdW62/7ZYKgP5NPMzqmp+Z8cUak5bXLaw
         9xAmYzuZbTxqoj0Sk5gvWz2siP0BxdECbG8nWSVVLeGUz2/PumR7Hyw3/IvvGdJiq70p
         6XS3y3vsC4yfA5vmDM8dY4OFiOscPqQ7mC5YUzi5uguNghQEg+YVn4kvsow6fXWM5Ggl
         aCdZGcm1hHzs7YnMrwiMT8zTsGoKvLdzHO1+yzNHUR7k2Y3xrO9Ar7Ps7GIAiUAbYLB9
         9clNh/g+Q7HMdIKb/Jlv1nHDmwuPGsmCvOSiBhEphdOm1O4zKZn2MrdhBNleVKCg2g+r
         urAg==
X-Forwarded-Encrypted: i=1; AJvYcCXIaEAPYsbB2q0RuiiD7mDWudXZ+LfIBoARHF+PdLtQJKzxUP5s7j/d1iCp1jQ+Gk8SUCZCvEVD2yQjxMYaIkJKigs+7Hjy0kC2cnc=
X-Gm-Message-State: AOJu0YznhWv5uJCL4+aN/VGBxGQ4nEa4pRcA9v8rsd6ICFdjeiGOwrjE
	p51Xnx4RST739qRLRDdZy5254XcRPeZAdEig3P8u6kk8oyiT+PGDwVeFYh6bj+d7WwHgef/o8P/
	wiFvLgkEbcxF6WsI8hj8cSdNwjsR05BTt0ifp9Q==
X-Google-Smtp-Source: AGHT+IHq5NVO+WfWmq3XyvBYt0xQLngoIVqzHjLiDg5l97bez8m7/Sp8OhTA5vGPOslEtZDyb+Woew1HHexx4xjD/3U=
X-Received: by 2002:a05:6902:c0b:b0:dc2:1f53:3a4f with SMTP id
 fs11-20020a0569020c0b00b00dc21f533a4fmr750553ybb.5.1712687965237; Tue, 09 Apr
 2024 11:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz> <20240409-qcom-pmic-gpio-hog-v2-2-5ff812d2baed@z3ntu.xyz>
In-Reply-To: <20240409-qcom-pmic-gpio-hog-v2-2-5ff812d2baed@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 21:39:14 +0300
Message-ID: <CAA8EJppzfBbTi7htJDmMowtXXTi3ASfzQpEpkCjPngBFH=TE-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8974-hammerhead: Update gpio
 hog node name
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 21:37, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Follow the gpio-hog bindings and use otg-hog as node name.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
