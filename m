Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1795FC433EF
	for <phone-devel@archiver.kernel.org>; Wed, 11 May 2022 08:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243571AbiEKIWg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 May 2022 04:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243578AbiEKIW3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 May 2022 04:22:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469EE3A199
        for <phone-devel@vger.kernel.org>; Wed, 11 May 2022 01:22:27 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id n10so2490728ejk.5
        for <phone-devel@vger.kernel.org>; Wed, 11 May 2022 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IIOcJgbS1/hMQQvn2DCFX+BHhbtb4xhB0glTejG9nd0=;
        b=nN+tvnytLjTaJLXUpNkGlrL31C7UW1pB6NFTtmXaTXEc/E6YrG1OIKgpwVMC8S+kVK
         D0zGHuOSWn6VMDT5RVsCrOPzqDPn+ynX+2xgsLJ+esu5HFhKI1L1FfojyWFbLtSNbXuS
         1qXyVZ1jTq1c48DPsEHHWi1ElZ8UTZzr57W1iPjRSdUmmWlSe8Hm8Pc0jYi+i4kpwRAW
         hH+yxI/z9Cc1NoWL0nAk+IMz8mhUv1TWwTqWJaA1lqsWAnJvZ/pbzRI35MVvlcqiK0bh
         yq9FIOhP2dWozNqsyasJ2s6B/nnu1uuSBahdmKMJDmas8sdvCmBeg2zvG6YZlvRLOBiP
         0WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IIOcJgbS1/hMQQvn2DCFX+BHhbtb4xhB0glTejG9nd0=;
        b=KLElvcgmHoA5W6oehRhoijBMH6/1oAsy8l+JWnzIFu7R49ELLyawBQovuDQwk2lun2
         hJAU1J1NBkXoy5iiVFz7172IWqfu9ckXnpytFqcKcjAR0dXmWn+Hrcgdrl4xHPtRGQNP
         Jmw010Yjei9UClCAPx92bCnfdOfXPMECXSueMppcH0NgFvc03teBSMXNkyiAjp6DLOeZ
         muMQ8hof8WYnVZovslTRq3OjcIb2IZNy2kYIU4UpciIu4uxKe8BbRQTFmCp+7NLtja5o
         pH0lNAsgQ0bIFimBtJx9ZW4McFzS+iU8Qt4U24UJuv1cCK6Y0lNaPa1osvQlgregsy7O
         VN4g==
X-Gm-Message-State: AOAM531m+YmEPngHQ2zAck679Ixe3ymMyP8HMnqw6VtRS9n9/YRplnCb
        pkWQ0IGVFHb1uKsunRdxc9JKHQ==
X-Google-Smtp-Source: ABdhPJyQl+2i2St5QQZxqWfls/5xIarQ0xgPypRKf/p7aX8oprL7xHpOkr9jt2CVt3KlxWwPkWf+7Q==
X-Received: by 2002:a17:907:16a2:b0:6f4:eeb1:f7de with SMTP id hc34-20020a17090716a200b006f4eeb1f7demr23680710ejc.446.1652257345815;
        Wed, 11 May 2022 01:22:25 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q20-20020a17090676d400b006f3ef214dddsm686150ejn.67.2022.05.11.01.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 01:22:25 -0700 (PDT)
Message-ID: <7783d64c-e48c-5e3d-9560-51197234051a@linaro.org>
Date:   Wed, 11 May 2022 10:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Content-Language: en-US
To:     Joel Selvaraj <jo@jsfamily.in>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hao Fang <fanghao11@huawei.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/05/2022 07:28, Joel Selvaraj wrote:
> Add bindings for the EBBG FT8719 6.18" 2246x1080 DSI video mode panel,
> which can be found on some Xiaomi Poco F1 phones. The backlight is
> managed through the QCOM WLED driver.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
