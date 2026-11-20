Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190015;
	b=O/ucRwDvIsM+xdyYe2BR7MehspplBol7bb/65YCLYjAOPkceGw8zW2xgKne9KBwMRv4b
	 f6Fu6pMUsDnFyq1xnEfOq/SZdkWxgEXPPwlBEbd2xJ61dPJ+7nrv6cueu0x61eJIxsp80
	 B8wFCN6o1XnQwCLLDPA1s5wdxdFjBVkf7JrBnK24yVkoDjCgKGE/tGqGd4c2Y5hXqxCK7
	 bk9cAhxb+GHO+bZUUncpRMq9nPffkjEVV8mxZ2g8/31u3cMRvtrVTDZzBqfaNBoWt+56a
	 rBTfyZ27Dc6Fazhc0CBAP2EkA0Pw0PbXSlBUwgY94PhQfc03Et+oXNS55ux8N7xgU1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qYxgl5Y9dDxShsCytNXwIG7m0pe7QBxnQBmZ31nnMb0=;
	b=eUG1a++Jy52H79e1KmlTbCaWsBX/stvelmfF1FYfqa561d7pHHd+N0CPR+x7GgBEBEYp
	 hV41dIx31vL27/qRJJzJkIH/pui25F1Kl7q/45IcHH3NckaEu7JsWDkzq3mTQ7GO5QDU9
	 QVkIeKmJoWrAcu/eK7ADAGbDxFQYuqFsSgy+boNGhHzhKpZIxu0XvianfQf1svuQtuyVr
	 0tdMAZ5ZAsjpJzPAHnP4x6wvrEr48fUrIU3ru5kExxDJ04iTfUW5sfCj3d7AlNbs+fxdk
	 AAAe+6HbxxSvxjlmUHoc6fazgQ3dLI/lNrihf6rbykMfwkaiMMa0hcBjHnWr48j9fRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrMQxhl5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626960A5BC5;
	Fri, 20 Nov 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrMQxhl5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190015;
	b=cPP4Grr9I6uf5CrvvtZ6oT2/S3DW49P0Ookuwk9Sye4ZOzAQN4/WvPCiYg5L9bXVTrMT
	 6hMxaap/c0Dhzoq0i+EWTGOQ3dz8ICBPHoTRvFOl7F4peyMBHL01rD1yVzsPMYfTWJjAx
	 IYqi85VjWOnBIYfZhtSI2/dxpAMObDDCX53WhKJ5F6LkPfA7/rX77m0UJt2SndJSeqCAY
	 YxgGVCh30QD91G4ZVmlkKo6Bw84/qc/x7N08COwnmdDyooXtK79te86WSzcPCowUKg91E
	 ExmNhOy9A/Za1F9/WmznF04vicqiv4s1uXs6VOMwWyNZue6WHC8b5k8hKbQeoVhvinQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qYxgl5Y9dDxShsCytNXwIG7m0pe7QBxnQBmZ31nnMb0=;
	b=ciBlrVr9spqg6ZazIboX/DY5npoc+Zh5W5OgMsqpGR7oUHr5GZpELVrmMIK/hUgshiKH
	 H8VzwKPwxvSicaVZyRVDUTSSG1JY85SFtWWQPSWfS0cRI4yX4nVGFprJhbLa537EoA6gd
	 qL1PiVy9uQD7JsGTFg8Sgk3JaHfzJRVKGZk/jbrbzb74cjcS1bhnKX1LF+sMszmRK3A0U
	 VC1r99bpmJX6lcK3ZtNv/Gg2XX55pcPPLqmYxP/J/F/vCCOThWhHZhaw4Seq+FSOF27IP
	 iexz7no1nrbEGzpnGec7/qb0SDmcg1IbI8HAIJl0bSGEljlAM/A9W0JKzetKWdqTOCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BC6B1F000D3;
	Fri, 20 Nov 2026 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190015;
	bh=qYxgl5Y9dDxShsCytNXwIG7m0pe7QBxnQBmZ31nnMb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VrMQxhl5hj2WLRF60wIPHkL1m5tGI+bJU1YTVg/WsqmGI3dOZdweoQg6BtBMecG9w
	 yM84QBvBknN8jPdg7hmB2ZqWnAylRCl6rhVnP1AdI3gIBHkoXHtp+pOaOb7eJJ9FX6
	 CIXNFdysPkyXPRdo/VPUCJYHTpOQLk5H2hGOWotN5srK5bkO5ZvQpq0s8jDtgqbaNz
	 aEcKgdKUeyX4vxPf+5mJHNt6q9Pe5P/im/E7tC2ubDm8fg6GAuFd7zEZEYCwziTluL
	 vaEGv8eM/HBzYhEA8vfybJitZoRx32SCmaeSnIg31HXcqs6nKaubPpe/pPoneAiKAe
	 ekFpyYwNvsh0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A70F249952;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:13 +0530
