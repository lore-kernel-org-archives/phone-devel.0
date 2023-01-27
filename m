Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97066C636CC
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 21:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjA0VQH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjA0VQG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 16:16:06 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF848A571
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:15:40 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so6246476wmb.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQmF6lI2q0TjzIeYwHD5c8AnSulLQ62/2nrealL72Uc=;
        b=L6IdyEHFzPzlaiae3RtWNyZqtRChkp3n8IV1Lba404m0/9ht7Pf0nPVh1cc1+nPtch
         Opw4YRuAy8T/dDhvfVEZHqe882z8MbVj1Aw9WC9WveISN3nJtvxibnW8iSvIKL6xkr3N
         69XptRghpDVzy/D38k2wJ6YQ5fpJdyIf2OnIa4pgaavwQfJsuH1uhAuwFFvtD73TIkpO
         HxlGQIPJ/+khT39NOYsdsNtSrANJPZomHQfRq2fmfPkA8xHk/SYQIrlClcJNYKiGMAMi
         wMVdahWVJMYm30Fw7yZD/+a5wbJ/n144xf4j1hm68G89B5ZdDdHUSxbJBoz5l2FT4b9G
         zJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQmF6lI2q0TjzIeYwHD5c8AnSulLQ62/2nrealL72Uc=;
        b=c42gjjUAkdbAMppHiVXbSg4two5Mo2qDYoMYkiIKDcOk+Y1IdF9d7aIfggKxJrUVf0
         JZP24CSMCjL7dRFzJSkDVcdPhVzLEBWeVG+jDgxME9i7/TDg4ZOKJ4NGy9hZDnvT2Q16
         3td4tsRGt0k2kyWBSeD6dEOIOqq5K8OuwOQqPluKHsIwFF46RWOfQfiucXh+tNNYArtg
         ALlzb9CMbjfol8D72faZTkkUmX94wiAVwGubepMAoS+DI4Ub1FigRtI9tPrwVUaBfMx2
         77OXCIOGXh3t1EsviubXaLtmv0vlLlX+2jVTbP9mLa1hNgdbav+hMipWvAtQwb443w8p
         LzXA==
X-Gm-Message-State: AO0yUKV452HLOu2uqEEtvKrIoTnD4pqktCSx70aL4rq1n7ivzqYw8yNC
        w3GHi50kecTlk4+OgFeF+2MErQ==
X-Google-Smtp-Source: AK7set+yXMjbQdhoLqFNO9a5re4OeOLdYKdyGO4WdRoXuG7TlX+lPFWgNzeAv4KykXGmAEfe+3wjXg==
X-Received: by 2002:a05:600c:4fc6:b0:3dc:1f90:35b with SMTP id o6-20020a05600c4fc600b003dc1f90035bmr10831481wmq.34.1674854139443;
        Fri, 27 Jan 2023 13:15:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003d9aa76dc6asm10513504wmj.0.2023.01.27.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:15:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 3/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos5433
Date:   Fri, 27 Jan 2023 22:15:26 +0100
Message-Id: <20230127211527.260060-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127211527.260060-1-krzysztof.kozlowski@linaro.org>
References: <20230127211527.260060-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos5433-tm2e.dtb: soc@0: usbdrd: {'compatible': ['samsung,exynos5433-dwusb3'], ...
    should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9da24fe958a3..0fca783979f6 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1742,7 +1742,7 @@ hsi2c_11: i2c@14df0000 {
 			status = "disabled";
 		};
 
-		usbdrd30: usbdrd {
+		usbdrd30: usb@15400000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				<&cmu_fsys CLK_SCLK_USBDRD30>,
@@ -1751,16 +1751,16 @@ usbdrd30: usbdrd {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x15400000 0x10000>;
 			status = "disabled";
 
-			usbdrd_dwc3: usb@15400000 {
+			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
 					<&cmu_fsys CLK_ACLK_USBDRD30>,
 					<&cmu_fsys CLK_SCLK_USBDRD30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x15400000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1795,7 +1795,7 @@ usbhost30_phy: phy@15580000 {
 			status = "disabled";
 		};
 
-		usbhost30: usbhost {
+		usbhost30: usb@15a00000 {
 			compatible = "samsung,exynos5433-dwusb3";
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				<&cmu_fsys CLK_SCLK_USBHOST30>,
@@ -1804,16 +1804,16 @@ usbhost30: usbhost {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges <0x0 0x15a00000 0x10000>;
 			status = "disabled";
 
-			usbhost_dwc3: usb@15a00000 {
+			usbhost_dwc3: usb@0 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
 					<&cmu_fsys CLK_ACLK_USBHOST30>,
 					<&cmu_fsys CLK_SCLK_USBHOST30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x15a00000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
-- 
2.34.1

