Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E023ED5F
	for <phone-devel@vger.kernel.org>; Tue, 25 Feb 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453487; cv=none; b=ri4uvK0oC8FsDFhmQjJquQRDzEnnMr7U/TRRb72vt8krwdq2eDmjkQa85la8B0h+cvYm7xqzbXvPmvUj7on9DNTGxmx2SVuet7VpSINJ6gkFudID1i+MBbCHpV9EQKJ9Q6mEUIGj8FWhUCVu1KNg+FkhFxeMLL1TPYYfjX2ACuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453487; c=relaxed/simple;
	bh=Lk2sDUojjLMRgc3OCHI0a2fa7aBit4SzOSXMyEYms3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiVhkuOOnicJQVGQyhb+hCyWWyt3GhVZ3yR7m+CzSS+SSP41OmTmhUFs6WMO8g7fNbfuWj4EBlqZGapKnNZaenyl+7ll0sSkP0SE4a/V7yNzCg9htZdcOP/SPlxdXFgKka+FvKMVmStfTyZcpVm3kd4brbo9Au0lr5w8AyqShnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obRRyPuy; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obRRyPuy"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30797730cbdso50635931fa.3
        for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740453484; x=1741058284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FCZchhqLX8uUjPFWnCBXbymsSao+hh9E/o3hFTKGn1Q=;
        b=obRRyPuyxMzg3R0wMKzDyNeo7zC7PmHRewimtRijcpCGBHb7bwuTrEfjUaBrz+YqIL
         49XoCdWnrmGPCKjouenqJeCLjPERJNnae4B2AcnBQd/tInufoMrhWDujc/paHXlu4WTe
         jBdJavuYdST3R23VXfKNkHpMHlTrhT8KQY307eTBAn2tO7Fufn1M8lwHUxzJrHFuw++l
         694p3i+EJsaBBkeh2QRgYPVem1q0oKyL+RWX+0W1sde//E9ttP2AtfAKhgqe8SwHDkeM
         EiyMzx9tfKDxJ9jtdCeQuOgF+Ua46aswr9houPEggImIQnCKytNZ5kNbDH3RRlQWihVG
         hkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453484; x=1741058284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCZchhqLX8uUjPFWnCBXbymsSao+hh9E/o3hFTKGn1Q=;
        b=Qr/MzWWYCFNzLpR/f8AZd5TR/V+rPSU2LMEcHPBD5qfBbQACBKIz7QO+t+JUrgbhNo
         +xRUEU9ZdyJmfuQk8XAVNbGcmYgWur6elpVrFSk/aB3H3SOuFfcTiNFwfodIXp1HmsWU
         X2nDGNZsnUVZxSq7rycUid9DKQ/CyjM2kMatB5uXiQ+VgtDS3kdJICcTyWnC30hITOax
         kuFP+cQV6SQrD3bIXLvLDy+d3jnOzo+cfIEx+GYM4Xjw9blQo0GurdCanKaPaVrltFRo
         0xDwKP5LfqAJA3vFKB+C2X8yKLsMJl5BlI66NeIT3P5JAkmvsRzj33tmyKlPpaIUZiRC
         J8fg==
X-Forwarded-Encrypted: i=1; AJvYcCXfb7gituRPSdnNy1pi2SGHgvjoA3W2QM7Ofn87/ZzFc+eBxIhgNIK0aZxslrOWRPSYwCdjMPHO/nxIOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7DxsoUhxvi/0zoRxnUP8sfZhdz5Nrn2dK9Wymq+xnyuq9yuc
	0uufTl/kOsJQNCPUXdq3Yy5S+i5USSkWSXSpfT4/rfsE+GczzOPBW2ZTpDwIE2E=
X-Gm-Gg: ASbGncsjwtCcpTbCvWe9md1HUP+xRcaEuARAx0NweGZj7OrOhwku5HwoIStP3Tr+Y/3
	SHPXwpPWuhEfuC0ulCfy/16WZOlGxcF/UgDQFdEEcyLkmZVt4kCqM3UEbNJADYgpDGLzMkcZXZ2
	x4oZW33mhxDkKuOJ67xlxVDjuuF15eu3rx7LmcUwgfJuTTrn61JCOEEEpFhdI6NOt0sLnLo/z2i
	jbYjFKlCV+hTK63Mu+1cz/7osHzkssrAwGKuDLCwyuLXgA40YOMcXKHLzTICXk9/M8+dBsPFtlt
	KWIdB+MeBlOWRjcDrSJGFc6tp4tdfjQAemSMeZAY7sIOOzGp8Rmwkg/IRfJwYYb5zGH7UYj5npc
	CCtTPow==
X-Google-Smtp-Source: AGHT+IFxB2QxizMw9nvjOf5qWvU6eGEcTycsMPv7lmMYbeJIpZO5aid9mAqXGRvFMkad/0CFLKqMhQ==
X-Received: by 2002:a05:6512:e97:b0:545:c1e:6603 with SMTP id 2adb3069b0e04-54838f7ad45mr5175824e87.50.1740453483664;
        Mon, 24 Feb 2025 19:18:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514fa0c4sm60528e87.225.2025.02.24.19.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:18:02 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:59 +0200
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
Message-ID: <wo7ws3nfpniavprg55e3qchgxj4v7shra526ag7nuab57s2lxz@n6jef2ljd46t>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
 <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
 <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>

On Mon, Feb 24, 2025 at 09:40:23PM +0100, Luca Weiss wrote:
> On 23-02-2025 7:25 p.m., Dmitry Baryshkov wrote:
> > On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> > > Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> > > Describe it and the Fairphone 3 panel from DJN using it.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
> > >   1 file changed, 75 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Himax HX83112B-based DSI display panels
> > > +
> > > +maintainers:
> > > +  - Luca Weiss <luca@lucaweiss.eu>
> > > +
> > > +description:
> > > +  The Himax HX83112B is a generic DSI Panel IC used to control
> > > +  LCD panels.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    contains:
> > > +      const: djn,fairphone-fp3-panel
> > 
> > Would you know a better name or ID for a panel?
> 
> Initially no, as mentioned on the cover letter.
> 
> But I dug a bit more in some other documents and found this number now:
> "98-03057-6598B-I"
> 
> This also somewhat matches the format of the Fairphone 4 panel from DJN:
> ("djn,9a-3r063-1102b").
> 
> So I'll change the compatible to "djn,98-03057-6598b-i" in the next
> revision.

Thanks!

> 
> Regards
> Luca
> 
> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  iovcc-supply:
> > > +    description: I/O voltage rail
> > > +
> > > +  vsn-supply:
> > > +    description: Positive source voltage rail
> > > +
> > > +  vsp-supply:
> > > +    description: Negative source voltage rail
> > > +
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - iovcc-supply
> > > +  - vsn-supply
> > > +  - vsp-supply
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        panel@0 {
> > > +            compatible = "djn,fairphone-fp3-panel";
> > > +            reg = <0>;
> > > +
> > > +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> > > +
> > > +            iovcc-supply = <&pm8953_l6>;
> > > +            vsn-supply = <&pmi632_lcdb_ncp>;
> > > +            vsp-supply = <&pmi632_lcdb_ldo>;
> > > +
> > > +            port {
> > > +                panel_in_0: endpoint {
> > > +                    remote-endpoint = <&dsi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > 
> > > -- 
> > > 2.48.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
