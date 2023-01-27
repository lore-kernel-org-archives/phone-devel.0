Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCCBC38142
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 19:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjA0T6I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbjA0T5k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 14:57:40 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DE88CE09
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:55:43 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id c3so6704782ljh.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQALOu0zos/2GKo4V4/cAoGCHCC2uLMqJ6031+6X5Jk=;
        b=sGXCHL8sCDU8JXo0+6/UceORrD3447j/IvhVsvXkReOZIMb1iKKx6TZD/aAtI1Nsic
         6/m1uQP8xTiny7FHKn0qi3/7Jklks14xKZRiMYybUveq5p2fqrtNBemqpUu2/05hrEKh
         8idqM4mgqNPoL8MiqLWCLGXeEC3ivz1xmUcmxIWp2sxotYiNX5VCbfyzzmE1C+ko4aBx
         6ljDx+2AAra8sz9FqXnp1xQx89uJSJOqefeCwJ7941Csnwa0x15aqBbwNmzBOetBjpz9
         h4OHv5awdNsCdv9rkmFhno3r+mXFJJzBMSOyjjvcpAEM0Cej7qum9CPOfO1H5rpjqMFd
         XA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQALOu0zos/2GKo4V4/cAoGCHCC2uLMqJ6031+6X5Jk=;
        b=WZXVGM9iJQbEyhEW7s8zjqdf+Z+90cj/SZHYHwhceV9O/f4AWrLfvUym449F76GYfh
         C5ogvvDr+E8p9DY1fBFhjARsXP5Te4BxPaEKYaimrcJxgaEwBvsd9QsC3+AFlUxbMMjG
         ToYKxWS8AYDURm2ofkVX+eRtHNV57qm/iSQkJvJ06rSlqYdUQmLgfumgg9L3IovVJl48
         94+yD+70Gqjzr5nc9ev5R9U4MnXM2bOUML8F1gYP9PT3f1QwIsp2EMgX/IWfvK3xrlKr
         iilHyiU9c2USSsx+a0xO4m0BBZ6RuuxsGA4piQYt4B9aFm4crZjm+4rcTo47Ve2vH63M
         QDBA==
X-Gm-Message-State: AO0yUKVWHeRaFHVwWvq7g90oDsRQc+DCHilKemJK2d+D9ASOsTCmtZ4k
        p/nM5adWfHnZxpWm04doemia9OnxGzB6W3y+
X-Google-Smtp-Source: AMrXdXtHCz5lyTuBDBjfZVraQ1cpBDmDluPB/WtBMnbu+8cXUQblVz7YLrQFitgm3u+uI9Bmt0CrQg==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id x2-20020a5d6b42000000b002bc7e6c7cd8mr34616383wrw.26.1674848482242;
        Fri, 27 Jan 2023 11:41:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:21 -0800 (PST)
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
Subject: [PATCH 8/8] arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433
Date:   Fri, 27 Jan 2023 20:40:57 +0100
Message-Id: <20230127194057.186458-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The MIPI phy is actually part of the Power Management Unit system
controller.  It does not have own address space, thus keeping the node
under soc causes warnings:

  exynos5433-tm2e.dtb: soc@0: video-phy: {'compatible': ['samsung,exynos5433-mipi-video-phy'], ...
    should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9da24fe958a3..842976addbd9 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -911,12 +911,20 @@ pinctrl_touch: pinctrl@14ce0000 {
 		};
 
 		pmu_system_controller: system-controller@105c0000 {
-			compatible = "samsung,exynos5433-pmu", "syscon";
+			compatible = "samsung,exynos5433-pmu", "simple-mfd", "syscon";
 			reg = <0x105c0000 0x5008>;
 			#clock-cells = <1>;
 			clock-names = "clkout16";
 			clocks = <&xxti>;
 
+			mipi_phy: mipi-phy {
+				compatible = "samsung,exynos5433-mipi-video-phy";
+				#phy-cells = <1>;
+				samsung,cam0-sysreg = <&syscon_cam0>;
+				samsung,cam1-sysreg = <&syscon_cam1>;
+				samsung,disp-sysreg = <&syscon_disp>;
+			};
+
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				regmap = <&pmu_system_controller>;
@@ -936,15 +944,6 @@ gic: interrupt-controller@11001000 {
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 
-		mipi_phy: video-phy {
-			compatible = "samsung,exynos5433-mipi-video-phy";
-			#phy-cells = <1>;
-			samsung,pmu-syscon = <&pmu_system_controller>;
-			samsung,cam0-sysreg = <&syscon_cam0>;
-			samsung,cam1-sysreg = <&syscon_cam1>;
-			samsung,disp-sysreg = <&syscon_disp>;
-		};
-
 		decon: decon@13800000 {
 			compatible = "samsung,exynos5433-decon";
 			reg = <0x13800000 0x2104>;
-- 
2.34.1

