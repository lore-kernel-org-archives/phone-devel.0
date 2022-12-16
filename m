Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FE7C3DA6E
	for <phone-devel@archiver.kernel.org>; Fri, 16 Dec 2022 21:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiLPVeN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 16 Dec 2022 16:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiLPVeK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 16 Dec 2022 16:34:10 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F526598E;
        Fri, 16 Dec 2022 13:34:02 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6AADD1F892;
        Fri, 16 Dec 2022 22:33:55 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lux Aliaga <they@mint.lgbt>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6125: Reorder HSUSB PHY clocks to match bindings
Date:   Fri, 16 Dec 2022 22:33:43 +0100
Message-Id: <20221216213343.1140143-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Reorder the clocks and corresponding names to match the QUSB2 phy
schema, fixing the following CHECK_DTBS errors:

    arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: phy@1613000: clock-names:0: 'cfg_ahb' was expected
            From schema: /newdata/aosp-r/kernel/mainline/kernel/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
    arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: phy@1613000: clock-names:1: 'ref' was expected
            From schema: /newdata/aosp-r/kernel/mainline/kernel/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 7e25a4f85594..bf9e8d45ee44 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -442,9 +442,9 @@ hsusb_phy1: phy@1613000 {
 			reg = <0x01613000 0x180>;
 			#phy-cells = <0>;
 
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&gcc GCC_AHB2PHY_USB_CLK>;
-			clock-names = "ref", "cfg_ahb";
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 			status = "disabled";
-- 
2.39.0

