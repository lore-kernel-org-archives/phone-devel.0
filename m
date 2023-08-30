Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFA3C83F1B
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242969AbjH3SsU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242930AbjH3J6y (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:54 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8CACE9
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso7051434a12.2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389528; x=1693994328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SsQzTd0CcGfAzL3R0FFK9QV29mUojsRfNBPae88g8g=;
        b=3ta6vgSsXwkmzI3uHIXBPxgvz+aQDqvKU/wSlAgyCa6Hue0ctHwgySamfODNyhogSz
         C4mM4SXirs5yj/6Opt5MYnZEbNj5PqTMtIIs1v3QWWW6tVhfRsovsrGi7OcbA02O/jWS
         OoJJX7bHw5TRXPubti2XPQP9WNsdF/anBGWHfAOowEENRyZse3hmkOBWxGjfz9qUw5n6
         NoCBzMtMucjvMTBkQY+BLrkk6nP/y67WlHJC0egwyDocoZ2ONe7U3Cx7bDjLRIrJou9i
         74qacRNoRjZTlU1SJ5HVltLe7+jFJQdQC8WlH5+U902bmH1U2SD1/ql5/KZg95cL0EOS
         vy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389528; x=1693994328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SsQzTd0CcGfAzL3R0FFK9QV29mUojsRfNBPae88g8g=;
        b=F88ABnPnLUezfLYVKMFlf5eI08TJqTQmKGRLKubkQDuJz7+6VVVsVEOj083LsBTg+p
         l3vOzNoZbcbn7rLPTNPsTkP92vDjorevSxZWcX+SWgrJFsJmJdy1tkRApsmJicKhKzM5
         kD4unTXGzeVbDfJwtwh8bxDLCnJwflT91NY9A+zVyvgujFYxNWL/ZT/xf94OUgqG1V9g
         GrWrzlD0oxAvWJeBI1lh/9P8cQG79nQh64aQqMDVvwxlVqEkrIbXgj6ZZwEgWPNWIta8
         A0w5E4VraHtwjOH2G9u2Le6euZ1n24NX/Ce9Oy89w6e3SK48bDQY98WHasHns/QOsM94
         t1ww==
X-Gm-Message-State: AOJu0YxduZdWDbuxtA/tomLKRx6om64lcdfZ1PZffXX7s5Lc/HrFb0bd
        gyEJQW7OzdtCjtD5GDb/iqs3c40NVKbjQ9FlrPeRwA==
X-Google-Smtp-Source: AGHT+IHvz39PhmZIwcIdO4tR0KRRtnyNlpxtI0fCwMzAk3lT5hLYxMJ+5ixn1nlE8yBoNrh2IR3eKA==
X-Received: by 2002:a17:906:ef8c:b0:9a1:b85d:c95a with SMTP id ze12-20020a170906ef8c00b009a1b85dc95amr1190547ejb.62.1693389528268;
        Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:47 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:29 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: pm7250b: make SID configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-4-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Like other Qualcomm PMICs the PM7250B can be used on different addresses
on the SPMI bus. Use similar defines like the PMK8350 to make this
possible.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index e8540c36bd99..3514de536baa 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -7,6 +7,15 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/* This PMIC can be configured to be at different SIDs */
+#ifndef PM7250B_SID
+	#define PM7250B_SID 2
+#endif
+
+#ifndef PM7250B_SID1
+	#define PM7250B_SID1 3
+#endif
+
 / {
 	thermal-zones {
 		pm7250b-thermal {
@@ -39,16 +48,16 @@ trip2 {
 };
 
 &spmi_bus {
-	pmic@2 {
+	pmic@PM7250B_SID {
 		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
-		reg = <0x2 SPMI_USID>;
+		reg = <PM7250B_SID SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <PM7250B_SID 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			io-channels = <&pm7250b_adc ADC5_DIE_TEMP>;
 			io-channel-names = "thermal";
 			#thermal-sensor-cells = <0>;
@@ -60,7 +69,7 @@ pm7250b_adc: adc@3100 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
-			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <PM7250B_SID 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
 			channel@0 {
 				reg = <ADC5_REF_GND>;
@@ -141,7 +150,7 @@ channel@99 {
 		pm7250b_adc_tm: adc-tm@3500 {
 			compatible = "qcom,spmi-adc-tm5";
 			reg = <0x3500>;
-			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <PM7250B_SID 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
 			#thermal-sensor-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -159,9 +168,9 @@ pm7250b_gpios: pinctrl@c000 {
 		};
 	};
 
-	pmic@3 {
+	pmic@PM7250B_SID1 {
 		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
-		reg = <0x3 SPMI_USID>;
+		reg = <PM7250B_SID1 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};

-- 
2.42.0

