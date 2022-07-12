Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CAFC43334
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jul 2022 14:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbiGLOIO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jul 2022 10:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbiGLOIN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jul 2022 10:08:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C302C2FFFD
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 07:08:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r9so6125969lfp.10
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IUDupCeEXQ/0U2Mq+8j8TVT3HkTwF7WNPO4buPs4r6M=;
        b=QYvKlU7dEHkaxWeAgxfsF7vxBdm/zDsF+uuntI0ZjZp2eHQW3sdICr52wnSvfAAqk/
         xqPicfiGubAHcZxPV0vqcT7lcEqnZI8C7Q0mwu+pDS0gH9qj+XmkB8OxDjDi561+v38E
         C+sElDXj830YwXWoYoAqURjSNfMYBVM2zw/QUM2x9489UNhtzbCZ5+a5BSVAZEQQbc8Z
         ThNy5NFkPiYV+DIle2PSnvuqSlll+S8ql+SEjRPKQYzuqfXwduHzAYcpxcJRsqUCLqPI
         Akbpi8mXiuBQYdtH/68IF5DKjpEfFw+oUXv8BB8hMaQv9Uk2cJ754oyLE645GWMGbij/
         9Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IUDupCeEXQ/0U2Mq+8j8TVT3HkTwF7WNPO4buPs4r6M=;
        b=vTGuOB2r4NEA/oFNGIDsxnGPl1EYG8yqQyGOIQ4z6GIZZZxICN6JqXm4CMvHr7BOQ7
         JXKJNAAnsBocLfPWgyFT1JcN3Av0Y548DAAHqS6/3PSxKor1G24lTgW9ZaNm+xFpBia1
         MU7EpyPAFqLjsmdjtw9erkIymKLFbt0GLRFm8KHvbPnHktAJ7Ek4HXr4GU+wUWIdoLDd
         tex2WIsOuSRjGZpFVJeBDQkDKmVdEKxeqoWNryYWbVxi3ebWPFv6W8CGvfNwf9LGvrDY
         e8ymiDN2u2mZd1e7bGG2kx0kj2pkE65jYZnveZswQELmHfCHF8LXWgzwRlbxCd1hIzMP
         2N0g==
X-Gm-Message-State: AJIora98syXSiTgoSYRfCdFXh0pWEuLE8yr0VrAn0q/Y7Avvd1bjBZOr
        NxVHSEcVsixeJvI68MgNuwtjOg==
X-Google-Smtp-Source: AGRyM1tCEXL8eb8yUBVXFnt5nQBt+dmZ3X4wqpUocjCz9IgpH1o5xI4GOGU1U4fDZ6ZvjrzDPG72Mg==
X-Received: by 2002:a05:6512:2394:b0:489:e432:bca5 with SMTP id c20-20020a056512239400b00489e432bca5mr5786126lfv.537.1657634888923;
        Tue, 12 Jul 2022 07:08:08 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id y3-20020a056512044300b0047e789b9700sm2187900lfk.118.2022.07.12.07.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 07:08:08 -0700 (PDT)
Message-ID: <1c90df71-4db0-9d20-e41b-2dfdce8d6456@linaro.org>
Date:   Tue, 12 Jul 2022 16:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To:     MollySophia <mollysophia379@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220709141136.58298-1-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220709141136.58298-1-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/07/2022 16:11, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>

I see now three different patchsets, twice v1 and once v2 (send shortly
after v1). This is confusing.

Best regards,
Krzysztof
