Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA23242D4
	for <phone-devel@vger.kernel.org>; Sun,  5 Jul 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247633; cv=none; b=jeqIFq3ATAHwux1ZdD+8Iif/U6oSLqb3fXgRZiifuP8Y85cFkuAIsgARmPLGpWNB0MnVA9zKPKJvjXQZaRHjOjbV56gNahOjnO3PPqCWM/A8bl9D7xmRMbstnIy2Cu5rNbtL7nM6vZVt9gC6cgjuhxGKYBz8t1aYVy2ejbiez4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247633; c=relaxed/simple;
	bh=e1ut755+mbtLzALCe8xNdVzrc/Z3HuWV//8fgcMUsbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZzbSOGZglggiQukFAA81nHRMpPjH/PC6eAIs23/ZqK5MVHs319EicgAnlo3HtGH4+iVLyKGpiOJOvPnIcGQWXOOKCUSZYibPpnEv5wIsQ9UMX8fEr1hEhcG6/CvIjk7TNOPZJGRd5u6i+bQJ1k8nJ6gUsUGW9Y0luzMxPmdPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRr+K8iS; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRr+K8iS"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80e4455b9a3so26872827b3.1
        for <phone-devel@vger.kernel.org>; Sun, 05 Jul 2026 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247629; x=1783852429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+psmlO0uNoemIRBkWJQsTzUM85Dqe9ZjvcOhc+/fHY=;
        b=YRr+K8iSP38RFsphxaQUhHp1mi5tPQHRgzHt8ZchCa3ao3a2YCd4JlHAkCzqDxfFg6
         tI8g938urv/I8lEEj/PNNcW/+/yOP3AaCKX8TE+SxydvSQMnUfGSD3GZ2kSezeiKRxHo
         ztPPHEYBiKuyE9DUY97LwgfeA3DXGP3sID6zqTlGNDQyuUTU4U+0yakZH/vGhnLUXbyI
         UgOnzApY3wsrL/JULBah76nFb0u8Gfs9bo9/zdvc8Mg8tYym84jc9jLjlv/GaX6c5jtw
         eu4btKAY/NtNCbpzxfV7Cjy6JqWjQcHbmFzGelrpmPxHa0Td5f75H5edDz1BYvK5ceNe
         konw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247629; x=1783852429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+psmlO0uNoemIRBkWJQsTzUM85Dqe9ZjvcOhc+/fHY=;
        b=Fag6IiOg5/hRcMGdzSuLysyi6POWwmJax4yJVOLXgfLnTXsii9HwCMC0lgajZ/eFNQ
         u8llNuiI7V/L269EySlKVDIUL4BktLQOZt06sgExqCkDM/eQRCD23/rCLXOiomWAohhL
         Q5KJRSgmNOBMtwCOUI1n7cv+92rY/RxTtbwoyzLkdoIq1ZsH2aCo+105CXxqCSxbnPC+
         +x7udtqfkmv/w7Xo0FSCrA2fGge/nN7ZHcociR6egkn4itJLwPl/THHRK9FRTflPD/qj
         WlR2owDEYlKKElJy7Qo+6vmxYA2CSTfXb/N/xEwjmt9TSqB7lgbFJ8/qGoa0vJLSWhjL
         35xA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh1w8gyCv74Zsy8h7cZvBSzEVa0qFoJFi8BZi7eszUyJhlVMsF7m5sRnWvqI5TzsDFymGSDYPaUZeFwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQNzmX+QNdI08mrr7y/O22mh1EHvZQtx0gF25iBIBzf17PokF
	yj2GaPwPIVn53PD0J/MTMs6kZ1Us5UQ9qKI2sk1T2BFiMUy8YmAV4Js3
X-Gm-Gg: AfdE7ckJNL6supBdSHb3FTT4yThTmcG1nQzv6EUqh+RxQiGVCGZtLorZko2I6p++KOZ
	CdDtlXskni2BAzh7EcsbEeHe368mqAsviyajx2HbbnqG5/NMd8HlwkwdXMZKq+6thzqzu3JJaU5
	SQ7tZtWydtGwT7hKWUCJvUfCm/iLWK2oVDQ1TOklIyNSWdT75nLaTVEQJQuXP2cCLzcZmJv/O99
	XtKJeiRxwJQosgBYCZA1Gkzt6sZC1+Q0gTgkubz9OPH175WUkLYi5smTniz79C9/gRdhKDA0DHr
	N5AQ8BwpoWAeHx1//1fJ9EIFTT+2lBIdQr/hto9703/T748acCGeCFxFkv22dZIUGwH2DANJCfj
	oY94fO+8jqReQPG6vJN9vd0bdc8am421/rWWbsQNDxpwEXI1/0PtmZB9TcgU2JLfXOK8tmnmS/+
	PF+zwPDt8u2bYP1vFtGG8zN9q3XMVF
