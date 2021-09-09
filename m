Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1364C4332F
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA4486113A
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345449AbhIIOSM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Sep 2021 10:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344551AbhIIOSD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Sep 2021 10:18:03 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A76C101BED;
        Thu,  9 Sep 2021 05:37:37 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B81131FA03;
        Thu,  9 Sep 2021 14:37:35 +0200 (CEST)
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
Subject: [PATCH v2 4/7] arm64: dts: qcom: msm8998-xperia: Add support for gpio vibrator
Date:   Thu,  9 Sep 2021 14:37:30 +0200
Message-Id: <20210909123733.367248-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
References: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
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
index cfd61c399b02..798f2d8a8237 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -137,6 +137,13 @@ ramoops@ffc00000 {
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
@@ -245,6 +252,18 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
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
 		compatible = "qcom,pm8941-resin";
-- 
2.32.0