Subject: [PATCH v3 11/11] arm64: dts: qcom: Add Motorola Signature
 (vantage)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-molokai-soc-v3-11-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=19516;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=WgoXFrFeGxl3YfwzfNXbW1r4c78Sql1/xP5sF5sJmOE=;
 b=LN0QNY+csQ5bbhP+PC08J0JMr8+f0/aB4m9xK21ssdS1umkSeA+b3oh+YyAw4HS525ooJZv5Z
 DJtzGEElHNUDH4Ni5a7ggiviGR/RY0LDy28tC8LyXd0H9wPknXMu0e/
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the devicetree for the Motorola Signature (vantage), a phone built
on the Molokai (SM8845) SoC, with:

- UFS storage, the device reset is on GPIO 205
- USB with role switching, and the Type-C connector handled by the
  charger firmware on SoCCP through pmic-glink, which also provides the
  battery and USB power supplies
- the volume and AI keys: volume up is GPIO 6 of the PM8550, the AI key
  TLMM GPIO 124 and volume down the RESIN input of the PMK8550
- the bootloader's splash buffer as a simple-framebuffer

The PMICs on SPMI bus 0 are a PMK8550 (SID 0), a PM8550 (SID 1) and
PM8550VE regulators, as reported in SMEM and described by the vendor
devicetree. They are described here instead of including pmk8850.dtsi
or pmk8550.dtsi: the PMK8550 has 6 GPIOs, not the 8 of the PMK8850, and
pmk8550.dtsi is written for the single SPMI bus of the older SoCs.
The LDOs are PMIC5 LDOs, which have no auto mode: like the vendor
devicetree they start in high power mode and may drop to low power mode.

The memory map follows the firmware the phone ships with. The CoreSight
blocks are disabled: they are not accessible on production devices and
reading their peripheral ID registers is a synchronous external abort.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/molokai-motorola-vantage.dts     | 791 +++++++++++++++++++++
 2 files changed, 792 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9553e3aaeccb..17d4374e2a5d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -79,6 +79,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= molokai-motorola-vantage.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 
 monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts b/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
