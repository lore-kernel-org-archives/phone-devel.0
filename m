Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23A4C76196
	for <phone-devel@archiver.kernel.org>; Tue, 11 Apr 2023 05:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjDKFzt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 11 Apr 2023 01:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjDKFzo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 11 Apr 2023 01:55:44 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5801709
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 22:55:42 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94a34a0b531so170289466b.1
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681192541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIcu/5Vwec/5pmDwua6bnzxrZjxm6tYfo6xjgw1aQHk=;
        b=E5jbpYtMChv4wnKHQBV1sgtQMtfvAnAqYOFbf9v9NvIbVBCisFzEDLeNgxGzA8mzxG
         F4twwOCb2CowY08cCpc2qlbLWk5IKswvsGSNgpqIlLX4aigXpY/ts/WdeJMIWAvDGyF6
         NjXYCE0mxT7hYj/JxNOws/gVsFEIJbaBLSAHwT26Wh2kqDBZjQraT+yUbe1vEy8wL3mE
         QTxL962tJTvy7qb1N9rA1bcSIbHCj9QqxQM4PceCi5MnPoLvXV1laXnXCXCz236FG9ce
         cshMNCHLqsUuFgtID4orwDUdbec0V/DMvaHxZj1oZfA5UuBdaqzXcoL/BG2UumQ8s/8G
         5Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIcu/5Vwec/5pmDwua6bnzxrZjxm6tYfo6xjgw1aQHk=;
        b=sUfBLjfsh4elWNIfn9zh5LJw00nAzMSPQL2BAs1kWzw9rYLkEduXML9pNHj2vAqtpH
         NJwwf7idm/Aq/wqtxIa5KirWXDlQ/Te2HVdbh18I4PQdrVMz8XEKdnZ/QRkeEkYQacMG
         9rW87035cFCVehymeZ6xtpmaOMlGAZ5GRwSwLDmXQwjp1QJZo8IoTnG2zN9CAYH9jXw6
         k6627Guajt8tvt6SZnRpKVm0LIMj3OhnB4pqwlSUp2G5wT6jg9EhbS7F3Aob+AFq9uYa
         lfzol9ulix5kv9UB+RWb+6cJMDKUPB60rx/UAkKaTP+puK9LNjuEtlSmBBmd3oxC8KJu
         NQ2A==
X-Gm-Message-State: AAQBX9eyOG9y09+S9DQBazcX6hLhXGRHsoCDo6g3YqBuYcvWMIsUSLY/
        yg7Pzg4blvvm5IwiPjayvSkHDQ==
X-Google-Smtp-Source: AKy350bGvkN4SiYmY0SbOi6V11nu//NdPAdQmWpaiIwCulyUglnQHN+JIG8OT1crzFfyzP8mLu8xHA==
X-Received: by 2002:aa7:cd69:0:b0:504:a317:b9de with SMTP id ca9-20020aa7cd69000000b00504a317b9demr1369584edb.28.1681192540770;
        Mon, 10 Apr 2023 22:55:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id i13-20020a50c3cd000000b004fa012332ecsm4122296edf.1.2023.04.10.22.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:55:40 -0700 (PDT)
Message-ID: <f9552bb6-ea73-93b4-f15d-d5d7c326c708@linaro.org>
Date:   Tue, 11 Apr 2023 07:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/5] dt-bindings: input: touchscreen: add bindings for
 focaltech,fts5452
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
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230410160200.57261-1-joelselvaraj.oss@gmail.com>
 <20230410160200.57261-2-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410160200.57261-2-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 10/04/2023 18:01, Joel Selvaraj wrote:
> Add devicetree bindings for the Focaltech FTS touchscreen drivers.
> 

Subject: drop second/last, redundant "bindings for". The "dt-bindings"
prefix is already stating that these are bindings.

> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../input/touchscreen/focaltech,fts5452.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts5452.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts5452.yaml b/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts5452.yaml
> new file mode 100644
> index 000000000000..f42868293439
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/focaltech,fts5452.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/focaltech,fts5452.yaml#
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
> +
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
> +    description: regulator supplying analog power (2.6V to 3.3V).
> +
> +  vddio-supply:
> +    description: regulator supplying IO power (1.8V).
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - touchscreen-size-x
> +  - touchscreen-size-y

We always put required: before unevaluatedProperties. Base your schema
on example-schema.yaml.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

