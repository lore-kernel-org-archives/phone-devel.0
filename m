Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A207BECAAA1
	for <phone-devel@archiver.kernel.org>; Sat, 17 Sep 2022 16:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIQQjD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Sep 2022 12:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIQQjC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Sep 2022 12:39:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F101A057
        for <phone-devel@vger.kernel.org>; Sat, 17 Sep 2022 09:39:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id r20so17049355ljj.0
        for <phone-devel@vger.kernel.org>; Sat, 17 Sep 2022 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jv8GEPaOzA51HS42MLvcalei0LdzBjeg8X2ynLQXFTo=;
        b=heonmGT9UlfLGrV2gjcSr8TGX3oHDqHdGhNOLL9xAzFdmqQMLLaaaOOR3Q5FaviTh5
         9xQtvr17nJFnShfA1FCAQ/VTl0WF4Lgxx+68mnZgfqOaL8CCKch/U3GKVHgdKIwlXkf6
         cEbbW5GluXUGX6/56iNExCxQKKzWvQF6SAf9pIjC15cPu2yM4KPo1xKNzoiBtAr1TaRb
         fuDuues6pjvf/bqrhArFzj6C6IrlwZowWKHPEsOvgDxxRurcvTKgQGm0Vtqw2gH05jV3
         IY6b2LyLW9Fh58UFuBx7jzVZeZ614WPmLsnGQes9dOUDMMI4xVu1lrEp/1CYsBAmvNa2
         +fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jv8GEPaOzA51HS42MLvcalei0LdzBjeg8X2ynLQXFTo=;
        b=jA0a2UWwsEh9Ke9KIFyM6VO7xTBZ5U6nIvC1quq4tpQmK5e1bopRd4Dg/uB1369O6w
         4fk0HfbPEhitXi7l1Brz5ZFX4qsuTfAOQ/LbNxOdAhHppXoVcEh9iutbUM2eKnGhgdvQ
         Z+hyZ0PwBStnobusf/gzxXCwNNS5D64v4nqvdXm2DKLWDO/uZnnG5kLzc/1F5GDtWo/W
         kMSvjcPMB8ZuaSyJSTnWdksCKBC63hTDtnTEas6qDLwc6ukP+i2/zTuLdzQLh3LzQJfL
         RAU8TIFUOPBiQV1FbIY4F6BuoLrezqB8RkmX+rlkCBZK0qVO28B6yxcd8QezCY4DgVeg
         XO3A==
X-Gm-Message-State: ACrzQf25zaGXdOQyh0q2CZqI0Vk1ro5ujGrNMMAwIBdCQPb8Jwdw9A31
        v7Zi+bol38b6bW+xfgoh6DVyh7aqFR+ObGLo
X-Google-Smtp-Source: AMsMyM7IFRyWB0vbDFXPb7MWxW0iXecCmHjk4Yuy4bpxirZcEDAPPXFBXhO44aAlWeu47VI1U9hSiw==
X-Received: by 2002:a2e:b16f:0:b0:26a:c77f:9f49 with SMTP id a15-20020a2eb16f000000b0026ac77f9f49mr2978803ljm.112.1663432739465;
        Sat, 17 Sep 2022 09:38:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 28-20020ac25f5c000000b004998d9ccb62sm3802898lfz.99.2022.09.17.09.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 09:38:58 -0700 (PDT)
Message-ID: <31c979ea-88eb-8ac1-7433-607fd8202c1d@linaro.org>
Date:   Sat, 17 Sep 2022 17:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: input: qcom,pm8xxx-vib: convert to yaml
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220917155705.2284-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220917155705.2284-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/09/2022 16:57, Luca Weiss wrote:
> Convert the PM8xxx PMIC Vibrator bindings to dt-schema.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
