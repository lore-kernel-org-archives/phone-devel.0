Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42113C433FE
	for <phone-devel@archiver.kernel.org>; Tue,  8 Nov 2022 20:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiKHUrj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Nov 2022 15:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiKHUrY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Nov 2022 15:47:24 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C272FFE
        for <phone-devel@vger.kernel.org>; Tue,  8 Nov 2022 12:47:23 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u2so22912063ljl.3
        for <phone-devel@vger.kernel.org>; Tue, 08 Nov 2022 12:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B82c4lbL3kc77Ae8Ku2JosDlQ1QZd9aR311C4XcIyt4=;
        b=WEjxwybMvT6N5fAsq22TqrJbGuYJjA7EtpRZGv9FyJ3DAkv5p+0BlszjNPGMOqZhGj
         NhEO9XZqcmr157Q8WBLNtXWEXxE5o1QstjFshqR8wABi+sHSnFnr1ZVBugCyzDdzUoeZ
         4a4VjxIryrTeLYjz4Q8NrU1bTv5iqPgOhXya6JNBZ1fx29viqcgmEKQKvVgxnrEB3G1m
         x1axN/KUPGbAoHLVivRyd+sCc0PM3EdzUhVZc9EazJVXe5if0xrYDijrkM7j97NNA0sw
         gMrOgVxh9afcbaQB/nVkFSK/PO2qYprHV7Ta0boHh5txY7Mg+XjunpCDyyplTUavSDT5
         NRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B82c4lbL3kc77Ae8Ku2JosDlQ1QZd9aR311C4XcIyt4=;
        b=EiN4dyI0SvHQPpmmpXuTbhHw6ibmHIpIwWWC3cLrjkq17ii4l2sqY2dXtYa0MWSyN3
         HXFoExqCeXRR09LfMEJeyj+mi+IkhXZf25rzeBphSadjFNfISznRjeYsID10iKhWLpZi
         69p12MY2M/Fe4L6HuHZmUchcjDhb+1+9/whSs7v05R96VU0mjyaB1STMiBWzboy2GNI/
         IDn9Sp3KCH/cPtEBX/4h+xE8VcfFd/PjBCbMHj//BNqdUovdW3ZxnPEru3QSke3nF80s
         qs38gQHJU8YjArZosNx0pPPwo3plAmxViUqB/hJQPmkN6xojwwxMyg0THSYbhrgJ7/2e
         7A4w==
X-Gm-Message-State: ACrzQf2/TcMu1jqnfr95rhMGKwaPZDulaiwea6hEuWFgtCYzoXx3brY8
        JfvooMJjl/B39YkCIRbfeCCyp5xb/e04eQ==
X-Google-Smtp-Source: AMsMyM5qQ8TxMWirg6B8L9AHnEEwZJ9NeIOv0za6gXqd002NwnTS9U5vDXepWU9HlS2HPCaIxv73Wg==
X-Received: by 2002:a2e:8692:0:b0:277:23f:5f28 with SMTP id l18-20020a2e8692000000b00277023f5f28mr7127886lji.124.1667940441973;
        Tue, 08 Nov 2022 12:47:21 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id d10-20020a0565123d0a00b004979e1ff641sm1925667lfv.115.2022.11.08.12.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 12:47:21 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add eSRAM to the device tree
Date:   Tue,  8 Nov 2022 21:47:19 +0100
Message-Id: <20221108204719.1859700-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The Ux500 contains 640KB embedded static RAM that can be
used to speed up e.g. image rotation. Put it in the device
tree so that accelerators can pick it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-db8500.dtsi |  4 ----
 arch/arm/boot/dts/ste-db9500.dtsi |  4 ----
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 15 +++++++++++++++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/ste-db8500.dtsi b/arch/arm/boot/dts/ste-db8500.dtsi
index f1ff3f4835d7..d5fe4583d790 100644
--- a/arch/arm/boot/dts/ste-db8500.dtsi
+++ b/arch/arm/boot/dts/ste-db8500.dtsi
@@ -13,10 +13,6 @@ cpu@300 {
 	};
 
 	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
 		/* Modem trace memory */
 		ram@6000000 {
 			reg = <0x06000000 0x00f00000>;
diff --git a/arch/arm/boot/dts/ste-db9500.dtsi b/arch/arm/boot/dts/ste-db9500.dtsi
index 4273d36e881d..3a0a3e6713dc 100644
--- a/arch/arm/boot/dts/ste-db9500.dtsi
+++ b/arch/arm/boot/dts/ste-db9500.dtsi
@@ -13,10 +13,6 @@ cpu@300 {
 	};
 
 	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
 		/*
 		 * Initial Secure Software ISSW memory
 		 *
diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index a42a4fd69299..7fdf6ed9b202 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -65,6 +65,21 @@ CPU1: cpu@301 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/*
+		 * ESRAM - 640K Embedded Static RAM, 5 banks of 128K each
+		 * this memory is used when you need something fast.
+		 */
+		esram: ram@40000000 {
+			reg = <0x40000000 0x000a0000>;
+			no-map;
+		};
+	};
+
 	thermal-zones {
 		/*
 		 * Thermal zone for the SoC, using the thermal sensor in the
-- 
2.37.3

