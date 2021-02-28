Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE93C433E9
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 524A564EAF
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhB1NJc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 28 Feb 2021 08:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhB1NJb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:31 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23007C061788
        for <phone-devel@vger.kernel.org>; Sun, 28 Feb 2021 05:08:51 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7158C1F548;
        Sun, 28 Feb 2021 14:08:48 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: msm8996: Add BLSP2_I2C5 and BLSP2_I2C6
Date:   Sun, 28 Feb 2021 14:08:23 +0100
Message-Id: <20210228130831.203765-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the fifth and sixth I2C host on the second BLSP, used for
various board-specific peripherals.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c45350cefdc8..5bc9473551ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2438,6 +2438,35 @@ blsp2_i2c2: i2c@75b6000 {
 			status = "disabled";
 		};
 
+		blsp2_i2c5: i2c@75b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x75b9000 0x1000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_i2c5_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_i2c6: i2c@75ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x75ba000 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				<&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c6_default>;
+			pinctrl-1 = <&blsp2_i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_spi6: spi@75ba000{
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x075ba000 0x600>;
-- 
2.30.1

