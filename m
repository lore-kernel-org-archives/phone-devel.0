Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1348DC61DB3
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 21:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjA0V2A (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbjA0V1d (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 16:27:33 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADC421A27
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:27:31 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id q8so4323540wmo.5
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wufxP51EWGGk9HXvgWg83TOisM7XYlAWLVo728uV5hA=;
        b=TNh0kQVqhFnNqu+G4pM9Oc4M6cePC/63S8gdsyMqkTslrWbQDlS/J9kJFWBMD1uYQq
         GC8WJIGE+wIbDdmM20nqVIGiSx2tV1fXN9W0yoVcq18u46qVw/Y1aIxbkPjlL8CV2gbP
         X7UfnZFWSCxDk8Z5VmyGvbZ0HnT+9b2idsd3AvkP3853iFpWojQFHF4njPIeOdDQp0nz
         zJFF1xQWjcZ5Sqfw0KQCRzwFvmndDMTDTVrExJt7qMNa+Z6/DAONPWkeCzaIoVCs0bZ0
         IaKQzSVcBq0jXX5ckuKrSgK3YPg5bUb8I/W0u5zWZliCUxuOWJN0ApMETnFd9MrV++Z6
         8meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wufxP51EWGGk9HXvgWg83TOisM7XYlAWLVo728uV5hA=;
        b=dM8f9c9R5Bv+Ya8a1Yvt7kv4Yv1QtJlDeZ392IAf47TUzPb+ji64oMV6tcdLeDZKvb
         W4J93Ra10DEQNlbpaesK5dDAPAOQCtL6zvWATOkSD570xd9oXpCUzEUl9yQh8/sSBY0U
         pVN9u9NtQ5ffERmCP4J0XHfy6x7VHSy8+srdNXtWPyuNd9TihNZ57+Pg+LSf3d4tkvuB
         lgZyiBfhyQ9MHNQ9Qn6sIuxs22tif6U8STeNrQT0BpSx1OqCxcM5kkVfFv4mHKS+UbG0
         2yXOfTJmAt4l49LSPjSIg+Zdx57DKbc+6ybZXjP+DKFr17TuasGvWoPToTQtLeJmPg6o
         JyJA==
X-Gm-Message-State: AFqh2kpVuW8AyXHyfPCrmUJMMP0rCf10Se8VCjzPJq9Sbh1UVyZDS8CK
        YPHZdcJ/yw+A+0MUb6nV9Ds+dg==
X-Google-Smtp-Source: AMrXdXuxJSnrinJ8RLzt8CTuozc6iwrAzQwFHVN8Hco1FzCN0sBy5xGjIVn+L+D1CcmXgSb3sQWagg==
X-Received: by 2002:a05:600c:35d0:b0:3db:c4c:9224 with SMTP id r16-20020a05600c35d000b003db0c4c9224mr40221166wmq.3.1674854849674;
        Fri, 27 Jan 2023 13:27:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm8645303wms.38.2023.01.27.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:27:29 -0800 (PST)
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
Subject: [RFT PATCH v3 4/4] arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos7
Date:   Fri, 27 Jan 2023 22:27:13 +0100
Message-Id: <20230127212713.267014-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
References: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos7-espresso.dtb: soc@0: usb: {'compatible': ['samsung,exynos7-dwusb3'], ...
    should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 82fee1b7caab..b1fa68835b09 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -690,7 +690,7 @@ usbdrd_phy: phy@15500000 {
 			#phy-cells = <1>;
 		};
 
-		usbdrd: usb {
+		usbdrd: usb@15400000 {
 			compatible = "samsung,exynos7-dwusb3";
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
 			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
@@ -699,11 +699,11 @@ usbdrd: usb {
 				"usbdrd30_axius_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x15400000 0x10000>;
 
-			usb@15400000 {
+			usb@0 {
 				compatible = "snps,dwc3";
-				reg = <0x15400000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
-- 
2.34.1

