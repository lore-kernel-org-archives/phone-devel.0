Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5191BC67871
	for <phone-devel@archiver.kernel.org>; Tue, 10 Jan 2023 07:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjAJH7N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Jan 2023 02:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237285AbjAJH6t (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Jan 2023 02:58:49 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48494915D
        for <phone-devel@vger.kernel.org>; Mon,  9 Jan 2023 23:58:02 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4bf16baa865so143836437b3.13
        for <phone-devel@vger.kernel.org>; Mon, 09 Jan 2023 23:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=zl9SYem24/egt7KSne70ItzNplyc4RaeOVz1ikEiBN+vCJ6ArWdyXQ3CC5DeiOSGt5
         48KZchtk+ZywqgNIP00ff61UyDjyYq+PoP+1C8vVnuFPDdne/wlyntqZD4pAjCYaDBtq
         JKYTYDyKClhl2ubziUCoFSgJAw/6m9NqE4LWGoLaavx1p1T3pEsw195uwINdkVWFtZV4
         R9RL4hDPfH0l2zpJHmGwiRe2/Kr7naAwhEb9Qryxl6G3WC2k7lu81jnTxervAetelWkN
         Aq8QpA0vcoAAPH1ZKZ+PhJSdvC18g524m0QIMo2DS29blcoDou8hdM36s7pvYiqanMx+
         0Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=3w2wocSoaZUxJhS9yPHBq7b0ebXmEqIHuWJEBm0A92+m4vqb5sd2/4e7DSUcaDiZ9r
         Y73m7Vtr5G8cP2kC87r/TtZgRv81NP0rDRzYvM9W8UKlpUfqxCwJjPwotw3XPIXIm2t8
         gRKAgAlJobZwv6lJH1VC55kUoh/5iURH8OeNL1diGTnAVOVOCUMtuDkI6Flhoax2V1JM
         hH4ABBqAMASvnyxb0tz4oF0lDeopF2eMsSmCkVHtY6xU3FeZlsMIPKZXHDiqY1foj8qr
         j8czTIp7ZtQ10XIqPZMmxSxY2z7XegN0m9r1WMXm6mYwMgWGMcQfXsqC+goCKx+kUynF
         mr3w==
X-Gm-Message-State: AFqh2kpu4ovruKJYiD1EyvKvBwgECLIJv5lxA4KTQtJOqpFEX/IDDdm/
        0o91QLSeccW+SM72W27EJ68HRZn2I+v3+psM7V2eOg==
X-Google-Smtp-Source: AMrXdXvTMMm7Ub8ElIqw+FOLuZZsoiGCIUIi++horW7FXhTzxh4aBm0Fjpi2NKH3Iuh09zUB6LR28K+m29XyYe1cdQc=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr1195100ywa.469.1673337482073; Mon, 09
 Jan 2023 23:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com> <20230106114403.275865-3-matti.lehtimaki@gmail.com>
In-Reply-To: <20230106114403.275865-3-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:57:51 +0100
Message-ID: <CACRpkdYa3=UnzeYeFgurFH8Dyq+NBQazSFK4qiUP==+zdmYRKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: msm8226: Add General Purpose clocks
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Jan 6, 2023 at 12:44 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> From: Luca Weiss <luca@z3ntu.xyz>
>
> Add support for the general purpose clocks that are found on MSM8226.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Patch applied!

Please funnel patch 3/3 thru the SoC tree.

Yours,
Linus Walleij
