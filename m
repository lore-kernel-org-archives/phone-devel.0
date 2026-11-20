Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165191;
	b=a932ww/n4XpH8BLhhpVTP8ZA/bpZ9AsL2eOnhZy37HJVrrz6of/jcasM+WBj+SCWWb1N
	 VR6UTWevQlAUMyOgiIvE2ML6258eXx6HlE2CJJkypPJCVIqQ0Vuo0WhNhJGcvo6+QzEUB
	 korz3SArnS/VqX8ZcGbkX63wTS2zDOVi8XBcIjwS+c3CjQqUOVVnauGDQFiqXmgwUQVdQ
	 k9WWJA7NzJ2JbXdWGqSmixZ/DmrbZgbK2oxDA0coH7Hty3AjAGimIiAdSfIWgf7uFf59Y
	 wx3bEmHmEWPXChPNBky4vM0R9wRWRNcGJdu3R1dvLCLQZ4kkgkxOBsgXYi9AtNI4t3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165191;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=Gi6v0OUA79o5cNZ2u0/UuOJB+gVDlZLBUUmE3d81k2M=;
	b=HHwSftTjzBWIadIiZlaOLRyszHnO+aeHbkP2/t+v8Iz8AROiuCVUKWZ0mAS2V20BjprA
	 xUYldGbxlo0q0/bMn42rM7EFC0MoMtfh7SU59pj7yHljEe1kDLIDuRFGp6JXDSTB4zJKo
	 8ALhQP+tiRBb8rDYvlx1nfobDumeyOZrzuMOcNKMLlSTEdYzRV+6lAoy+8hG146zhA/7W
	 RAklpdt9duYFYXa9ImdN7bLKpihEQ3evjPGbQNp0SH9c/XP3nueEEdNXmh/jGr5jwO1E/
	 fZbOtSmrakZArTEwgbauPnDpCt5LKYkJN4ky2MsMB6z4kZINaSBYctvWKnd+EgTaXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Rp6uE0wB;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31B60A3809;
	Fri, 20 Nov 2026 08:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B31B60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Rp6uE0wB
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1795165182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gi6v0OUA79o5cNZ2u0/UuOJB+gVDlZLBUUmE3d81k2M=;
	b=Rp6uE0wBMi4DmlCylCNrQkzZKWXB78Ix6qDbSn/KEMqLkokc8P0yc7d05joQmfhvq4yqwh
	ZcssKg1tWGavTSjQaPQn+UdnMSkEUot/5yiLleAKf5iiKP9SOQEabXzLxsqJVDvn648//E
	V2kZP2otDcRG5vdO4xcWkLbgMcQPdS8=
Date: Fri, 20 Nov 2026 09:58:23 +0100
Subject: [PATCH v6 3/3] arm64: dts: qcom: oneplus-kebab: new device
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-kebab_dts-v6-3-b7ec55f3d04f@fhannenheim.net>
References: <20261120-kebab_dts-v6-0-b7ec55f3d04f@fhannenheim.net>
In-Reply-To: <20261120-kebab_dts-v6-0-b7ec55f3d04f@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 Casey Connonly <casey.connolly@linaro.org>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=9N2c1Y2fP3lLFpcZoQ5gfuHs4zOvJQWTjzqa6nNaooE=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDNkM3F/++TtKTd0m1/bYWDI5Pf1x0LxK45uP/x6K+j/n8
 L2gv/WzO0pZGMS4GGTFFFmcp0v+sK8U1tEP/6cIM4eVCWQIAxenAEwk/zgjw3Hpul7DOvdP9VuP
 +2w6vfj2V17255bTAg5GLN494e4j39WMDCeKdL4E2jPs2PvYbb5bW3/O++vHj12furZ238EbDBv
 DzjACAA==
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add initial device-tree for the OnePlus 8T. Downstream reference is [1].

[1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts

Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
Co-developed-by: Casey Connonly <casey.connolly@linaro.org>
Signed-off-by: Casey Connonly <casey.connolly@linaro.org>
Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 arch/arm64/boot/dts/qcom/Makefile                 |   1 +
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 125 ++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..d8292f681e71 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-oneplus-kebab.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-x1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
new file mode 100644
index 000000000000..72ee7b545230
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sm8250-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 8T";
+	compatible = "oneplus,kebab", "qcom,sm8250";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <4500000>;
+	energy-full-design-microwatt-hours = <19575000>;
+	voltage-max-design-microvolt = <4350000>;
+};
+
+&framebuffer {
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 112 IRQ_TYPE_EDGE_RISING>;
+
+		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-0 = <&pm8008_default>;
+		pinctrl-names = "default";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1504000>;
+			};
+
+			ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
+&i2c16 {
+	status = "okay";
+
+	fuel-gauge@55 {
+		compatible = "ti,bq28z610";
+		reg = <0x55>;
+		monitored-battery = <&battery>;
+	};
+};
+
+&tlmm {
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio112";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-n-pins {
+			pins = "gpio93";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};

-- 
2.54.0

