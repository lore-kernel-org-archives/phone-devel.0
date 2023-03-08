Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F773C64EC4
	for <phone-devel@archiver.kernel.org>; Wed,  8 Mar 2023 11:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjCHLF2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Mar 2023 06:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjCHLEz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Mar 2023 06:04:55 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EDC9BA58
        for <phone-devel@vger.kernel.org>; Wed,  8 Mar 2023 03:04:23 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id b10so16226166ljr.0
        for <phone-devel@vger.kernel.org>; Wed, 08 Mar 2023 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678273461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VV/rTwRnKU6UEDzet7JK45QLgODlSkCmiX3BH1I/DM=;
        b=HQOU5vTycAVVSRYho/hu0pGY10vRB6gem4HEXKnxf+e6Kio8lh9290+DjmqanEo/uR
         SUTVd0ixFCjUXhTI20G0c1OSsRFE7mlHOfggVuhtY/EzovMdj+jiTql//MUHgNnK/RSN
         6++wErjIBKvMsB12VTgOlvoFOOC4mlQuCFexib4jJ50fFEE/Uh10luiQ/wVoV/oOHwrI
         HgZSDpJYAJm6v9ySVAaz76eohfO4qADYgjPuA7zww4CQDB/QbKjeP0d2bQS9s/OFcMv/
         8WRdwNGoiP+q5MFW5HQ8IlSZE8dRZg+nwW7hmz1G+HX7XAbgWu/VXw05s6AXM5LMhvJc
         3cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VV/rTwRnKU6UEDzet7JK45QLgODlSkCmiX3BH1I/DM=;
        b=F0R8DZtpbx4lYpC9DNo6rNyRymQSUCF59uSybOl6jfE0VkSR7Xd/DWvgr65B3aUqbP
         TpsC05YVQJW0ay8Blb6VzLqL7VXjAj1vKgCPHjLioDypNxXU7UC8+i4jLAFm7OM2OAWR
         Bxdixr/zvECw8ZYMHQpyAwyrHJLBska/K8HwnoUH1J07Geu+tEcdC0CYhLX3jevKv37C
         KuHelxsLR0YivHFhHqrI5wzVyWh7qDbZ7C8nxDEVe/5NSg8b2yD/U5RgdKqPmVjnvPvK
         99nFIABcF/yxzTZExyY+DZuIl+T9GavOvlaqjL0NZhsqMynJAyGOckT1omiBbl3cOOE5
         /l9g==
X-Gm-Message-State: AO0yUKVpURmjfZBt9jY9eJJfno7I+X3Vpc+wS5pWFcfKmxq9n/joat9u
        LPP5NUxxJFqFsd/b3xkcK3oC4A==
X-Google-Smtp-Source: AK7set8sOg8LE4msTJbUjDfsJsqcsmqcDij63xRlHars6UR3HN5ROaMU5DoLkueW01X5wuMKUb1Q9Q==
X-Received: by 2002:a2e:3002:0:b0:295:a8fa:c627 with SMTP id w2-20020a2e3002000000b00295a8fac627mr5389644ljw.14.1678273461605;
        Wed, 08 Mar 2023 03:04:21 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id k19-20020a2e8893000000b002934fe524d2sm2527508lji.83.2023.03.08.03.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 03:04:21 -0800 (PST)
Message-ID: <dff4732c-df1f-0df8-b414-b039ab34c54b@linaro.org>
Date:   Wed, 8 Mar 2023 12:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230220121258.10727-1-lujianhua000@gmail.com>
 <20230220121258.10727-2-lujianhua000@gmail.com>
 <CACRpkdbZCZiMM_qeqMd9=txVvPVHEzM4szOnPR-gCYdiXW_9eA@mail.gmail.com>
 <ZAfasb9aKTgyjbFc@Gentoo>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZAfasb9aKTgyjbFc@Gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 8.03.2023 01:45, Jianhua Lu wrote:
> On Tue, Mar 07, 2023 at 11:34:55PM +0100, Linus Walleij wrote:
>> Hi Jianhua,
>>
>> thanks for your patch!
>>
>> It appears Konrad is working on a very similar driver, so I suggest merging
>> them into one Novatek NT36523 driver.
>>
>> Possibly we can fix this up first and then add Konrads Lenovo-panel with
>> a patch on top.
>>
>> On Mon, Feb 20, 2023 at 1:13 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
>>
>>> Add a driver for panels using the Novatek NT36523 display driver IC.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>
>> (...)
>>
>> I like how you abstract the panel with init commands in the panel info.
>>
>>> +enum dsi_cmd_type {
>>> +       INIT_DCS_CMD,
>>> +       DELAY_CMD,
>>> +};
>>> +
>>> +struct panel_init_cmd {
>>> +       enum dsi_cmd_type type;
>>> +       size_t len;
>>> +       const char *data;
>>> +};
>>> +
>>> +#define _INIT_DCS_CMD(...) { \
>>> +       .type = INIT_DCS_CMD, \
>>> +       .len = sizeof((char[]){__VA_ARGS__}), \
>>> +       .data = (char[]){__VA_ARGS__} }
>>> +
>>> +#define _INIT_DELAY_CMD(...) { \
>>> +       .type = DELAY_CMD,\
>>> +       .len = sizeof((char[]){__VA_ARGS__}), \
>>> +       .data = (char[]){__VA_ARGS__} }
>>
>> I have seen this type of reinvented wheels a few times now. Don't do this.
>>
>> Look into other recently merged drivers and look how they do it, for example
>> drivers/gpu/drm/panel/panel-himax-hx8394.c
>>
>> For example:
>>
>> - Use mipi_dsi_dcs_write_seq()
>>
>> - If the delay is just used at one point in the sequence, do not invent
>>   a command language like above for it, open code the delay instead
>>
>> - Try to decode as much magic as possible, if you look in Konrads
>>   driver you clearly see some standard MIPI commands, I bet you have
>>   some too.
>>
>> - Maybe use callbacks to send sequences instead of tables, like in
>>   the himax driver?
> Maybe I should create a wrapper of mipi_dsi_dcs_write_seq() for sync dual dsi mode.
Yes please, it'll come in useful.

Konrad
>>
>> Other than that it seems like something that could also handle the Lenovo
>> display, or the other way around, I don't know which driver is the best
>> starting point, but this one has the right Novatek name at least.
>>
>> Yours,
>> Linus Walleij
