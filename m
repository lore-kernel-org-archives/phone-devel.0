Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248BD3B892B;
	Thu, 30 Jul 2026 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395714; cv=none; b=hqlWO0WOgjFAf5l8GxMbWXuIOY7/tFREEm3l1Up+jezO2SHOaFytL8GGDsBaNlzdvy1ckWBY05VKgCzNV5FI2yLk/QK/hWvjpoHadcwzZbrxHEbUQyPLSvKrf/HetENP7kA885UUA6wT4TMxNaEys+OoL1EGQ4y+ZGOv5MvM/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395714; c=relaxed/simple;
	bh=NdhFCX+93feZGr9ueHMBMHOoEQY7TR/l/0DexlZQD3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOsUwDr9lhUNWDfurYDjIdBVbRYaJv4FgOobYCVdca0oHzanjTIN8UbcDlNrHX8+f42a1xF4phiwKS+ZFgM1zAspKTjrbu0ChEZN7p7WperlBp3+ALN9zqmgu/p9LUa53lR3ZMNiQPJ0YmNuCfBI60fTlh1HIAhTR3c0H96irfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOkzM9ZX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOkzM9ZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DED1F00A3A;
	Thu, 30 Jul 2026 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395712;
	bh=ZxoQh34B3lGvax1Bn6e5dzyziYMAe8YHfCuemYpi/dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fOkzM9ZXTiPA1iSQ4F39K5+FSP6rJS/qNTB6BC2L+342NIK9oARjdSXGlUQ+U9Edk
	 thhmy7dPZjuumF72AFXc1f2Yc3x4rO0e11q12Q3KRvsCH/bpLmKBFbBjluNSXPlCEK
	 G/T98k70CaXvhxQPP204kRYCLuusvvt29yw4iZNxGE21wDVdmH6Rkn+qsaooCdjLUj
	 K6EpP6SoTAaGdg65ho09fJyiY4sOgoeko3+1Q4xWeu3q+WtU3AGuDgNSyZEXB04wSP
	 PAZdH3Ga2/1QChblKq+6VG4yfs6I+1ZVGUy4FZ5kzRcydp3hmw7UUh/hTPMXFS9qf9
	 Q19TZN6sNokeQ==
Date: Thu, 30 Jul 2026 09:15:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Message-ID: <20260730-enigmatic-coati-of-love-54ae0b@quoll>
References: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me>
 <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me>

On Wed, Jul 29, 2026 at 02:03:14AM -0400, Esteban Urrutia wrote:
> Add bindings for the Parade PS5169 and PS5170 USB Type-C linear redrivers.
> The difference between PS5169 and PS5170 is that PS5170 features an
> embedded AUX switch, while PS5169 does not.
> Future-proof the binding by adding PS5170 as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  .../devicetree/bindings/usb/parade,ps5169.yaml     | 191 +++++++++++++++++++++
>  1 file changed, 191 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
> new file mode 100644
> index 000000000000..86ea2351ee1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/parade,ps5169.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade PS5169 USB Type-C linear redriver
> +
> +maintainers:
> +  - Esteban Urrutia <esteuwu@proton.me>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: parade,ps5170
> +          - const: parade,ps5169
> +      - const: parade,ps5169
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: 1.8V power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  orientation-switch: true
> +  retimer-switch: true
> +
> +  parade,dp-eq-level:

Use -db suffix instead.
See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Equalization level for DisplayPort channels which is mapped to decibels.
> +    # 0: 2    dB
> +    # 1: 5.5  dB
> +    # 2: 6.5  dB
> +    # 3: 7.5  dB
> +    # 4: 8    dB
> +    # 5: 8.5  dB
> +    # 6: 9.5  dB
> +    # 7: 10   dB
> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> +
> +  parade,usb-rx-eq-level:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Equalization level for USB receive channels which is mapped to decibels.
> +    # 0: 5.2  dB
> +    # 1: 6    dB
> +    # 2: 7    dB
> +    # 3: 8    dB
> +    # 4: 8.8  dB
> +    # 5: 9.6  dB
> +    # 6: 10.4 dB
> +    # 7: 11.2 dB
> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> +
> +  parade,usb-tx-eq-level:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Equalization level for USB transmit channels which is mapped to decibels.
> +    # 0: 2    dB
> +    # 1: 5.5  dB
> +    # 2: 6.5  dB
> +    # 3: 7.5  dB
> +    # 4: 8    dB
> +    # 5: 8.5  dB
> +    # 6: 9.5  dB
> +    # 7: 10   dB
> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> +
> +  parade,aux-rx-data-reverse:
> +    type: boolean
> +    description:
> +      Please check the driver before specifying this property.

References to driver make this dubious.

> +      Usage of this property is design-specific.
> +
> +  parade,fine-tune-lfps-swing:
> +    type: boolean
> +    description:
> +      If this property is specified a 50 ohm termination will be set on the USB receive channels.

s/If this property is specified//

Just describe the hardware, not the syntax of DTS.

> +      Usage of this property is design-specific.
> +
> +  parade,dp-set-gain:
> +    type: boolean
> +    description:
> +      If this property is specified a gain of -0.9 dB will be applied on the DisplayPort channels.
> +
> +  parade,usb-rx-set-gain:
> +    type: boolean
> +    description:
> +      If this property is specified a gain of -0.9 dB will be applied on the USB receive channels.
> +
> +  parade,usb-tx-set-gain:
> +    type: boolean
> +    description:
> +      If this property is specified a gain of -0.9 dB will be applied on the USB transmit channels.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) Output endpoint to the Type-C connector
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Why 'port-base' here but 'port' in port@0?

> +        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +  - reset-gpios
> +  - orientation-switch
> +  - retimer-switch
> +
> +allOf:
> +  - $ref: usb-switch.yaml#
> +  - $ref: usb-switch-ports.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: parade,ps5170
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@2:

You must define all properties in top-level block and you only disallow
them. See writing-bindings.

> +              $ref: /schemas/graph.yaml#/properties/port
> +              description:
> +                Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
> +                handling altmode muxing and orientation switching.
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@2: false
> +
> +additionalProperties: false

Best regards,
Krzysztof

