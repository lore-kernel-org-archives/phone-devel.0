Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D7BC4338F
	for <phone-devel@archiver.kernel.org>; Fri, 23 Jul 2021 20:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F48960F23
	for <phone-devel@archiver.kernel.org>; Fri, 23 Jul 2021 20:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhGWTlm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 23 Jul 2021 15:41:42 -0400
Received: from mout01.posteo.de ([185.67.36.65]:37727 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhGWTll (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Fri, 23 Jul 2021 15:41:41 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 114FD240029
        for <phone-devel@vger.kernel.org>; Fri, 23 Jul 2021 22:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1627071733; bh=4CbUy4rNMD3BYvfyaGS3gTaifeZzNzWCTH5e5SlwvuI=;
        h=From:To:Cc:Subject:Date:From;
        b=VLND2wRF61Wb9+S4/yu3FneWYNUXsuAwRM4+HKITPPH6ceRW4mrAf3a0fFjL2qkJk
         XbqzpJDnAXoLaKSA5/By3P00ui4EOvj0afIvvgmt8pQc4jSyb68aoD1vnRl1P4/Enb
         MnZcauMA8W+WfOlVZ6ANFQJMPfjnlCPfVHtN1bS/T3Foxvt5dsJsAeCjj5uHjFhd1E
         5jZTnNL7yeCPrvZm+LKAZqWydhD7otF6L1OQy12faTWdbHB301oElhzKxY0kEDPTV6
         L6CojVF3ICn5ZNUPEh7h32ifWHtOYpr1RsS8iIce2aeWdrexnECoFvDSM9zQ8XD9wa
         R3vH+/vBjnQYg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GWghz2ZhBz9rxY;
        Fri, 23 Jul 2021 22:22:11 +0200 (CEST)
From:   Julian Weigt <juw@posteo.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Craig Tatlor <ctatlor97@gmail.com>,
        Julian Weigt <juw@posteo.de>
Subject: [PATCH 1/2] ARM: dts: qcom-msm8974: Add blsp2_uart7 for bluetooth on sirius
Date:   Fri, 23 Jul 2021 20:21:00 +0000
Message-Id: <20210723202101.65371-1-juw@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Craig Tatlor <ctatlor97@gmail.com>

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
Signed-off-by: Julian Weigt <juw@posteo.de>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index eb398ddab003..27c22dc235c1 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -715,6 +715,15 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		blsp2_uart7: serial@f995d000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf995d000 0x1000>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_NONE>;
+			clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		blsp2_uart8: serial@f995e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf995e000 0x1000>;
-- 
2.32.0

