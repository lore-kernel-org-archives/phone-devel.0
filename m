Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E00C3DA7A
	for <phone-devel@archiver.kernel.org>; Thu,  5 Jan 2023 23:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjAEX3w (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 5 Jan 2023 18:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjAEX3v (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 5 Jan 2023 18:29:51 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB056E408
        for <phone-devel@vger.kernel.org>; Thu,  5 Jan 2023 15:29:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bt23so40526220lfb.5
        for <phone-devel@vger.kernel.org>; Thu, 05 Jan 2023 15:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LwkL/jtifDb7a82mA256gxg/hwtdkaw7pirl8MpyHU=;
        b=VLfwIHmbRrDkhhMd4C9JuWxB63dYPLEDk/4QbAuIsSevfaf1IjYR2Mh1JbLQF/LhVo
         Ev8jpy/qM555lGbS5q74m1oJYNbDk9yBvCQgYr/dZqRfFpXYEMID3sFEyI7qzvEPSlXq
         4/AVq5G1Lo8+9IJYKLkIqeDcgqbUEsTRg4pIHl9oK1ceeAA11yUlC2pSIIoD3pXmBe8c
         CKnpXF4Ivqoz3dE6DS9HllWc0+qz4VgITadXaPu3G7gAHuAVCrHlwRPdMBqGjEON0Hx8
         i9yOi30Ek1qV6We1midVyaFiXg7rCF4Lg0Eg0Dl96TyZmw7NG87B72RDsGNGksyKP7Lm
         ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LwkL/jtifDb7a82mA256gxg/hwtdkaw7pirl8MpyHU=;
        b=QcSMJHRYAjefDHa4uPrHwWI+XrAisZWTaOZZvwfDpY6evrjq7DUedFE3CtEIp/hpcR
         FDTVcj6lGGaBLX9uBxerCljQ6gH3e9axfv+m9O6KWG4rAilDg78gsBzKPjXcWqAC86W1
         LDZPQHN/4mBMBt/8zoNPrp66Jvo0H77SD1CyLK5SD5ZwGeH09JlxL2VROgWtlRMd27BW
         KyRb+I5aRsvXrteMUefScRzRVk4PH8nabAeMHvVysacrTl/TVrdlpvSBr0RUOBaoWLHx
         vl2T0EPAh3AQY1+G8EChQLPTEZf8v4l4eG4aGTwYTeybkld4+29kO0sgJNzO3J3NURxx
         XX1g==
X-Gm-Message-State: AFqh2kpB15Wcbwp4A/KJSvHbIZPjr2JLRAS5rXfyzfR8bXSibcB833GW
        AWOTsqo4907AXnC7TYZZFac1Ow==
X-Google-Smtp-Source: AMrXdXt2EXFHIgkBzrt+4QdkK9N+pshHjV6dUhfMRoYTFwsNXvw97wmhBy+Ey4iWdh5OlJyw9PofmA==
X-Received: by 2002:a05:6512:2528:b0:4b6:f22c:7dc9 with SMTP id be40-20020a056512252800b004b6f22c7dc9mr14677418lfb.57.1672961388902;
        Thu, 05 Jan 2023 15:29:48 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id h13-20020a05651211cd00b004a2511b8224sm5553577lfr.103.2023.01.05.15.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 15:29:48 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Add clkout-clock node
Date:   Fri,  6 Jan 2023 00:29:44 +0100
Message-Id: <20230105232944.143534-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds the DTS node and picks up the include file from the
bindings required to obtain externally routed CLKOUT1 and CLKOUT2
clocks.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index 7fdf6ed9b202..13ebe9942d99 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/ste-db8500-clkout.h>
 #include <dt-bindings/reset/stericsson,db8500-prcc-reset.h>
 #include <dt-bindings/mfd/dbx500-prcmu.h>
 #include <dt-bindings/arm/ux500_pm_domains.h>
@@ -327,6 +328,11 @@ rtc_clk: rtc32k-clock {
 			smp_twd_clk: smp-twd-clock {
 				#clock-cells = <0>;
 			};
+
+			clkout_clk: clkout-clock {
+				/* Cell 1 id, cell 2 source, cell 3 div */
+				#clock-cells = <3>;
+			};
 		};
 
 		mtu@a03c6000 {
-- 
2.39.0

