Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99651C433FE
	for <phone-devel@archiver.kernel.org>; Fri,  8 Apr 2022 15:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237383AbiDHPHi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 8 Apr 2022 11:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237420AbiDHPHe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 8 Apr 2022 11:07:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4A92405AF
        for <phone-devel@vger.kernel.org>; Fri,  8 Apr 2022 08:05:30 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n35so5679418wms.5
        for <phone-devel@vger.kernel.org>; Fri, 08 Apr 2022 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=z2vqFQdPAyfvut6ovQoXQ5XOm4NDygCMv5XEJBGIwVs=;
        b=kZbVnHdSrExx7M2nYO683DIu9cLpkisfrS1P7V37RaHZVOCRV6srvL65ZqTkgVgpps
         5es1L1ZX8PiQ6lYbBqafkUOufe0j48/IAtOG7kYWyFGkMUmjVJ8ypzm/SI2w1sdQR5P1
         2lZroaCY2AVXV4lNW9kMFwge7FxP+Dm2U7tamg63N0QSKHVeVE7TOhT0wwD65RqnVfWu
         6LgitVy/dU9rQr/Ddx2Q8d1ay/ddTBYfj7X63J9gyHcS0dhn3xZd+JFNG8WqXEqzdkKA
         sZ8MKmIUPDQRPFgnyPigaKFfyBrT3C6gKcZNb8jiYsr8TRg/uUGPvlXy6QoWviwnHxss
         smhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z2vqFQdPAyfvut6ovQoXQ5XOm4NDygCMv5XEJBGIwVs=;
        b=j9T153kjOX6ewjw0XTibLBVmDHbKFJnRTBuCM12TadZOUEpOycqtUQrK6a2N5FS6iW
         tp+ZOjYy7dbyt0Ju7O8im3s0D4EgwK8EtERdwFUN+hnyyvN624G3ObP1gRcc5BmIo4ZZ
         mY7K3N5jRRimGZGtSn3syIKLX4aBXCnr7wogPR5ewXAmAc14umKXL+j8KL+3snj2Hfjz
         d3G06Q3GhKomhOTofdf8NVKJDDqtThJuppHmV+fcSpHDNYC4JIBRfocCjwRt1VpUAOt+
         7zqU1/Oxh+J+rMMujmoCRe8ZX4qkMB0WqzJ77kE6qY0L5rRjtY+FiREufgH1DeVy3JO9
         zBhg==
X-Gm-Message-State: AOAM531jYplY4FHAmfo3nOmWkCrkd7OR7M30R14thrZyzgubaeih9S14
        6/Fp509mUHx7LvGpTUItI2iEDM3symTfuOoG
X-Google-Smtp-Source: ABdhPJzaJKjlfwBc4j57iWbiUBbG/JGU1kd5M0DvZJTA45YHU8Zkq5kzdGmXh1xKiEp/TQEZIXxUVQ==
X-Received: by 2002:a05:600c:4f42:b0:38c:21:fffe with SMTP id m2-20020a05600c4f4200b0038c0021fffemr17300289wmq.63.1649430329411;
        Fri, 08 Apr 2022 08:05:29 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b0038e8fb63293sm4576689wmq.22.2022.04.08.08.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 08:05:28 -0700 (PDT)
Message-ID: <1a45984a-752b-6bad-0320-f0946d83f2b9@linaro.org>
Date:   Fri, 8 Apr 2022 17:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: input: Add bindings for Awinic AW8695
 haptics
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220408115311.237039-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408115311.237039-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/04/2022 13:53, Luca Weiss wrote:
> Add a document describing the bindings for the AW8695 LRA Haptic Driver.

(...)

> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to RSTN pin (active high)
> +
> +  awinic,f0-preset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Default value for the f0 of LRA
> +
> +  awinic,f0-coefficient:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Coefficient between actual f0 and the value in the registers
> +
> +  awinic,f0-calibration-percent:
> +    maxItems: 1
> +    description: Limit of f0 deviation from awinic,f0-preset
> +
> +  awinic,drive-level:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Level of drive waveform in normal driving
> +
> +  awinic,f0-detection-play-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Drive waveform play times in the first period in the f0 detection

Use standard unit suffixes for known units (e.g. time).

> +
> +  awinic,f0-detection-wait-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Waveform wait times in the f0 detection

Ditto.

> +
> +  awinic,f0-detection-repeat:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Repeat times in the f0 detection
> +
> +  awinic,f0-detection-trace:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Drive waveform play times in the second period and later in the f0 detection
> +
> +  awinic,boost-debug:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 3
> +    maxItems: 3
> +    description: Values for BSTDBG1-3 registers

Do not encode device programming model (registers) into the binding. You
need to define it as a property related to hardware itself, not its
registers (e.g. boost value in mV).

> +
> +  awinic,tset:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Value for TSET register

Ditto.

> +
> +  awinic,r-spare:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Value for R_SPARE register

Ditto.


Best regards,
Krzysztof
