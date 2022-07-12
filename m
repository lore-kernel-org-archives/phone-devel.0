Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBF7C433EF
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jul 2022 13:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiGLN1I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jul 2022 09:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiGLN1H (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jul 2022 09:27:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B2E93C1D
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 06:27:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n18so12223721lfq.1
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gq0wH5vmV1ZhzQHv6wskPp+9rbt497AshKhkdFthSS0=;
        b=i1cZitI/qU/uF8X/S6ILySXGVoa8rPF1QiqE8qJ2k7Px78NE2xf59hOcFwr2cpi+Qj
         uzZmHhup+VOOjaWZfIsBVADPtwZaKD5wFvJm5CXmQUcJwcgy7AjK+06HKfBuOcLSBTgp
         J0WyMoC1eEn7GDaUixgZub2AqdSQAC9CDKzFIAI6JufOu+YBxo8VtcleIeIcXjLzfIkM
         7W8FBDtA+I2c9sBz9J9yJwDt/+s5aPz7N216da+j7m+f8SGs4wEgvkLNnhV+rR8H/kWD
         NvzydLUL0eTXpNd346BwTU3OvupYjWrnngDw6YQ8ThFywTW491e4L1qXVCwYe62y7AXm
         yHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gq0wH5vmV1ZhzQHv6wskPp+9rbt497AshKhkdFthSS0=;
        b=SV/fB/q0pvL2Coy+sHYNvhbIW7CbHlsjPAhBhw3AIhLP0XdhG/OUMYI7MuAqu1rTij
         F8T6DtGFL3WZhtX8bIFMWA+1Yvnctk+gcrFQ4/rRT1whlDxwQcnfi1rNXhJBclTpFIN7
         N528OGcr9NGRX6M5wKQLJIzabAu55xieGpWg3xJLI7Amw6CCYdd742YxO8egs0H4OdW+
         S9McUVgUEJ4TADJUAtN/aAU0/zIbGJYf4YDPJ4v5ccUaEA3G79t2XZcVoZPmKHoIsg25
         4w/s6IfagOWmK4Vk4/njcpaGTIF79GmA1TULwZUJAAmD/ybJLsnTzGF/ldoALF0/HhBi
         HQqQ==
X-Gm-Message-State: AJIora9POKCT7gbkUTtsJLoajNGXZrLuyHW6xw/a6eC+VMMLtai2JmO4
        g0Spzo+2rwtewMMDBZDNp0AO/A==
X-Google-Smtp-Source: AGRyM1sWm1BNKGI6GSzhbgEXcdu1G7LjnBhmE8T3/83bialcpt43Sgg+e1hc5ScPFpCXCi3CfVdO1A==
X-Received: by 2002:a05:6512:3125:b0:489:f4ba:d5a9 with SMTP id p5-20020a056512312500b00489f4bad5a9mr1800051lfd.348.1657632424490;
        Tue, 12 Jul 2022 06:27:04 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id h23-20020a2ea497000000b0025d5889d19csm2448568lji.38.2022.07.12.06.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 06:27:04 -0700 (PDT)
Message-ID: <b1829902-c271-a677-f423-99dbc85cba89@linaro.org>
Date:   Tue, 12 Jul 2022 15:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] Add support for Xiaomi Poco F1 EBBG variant
Content-Language: en-US
To:     Joel Selvaraj <jo@jsfamily.in>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <MN2PR02MB702415D7BF12B7B7A41B2D38D9829@MN2PR02MB7024.namprd02.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <MN2PR02MB702415D7BF12B7B7A41B2D38D9829@MN2PR02MB7024.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/07/2022 13:12, Joel Selvaraj wrote:
> There are two variants of Xiaomi Poco F1.
> - Tianma variant with NOVATEK NT36672A panel + touchscreen manufactured
>   by Tianma
> - EBBG variant with Focaltech FT8719 panel + touchscreen manufactured
>   by EBBG
> 
> The current sdm845-xiaomi-beryllium.dts represents tianma panel variant.
> 
> To add support for the EBBG variant, let's split this into 3 files,
> - sdm845-xiaomi-beryllium-common.dtsi which contains all the common nodes
> - sdm845-xiaomi-beryllium-tianma.dts for the tianma variant
> - sdm845-xiaomi-beryllium-ebbg.dts for the ebbg variant
> 
> Note:
> -----
> Both the panels are already upstreamed and the split is based on them.
> There were patches earlier for both the touchscreens, but they are not
> accepted upstream yet. Once they are accepted, we will add them to
> respective variants.
> 
> Joel Selvaraj (5):
>   arm64: dts: sdm845-xiaomi-beryllium: rename beryllium.dts into
>     beryllium-common.dtsi
>   arm64: dts: qcom: sdm845-xiaomi-beryllium-common: generalize the
>     display panel node
>   arm64: dts: qcom: sdm845-xiaomi-beryllium: introduce tianma variant
>   arm64: dts: qcom: sdm845-xiaomi-beryllium: introduce ebbg variant
>   arm64: dts: qcom: Makefile: split beryllium into tianma and ebbg
>     variant


None of your patches reached recipients and mailing lists.

Best regards,
Krzysztof
