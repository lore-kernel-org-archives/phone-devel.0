Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22276C61DA4
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 19:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjA0Tmm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjA0Tmi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 14:42:38 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9B41BAD0
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:41:59 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id b7so5921534wrt.3
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laJbzm3hNFvKVQdtgilxX5HQETMASKmZLxjfb/658O4=;
        b=nI6Ug6W8ctMCQtI1vVqDWj8MpjBhnWeeT31JylQQfqpiYHv2PIYko9EILdTGUMfHun
         BV7C4e6AAanGxKd7QxFGz+11XVELz2+slWa28dZ+PhwvPC/xB38end1xN7C1jAPghC+4
         Ti3PlMCgNRCz8JK07atg7xAtsDuCaG5gGwiS8rR8UrN7WYRAYQOTSAkwiHWviWYP0iKa
         5ClGwzCxxtcm3FdBL4Mh03InXChGiUDmVL0UzT0vnUkKiZQEFCibj37cuwbirsQhDbX9
         WNxhw85wenI0Fhc3ler070sioGpH0o+6Yamb5V/OORturTxwSie1BBaAInjRQ6lAASUJ
         gF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laJbzm3hNFvKVQdtgilxX5HQETMASKmZLxjfb/658O4=;
        b=XwoADGyDWp8hqOdvXfWN6+/0+6D1PL52eQyR8CotqOX6CdIWlp3KYirQGL2I9ubVCq
         PmOsxyhRpULRCYXt5a3CSAeUwCMHRKhWoMs2Y918VZYIdgQIPN6/My2OZEgUQC/saKdw
         2/ptSKS9H9odddTcQujHh/qHabX6alxxDbSNDto9wUDnPoK/BtXdXaKnvd6QWy16z8B7
         xVd1yE2J9U+lWLzA76PB+Ng5K5Qtfi3deO2xwZtAu5PHIddOren7Fg25g5NF2pyGOfOm
         gh5kvrhcqsrA8sOO075QQfSF0GObmEWrxNOwRV6yPvLWcJsrTUQtcdrvzcEcXjZgLpCg
         uxSw==
X-Gm-Message-State: AO0yUKU9pLRtkLIG4ebI9iE1fxiC4dHi+QGFb9TUP/0Uwsq0PtQql8Qi
        00VaM6bN9IdffKHU+KjHR2vW1A==
X-Google-Smtp-Source: AK7set8N28+EX6KUi96o3PeCOm9vKAuOFZYK3aIRSmt7I8LzRlQeQ5HFryKL/vW3McfrcWRpm4j0NA==
X-Received: by 2002:a5d:658d:0:b0:2bf:ae43:108d with SMTP id q13-20020a5d658d000000b002bfae43108dmr14352920wru.28.1674848466678;
        Fri, 27 Jan 2023 11:41:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/8] dt-bindings: phy/samsung: move MIPI and DP phys under PMU
Date:   Fri, 27 Jan 2023 20:40:49 +0100
Message-Id: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The MIPI and DisplayPort phys are actually part of the Power Management
Unit system controller, thus allow them as its children, instead of
specifying as separate device nodes with syscon phandle.

Dependencies
============
If entire patchset is okay, then it can go via separate trees:
A. I will take first soc patch.
B. phy patches #2-#5 are independent and can go via phy tree.
C. DTS patches depend on (B above), thus they will wait one cycle and get
   applied later.

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: soc: samsung: exynos-pmu: allow phys as child
  dt-bindings: phy: samsung,dp-video-phy: deprecate syscon phandle
  dt-bindings: phy: samsung,mipi-video-phy: deprecate syscon phandle
  phy: samsung,dp-video-phy: deprecate syscon phandle
  phy: samsung,mipi-video-phy: deprecate syscon phandle
  ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5420
  ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5250
  arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433

 .../bindings/phy/samsung,dp-video-phy.yaml    |  5 +-
 .../bindings/phy/samsung,mipi-video-phy.yaml  | 11 ++-
 .../bindings/soc/samsung/exynos-pmu.yaml      | 71 +++++++++++++++----
 arch/arm/boot/dts/exynos5250.dtsi             | 24 +++----
 arch/arm/boot/dts/exynos5420.dtsi             | 24 +++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 19 +++--
 drivers/phy/samsung/phy-exynos-dp-video.c     |  7 +-
 drivers/phy/samsung/phy-exynos-mipi-video.c   |  7 +-
 8 files changed, 105 insertions(+), 63 deletions(-)

-- 
2.34.1

