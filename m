Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D9256C8B
	for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782325093; cv=none; b=EzNZXfBPCZvM8Mwscxvs4w2EJiHD/0ghoQVtCX0jl/2QaL0K8ZRWGMMRrTJzWpSI2Z0w1VI0gAH6+9NMcPZ3GTRYbvTRKdowCrjgaRCPP5DXSSxmEfUr8ho6p3dR1n3zZ4uCaV/eimYWVfjlgnRwCjqhn27cgH+VVIdYuR1zq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782325093; c=relaxed/simple;
	bh=2tFYo7sUz69tyEC4JV0h23Z4QBd8ApkhKFLde9AsEHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHMkRS5EKvOX+F3OKJu6iSo1OoJe6IKuI2IE8zyOOHgfOlGBftTY+8YwhbAIurrHKEYWtrRU05YECseb5cYCHvv1eehb+0Rq3+lKj0BbpfWmNbasWL0KqgI5ydht4lw3unK1GRF03GdAPSyoizklncUjNlNf4KAaAnn81hQfU/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPBNBpoV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPBNBpoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02541F00ADB
	for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782325091;
	bh=M24mGV6pWHjz+2cn/eRG4drC3Mdggl3Jji418pDleak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WPBNBpoVjzkZ16Bp565/95/fREi7U4DEiZcheFnyN6cmygl1a2ZYlI23dMqcXSfBW
	 5zdsFwUaU1jX8zs/5JiHVGM3cqdTcFZgJAlDvqo6RD14injbDVKfCptHcehJGGj1SU
	 BB232NCmUW2VkygSgDUFKeGopOPdXHI7MvkSnZbIba3wAqZnlKJotFNgyYtRIuVdsm
	 q1fwPb/H1c6JC8BWcFmvA+3alRwkq0U6UijDvnRrSwD2tKZkKJA4uJjYHJmPKLQaIc
	 fmdwNAND9+57Qb62ficiQXodAwOGI3QdWbyPnWd4pDZsxRrzvhyRIyNeZSAs0icZ2V
	 lI1X3f3J+7y3g==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-697df404e32so536477a12.0
        for <phone-devel@vger.kernel.org>; Wed, 24 Jun 2026 11:18:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PvBEnsd0i4hziAz92yerPS+N3r1EMotDisAMCtgDRrvpdvV6CD1DE8VlJM7oHrIx0QaoppeuCweaRRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUg8C3O5QwXYbeN3fnyHz0MyeQatcLezFHsumwo7fl2dhxrtg8
	CKfCZmuI6//C6v/pMz1AO1W7XOzuWlB9WXJI4vt3WwigNMACUXRtKaAEU9Ox5q2/g5AkqyJdPW4
	te9jo9Tp3EzO1IaQ1Gzl1kARxOWj8Sg==
X-Received: by 2002:a17:907:cf93:b0:c10:f00e:d983 with SMTP id
 a640c23a62f3a-c119d1786b3mr231257366b.13.1782325090353; Wed, 24 Jun 2026
 11:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
In-Reply-To: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jun 2026 13:17:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>
X-Gm-Features: AVVi8CdlGRGaELwS9kUtiW57sgL4OXTN-8dBflIE3Na_-_g9nPaF4j4RxqAx-II
Message-ID: <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
To: david@ixit.cz
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 11:02=E2=80=AFAM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> Convert CS35L36 Speaker Amplifier to yaml.
>
> Changes:
>  - maintainers email to the generic Cirrus email
>  - Both the codec and downstream worked just fine without
>    VP-supply provided. Align with datasheet for similar models.
>  - add dai-common.yaml to cover for '#sound-dai-cells',
>    'sound-name-prefix'
>
> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>

If you are going to take stuff I haven't fixed:

Assisted-by: OpenAI:gpt-4

