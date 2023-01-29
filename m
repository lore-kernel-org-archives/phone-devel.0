Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9703C61D97
	for <phone-devel@archiver.kernel.org>; Sun, 29 Jan 2023 10:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjA2KmE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjA2KmD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Jan 2023 05:42:03 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ED722A3B
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:42:01 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso3483829wms.4
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qu9zW2/pcaEz98l/exRBjyTn4lCXJa/N2NbVQqkOAs0=;
        b=Yie2IrLk4VUlOlToT1fVVBZYfikeER8gNpgPeAkT4yT2vg7juPBsECXpziV/K30RXf
         G0tK0hKV4kyb9NyXFy/4BdEr0/fqzKgOfguZPDz2AJ4PSOEaqjWnl8zoFk4XupLSnOTY
         6ikI0LX5N2SF1jlqex53K0UXXoJudfJJf4zvsVFuEXQRKU6muF+vzFqZMmEzzsxNfowm
         9zb9veMKsBzVta1R4CJr2H+oYfsk/93TpA9YPnQOjfGMjgHk9iSsvEmlSoJUTJe7Z7OJ
         5DHkBMdcoZzHG1NjXP6LNFT5JRiY2hdvfYdDhoQ0Cds0mqn94r3tkTGLxM4ahzFDuJwF
         4A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu9zW2/pcaEz98l/exRBjyTn4lCXJa/N2NbVQqkOAs0=;
        b=qzM+Vo5hDc919u6BtGRB8ti5fbrYL7fOsSXdGJ98krS+/vTp6LRptapZZHI/AponGS
         cNstPjOs+kmi3Gb3TqUZ4Xp+tg63WLdgO7VaWsZAnym1XvJh8V3il2YIRU2JQumFp3pD
         OHrALWeMUJDSMgTfb1m3bMGlJl1eEVsExxZXXGyPQ7n/TO3GA/k3n+g0dy1uJzZzXnj0
         FWIC9XJXtIUl7eia+VTkYRzfYynytoMOU6+QaaKvm6jSIHgyEmuVX2rZT2o8yIMRzfsm
         EyEn5wXBFbyw4SJvstM8IMIrM3kXPNju3FBsIYnk9BebZuc8/6/e0gTE35bVuQDRsHQZ
         K4+w==
X-Gm-Message-State: AO0yUKVNm3FPDLhoI8uYjziyNfC7/+xjolKpzovc3e9Uwqy6o0GLhk5U
        j0kWmfioEL1AuUOA1nucaq52uA==
X-Google-Smtp-Source: AK7set/qswB8Rx+YqebPoBwWCnixpuhJo9pEd2rUApyZolTbgY24FcSrGlQkzfI0XTQOLG08uW0l6Q==
X-Received: by 2002:a05:600c:54e5:b0:3dc:4f2c:c856 with SMTP id jb5-20020a05600c54e500b003dc4f2cc856mr3793689wmb.32.1674988920896;
        Sun, 29 Jan 2023 02:42:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c17d500b003dc46242c4csm4430861wmo.10.2023.01.29.02.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 02:42:00 -0800 (PST)
Message-ID: <d4b53d69-2d09-438b-0419-6eef4ad6b254@linaro.org>
Date:   Sun, 29 Jan 2023 11:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/9] ARM: dts: exynos: move exynos-bus nodes out of soc in
 Exynos3250
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
 <20230125094513.155063-3-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125094513.155063-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/01/2023 10:45, Krzysztof Kozlowski wrote:
> The soc node is supposed to have only device nodes with MMIO addresses,
> as reported by dtc W=1:
> 
>   exynos3250.dtsi:775.20-781.5:
>     Warning (simple_bus_reg): /soc/bus-dmc: missing or empty reg/ranges property
> 
> and dtbs_check:
> 
>   exynos3250-artik5-eval.dtb: soc: bus-dmc:
>     {'compatible': ['samsung,exynos-bus'], 'clocks': [[67, 16]], 'clock-names': ['bus'], 'operating-points-v2': [[68]], 'status': ['disabled']} should not be valid under {'type': 'object'}
> 
> Move the bus nodes and their OPP tables out of SoC to fix this.
> Re-order them alphabetically while moving and put some of the OPP tables
> in device nodes (if they are not shared).
> 

Applied.

Best regards,
Krzysztof

