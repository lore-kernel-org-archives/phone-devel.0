Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC548C38142
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 19:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjA0TnB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjA0Tm4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 14:42:56 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1379521CC
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:42:22 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t18so5930712wro.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt+BQRUkVwG5AY299cvvsisO/FIKbvndsHMl4pZfRMk=;
        b=fXOWLG86zl7dLNoOfrtLG2LDDDFOaeVYTumck+Oi0XdoziW+QPSIuPZMMob2St1S6L
         cgoUi1DZwOpAQpEAYNSDlXLMHfYiEkUV++bVcZuJdf8NXaoFa65a/TUO6OgrsBpXTONK
         h9ap40zTIYBWGkZm1w5L35XD46ECyfGJzH7ToHO2BX46uwSOnCI/9rHmVZUcW7J+y+T0
         VGt6Peyy8x0YbInO8ZAYkgiKB4vTqEgB3qJf8HUhe3+SliiOG2zr02bNomvJ29ns/QeE
         wXAYU/yuJC2NgVtmYIZv6xf0an22eIpq90KxEfLwxyapwcao7K3zaf3ln80FEK3An1kM
         NwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt+BQRUkVwG5AY299cvvsisO/FIKbvndsHMl4pZfRMk=;
        b=WOKDDm13feozY8P1XXjNvbQfggMLYkg76wbJEI4PX7IznYWf2S42Sdkbwdh1+b6njC
         V/xtp62hv6bvsTe8UEEFLkVtwqOt+QvombEPpSuwjCxki30YTLgX2iu0isIk5wGw2D6C
         BijmakUGNNb8Vc0TdYVHHGWLt+EjN10McBcVi4VBytPOWkpcGNXE9YyiXNwCqXF0RML6
         lGLGuUr9znMDrDvzsULUM0drcU6DgVXK6oFgVwe9a/o8xpfazxxhaA8NfGz6Ec5bYSUe
         WKdhAvF7fTx4IJ0HKzezi4Z0Vo1wB/TnUXQFxPjj3La+YIZF+38cYyeBD2EtfNO6F+Nz
         gtsQ==
X-Gm-Message-State: AFqh2krSRwoE12wN/U3W/j9pj+HWREdH1omx99ve0Tvx8DYyrSswLsw4
        hqdnDgI3kZBuSCdKaA9sXWnHjg==
X-Google-Smtp-Source: AMrXdXvK0+FHXkZkxXvhKqcDYinThadMV34TC4+bbQQYM0mPZLE1nitz9lp4mqXEtWCgarftFafXPw==
X-Received: by 2002:a5d:5a8f:0:b0:2be:53cc:ca5c with SMTP id bp15-20020a5d5a8f000000b002be53ccca5cmr29109152wrb.15.1674848480281;
        Fri, 27 Jan 2023 11:41:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:19 -0800 (PST)
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
Subject: [PATCH 7/8] ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5250
Date:   Fri, 27 Jan 2023 20:40:56 +0100
Message-Id: <20230127194057.186458-8-krzysztof.kozlowski@linaro.org>
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

  exynos5250-arndale.dtb: soc: video-phy-0: {'compatible': ['samsung,exynos5250-dp-video-phy'],
    'samsung,pmu-syscon': [[20]], '#phy-cells': [[0]], 'phandle': [[24]]} should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 97e89859ba3d..a35c00f055a3 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -290,7 +290,7 @@ pinctrl_3: pinctrl@3860000 {
 		};
 
 		pmu_system_controller: system-controller@10040000 {
-			compatible = "samsung,exynos5250-pmu", "syscon";
+			compatible = "samsung,exynos5250-pmu", "simple-mfd", "syscon";
 			reg = <0x10040000 0x5000>;
 			clock-names = "clkout16";
 			clocks = <&clock CLK_FIN_PLL>;
@@ -298,6 +298,16 @@ pmu_system_controller: system-controller@10040000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 			interrupt-parent = <&gic>;
+
+			dp_phy: dp-phy {
+				compatible = "samsung,exynos5250-dp-video-phy";
+				#phy-cells = <0>;
+			};
+
+			mipi_phy: mipi-phy {
+				compatible = "samsung,s5pv210-mipi-video-phy";
+				#phy-cells = <1>;
+			};
 		};
 
 		watchdog@101d0000 {
@@ -810,18 +820,6 @@ mixer: mixer@14450000 {
 			status = "disabled";
 		};
 
-		dp_phy: video-phy-0 {
-			compatible = "samsung,exynos5250-dp-video-phy";
-			samsung,pmu-syscon = <&pmu_system_controller>;
-			#phy-cells = <0>;
-		};
-
-		mipi_phy: video-phy-1 {
-			compatible = "samsung,s5pv210-mipi-video-phy";
-			#phy-cells = <1>;
-			syscon = <&pmu_system_controller>;
-		};
-
 		dsi_0: dsi@14500000 {
 			compatible = "samsung,exynos4210-mipi-dsi";
 			reg = <0x14500000 0x10000>;
-- 
2.34.1

