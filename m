Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6B3C3DA71
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 10:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiLQKFP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 05:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiLQKFN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 05:05:13 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6641789F
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 02:05:08 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6600D3F246;
        Sat, 17 Dec 2022 11:05:06 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6125-seine: Clean up gpio-keys (volume down)
Date:   Sat, 17 Dec 2022 11:04:54 +0100
Message-Id: <20221217100455.52593-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

- Remove autorepeat (leave key repetition to userspace);
- Remove unneeded status = "okay" (this is the default);
- Allow the interrupt line for this button to be disabled;
- Use a full, descriptive node name;
- Set proper bias on the GPIO via pinctrl;
- Sort properties.

Fixes: 82e1783890b7 ("arm64: dts: qcom: sm6125: Add support for Sony Xperia 10II")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 1b9e40d3d269..8c7c9331fd21 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -41,17 +41,17 @@ extcon_usb: extcon-usb {
 	};
 
 	gpio-keys {
-		status = "okay";
 		compatible = "gpio-keys";
-		autorepeat;
+		pinctrl-0 = <&gpio_keys_state>;
+		pinctrl-names = "default";
 
-		key-vol-dn {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEDOWN>;
-			gpio-key,wakeup;
 			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
 		};
 	};
 
@@ -270,6 +270,16 @@ &sdhc_1 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	gpio_keys_state: gpio-keys-state {
+		key-volume-down-pins {
+			pins = "gpio47";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			input-enable;
+		};
+	};
 };
 
 &usb3 {
-- 
2.39.0

