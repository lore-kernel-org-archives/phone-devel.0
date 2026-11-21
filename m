Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259365;
	b=nZglg0T3Qe67977wjVBi4tja65BDBrnHkb0w/573jCHjaM/B3KIFzQgOJfhsQCAxuLSd
	 BmYSqtw0Q1iDogDUIYTj4DY4O+iVCIaJ9YowvV35hmPEob7YTJb5uioCfRdWCpxoLyh8T
	 Rry/n04IVJqqk0O/+c3tlA1+DbSIMUCoHPUDCevw+B6dALLH3gu4GLzTGwRND/X7Tr2tm
	 nYiCLcLijLCfCyfpCHqgWyV/ZW4OLDl0xtNlIPHJ1J8E7PIEAGLa97haldBLOdImpypOi
	 w+rVw7bM8DITIRUHw/YBziutquRyq2vWjKUHnQ5YPye+kDMrvKVFEEdNJzdOrR/SAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259365;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jm9iGnEOZUBT4S65MLfIOKx/HquVM3674BVINWFFw9E=;
	b=ieHCLL/HvHQCmLzXPkm7eiQhsqzMs4REIS/+3jJDPCS6gcZmwI3Fs4inNkvXINhgqTt5
	 HonZSkuI4G5hqr3i54lXJc6xc7URkA/hOts8zFLTFqARehlef1WQOSMHGBEyxjRUFYY45
	 tQaI8fii1eQ1ngolcJMIiu6bbR5y2gSJnhgeidtesTjzR1rO8Pxll66XSjBGE6jlDoD7D
	 lSblsE2B8Tg1q8eK2lw2fxyrAnijUgrSMe4FhDkb5M6QsUA48umEbMG5DdsRq62Flr0mj
	 f+v0r4MWO3H8rS88bf2jFDDs3ygxZjqkt4+YeeWvyd2d1p8W2BPGrfoppjcGMdXafhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7Vge7og;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663E606A320;
	Sat, 21 Nov 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7Vge7og
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35EC1F000C0;
	Sat, 21 Nov 2026 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795259364;
	bh=jm9iGnEOZUBT4S65MLfIOKx/HquVM3674BVINWFFw9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U7Vge7oguDE5mXpfvowMRoJpoL1YiqyyRwGq/E4QooWLckmIvJLmtSfzVkhZ4mFS6
	 KzAyVwejI3acu6T1oEli6UkfekGmAqVoCosFh6hoqGPqPAhHBZBtFPoEWUMDHDW9Tn
	 3Vsi7O658H82KzlsmfamCQB2yl2Va2LtX2QPxKK/9YmdRMwy7p3+YXazbRydkjwFzC
	 NSUNfHQOzPzIczwWdSKEczUQFGtOOebGUXaDrR5JV8wND98w4/vi687aWVoCYx7cb8
	 STaWN4fsjpHlNZ1674Pmtt4idXGujEzmRwB5KQI4VYb8+qyqNJ+sqgOV4dLE2uCqy6
	 SxVfTGR1ItUFw==
Date: Sat, 21 Nov 2026 12:09:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adil =?utf-8?Q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Message-ID: <20261121-brave-adamant-caribou-b01daa@quoll>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261120114100.978148-1-tadilhusrev@gmail.com>
 <20261120114100.978148-2-tadilhusrev@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261120114100.978148-2-tadilhusrev@gmail.com>

On Fri, Nov 20, 2026 at 02:40:59PM +0300, Adil H=C3=BCsrev Tepe wrote:
> Add a DT binding for MIPI-DSI video-mode panels based on the Novatek
> NT36525 controller, as fitted on the Samsung Galaxy XCover5 (SM-G525F,
> Exynos850). The panel reset (RESX) is active-low, and the panel needs
> three separate supplies (vdd/vpos/vneg) plus an optional backlight.
>=20
> Signed-off-by: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

Still incorrectly threaded.

I asked to use b4 for a reason. If you insist on not to, then at least
follow standard process and standard guides of upstreaming work.


> ---
> v3 -> v4: no changes to this binding.
>=20
> v2 -> v3: no content change. Resent as a fresh, standalone patch
> (previously v2 1/2 was a diff on top of v1's own patch instead of a
> complete patch against mainline, which Krzysztof Kozlowski correctly
> flagged as a git-management mistake on my part; see the cover letter).
>=20
> v1 -> v2 (addressing Sashiko AI's review of v1,
> https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.=
com?part=3D1):
> - reset-gpios is the physical RESX pin, which is active-low (asserted
>   low, released high); describe it as such (GPIO_ACTIVE_LOW in the
>   example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
>   "drm/panel: add Novatek NT36525 panel driver".
> - Add vpos-supply and vneg-supply: the driver requests three separate
>   regulators ("vdd", "vpos", "vneg"), but the binding only declared
>   "vdd-supply".
> - Add backlight: true so dtbs_check accepts the backlight property the
>   driver already parses via drm_panel_of_backlight(), instead of
>   switching additionalProperties to unevaluatedProperties (which would
>   also pull in every other panel-common.yaml property, not just this
>   one).
> - Fold the compatible string into a single, driver-matching value
>   (novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
>   never matched the driver's of_match_table at all.
> ---
>  .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novat=
ek,nt36525.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36=
525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.=
yaml
> new file mode 100644
> index 000000000..9158125c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36525 MIPI-DSI panel
> +
> +maintainers:
> +  - Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>
> +
> +description:
> +  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
> +  720x1480. The first compatible string names the specific panel as fitt=
ed
> +  in a device; the second is the NT36525 controller it is based on. The
> +  panel reset (RESX) is active low.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - novatek,nt36525-xcover5

I don't get it, what is xcover5? This claims it is Novatek device. Why
isn't this actual panel manufacturer?


> +      - const: novatek,nt36525
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: panel logic power supply (vdd_ldo28, 1.8V)
> +
> +  vpos-supply:
> +    description: LCD positive bias supply
> +
> +  vneg-supply:
> +    description: LCD negative bias supply
> +
> +  backlight: true
> +
> +  port: true

I don't understand why this cannot be part of other bindings... looks
exactly like nt36536 or nt36672a


> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vdd-supply
> +  - vpos-supply
> +  - vneg-supply
> +  - port

Drop port

> +
> +additionalProperties: false

Best regards,
Krzysztof

