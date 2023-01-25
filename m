Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB43C27C76
	for <phone-devel@archiver.kernel.org>; Wed, 25 Jan 2023 21:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjAYVng (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236184AbjAYVnV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 16:43:21 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8863B3C1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 13:43:19 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4fd37a1551cso258155937b3.13
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RkEzgOp5cexhcFMF9iOQ+m4oI4xFucW6voNny2ZuExw=;
        b=uqfhWwPTUwdBWcLCvM0JKSUdwHooH6KUj+hAbqKeGLCXg1zsBXqOB2gjr116uwNArz
         4guQAitor68aJTt2eRxXrz2uzwlydhdZIq+gK13gfW2rTO4GUMqgkRx4a7xknSuVb/ri
         VvL0a9MA1wZu/sjct4I/KGfE4ninypumZ4dPNC10svSkGwwz1aBKQxVDIfN0xSeAr2E4
         CW/vrEcfRz2xUSyBU+Nf18IEBOUtDEGz/NA7uly/oFB9lPInUb/zyEi2QUxNVZQcXE/x
         qX0J5YLh0l+iGDYbTr1MV3eVHPZ/TC0m//E+/BtXaKgRI2eKwa91SzoyrCnnFc5WJLGi
         yFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkEzgOp5cexhcFMF9iOQ+m4oI4xFucW6voNny2ZuExw=;
        b=SjbUcKRplSX9nd/wFdWp2D/9R7ANPZ4qM0TQ7Yf0Qbin6QxQCBocECGQ8La8c5X3Yr
         /454ZBrQonTSEcUFxJJqBZAtlJIzpVsr59zC9+CFKGCX1Ywvoa8Mg+DQoisBSEgvLCpA
         Hzi9+E1FetzSKkqQlq/xENKmppjq0oP+7SCgKxuzBD/lnA9zwbYiU7aVcPMQCJNOXuB3
         POCeYZKuMkTLIkmmMtM54Haos7+afUfMyU27EHA3c9QsIDpj9WAkXfkVWLBd3Dhn09QI
         TuOVnyygXdhmjd4VbpoXV6v9UL97WQU3jdcfm6iV6yc3YoWbk88UuoAYiK6PiPdrB8mt
         xbnw==
X-Gm-Message-State: AFqh2kqNxpGmWyYfzvd8q5MZnq+RPa+SE8EQLr0vN+asxrXKuCi3b9Gc
        Cfh0okIXYAUbVQBuoQXlREnjLOJ+SSLTa4YjiRPkvoEyzKunXb0f
X-Google-Smtp-Source: AMrXdXvyf/tIhI2i73QEgBZSsbBFNRG1pR7Jg8mEeTOiwbaPPRQZqRhxyjFom+8TOnKus+ZSAn5pibRpjkpA3c1TVOs=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr2910280ywb.185.1674682998780; Wed, 25
 Jan 2023 13:43:18 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Jan 2023 22:43:07 +0100
Message-ID: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates
To:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi SoC folks,

here are some minor Ux500 DTS updates for the v6.3 kernel,
details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v6.3

for you to fetch changes up to ddd932e45ec761996219b9efceb9fd5445bb3ab3:

  ARM: dts: ux500: Add clkout-clock node (2023-01-06 00:28:21 +0100)

----------------------------------------------------------------
Some Ux500 DTS updates for the v6.3 kernel:

- Add the embedded eSRAMs to the device tree

- Fix up LED node names

- Add a clkout-node for the external clock

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ste: align LED node names with dtschema

Linus Walleij (2):
      ARM: dts: ux500: Add eSRAM to the device tree
      ARM: dts: ux500: Add clkout-clock node

 arch/arm/boot/dts/ste-db8500.dtsi |  4 ----
 arch/arm/boot/dts/ste-db9500.dtsi |  4 ----
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 21 +++++++++++++++++++++
 arch/arm/boot/dts/ste-href.dtsi   | 12 ++++++------
 4 files changed, 27 insertions(+), 14 deletions(-)
