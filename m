Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECB156C6A
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786068952; cv=none; b=fJ8POYnAnn6a+GX/nCR42ae+VAJUS/bbQq7xibC2r4bMcwa4G943e3ZeRlSg/m012+35L4td1pKejQctxconxwJ6evhqpKscYw9WMZXH4PgM04CrNDBpswORor2wXjzIMiiwT9aoYBlbSsZ6HZROidhcSh1ZuExkscWfnmBrpZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786068952; c=relaxed/simple;
	bh=zcuFMRMcf7Vm1UYev2UDSQX6fSUA6Wpr3DX12/H4w1A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYbubE99o4hsuGwJYd64JW+0XaFJFiKqBzWRUi4YYKwGcDfkcUcwaxJd/Mm61UX9aUKCm1UK3sHa3j4wyNKT5gaHtvJLHiWRu1L0gVxrCHyrUGnVZVzob19lkbamQ/5QRSt+3u0p7aug8hpdkYabTeuuafWM0ormv3aVXTmUBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ISC17R+9; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ISC17R+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786068933; x=1786328133;
	bh=t/hSfTn2D5QANsI1yfumTIwdpMzz9D5cDp1+waF062I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ISC17R+9SMWeuBI59R31KELlC4WbVakZhenlmgWVF4Kaw6lYn2RI8aHNv7I9ULXGh
	 j36OiiY8kCk8Pw19ZIEdFkxuJwEeo/vj+n8aQZqHom5dsN6aXV/BRMUep6eIZeu3Um
	 GVAIpFDSXP0bILTL/GeOndoO6yaqK24x++CpltrfZTp1z+8imj/iBUflIx0LkdHu3Z
	 nV/zRaOWgruZHeRdZtCYlqlQnPJ9YzLTvFHxMVp2TF13236iaEJvc9kQdcvqU5YT8n
	 7XLi/htDWHuhXoUu50j3lLQo738H/fRIOJe4BTKtasNREiuarVXcmNcqmgb+3VQz8Q
	 rEyYxgqjUJwdw==
Date: Fri, 07 Aug 2026 02:15:27 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS5169 redriver bindings
Message-ID: <11214e90-7168-4180-af9c-b5922c146a71@proton.me>
In-Reply-To: <20260730-enigmatic-coati-of-love-54ae0b@quoll>
References: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me> <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me> <20260730-enigmatic-coati-of-love-54ae0b@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 5bc3e928f222755b138c8f604f3d7bc29b6a611e
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/30/26 3:15 AM, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 02:03:14AM -0400, Esteban Urrutia wrote:
>> Add bindings for the Parade PS5169 and PS5170 USB Type-C linear redriver=
s.
>> The difference between PS5169 and PS5170 is that PS5170 features an
>> embedded AUX switch, while PS5169 does not.
>> Future-proof the binding by adding PS5170 as well.
>>
>> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
>> ---
>>  .../devicetree/bindings/usb/parade,ps5169.yaml     | 191 ++++++++++++++=
+++++++
>>  1 file changed, 191 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/=
Documentation/devicetree/bindings/usb/parade,ps5169.yaml
>> new file mode 100644
>> index 000000000000..86ea2351ee1e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
>> @@ -0,0 +1,191 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/parade,ps5169.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Parade PS5169 USB Type-C linear redriver
>> +
>> +maintainers:
>> +  - Esteban Urrutia <esteuwu@proton.me>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: parade,ps5170
>> +          - const: parade,ps5169
>> +      - const: parade,ps5169
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vcc-supply:
>> +    description: 1.8V power supply
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  orientation-switch: true
>> +  retimer-switch: true
>> +
>> +  parade,dp-eq-level:
>=20
> Use -db suffix instead.
> See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema=
s/property-units.yaml

Will do.

>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Equalization level for DisplayPort channels which is mapped to de=
cibels.
>> +    # 0: 2    dB
>> +    # 1: 5.5  dB
>> +    # 2: 6.5  dB
>> +    # 3: 7.5  dB
>> +    # 4: 8    dB
>> +    # 5: 8.5  dB
>> +    # 6: 9.5  dB
>> +    # 7: 10   dB
>> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
>> +
>> +  parade,usb-rx-eq-level:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Equalization level for USB receive channels which is mapped to de=
cibels.
>> +    # 0: 5.2  dB
>> +    # 1: 6    dB
>> +    # 2: 7    dB
>> +    # 3: 8    dB
>> +    # 4: 8.8  dB
>> +    # 5: 9.6  dB
>> +    # 6: 10.4 dB
>> +    # 7: 11.2 dB
>> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
>> +
>> +  parade,usb-tx-eq-level:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Equalization level for USB transmit channels which is mapped to d=
ecibels.
>> +    # 0: 2    dB
>> +    # 1: 5.5  dB
>> +    # 2: 6.5  dB
>> +    # 3: 7.5  dB
>> +    # 4: 8    dB
>> +    # 5: 8.5  dB
>> +    # 6: 9.5  dB
>> +    # 7: 10   dB
>> +    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
>> +
>> +  parade,aux-rx-data-reverse:
>> +    type: boolean
>> +    description:
>> +      Please check the driver before specifying this property.
>=20
> References to driver make this dubious.

Indeed. I haven't been able to put what this does into words, so I think
I'll drop it and add it back later when I figure that out.

>> +      Usage of this property is design-specific.
>> +
>> +  parade,fine-tune-lfps-swing:
>> +    type: boolean
>> +    description:
>> +      If this property is specified a 50 ohm termination will be set on=
 the USB receive channels.
>=20
> s/If this property is specified//
>=20
> Just describe the hardware, not the syntax of DTS.

Will fix.

>> +      Usage of this property is design-specific.
>> +
>> +  parade,dp-set-gain:
>> +    type: boolean
>> +    description:
>> +      If this property is specified a gain of -0.9 dB will be applied o=
n the DisplayPort channels.
>> +
>> +  parade,usb-rx-set-gain:
>> +    type: boolean
>> +    description:
>> +      If this property is specified a gain of -0.9 dB will be applied o=
n the USB receive channels.
>> +
>> +  parade,usb-tx-set-gain:
>> +    type: boolean
>> +    description:
>> +      If this property is specified a gain of -0.9 dB will be applied o=
n the USB transmit channels.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Super Speed (SS) Output endpoint to the Type-C con=
nector
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>=20
> Why 'port-base' here but 'port' in port@0?

'port' should be used instead of 'port-base' in port@1.
Will fix.

>> +        description: Super Speed (SS) Input endpoint from the Super-Spe=
ed PHY
>> +        unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vcc-supply
>> +  - reset-gpios
>> +  - orientation-switch
>> +  - retimer-switch
>> +
>> +allOf:
>> +  - $ref: usb-switch.yaml#
>> +  - $ref: usb-switch-ports.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: parade,ps5170
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@2:
>=20
> You must define all properties in top-level block and you only disallow
> them. See writing-bindings.

Will fix.

>> +              $ref: /schemas/graph.yaml#/properties/port
>> +              description:
>> +                Sideband Use (SBU) AUX lines endpoint to the Type-C con=
nector for the purpose of
>> +                handling altmode muxing and orientation switching.
>> +    else:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@2: false
>> +
>> +additionalProperties: false
Thanks for the review.

Regards,
Esteban

