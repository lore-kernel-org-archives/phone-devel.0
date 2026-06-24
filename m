Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC1386341;
	Wed, 24 Jun 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782326390; cv=none; b=VY2ccAHb/wp853UeXAcxR9Ld8rCkHfB+mhIzoFFVVwYRNjN4ATQnXmvhCNnCANKWdQogjO5avMK7J8rXFFb7w7D+pJgak9E3xyOOHmTLBc1VDQSdYgLsWkSkI+lfgM289yXcL+PXmlqwuV6YJqMwzLokzGdslmUMsshpVmjSWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782326390; c=relaxed/simple;
	bh=Vop55L0eluuuhQBvziBQRlP3bftQDl0qHTaaDsMzTog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unGufUh7eczEu8CDveoQrHHcnh5SX+htQkpMiEPFgE4Q9wmlyWVxcMSxiPnR5R/XavzZQTpM0qwq8LoefdNt+3oYcbaK7BWCVSV52Wc9+ulnWbZkYGG7WiHX/HGPC5kWUUFvu6ObVqQHwCUAwMfGJFJy3TxOeJYlKkbuQpoCnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=pOrBre1T; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="pOrBre1T"
Received: from [10.0.0.200] (unknown [10.88.125.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 778A15340124;
	Wed, 24 Jun 2026 20:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1782326375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P/eZwbyDeFRwl73bQ5ujwQckURpaR16tfB0cFT+OlKs=;
	b=pOrBre1Tg61St33K+P0uUawKCVBW8Z5bvy2YvHB/1UinipOcbTJMalYKxabRH242msm8j8
	tJ727N4RYRrSNOD3saQS7s+hfSXoUPiIC0lAyyZ0NmYOOH0Ov3Beh8QC0huJHuC5Epm7F4
	kAVGp/JuQgsdxPjvPA2XA9+oAUqyl0E=
Message-ID: <3873b111-36d5-442e-996c-31d05d23c8e8@ixit.cz>
Date: Wed, 24 Jun 2026 20:39:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
To: Rob Herring <robh@kernel.org>, David Rhodes <david.rhodes@cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
 <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/06/2026 20:17, Rob Herring wrote:
> On Wed, Jun 24, 2026 at 11:02 AM David Heidelberg via B4 Relay
> <devnull+david.ixit.cz@kernel.org> wrote:
>>
>> From: David Heidelberg <david@ixit.cz>
>>
>> Convert CS35L36 Speaker Amplifier to yaml.
>>
>> Changes:
>>   - maintainers email to the generic Cirrus email
>>   - Both the codec and downstream worked just fine without
>>     VP-supply provided. Align with datasheet for similar models.
>>   - add dai-common.yaml to cover for '#sound-dai-cells',
>>     'sound-name-prefix'
>>
>> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>
> 
> If you are going to take stuff I haven't fixed:
> 
> Assisted-by: OpenAI:gpt-4
> 
> (I don't remember the exact flavor I used)
> 
>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Relevant for Pixel 3 / 3XL / 4.
>> ---
>> Changes in v2:
>> - Rename the commit. (Mark)
>> - Link to v1: https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz
>> ---
>>   .../devicetree/bindings/sound/cirrus,cs35l36.yaml  | 224 +++++++++++++++++++++
>>   .../devicetree/bindings/sound/cs35l36.txt          | 168 ----------------
>>   2 files changed, 224 insertions(+), 168 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
>> new file mode 100644
>> index 0000000000000..af0acaaefb68e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
>> @@ -0,0 +1,224 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Cirrus Logic CS35L36 Speaker Amplifier
>> +
>> +maintainers:
>> +  - patches@opensource.cirrus.com
>> +  - Bjorn Helgaas <bhelgaas@google.com>
> 
> Bjorn is not correct. Generally we want a person, not a company list.

I'm adding back James, can I keep the patches at 2nd place?

> 
>> +
>> +description: |
> 
> Don't need '|'.
> 
>> +  CS35L36 is a boosted mono Class D amplifier
>> +
>> +allOf:
>> +  - $ref: /schemas/sound/dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - cirrus,cs35l36
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  VA-supply:
>> +    description: Voltage regulator of analog internal section
>> +
>> +  VP-supply:
>> +    description: Voltage regulator of boost converter
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  cirrus,boost-ctl-millivolt:
>> +    description: Boost converter output voltage in millivolts (step 50)
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 2550
>> +    maximum: 12000
>> +
>> +  cirrus,boost-peak-milliamp:
>> +    description: Boost-converter peak current limit in mA (step 50)
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 4500
>> +    minimum: 1600
>> +    maximum: 4500
>> +
>> +  cirrus,boost-ind-nanohenry:
>> +    description: Initial inductor estimation reference value in nanohenry (1000=1μH, 1200=1.2μH)
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 1000
>> +
>> +  cirrus,multi-amp-mode:
>> +    description: Hi-Z ASP port when more than one amplifier in system.
>> +    type: boolean
>> +
>> +  cirrus,boost-ctl-select:
>> +    description: Boost converter control source selection
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 0x01
>> +    enum:
>> +      - 0x00 # Control Port
>> +      - 0x01 # Class
>> +      - 0x10 # Sync
>> +
>> +  cirrus,amp-pcm-inv:
>> +    description: Invert incoming PCM data when true.
>> +    type: boolean
>> +
>> +  cirrus,imon-pol-inv:
>> +    description: Invert polarity of outbound IMON feedback when true.
>> +    type: boolean
>> +
>> +  cirrus,vmon-pol-inv:
>> +    description: Invert polarity of outbound VMON feedback when true.
>> +    type: boolean
>> +
>> +  cirrus,dcm-mode-enable:
>> +    description: Enable boost converter automatic Discontinuous Conduction Mode.
>> +    type: boolean
>> +
>> +  cirrus,weak-fet-disable:
>> +    description: Reduce output driver strength in Weak-FET Drive Mode when true.
>> +    type: boolean
>> +
>> +  cirrus,classh-wk-fet-delay:
>> +    description: Weak-FET entry delay in ms
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 100
> 
> How? Range is 0-7.

Oh yeah, this was not thought, in next revision I converted this to

cirrus,classh-wk-fet-delay mentioned in the example. Then I checked for it in 
the code, nowhere implemented or used, thus I switched to

cirrus,classh-wk-fet-delay-ms and using the values directly.

> 
>> +    enum:
>> +      - 0 # 0
>> +      - 1 # 5
>> +      - 2 # 10
>> +      - 3 # 50
>> +      - 4 # 100
>> +      - 5 # 200
>> +      - 6 # 500
>> +      - 7 # 1000
>> +
>> +  cirrus,classh-weak-fet-thld-millivolt:
>> +    description: Weak-FET drive threshold in mV
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700]
>> +
>> +  cirrus,temp-warn-threshold:
>> +    description: Overtemperature warning threshold
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 2
>> +    enum:
>> +      - 0 # 105°C
>> +      - 1 # 115°C
>> +      - 2 # 125°C
>> +      - 3 # 135°C
>> +
>> +  cirrus,irq-drive-select:
>> +    description: Interrupt output driver type
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    default: 1
>> +    enum:
>> +      - 0 # open-drain
>> +      - 1 # push-pull
>> +
>> +  cirrus,irq-gpio-select:
>> +    description: Programmable IRQ pin selection
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum:
>> +      - 0 # PDM_DATA/SWIRE_SD/INT
>> +      - 1 # GPIO
>> +
>> +  cirrus,vpbr-config:
>> +    description: Brownout prevention configuration sub-node
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      cirrus,vpbr-en:
>> +        description: VBST brownout prevention enable
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 0
>> +        enum:
>> +          - 0 # disabled
>> +          - 1 # enabled
>> +
>> +      cirrus,vpbr-thld:
>> +        description: Initial VPBR threshold voltage
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-atk-rate:
>> +        description: Attenuation attack step rate
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-atk-vol:
>> +        description: VP brownout prevention step size
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-max-attn:
>> +        description: Maximum attenuation during VP brownout prevention
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-wait:
>> +        description: Delay between brownout clearance and attenuation release
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-rel-rate:
>> +        description: Attenuation release step rate
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      cirrus,vpbr-mute-en:
>> +        description: Mute audio if maximum attenuation reached
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Constraints on any of these?

Code just applies whatever is thrown at it, maybe David knows more?

#nodatasheet (but would be lovely to have one)

David

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - VA-supply
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        codec@40 {
>> +            compatible = "cirrus,cs35l36";
>> +            reg = <0x40>;
>> +            VA-supply = <&dummy_vreg>;
>> +            VP-supply = <&dummy_vreg>;
>> +            reset-gpios = <&gpio0 54 GPIO_ACTIVE_HIGH>;
>> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +            cirrus,boost-ind-nanohenry = <1000>;
>> +            cirrus,boost-ctl-millivolt = <10000>;
>> +            cirrus,boost-peak-milliamp = <4500>;
>> +            cirrus,boost-ctl-select = <0x00>;
>> +            cirrus,weak-fet-delay = <4>;
>> +            cirrus,weak-fet-thld = <0x01>;
>> +            cirrus,temp-warn-threshold = <1>;
>> +            cirrus,multi-amp-mode;
>> +            cirrus,irq-drive-select = <1>;
>> +            cirrus,irq-gpio-select = <0x01>;
>> +
>> +            cirrus,vpbr-config {
>> +                cirrus,vpbr-en = <0>;
>> +                cirrus,vpbr-thld = <0x05>;
>> +                cirrus,vpbr-atk-rate = <0x02>;
>> +                cirrus,vpbr-atk-vol = <0x01>;
>> +                cirrus,vpbr-max-attn = <0x09>;
>> +                cirrus,vpbr-wait = <0x01>;
>> +                cirrus,vpbr-rel-rate = <0x05>;
>> +                cirrus,vpbr-mute-en = <0x00>;
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/sound/cs35l36.txt b/Documentation/devicetree/bindings/sound/cs35l36.txt
>> deleted file mode 100644
>> index d34117b8558e5..0000000000000
>> --- a/Documentation/devicetree/bindings/sound/cs35l36.txt
>> +++ /dev/null
>> @@ -1,168 +0,0 @@
>> -CS35L36 Speaker Amplifier
>> -
>> -Required properties:
>> -
>> -  - compatible : "cirrus,cs35l36"
>> -
>> -  - reg : the I2C address of the device for I2C
>> -
>> -  - VA-supply, VP-supply : power supplies for the device,
>> -  as covered in
>> -  Documentation/devicetree/bindings/regulator/regulator.txt.
>> -
>> -  - cirrus,boost-ctl-millivolt : Boost Voltage Value.  Configures the boost
>> -  converter's output voltage in mV. The range is from 2550mV to 12000mV with
>> -  increments of 50mV.
>> -  (Default) VP
>> -
>> -  - cirrus,boost-peak-milliamp : Boost-converter peak current limit in mA.
>> -  Configures the peak current by monitoring the current through the boost FET.
>> -  Range starts at 1600mA and goes to a maximum of 4500mA with increments of
>> -  50mA.
>> -  (Default) 4.50 Amps
>> -
>> -  - cirrus,boost-ind-nanohenry : Inductor estimation LBST reference value.
>> -  Seeds the digital boost converter's inductor estimation block with the initial
>> -  inductance value to reference.
>> -
>> -  1000 = 1uH (Default)
>> -  1200 = 1.2uH
>> -
>> -Optional properties:
>> -  - cirrus,multi-amp-mode : Boolean to determine if there are more than
>> -  one amplifier in the system. If more than one it is best to Hi-Z the ASP
>> -  port to prevent bus contention on the output signal
>> -
>> -  - cirrus,boost-ctl-select : Boost converter control source selection.
>> -  Selects the source of the BST_CTL target VBST voltage for the boost
>> -  converter to generate.
>> -  0x00 - Control Port Value
>> -  0x01 - Class H Tracking (Default)
>> -  0x10 - MultiDevice Sync Value
>> -
>> -  - cirrus,amp-pcm-inv : Boolean to determine Amplifier will invert incoming
>> -  PCM data
>> -
>> -  - cirrus,imon-pol-inv : Boolean to determine Amplifier will invert the
>> -  polarity of outbound IMON feedback data
>> -
>> -  - cirrus,vmon-pol-inv : Boolean to determine Amplifier will invert the
>> -  polarity of outbound VMON feedback data
>> -
>> -  - cirrus,dcm-mode-enable : Boost converter automatic DCM Mode enable.
>> -  This enables the digital boost converter to operate in a low power
>> -  (Discontinuous Conduction) mode during low loading conditions.
>> -
>> -  - cirrus,weak-fet-disable : Boolean : The strength of the output drivers is
>> -  reduced when operating in a Weak-FET Drive Mode and must not be used to drive
>> -  a large load.
>> -
>> -  - cirrus,classh-wk-fet-delay :  Weak-FET entry delay. Controls the delay
>> -  (in ms) before the Class H algorithm switches to the weak-FET voltage
>> -  (after the audio falls and remains below the value specified in WKFET_AMP_THLD).
>> -
>> -  0 = 0ms
>> -  1 = 5ms
>> -  2 = 10ms
>> -  3 = 50ms
>> -  4 = 100ms (Default)
>> -  5 = 200ms
>> -  6 = 500ms
>> -  7 = 1000ms
>> -
>> -  - cirrus,classh-weak-fet-thld-millivolt : Weak-FET amplifier drive threshold.
>> -  Configures the signal threshold at which the PWM output stage enters
>> -  weak-FET operation. The range is 50mV to 700mV in 50mV increments.
>> -
>> -  - cirrus,temp-warn-threshold :  Amplifier overtemperature warning threshold.
>> -  Configures the threshold at which the overtemperature warning condition occurs.
>> -  When the threshold is met, the overtemperature warning attenuation is applied
>> -  and the TEMP_WARN_EINT interrupt status bit is set.
>> -  If TEMP_WARN_MASK = 0, INTb is asserted.
>> -
>> -  0 = 105C
>> -  1 = 115C
>> -  2 = 125C (Default)
>> -  3 = 135C
>> -
>> -  - cirrus,irq-drive-select : Selects the driver type of the selected interrupt
>> -  output.
>> -
>> -  0 = Open-drain
>> -  1 = Push-pull (Default)
>> -
>> -  - cirrus,irq-gpio-select : Selects the pin to serve as the programmable
>> -  interrupt output.
>> -
>> -  0 = PDM_DATA / SWIRE_SD / INT (Default)
>> -  1 = GPIO
>> -
>> -Optional properties for the "cirrus,vpbr-config" Sub-node
>> -
>> -  - cirrus,vpbr-en : VBST brownout prevention enable. Configures whether the
>> -  VBST brownout prevention algorithm is enabled or disabled.
>> -
>> -  0 = VBST brownout prevention disabled (default)
>> -  1 = VBST brownout prevention enabled
>> -
>> -  See Section 7.31.1 VPBR Config for configuration options & further details
>> -
>> -  - cirrus,vpbr-thld : Initial VPBR threshold. Configures the VP brownout
>> -  threshold voltage
>> -
>> -  - cirrus,cirrus,vpbr-atk-rate : Attenuation attack step rate. Configures the
>> -  amount delay between consecutive volume attenuation steps when a brownout
>> -  condition is present and the VP brownout condition is in an attacking state.
>> -
>> -  - cirrus,vpbr-atk-vol : VP brownout prevention step size. Configures the VP
>> -  brownout prevention attacking attenuation step size when operating in either
>> -  digital volume or analog gain modes.
>> -
>> -  - cirrus,vpbr-max-attn : Maximum attenuation that the VP brownout prevention
>> -  can apply to the audio signal.
>> -
>> -  - cirrus,vpbr-wait : Configures the delay time between a brownout condition
>> -  no longer being present and the VP brownout prevention entering an attenuation
>> -  release state.
>> -
>> -  - cirrus,vpbr-rel-rate : Attenuation release step rate. Configures the delay
>> -  between consecutive volume attenuation release steps when a brownout condition
>> -  is not longer present and the VP brownout is in an attenuation release state.
>> -
>> -  - cirrus,vpbr-mute-en : During the attack state, if the vpbr-max-attn value
>> -  is reached, the error condition still remains, and this bit is set, the audio
>> -  is muted.
>> -
>> -Example:
>> -
>> -cs35l36: cs35l36@40 {
>> -       compatible = "cirrus,cs35l36";
>> -       reg = <0x40>;
>> -       VA-supply = <&dummy_vreg>;
>> -       VP-supply = <&dummy_vreg>;
>> -       reset-gpios = <&gpio0 54 0>;
>> -       interrupt-parent = <&gpio8>;
>> -       interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> -
>> -       cirrus,boost-ind-nanohenry = <1000>;
>> -       cirrus,boost-ctl-millivolt = <10000>;
>> -       cirrus,boost-peak-milliamp = <4500>;
>> -       cirrus,boost-ctl-select = <0x00>;
>> -       cirrus,weak-fet-delay = <0x04>;
>> -       cirrus,weak-fet-thld = <0x01>;
>> -       cirrus,temp-warn-threshold = <0x01>;
>> -       cirrus,multi-amp-mode;
>> -       cirrus,irq-drive-select = <0x01>;
>> -       cirrus,irq-gpio-select = <0x01>;
>> -
>> -       cirrus,vpbr-config {
>> -               cirrus,vpbr-en = <0x00>;
>> -               cirrus,vpbr-thld = <0x05>;
>> -               cirrus,vpbr-atk-rate = <0x02>;
>> -               cirrus,vpbr-atk-vol = <0x01>;
>> -               cirrus,vpbr-max-attn = <0x09>;
>> -               cirrus,vpbr-wait = <0x01>;
>> -               cirrus,vpbr-rel-rate = <0x05>;
>> -               cirrus,vpbr-mute-en = <0x00>;
>> -       };
>> -};
>>
>> ---
>> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
>> change-id: 20260618-dt-cirrus-cs35l36-99c466fb13fd
>>
>> Best regards,
>> --
>> David Heidelberg <david@ixit.cz>
>>
>>
>>

-- 
David Heidelberg

