Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8D1C19F29
	for <phone-devel@archiver.kernel.org>; Thu, 28 Jul 2022 12:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbiG1MSN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 28 Jul 2022 08:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238278AbiG1MSB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 28 Jul 2022 08:18:01 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0364C6D546
        for <phone-devel@vger.kernel.org>; Thu, 28 Jul 2022 05:17:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id w16so1316803ljh.3
        for <phone-devel@vger.kernel.org>; Thu, 28 Jul 2022 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vTHkf3PkQuEgWJCGVwet40bcBQOgfr43zzOgeagd0v0=;
        b=DrB888e8pgeDAoMhrEqBNUb66SA6IcaJUsXBFF5IlGsk2uCCbZekR1kwgl3aEJ26bc
         1jNfUJm4fIzr8GBhbQcg2hRDsO2Y2tL3avvUyMynyGj610ogrHFX2ygpX8G408ESIfbB
         KxIfBvfxPNvSDWH3LMIVnqvHC+Xzl45CXdtvtN+47GmWkNbUXVYTufPdCTUvNI4jMmbc
         4V/bkz5hJu5XwxkgENOnMxmt9jNR558hunrovhY1W8Dr+JXrhi0bPajNHa77QPAPnhCW
         fjeaWrZ6iNC8gwKOGfCdhldVm8vmQJ3GKrBYXu9+UkMnrtL64h6qxMSPb7SXmhZy3gSh
         7TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vTHkf3PkQuEgWJCGVwet40bcBQOgfr43zzOgeagd0v0=;
        b=1Rpz9184RVq6+PsketYA5Aongk/gcF0b5piaf2TzZiWXm7uScFIe5fSIXYfPnzQB/j
         Fdlha0VEMpfYHQRvOgaNvElV1oWu/GqeJGlq0OFjICLEyvgVNrIfZcs6/ib/fVwy9zPv
         kmfBjdTXqBgiuYBnG49aWlYEQbcXkbgMMViqByMjZ0+Us/KfNeXdXX39gY35bDhRojjR
         ji9CmANfWvXV2sa9YRJ2+7HUaMB63d21/te/86HI/Le8IUcPUr2EexcuuytXEoMf+KhN
         yX4kWpuXLZ7pjDE9g/Nfwv7VREQfr1LCKmEgy1z0dDU8EGuHOmJ8JwiIQ3ayFV4urPvS
         o/+Q==
X-Gm-Message-State: AJIora/1fhoGBXtVBJlwsmEcNcjlsu8yoq9vdAhi8x1Q2PZYWQhrNXDR
        Bvtvz3u0Wlm5bZm7wVazHbQ4iQ==
X-Google-Smtp-Source: AGRyM1vNyLPheoEf3KZBupmIsZAAYI+VF8waTXPJlh0mdoKFxZ1zqu+EszKS24/oZeb1UEHCkEQOTg==
X-Received: by 2002:a2e:a315:0:b0:25e:2e8f:f5c5 with SMTP id l21-20020a2ea315000000b0025e2e8ff5c5mr597979lje.145.1659010650856;
        Thu, 28 Jul 2022 05:17:30 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id v22-20020a056512349600b004795d64f37dsm176194lfr.105.2022.07.28.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 05:17:30 -0700 (PDT)
Message-ID: <1685ecd6-cfe7-c2f1-add5-6bfff055fa06@linaro.org>
Date:   Thu, 28 Jul 2022 14:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 2/2] drm: panel: Add novatek nt35596s panel driver
Content-Language: en-US
To:     Molly Sophia <mollysophia379@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-3-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728023555.8952-3-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 28/07/2022 04:35, Molly Sophia wrote:
> Novatek NT35596s is a generic DSI IC that drives command and video mode
> panels. Add the driver for it. Currently add support for the LCD panel
> from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.
> 
> Changes in v4:
> - No change.
> 
> Changes in v3:
> - Embed the support into existing driver (panel-novatek-nt36672a), as
>   these two IC are similar with different initialization commands.
> 

This does not go to commit msg (---).

Best regards,
Krzysztof
