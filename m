Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F804C2BB41
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 09:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbiHPJa7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbiHPJaP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 05:30:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6ECDC5EE
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:50:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a9so13690699lfm.12
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SsFQ1RIKNiJVmQ5p1REhokCaS6zA2xCDkzmoDwE4rX4=;
        b=C0vovSaBtU3Al/+uuR5jDDnyI0+U1TP282RQhz+GQNbnU36bQz68AnK5kXLHecmF5A
         axOm3+W83f958RvgYeCKIkNS2glYVCYOrnGKMtcBNOEjCW2uEZGCp/UIoq7k0PGgNCe5
         IaLDe0R3RR1+G0S1Ta/V8OGoA+zrMQfpq/kxlJLuwZ59Ta0nAWPVpHdpCdi34td8WLod
         +0DGSh8mHtK0ro69ztI/vT43EY7+SsTZHhb8LaHHU9qoZHW8097OXTkZNeLHKhY9DQnA
         5xW1kRi7YOtHwZRwFAanL8RrpAUc+Ty/vJstUKxz0zzGyY1L13nix0HgOmjzc9TIGFxx
         3pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SsFQ1RIKNiJVmQ5p1REhokCaS6zA2xCDkzmoDwE4rX4=;
        b=N0XMr61pVi23u7jmBEJrVi4qZ+RC83xNiEubbgFUeTnxbfwsCP4fU4NWrdKmRxg3SJ
         ZMCHTe1TqTf3pA5GbLvtGePDsf/yzV229+95Ldyua2iPM+sPSaPlPhREp0idrJM5b4e6
         qTc2MF0bP7lGba9GP8qOwZHsLsGbu+BWLPKbT8EsftqIFsN2cWdpi3dm/2qqyMM+rSd1
         fk0zGcLbu1RPbqdKd5M6kocfItgiwmRboTTKE7TZNzlG9Y9OZWJqUkCNz5lqycaq70LX
         sgb+9JJCb8aPJFE1tXPwumMbAXBsm+Hk29zh+QIc0ns1oZQveprP8arBQYA6FykxMGcE
         QpZQ==
X-Gm-Message-State: ACgBeo35OUKqwWn1tm+QzHtnvDQGsciCyFs8q8FblG4KEvwXrqVUblnw
        S+XDlZHEytEPALZ1B8AIyJqJ0w==
X-Google-Smtp-Source: AA6agR61EpgIZo4areU1VwiZwwTCgopZu+2bI0uZ3goHpEzDHA9edBrmuCgn1s1AR0GHg0VZ6JjiWA==
X-Received: by 2002:a05:6512:1050:b0:491:dda4:1e2c with SMTP id c16-20020a056512105000b00491dda41e2cmr3973398lfb.467.1660636256607;
        Tue, 16 Aug 2022 00:50:56 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id u11-20020ac258cb000000b0048b13d0b896sm1308697lfo.141.2022.08.16.00.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:50:56 -0700 (PDT)
Message-ID: <c547ac5f-e4e8-d043-22bf-626cc580a69a@linaro.org>
Date:   Tue, 16 Aug 2022 10:50:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add PinePhone Pro
 bindings
Content-Language: en-US
To:     Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de
Cc:     martijn@brixit.nl, ayufan@ayufan.eu, megi@xff.cz,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220815123004.252014-1-tom@tom-fitzhenry.me.uk>
 <20220815123004.252014-2-tom@tom-fitzhenry.me.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815123004.252014-2-tom@tom-fitzhenry.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/08/2022 15:30, Tom Fitzhenry wrote:
> Document board compatible names for Pine64 PinePhonePro.
> 
> https://wiki.pine64.org/wiki/PinePhone_Pro
> 
> Signed-off-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
