Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15673C433E0
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA14364E85
	for <phone-devel@archiver.kernel.org>; Sun, 28 Feb 2021 13:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhB1NKu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 28 Feb 2021 08:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhB1NK1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 28 Feb 2021 08:10:27 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B157C06178B;
        Sun, 28 Feb 2021 05:08:59 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 06C5D1F571;
        Sun, 28 Feb 2021 14:08:56 +0100 (CET)
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
Subject: [PATCH 08/11] arm64: dts: qcom: pm8994: Add RESIN node
Date:   Sun, 28 Feb 2021 14:08:26 +0100
Message-Id: <20210228130831.203765-8-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a RESIN node to support RESIN-connected buttons on some
devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 19 +++++--------------
 arch/arm64/boot/dts/qcom/pm8994.dtsi         |  8 +++++++-
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index e6ef76971c31..d2a5fb0c8df1 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -249,6 +249,11 @@ &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
 
+&pm8994_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &tlmm {
 	gpio-line-names =
 		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
@@ -1030,20 +1035,6 @@ codec {
 	};
 };
 
-&spmi_bus {
-	pmic@0 {
-		pon@800 {
-			resin {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				debounce = <15625>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
-};
-
 &ufsphy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index c3876c82c874..ad19016df047 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -45,7 +45,6 @@ rtc@6000 {
 
 		pm8994_pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
-
 			reg = <0x800>;
 			mode-bootloader = <0x2>;
 			mode-recovery = <0x1>;
@@ -58,6 +57,13 @@ pwrkey {
 				linux,code = <KEY_POWER>;
 			};
 
+			pm8994_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		pm8994_temp: temp-alarm@2400 {
-- 
2.30.1

