Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB29C7618A
	for <phone-devel@archiver.kernel.org>; Sun, 12 Mar 2023 20:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjCLUrz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 12 Mar 2023 16:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjCLUrx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 12 Mar 2023 16:47:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975F13B230
        for <phone-devel@vger.kernel.org>; Sun, 12 Mar 2023 13:47:50 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id er25so12865110edb.5
        for <phone-devel@vger.kernel.org>; Sun, 12 Mar 2023 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678654069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u22alB8uF/MS8UPXdbSnd7ZPrfnLaMOLZCtjFbg2V6Y=;
        b=HssqLwEOKEbMThaJsnLwmZ38Xjw3cPvbBlEXDnao9b3AHt2O9/5VhkKSX694LtP4NQ
         fccQek58uhkR5UEc+Wr60VUOKhiFH+kRwm0lN1aOC6BzfGTLi86KAaUbdza97j68fdMu
         MRderlNFhI8KHoWnEiknCoIbuk4DBKW5/cKEcTU0U9wbOCRQfuHOpoFPTGnO6MPgakcJ
         bkdglZqZ+crTRuq81O+XgufzkJ8SXLB4D1lGSpyo0j2Wc7Mdw3ptcDiTIidM0E3vJJgP
         vFrvtVAIB5JT0WD5YX9DHYPKtiqD2uaUayOgVRwDQcy/IjmZjr7XlU18SshqkOaazdyW
         2mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678654069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u22alB8uF/MS8UPXdbSnd7ZPrfnLaMOLZCtjFbg2V6Y=;
        b=sGWDpiUiok+3cEXqKrRhUBEX65vK+BtL3EAJS5/bN8XnwYxmAo/cLNv6Q39iLanMO3
         R5VtnlfyZAfyuQSYi1l7vVF9n2Cfz6cf1tdGkJ4UjO6l9IAYllPrRe1/AU4pV5pwrzgn
         uniifaD1EOTjmYRjjMDcv0/A4Sz49wci1KGO2N1H8GpaoprrEf3hVVBcMvtURV98lE9o
         2ubd3zuXD7d0L84Y+gm77KWoD5cyHF8T7Dni9AF1U9xq69okcvS4TVra6If5rESGmdZr
         AeA3ktQnJBQUF7wHGgkHt1i5CPcFUIz6Yq8/DaRSdtZO5ZLwVjr8j6aTW0vd/giR3nSB
         2Bxg==
X-Gm-Message-State: AO0yUKUlviQSFPlyufG2Xk/aPNz/ixCkrLjNKHih4SeHK0kpAtiTIpIS
        EDvAasiiu7a5t4Rw822htEI7yQ==
X-Google-Smtp-Source: AK7set8j1GEtvMUfsPHK5nbXb7L5QDMpQx68DJ00oQ5FfD5O29my4p27eLzJWkD4zete2mFObe6uSg==
X-Received: by 2002:a17:906:5284:b0:915:fbba:2e0b with SMTP id c4-20020a170906528400b00915fbba2e0bmr19770139ejm.58.1678654068729;
        Sun, 12 Mar 2023 13:47:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709065d0800b008def483cf79sm2548293ejt.168.2023.03.12.13.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 13:47:48 -0700 (PDT)
Message-ID: <c9db83e8-f87d-b94d-0c23-8114adb312e1@linaro.org>
Date:   Sun, 12 Mar 2023 21:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] dt-bindings: input: touchscreen: add bindings for
 focaltech,fts
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230312093249.1846993-1-joelselvaraj.oss@gmail.com>
 <20230312093249.1846993-2-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312093249.1846993-2-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/03/2023 10:32, Joel Selvaraj wrote:
> Add devicetree bindings for the Focaltech FTS touchscreen drivers.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../input/touchscreen/focaltech,fts.yaml      | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml b/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml
> new file mode 100644
> index 000000000000..07fe595cc9ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml

I have doubts you will cover here all possible FTS controllers, so
filename should be more specific, e.g. choose the oldest device compatible.

> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/focaltech,fts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Focaltech FTS I2C Touchscreen Controller
> +
> +maintainers:
> +  - Joel Selvaraj <joelselvaraj.oss@gmail.com>
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - focaltech,fts5452
> +      - focaltech,fts8719

Missing blank line

> +  reg:
> +    const: 0x38
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: a phandle for the regulator supplying analog power (2.6V to 3.3V).

Drop "a phandle for the"

> +
> +  vddio-supply:
> +    description: a phandle for the regulator supplying IO power (1.8V).

Ditto

> +
> +  focaltech,max-touch-number:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: max number of fingers supported

Why this is not implied from compatible? IOW, why this differs between
boards?

If this property stays, then anyway "focaltech,max-touch", not number.
There is no such unit suffix as number.

> +    minimum: 2
> +    maximum: 10
> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true

Drop these two

> +
> +additionalProperties: false

and then use unevaluatedProperties: false
so all properties from common schema apply. Unless these are not really
valid for the *device*?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - focaltech,max-touch-number
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    &i2c5 {

i2c

> +      status="okay";

Drop status

Anyway this should pop warnings... Please run `make dt_binding_check`
(see Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +
> +      touchscreen: focaltech@38 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Also, drop label touchscreen.

> +        compatible = "focaltech,fts8719";
> +        reg = <0x38>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <31 IRQ_TYPE_EDGE_RISING>;
> +


Best regards,
Krzysztof

