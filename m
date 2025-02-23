Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F641607B4
	for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335137; cv=none; b=s4uylTWH42bAzwEcBxpJL+hUHHQLatM5sOVGniQ07qw18stjOQHc3ivw4v0uSTr8tiWAILoezBSRn+G5/bc2gjqz1+RKLnALednppwBq7hFl0sWFEoDjKRS1OwVfr88xwX8PItftA/8IufWskLn0k/QkKGMYQJ+FMu1/HB5eTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335137; c=relaxed/simple;
	bh=IebdohvZSQVB2m0xM8vghThlOlO40yKJD09EDoioSGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/uI2OzdSAUEBKupCaKqCMgWIcfkmipkemAa+Be2qmxn7G/0bZ71MDFR2eNwoMk857VwQQmNoB6WZaRJ825fwuzZhXZmKR2DR5z+R73LY9//aZ4iunUW6NFwvehYLoWiJxT1yA0lZlMUr25ZMwj+1DyEG72J43VGYLjoyYqdo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHtmnjkZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHtmnjkZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a2f240156so36800391fa.3
        for <phone-devel@vger.kernel.org>; Sun, 23 Feb 2025 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740335133; x=1740939933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
        b=kHtmnjkZEQEkeKO+kQQ7+rM2m2hLtegoQ0KyhQV89jmpIzFcerpFqBB6op9EdofpjG
         wRmsu4NBF4N1AXrpnjTzv2Fu7o2Kbg+wslGVJXPUrhIoqwl04TxkEXGfFy7UMwiU2zg0
         Z33ON6AjhWVJt4qd8uZZ+Z174Y3l3hMKl9lcE3yrM7hgET/hJ3uWewxcK6KQfJWcpLct
         U/OSdfT9sSLm4aRfd4T8w+JGds8aE0QgV6/jKVIlmk8S5iLI4c2ns0rEhCT8D3D//DWh
         0b+7PEOV5XGffnhKpLXKkrh7ZurRW2SqjFBqfISeuMAgRwX/QbqQ4jhuArK2vmGACvJ8
         rT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335133; x=1740939933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
        b=cqaqQsT5gxa4gFZExELFBgnC7wqgxlBJygVrATbKWoYwvLNdplQMs8CLIuEgQfihrY
         UsfTf2un7o6YKRbiGR8//bZ7mM0FUgQ+EjmxAy+SHmPq8wIcvykp8lzYPb2FrcMcX6nQ
         iTqPd//koFqBDIKlnlS1y2DBn+oXOH5xOKejKrCXi9kjVc6P5KD6S75sjRcSjLoETaxA
         rXx+PMXfxeRgKjUcCdBFIWI3PzrfvhsQh5UE+y7VGlxWkxpVSKP5uTTIutsnOJuXBOUx
         DHi6a1noh0jkI7d/XRZ4rvJ9jRhkMmS9z+HXGsoZ6DyfT6PUjog9Ie0+dDk4/mrVDDko
         x3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrjBU5mSRNvURompMc0agSRnVnkEjTH3qNGBqCNwRRBAUo2ZzPyxoXHpOGNz7XKy7FrLLWUCmCd4dwow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx987Ttwo6XHujICH9ZmQ535GmC5i+CG2AxoAJD/ZDyKBbIayX
	BUk+4XjV/2SozwV98oGCqxvUTQiMW84nz2t1IFEOpLUL2zqWGEWSa5mepouAgC4=
X-Gm-Gg: ASbGncsM9tilDUEXjuzVSuA9c7id1q4lsN2OsnFbMkWtvWoVBmJI8PqIp7w6eTu/mbG
	LOoYjRpA3i3Mr3oScljznU22aSqSezBEW1QBxGE7PREomGtuN8eVk+WPKXcay+w/ZydlFEodiiG
	jHt/l68flAUr+497fHHkewnFvVkz7rPgqWB0AIyGHDoEYoX6zlJ/9GyG0Sea5rHyKrKxFp8TXcH
	SdmkXfhvjnDEP15SekEpJ+8vsccoHGFzolDMNRNfAIMC0GK14x/x9lhIgjgsDNZ4ccnnQutAmb2
	nImwLbMm1XjEHGxSHOMo1iHRfueX7QrJJwjP0hV382WC9Zz0SVR6GjnZcJ7yokxvD3BJhOKTatU
	O5jZ69g==
X-Google-Smtp-Source: AGHT+IGKB1vocXj8KVqyAz4vvD7IpDGljmlluQ7IMEzMaAFJ3qaRjIbImaAgV9NSc9jWouTyZFOjIg==
X-Received: by 2002:a2e:80d3:0:b0:302:4a61:8b85 with SMTP id 38308e7fff4ca-30a599951ebmr34295601fa.37.1740335132749;
        Sun, 23 Feb 2025 10:25:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3097b6584efsm26654891fa.33.2025.02.23.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:25:31 -0800 (PST)
Date: Sun, 23 Feb 2025 20:25:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>

On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel from DJN using it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83112B-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca@lucaweiss.eu>
> +
> +description:
> +  The Himax HX83112B is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: djn,fairphone-fp3-panel

Would you know a better name or ID for a panel?

> +
> +  reg:
> +    maxItems: 1
> +
> +  iovcc-supply:
> +    description: I/O voltage rail
> +
> +  vsn-supply:
> +    description: Positive source voltage rail
> +
> +  vsp-supply:
> +    description: Negative source voltage rail
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - iovcc-supply
> +  - vsn-supply
> +  - vsp-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "djn,fairphone-fp3-panel";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +
> +            iovcc-supply = <&pm8953_l6>;
> +            vsn-supply = <&pmi632_lcdb_ncp>;
> +            vsp-supply = <&pmi632_lcdb_ldo>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
