Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF4BC433E6
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 22:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE8282225E
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 22:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAIWPT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 17:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbhAIWPT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 17:15:19 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84C1C0617A3
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 14:14:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h205so31800239lfd.5
        for <phone-devel@vger.kernel.org>; Sat, 09 Jan 2021 14:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PuGxm3GFcBsNFb4VCYjv1V+efk01JzJKthlrfnQST3E=;
        b=bUPsrc89m8tMUAGi+l2QVNYeEH/XAGp8VALJgeDbfiWuE5UE4mJMJ74pbL+6B5lPaY
         PPvNNGMBkWYpZlxHYz2480aZPc8p168tngGCnarSiN2Fb7oZhGas6hcyXlxnVWycYBJv
         9R3BwGIz801vzLERNgcyn1L83FB7JWHH45BGMOU30x9tBFDOliYomSCX5cJFGiHo27XA
         hMI6s+B3GJN6HKBzmG9MTBoNrefM8ZWi5WS5Rs2in0ui2FlyypeTnvYU1Z9yY9qxoqN0
         6ITuUigNRrV/CS56Q/HJEnqEwhJ5IsEN/q5NlDyOgmUSplQ3rp2dAt7+Y2gtQcwTqqDf
         q6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PuGxm3GFcBsNFb4VCYjv1V+efk01JzJKthlrfnQST3E=;
        b=IgJCGZG102i9DMvWFnZXTkac9bJrMpvcRPRCVNVJoKC1XQQTjFmJEp/H72ncuJzcpb
         uEVSoVzJPePg12g0wRgPVnmEhKzrjwJ1pOA6eAkUTGzU/KpfU134y1TvF5lW9/XWt4L1
         SbinW+rnokg8JmaOK/84yUsbXc7ADANepJ0DWGc6h4NvLtUut4w5rePi2kKiHCZiKO0c
         StEbRVCCvETFUwLrJgvUMyvJgOAO2+WXeaXWMYhSh8qMNX9LJzz+4MznTT8Y1SmRp0gf
         hzexS8SpgXRvIUu08i3U8eQioaxRTRq0plOrzHT99XmJTsraiutQF6Z0dbQoLd+1W2mz
         MxQQ==
X-Gm-Message-State: AOAM532T/DdwHU9AVbUqwIg1MSUTH4Qh83AVV5SgtLaaoVbOljz5q8to
        wGhEOIgypjVvwFFZZO7vgebF7zExrq8dvWoKCurQjQ==
X-Google-Smtp-Source: ABdhPJw2WqwJduUqNY8DC7qF/2q+9O/eVsIl2egJyl9nuRFKtSZWNQDD5y2ipQevex7TLwS1jqOuJf0xiGv0JFXZy3U=
X-Received: by 2002:a2e:586:: with SMTP id 128mr4663265ljf.273.1610230477212;
 Sat, 09 Jan 2021 14:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org> <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 23:14:26 +0100
Message-ID: <CACRpkdaB4ejWUzBpkYWtRC=_On0tw2H1=3beaVmnLkjncUzn_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Angelo,

thanks for your patch!

On Sat, Jan 9, 2021 at 3:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:
> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in
> +            this subnode.
> +          items:
> +            pattern: "^gpio([0-9]|1[0-5])$"
> +          minItems: 1
> +          maxItems: 16
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the
> +            specified pins.
> +
> +          enum: [ gpio, pwm ]
> +
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-open-drain: true
> +        drive-push-pull: true
> +        input-enable: true
> +        output-high: true
> +        output-low: true
> +
> +      required:
> +        - pins
> +        - function

Is it possible to just $ref /pinctrl/pincfg-node.yaml# for some of this?

Yours,
Linus Walleij
