Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E37C61DA7
	for <phone-devel@archiver.kernel.org>; Fri, 27 Jan 2023 21:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjA0VQG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjA0VQE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 27 Jan 2023 16:16:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D4D88F3E
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:15:38 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j36-20020a05600c1c2400b003dc39cb9c33so1992047wms.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Jan 2023 13:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FziN2ciblGO11V/qPlwYKnDFHaO/t/ie6w/sKp8lvIY=;
        b=W5PFTaeeYxWlgV02+EJnISFZeW+ldcp0gYNhmnDPX2C62Y3OX8smGdWwSPmsW+2l2d
         mLf1KR7nZHQzpsOGEed9/gc8S5XUoG/AUPOtnCc1fZvgJoBZIwj9o0LKoqQF7H9LGSPW
         qNY99e6rxtwU8yTvAdP2Ldr7eGJLNADbktzxD1RdJFp1yTDdxOoUe6hWRS6zM4DSpuyK
         mAlV0eFj2oyE8u7LZj29skEKufjFmTsIDJPAqlAGEciNSHMr2QZkYgnwAKdPghHXoV/Y
         Ra1/QJdvT5+rJuJhm/Va0mon5g+f9D/hq3r6YK2xSqNZFwvaH1bEizISROsQtFDnupcT
         m5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FziN2ciblGO11V/qPlwYKnDFHaO/t/ie6w/sKp8lvIY=;
        b=JPRKj1V/kkdSU+BiTI0I7rfGW50vCGD4NmBxjufeOfNF4RfeKliYvY6/PRlbRp6x2n
         BHLEOTLodWe53gCnir+zsdGDeNpZcKCZKP3+n7EJCVUpIKh9SVs+7aJsYcdQVUFYLynl
         fafqHhEu5dqzzmYAiHr3XFEy5FWOHaozSrifID2pm8RmY/B2W86jYvVci32cUrdnk3Lv
         fK98DgNNQAi3h1Zzeh92kZnAeHp89GPVFuJHmknGav8ykwAhVcTbBVRc7dbNgPdDWJea
         XTrF6GDUmA4jkhHjXIDPnA4FR3VTvOm1+FsSezAiw005e/j8M7C8OfSULowFYe43i2lF
         /aoA==
X-Gm-Message-State: AFqh2kpc7A1XZckrdm/P9ciNhct7N+Qm8iY0G3ZscH8CnvT0XESfj6Ok
        lzJVN1Q3dXjj9FERP2s3fTj3jA==
X-Google-Smtp-Source: AMrXdXvwdcLmIe+WwjquWvEUJNbsvUuzB/zvrJRj+AJSmWF/hrIA7ICjeti3LZYuNZR9FVJ7MJ1x8A==
X-Received: by 2002:a05:600c:539a:b0:3d9:ef72:190d with SMTP id hg26-20020a05600c539a00b003d9ef72190dmr39668733wmb.19.1674854137376;
        Fri, 27 Jan 2023 13:15:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc350000000b003d9aa76dc6asm10513504wmj.0.2023.01.27.13.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:15:37 -0800 (PST)
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
Subject: [RFT PATCH v2 2/4] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx
Date:   Fri, 27 Jan 2023 22:15:25 +0100
Message-Id: <20230127211527.260060-2-krzysztof.kozlowski@linaro.org>
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

  exynos5422-odroidhc1.dtb: soc: usb3-0: {'compatible': ['samsung,exynos5250-dwusb3'],
    ... } should not be valid under {'type': 'object'}

  exynos54xx.dtsi:145.21-159.5: Warning (simple_bus_reg): /soc/usb3-0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Use ranges with values and drop reg from usb-wrapper node.
2. Keep "usb" as wrapper's node name.
---
 arch/arm/boot/dts/exynos54xx.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 3ec43761d8b9..5c799886c275 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -142,15 +142,15 @@ hsi2c_7: i2c@12cd0000 {
 			status = "disabled";
 		};
 
-		usbdrd3_0: usb3-0 {
+		usbdrd3_0: usb@12000000 {
 			compatible = "samsung,exynos5250-dwusb3";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x12000000 0x10000>;
 
-			usbdrd_dwc3_0: usb@12000000 {
+			usbdrd_dwc3_0: usb@0 {
 				compatible = "snps,dwc3";
-				reg = <0x12000000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -164,15 +164,15 @@ usbdrd_phy0: phy@12100000 {
 			#phy-cells = <1>;
 		};
 
-		usbdrd3_1: usb3-1 {
+		usbdrd3_1: usb@12400000 {
 			compatible = "samsung,exynos5250-dwusb3";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x12400000 0x10000>;
 
-			usbdrd_dwc3_1: usb@12400000 {
+			usbdrd_dwc3_1: usb@0 {
 				compatible = "snps,dwc3";
-				reg = <0x12400000 0x10000>;
+				reg = <0x0 0x10000>;
 				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,dis_u3_susphy_quirk;
-- 
2.34.1

