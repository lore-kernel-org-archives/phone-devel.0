Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200AACCA485
	for <phone-devel@archiver.kernel.org>; Wed,  8 Jun 2022 03:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242449AbiFHDRc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Jun 2022 23:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357096AbiFHDQ5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Jun 2022 23:16:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129492109CB
        for <phone-devel@vger.kernel.org>; Tue,  7 Jun 2022 14:07:03 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j10so30175390lfe.12
        for <phone-devel@vger.kernel.org>; Tue, 07 Jun 2022 14:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BcNEd7iJ+TT2q5S0UI8UJj4frhOqYBHutZKYbj61hks=;
        b=rWCazzT3fqAurfn3Qv3EJgxyuTmQCEMt+a3xQAoXFo7NfpRSkjSEYt9qFESubL0fVw
         s1y2wZPYBZs+N2x/L3smMiBIVpUaCZISBK+R2nEaAyKoQH+rGGPuPMxet8PIgwWtSMLB
         FIbC3lCMPifBu+gPnRLvSl3LFxeKp9rZRd/KJoT47CyRJVFeZUGZhMgGXJWnG7gtCgdp
         VlQutidipJXZK/HvZhITccE5Xbi7PlXcHXFHijy5qgYazvb37648b6S2L1tb2WD6c98+
         /7jhPxcZgnuJskl2yu4g0s7168TULxxebxHd9yx0ZI/o6uWEKvpq6YqRllM1FfkvP2kb
         ENHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BcNEd7iJ+TT2q5S0UI8UJj4frhOqYBHutZKYbj61hks=;
        b=ZQWyGWiPI57np1S6IKcBqwO+vB6HEKMw7LiKrUOTSmLu/jMiyDNwIh+o5pM1YqpmSW
         uBxwA8TCLx/6Ta1JZ4k2VoKgaut7f3GyC7WT0J5WH1wu/NxyExeca7QbTPUw7E6wTFui
         jJ8Cgp7ee+qBUfb8rcWf3iASHIpbENEwIcCggmFluWnPOqOKPlpeT0UO7DiKTlLbUYJL
         hhhBA+9KBeIqqUonlVxf0cbm/0LUdBQ2jAp85ruuu4waKrMCK7/AKh8FwpCjaZM6bBOj
         +yoaJWt8A10yRsyhsz479vLnM+sPDZDOiX3tgu/4oO6NhdAEkTxwBJV4DNf63D7R8h9Y
         qO2Q==
X-Gm-Message-State: AOAM532ZPZ8T3xUNIoWQ+3Vkpg6l9q7/fqPlv2yaIVdwx82z3LbB+6+G
        CepWf3aWYGisX+f4s2bNgXFnKHBizIgvGElc
X-Google-Smtp-Source: ABdhPJwNx0jylg83iqSrKRdyK53xJIDjYR8xpEmSfEqDjAw1+SQN7l8APZexMIl3Sa2+tK5bKuQanw==
X-Received: by 2002:a05:6512:150d:b0:477:b1f6:9ebf with SMTP id bq13-20020a056512150d00b00477b1f69ebfmr19625256lfb.422.1654636021399;
        Tue, 07 Jun 2022 14:07:01 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x15-20020ac25dcf000000b0047255d210dbsm3432818lfq.10.2022.06.07.14.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:07:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add GPS to the Kyle
Date:   Tue,  7 Jun 2022 23:04:55 +0200
Message-Id: <20220607210455.141257-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
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
2.36.1

