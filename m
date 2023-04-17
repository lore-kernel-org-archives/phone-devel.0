Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10221C77B72
	for <phone-devel@archiver.kernel.org>; Mon, 17 Apr 2023 07:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjDQH6Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Apr 2023 03:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDQH55 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Apr 2023 03:57:57 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABA45259
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:57:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2a8c30ac7e3so5785561fa.1
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681718267; x=1684310267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvg24ZtyfNTkHMtLE3EkBVO8VvHf34aXFBywPtRZS3E=;
        b=c1anAx1m+XIRLXQuwB/rBBEq2xLzJvT3PkaXgePZ8emnzf06qPOW/4RQ9AKumd9ScG
         jAZu60Mb5jQaiDEmz9mX/2lt9j+3PPJNRHg5C8aj4fJFH/BVO451ICrH1rhsg+mEoEHB
         x28rhMz/3XvC9kDbzlqseiw2b2H5GTu2mWul188VbBHT8znP0GdNb4cg2iVPHYvJUMGl
         Ym6oJDNn/Q1H2zOMt+VBU7jpn7Q52IFBaTBE/M31h3DPhrHy24LNDQjkC+sICJFZeO/g
         XBnVoI73veFKqZ5ECKTIiefZRoDOrsSKaovu7LkBex2zSVROvB+I/+g5ddATTECEx1il
         Wadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718267; x=1684310267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvg24ZtyfNTkHMtLE3EkBVO8VvHf34aXFBywPtRZS3E=;
        b=MR6T6HSEAKc2KxTT3gzTPhlgh0b5eqG/QjDSUe8LJAClUx+a26JlygwO+p8693m/jR
         Seh58UUdmSL8x9AyoU6cb4+QsWDA0vCFVCCbbVHQHWOV41U+oy0IxhwVrpGMGGftrDZ4
         G4oemafl9VyAOU4BnvelgdnRIACObGMzk93HDY8nqxrYBqt8VJJbnZqyM5Tl5znZdXZQ
         jJKCn0fq48wKKkiL+lu4GCazvr6HasdAAmGJ3s6Hs8qVVz8oiv5j9nl4Qc+RXBQJjLqr
         8Uebdwtiq2I8e6SvRfaDC0QR5mD0oEuxkfhII3jHrEymGbFk/PV27EQpxvAf57uQN8Te
         X+EQ==
X-Gm-Message-State: AAQBX9fGJgdb/fWDXpOPVJ/xGqkU0IbxrJlmM5R8aQN5aXMxkjqCFNIY
        iKlaW00QDF3wPtXAzuFtww0TXzB2/dUy5PPGp0U=
X-Google-Smtp-Source: AKy350bOBcQKR8b/J8jbOHeVbSx8A1HJYXl9E+jj1GdRh6BJHoPyhUX526gO6EIL0Of+pKJpQdWxXg==
X-Received: by 2002:a19:ad02:0:b0:4d8:5096:1c95 with SMTP id t2-20020a19ad02000000b004d850961c95mr1662123lfc.43.1681718267118;
        Mon, 17 Apr 2023 00:57:47 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25150000000b004ec8615304dsm1965713lfd.222.2023.04.17.00.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 00:57:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add eSRAM nodes
Date:   Mon, 17 Apr 2023 09:57:43 +0200
Message-Id: <20230417075743.3162696-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The U8500 has 640 KB of eSRAM, split into 5 banks of 128 KB
each. Add this to the device tree, with ESRAM 0, 1+2 and 3+4
as separate devices, since these have different power domains.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 73 ++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index fead7afd5517..c34ccde04600 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -110,6 +110,74 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		/*
+		 * 640KB ESRAM (embedded static random access memory), divided
+		 * into 5 banks of 128 KB each. This is a fast memory usually
+		 * used by different accelerators. We group these according to
+		 * their power domains: ESRAM0 (always on) ESRAM 1+2 and
+		 * ESRAM 3+4.
+		 */
+		sram@40000000 {
+			/* The first (always on) ESRAM 0, 128 KB */
+			compatible = "mmio-sram";
+			reg = <0x40000000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x40000000 0x20000>;
+
+			sram@0 {
+				compatible = "stericsson,u8500-esram";
+				reg = <0x0 0x10000>;
+				pool;
+			};
+			lcpa: sram@10000 {
+				/*
+				 * This eSRAM is used by the DMA40 DMA controller
+				 * for Logical Channel Paramers (LCP), the address
+				 * where these parameters are stored is called "LCPA".
+				 * This is addressed directly by the driver so no
+				 * pool is used.
+				 */
+				compatible = "stericsson,u8500-esram";
+				label = "DMA40-LCPA";
+				reg = <0x10000 0x800>;
+			};
+			sram@10800 {
+				compatible = "stericsson,u8500-esram";
+				reg = <0x10800 0xf800>;
+				pool;
+			};
+		};
+		sram@40020000 {
+			/* ESRAM 1+2, 256 KB */
+			compatible = "mmio-sram";
+			reg = <0x40020000 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x40020000 0x40000>;
+		};
+		sram@40060000 {
+			/* ESRAM 3+4, 256 KB */
+			compatible = "mmio-sram";
+			reg = <0x40060000 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x40060000 0x40000>;
+
+			lcla: sram@20000 {
+				/*
+				 * This eSRAM is used by the DMA40 DMA controller
+				 * for Logical Channel Logical Addresses (LCLA), the address
+				 * where these parameters are stored is called "LCLA".
+				 * This is addressed directly by the driver so no
+				 * pool is used.
+				 */
+				compatible = "stericsson,u8500-esram";
+				label = "DMA40-LCLA";
+				reg = <0x20000 0x2000>;
+			};
+		};
+
 		ptm@801ae000 {
 			compatible = "arm,coresight-etm3x", "arm,primecell";
 			reg = <0x801ae000 0x1000>;
@@ -536,9 +604,10 @@ usb_per5@a03e0000 {
 
 		dma: dma-controller@801C0000 {
 			compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-			reg = <0x801C0000 0x1000 0x40010000 0x800>;
-			reg-names = "base", "lcpa";
+			reg = <0x801C0000 0x1000>;
+			reg-names = "base";
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			sram = <&lcpa>, <&lcla>;
 
 			#dma-cells = <3>;
 			memcpy-channels = <56 57 58 59 60>;
-- 
2.39.2