X-Received: by 2002:a05:690c:b15:b0:80c:85c6:8982 with SMTP id 00721157ae682-8173a0ee341mr72481927b3.65.1783247629408;
        Sun, 05 Jul 2026 03:33:49 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:29 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
in 2021. Add initial device tree for SM7125 Samsung platform with
support for:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB

Tested-by: Stefan Hansson <newbyte@postmarketos.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++++++++++++
 4 files changed, 578 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c857bd7991b..abf23bdce7fe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -345,6 +345,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-willow.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-samsung-a52q.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-samsung-a72q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
new file mode 100644
index 000000000000..97c19b6a0277
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung Galaxy A52 (a52q) specific device tree source
+ *
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sm7125-samsung-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A52";
+	compatible = "samsung,a52q", "qcom,sm7125";
+	qcom,board-id = <0x22 0x6>;
+};
+
+&rmtfs_mem {
+	reg = <0x0 0xf4f00000 0x0 0x202000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
new file mode 100644
index 000000000000..71af8cc66fd1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung Galaxy A72 (a72q) specific device tree source
+ *
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sm7125-samsung-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A72";
+	compatible = "samsung,a72q", "qcom,sm7125";
+	qcom,board-id = <0x22 0x5>;
+};
+
+&rmtfs_mem {
+	reg = <0x0 0xf3700000 0x0 0x202000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
new file mode 100644
index 000000000000..512a151fbff9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung common device tree source
+ *
+ * Copyright (c) 2026, The Linux Foundation. All rights reserved.
+ */
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include "sm7125.dtsi"
+#include "pm6150.dtsi"
+#include "pm6150l.dtsi"
+
+/delete-node/ &rmtfs_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &tz_mem;
+
+/ {
+	chassis-type = "handset";
+
+	qcom,msm-id = <QCOM_ID_SM7125 0x0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>, <&hall_sensor_default>;
+		pinctrl-names = "default";
+
+		button-vol-up {
+			label = "Volume Up";
+			gpios = <&pm6150l_gpios 8 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&pm6150_gpios 10 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x7100000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8b000000 {
+			reg = <0x0 0x8b000000 0x0 0x8900000>;
+			no-map;
+		};
+
+		wlan_mem: memory@93900000 {
+			reg = <0x0 0x93900000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_region: memory@93b10000 {
+			reg = <0x0 0x93b10000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@93b15000 {
+			reg = <0x0 0x93b15000 0x0 0x2000>;
+			no-map;
+		};
+
+		adsp_mem: memory@93c00000 {
+			reg = <0x0 0x93c00000 0x0 0x3e00000>;
+			no-map;
+		};
+
+		camera_region: memory@97a00000 {
+			reg = <0x0 0x97a00000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_npu_region: memory@97f00000 {
+			reg = <0x0 0x97f00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@98400000 {
+			reg = <0x0 0x98400000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@98900000 {
+			reg = <0x0 0x98900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
+			no-map;
+		};
+
+		qseecom_region: memory@9e000000 {
+			reg = <0x0 0x9e000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		pstore_mem: ramoops@b4600000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb4600000 0x0 0x100000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x40000>;
+		};
+
+		rmtfs_mem: memory {
+			compatible = "qcom,rmtfs-mem";
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a_1p1: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_s4a_1p0: smps4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <1744000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_l1a_1p2: ldo1 {
+			regulator-min-microvolt = <1178000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_1p0: ldo2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <968000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a_0p9: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_2p7: ldo5 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-min-microvolt = <568000>;
+			regulator-max-microvolt = <648000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_cx_wlan:
+		vreg_l9a_0p8: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_1p8: ldo11 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_1p8: ldo13 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1728000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p1: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_3p0: ldo18 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_2p85: ldo19 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1616000>;
+			regulator-max-microvolt = <1984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_3p0: ldo6 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p95: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&dispcc {
+	/* HACK: disable until a panel driver is ready to retain simplefb */
+	status = "disabled";
+};
+
+&pm6150l_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm6150_gpios {
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio10";
+		function = "normal";
+		output-disable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
+&pm6150_pon {
+	/*
+	 * LinuxLoader fastboot implementation has most of its commands removed
+	 * by Samsung, making it useless. So reboot to Odin download mode instead.
+	 */
+	mode-bootloader = <0x15>;
+};
+
+&pm6150_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm6150_rtc {
+	status = "okay";
+};
+
+&qfprom {
+	vcc-supply = <&vreg_l11a_1p8>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c_2p95>;
+	vqmmc-supply = <&vreg_l6c_3p0>;
+	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <59 4>; /* Fingerprint sensor SPI */
+
+	sdc2_on: sdc2-on-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_off: sdc2-off-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l19a_2p85>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_l12a_1p8>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l11a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l17a_3p1>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};

-- 
2.55.0

