Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C24C433F5
	for <phone-devel@archiver.kernel.org>; Sat, 30 Apr 2022 22:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbiD3W4W (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Apr 2022 18:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiD3W4S (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Apr 2022 18:56:18 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBA055AC
        for <phone-devel@vger.kernel.org>; Sat, 30 Apr 2022 15:52:55 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y76so20472685ybe.1
        for <phone-devel@vger.kernel.org>; Sat, 30 Apr 2022 15:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gCU66tvXeSU6dA6Pn4/+rETPiTto61Xnn69qL7e5XcQ=;
        b=UN5a13VFi1suVKpZGOhA/aKKwG1UlV6MWRuZkY98Q7DMdiZtZIzQbAThsdVIPnYDB1
         0gErMPUJ0ifdf9m8Mamjq1aBIb2IP46TrCFMiznarYW6xEMLlF5eCcUjR3uVO2rQuvdm
         zVkEZebJxtKkGi1uc3eyCVVki2UORcrVpcpR4bE3dxVhW6Pkyqf9C/HYBSSEa8/FzFsK
         jj9YyPu00xt/gNPVPm7sBbFScXwGBzqNU1xpv5lIazweSJpe/fFCB0AgoxSuMK/ZqtJY
         hSCvICcexLqD1D73iNQPiWEApFIsiqmJQS9byOpeQY8VfO1deWBeEihaqoj/GsCFlW1h
         vYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gCU66tvXeSU6dA6Pn4/+rETPiTto61Xnn69qL7e5XcQ=;
        b=dP4QieOMLf8i7I3ZrjZMcZgBETuQ1MPm07NWoXQVWWpll6Al57nL/dee/h1l8agCqx
         ShtVhzQtY9jiae5RVBthwSL+uO9ZPvViOY+GwqkvBoxjr6RFnFSZ56i44chio7OOVsyp
         7eQOOxtSiJIWtqdjYFpwPPvg4aj37eGy8HFD72TeZVdII2fGi8ykM/r2gYl4/0Mmcppu
         RMBk9cayOKE1LmCUm31xPvgqlv4PwqdL2Ew77Iq7NJCSuVo3XdnPghyWrJp0s1f2eF0K
         cwUI3WKmhBOHReOEXD4HyxcCj2hCtCb7t60CAUdMxYzEucd5cdHVEB8ph16taVbbE405
         RkLQ==
X-Gm-Message-State: AOAM5331AU4l7PCyW5//OBpH8U/5607NmCGZEoQV2u5dhaUfqefapuhY
        E0SBqwoN+SW3Dq1+9LcAFUNtmBqhXXAsxt25BWaLSqQ1bIXR4A==
X-Google-Smtp-Source: ABdhPJwiwuSMk9Cwr2CZQvIbXsWH8MXU+HRvYQBSx8n0ZXceIKsGwwrs07vko/srmjtrAa5pSZZN6emLDUDDiU/JiaM=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr5320326ybm.514.1651359174758; Sat, 30
 Apr 2022 15:52:54 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 00:52:43 +0200
Message-ID: <CACRpkdYngWscqak5phKm58O2GF0RmVETgwW4NCKTBiASdaEcyg@mail.gmail.com>
Subject: [GIT PULL] DTS updates for the v5.19 kernel
To:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi SoC folks,

please pull in these Arm Ux500 DTS changes for the v5.19 kernel.

The details are in the signed tag!

Yours,
Linus Walleij

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.19

for you to fetch changes up to 49148f4c39f04cb7bcfc1f42c3051d9ef8655fba:

  ARM: dts: ux500: Add GPS to the Codina (2022-04-26 23:17:48 +0200)

----------------------------------------------------------------
Ux500 DTS updates for the v5.19 kernel cycle:

- New devicetree for Codina TMO (SGH-T599).

- Add the Amastaos proximity sensor to the Codina.

- Add line impedance per machine to the Fuel Gauge
  nodes.

- Add GPS to Janice, Skomer and Codina.

- Add NFC to the Codina for GT-I8160P.

- Some janitorial like clock names.

----------------------------------------------------------------
Kuldeep Singh (1):
      ARM: dts: ste-dbx: Update spi clock-names property

Linus Walleij (8):
      dt-bindings: arm: ux500: Document Codina-TMO
      ARM: dts: ux500: Add Codina TMO device tree
      ARM: dts: ux500: Register Amstaos proximity sensor
      ARM: dts: ux500: Add line impedance to fuel gauge
      ARM: dts: ux500: Add GPS to Janice device tree
      ARM: dts: ux500: Add GPS to Skomer device tree
      ARM: dts: ux500: Add NFC to the Codina
      ARM: dts: ux500: Add GPS to the Codina

 Documentation/devicetree/bindings/arm/ux500.yaml   |   5 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |  12 +-
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts | 785 +++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |  80 ++-
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |  44 +-
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |  35 +-
 10 files changed, 956 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts
