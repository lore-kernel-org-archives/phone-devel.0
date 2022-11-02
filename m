Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87DBC433FE
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 18:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiKBSdb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 14:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKBSd3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 14:33:29 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F2D2A43C
        for <phone-devel@vger.kernel.org>; Wed,  2 Nov 2022 11:33:28 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id l2so7202142qtq.11
        for <phone-devel@vger.kernel.org>; Wed, 02 Nov 2022 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jsBbxM68g4hu49oQPI04Z6ZuqRO93ekJAZVTY7G7PE=;
        b=XlNJsDQtwzg6thDxRfW7oyVabaE2Dtnv/wbgUbwPgBy0+XqBFYVwi6qmv4HscjWEhM
         VWhx/y99ZMsZUYDtYCoc6a1jm+hVyYv2ejTZz+QNyQyGu3suM0zFQ9GKJwgi74JdnRkx
         sNqwWk8UtdsMQgiEO5V/DSnwsTwFP7i/NkY7FNDPoku9AtLwgZETxiAi+4d6VmpAH9MW
         EFCN0NRMtXbQ5Crk+lHl0Gv0AjPMFmDmxpbOHNnbStfBxmwaUgFXqA7wbC5aJJiaGpzj
         zny1gvUh/5vZgBheuq20VWSeVuegfW2/ZcASG0Bf+9W0I0c2vCnRSAxGlWXJheqybn2/
         5wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jsBbxM68g4hu49oQPI04Z6ZuqRO93ekJAZVTY7G7PE=;
        b=5Ur3SwZy6WrnWi8swVFHozpazv60GIt7wCs3TJUZ0SMxRvsaz+pCSTlMLuWMdC7w0V
         hJd5VHMz9h0eJUTSjm2t8KoPtvQzXTV9Mg5Dj7zRXXof+r6qa6AXvAlIvrpBTqGfSjok
         Y0mWNua6YmcFDKlRxD75MbIp4xg6JJxpbdOVzGG43F69ol2Pe8X+cGJEFfQX81iP7q0l
         k6n3Md3Glphqk24kW//DcWiUsqr02QHxx+JGZbaJfToBzDApDyg+dY0ssQo0ZINa2fmh
         zYC4anOZyEzekqbNLpqy8AUmeT0u4UBtVUHaL0DoiIyLukSqdQJQLRPnpeZY6wARmPkL
         i3LA==
X-Gm-Message-State: ACrzQf3fYvi/evGAxr8PxCqWPhYje6R5mjNIrwhE3GkrQLsp5hnOXa4y
        7YaEmU+Tnfh4B3dzN1WR8Zrolg==
X-Google-Smtp-Source: AMsMyM72M7UDRorVLYAV/MhAIyKp6TXC/eN/z5Cvcc/FAEYGFSLv+6M0ttEcE0C6XUuL3Ts2Z+wFVg==
X-Received: by 2002:a05:622a:1014:b0:39c:c5ef:c768 with SMTP id d20-20020a05622a101400b0039cc5efc768mr20344412qte.525.1667414008128;
        Wed, 02 Nov 2022 11:33:28 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a454c00b006ea7f9d8644sm9125353qkp.96.2022.11.02.11.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 11:33:27 -0700 (PDT)
Message-ID: <1c057273-2651-dafc-0b13-e3b958ac1d2f@linaro.org>
Date:   Wed, 2 Nov 2022 14:33:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: pm8941: fix iadc node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221031182456.952648-1-luca@z3ntu.xyz>
 <20221031182456.952648-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031182456.952648-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/10/2022 14:24, Luca Weiss wrote:
> The spmi-pmic bindings require the iadc node to be named just 'adc'.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> * Drop changing double compatible, now bindings are adjusted
> * Pick up tags
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

