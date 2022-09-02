Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1533ECAAD5
	for <phone-devel@archiver.kernel.org>; Fri,  2 Sep 2022 11:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbiIBLLU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 2 Sep 2022 07:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbiIBLLP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 2 Sep 2022 07:11:15 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639CC8D3D5
        for <phone-devel@vger.kernel.org>; Fri,  2 Sep 2022 04:11:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id cu2so3255334ejb.0
        for <phone-devel@vger.kernel.org>; Fri, 02 Sep 2022 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pgosDup0kTlaT74lXGXfgBHrhkiJ9yYENuHZSc/mVk8=;
        b=UXEiCDwktlEbe9re+UzPAG6MLdZSfmqVtt7UKc7uT49N+0SqZ4AzoZ5rwbEOOYcxVv
         RdBHvr6btdgBKYF6tR98Q5kjVVHl96NQGVqC3Wm7yVajTNVBPF5p1rm5c+dDgrUW66cq
         jZqvyCGabdeo5d1l4dVvdrGIUQE4ZU6ZDxCNy8amoXBpoR3ii+obhv4XTdmS806BcCJb
         Uj9yCcoLtTLfoCIW+rMbetJDpqVnpI3no+jWCWVh1sJnI1WvOoMZOY/plMyzoJzIczIC
         Kjt8gGN2/YhPZ9RwvMW+mDeoPeP9Dx36PMq6j9ZA8+tNW2wCfX7EIOvX+4p6XXSoPtw0
         YOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pgosDup0kTlaT74lXGXfgBHrhkiJ9yYENuHZSc/mVk8=;
        b=iVjMVSydzwTG2c4wVwoIRL+KOjXaF8fD+ZHl8LTu/+2ItwApmR5ZKzhEsDBLFYtWhv
         v3z+QQ3IlbA5gqWGIeF5QIFU/8VT2Pu6/ImixvFEbM/9VIkCZEzNSxhxSLg0bKBSaMk0
         W8zkQy6Grc7tuYYGeMKhvvTH+lO2KOWhm8nU4PUhI+nZTihOmlvA6asQNzHWVtjbEuaG
         AjnPKCEX4Yc6MRRdxPJ7mrMSjBL0hW2caBKVLqcggh+d7mLsFeytJA61T06w/rGn/n3A
         ndnpKNTRfrlGfCsr1zj6aHxs/EVK3KO2YsErRyAKE+CYLyyDBOHFtYwKWzpz4MZYtoPh
         KaTg==
X-Gm-Message-State: ACgBeo1gsQ1EkUTNJn5LXb1KMjVeCWyylCPO/pplzQ9P0g1/xHjRrkHA
        otIyG3fTfBGdUbePps4eVlrjmg==
X-Google-Smtp-Source: AA6agR5uv6ZSUD5tOWHQmTksHQW9QBLDMjkC2uPD+MejoEgEQqO1CQKQSv2GOloq0ImI0WeYP0LNYw==
X-Received: by 2002:a17:907:70b:b0:740:ef93:2ffb with SMTP id xb11-20020a170907070b00b00740ef932ffbmr21896909ejb.93.1662117065962;
        Fri, 02 Sep 2022 04:11:05 -0700 (PDT)
Received: from otso.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id h1-20020a50cdc1000000b004483624d550sm1245624edj.71.2022.09.02.04.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 04:11:05 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: Add pm7250b PMIC
Date:   Fri,  2 Sep 2022 13:10:54 +0200
Message-Id: <20220902111055.106814-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220902111055.106814-1-luca.weiss@fairphone.com>
References: <20220902111055.106814-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

PM7250B is a PMIC primarily used for charging and fuel gauge but also
has some of the standard functionality like temp-alarm, adc, etc.

Add the .dtsi with some of the functionality added.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 149 ++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm7250b.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
new file mode 100644
index 000000000000..61f7a6345150
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (C) 2022 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7250b-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm7250b_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@2 {
+		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7250b_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm7250b_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7250b_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			adc-chan@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			adc-chan@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			adc-chan@2 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+
+			adc-chan@7 {
+				reg = <ADC5_USB_IN_I>;
+				qcom,pre-scaling = <1 1>;
+				label = "usb_in_i_uv";
+			};
+
+			adc-chan@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				qcom,pre-scaling = <1 16>;
+				label = "usb_in_v_div_16";
+			};
+
+			adc-chan@9 {
+				reg = <ADC5_CHG_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "chg_temp";
+			};
+
+			adc-chan@e {
+				reg = <ADC5_AMUX_THM2>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				label = "smb1390_therm";
+			};
+
+			adc-chan@1e {
+				reg = <ADC5_MID_CHG_DIV6>;
+				qcom,pre-scaling = <1 6>;
+				label = "chg_mid";
+			};
+
+			adc-chan@83 {
+				reg = <ADC5_VPH_PWR>;
+				qcom,pre-scaling = <1 3>;
+				label = "vph_pwr";
+			};
+
+			adc-chan@84 {
+				reg = <ADC5_VBAT_SNS>;
+				qcom,pre-scaling = <1 3>;
+				label = "vbat_sns";
+			};
+
+			adc-chan@99 {
+				reg = <ADC5_SBUx>;
+				qcom,pre-scaling = <1 3>;
+				label = "chg_sbux";
+			};
+		};
+
+		pm7250b_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	pmic@3 {
+		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.37.3

