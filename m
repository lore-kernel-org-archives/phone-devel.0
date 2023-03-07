Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B68C678DB
	for <phone-devel@archiver.kernel.org>; Tue,  7 Mar 2023 18:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbjCGS6c (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Mar 2023 13:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbjCGS6M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Mar 2023 13:58:12 -0500
X-Greylist: delayed 681 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Mar 2023 10:45:31 PST
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F84BB5AA9;
        Tue,  7 Mar 2023 10:45:29 -0800 (PST)
Received: from fedori.lan (51b69c8d.dsl.pool.telekom.hu [::ffff:81.182.156.141])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FEDC.000000006407834F.00098B58; Tue, 07 Mar 2023 19:32:47 +0100
From:   Gergo Koteles <soyer@irl.hu>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: add PN553 NFC
Date:   Tue,  7 Mar 2023 19:32:19 +0100
Message-Id: <20230307183219.1643743-1-soyer@irl.hu>
X-Mailer: git-send-email 2.39.2
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The OnePlus 6/6T both have a NQ330 (PN553 + P73N2M0).
The PN533 supported by the nxp-nci-i2c driver in mainline.
It detects/reads NFC tags using "nfctool".

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 64638ea94db7..4dfc9ade7596 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -380,6 +380,25 @@ zap-shader {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	nfc@28 {
+		compatible = "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_int_active &nfc_enable_active>;
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -753,6 +772,20 @@ &usb_1_hsphy {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	nfc_int_active: nfc-int-active-state {
+		pins = "gpio63";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	nfc_enable_active: nfc-enable-active-state {
+		pins = "gpio12", "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	tri_state_key_default: tri-state-key-default-state {
 		pins = "gpio40", "gpio42", "gpio26";
 		function = "gpio";
-- 
2.39.2

