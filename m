Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D602C27C76
	for <phone-devel@archiver.kernel.org>; Wed, 25 Jan 2023 22:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbjAYWSa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Jan 2023 17:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjAYWSa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 17:18:30 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552A85C0F3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 14:18:29 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id t16so20277676ybk.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 14:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NPUDVfqEJt2h95Y7BrdphbvzHEg2RST78ad60z/MiSQ=;
        b=K0pxYi/XN90ABinCFtZV7WOOIeZ3IoDWHGgF68JOIk13dkBd7dPk3VIzbyX7Ni81sp
         qOZLML6MfFc1bmsLm42q5cQENx9M2D01LJ2lEUuvJWNGsZacNF7cvj2bHa7HDEJuiDYm
         etYfQIlkI4qYyhksZp6FJ6x9j3v+afdvGhdU4Cs4oeyJSoaSG6/qgwwd3D8GA7exolmc
         klIlYwUbOVwVLe6dHd/Fu4YTRfEUQ6PjaJ4W0hxwmUk44u3hw/5CNkiz6UZ2JYXTn+0a
         8FXPgoFq1UlDdg3a1E+P+V+CR/WUX567LWlpjhWlGWtkKuHLDLmdN+Uoiblxfu96k0Gj
         Ax7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPUDVfqEJt2h95Y7BrdphbvzHEg2RST78ad60z/MiSQ=;
        b=uUZoFCr/dxxxQaowsoQrXKEPj6LewxONjLVd7ULtg5QgqGn4V+B8sSBsWrdyRzbjVf
         9Ju53qnFSHy8GZrFMkyW65QezIv3Qk+RLd1K2cE/iw9YcbvJJdwCOtYNn7+ME1/NeJtU
         LrQFfNHIJQq1kNMZIFO4UXt1n9K3hrgavxd6UzX3cO6ljqoDV41zFzQT16jqKG/GL74V
         AqA8jb/Pjn/118ZuMUcO5I2qelwjg0FSx9DZgZBXqplZROlHQ4pS6HgrJqM8Ny/kIPHg
         QrniQTQC/1JpTIwX617HUE0ma7Vd8gKJLWVs15iP0+pDdqz37BGzcJQZZwWxqcWEoC3t
         2QoQ==
X-Gm-Message-State: AFqh2kqtMPhmfgvBskoQvO3LPoRPUf1Vl5iuo3Uiu19xCVL48UO1/Ml+
        R9H3A+FD4sezA4EHSqpFGMaNnuBweB6aQM5PfYF0fQ==
X-Google-Smtp-Source: AMrXdXvYSMeMl4cIzOurSi8I/JB/DKI7You1N7wR9K1HhHhAeUKskJGDgOHJbJa6p76K11IA8xHvH1okJfaspOwbe18=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr4161015ybp.130.1674685108577; Wed, 25
 Jan 2023 14:18:28 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
In-Reply-To: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Jan 2023 23:18:17 +0100
Message-ID: <CACRpkdZVH8nu=4a4MuQZ=uUpqg1MBXShCU_Bm3CUxPg1adO8BA@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS updates
To:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Wait!

On Wed, Jan 25, 2023 at 10:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Linus Walleij (2):
>       ARM: dts: ux500: Add eSRAM to the device tree

Now I see there is an appropriate "mmi-sram" binding in
Documentation/devicetree/bindings/sram/sram.yaml

That's obviously what I should be using for this.

I took it out and pushed the same tag without this patch.

Yours,
Linus Walleij
