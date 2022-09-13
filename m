Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE220C6FA89
	for <phone-devel@archiver.kernel.org>; Tue, 13 Sep 2022 14:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbiIMOAe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 13 Sep 2022 10:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbiIMOAd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 13 Sep 2022 10:00:33 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6100319C36
        for <phone-devel@vger.kernel.org>; Tue, 13 Sep 2022 07:00:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so906041wmb.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Sep 2022 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YTIg1OEXQ1/dcwcVxi+ZGuAdkeMfYekXYmzBim0nPwo=;
        b=hrDCYLEP1zzGWYMHHDLGYWIigPeQSwQMzhJFuPFlSGf/ZedgoAtZUQ67l9GsBD10oq
         LQ61+//hDPef+UROY1UFHL/IOKC/t1jMkimOMibMBfwcZBes9tc6Ob6qRVGzPVanIcBI
         OnmMgK6IwI1Dr2T4JN8Ws4DTyPkEBvP7DFYGYHnS+NYHZbiZfNkxeWDaO5RVgG9ytyJD
         2tGLX4UxKzZHQCifoq23qSC4Awc828J+PUfR7b7l7yFgAzVzE0urmluDMBkLWwrqUKNY
         yHrlr+dJ/gaeIefR5sn07jQualrsm48m9IFNGNHrAs0f8WqdV/XWQHvIMC1LXKnU33W1
         fdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YTIg1OEXQ1/dcwcVxi+ZGuAdkeMfYekXYmzBim0nPwo=;
        b=dFuYM6JQkvXdumNSk7FqpaqYOrBFpiAfchp75R95CzLSFMvEeLmzVOONRRkXQVQsbS
         L2Ho7Mv1GTghacJaiMnTO+iOtbBptvI2oZyBunSlHw0eIABwOpZ9MaxsXlaQOaIiE4Jm
         WacImesWGpt0hLBIJ55nuiTWrwV1ATaMhwIWcS/X7eyPFQPiMw0m7IcfWumK/q/BA0Tg
         qqVkOoaKYFDHYzzzOChcf2v8aM+9jczprw9fgWf+M8l1Asz57kNBcNE2KiAFCTXvkum4
         Rt2zQIScb3og8wqeG/YyaaEVymoLS/PJ0ZYw1kUzTa3XE3Q4Ykn5gczCAGuF9tAYxuN8
         enMA==
X-Gm-Message-State: ACgBeo2OnGmsFBnsOungDFFI7wCMtvMCvUw/g6tFvECR9NN7HBO8CWMi
        jSg1zNlKfuNgPF3eGbtgj4A1tw==
X-Google-Smtp-Source: AA6agR6eb5yCW6EoZ0KxQRuBsKpwheJjnMgMzi9W9LXmWNAhnASIkVMi98VWdxKNTTbBTWXhTT3Usg==
X-Received: by 2002:a05:600c:1e10:b0:3a5:4f31:3064 with SMTP id ay16-20020a05600c1e1000b003a54f313064mr2490080wmb.136.1663077630890;
        Tue, 13 Sep 2022 07:00:30 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a7bc001000000b003a5ffec0b91sm13123005wmb.30.2022.09.13.07.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:00:30 -0700 (PDT)
Message-ID: <affc47aa-a11f-d18b-7c6c-a3698d97b3b4@linaro.org>
Date:   Tue, 13 Sep 2022 16:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/3] dt-bindings: mediatek: Add bindings for MT6795 M4U
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, joro@8bytes.org
Cc:     yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        Rob Herring <robh@kernel.org>
References: <20220913122428.374280-1-angelogioacchino.delregno@collabora.com>
 <20220913122428.374280-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913122428.374280-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/09/2022 14:24, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
