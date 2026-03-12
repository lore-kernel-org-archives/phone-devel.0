Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE57375AC6
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316522; cv=none; b=HCIrsC+pPKj0DrkpjNOD43LQyUnGX7bx/237Om97b+OLgG2S3xGNAZgyORP1P7Ueb3J9izVoCVPLDv3uieuvppkBlS3bf07M38EWpk4voHSsXCxUTzQUNYyR6tB1qFG/6iRxnkJIqiqhjSyksNMNMXNGSjKyHI+ak0NNGb82dcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316522; c=relaxed/simple;
	bh=NMCnP+Vn9CRSuVMeCq9y74f40B8hugn2Hc7oZ++rEeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icCAaHlniUfQIYiCxP0wtf0n80hcMOhdT8bCvqQWG1Bd+rYFiE6Oo5FGsdF3gj9Dd4dWqqumyAYaO5QiGr3p8q13exKNQTJ17LJhSfj7JWsl5WgBqA+PRJ7keX1rDnEM+QuMuLsAu0LcV3JpBtPcul1vKG9byDCYzmxiIQkGYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSQSpCF7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSQSpCF7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c944bb62so727334f8f.3
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316520; x=1773921320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80Lm5IjiUIX059jl1E/bAPpLCGfF21FnmJFKamm0ixc=;
        b=fSQSpCF7d0F4Ry1QQIZoYDoCO/bOMHD++5QQHVwv8eYx/IpXgLrb/0boxp6QQVGANq
         X9Hm5Ub72e/gi1geTutEZWGdccvb/k+kxdpfUEcyjrHHW6OOtXbWI72scX76NmOSLPdN
         Gd2cb0k5f4xxEzngyAyYIq4TukE1Jeh7UEdZZrbL24pTEWUYuSGzbboQFm3//L1Z8ezg
         KfQ/+rWryQqtTaCuiIbWw1tOMPyGP+e3IYoEqWBXuSuTHmN5eRhqYGhZU9eNxwFcffGe
         bepfrmp8bNkEl79iso7GhRysV4opm/cSp+jg2rD3EBevfsLGK7V4Z10NdVJiXxF3ZeSf
         EWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316520; x=1773921320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80Lm5IjiUIX059jl1E/bAPpLCGfF21FnmJFKamm0ixc=;
        b=Ja3VJ+XOTNzlmZxal32xdzarlh6t8fHPAROHgajxRsX4MBNR6LTjj/9j7wKNaoDOTq
         fg6Z42pldwADzGH6K2UtJU9AyI60wl3JXNf6qoyDeepR+mHuhQTTGD2Ign5qaqgF8s67
         GQW58K0MMUmtZ5rQ9I9KzbG/WHEYn0dYvhIjqvY4avKkS0E3JGPsjZwcwLYfc/8hf0mX
         yrJUeCerDYgI/Lls2vsIogwaEuHOgPWyF3wcPLBT3OlDf/9Ug29gmPFXTtH0Ww233PQm
         PTm7y3i43x9QewjXjqlJYAkFTXQJ+TsYEufZuczKpwNu4nTiRvYah7+QgqtLGrezD0gG
         57TA==
X-Forwarded-Encrypted: i=1; AJvYcCX8orbyurDxeZbZ80NbnIpQNZeiWq7P3QnOk2+F+mRrvCByBlWQxL1wWkYcMMSUQvo8O8A9EGBBa/Bw1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Q6qIlh2UGj56++5v/G/FnaWpDBmyZwZ45RZSqc4oRA6TmGbT
	V6yZ+DMH1hdFqD4eYZ7TaSewFR3zab6MnigpkZMDnur0e0d6aMuwt8Qd773lXl9VXYU=
X-Gm-Gg: ATEYQzzyRs7O9cycLdoAXlc1mUE8ciQpomcr1g+EVzAkEIjZoo+Ti47wab3wYG+5pe1
	6VitTzrcJft2IP7GoJhPHlF2KQmXrBBXKPkIplHMbK+vm4Y8G7z3xKK3dCf2AkbzhzSYhe0dTsO
	O1zd/ADoE3H5ySkSpGaTfSyVdOWGi+3kaUPCJbpcYvVz1mYIz8c0JiD8pNqnWXQ8z7SjS0RJlxT
	VULLqOcUjkToRgUuUdcG04nx28ZNeEdmbEAhbu3QZVYgK/HDWf2daY12WqonPK96bARV8XH78oF
	K8Qd3pTwGqOhlcfnfejgsSA7st6Bq7HI9YKaAljvZkpklbR8EpM/o8e7PhMXBuDgR/Yr8AfndMi
	JxEsyeeBovwAavUKGvrquj0blzwci5wU/eMBvruXXKsswZ7BjPp9zZJIe9CgOV6nj66He7LUI6h
	QEOtj0hwGy9hpOlJoRALaX9MlHQtWbx3B63Fxex1XTYpzmF3GhX4LVyqLTp6Ftm+s=
X-Received: by 2002:a05:6000:4029:b0:439:b6c0:ea86 with SMTP id ffacd0b85a97d-439f81b6370mr10386697f8f.1.1773316519830;
        Thu, 12 Mar 2026 04:55:19 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:19 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 13:55:10 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
In-Reply-To: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=3281;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=NMCnP+Vn9CRSuVMeCq9y74f40B8hugn2Hc7oZ++rEeU=;
 b=zYQWzhpTIbcPuQxsdVMDtlcN2tNPR5qKgoIzLDC0rIWjSAqELBfMLtEVOHPJOL/SQ8qRsoKW9
 Smzws947TVODHaZhvs3rlnKeuJQ2+EYh2xyXsAULJ9eu1Q/gv7/D9Q3
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
DSI controller for the M1906F9 panel.

The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..878b7cab479fb173bbc01ffb653e306e52cae54b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,33 @@ key-volume-up {
 		};
 	};
 
+	panel_vddi_1p8: regulator-panel-vddi {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vddi_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		vin-supply = <&vreg_l9a>;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vddi_1p8_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_vci_3p0: regulator-panel-vci {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vci_3p0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vci_3p0_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +155,45 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco-m1906f9";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&mdss_default>;
+		pinctrl-1 = <&mdss_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		vddi-supply = <&panel_vddi_1p8>;
+		vci-supply = <&panel_vci_3p0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -387,6 +453,34 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	panel_vddi_1p8_en: panel-vddi-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_vci_3p0_en: panel-vci-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0