(I don't remember the exact flavor I used)

> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Relevant for Pixel 3 / 3XL / 4.
> ---
> Changes in v2:
> - Rename the commit. (Mark)
> - Link to v1: https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1=
a43515666ad@ixit.cz
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l36.yaml  | 224 +++++++++++++++=
++++++
>  .../devicetree/bindings/sound/cs35l36.txt          | 168 ---------------=
-
>  2 files changed, 224 insertions(+), 168 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> new file mode 100644
> index 0000000000000..af0acaaefb68e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> @@ -0,0 +1,224 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS35L36 Speaker Amplifier
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +  - Bjorn Helgaas <bhelgaas@google.com>

Bjorn is not correct. Generally we want a person, not a company list.

> +
> +description: |

Don't need '|'.

> +  CS35L36 is a boosted mono Class D amplifier
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs35l36
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  VA-supply:
> +    description: Voltage regulator of analog internal section
> +
> +  VP-supply:
> +    description: Voltage regulator of boost converter
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  cirrus,boost-ctl-millivolt:
> +    description: Boost converter output voltage in millivolts (step 50)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2550
> +    maximum: 12000
> +
> +  cirrus,boost-peak-milliamp:
> +    description: Boost-converter peak current limit in mA (step 50)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 4500
> +    minimum: 1600
> +    maximum: 4500
> +
> +  cirrus,boost-ind-nanohenry:
> +    description: Initial inductor estimation reference value in nanohenr=
y (1000=3D1=CE=BCH, 1200=3D1.2=CE=BCH)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1000
> +
> +  cirrus,multi-amp-mode:
> +    description: Hi-Z ASP port when more than one amplifier in system.
> +    type: boolean
> +
> +  cirrus,boost-ctl-select:
> +    description: Boost converter control source selection
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x01
> +    enum:
> +      - 0x00 # Control Port
> +      - 0x01 # Class
> +      - 0x10 # Sync
> +
> +  cirrus,amp-pcm-inv:
> +    description: Invert incoming PCM data when true.
> +    type: boolean
> +
> +  cirrus,imon-pol-inv:
> +    description: Invert polarity of outbound IMON feedback when true.
> +    type: boolean
> +
> +  cirrus,vmon-pol-inv:
> +    description: Invert polarity of outbound VMON feedback when true.
> +    type: boolean
> +
> +  cirrus,dcm-mode-enable:
> +    description: Enable boost converter automatic Discontinuous Conducti=
on Mode.
> +    type: boolean
> +
> +  cirrus,weak-fet-disable:
> +    description: Reduce output driver strength in Weak-FET Drive Mode wh=
en true.
> +    type: boolean
> +
> +  cirrus,classh-wk-fet-delay:
> +    description: Weak-FET entry delay in ms
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 100

How? Range is 0-7.

> +    enum:
> +      - 0 # 0
> +      - 1 # 5
> +      - 2 # 10
> +      - 3 # 50
> +      - 4 # 100
> +      - 5 # 200
> +      - 6 # 500
> +      - 7 # 1000
> +
> +  cirrus,classh-weak-fet-thld-millivolt:
> +    description: Weak-FET drive threshold in mV
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 65=
0, 700]
> +
> +  cirrus,temp-warn-threshold:
> +    description: Overtemperature warning threshold
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 2
> +    enum:
> +      - 0 # 105=C2=B0C
> +      - 1 # 115=C2=B0C
> +      - 2 # 125=C2=B0C
> +      - 3 # 135=C2=B0C
> +
> +  cirrus,irq-drive-select:
> +    description: Interrupt output driver type
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1
> +    enum:
> +      - 0 # open-drain
> +      - 1 # push-pull
> +
> +  cirrus,irq-gpio-select:
> +    description: Programmable IRQ pin selection
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # PDM_DATA/SWIRE_SD/INT
> +      - 1 # GPIO
> +
> +  cirrus,vpbr-config:
> +    description: Brownout prevention configuration sub-node
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      cirrus,vpbr-en:
> +        description: VBST brownout prevention enable
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 0
> +        enum:
> +          - 0 # disabled
> +          - 1 # enabled
> +
> +      cirrus,vpbr-thld:
> +        description: Initial VPBR threshold voltage
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-atk-rate:
> +        description: Attenuation attack step rate
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-atk-vol:
> +        description: VP brownout prevention step size
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-max-attn:
> +        description: Maximum attenuation during VP brownout prevention
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-wait:
> +        description: Delay between brownout clearance and attenuation re=
lease
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-rel-rate:
> +        description: Attenuation release step rate
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      cirrus,vpbr-mute-en:
> +        description: Mute audio if maximum attenuation reached
> +        $ref: /schemas/types.yaml#/definitions/uint32

