Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F61C433FE
	for <phone-devel@archiver.kernel.org>; Tue, 22 Feb 2022 15:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbiBVPVk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbiBVPVj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Feb 2022 10:21:39 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0F41617E0
        for <phone-devel@vger.kernel.org>; Tue, 22 Feb 2022 07:21:13 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id c6so41869926ybk.3
        for <phone-devel@vger.kernel.org>; Tue, 22 Feb 2022 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVdVMfysf95jTHRvOxuNoVjxuB0CjZvhXhqlbIHuN0Y=;
        b=KTh8aFNGaoyntsSAxBWClVP9/nSFTBS6irzubM66J/T39Yf6IABij0qQupUfuzzdZH
         ihIj4SU7EJtHUp3eNKbXfhrrfrdHCRjI06QOYhuWfa0CrRe5czKlGZ0kFgPhNtdusiE/
         0cWGtj2Eo8LQ48RmeuO5gh48DJcz9Ic28mn3vkGeynwoJm2hTtHUmOW3NPXIa4x6jgsf
         6IVhC3O85FyU1YztP8Nj8fRJuiHPBP5iQXLzDxOET1eFSu7QBjKPOJvhBmaOXJMJnFLm
         a5nEmVP4VCmsyQ2WvCMH6N508jNFlxP3rso6X+xul9CMCySIXCetVpdBnk8Y2gRuOE2p
         bnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVdVMfysf95jTHRvOxuNoVjxuB0CjZvhXhqlbIHuN0Y=;
        b=tBwO4Z12sf66n6LAHx3kIm6RKfd4DR9MT2f67pTMkGY+sLPP2MiGXmkjcfjcwUgeVE
         8LYMzGGUiZJcCAnJnFcBfc/Z2pCxaoJ3LWiLhkjIZoBLHE7Uc2ZVUS4bJKDgFfBWaOo9
         kWmscYrz/gS7FSGEB8717MCHkhlIynjR2IMuUNdgSDxapeRRrv64luJ4UmKsONTQr4do
         P9Eb46GHctyyfuNu3RZai/m2z6VqP1i4Cmhz/5V+CTSnjyKf7wahaezaX7krL5qg4ltm
         aW3vC8XEJJyfuEaJFCIYvyuvg1cRN5ci5bU5KcJX2xJjMpUBzb05eZsu3EQPXKZIO4Sd
         ZJ/Q==
X-Gm-Message-State: AOAM533fkZjajUjZrkYDf64YO/u8GHA+CY1DAgBQlwmce6zxL1xwws6o
        Rz4ShYp3y9f6f5ZM7nJCGL0D/Q7qWMGNnrpBGtmXqw==
X-Google-Smtp-Source: ABdhPJyCcJARRbkiTPXc35f6YTtpOe1UTQH526CZggy98Wmxv6UfuXKgc5itp4zRkLxISttmSWvkXXI+3Fq9wJhPrqM=
X-Received: by 2002:a25:aac3:0:b0:624:ab10:49dc with SMTP id
 t61-20020a25aac3000000b00624ab1049dcmr6967837ybi.291.1645543272820; Tue, 22
 Feb 2022 07:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20220216212433.1373903-1-luca@z3ntu.xyz> <20220216212433.1373903-2-luca@z3ntu.xyz>
In-Reply-To: <20220216212433.1373903-2-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 22 Feb 2022 16:21:01 +0100
Message-ID: <CACRpkdZhtdyni0cKT43nd9YVSnA_Dza6=kuECuXLJKbDG2rbEA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: bluetooth: broadcom: add BCM43430A0
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Feb 16, 2022 at 10:25 PM Luca Weiss <luca@z3ntu.xyz> wrote:

> Document the compatible string for BCM43430A0 bluetooth.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
