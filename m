Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A43F7884
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091577; cv=none; b=HzgL/YKt/9CXc6S3HJ/Th0BUPkdsHYHc/haci3Sa3MmdFG3ZMv3r7B6uU6ukM6QuxIlwwZl1+SDokcmwWR5iQkbuvK1EXxCAvkWpz2wpTXYLKVpF/dyC+pUjqifiR382DDSLiOaI7dHZu0M8gKZcGD/al7RftJVxm4TQatdV1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091577; c=relaxed/simple;
	bh=KsvLmvVNiMncHagBXZqXlz/cXl74wxRq4F0VN5QB644=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3xR8QImcigWmuobe4KWQv1eMG4k4DK6i2x0to1/qMqypLcoE0OANVU10FtYPiowjINT+aeNDuVrAIbPLLOVxH2pRyutZAwc8NjnUf7z0swuSScu3D/iXxV9TWzevOn44ucVQmTb+JVvRI4HKZdwp10IPVpvihVNBih7K5lcX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB/LcSNX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB/LcSNX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fe59255beso3503484f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091574; x=1781696374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXJk2sCEG5oSJVY0V936sPdK0lXWszmX07MVArIqGxw=;
        b=XB/LcSNXvtn2q7Dbhj00Lf3Dt6jaEWgkd1iRf9amLqfXbFcSnAIMq5Hz0JUxpL5Qp+
         ITaaOO1nC/mrsllyzA+QlZluj0+yisQdcy4Exh91OEEwivi8jiXFGbfCFHb7gve2ryrZ
         lttvDDiT3zWOhFzQqSnrivaCL2tS3/hU33CQVG1RMAaXXBwGZ+K8m/4CSNptCFQUbHvU
         lus3Ljd+ntxkmhxCCMH66utJvmxznxJdC7TxA6uHh2YQ6pGIJzaYDO14/ijr9PqkEytg
         1ysvSgY90fbHAbFGfUcy68132Fi58n7R8yG8MJ3FdPwUkd0XxEyCnaxK4c2KLbHW0nZs
         8pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091574; x=1781696374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UXJk2sCEG5oSJVY0V936sPdK0lXWszmX07MVArIqGxw=;
        b=gEOjxfVpS6+2FEX1dt3MM6bZlI/piyBbZTnw3ZFQKHx8ZARWxjOIPr1hTL0uheDojW
         8Ag82XYvvDyAotRX/DBiNVzHisZxTEz63J4K4s9SmVhTGnTNJ0FItpw5kATKypoVs3AR
         PPVTZsf0JaLa7vFIfjj7jAElVtcKX0TVVhsOTOzz9nTIIX3wBar1ERtzNCd4t0+1cIdi
         xDDS7gMtntaCsZ5/d9IG63TjXP7wHpOSXTh3amFWBEQ717/YUveCGqPrUygHptgsQakw
         L/qlqjaBa7o1VHcXvD6fTJiTiz3qMIQN3pMT0i2sTex3QOWMhHTcrNGbVJ6kAmmdbPJS
         9j5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TygUwQ7kxlmbf1SAB1mrcz7Vank6PgBwEQRy4Kh2ekWBPNzhJZUorx3gpvNCdZEkSO0BbFW/yK4aHug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxItF13RXLgtn4NXIeCEEkbpBnbXcJ8WaNP5xGN67B6eItgL5z6
	tVYhzVQrIRbeSqD0Q6SrBd82Mf9Q3/7vTsvyk/Lt4qaqlEPqbKyq3w4U
X-Gm-Gg: Acq92OGjtCb/jLHFtIEqSUG3eiafDeD0engWYbuifZAsEOCnQqSMzPqxmuptfS4syqS
	gjvoTKk3/yasGKjXZJpY/SYpbSeMRHX7tv3qnMH3sN8gltbGuKhYf5hnlsPVrwl0ElTTidPssDY
	xBZAKVxB9iWa5/FjqgJhE1gkgXUnacI17Ex0e9lo02BhxhhoQS5FPcwazW1+5tO9y0tR8zykhRd
	CrOwAdVpD1A3S+APdXLrBvMDrMjfNinHvfTojQuUnj9yxn0VXuFKnkGAVq6twdjBXdOqHtVJOmq
	M8ixmj7Gl7UacDGUYPyY/UU0FZJCS8Tlz975CGRT1tWRyNbJSXTpIBSEotubBn2MhQ+6lLoiNcV
	d7eSLtanqmpkB3VRgEQwVmz5M2HVvfvvSCKebpO9eYRlqHdMfnctCNoQQD7S62rir3rRza7Hs00
	wX/4+KipJRArGt8UqewJ21MbB5WZfeYtHHKXFYIWU=
