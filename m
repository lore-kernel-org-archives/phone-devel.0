Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657AAC636D4
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 11:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBMLs3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 06:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjBMLs3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 06:48:29 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018CCEB5C
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 03:48:28 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so8784690wmb.5
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pu3bp3zhZ06tjaJugEPKcBoKeuOKXsePEE4SOmhYvEg=;
        b=vpyujYDwtV7b1wUjjoSB89QIgtocHK0d7R2iISp/NW+xQJKywWq2SyNs0ACgPfq8/o
         YZKihy7kF70Fzonplh+saC8upLb/tqcowT60MVU+f9Dfs5fKMtezr/TMyEikE7KIm/F3
         5H+wR/jbmFEUU7/g9q1VIkGmtC/pOEphI0+QSb5L/RqO03gXhNIx6+SjUwqzV3fue12j
         7upIZi8U+sD3ktyz7mSWa0AZVDtHvrQA7Sv9RPpPpqA2X6ELBlt6lbzU99Gx8IIV2GUO
         mUs0NBTALAS2rp5o0uQsePXL0Rc7c+Cbbh0TRfZkiGv1eJj7jbfvbKwNxA7ya2ZaYK+u
         fTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pu3bp3zhZ06tjaJugEPKcBoKeuOKXsePEE4SOmhYvEg=;
        b=JvoaUeL+csKJGuWpzk191ylUoVb+1O8/2AyC3MyQYTNH3/xKzUP16Bm5qzr9RPbwcB
         qZSdUMbImdKFis/SuneJbeBGwFnU6/J7iFEl/+0imD7JEqFGc0J9jqAyyOR+RRNd1I4S
         ftxxq/lkTwd3t8jZzDYmsqWiCYyTUxIer2Wx71TfCKMGvKRBlci0QDuleOWvuSPM4flT
         sO1Hm1D7QmOnUUriZaUUvI9+Q/LoCuhrG0oDeySssBA4gqkCZBSiWn4RO3kQo3tgRw61
         NT2GPK1mw9f8E6bz4nqVdtDYdg2PCb2bE/GczYW4qlscK9hKY4lBwv27NVFIeWSeZ7c1
         xDTg==
X-Gm-Message-State: AO0yUKVh/kJKn3EbKFbrJ6vTgBn1wAPcpPDg98hMkZZLI0f2UKvPNyw+
        PfZ8sWqljEVkHehpm46dO+PDaQ==
X-Google-Smtp-Source: AK7set/MN+9GgY4MfAr54dx3nzP6F0WirBm6MWw/C0HUyZap+4rfR6S8tBbwmDw/B73pn2WThgQLTQ==
X-Received: by 2002:a05:600c:3403:b0:3dc:572f:edb7 with SMTP id y3-20020a05600c340300b003dc572fedb7mr4256036wmp.1.1676288906641;
        Mon, 13 Feb 2023 03:48:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h33-20020a05600c49a100b003dc54eef495sm12887289wmp.24.2023.02.13.03.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:48:26 -0800 (PST)
Message-ID: <daf1686f-9e6f-a2d7-f2f6-0a8467a2c858@linaro.org>
Date:   Mon, 13 Feb 2023 12:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230210161925.32343-1-lujianhua000@gmail.com>
 <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org> <Y+oZOXyE8/a+vreS@Gentoo>
 <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org> <Y+oc+kEDoiMsebWF@Gentoo>
 <4055b041-c012-3be6-0aef-085ec389aabd@linaro.org> <Y+ofLDV1nsQ/WUJs@Gentoo>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+ofLDV1nsQ/WUJs@Gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/02/2023 12:29, Jianhua Lu wrote:
>>>>>>
>>>>>>> +  resolution of 1600x2560. It is a video mode DSI panel.
>>>>>>
>>>>>> The binding or hardware supports only 1600x2560? The how it can be
>>>>>> "right now"? It's defined, isn't it?
>>>>> Yes
>>>>
>>>> What yes? How it can be "right now"? It implies it will change, so how
>>>> hardware can change?
>>> sorry, my wrong. This binding only support 1600x2560.
>>
>> How binding can support only 1600x2560? How does it exactly work for
>> binding?
> the driver of this binding support 1600x2560 and panels are 1600x2560.

OK, so the driver has limited support. It's not relevant to the binding,
so drop that sentence.

Best regards,
Krzysztof

