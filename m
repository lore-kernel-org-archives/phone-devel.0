Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42696C4332F
	for <phone-devel@archiver.kernel.org>; Tue,  8 Nov 2022 20:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiKHUWC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Nov 2022 15:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiKHUV4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Nov 2022 15:21:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8FE6A687
        for <phone-devel@vger.kernel.org>; Tue,  8 Nov 2022 12:21:53 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x21so22776134ljg.10
        for <phone-devel@vger.kernel.org>; Tue, 08 Nov 2022 12:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NwL/zhjlVjMcEGGqz7a4YmtMwYO0grTmEWZlLYDtOww=;
        b=Ls5oDqWuHMjGVEIVvce08GIpfpkueVb2SMeBRuJ5caXEDzqiUGdrC82LDcVoOFKI0P
         f2uAtwz+MKEo2DDvmez5citQu1uYMXjW3AVpvrJuQUHEbQshAEt3ygLmqYP8j23thZkS
         nOmVBPY3h5Pyv87NGZogLyUjB9aXFDGxwZ6Qv7x2ZKJGgi24ET9KarHvNdKF1M237Ckt
         ByEGQA9hYDsdwr9+C6Syj7nB/xyIwWP23CN3PmN4nJ+/jwXdlIR1UykOU8UOhvVBQq03
         u9xudk+JZ1Pcpe8lis0UEpVd68bX0Dx5fRakzL+kuxCRKNgvUqrPGmXfaU/xerNH4eC0
         7xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwL/zhjlVjMcEGGqz7a4YmtMwYO0grTmEWZlLYDtOww=;
        b=6irXKiq1vWinJh5pyfdahupEvIuD++dc0AvEM/yeMk3jBetVcv3G21jNUcKjOeKraX
         3VbJR185vSkMHR+U3Y9z2cFnuQ9EX+Q0kgvDkTWLYRiZ7NqzB+2ObQUeuBVnxJqRELV8
         FBxoZ7jIVzQbiibu5zHZpzacJotIkIcichq53aEivmtN5mYqc55q2D5Rf0se6iY4GExR
         X88FpeZtYOnTmUm4fNRgrlFJaG3j8eyLiutkD5UMuTL3LmOXfAyY1y/hjlxssMZ39NiO
         48PRZFe1wzEpgXtMRIf52JkhXd1kmXzjjpFBLBUohVcBi3ykpiwOHFDDA/2ZRvtA7QbT
         tC4g==
X-Gm-Message-State: ACrzQf0F9mBgTSroWfX2693ll+lHtlrPZsy/cSXkJNhtyj1kCYSy0+ne
        GXWVP98uTlATv8w+RQkusOvD0oyFg9hCUA==
X-Google-Smtp-Source: AMsMyM6o82IO+wnaQxKgQCdpUu8RtYNERvcI6fvfEU8n7AMwPjNESiYiAgl289bW0A4SdqvlHE/iKA==
X-Received: by 2002:a2e:b5b3:0:b0:277:4e8f:7583 with SMTP id f19-20020a2eb5b3000000b002774e8f7583mr17977546ljn.133.1667938911677;
        Tue, 08 Nov 2022 12:21:51 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u3-20020a05651220c300b0049e9122bd1bsm1906408lfr.164.2022.11.08.12.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 12:21:51 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: ux500: Drop unused register file
Date:   Tue,  8 Nov 2022 21:21:47 +0100
Message-Id: <20221108202147.1848565-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This file with all base addresses and offsets is not
used anymore, everything is looked up from the device
tree. Delete it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-ux500/cpu-db8500.c  |   1 -
 arch/arm/mach-ux500/db8500-regs.h | 195 ------------------------------
 arch/arm/mach-ux500/platsmp.c     |   2 -
 arch/arm/mach-ux500/pm.c          |   2 -
 4 files changed, 200 deletions(-)
 delete mode 100644 arch/arm/mach-ux500/db8500-regs.h

diff --git a/arch/arm/mach-ux500/cpu-db8500.c b/arch/arm/mach-ux500/cpu-db8500.c
index e929aaa744c0..7cc0dd8ed991 100644
--- a/arch/arm/mach-ux500/cpu-db8500.c
+++ b/arch/arm/mach-ux500/cpu-db8500.c
@@ -26,7 +26,6 @@
 #include <asm/mach/map.h>
 #include <asm/mach/arch.h>
 
-#include "db8500-regs.h"
 #include "pm_domains.h"
 
 static int __init ux500_l2x0_unlock(void)