X-Received: by 2002:adf:f40b:0:b0:45e:f28e:a00d with SMTP id ffacd0b85a97d-460302ec07fmr28217587f8f.16.1781091574087;
        Wed, 10 Jun 2026 04:39:34 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 10 Jun 2026 14:38:58 +0300
Subject: [PATCH v4 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yukon-eagle-v4-2-763d5698bd2c@gmail.com>
References: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
In-Reply-To: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add device tree for Sony Xperia M2 (sony-eagle) smartphone
based on the Qualcomm MSM8926 SoC.

Initial features:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- Vibrator
- USB/Charger

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 407 +++++++++++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 32a44b02d2fa..6b471a346d82 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM) += \
 	msm8226-motorola-falcon.dtb \
+	msm8926-sony-xperia-yukon-eagle.dtb \
 	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-asus-sparrow.dtb \
 	qcom-apq8026-huawei-sturgeon.dtb \
diff --git a/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
new file mode 100644
index 000000000000..b3ef39726b86
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Erikas Bitovtas <xerikasxx@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8926.dtsi"
+#include "pm8226.dtsi"
+
+/delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
+/delete-node/ &smem_region;
+
+/ {
+	model = "Sony Xperia M2";
+	compatible = "sony,eagle", "qcom,msm8926", "qcom,msm8226";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		display0 = &framebuffer0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		stdout-path = "display0";
+
+		framebuffer0: framebuffer@3201000 {
+			compatible = "simple-framebuffer";
+			reg = <0x03201000 0x800000>;
+			width = <540>;
+			height = <960>;
+			stride = <(540 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-camera-focus {
+			label = "Camera Focus";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+
+		button-camera-snapshot {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		button-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		framebuffer@3201000 {
+			reg = <0x03201000 0x800000>;
+			no-map;
+		};
+
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x4d00000>;
+			no-map;
+		};
+
+		reserved@cd00000 {
+			reg = <0x0cd00000 0x200000>;
+			no-map;
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x3a000>;
+			no-map;
+		};
+
+		reserved@d13a000 {
+			reg = <0x0d13a000 0xc6000>;
+			no-map;
+		};
+
+		wcnss_region: wcnss@d200000 {
+			reg = <0x0d200000 0x5ae000>;
+			no-map;
+		};
+
+		reserved@d850000 {
+			reg = <0x0d850000 0x3b0000>;
+			no-map;
+		};
+
+		adsp_region: adsp@dc00000 {
+			reg = <0x0dc00000 0x1400000>;
+			no-map;
+		};
+
+		reserved@f000000 {
+			reg = <0x0f000000 0x500000>;
+			no-map;
+		};
+
+		venus_region: venus@f500000 {
+			reg = <0x0f500000 0x500000>;
+			no-map;
+		};
+
+		smem_region: smem@fa00000 {
+			reg = <0x0fa00000 0x100000>;
+			no-map;
+		};
+
+		reserved@fb00000 {
+			reg = <0x0fb00000 0x280000>;
+			no-map;
+		};
+
+		rmtfs@fd80000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0fd80000 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	accelerometer@f {
+		compatible = "kionix,kxtj21009";
+		reg = <0x0f>;
+
+		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8226_l19>;
+		vddio-supply = <&pm8226_lvs1>;
+
+		mount-matrix = "0",  "1", "0",
+			       "-1", "0", "0",
+			       "0",  "0", "1";
+	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		proximity-near-level = <1700>;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 22 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pm8226_resin {
+	linux,code = <KEY_VOLUMEUP>;
+
+	status = "okay";
+};
+
+&pm8226_vib {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1287500>;
+		};
+
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+
+			regulator-system-load = <200000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2100000>;
+		};
+
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_lvs1: lvs1 {};
+	};
+};
+
+&smbb {
+	qcom,fast-charge-current-limit = <1500000>;
+	qcom,fast-charge-safe-voltage = <4250000>;
+	qcom,minimum-input-voltage = <4200000>;
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+
+	bus-width = <8>;
+	non-removable;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8226_l18>;
+	vqmmc-supply = <&pm8226_l21>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio106", "gpio107", "gpio108";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb {
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};

-- 
2.54.0

