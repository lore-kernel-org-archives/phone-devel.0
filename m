Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1CBC7EE31
	for <phone-devel@archiver.kernel.org>; Mon, 29 May 2023 22:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjE2WP6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 29 May 2023 18:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjE2WP5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 29 May 2023 18:15:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BEF106;
        Mon, 29 May 2023 15:15:37 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f505aace48so1175369e87.0;
        Mon, 29 May 2023 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685398536; x=1687990536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8fHtScnljw4UXuGT71iTdy546mGdF0un71thTjFMBs=;
        b=SzaictF88UivYzZk7rdaCd1yg5cBEoRPLffcNBgQKvXbvL1FW4NXuVAh0tog9g8ftT
         h0bLc+ASoFGPLR4L8yJpaEWpdSbhmghWX9JwQ2kNl6m1WIdJOLUXJzimpo6+iEUKGsob
         oLk5+S5HeZwQIGX6CytilufT7FKtExwdEuniX4Z7JOByjAf1UAcphtkDskah+V2WK1ia
         EQv5KNwNw+vCKk4MZGIsNsWQerE9vqv+vZ3PB7xFOQmZhR7ZbicGbMCucbR7eXVWrDVB
         b22AdmOqQqI5T+GD4HnOCqT/XQ8f3c8jYajDaXJONzC4ElqvcaY4rxsZywuvgbD9kW8R
         Mdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685398536; x=1687990536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8fHtScnljw4UXuGT71iTdy546mGdF0un71thTjFMBs=;
        b=ZnJnGcJzYJC2w02CBs8dCTWMev4SxiLHc/mdJQkaZ9E8pM4+HIAZw93cCHZZw8oK7t
         B8UdpEiqsfkU8CfotuxBE996tFun/6sgOdX9nEs/MvO8qidBkM64F353e1kgG1Km+Nl+
         NL4jDHf17Q78IOBVMzWNZ1LHH33cz3HnfgJmdApclBNNU8GJC/dKopJTq+/DJ3rtrSCh
         U+Q8hCVt3X1LFIQ0S7CzbB/5kOILzB92P0ROKnr9xojzVUsmhGEc2wJkkkzl4kvIsgMW
         xixczAKst75VhiLtlOwde/IhQjqzbkQPlTjBczwuszajOUBvQjlg0dpqacxlxDCtTY3s
         k/Vw==
X-Gm-Message-State: AC+VfDz0GyVqSHpX+sxH2xRU6zD/4iRAaSUhHHv8tfDbP5N2niwMMljL
        1USZ9KUB1G2cCM/91GwXh9Mf8345oWFXpQ==
X-Google-Smtp-Source: ACHHUZ7m7GLRlSjEOLjdBR+p2hC4IFJnzGPgsTVEthvAwixE6uONiRgK0YSTRSXb7YurGNFIO/TOFA==
X-Received: by 2002:a05:6512:481:b0:4f3:8c0d:41c2 with SMTP id v1-20020a056512048100b004f38c0d41c2mr16751lfq.54.1685398535856;
        Mon, 29 May 2023 15:15:35 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-56733b-36.dhcp.inet.fi. [86.115.59.36])
        by smtp.gmail.com with ESMTPSA id c20-20020ac24154000000b004eb12850c40sm132993lfi.14.2023.05.29.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 15:15:35 -0700 (PDT)
From:   =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: qcom: pm8226: Add thermal sensor and thermal zone config
Date:   Tue, 30 May 2023 01:14:59 +0300
Message-Id: <20230529221501.43455-2-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529221501.43455-1-matti.lehtimaki@gmail.com>
References: <20230529221501.43455-1-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add thermal sensor, which is using on chip VADC channel to report PMIC
die temperature. Also add the corresponding thermal zone.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 arch/arm/boot/dts/qcom-pm8226.dtsi | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
index 46ba84f86c9f..3b8ad28cecb0 100644
--- a/arch/arm/boot/dts/qcom-pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -4,6 +4,36 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8226-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8226_temp>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				crit {
+					temperature = <145000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8226_0: pm8226@0 {
 		compatible = "qcom,pm8226", "qcom,spmi-pmic";
@@ -55,6 +85,15 @@ smbb: charger@1000 {
 			chg_otg: otg-vbus { };
 		};
 
+		pm8226_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm8226_vadc VADC_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8226_vadc: adc@3100 {
 			compatible = "qcom,spmi-vadc";
 			reg = <0x3100>;
-- 
2.34.1