Constraints on any of these?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - VA-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        codec@40 {
> +            compatible =3D "cirrus,cs35l36";
> +            reg =3D <0x40>;
> +            VA-supply =3D <&dummy_vreg>;
> +            VP-supply =3D <&dummy_vreg>;
> +            reset-gpios =3D <&gpio0 54 GPIO_ACTIVE_HIGH>;
> +            interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +            cirrus,boost-ind-nanohenry =3D <1000>;
> +            cirrus,boost-ctl-millivolt =3D <10000>;
> +            cirrus,boost-peak-milliamp =3D <4500>;
> +            cirrus,boost-ctl-select =3D <0x00>;
> +            cirrus,weak-fet-delay =3D <4>;
> +            cirrus,weak-fet-thld =3D <0x01>;
> +            cirrus,temp-warn-threshold =3D <1>;
> +            cirrus,multi-amp-mode;
> +            cirrus,irq-drive-select =3D <1>;
> +            cirrus,irq-gpio-select =3D <0x01>;
> +
> +            cirrus,vpbr-config {
> +                cirrus,vpbr-en =3D <0>;
> +                cirrus,vpbr-thld =3D <0x05>;
> +                cirrus,vpbr-atk-rate =3D <0x02>;
> +                cirrus,vpbr-atk-vol =3D <0x01>;
> +                cirrus,vpbr-max-attn =3D <0x09>;
> +                cirrus,vpbr-wait =3D <0x01>;
> +                cirrus,vpbr-rel-rate =3D <0x05>;
> +                cirrus,vpbr-mute-en =3D <0x00>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/sound/cs35l36.txt b/Docume=
ntation/devicetree/bindings/sound/cs35l36.txt
> deleted file mode 100644
> index d34117b8558e5..0000000000000
> --- a/Documentation/devicetree/bindings/sound/cs35l36.txt
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -CS35L36 Speaker Amplifier
> -
> -Required properties:
> -
> -  - compatible : "cirrus,cs35l36"
> -
> -  - reg : the I2C address of the device for I2C
> -
> -  - VA-supply, VP-supply : power supplies for the device,
> -  as covered in
> -  Documentation/devicetree/bindings/regulator/regulator.txt.
> -
> -  - cirrus,boost-ctl-millivolt : Boost Voltage Value.  Configures the bo=
ost
> -  converter's output voltage in mV. The range is from 2550mV to 12000mV =
with
> -  increments of 50mV.
> -  (Default) VP
> -
> -  - cirrus,boost-peak-milliamp : Boost-converter peak current limit in m=
A.
> -  Configures the peak current by monitoring the current through the boos=
t FET.
> -  Range starts at 1600mA and goes to a maximum of 4500mA with increments=
 of
> -  50mA.
> -  (Default) 4.50 Amps
> -
> -  - cirrus,boost-ind-nanohenry : Inductor estimation LBST reference valu=
e.
> -  Seeds the digital boost converter's inductor estimation block with the=
 initial
> -  inductance value to reference.
> -
> -  1000 =3D 1uH (Default)
> -  1200 =3D 1.2uH
> -
> -Optional properties:
> -  - cirrus,multi-amp-mode : Boolean to determine if there are more than
> -  one amplifier in the system. If more than one it is best to Hi-Z the A=
SP
> -  port to prevent bus contention on the output signal
> -
> -  - cirrus,boost-ctl-select : Boost converter control source selection.
> -  Selects the source of the BST_CTL target VBST voltage for the boost
> -  converter to generate.
> -  0x00 - Control Port Value
> -  0x01 - Class H Tracking (Default)
> -  0x10 - MultiDevice Sync Value
> -
> -  - cirrus,amp-pcm-inv : Boolean to determine Amplifier will invert inco=
ming
> -  PCM data
> -
> -  - cirrus,imon-pol-inv : Boolean to determine Amplifier will invert the
> -  polarity of outbound IMON feedback data
> -
> -  - cirrus,vmon-pol-inv : Boolean to determine Amplifier will invert the
> -  polarity of outbound VMON feedback data
> -
> -  - cirrus,dcm-mode-enable : Boost converter automatic DCM Mode enable.
> -  This enables the digital boost converter to operate in a low power
> -  (Discontinuous Conduction) mode during low loading conditions.
> -
> -  - cirrus,weak-fet-disable : Boolean : The strength of the output drive=
rs is
> -  reduced when operating in a Weak-FET Drive Mode and must not be used t=
o drive
> -  a large load.
> -
> -  - cirrus,classh-wk-fet-delay :  Weak-FET entry delay. Controls the del=
ay
> -  (in ms) before the Class H algorithm switches to the weak-FET voltage
> -  (after the audio falls and remains below the value specified in WKFET_=
AMP_THLD).
> -
> -  0 =3D 0ms
> -  1 =3D 5ms
> -  2 =3D 10ms
> -  3 =3D 50ms
> -  4 =3D 100ms (Default)
> -  5 =3D 200ms
> -  6 =3D 500ms
> -  7 =3D 1000ms
> -
> -  - cirrus,classh-weak-fet-thld-millivolt : Weak-FET amplifier drive thr=
eshold.
> -  Configures the signal threshold at which the PWM output stage enters
> -  weak-FET operation. The range is 50mV to 700mV in 50mV increments.
> -
> -  - cirrus,temp-warn-threshold :  Amplifier overtemperature warning thre=
shold.
> -  Configures the threshold at which the overtemperature warning conditio=
n occurs.
> -  When the threshold is met, the overtemperature warning attenuation is =
applied
> -  and the TEMP_WARN_EINT interrupt status bit is set.
> -  If TEMP_WARN_MASK =3D 0, INTb is asserted.
> -
> -  0 =3D 105C
> -  1 =3D 115C
> -  2 =3D 125C (Default)
> -  3 =3D 135C
> -
> -  - cirrus,irq-drive-select : Selects the driver type of the selected in=
terrupt
> -  output.
> -
> -  0 =3D Open-drain
> -  1 =3D Push-pull (Default)
> -
> -  - cirrus,irq-gpio-select : Selects the pin to serve as the programmabl=
e
> -  interrupt output.
> -
> -  0 =3D PDM_DATA / SWIRE_SD / INT (Default)
> -  1 =3D GPIO
> -
> -Optional properties for the "cirrus,vpbr-config" Sub-node
> -
> -  - cirrus,vpbr-en : VBST brownout prevention enable. Configures whether=
 the
> -  VBST brownout prevention algorithm is enabled or disabled.
> -
> -  0 =3D VBST brownout prevention disabled (default)
> -  1 =3D VBST brownout prevention enabled
> -
> -  See Section 7.31.1 VPBR Config for configuration options & further det=
ails
> -
> -  - cirrus,vpbr-thld : Initial VPBR threshold. Configures the VP brownou=
t
> -  threshold voltage
> -
> -  - cirrus,cirrus,vpbr-atk-rate : Attenuation attack step rate. Configur=
es the
> -  amount delay between consecutive volume attenuation steps when a brown=
out
> -  condition is present and the VP brownout condition is in an attacking =
state.
> -
> -  - cirrus,vpbr-atk-vol : VP brownout prevention step size. Configures t=
he VP
> -  brownout prevention attacking attenuation step size when operating in =
either
> -  digital volume or analog gain modes.
> -
> -  - cirrus,vpbr-max-attn : Maximum attenuation that the VP brownout prev=
ention
> -  can apply to the audio signal.
> -
> -  - cirrus,vpbr-wait : Configures the delay time between a brownout cond=
ition
> -  no longer being present and the VP brownout prevention entering an att=
enuation
> -  release state.
> -
> -  - cirrus,vpbr-rel-rate : Attenuation release step rate. Configures the=
 delay
> -  between consecutive volume attenuation release steps when a brownout c=
ondition
> -  is not longer present and the VP brownout is in an attenuation release=
 state.
> -
> -  - cirrus,vpbr-mute-en : During the attack state, if the vpbr-max-attn =
value
> -  is reached, the error condition still remains, and this bit is set, th=
e audio
> -  is muted.
> -
> -Example:
> -
> -cs35l36: cs35l36@40 {
> -       compatible =3D "cirrus,cs35l36";
> -       reg =3D <0x40>;
> -       VA-supply =3D <&dummy_vreg>;
> -       VP-supply =3D <&dummy_vreg>;
> -       reset-gpios =3D <&gpio0 54 0>;
> -       interrupt-parent =3D <&gpio8>;
> -       interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> -
> -       cirrus,boost-ind-nanohenry =3D <1000>;
> -       cirrus,boost-ctl-millivolt =3D <10000>;
> -       cirrus,boost-peak-milliamp =3D <4500>;
> -       cirrus,boost-ctl-select =3D <0x00>;
> -       cirrus,weak-fet-delay =3D <0x04>;
> -       cirrus,weak-fet-thld =3D <0x01>;
> -       cirrus,temp-warn-threshold =3D <0x01>;
> -       cirrus,multi-amp-mode;
> -       cirrus,irq-drive-select =3D <0x01>;
> -       cirrus,irq-gpio-select =3D <0x01>;
> -
> -       cirrus,vpbr-config {
> -               cirrus,vpbr-en =3D <0x00>;
> -               cirrus,vpbr-thld =3D <0x05>;
> -               cirrus,vpbr-atk-rate =3D <0x02>;
> -               cirrus,vpbr-atk-vol =3D <0x01>;
> -               cirrus,vpbr-max-attn =3D <0x09>;
> -               cirrus,vpbr-wait =3D <0x01>;
> -               cirrus,vpbr-rel-rate =3D <0x05>;
> -               cirrus,vpbr-mute-en =3D <0x00>;
> -       };
> -};
>
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260618-dt-cirrus-cs35l36-99c466fb13fd
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
>
