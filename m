Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D396FC64EC4
	for <phone-devel@archiver.kernel.org>; Wed, 22 Feb 2023 09:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjBVJjG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Feb 2023 04:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjBVJif (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Feb 2023 04:38:35 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EF138E82
        for <phone-devel@vger.kernel.org>; Wed, 22 Feb 2023 01:35:36 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id l1so6776918wry.10
        for <phone-devel@vger.kernel.org>; Wed, 22 Feb 2023 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRk5F+0/KBJtXy1UGgffMDC3lUYcUK9POoNTTNzoa24=;
        b=u+urDYkiChNW/YI0+mNXcxcwazZf2oOYqiBgCEV2QRhM9Bj6bxgttGAPIfrpBsmZxB
         F/vzmmCmy0CmXzapu9KDPiLA9pY7S1B1GBW680gB1ZUGoMoUy99YDtiK57CeqAaY2HDG
         0K6bgiYCumaL/dEN8e2MSENFFfv0PQ9lP8dbpE6nD1ZEyuCRN6nDMhxiua2p5l7kkJgh
         7fxk/bcZzDt3idskr7rGCw0S6Js/HSnwDHdjcNFVO3Tdji5NuQ4PprVdhfl0lRLFdIbN
         nBWs7kKgv2X0JbhP42VvRIC5GiSY67juoj1zkN5gTEpZF3ZSitEAYHdksPGLvld9I7Aj
         k8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRk5F+0/KBJtXy1UGgffMDC3lUYcUK9POoNTTNzoa24=;
        b=VYgZm6JOWaXtrh+n7Ur4QM54sw5Z+/6PljKSXPoHyv+0KnlNEqlRwIWq+venI3o2le
         kIRonIWLlsfM5pILgc44QN0F+6d+gMexGY1mqqR7Fp9phJr9MIwuqdkYRQm0TQ2stJ1D
         IsGoTVKj4q/PcWC/tfo3Zex0aJo0tjRJMMTxI8vLJL3rkSTWaOg1YjK1PHum/bYhXepK
         EWvFEfLwmT3By+mHKzBIcFc2XNnk9BmKREbrvtKyqZihQlVCw4aMguQIhiKv3B4MnHZe
         H4+MD7aUZwEeTpfULqxyN1KhitDWkRhJ/F3xVb1zshi+Efj0Zh2So9wVSCz8xKe7klz7
         9U8w==
X-Gm-Message-State: AO0yUKWWvgal8WdqMfDbT1SCwX6QrifkV3wm/uuB7e3Sa0E9sv/c4Pu8
        0ebXBAKFaxxLQbS9HZH3eSn2VA==
X-Google-Smtp-Source: AK7set8hSrDxe9qvKyM2TLqTXl2UDNEIhR+MHKT7cLtR99WMCh22GQotZ3MUmWOEuM4/zk8YKoN/yQ==
X-Received: by 2002:a5d:4d01:0:b0:2c5:4ca0:1abb with SMTP id z1-20020a5d4d01000000b002c54ca01abbmr7295022wrt.60.1677058490952;
        Wed, 22 Feb 2023 01:34:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e16-20020adfe390000000b002c54c8e70b1sm7061642wrm.9.2023.02.22.01.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:34:50 -0800 (PST)
Message-ID: <f6f91c5f-5013-3c1a-9eac-e87fb7071031@linaro.org>
Date:   Wed, 22 Feb 2023 10:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230220121258.10727-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220121258.10727-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 20/02/2023 13:12, Jianhua Lu wrote:
> Novatek NT36523 is a display driver IC used to drive DSI panels.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Drop unnecessary description
>   - dsi0 -> dsi


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

