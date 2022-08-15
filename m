Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAD9C2BB43
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 04:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiHPEl7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 00:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbiHPEl1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 00:41:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E006313F0F
        for <phone-devel@vger.kernel.org>; Mon, 15 Aug 2022 13:32:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f20so12096211lfc.10
        for <phone-devel@vger.kernel.org>; Mon, 15 Aug 2022 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Y/LelyhG4TE3iGCUkEmO2PRbemUE3OjmhGQxCtQCQn4=;
        b=SAwRmGE12m9NrXfh8JDKbuRPLrjBLkkhDMDLKFmI2xdVL1TOQoE4AnQV6tOfyzgMF+
         AL/Wm56Ju2FQLs29WBm6JTmXHiBf7fBzkWqFHrx4TxI2kzdhq5H3hOqV5Oo417BEItAn
         DXiq8iU7ny0Zvd+ndrGSGxBQuneS1uJvzlXX3ymWlttFf4894pGJOb0fgNQgy2t8dPOv
         80vpBV1F4/qUXYGozx63jVjWl/0vfuLMd5Y/6cYu1kcN6/sHhtnZKd19MjPz+BYWgh6v
         vVwv1FvEK1NEeGw7ToJ3KFOVunkuFZpMdKqlUrVmfHv0qG4Aljq8vMfm9G0vzQh0JdNu
         +i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Y/LelyhG4TE3iGCUkEmO2PRbemUE3OjmhGQxCtQCQn4=;
        b=pcuZQW/xLgDrbgy/0W6zWJDoeFwfy/a2rQSYhzwvUxg5WbBMGKVTan9Uv5eN8hHNLy
         J1T1/8uTTQu7vhzZgo3cjxAI891lhJjTbjttgqzhwpCPfahRhhpR9Il1B5cUYIMnQSAp
         jVg4dDv4ai0wF+MEWR5U5Ku+dJslT3hyWKTQ0SKEe/3ZNlowZluu7UJoTi61VGGzNZ+k
         yrghvuR3aZLTt2l8whiaFgkQpqJstOx6qkvceHYrca3Hj0cwp7QNwYb29EZD+dJ32AEh
         mjgo7bbukpd/qh0pn3X6/gOwH7g8OyH5+saGHHkrxDyyWFSPX4euWh/5/yH3d/xWMTK5
         2AIA==
X-Gm-Message-State: ACgBeo1xGosR092W2xyUZBwxkvWCvIcTDG2o5z13FNI871LhAzUpzJGT
        K5CimLJRi4SsqFWrGPmWgaVITg==
X-Google-Smtp-Source: AA6agR7ZuyDGK6pY0UkzEW5E1ygObnrdb7RKaWco7nyu2oemtqAKsiEXWZcGK2wy/i8zPXf7XnN2Wg==
X-Received: by 2002:a19:e612:0:b0:48a:9167:4861 with SMTP id d18-20020a19e612000000b0048a91674861mr5870378lfh.545.1660595566794;
        Mon, 15 Aug 2022 13:32:46 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c2-20020ac244a2000000b0048c55ff738asm1183154lfm.246.2022.08.15.13.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 13:32:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add GPS to the Kyle
Date:   Mon, 15 Aug 2022 22:30:44 +0200
Message-Id: <20220815203044.468686-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds the GPS chip to the Kyle device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
index c57676faf181..e6a7d608e326 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
@@ -307,6 +307,21 @@ uart@80121000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&u1rxtx_a_1_default &u1ctsrts_a_1_default>;
 			pinctrl-1 = <&u1rxtx_a_1_sleep &u1ctsrts_a_1_sleep>;
+
+			gnss {
+				/* The CSRG05TA03-ICJE-R is a SirfStarV 5t chip */
+				compatible = "csr,csrg05ta03-icje-r";
+				/* GPS_RSTN on GPIO21 */
+				reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+				/* GPS_ON_OFF on GPIO86 */
+				sirf,onoff-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+				/* GPS_1V8 (VSMPS2) */
+				vcc-supply = <&db8500_vsmps2_reg>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&g05ta03_kyle_default>;
+				/* According to /etc/sirfgps.conf */
+				current-speed = <460800>;
+			};
 		};
 
 		/* Debugging console UART connected to AB8505 USB */
@@ -666,6 +681,20 @@ kyle_cfg1 {
 			};
 		};
 	};
+	g05ta03 {
+		g05ta03_kyle_default: g05ta03 {
+			/* Reset line, start out de-asserted */
+			kyle_cfg1 {
+				pins = "GPIO21_AB3";
+				ste,config = <&gpio_out_hi>;
+			};
+			/* GPS_ON_OFF, start out deasserted (off) */
+			kyle_cfg2 {
+				pins = "GPIO86_C6";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 };
 
 &ab8505_gpio {
-- 
2.37.1

