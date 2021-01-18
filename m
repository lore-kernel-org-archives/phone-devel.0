Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DA5C433DB
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62C59206D8
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 16:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406683AbhARQ01 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:26:27 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:46995 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406700AbhARQZ5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:57 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id EF5CF1FC54;
        Mon, 18 Jan 2021 17:24:57 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] arm64: dts: qcom: msm8992-libra: Update regulator config
Date:   Mon, 18 Jan 2021 17:24:23 +0100
Message-Id: <20210118162432.107275-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

* Add PMI8994 RPM regulators
* Add missing PM8994 LVSes
* Add comments concerning "missing" regulators

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    | 53 +++++++++++--------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 4f64ca3ea1ef..5dab8ee0c7d3 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -144,24 +144,16 @@ pm8994-regulators {
 		vdd_l4_27_31-supply = <&pm8994_s3>;
 		vdd_l5_7-supply = <&pm8994_s3>;
 		vdd_l6_12_32-supply = <&pm8994_s5>;
-		vdd_l8_16_30-supply = <&vreg_vph_pwr>;
-		vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
-		vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
+		vdd_l8_16_30-supply = <&vph_pwr>;
+		vdd_l9_10_18_22-supply = <&vph_pwr>;
+		vdd_l13_19_23_24-supply = <&vph_pwr>;
 		vdd_l14_15-supply = <&pm8994_s5>;
-		vdd_l17_29-supply = <&vreg_vph_pwr>;
-		vdd_l20_21-supply = <&vreg_vph_pwr>;
+		vdd_l17_29-supply = <&vph_pwr>;
+		vdd_l20_21-supply = <&vph_pwr>;
 		vdd_l25-supply = <&pm8994_s5>;
 		vdd_lvs1_2 = <&pm8994_s4>;
 
-		pm8994_s1: s1 {
-			/* unused */
-			status = "disabled";
-		};
-
-		pm8994_s2: s2 {
-			/* unused */
-			status = "disabled";
-		};
+		/* S1, S2, S6 and S12 are managed by RPMPD */
 
 		pm8994_s3: s3 {
 			regulator-min-microvolt = <1300000>;
@@ -186,6 +178,8 @@ pm8994_s7: s7 {
 			regulator-max-microvolt = <1000000>;
 		};
 
+		/* S8, S9, S10 and S11 - SPMI-managed VDD_APC */
+
 		pm8994_l1: l1 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
@@ -206,20 +200,14 @@ pm8994_l4: l4 {
 			regulator-max-microvolt = <1225000>;
 		};
 
-		pm8994_l5: l5 {
-			/* unused */
-			status = "disabled";
-		};
+		/* L5 is inaccessible from RPM */
 
 		pm8994_l6: l6 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 
-		pm8994_l7: l7 {
-			/* unused */
-			status = "disabled";
-		};
+		/* L7 is inaccessible from RPM */
 
 		pm8994_l8: l8 {
 			regulator-min-microvolt = <1800000>;
@@ -352,6 +340,27 @@ pm8994_l32: l32 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
+		pm8994_lvs1: lvs1 {};
+		pm8994_lvs2: lvs2 {};
+	};
+
+	pmi8994_regulators: pmi8994-regulators {
+		compatible = "qcom,rpm-pmi8994-regulators";
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		pmi8994_s1: s1 {
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		/* S2 & S3 - VDD_GFX */
+
+		pmi8994_bby: boost-bypass {
+			regulator-min-microvolt = <3150000>;
+			regulator-max-microvolt = <3600000>;
+		};
 	};
 };
 
-- 
2.29.2

