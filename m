Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49991C43219
	for <phone-devel@archiver.kernel.org>; Thu, 24 Nov 2022 10:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiKXKaZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 24 Nov 2022 05:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiKXKaE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 24 Nov 2022 05:30:04 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1C114E6E3
        for <phone-devel@vger.kernel.org>; Thu, 24 Nov 2022 02:30:01 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id j196so1368874ybj.2
        for <phone-devel@vger.kernel.org>; Thu, 24 Nov 2022 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jDR5GJzkrlvJD9yzrOlJ5GKkSJVuJ19hWIOf5v5G1Xs=;
        b=LYM4pUwf23JLOP2V2OZ/RWMDi150FSYYyA+9UgSRGxIxTQig+tUBqDEu+XQ448IIj9
         RoK7MSA87V+DgOaO1Asco/X7DRXQbEdXdZGUySxHiZCpYMSM1n9ew+Qjam+jkdDoqKhf
         r2vhIqTlPP+sEpRKNSzjLLhzaPZBj09M/OLFmDJ8gBnj0WbjmZW+7Bj9GA2zvCkwGytn
         fpQsR5N+Q/48fOLBwQ7TwIlLl7TspzpFjXWoj2pfMRNJJ/+DmVKKrFYdqoSgFgBPngpf
         fA9xSbwYlCo8hrFIrki128ZHrB3UVwHtyZ8MiJUbupA8m8S3JYOZtDMeWV7/YPZoZ942
         1SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDR5GJzkrlvJD9yzrOlJ5GKkSJVuJ19hWIOf5v5G1Xs=;
        b=nW7dI+mZrLJKTaoJ8b3Q5gQfpPNV/hIeOs3g7BHoA6IMBhgHR51lFUloTJUCWC3nDu
         VRJJ6ABs5IXlt2BKUWJbuKLXcT2b9qNK/Fm4cc3jEf6qgjEGDWcyxSGL7oFQ04HP02Mf
         KmFNr/n3tWn+7HEIUzasItF/XYpWcVWSH7oudk4DE7TJOsMK99JPF5dxdjAMAPxAMAPr
         jbPt0RA3LWTITdePtNC28fovIZkvg2Xwn9GifHLJUhX2LH7UTVRWV45TqwN/EUKipUl6
         N7OX+4Op77kQ3ZrzYRLa33CZFF6yQbEUZYPbn03bKanoSopeGbFKd+bT7tUDamC6sR70
         oj5Q==
X-Gm-Message-State: ANoB5pmH6TMn1BV7pJBEdHmTN/KKNEBmpR7NlNA+Z9311NohiXOTh4UM
        FfRGrthyU7aaEkqkKXybtGHuy6d75GoCRKyOTfUm9Q==
X-Google-Smtp-Source: AA0mqf74tPMpGfik0vFG+53g1ZLEgmMjeL8riBiFr5hh/nRi1D9lpJvY/uduLLM0RUm1jdXXrlUx+QgqqjWEZuUgbqk=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr13626761yby.322.1669285800899; Thu, 24
 Nov 2022 02:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20221119221219.1232541-1-linus.walleij@linaro.org>
 <20221119221219.1232541-2-linus.walleij@linaro.org> <73df18a2-b0d6-72de-37bb-17ba84b54b82@kernel.org>
 <CACRpkdZsxk2MH0AEHE=kpHuikdP35d3_q6wrr3+Yrs2QpZy62A@mail.gmail.com> <7b11aca1-c984-d8f4-6d99-13833270ee16@kernel.org>
In-Reply-To: <7b11aca1-c984-d8f4-6d99-13833270ee16@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Nov 2022 11:29:48 +0100
Message-ID: <CACRpkday99jcpruX_viWiz7M66UC-k_kmsqFWpJiLMp0AEAh9w@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: crypto: Let STM32 define Ux500 CRYP
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Nov 24, 2022 at 10:22 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> I am referring to the mail header, not to "CC" lines above. You missed
> to Cc Devicetree maintainers (maybe more folks, I did not check all
> addresses).

Aha yeah that by default I just add Cc devicetree@vger.kernel.org
for bindings, I guess because of the old ambition of separating device
tree work from kernel work, which I think we have now given up
on so yeah I should know better :/

Thanks!
Linus Walleij
