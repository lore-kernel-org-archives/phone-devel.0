Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1B3C433EF
	for <phone-devel@archiver.kernel.org>; Tue, 15 Feb 2022 15:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240219AbiBOPyy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:54:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiBOPyy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 15 Feb 2022 10:54:54 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E8B9E540
        for <phone-devel@vger.kernel.org>; Tue, 15 Feb 2022 07:54:43 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 350D740333
        for <phone-devel@vger.kernel.org>; Tue, 15 Feb 2022 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644940482;
        bh=+QObaeMvuhGq3vTB+Qm78jkj+7kPIGMxNc28eGSrc+w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FKtPHJvZkkKwj8a7wqDIjqcZN0bIokFQlpsxGFZzA9YpE17tECUT5vjgIUihVd8UG
         TOp2+oXvK9OjTDIEVCLLaOhCXZgBcrbqoqMga22ARDdIKpIBwNdEofwl8k9JUOYdJd
         5bLVN36ZsG4Fu0tLHCJfVZ+ByTsU4+qxeAGJHpPMyTwfrJ7L9z4KxFW+ih0V+DhubG
         vaC431GIMCw0T/bAQA8GpihnItFyWWJyMWmEB5qluONhHaOVwctBIzw/C+elyvzYzV
         INZPcGcdsykQxkpGlriaXxItf40G/ePJdcFYvAOGXBIW4g0/7uu7//FtnavuImHU/D
         mDVu60oiRXTig==
Received: by mail-wr1-f69.google.com with SMTP id j8-20020adfa548000000b001e33074ac51so8580799wrb.11
        for <phone-devel@vger.kernel.org>; Tue, 15 Feb 2022 07:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+QObaeMvuhGq3vTB+Qm78jkj+7kPIGMxNc28eGSrc+w=;
        b=MjqNdjpWDQGETCW4nB7Pkl2KdBwDGoXJiJ1lVyfmC98qb1tV2Qx0TVpWqxk5Q/XGxN
         ecKzp84KKjeDnkt5HKgjIg6HeU60YzBZbgrO4N9lYAQdJu3zXsOSyFv/lnZ8eDzLLOIJ
         7xnBp4Oy3kDtxe8LOwd2MVTQbjWi35Qltl5D/Bqy8F84wEdF3eyV7c2Z3YfCDLV5nmyB
         MQrC0DbCp/9gwHSj7Z733EoRddzFONYB6Jc8MRWrpIuQ1nHHOG2sxWU7KhtrtbeFptBm
         RPskzRSc1lbfxBkSrb7rR1dkAnL/xN4clUDLTIyRP0xScoHaHwS1jh6ktg9DYWI5EVMU
         EoSQ==
X-Gm-Message-State: AOAM5304s84qg5zTIFcHzKEPxRgu+hDM4AoTmyvymJI/+OPmPqCTtCiX
        ALL0J4pLBm4GPENgNHlH2fYsZc1W3ogq6GtpfhFwOPrfN6jfaHC8tOcDLvOj//ocbpxWZNIGfrB
        jvWm188uH0adQSTHxQMBxzrI9gUAX1jObLAnKQKlZ
X-Received: by 2002:a5d:5983:: with SMTP id n3mr3851931wri.382.1644940481889;
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoVBW/CLXsO/TypyE7MepwQ5iRogRbIei6GF1U49AerV7YaFDlihHa86IrATrYYtw77ahJ0A==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr3851917wri.382.1644940481649;
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
Received: from [192.168.0.109] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk5sm20865734wrb.10.2022.02.15.07.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
Message-ID: <0bb07d0a-838d-b772-91ca-aa31b57b2f3c@canonical.com>
Date:   Tue, 15 Feb 2022 16:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: bindings for
 Imagis
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1644531943.391463.3262540.nullmailer@robh.at.kernel.org>
 <20220215151527.84634-1-markuss.broks@gmail.com>
 <20220215151527.84634-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215151527.84634-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/02/2022 16:15, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../input/touchscreen/imagis,ist3038c.yaml    | 75 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> new file mode 100644
> index 000000000000..7b127817e1f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagis IST30XXC family touchscreen controller bindings
> +
> +maintainers:
> +  - Markuss Broks <markuss.broks@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^touchscreen(@.*)?$"

reg is required, so @ is not optional:
^touchscreen@[0-9a-f]+$

> +
> +  compatible:
> +    items:

Do you expect here multiple compatibles? If not, the items are not needed.

> +      - enum:
> +          - imagis,ist3038c
> +
> +  reg:
> +    description: I2C address

You can skip description because it is fairly obvious, but instead you
need maxItems. Alternatively, a list (items) with description defines
max items.


Best regards,
Krzysztof
