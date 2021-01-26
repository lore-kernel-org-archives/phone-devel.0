Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2690DC433E0
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E04230FE
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391286AbhAZOwN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391173AbhAZOvQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jan 2021 09:51:16 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925DDC061A29
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:50:35 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id r14so1163337ljc.2
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6f1LvYnA5FB026vF4qzvowPNXCZxvMKvprMD5ct7zk=;
        b=DNO3emq0sg1yGJui5VGqWLdncnYiEqU0KPFmhDvnstsqjSeS7b8hvHznoqrQHY+XSr
         yZp/SYsBIjadcn9HN+QuFWFQtWsyu8QXadKPwo2wWhh3EtE7QkWGLm269oRP1LAYUu/S
         Pwd/tIzVJlBBKAvh7Wu8OJS9Bu/UTTvDjd8WYtR9e/7gU/WVqkoXlmpAZhXwmrpSM/dK
         f3XvrmFRNm3LpSVViZxKaVGoH0VBTgXmG+3G5HIOdZbbRSeIPWrunBhGoxDepef4MOHU
         T6N8Hy9dW6yzemGneJyghsQpfUlfUVAbUNwJilajVJaish2yyW3GaG9LqAarEdgCmD5C
         cWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6f1LvYnA5FB026vF4qzvowPNXCZxvMKvprMD5ct7zk=;
        b=k/yDy/MeNadSTZzQ8HJmNRzX0JB3Aso8aEYUrBbOB1/6NotciV4O3w3AKIrkveE7xx
         R2Hsy6EZl5oqIYt0ihw6GSWe2mb7OoAPivzlATzgO6WbuW3rdVYQdLWa+H++2SdB7cRI
         3VPtFKTl6oclrnsf+77p5gQ3VKXxSFzh13OYkBhfV7qEv97jBx6CbXPTcRNM+v10V6s0
         f7uq2jL0iNNHk4nYeGPI0h5yWrUFws/xuu1v+ZYerT6X0dwlBrCwb0Tbq+hCNKI98xOE
         1VnZKd5u+cxhmWiHrQrHIbEmwWJTXKRCXqzSoxi1/W0ftrpEd0STeWdBPXpTq1ep7mho
         1PzQ==
X-Gm-Message-State: AOAM533LnqJCCeOJ/aN8xVPIRr9KLTPyJfS8nTI2wbysJA06msoD1cxg
        6UrwszY2oEhxWp3zipfnMEE3Qkcq9r7vvUsSZ4zv/A==
X-Google-Smtp-Source: ABdhPJzrFkum4g7iaOZRLr9RsdK0/FQdTk4i3qqWYXYLKw/VBZRQbPjTjiU3XlNLJirttc3OXQuYiQBwIXWegbs4fN4=
X-Received: by 2002:a2e:8746:: with SMTP id q6mr3098828ljj.326.1611672634129;
 Tue, 26 Jan 2021 06:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20210125182153.212998-1-angelogioacchino.delregno@somainline.org> <20210125182153.212998-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210125182153.212998-2-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:50:23 +0100
Message-ID: <CACRpkdYeDw68MhBBWnLhd-1PKg9MkzP1FO_cijjvq-2fPBSQ-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jan 25, 2021 at 7:21 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
(...)
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2

Not really. Expand this to at least say in the description that the interrupt
must be IRQ_TYPE_EDGE_BOTH.

Preferably we should enforce it with the schema but I don't know if
that is possible in any easy way.

> +examples:
> +  # Example configuration to drive pins for a keyboard matrix
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        aw9523: gpio-expander@58 {
> +                compatible = "awinic,aw9523-pinctrl";
> +                reg = <0x58>;
> +                interrupt-parent = <&tlmm>;
> +                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 16>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +
> +                keyboard-matrix-col-pins {
> +                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
> +                               "gpio12", "gpio13", "gpio14", "gpio15";
> +                        function = "gpio";
> +                        input-disable;
> +                        output-low;
> +                };
> +
> +                keyboard-matrix-row-pins {
> +                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
> +                               "gpio4", "gpio5", "gpio6", "gpio7";
> +                        function = "gpio";
> +                        bias-pull-up;
> +                        drive-open-drain;
> +                        input-enable;
> +                };
> +        };
> +    };

This is fine, but what about adding an example consumer using
<&aw9523 0 IRQ_TYPE_EDGE_BOTH>?

Yours,
Linus Walleij
