Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998573CF977;
	Fri, 15 May 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830519; cv=none; b=nGXheuYg+15sW40FVAPJupRuRjKK6VhNTi5+3buYouo3LxiDDieWq8a5st2V3uTRGKBnWN5bEz64dXhGbuKjIZExzv9UxSbmzBRpcPBqZRyABTCW/JuSKnk2WYQ8X0a/MAw2Jfzf0OM80oxWKOaL0tvG06tI7Y6TIcDBjde2llA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830519; c=relaxed/simple;
	bh=scHF2tbVscSWxXlLSa+CK6/V2GGg6wZILgOOgZSjF5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unlR9ZHeGEKxKU/6EoSV5b7hUgLPRzkR7yn5FhzwY/frhLAr1hCRcI8Q1NvaVTKtjISMLiy0r79+alrDdDsxbOsh4zfcOjZIIwkGKP541KHIv4ie6aOJYp6NbDxNt0jCNZ1Cx96aQ4w6LOTcWPOK1+cvFYn0wp7tH7v7bJ/+WUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov7p74U6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov7p74U6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3E7C2BCB0;
	Fri, 15 May 2026 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778830519;
	bh=scHF2tbVscSWxXlLSa+CK6/V2GGg6wZILgOOgZSjF5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov7p74U61tSKJnL6h0N0xEum/8Sb5X8UTZ2LnNonwPqxglDRODH3vwlo2Z5e+0/Gn
	 DfYxRlNLp/uyfwVjl/tMKhp6q9FP4tJUvu+47mCOBWa0DXD5G8ASnRVn5zZMdyMLkp
	 QR7QXO24yLGYzONZZ/bGUUvWxqQgj6jYzuh+AmVuEMYzP9lqyRHA6VcunHkBa4LV7E
	 awubAcDOiRHMdTfnBKZQI/tKZyCNB9NR/MTw3C03mCkI04OTjXo8Fa7CoAPjgscQRe
	 tuxnGK7AK2ebALsZkcaU0i8hbw0YXjftCv8DcRRym3KIFwgDdDQGYrbmwjhQn8Wus/
	 kZqt3UdYpiaFQ==
Date: Fri, 15 May 2026 09:35:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	MINETTE Alexandre <contact@alex-min.fr>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks for
 qcom,ci-hdrc
Message-ID: <20260515-annoying-ultraviolet-dinosaur-d8eff7@quoll>
References: <20260509-qcom-ci-hdrc-clock-fix-v1-1-f52386bf85da@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509-qcom-ci-hdrc-clock-fix-v1-1-f52386bf85da@smankusors.com>

On Sat, May 09, 2026 at 10:17:52AM +0000, Antony Kurniawan Soemardi wrote:
> Some Qualcomm SoCs such as apq8064 and msm8960 require a third "fs"
> clock in addition to "iface" and "core", needed to propagate resets
> through the controller and wrapper logic. Later SoCs such as msm8974
> dropped this requirement and only use two clocks.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch updates the ci-hdrc-usb2 binding to allow up to 3 clocks for
> qcom,ci-hdrc, to accommodate Qualcomm SoCs that require an additional
> "fs" clock for reset propagation.
> 
> This is a prerequisite for the following patch series currently under
> review:
>   - ARM: dts: qcom: apq8064: Fix USB controller clocks [1]
>   - ARM: dts: qcom: msm8960: add RPM clock controller and fix USB
>     clocks [2]
> 
> Without this binding change, those series produce dtbs_check errors
> due to the 3-clock entries in their respective device tree sources.
> 
> [1] https://lore.kernel.org/all/20260427-mainline-send-v1-sending-v2-6-dcaa9178007b@alex-min.fr/
> [2] https://lore.kernel.org/all/20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com/
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 29 ++++++++++++++++------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 691d6cf02c27..5d18d47efaed 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -43,14 +43,6 @@ properties:
>                - nxp,s32g3-usb
>            - const: nxp,s32g2-usb
>  
> -  clocks:
> -    minItems: 1
> -    maxItems: 2
> -
> -  clock-names:
> -    minItems: 1
> -    maxItems: 2
> -

You MUST NOT remove properties from top-level. See writing bindings and
writing schema docs.

>    operating-points-v2:
>      description: A phandle to the OPP table containing the performance states.
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -91,6 +83,27 @@ allOf:
>    - $ref: chipidea,usb2-common.yaml#
>    - $ref: usb-hcd.yaml#
>    - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,ci-hdrc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 3

List the items instead.

> +        clock-names:
> +          minItems: 1
> +          maxItems: 3

No, names cannot be flexible. Neither clocks can, BTW, but that's
problem of existing binding. You need to list the items.


> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +        clock-names:
> +          minItems: 1
> +          maxItems: 2

This part is fine.

Best regards,
Krzysztof