diff --git a/arch/arm/mach-ux500/db8500-regs.h b/arch/arm/mach-ux500/db8500-regs.h
deleted file mode 100644
index 0d47d7171d9b..000000000000
--- a/arch/arm/mach-ux500/db8500-regs.h
+++ /dev/null
@@ -1,195 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST-Ericsson SA 2010
- */
-
-#ifndef __MACH_DB8500_REGS_H
-#define __MACH_DB8500_REGS_H
-
-/* Base address and bank offsets for ESRAM */
-#define U8500_ESRAM_BASE	0x40000000
-#define U8500_ESRAM_BANK_SIZE	0x00020000
-#define U8500_ESRAM_BANK0	U8500_ESRAM_BASE
-#define U8500_ESRAM_BANK1	(U8500_ESRAM_BASE + U8500_ESRAM_BANK_SIZE)
-#define U8500_ESRAM_BANK2	(U8500_ESRAM_BANK1 + U8500_ESRAM_BANK_SIZE)
-#define U8500_ESRAM_BANK3	(U8500_ESRAM_BANK2 + U8500_ESRAM_BANK_SIZE)
-#define U8500_ESRAM_BANK4	(U8500_ESRAM_BANK3 + U8500_ESRAM_BANK_SIZE)
-/*
- * on V1 DMA uses 4KB for logical parameters position is right after the 64KB
- * reserved for security
- */
-#define U8500_ESRAM_DMA_LCPA_OFFSET     0x10000
-
-#define U8500_DMA_LCPA_BASE    (U8500_ESRAM_BANK0 + U8500_ESRAM_DMA_LCPA_OFFSET)
-
-/* This address fulfills the 256k alignment requirement of the lcla base */
-#define U8500_DMA_LCLA_BASE	U8500_ESRAM_BANK4
-
-#define U8500_PER3_BASE		0x80000000
-#define U8500_STM_BASE		0x80100000
-#define U8500_STM_REG_BASE	(U8500_STM_BASE + 0xF000)
-#define U8500_PER2_BASE		0x80110000
-#define U8500_PER1_BASE		0x80120000
-#define U8500_B2R2_BASE		0x80130000
-#define U8500_HSEM_BASE		0x80140000
-#define U8500_PER4_BASE		0x80150000
-#define U8500_TPIU_BASE		0x80190000
-#define U8500_ICN_BASE		0x81000000
-
-#define U8500_BOOT_ROM_BASE	0x90000000
-/* ASIC ID is at 0xbf4 offset within this region */
-#define U8500_ASIC_ID_BASE	0x9001D000
-
-#define U8500_PER6_BASE		0xa03c0000
-#define U8500_PER7_BASE		0xa03d0000
-#define U8500_PER5_BASE		0xa03e0000
-
-#define U8500_SVA_BASE		0xa0100000
-#define U8500_SIA_BASE		0xa0200000
-
-#define U8500_SGA_BASE		0xa0300000
-#define U8500_MCDE_BASE		0xa0350000
-#define U8500_DMA_BASE		0x801C0000	/* v1 */
-
-#define U8500_SBAG_BASE		0xa0390000
-
-#define U8500_SCU_BASE		0xa0410000
-#define U8500_GIC_CPU_BASE	0xa0410100
-#define U8500_TWD_BASE		0xa0410600
-#define U8500_GIC_DIST_BASE	0xa0411000
-#define U8500_L2CC_BASE		0xa0412000
-
-#define U8500_MODEM_I2C		0xb7e02000
-
-#define U8500_GPIO0_BASE	(U8500_PER1_BASE + 0xE000)
-#define U8500_GPIO1_BASE	(U8500_PER3_BASE + 0xE000)
-#define U8500_GPIO2_BASE	(U8500_PER2_BASE + 0xE000)
-#define U8500_GPIO3_BASE	(U8500_PER5_BASE + 0x1E000)
-
-#define U8500_UART0_BASE	(U8500_PER1_BASE + 0x0000)
-#define U8500_UART1_BASE	(U8500_PER1_BASE + 0x1000)
-
-/* per6 base addresses */
-#define U8500_RNG_BASE		(U8500_PER6_BASE + 0x0000)
-#define U8500_HASH0_BASE        (U8500_PER6_BASE + 0x1000)
-#define U8500_HASH1_BASE        (U8500_PER6_BASE + 0x2000)
-#define U8500_PKA_BASE		(U8500_PER6_BASE + 0x4000)
-#define U8500_PKAM_BASE		(U8500_PER6_BASE + 0x5100)
-#define U8500_MTU0_BASE		(U8500_PER6_BASE + 0x6000) /* v1 */
-#define U8500_MTU1_BASE		(U8500_PER6_BASE + 0x7000) /* v1 */
-#define U8500_CR_BASE		(U8500_PER6_BASE + 0x8000) /* v1 */
-#define U8500_CRYP0_BASE	(U8500_PER6_BASE + 0xa000)
-#define U8500_CRYP1_BASE	(U8500_PER6_BASE + 0xb000)
-#define U8500_CLKRST6_BASE	(U8500_PER6_BASE + 0xf000)
-
-/* per5 base addresses */
-#define U8500_USBOTG_BASE	(U8500_PER5_BASE + 0x00000)
-#define U8500_CLKRST5_BASE	(U8500_PER5_BASE + 0x1f000)
-
-/* per4 base addresses */
-#define U8500_BACKUPRAM0_BASE	(U8500_PER4_BASE + 0x00000)
-#define U8500_BACKUPRAM1_BASE	(U8500_PER4_BASE + 0x01000)
-#define U8500_RTT0_BASE		(U8500_PER4_BASE + 0x02000)
-#define U8500_RTT1_BASE		(U8500_PER4_BASE + 0x03000)
-#define U8500_RTC_BASE		(U8500_PER4_BASE + 0x04000)
-#define U8500_SCR_BASE		(U8500_PER4_BASE + 0x05000)
-#define U8500_DMC_BASE		(U8500_PER4_BASE + 0x06000)
-#define U8500_PRCMU_BASE	(U8500_PER4_BASE + 0x07000)
-#define U9540_DMC1_BASE		(U8500_PER4_BASE + 0x0A000)
-#define U8500_PRCMU_TCDM_BASE	(U8500_PER4_BASE + 0x68000)
-#define U8500_PRCMU_TCPM_BASE   (U8500_PER4_BASE + 0x60000)
-#define U8500_PRCMU_TIMER_3_BASE (U8500_PER4_BASE + 0x07338)
-#define U8500_PRCMU_TIMER_4_BASE (U8500_PER4_BASE + 0x07450)
-
-/* per3 base addresses */
-#define U8500_FSMC_BASE		(U8500_PER3_BASE + 0x0000)
-#define U8500_SSP0_BASE		(U8500_PER3_BASE + 0x2000)
-#define U8500_SSP1_BASE		(U8500_PER3_BASE + 0x3000)
-#define U8500_I2C0_BASE		(U8500_PER3_BASE + 0x4000)
-#define U8500_SDI2_BASE		(U8500_PER3_BASE + 0x5000)
-#define U8500_SKE_BASE		(U8500_PER3_BASE + 0x6000)
-#define U8500_UART2_BASE	(U8500_PER3_BASE + 0x7000)
-#define U8500_SDI5_BASE		(U8500_PER3_BASE + 0x8000)
-#define U8500_CLKRST3_BASE	(U8500_PER3_BASE + 0xf000)
-
-/* per2 base addresses */
-#define U8500_I2C3_BASE		(U8500_PER2_BASE + 0x0000)
-#define U8500_SPI2_BASE		(U8500_PER2_BASE + 0x1000)
-#define U8500_SPI1_BASE		(U8500_PER2_BASE + 0x2000)
-#define U8500_PWL_BASE		(U8500_PER2_BASE + 0x3000)
-#define U8500_SDI4_BASE		(U8500_PER2_BASE + 0x4000)
-#define U8500_MSP2_BASE		(U8500_PER2_BASE + 0x7000)
-#define U8500_SDI1_BASE		(U8500_PER2_BASE + 0x8000)
-#define U8500_SDI3_BASE		(U8500_PER2_BASE + 0x9000)
-#define U8500_SPI0_BASE		(U8500_PER2_BASE + 0xa000)
-#define U8500_HSIR_BASE		(U8500_PER2_BASE + 0xb000)
-#define U8500_HSIT_BASE		(U8500_PER2_BASE + 0xc000)
-#define U8500_CLKRST2_BASE	(U8500_PER2_BASE + 0xf000)
-
-/* per1 base addresses */
-#define U8500_I2C1_BASE		(U8500_PER1_BASE + 0x2000)
-#define U8500_MSP0_BASE		(U8500_PER1_BASE + 0x3000)
-#define U8500_MSP1_BASE		(U8500_PER1_BASE + 0x4000)
-#define U8500_MSP3_BASE		(U8500_PER1_BASE + 0x5000)
-#define U8500_SDI0_BASE		(U8500_PER1_BASE + 0x6000)
-#define U8500_I2C2_BASE		(U8500_PER1_BASE + 0x8000)
-#define U8500_SPI3_BASE		(U8500_PER1_BASE + 0x9000)
-#define U8500_I2C4_BASE		(U8500_PER1_BASE + 0xa000)
-#define U8500_SLIM0_BASE	(U8500_PER1_BASE + 0xb000)
-#define U8500_CLKRST1_BASE	(U8500_PER1_BASE + 0xf000)
-
-#define U8500_SHRM_GOP_INTERRUPT_BASE	0xB7C00040
-
-#define U8500_GPIOBANK0_BASE	U8500_GPIO0_BASE
-#define U8500_GPIOBANK1_BASE	(U8500_GPIO0_BASE + 0x80)
-#define U8500_GPIOBANK2_BASE	U8500_GPIO1_BASE
-#define U8500_GPIOBANK3_BASE	(U8500_GPIO1_BASE + 0x80)
-#define U8500_GPIOBANK4_BASE	(U8500_GPIO1_BASE + 0x100)
-#define U8500_GPIOBANK5_BASE	(U8500_GPIO1_BASE + 0x180)
-#define U8500_GPIOBANK6_BASE	U8500_GPIO2_BASE
-#define U8500_GPIOBANK7_BASE	(U8500_GPIO2_BASE + 0x80)
-#define U8500_GPIOBANK8_BASE	U8500_GPIO3_BASE
-
-#define U8500_MCDE_SIZE		0x1000
-#define U8500_DSI_LINK_SIZE	0x1000
-#define U8500_DSI_LINK1_BASE	(U8500_MCDE_BASE + U8500_MCDE_SIZE)
-#define U8500_DSI_LINK2_BASE	(U8500_DSI_LINK1_BASE + U8500_DSI_LINK_SIZE)
-#define U8500_DSI_LINK3_BASE	(U8500_DSI_LINK2_BASE + U8500_DSI_LINK_SIZE)
-#define U8500_DSI_LINK_COUNT	0x3
-
-/* Modem and APE physical addresses */
-#define U8500_MODEM_BASE	0xe000000
-#define U8500_APE_BASE		0x6000000
-
-/* SoC identification number information */
-#define U8500_BB_UID_BASE      (U8500_BACKUPRAM1_BASE + 0xFC0)
-
-/* Offsets to specific addresses in some IP blocks for DMA */
-#define MSP_TX_RX_REG_OFFSET	0
-#define CRYP1_RX_REG_OFFSET	0x10
-#define CRYP1_TX_REG_OFFSET	0x8
-#define HASH1_TX_REG_OFFSET	0x4
-
-/*
- * Macros to get at IO space when running virtually
- * We dont map all the peripherals, let ioremap do
- * this for us. We map only very basic peripherals here.
- */
-#define U8500_IO_VIRTUAL	0xf0000000
-#define U8500_IO_PHYSICAL	0xa0000000
-/* This is where we map in the ROM to check ASIC IDs */
-#define UX500_VIRT_ROM		IOMEM(0xf0000000)
-
-/* This macro is used in assembly, so no cast */
-#define IO_ADDRESS(x)           \
-	(((x) & 0x0fffffff) + (((x) >> 4) & 0x0f000000) + U8500_IO_VIRTUAL)
-
-/* typesafe io address */
-#define __io_address(n)		IOMEM(IO_ADDRESS(n))
-
-/* Used by some plat-nomadik code */
-#define io_p2v(n)		__io_address(n)
-
-#define ARRAY_AND_SIZE(x)	(x), ARRAY_SIZE(x)
-
-#endif
diff --git a/arch/arm/mach-ux500/platsmp.c b/arch/arm/mach-ux500/platsmp.c
index 415d8ad2a3c1..656b58bd296a 100644
--- a/arch/arm/mach-ux500/platsmp.c
+++ b/arch/arm/mach-ux500/platsmp.c
@@ -20,8 +20,6 @@
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
 
-#include "db8500-regs.h"
-
 /* Magic triggers in backup RAM */
 #define UX500_CPU1_JUMPADDR_OFFSET 0x1FF4
 #define UX500_CPU1_WAKEMAGIC_OFFSET 0x1FF0
diff --git a/arch/arm/mach-ux500/pm.c b/arch/arm/mach-ux500/pm.c
index 505161bb8855..dc962d006b08 100644
--- a/arch/arm/mach-ux500/pm.c
+++ b/arch/arm/mach-ux500/pm.c
@@ -16,8 +16,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
-#include "db8500-regs.h"
-
 /* ARM WFI Standby signal register */
 #define PRCM_ARM_WFI_STANDBY    (prcmu_base + 0x130)
 #define PRCM_ARM_WFI_STANDBY_WFI0		0x08
-- 
2.37.3