new file mode 100644
index 000000000000..bafe28178ac0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
@@ -0,0 +1,791 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/spmi/spmi.h>
+#include "molokai.dtsi"
+
+/delete-node/ &adspslpi_mem;
+/delete-node/ &camera_2_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cvp_mem;
+/delete-node/ &dsm_partition_1_mem;
+/delete-node/ &dsm_partition_2_mem;
+/delete-node/ &q6_adsp_dtb_mem;
+/delete-node/ &q6_cdsp_dtb_mem;
+/delete-node/ &soccp_dtb_mem;
+/delete-node/ &soccp_mem;
+/delete-node/ &video_mem;
+
+/ {
+	model = "Motorola Signature";
+	compatible = "motorola,vantage", "qcom,molokai";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@fc800000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfc800000 0x0 0x2b00000>;
+			width = <1264>;
+			height = <2780>;
+			stride = <(1264 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+				 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+				 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+		};
+	};
+
+	clocks {
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>, <&key_ai_default>;
+		pinctrl-names = "default";
+
+		key-ai {
+			label = "AI Key";
+			linux,code = <KEY_ASSISTANT>;
+			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,kaanapali-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
+
+	/* Memory map of the SM8845 firmware shipped with A171WVH.21-16-16 */
+	reserved-memory {
+		gunyah_hyp_mem: gunyah-hyp@80000000 {
+			reg = <0x0 0x80000000 0x0 0xe00000>;
+			no-map;
+		};
+
+		cpucp_mem: cpucp@81200000 {
+			reg = <0x0 0x81200000 0x0 0x100000>;
+			no-map;
+		};
+
+		xbl_dtlog_mem: xbl-dtlog@81a00000 {
+			reg = <0x0 0x81a00000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_image_mem: aop-image@81c00000 {
+			reg = <0x0 0x81c00000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_config_mem: aop-config@81c80000 {
+			reg = <0x0 0x81c80000 0x0 0x20000>;
+			no-map;
+		};
+
+		tme_crash_dump_mem: tme-crash-dump@81ca0000 {
+			reg = <0x0 0x81ca0000 0x0 0x40000>;
+			no-map;
+		};
+
+		tme_log_mem: tme-log@81ce0000 {
+			reg = <0x0 0x81ce0000 0x0 0x4000>;
+			no-map;
+		};
+
+		uefi_log_mem: uefi-log@81ce4000 {
+			reg = <0x0 0x81ce4000 0x0 0x10000>;
+			no-map;
+		};
+
+		cpucp_scandump_mem: cpucp-scandump@82000000 {
+			reg = <0x0 0x82000000 0x0 0x380000>;
+			no-map;
+		};
+
+		adsp_mhi_mem: adsp-mhi@82380000 {
+			reg = <0x0 0x82380000 0x0 0x20000>;
+			no-map;
+		};
+
+		soccp_sdi_mem: soccp-sdi@823a0000 {
+			reg = <0x0 0x823a0000 0x0 0x40000>;
+			no-map;
+		};
+
+		pmic_minidump_mem: pmic-minidump@823e0000 {
+			reg = <0x0 0x823e0000 0x0 0x80000>;
+			no-map;
+		};
+
+		qup_fw_mem: qup-fw@82460000 {
+			reg = <0x0 0x82460000 0x0 0x18000>;
+			no-map;
+		};
+
+		pvm_fw_mem: pvm-fw@824a0000 {
+			reg = <0x0 0x824a0000 0x0 0x100000>;
+			no-map;
+		};
+
+		hyp_mem_database_mem: hyp-mem-database@825a0000 {
+			reg = <0x0 0x825a0000 0x0 0x60000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@82700000 {
+			reg = <0x0 0x82700000 0x0 0x100000>;
+			no-map;
+		};
+
+		qdss_apps_mem: qdss-apps@82800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x82800000 0x0 0x2000000>;
+			reusable;
+		};
+
+		dsm_partition_1_mem: dsm-partition-1@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x5100000>;
+			no-map;
+		};
+
+		camera_mem: camera@9b800000 {
+			reg = <0x0 0x9b800000 0x0 0x800000>;
+			no-map;
+		};
+
+		camera_2_mem: camera-2@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x800000>;
+			no-map;
+		};
+
+		video_mem: video@9c800000 {
+			reg = <0x0 0x9c800000 0x0 0x800000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@9d000000 {
+			reg = <0x0 0x9d000000 0x0 0x700000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@9d700000 {
+			reg = <0x0 0x9d700000 0x0 0x1900000>;
+			no-map;
+		};
+
+		q6_cdsp_dtb_mem: q6-cdsp-dtb@9f000000 {
+			reg = <0x0 0x9f000000 0x0 0x80000>;
+			no-map;
+		};
+
+		dcp_dtb_mem: dcp-dtb@a4080000 {
+			reg = <0x0 0xa4080000 0x0 0x80000>;
+			no-map;
+		};
+
+		dcp_mem: dcp@a4100000 {
+			reg = <0x0 0xa4100000 0x0 0x300000>;
+			no-map;
+		};
+
+		soccp_mem: soccp@a4400000 {
+			reg = <0x0 0xa4400000 0x0 0x600000>;
+			no-map;
+		};
+
+		soccp_dtb_mem: soccp-dtb@a4a00000 {
+			reg = <0x0 0xa4a00000 0x0 0x40000>;
+			no-map;
+		};
+
+		mmi_annotate_mem: mmi-annotate@adfff000 {
+			reg = <0x0 0xadfff000 0x0 0x1000>;
+			no-map;
+		};
+
+		ramoops_mem: ramoops@ae000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xae000000 0x0 0x60000>;
+			console-size = <0x40000>;
+			record-size = <0x20000>;
+			no-map;
+		};
+
+		q6_adsp_dtb_mem: q6-adsp-dtb@b8280000 {
+			reg = <0x0 0xb8280000 0x0 0x80000>;
+			no-map;
+		};
+
+		adspslpi_mem: adspslpi@b8300000 {
+			reg = <0x0 0xb8300000 0x0 0x5e00000>;
+			no-map;
+		};
+
+		xbl_ramdump_mem: xbl-ramdump@d5d00000 {
+			reg = <0x0 0xd5d00000 0x0 0x1c0000>;
+			no-map;
+		};
+
+		hyp_ext_heap_mem: hyp-ext-heap@d63d0000 {
+			reg = <0x0 0xd63d0000 0x0 0x800000>;
+			no-map;
+		};
+
+		global_sync_mem: global-sync@d7a00000 {
+			reg = <0x0 0xd7a00000 0x0 0x200000>;
+			no-map;
+		};
+
+		tz_merged_mem: tz-merged@d8000000 {
+			reg = <0x0 0xd8000000 0x0 0x3a00000>;
+			no-map;
+		};
+
+		oem_vm_mem: oem-vm@f7c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf7c00000 0x0 0x4c00000>;
+			reusable;
+		};
+
+		splash_mem: splash@fc800000 {
+			reg = <0x0 0xfc800000 0x0 0x2b00000>;
+			no-map;
+		};
+
+		llcc_lpi_mem: llcc-lpi@ff800000 {
+			reg = <0x0 0xff800000 0x0 0x600000>;
+			no-map;
+		};
+
+		lcp_dare_mem: lcp-dare@880000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x8 0x80000000 0x0 0x6000000>;
+			reusable;
+		};
+	};
+};
+
+/*
+ * The CoreSight/QDSS debug blocks are not accessible on these production-fused
+ * phones; reading their peripheral ID registers is a synchronous external abort.
+ */
+&{/soc@0/stm@10002000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@10003000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpda@10004000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1000f000} {
+	status = "disabled";
+};
+
+&{/soc@0/funnel@10041000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11000000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpda@11004000} {
+	status = "disabled";
+};
+
+&{/soc@0/funnel@11005000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1102c000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11180000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11183000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11184000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11185000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11186000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpda@11188000} {
+	status = "disabled";
+};
+
+&{/soc@0/funnel@11189000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a3000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a4000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a5000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a6000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a7000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a8000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111a9000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111aa000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111ab000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111ac000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111ad000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111ae000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111af000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111b3000} {
+	status = "disabled";
+};
+
+&{/soc@0/tn@111b8000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@111d0000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11303000} {
+	status = "disabled";
+};
+
+&{/soc@0/funnel@11304000} {
+	status = "disabled";
+};
+
+&{/soc@0/tmc@11305000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpda@11308000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11309000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1130a000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1130b000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1130c000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@1130d000} {
+	status = "disabled";
+};
+
+&{/soc@0/tpdm@11422000} {
+	status = "disabled";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3148000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l2f_1p2: ldo2 {
+			regulator-name = "vreg_l2f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_1p2: ldo3 {
+			regulator-name = "vreg_l3f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_l1i_0p9: ldo1 {
+			regulator-name = "vreg_l1i_0p9";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_0p9: ldo2 {
+			regulator-name = "vreg_l2i_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmic@0 {
+		compatible = "qcom,pmk8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1300>,
+			      <0x800>;
+			reg-names = "hlos",
+				    "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>,
+			      <0x6200>;
+			reg-names = "rtc",
+				    "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmk8550_sdam_2: nvram@7100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x7100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x7100 0x100>;
+
+			reboot_reason: reboot-reason@48 {
+				reg = <0x48 0x1>;
+				bits = <1 7>;
+			};
+		};
+
+		pmk8550_gpios: gpio@b800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmic@1 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550_gpios: gpio@8800 {
+			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			key_vol_up_default: key-vol-up-default-state {
+				pins = "gpio6";
+				function = "normal";
+				power-source = <1>;
+				bias-pull-up;
+				input-enable;
+			};
+		};
+	};
+
+	pmic@7 {
+		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmih0108_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+
+			vdd18-supply = <&vreg_l15b_1p8>;
+			vdd3-supply = <&vreg_l5b_3p1>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 8>, <46 1>, <56 4>, <72 1>, <148 2>;
+
+	key_ai_default: key-ai-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 205 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l3f_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1i_0p9>;
+	vdda-pll-supply = <&vreg_l2f_1p2>;
+
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l2i_0p9>;
+	vdda-pll-supply = <&vreg_l2f_1p2>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l3i_0p8>;
+	vdda12-supply = <&vreg_l2f_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.56.1


