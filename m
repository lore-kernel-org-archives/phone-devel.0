Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A36FC433E6
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12E0E64EBA
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhB1NJa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 28 Feb 2021 08:09:30 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:34269 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhB1NJ2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:28 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 84E6E1F525;
        Sun, 28 Feb 2021 14:08:45 +0100 (CET)
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
Subject: [PATCH 04/11] arm64: dts: qcom: msm8996: Add SDHCI1
Date:   Sun, 28 Feb 2021 14:08:22 +0100
Message-Id: <20210228130831.203765-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add SDHCI1 device to allow for usage of (more often than not) eMMC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 17a7e2a0c730..c45350cefdc8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2308,6 +2308,29 @@ hsusb_phy2: phy@7412000 {
 			status = "disabled";
 		};
 
+		sdhc1: sdhci@7464900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07464900 0x11c>, <0x07464000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clock-names = "iface", "core", "xo";
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&xo_board>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_state_on>;
+			pinctrl-1 = <&sdc1_state_off>;
+
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
 		sdhc2: sdhci@74a4900 {
 			 status = "disabled";
 			 compatible = "qcom,sdhci-msm-v4";
-- 
2.30.1

