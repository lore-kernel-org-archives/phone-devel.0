Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B91C61DD8
	for <phone-devel@archiver.kernel.org>; Fri, 13 Nov 2020 18:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2F2F208D5
	for <phone-devel@archiver.kernel.org>; Fri, 13 Nov 2020 18:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm4I3E0k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgKMR77 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Nov 2020 12:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgKMR75 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Nov 2020 12:59:57 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E7FC0613D1;
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so15199705lfc.4;
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exASMvYkyEYqC+lh9hPdT4ZQ+jUAX0JeQgUTZEQXM/g=;
        b=Pm4I3E0kKvXIlE3WfhHLyglQIFbAvO17XHC/ip4hGwGpimzQLhFgA0R0SVt8yyPCg2
         Ja+kZ4NFq+O7gJ5gsCCjDFZXeEInmbxVls2A+zTZxILHgs2qqaTIzpZFb0SZUo1lIW7k
         cdEFINRZTT6OLfyj6KY9uRmXwlXbl+Kh1QwqAjyfneD6u3SzuW8WQhw8M5/WkguWGMrF
         hx2lI+3ZxBj2EjRAh1T1S80FJBSOZvXvbq5sX9haxx1TMf55cPKxO8jHvCWjrl64GJZP
         l88EQRi4syB+wbuu3nC/2wSRCj8SWzbt1jotoVhQgNHUHKVIYsr2OhGYCGQRa8Z1bA3a
         cdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exASMvYkyEYqC+lh9hPdT4ZQ+jUAX0JeQgUTZEQXM/g=;
        b=diUmCOpPcgnRDvENxrFqZSjazlC7atokvoSaAYzcYPn9faYlXEOPUHfiexTuTAvPTq
         cBAee//MpsK0zKWqvRYiC4GyVr2nu81v3keVcyzmTkba6GxNc/s137/2nZrbaKP3KyDZ
         HGkjTfXMHtopT8kqigBR81Vj8iBnQweGwCe6wkDDr2P26Ju5Pv8yvR6L1fnAR3H2GIO0
         Z0W9DAQPE7b2n6zEIMtqfFVosK/KKEtTrh6UO7pCd41VdH8ti/BaKgpwuKtC23maMJWh
         6coKll9c/ltndm/es92Gg7Wli/s8hT4F5AkI9pIq+xLBWLw7TdNw4k6hc9HQ8b9Cu0G7
         LHaQ==
X-Gm-Message-State: AOAM530FUX0flXFX3YAL9Ior4KfYb0qgT1kF+aQGzUAHi2Vzx1UnoJcB
        5EBgYI7XgCtb4t6GgzoKtdU=
X-Google-Smtp-Source: ABdhPJx+UwH5vfWTRXeWFQjwn7LuNvb72D62n9WxITTmIxa3PfZimt8VRxWMINXDpKrdbe2JeKhdpQ==
X-Received: by 2002:a19:484f:: with SMTP id v76mr1341718lfa.142.1605290391500;
        Fri, 13 Nov 2020 09:59:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:51 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 2/6] arm64: dts: msm8916-longcheer-l8150: Add touchscreen
Date:   Fri, 13 Nov 2020 22:59:13 +0500
Message-Id: <20201113175917.189123-2-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

L8150 has RMI4 compatible Synaptics touchscreen on
blsp_i2c5. It is powered by fixed regulator. Add
both to the device tree.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index d106bdbfda68..21f2e8e0d05e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -5,6 +5,7 @@
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Longcheer L8150";
@@ -50,6 +51,52 @@ volume-up {
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+
+	reg_ctp: regulator-ctp {
+		compatible = "regulator-fixed";
+		regulator-name = "ctp";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ctp_pwr_en_default>;
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	rmi4@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		vdd-supply = <&reg_ctp>;
+		vio-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int_default>;
+
+		syna,startup-delay-ms = <10>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>; // Allow sleeping
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>; // Touchscreen
+		};
+	};
 };
 
 &blsp1_uart2 {
@@ -201,6 +248,14 @@ l18 {
 };
 
 &msmgpio {
+	ctp_pwr_en_default: ctp-pwr-en-default {
+		pins = "gpio17";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default {
 		pins = "gpio107";
 		function = "gpio";
@@ -209,6 +264,14 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	tp_int_default: tp-int-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	usb_vbus_default: usb-vbus-default {
 		pins = "gpio62";
 		function = "gpio";
-- 
2.25.1

