Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0866CC433E0
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D372A64E11
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbhAaBk0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:40:26 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:40671 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhAaBkY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:24 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7C17C1F74D;
        Sun, 31 Jan 2021 02:39:37 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 07/18] arm64: dts: qcom: msm8994-octagon: Add gpio-keys and Hall sensor
Date:   Sun, 31 Jan 2021 02:38:38 +0100
Message-Id: <20210131013853.55810-8-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

This enables tje hardware keys as well as the Hall sensor.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index ff06b2161b10..69016d769d90 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -9,6 +9,9 @@
 
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 /*
  * Delete all generic (msm8994.dtsi) reserved
@@ -42,6 +45,64 @@ chosen {
 		ranges;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		autorepeat;
+
+		volupkey {
+			label = "Volume Up";
+			gpios = <&pm8994_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		camsnapkey {
+			label = "Camera Snapshot";
+			gpios = <&pm8994_gpios 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		camfocuskey {
+			label = "Camera Focus";
+			gpios = <&pm8994_gpios 5 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_front_default &hall_back_default>;
+
+		label = "GPIO Hall Effect Sensor";
+
+		hall-front-sensor {
+			label = "Hall Effect Front Sensor";
+			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+
+		hall-back-sensor {
+			label = "Hall Effect Back Sensor";
+			gpios = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_MACHINE_COVER>;
+			linux,can-disable;
+		};
+	};
+
 	reserved-memory {
 		/*
 		 * This device being a WP platform has a very different
@@ -235,3 +296,19 @@ &blsp2_uart2 {
 &sdhc1 {
 	status = "okay";
 };
+
+&tlmm {
+	hall_front_default: hall-front-default {
+		pins = "gpio42";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hall_back_default: hall-back-default {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.30.0

