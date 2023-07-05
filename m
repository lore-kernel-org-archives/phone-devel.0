Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E24C001DD
	for <phone-devel@archiver.kernel.org>; Wed,  5 Jul 2023 09:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbjGEJyh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjGEJyg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 Jul 2023 05:54:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817781719
        for <phone-devel@vger.kernel.org>; Wed,  5 Jul 2023 02:54:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso576135366b.3
        for <phone-devel@vger.kernel.org>; Wed, 05 Jul 2023 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550873; x=1691142873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVAJWg0I/HeACNC/zy3nFezd4dRzO+0cU65ERxt6e5A=;
        b=IAqlJpp9lEg+99I2kgGQin+C7Sa8Ra+ZU4L5NYtlrWxz2TUT3Kow0t3BcazVaGa7O7
         6K7OnUF6jg6fALaTASBVpvEq1cshDZqIAW7p3Km4J6adCIl1ltJdrANBcAy0cfMzXzCf
         4NOPw1ZiPDfwrB9kMgXXzZiy0yrofWNtl/5j/LyKUM8Jbb6/xbUeJfDfJXxtWYwV0tzE
         C5Xb3LioIcBtVF7nDBESyR+h7NElPUwHUrNWI90czJS3vzDkIawRAY+xetKFUk/E5yol
         qgZu6zs+QI1JE8PhYVcD/kZTFxd6sUexE5U2OFTb/Mhp2bzrlH8Vu7dx6tPch4Qx50T2
         7C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550873; x=1691142873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVAJWg0I/HeACNC/zy3nFezd4dRzO+0cU65ERxt6e5A=;
        b=kglA9uPzKDosEIVjJWEBY5evbjliAac8Kuo55J/l6FuHE06YK+YhJwfuVA0BDSFbam
         xm6P/E0YoarzI+It7hSaO+Or/cNqtnfnSwhC7+a3RXZt4eA42VlmcGmwRyhK///JMmwO
         m58IdvIc0JkXmy3ztWdFlm8J0XdkmXxfBc8C/5dgOcLTBxmFPoP+c9oMtC/IoUsjoQPg
         ACt2MVN3MBqy83KVziavDflmGobUTpx39t2DP7FRzeyPYjifldX2LG9VZfFojGTG0zI8
         ZtLh58vVFArY+FRwOkCOEb+SNqiKhsCc8L9dpcKu9cLirHAfUgOtTvREK8PqnFZA9upW
         Gerw==
X-Gm-Message-State: ABy/qLYAF3Bbz+cGg5MvgAKkOWSNE6FrRGJ5OSgrx1F/kLCM9X4FgEIl
        ssOVPWeex8EmV5NyKtqto/RMKw==
X-Google-Smtp-Source: ACHHUZ5W2hGP4f8dXuvYRWTyHfTgVsR/YjxrosQO10baQksmKKLIm3VXDUX8FJMugLE7X2n1g6ZhoA==
X-Received: by 2002:a17:906:d961:b0:988:c3f9:3ad6 with SMTP id rp1-20020a170906d96100b00988c3f93ad6mr11780382ejb.42.1688550872960;
        Wed, 05 Jul 2023 02:54:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o18-20020a170906289200b00982b204678fsm14315546ejd.207.2023.07.05.02.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:54:32 -0700 (PDT)
Message-ID: <038e7ea3-ef16-2344-6cba-88d7e5caf80c@linaro.org>
Date:   Wed, 5 Jul 2023 11:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for the Xiaomi SM7125
 platform
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-9-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-9-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/07/2023 18:32, David Wronek wrote:
> There are 6 Xiaomi smartphones with the SM7125 SoC:
> 
> - POCO M2 Pro (gram)
> - Redmi Note 9S (curtana)
> - Redmi Note 9 Pro (Global, joyeuse)
> - Redmi Note 9 Pro (India, curtana)
> - Redmi Note 9 Pro Max (excalibur)
> - Redmi Note 10 Lite (curtana)
> 
> These devices share a common board design (a.k.a miatoll) with only a
> few differences. Add support for the common board, as well as support
> for the global Redmi Note 9 Pro.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7125-xiaomi-joyeuse.dts   |  16 +
>  .../boot/dts/qcom/sm7125-xiaomi-miatoll.dtsi  | 420 ++++++++++++++++++
>  3 files changed, 437 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-miatoll.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 337abc4ceb17..7ef9e7d43904 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -192,6 +192,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
> new file mode 100644
> index 000000000000..670fd63f3416
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, David Wronek <davidwronek@gmail.com>

I have some doubts that result looking exactly like other file is done
not as derivative work. Please retain original copyrights.

Best regards,
Krzysztof

