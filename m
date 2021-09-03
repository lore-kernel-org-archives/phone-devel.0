Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C6DC4332F
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BD13610A1
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350404AbhICSKd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:10:33 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:42969 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350379AbhICSKb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Sep 2021 14:10:31 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 08F051F6AF;
        Fri,  3 Sep 2021 20:09:27 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 5/7] arm64: dts: qcom: msm8998-xperia: Configure display boost regulators
Date:   Fri,  3 Sep 2021 20:09:22 +0200
Message-Id: <20210903180924.1006044-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add configuration for the LAB and IBB regulators (in boost mode):
this platform has smartphones with three different display sizes,
hence different displays requiring different voltage.

The common configuration parameters have been put in the common
device-tree, while specific voltage specs and soft-start-us are
variant specific, so they have been put into the machine specific
dts file.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../msm8998-sony-xperia-yoshino-lilac.dts     | 11 ++++++++
 .../msm8998-sony-xperia-yoshino-maple.dts     | 11 ++++++++
 .../msm8998-sony-xperia-yoshino-poplar.dts    | 11 ++++++++
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 25 +++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
index 550de79e0151..0de919357de4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
@@ -13,6 +13,17 @@ / {
 	compatible = "sony,xperia-lilac", "qcom,msm8998";
 };
 
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+	qcom,soft-start-us = <800>;
+};
+
 &vreg_l22a_2p85 {
 	regulator-min-microvolt = <2800000>;
 	regulator-max-microvolt = <2800000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
index 35a6cdb55aec..87115d648cef 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
@@ -25,6 +25,17 @@ disp_dvdd_vreg: disp-dvdd-vreg {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <5600000>;
+	regulator-max-microvolt = <5600000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5800000>;
+	regulator-max-microvolt = <5800000>;
+	qcom,soft-start-us = <200>;
+};
+
 &pmi8998_gpio {
 	disp_dvdd_en: disp-dvdd-en-active {
 		pins = "gpio10";
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
index 6255004b9a09..9fa3583c951b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
@@ -13,6 +13,17 @@ / {
 	compatible = "sony,xperia-poplar", "qcom,msm8998";
 };
 
+&ibb {
+	regulator-min-microvolt = <5600000>;
+	regulator-max-microvolt = <5600000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5600000>;
+	regulator-max-microvolt = <5600000>;
+	qcom,soft-start-us = <800>;
+};
+
 &vreg_l18a_2p85 {
 	regulator-min-microvolt = <2850000>;
 	regulator-max-microvolt = <2850000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 8c7aba8eadee..80c2cd7ae0eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -207,6 +207,31 @@ &blsp2_uart1 {
 	status = "okay";
 };
 
+&ibb {
+	regulator-min-microamp = <800000>;
+	regulator-max-microamp = <800000>;
+	regulator-enable-ramp-delay = <200>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-ramp-delay = <1>;
+	regulator-settling-time-up-us = <600>;
+	regulator-settling-time-down-us = <1000>;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
+&lab {
+	regulator-min-microamp = <200000>;
+	regulator-max-microamp = <200000>;
+	regulator-enable-ramp-delay = <500>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-ramp-delay = <1>;
+	regulator-settling-time-up-us = <50000>;
+	regulator-settling-time-down-us = <3000>;
+	regulator-soft-start;
+};
+
 &mmcc {
 	status = "ok";
 };
-- 
2.32.0

