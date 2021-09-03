Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C30C433EF
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99202610A2
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350393AbhICSKa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:10:30 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:56707 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350370AbhICSK2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Sep 2021 14:10:28 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BA4891F564;
        Fri,  3 Sep 2021 20:09:26 +0200 (CEST)
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
Subject: [PATCH 4/7] arm64: dts: qcom: msm8998-xperia: Add support for gpio vibrator
Date:   Fri,  3 Sep 2021 20:09:21 +0200
Message-Id: <20210903180924.1006044-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

All smartphones in the Sony Yoshino platforms have got a simple
vibrator hooked to a GPIO: add support for that and add its own
pin configuration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 66b009ba72fe..8c7aba8eadee 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -141,6 +141,13 @@ ramoops@ffc00000 {
 			ecc-size = <16>;
 		};
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&pmi8998_gpio 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vib_default>;
+	};
 };
 
 &blsp1_i2c5 {
@@ -251,6 +258,18 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
 	};
 };
 
+&pmi8998_gpio {
+	vib_default: vib-en {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+		drive-push-pull;
+		output-low;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		power-source = <0>;
+	};
+};
+
 &pm8998_pon {
 	resin {
 		compatible = "pm8941-resin";
-- 
2.32.0

