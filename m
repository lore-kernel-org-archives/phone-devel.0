Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9A5C00140
	for <phone-devel@archiver.kernel.org>; Mon,  8 Aug 2022 08:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbiHHIld (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Aug 2022 04:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbiHHIlc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Aug 2022 04:41:32 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A80762DB
        for <phone-devel@vger.kernel.org>; Mon,  8 Aug 2022 01:41:31 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u6so3711602ljk.8
        for <phone-devel@vger.kernel.org>; Mon, 08 Aug 2022 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=y5ugA8azfsfwmv08OCnDpdMfq2JRwexxKkXLI/mN+Mc=;
        b=YrGRHGjPT4L1hCaK34VoCuSuWFJHDL402Nu586D7o7trPMuxXX3XsPPhpwY/nGXZCF
         yRH6o7/krXRKmZRcsBbtZ2gbPs3AKxH6k5GFXE9ReLtMxjXS6qXySehZAqtVJqtTY+2J
         9w19BNzqSKuSi+KdjhqK0wUkV93Cn1x7nhONU6e6r9mELyeoGlPSVuf7x4nmPWfS1NIB
         Lmzh7Q8idVXXoZQs55m3owp4wCtjh/EYlwz8/Cw5RJQZu9b64NN2dQJwMRdP/fUc5kqF
         vp1xC6NdK9i4tUkNK3m06BiT9cne5zjiUOcGXRRFrTOmUHpBrRcmxEdlqrnpCiDKE8+/
         wFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y5ugA8azfsfwmv08OCnDpdMfq2JRwexxKkXLI/mN+Mc=;
        b=xAu7BQxpbIoYT/lpozDz0HhE4Q7gm2MAUVfdBzvkm5IfbnBwITUedEsxoNs5+c/EU4
         8cL6Nx5hQOs1+cK4sOYJP+PAFQgdYsschDSGMWQn2AUr+SpyWtDfW1JUCP3NCmhXk0qh
         8zUiaiYY0nuGlb8Tzyk/YFR9FAMhwyOJsaa/q62SMnIWyDwloSUHZf+6vAPw1Fiel9Ky
         +nAHG+cDwFeYIFwvayXEi6wmMW6KsiyZqB0co1266n3LZzzWIUzkY48Au8OOO1fl46Yr
         ImwiosjNJWT4CWJOitWff+2vX7g32Y6dX0V0V5W4+RzutQMNyq2IcTeQHsgydqE3jlM0
         xXOA==
X-Gm-Message-State: ACgBeo3Yu3IWhAhueworZW+ZrAM6nPVX+lIzGmmCkugVOWFxfQQtx3fo
        4+RsZLFHBKiWqtmS/m8xREKNAg==
X-Google-Smtp-Source: AA6agR4RpVj2cNvz0i6zm9jUEsoiZSLWTdzMZLeiGA3YsGcsz8fbCNt2mWAzJZD2wDL9MV11owmiBA==
X-Received: by 2002:a2e:864a:0:b0:25e:4e27:56d4 with SMTP id i10-20020a2e864a000000b0025e4e2756d4mr5415260ljj.252.1659948089386;
        Mon, 08 Aug 2022 01:41:29 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id g33-20020a0565123ba100b0048b17caf05bsm1342762lfv.149.2022.08.08.01.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:41:27 -0700 (PDT)
Message-ID: <a233730b-6ac3-2cb9-cc5c-21ca6289fadc@linaro.org>
Date:   Mon, 8 Aug 2022 11:41:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/8] power: supply: Add driver for Qualcomm SMBCHG
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220808073459.396278-1-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808073459.396278-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/08/2022 10:34, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> This series adds a driver for the switch-mode battery charger found on PMICs
> such as PMI8994, and referred to in the vendor kernel[1] as smbcharger or
> SMBCHG. More details on this block can be found in the last patch message.
> 
> This driver currently supports the charger blocks of PMI8994 and PMI8996.
> PMI8950 was also to be supported, but it was dropped due to some last minute
> issues, to be brought back at a later time once ready.
> 
> The OTG regulator remains unused on devices where the charger is enabled in
> this series due to lack of a consumer. Applying a patch[2] adding vbus-supply
> to DWC3 allows it to enable the OTG regulator making USB host without
> external power possible.
> 
> [1] https://github.com/android-linux-stable/msm-3.18/blob/kernel.lnx.3.18.r34-rel/drivers/power/qpnp-smbcharger.c
> [2] https://lore.kernel.org/linux-usb/20200805061744.20404-1-mike.looijmans@topic.nl/

How is it different from PMI8998? I expect not that much, so this should
be based on existing work:
https://lore.kernel.org/linux-arm-msm/20220706194125.1861256-1-caleb.connolly@linaro.org/

Unless they are different, but then please create common parts and
explain the differences.

Best regards,
Krzysztof
