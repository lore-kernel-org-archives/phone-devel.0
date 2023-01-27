Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641D0C38142
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 19:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjA0ToU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:44:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbjA0TnU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 14:43:20 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401F812F1F
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:42:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id z5so5906492wrt.6
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXF/FT5VGcZwGc673y38gqasO1Ez04eMNkbruDEnIiI=;
        b=gdCf/BsV0BYHDAVQaGj5uEJC9/P5TJgw3sLCjI3tvD5gHFroLZUguanFfSw57RPvHI
         bye/8CUczKtkj9n1YhnsZ3GaqSfodFcfyZDFKw9On2IYALM6xlQkOpZCnETKLul19xX8
         KW0nPXpMlJbXMTNKtbulWGFLKv9hImcMnghQjAv73k/a4SezMjGkOhX34thvQmQMluHN
         6MNFoC7IEyp/bkKPYOHxAo5KVOLiByKXQFSDDc8L9ibSa3QuziNoIn4g9XLwyp/VteK+
         mF/RM1SorxAI+BKuuDh6k5GBuOn1D8/aEtMSWZhF9i8gjCrqyIjIkrbxnQewITtXf5e2
         PbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXF/FT5VGcZwGc673y38gqasO1Ez04eMNkbruDEnIiI=;
        b=hPxHCXFfyNUy8T/DO42408yY5MIm2RMUaqBZYRwUhb73HDpLJ0wzwMYbiR8Hw+Uvki
         V33/GcziSk+lJjtcM+RBK0V6fhKXk7YMmeaQspjoI6pDbqlqQWV4AuuLNw3AZdFuLFKA
         OresCQ0vNJ3I7qC2vUZQeaJcw29wz+QF/b9A/af1Dig0QYqw1BXp0/6GODoAHCPJ8Cob
         X56G0cAUsIvNqYzNjZYrCdrTYy8R/ofr6TR7gH3Kypr8A2J24fbYCv5LdXJQQzSfIP+v
         Bi/BVidbuvInhFHVtVgk+DUinYjp60cW7fxw4OIrtcFDvHv7aNNYynGWhOUBEa5DiOeG
         JYKQ==
X-Gm-Message-State: AO0yUKW62NqnYi8622cj3yvghx0NE6j2GQYtAZPHv+eFMZyhqZLzUqpL
        jAXsHysQU3hJXsbSy93p0EadeQ==
X-Google-Smtp-Source: AK7set+jJD3RzRxwzaa36W6wlFcd+BsYxdURd8hMG6GYx8fH7v5XbeXGgf7+C6HLF/HWbchZLVIS/Q==
X-Received: by 2002:a05:6000:104a:b0:2bf:ae18:34dd with SMTP id c10-20020a056000104a00b002bfae1834ddmr13491676wrx.56.1674848478404;
        Fri, 27 Jan 2023 11:41:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:18 -0800 (PST)
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
Subject: [PATCH 6/8] ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5420
Date:   Fri, 27 Jan 2023 20:40:55 +0100
Message-Id: <20230127194057.186458-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The DisplayPort and MIPI phys are actually part of the Power Management
Unit system controller.  They do not have their own address space, thus
keeping the nodes under soc causes warnings:

  exynos5420-smdk5420.dtb: soc: dp-video-phy: {'compatible': ['samsung,exynos5420-dp-video-phy'],
    'samsung,pmu-syscon': [[11]], '#phy-cells': [[0]], 'phandle': [[16]]} should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index b1051a7d07af..6cdb1a832fb9 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -585,18 +585,6 @@ spi_2: spi@12d40000 {
 			status = "disabled";
 		};
 
-		dp_phy: dp-video-phy {
-			compatible = "samsung,exynos5420-dp-video-phy";
-			samsung,pmu-syscon = <&pmu_system_controller>;
-			#phy-cells = <0>;
-		};
-
-		mipi_phy: mipi-video-phy {
-			compatible = "samsung,exynos5420-mipi-video-phy";
-			syscon = <&pmu_system_controller>;
-			#phy-cells = <1>;
-		};
-
 		dsi: dsi@14500000 {
 			compatible = "samsung,exynos5410-mipi-dsi";
 			reg = <0x14500000 0x10000>;
@@ -822,7 +810,7 @@ jpeg_1: jpeg@11f60000 {
 		};
 
 		pmu_system_controller: system-controller@10040000 {
-			compatible = "samsung,exynos5420-pmu", "syscon";
+			compatible = "samsung,exynos5420-pmu", "simple-mfd", "syscon";
 			reg = <0x10040000 0x5000>;
 			clock-names = "clkout16";
 			clocks = <&clock CLK_FIN_PLL>;
@@ -830,6 +818,16 @@ pmu_system_controller: system-controller@10040000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 			interrupt-parent = <&gic>;
+
+			dp_phy: dp-phy {
+				compatible = "samsung,exynos5420-dp-video-phy";
+				#phy-cells = <0>;
+			};
+
+			mipi_phy: mipi-phy {
+				compatible = "samsung,exynos5420-mipi-video-phy";
+				#phy-cells = <1>;
+			};
 		};
 
 		tmu_cpu0: tmu@10060000 {
-- 
2.34.1

