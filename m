Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D972C25B4E
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjATPyP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjATPyP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF43C360AD
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:13 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6148127wma.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYA4TDerTEPu0uOx/k/JJ5VSwwliulVHoGh0Vp6r6Rk=;
        b=zHKN8pbtWA2Zqvq9gaapyz7cjUAOaBQVkJzV2ALDFYlFH7Y25PoyNzUt/VTLeHFI0N
         fpsb2jlwphYB4KIuFCWrY8gFFlO147FaLV02o/vjYgDjStMRoXWh/2PMbJ0bJOfbh2fS
         gzip0iNFbLmB8Bl5kO9Rro5GEtPtA5nTgQv5xCgmeJwMtNR5voV9yC4x3w/8M/oICwYM
         DGSSzW8e15fnVxCW/I76yahZwdTgeLIVFTzoKbGjx+PN7IiVRJQj9q+XbF1MiBM2JjCw
         qLLZkjmgww7fcXCKK5F95lpMInOyJ+KWs2zPlRjBL+oPTeFHGophtnuYgum6dpkaq1LF
         j6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYA4TDerTEPu0uOx/k/JJ5VSwwliulVHoGh0Vp6r6Rk=;
        b=bX3p+tUyoKV/Sg/AqnfGuJwqLdskpOpConqZ6lMXj+bGe7UEqiBj63GDfkh++/C0cu
         r4TOrZFSiknKaj76VHNYsP+kWBzIuYYbwVqzox+aDaednz/jYke5Xeh2XooH4YRKFEqm
         b//nRnugJ2f8stp4BWQQvOj45W9+LeLXNPFkV+CsG0R4QN3VojJLqfQ/79fJZ5nVM+n6
         F+RrZwW0a8q1/rQONcjmoCrsOETauQgpeNVQn4fYcAjSKs/FYNPNp9KbqQt9+FUv/Brd
         XqRsOeIoYJjzRGKqOjlnMa9xtYhUX7zeR5jLCpefZk8yBg0WBssQNuMjnlWK/7JDzS7T
         6Xlw==
X-Gm-Message-State: AFqh2koiU+xSKFogc3oolUh0ZB706YpX26Xnbt2x6EcOLy3p8L7iZGyw
        4UJOc0Rv4HlKAa47eqw6L7ZfSA==
X-Google-Smtp-Source: AMrXdXv1YSLi5DL1n7Xx7HbG0BIrl4VhteBFDFaaeV12J9RJGifNm6gjmal2YvG/LbHh71Skx9oMYQ==
X-Received: by 2002:a05:600c:5028:b0:3db:1dea:75c9 with SMTP id n40-20020a05600c502800b003db1dea75c9mr6888614wmr.28.1674230052515;
        Fri, 20 Jan 2023 07:54:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] ARM: dts: exynos: DT schema fixes
Date:   Fri, 20 Jan 2023 16:53:53 +0100
Message-Id: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

With this set of fixes (and few other earlier), all Exynos ARMv7 boards
successfully pass DT Schema checks! All! Hurray!

Please kindly test if I did not break any boards...

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
  ARM: dts: exynos: drop unsupported desc-num in Exynos3250
  ARM: dts: exynos: correct cd-gpios property in Exynos4412 Itop Elite
  ARM: dts: exynos: align pin node names in Exynos4412
  ARM: dts: exynos: add ports in HDMI bridge in Exynos4412 Midas
  ARM: dts: exynos: add panel supply in Tiny4412
  ARM: dts: exynos: add backlight supply in P4 Note
  ARM: dts: exynos: align HSOTG/USB node names
  ARM: dts: exynos: correct SATA clocks in Exynos5250
  ARM: dts: exynos: correct HS200 property in Exynos5260
  ARM: dts: exynos: correct HSI2C properties in Exynos5410 Odroid XU

 arch/arm/boot/dts/exynos3250-monk.dts       |  1 -
 arch/arm/boot/dts/exynos3250-rinato.dts     |  3 +--
 arch/arm/boot/dts/exynos3250.dtsi           |  2 +-
 arch/arm/boot/dts/exynos4.dtsi              |  2 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 13 ++++++++++---
 arch/arm/boot/dts/exynos4412-p4note.dtsi    |  1 +
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi   |  2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts   |  8 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi           |  2 +-
 arch/arm/boot/dts/exynos5260-xyref5260.dts  |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts   |  3 +--
 12 files changed, 27 insertions(+), 14 deletions(-)

-- 
2.34.1

