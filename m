Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE5DC77B73
	for <phone-devel@archiver.kernel.org>; Sun, 16 Apr 2023 18:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjDPSjc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 16 Apr 2023 14:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjDPSjb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 16 Apr 2023 14:39:31 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB391701
        for <phone-devel@vger.kernel.org>; Sun, 16 Apr 2023 11:39:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u3so6649381ejj.12
        for <phone-devel@vger.kernel.org>; Sun, 16 Apr 2023 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681670368; x=1684262368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+r+PqvrTV1juRv4w7PiPA88vL9dLT7JMQjZFcBS3TM=;
        b=rNxdrtZ4bTds9ynwF3WYsmHmRbkAjg4a7GjNeX9/Y++I2tpW5rVC14RphA6t5Jw685
         axHPf9STaLdlRMVYUw+LgRpYH2IeiPUI//Ok4tyxvblbahvPL914tr2CYgK393Y6I74V
         qyej9CdwpzY7ZtyletU1wtEjbnpCzar0k42hkX6NpGI7Imno1mLnAqISrI5A+++elh3q
         jgeu4FcUxtV/FY5JaL0UeJt+h1D/PRaBxsopFzFK1SglguLf76mLF6SGUxwUY4ep7Pqc
         L8ouFsBrsLrF9yKtyoSkMPOw+NE4ohBnn4QqSMHF8VqcAHpQsHI5ZUYiLg2TtS32r2QD
         Rgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681670368; x=1684262368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+r+PqvrTV1juRv4w7PiPA88vL9dLT7JMQjZFcBS3TM=;
        b=RCCgs2SEX0Bp61eSt3cqL7UhxctplAhPRwA0Je0Q4kewOXI0ZC9GwXYCbUfTHNTIz1
         ICnOB2VCcdPGkUnLSxljFOZjwNdfv4G7PH8b1KrOMVCa1qFSSHnitZESHuWHoWf+qnHE
         U/6lPwX8WWQocl0k9PPCS9TRpR5qoH7BFLeNcx28GS22h/oGwtfrYIIXLlckVlOZ+4+w
         9o0l2Pdti9krhoMWzeQAto2WP9sFErlvefq29R0SDiQ7ZDjWCREq2HB8aHKb9VuAVt1X
         bn+JEKSxGsvPx7DP/wU1hgZcDyEIyBNPpW8lNHGjSTsWX8L0NpoY9uC+ehGTkzCgYcnz
         nW8A==
X-Gm-Message-State: AAQBX9dnc2M24CpWBIboi5L9nCgvaCf+obsj7rw6fuJ0DFcls1kBSuWW
        Z60p7djuHfjge5N9V3gCY37+BQ==
X-Google-Smtp-Source: AKy350Yt9ewETmsFnoKLr9KVazw36UwNX2BEXa2ux3zxZIuqrvg6YmJlYWeWSUlzqA6jGoRmcycGUw==
X-Received: by 2002:a17:906:3682:b0:94a:68a9:b399 with SMTP id a2-20020a170906368200b0094a68a9b399mr4708387ejc.53.1681670368240;
        Sun, 16 Apr 2023 11:39:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id xh5-20020a170906da8500b0094edd8e38fasm4015884ejb.76.2023.04.16.11.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:39:27 -0700 (PDT)
Message-ID: <5b41b54c-88d0-3666-9db2-9cbb90ba8183@linaro.org>
Date:   Sun, 16 Apr 2023 20:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 9/9] dt-bindings: Add documentation for rt5033 mfd,
 regulator and charger
Content-Language: en-US
To:     Jakob Hauser <jahau@rocketmail.com>,
        Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Beomho Seo <beomho.seo@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Raymond Hackley <raymondhackley@protonmail.com>,
        Pavel Machek <pavel@ucw.cz>, Axel Lin <axel.lin@ingics.com>,
        ChiYuan Huang <cy_huang@richtek.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1681646904.git.jahau@rocketmail.com>
 <9275af790e6e21b5cf661a2444effe4caf2be02e.1681646904.git.jahau@rocketmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9275af790e6e21b5cf661a2444effe4caf2be02e.1681646904.git.jahau@rocketmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/04/2023 14:44, Jakob Hauser wrote:
> Add device tree binding documentation for rt5033 multifunction device, voltage
> regulator and battery charger.

Subject: drop second/last, redundant "documentation". The "dt-bindings"
prefix is already stating that these are documentation.

> 
> Cc: Beomho Seo <beomho.seo@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> The patch is based on linux-next (tag "next-20230413").
> 
>  .../bindings/mfd/richtek,rt5033.yaml          | 90 +++++++++++++++++++
>  .../power/supply/richtek,rt5033-charger.yaml  | 76 ++++++++++++++++
>  .../regulator/richtek,rt5033-regulator.yaml   | 24 +++++
>  3 files changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt5033.yaml
>  create mode 100644 Documentation/devicetree/bindings/power/supply/richtek,rt5033-charger.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/richtek,rt5033-regulator.yaml
> 



> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@34 {
> +            compatible = "richtek,rt5033";
> +            reg = <0x34>;
> +
> +            interrupt-parent = <&msmgpio>;
> +            interrupts = <62 IRQ_TYPE_EDGE_FALLING>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pmic_int_default>;
> +
> +            regulators {
> +                safe_ldo_reg: safe_ldo {

If you could change it: No underscores in node names... but you cannot.
This is old driver so you will break the users.

> +                    regulator-name = "safe_ldo";
> +                    regulator-min-microvolt = <4900000>;
> +                    regulator-max-microvolt = <4900000>;
> +                    regulator-always-on;
> +                };
> +                ldo_reg: ldo {
> +                    regulator-name = "ldo";
> +                    regulator-min-microvolt = <2800000>;
> +                    regulator-max-microvolt = <2800000>;
> +                };
> +                buck_reg: buck {
> +                    regulator-name = "buck";
> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <1200000>;
> +                };
> +            };
> +
> +            charger {
> +                compatible = "richtek,rt5033-charger";
> +                richtek,pre-microamp = <450000>;
> +                richtek,fast-microamp = <1000000>;
> +                richtek,eoc-microamp = <150000>;
> +                richtek,pre-threshold-microvolt = <3500000>;
> +                richtek,const-microvolt = <4350000>;
> +                extcon = <&muic>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/power/supply/richtek,rt5033-charger.yaml b/Documentation/devicetree/bindings/power/supply/richtek,rt5033-charger.yaml
> new file mode 100644
> index 000000000000..439e0b7962f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/richtek,rt5033-charger.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/richtek,rt5033-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT5033 PIMC Battery Charger
> +
> +maintainers:
> +  - Jakob Hauser <jahau@rocketmail.com>
> +
> +description:
> +  The battery charger of the multifunction device RT5033 has to be instantiated
> +  under sub-node named "charger" using the following format.
> +
> +properties:
> +  compatible:
> +    const: richtek,rt5033-charger
> +
> +  richtek,pre-microamp:
> +    description:
> +      Current of pre-charge mode. The pre-charge current levels are 350 mA to
> +      650 mA programmed by I2C per 100 mA.

minimum:
maximum:
multipleOf: 100

Same for other cases.

> +    maxItems: 1
> +
> +  richtek,fast-microamp:
> +    description:
> +      Current of fast-charge mode. The fast-charge current levels are 700 mA
> +      to 2000 mA programmed by I2C per 100 mA.
> +    maxItems: 1
> +
> +  richtek,eoc-microamp:
> +    description:
> +      This property is end of charge current. Its level ranges from 150 mA to
> +      600 mA. Between 150 mA and 300 mA in 50 mA steps, between 300 mA and 600 mA
> +      in 100 mA steps.
> +    maxItems: 1
> +
> +  richtek,pre-threshold-microvolt:
> +    description:
> +      Voltage of pre-charge mode. If the battery voltage is below the pre-charge
> +      threshold voltage, the charger is in pre-charge mode with pre-charge current.
> +      Its levels are 2.3 V to 3.8 V programmed by I2C per 0.1 V.
> +    maxItems: 1
> +
> +  richtek,const-microvolt:
> +    description:
> +      Battery regulation voltage of constant voltage mode. This voltage levels from
> +      3.65 V to 4.4 V by I2C per 0.025 V.
> +    maxItems: 1
> +
> +  extcon:
> +    description:
> +      Phandle to the extcon device.
> +    maxItems: 1
> +
> +required:
> +  - richtek,pre-microamp
> +  - richtek,fast-microamp
> +  - richtek,eoc-microamp
> +  - richtek,pre-threshold-microvolt
> +  - richtek,const-microvolt
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    charger {
> +        compatible = "richtek,rt5033-charger";
> +        richtek,pre-microamp = <450000>;
> +        richtek,fast-microamp = <1000000>;
> +        richtek,eoc-microamp = <150000>;
> +        richtek,pre-threshold-microvolt = <3500000>;
> +        richtek,const-microvolt = <4350000>;
> +        extcon = <&muic>;
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/richtek,rt5033-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rt5033-regulator.yaml
> new file mode 100644
> index 000000000000..66c8a0692e10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/richtek,rt5033-regulator.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/richtek,rt5033-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RT5033 PIMC Voltage Regulator

You should explain in commit msg that you document existing driver in
the Linux kernel. We would not cut some slack, e.g. stricter rules
applied to new bindings.

> +
> +maintainers:
> +  - Jakob Hauser <jahau@rocketmail.com>
> +
> +description:
> +  The regulators of RT5033 have to be instantiated under a sub-node named
> +  "regulators". For "safe_ldo" voltage there is only one value of 4.9 V. "ldo"
> +  voltage ranges from 1.2 V to 3.0 V in 0.1 V steps. "buck" voltage ranges from
> +  1.0 V to 3.0 V in 0.1 V steps.
> +
> +patternProperties:
> +  "^(safe_ldo|ldo|buck)$":
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#

Just squash it with parent schema. No real benefits of having regulators
separate - it's very small one.

Best regards,
Krzysztof

