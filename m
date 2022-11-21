Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F93C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 14:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiKUOAt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 09:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiKUOAf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 09:00:35 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30D8167F9
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:00:33 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id k84so13678112ybk.3
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/D0Lm1KS+Ja4fWDh0HXcyKEC5n+mGQEJvv8NjLbp6E=;
        b=mhsRCNIgoJwDgD7wijpmV/cC4SffsmqvWCtN5JEXBAGW4nbz9TGNqM0DPZp4Tm/MtP
         cxjFhE4aajYdpQkWio3/w/PgSr2WqWe74bfpHjJU1+CXfm85RzosdHw6S6wALtWqBth4
         G3CSVmekmy4tfkBP3Z4btTcb4AcAlsfHpIGPZhNtOjptjvbdcEjQq/HRUPoAPEDyoLkX
         JxHIeHrfYoUEDZUDtnns+ujIaNSR4B8QNkZyXrM3PmfJsWnd/zWs/rObL7+fH0I0OUYQ
         xnqtpGFWSUq1JuYXzvUmuaSirKuw6jPWBfu9TElSHBUUAwOvJr7aJwlYow3d0XFjs9wj
         7Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/D0Lm1KS+Ja4fWDh0HXcyKEC5n+mGQEJvv8NjLbp6E=;
        b=fLP4HilU1CWvhztHaE/SqsVkVXeE3U59fgxkFQo7vVUHJs6pNqAxE5nrTMiNnGid0d
         mq5w2Igk6eq/AtzUatQyAITyPZ5hS4rWglnujadaz6NQOUxFtgLhumNqsTGsvXEQk00X
         ka/39XTCHG9mGczpTete/6ZrZN+hTay9MjdL0h/c5vcnTXAxXzZ3wVp2msGu8nO+0+cN
         mUrNgDr0OfnFdSqAhmao/LdFeMUtmlVhOWTdySfZpyi7DrWPkh4lFiNBLcW6oAk16Q+c
         /n3n56YEfG8Z13zoxJjCVquq02RhYMR1umXF7vMXNqFxX63yhJ8AGum3FKJMA4rY52Zl
         KEoA==
X-Gm-Message-State: ANoB5pk29LK+/+AvO8LpN2BH3cBdQlwuhswrEGxEcKSe23o1h03Mw7Je
        fTXsgeBf0XLFn+tcWZuLlO6PJrZizJoQOiQlF3zRkw==
X-Google-Smtp-Source: AA0mqf5BBa2PKPMYJem/LoHXdxVCb1OehGLc+5aj9oWm/51RTtd1l1fHN/q7VmI1VvvrRxwget0GZoJdRGAKK5U9UMs=
X-Received: by 2002:a25:cb42:0:b0:6da:32d3:c2e3 with SMTP id
 b63-20020a25cb42000000b006da32d3c2e3mr16876176ybg.66.1669039228487; Mon, 21
 Nov 2022 06:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20220924142154.14217-1-luca@z3ntu.xyz> <2122234.irdbgypaU6@g550jk>
In-Reply-To: <2122234.irdbgypaU6@g550jk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 15:00:17 +0100
Message-ID: <CACRpkdZLVYfrZgyO=uJX1jm9cdGrkSr_=2CmPk5Rf_eccwa-Dg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: bluetooth: broadcom: add BCM43430A0 & BCM43430A1
To:     Luca Weiss <luca@z3ntu.xyz>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Nov 18, 2022 at 6:13 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> On Samstag, 24. September 2022 16:21:55 CET Luca Weiss wrote:
> > Document the compatible string for BCM43430A0 bluetooth used in lg-lenok
> > and BCM43430A1 used in asus-sparrow.
>
> Asking again if somebody could pick this patch up, it's been sitting around
> for 2 months.

Repost it and include Marcel, Johan and Luiz on To:, maybe add all three
of them but Marcel and Luiz has certainly applied my binding patches
in the past.

BLUETOOTH DRIVERS
M:      Marcel Holtmann <marcel@holtmann.org>
M:      Johan Hedberg <johan.hedberg@gmail.com>
M:      Luiz Augusto von Dentz <luiz.dentz@gmail.com>
L:      linux-bluetooth@vger.kernel.org


Yours,
Linus Walleij
