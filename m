Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CFBC7EE20
	for <phone-devel@archiver.kernel.org>; Fri, 21 Apr 2023 08:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjDUI1C (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Apr 2023 04:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjDUI06 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Apr 2023 04:26:58 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4EF8A4B
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b992ed878ebso1200124276.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065615; x=1684657615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=KfRIFWT9drplhoKI7/ouoQ01P5E31D94jaMz485xTttth3bsmBxVK9dBVvN211wGWq
         fLdWJQpR6j0km7XxRth0VRaPWCixVjFRuxCLss2g/IF/IxFx2mKtFFKsuXSJd8dUTZ1N
         Z7J2newP5zXtvEZOCEupnXWu/z8TQb3eexw8ukQ3Nk/QWve2YEGSR5pUPR0VdrHUIRCs
         8RdfNZYgLNgqjVux8ih6EkMgQqfWCbwdX+gRLMLWoQ6hOxuUWuU7U/cpPfOebqbm52bT
         Lqbnb4aQ3H0gIchvPlHxonyo8BtqwoOBXt7wnx8WpjTY755G3kU8lleYWQnnbbqEEFkS
         nAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065615; x=1684657615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=G6oz0Zr7VtMOR72QwTVFEEn8l6qaeDM8dSzbSVARjH6tcor0L1tzUuPZQ5deYNXh+1
         MImfg0neFSs/MGH721QYIB4iD32lUStCRJj+VK2J6rQUvL1qbGkcoy2znWCuRfN/fcYL
         1cjeivTMqxriVfdwLrf0AaZ1G8D4rLhk4TZbxjZJPKPPn3WCobKq/pyOUQGYCpGxVnhB
         D9FKUQV5k4oFYH4EI7l4Ae6o6vF49OLoXjshefV4ta62uzEFZ7LbeMNvd62KSxb3aOSU
         oFm3HzTI8vBgm10lN4df/JDBsCMCW8UbHCWLqr90ILTCsqnr52JUbrlCFBsFk3Qj03p/
         ZVIA==
X-Gm-Message-State: AAQBX9cIS+rJO/kEmvq+GzTH0ZfF08pPUR6dIDKDXDP3uXaeSUx70edc
        JAaPxd7QLoeioI73dQUlafu9IJwdlcRiWdhzkUPHgA==
X-Google-Smtp-Source: AKy350Z8XcyFNX2JboNAaFrt3oSnc7DS4Jc7Id9gYXDPevkIo3K9uThotJdC51FnQkL/TPRP4jQP8FzcMgBbAAn2v24=
X-Received: by 2002:a81:12d3:0:b0:54f:54c5:70d with SMTP id
 202-20020a8112d3000000b0054f54c5070dmr1414029yws.20.1682065614765; Fri, 21
 Apr 2023 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz> <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
In-Reply-To: <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:26:43 +0200
Message-ID: <CACRpkdb0oncz5UB8vtu3csvBQXojvdxxfDMPrnGeH3qRBr6=AQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Apr 14, 2023 at 1:18=E2=80=AFAM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add support for the 8 GPIOs found on PMI632.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch (2/8) applied as uncontroversial.

Yours,
Linus Walleij
