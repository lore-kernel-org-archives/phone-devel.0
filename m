Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1451C43381
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC97923AAC
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbhAIQbU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 11:31:20 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:35051 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbhAIQbU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 11:31:20 -0500
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id CB02E3E84E;
        Sat,  9 Jan 2021 17:30:19 +0100 (CET)
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
Subject: [PATCH 1/5] arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
Date:   Sat,  9 Jan 2021 17:29:55 +0100
Message-Id: <20210109163001.146867-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is the usual way of handling pin configuration upstream now, so
align to it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 108 ---------------------
 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 106 +++++++++++++++++++-
 2 files changed, 104 insertions(+), 110 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
deleted file mode 100644
index 7c222cbf19d9..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ /dev/null
@@ -1,108 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
-
-&tlmm {
-	sdc2_clk_on: sdc2_clk_on {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;           /* NO pull */
-			drive-strength = <16>;  /* 16 mA */
-		};
-	};
-
-	sdc2_clk_off: sdc2_clk_off {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;           /* NO pull */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cmd_on: sdc2_cmd_on {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;           /* pull up */
-			drive-strength = <10>;  /* 10 mA */
-		};
-	};
-
-	sdc2_cmd_off: sdc2_cmd_off {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_data_on: sdc2_data_on {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;           /* pull up */
-			drive-strength = <10>;  /* 10 mA */
-		};
-	};
-
-	sdc2_data_off: sdc2_data_off {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cd_on: sdc2_cd_on {
-		mux {
-			pins = "gpio95";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio95";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	sdc2_cd_off: sdc2_cd_off {
-		mux {
-			pins = "gpio95";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio95";
-			bias-pull-up;           /* pull up */
-			drive-strength = <2>;   /* 2 mA */
-		};
-	};
-
-	blsp1_uart3_on: blsp1_uart3_on {
-		tx {
-			pins = "gpio45";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx {
-			pins = "gpio46";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		cts {
-			pins = "gpio47";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rfr {
-			pins = "gpio48";
-			function = "blsp_uart3_a";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index ebdaaf1dfca4..699bd67efcd0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1073,6 +1073,110 @@ tlmm: pinctrl@3400000 {
 			#gpio-cells = <0x2>;
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
+
+			sdc2_clk_on: sdc2_clk_on {
+				config {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+			};
+
+			sdc2_clk_off: sdc2_clk_off {
+				config {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cmd_on: sdc2_cmd_on {
+				config {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_cmd_off: sdc2_cmd_off {
+				config {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_data_on: sdc2_data_on {
+				config {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_data_off: sdc2_data_off {
+				config {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cd_on: sdc2_cd_on {
+				mux {
+					pins = "gpio95";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio95";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_cd_off: sdc2_cd_off {
+				mux {
+					pins = "gpio95";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio95";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			blsp1_uart3_on: blsp1_uart3_on {
+				tx {
+					pins = "gpio45";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx {
+					pins = "gpio46";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cts {
+					pins = "gpio47";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rfr {
+					pins = "gpio48";
+					function = "blsp_uart3_a";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
@@ -2110,5 +2214,3 @@ wifi: wifi@18800000 {
 		};
 	};
 };
-
-#include "msm8998-pins.dtsi"
-- 
2.29.2

