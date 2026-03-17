Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EFC3F6604
	for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773450; cv=none; b=m/Y3l4CQ11yD5ATQIRxg4sBBuK2W7QhNbOlN4F+XpNO/BBdTWCyzI4pWirUDMhSxoDDkz3q1ZbEiWYiecuzaNkte2lEPP8PVGVTZLjW4h19SUx8ua1KWvqRrH8uxMBDdp7Xx42kjBiEkHQ4AzrzdVxof8D+zOmzjgpL8Fn92o+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773450; c=relaxed/simple;
	bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFWI2bOKhHhK1Y+6Xn9Lj7gqBZerwykh+aMM+isq/HC+PCV2tWNio5oyiHeUvKrr9ajOfiLpaOUtC916rTfEn2reNTpdZobhz5NYZABbd7YKWcy19Wjawi0J4/0sukbWeVWt/t7MNKKlTIIAR1PvkPQb4L68HPZuUlpmEOhWvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CApqXcVU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CApqXcVU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so69061655e9.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773446; x=1774378246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=CApqXcVU4YsazvfLaMrshikKzzMueYkHta9Vd78TJN83AqJ1RKzf3yJzazVWkWeA4Q
         PLYwgrgc0FhruQawr9C7RgvTh5fazW/JNDwr6/DhzFrn/W0uI2y85wCmoRy/lqVUnWKC
         fPHvZU9PUvnLbD3CkzRlZEdrzRIWW8PZz1PUS+70b2pz4+7k/g7hLQVTKL6XrtaMgzRV
         RtLzMtcmai0TzzuCp7zPhNzRmqlcXsnL4yvgXJD7u0xbEtXtU0pWnHgpXNCBT9+Fhg6c
         YoAhsOmho5FX2u1QykSeH7hpUkrzkcz85jR0gEwCAfjdbej8Ja+jXei8QvWOFZ0NM+Wr
         chvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773446; x=1774378246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=Itq6R6JEushuGsIxl5hTPPhcFnOVpWdL3a+DJY6aotz85KzYRbPL3cJJWW5Q46j/ce
         foXo56wp3dpFl95AebCX8ARjP11v8deFeeAy/mxSMjabO9VVRJedLucoeTG2Go51Vpst
         b7jWk1BZyCY+gIzjeRfChkgnLVbXaMViO5694VuUr67cJxElhDXZXfb4dS+64xjVD42X
         Qk2db/W6T9rFp3L1vzoFdAzZeu+yAIrfzYsHsiGit3q+6Yh7yF+8WC8jqjpehwTF9Jl2
         RpTHKqDM5xn41hTmZ1HXk2UyBIbBqlwJHt5h5PcmQZyNnr6IiEpSQV5SW0BcBx3u9wJv
         OdBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/feo6kBhDbcyZD83zViBMEdQesmftAGIV6zJXPUtS5dVapWVuam7c/DwyDplymS36xfzoqG0xvhC/cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGtbmFtDT5AALuiv+cSUTJJsn4UjMR39YET85EvLqRqBmCf4y3
	TnicJXMnzb1fmURVP9rLV6ZpGWEOsJPxkZ1bpgkpU3mJLLPFzcVNPSr8
X-Gm-Gg: ATEYQzwhhxa+RDiZDOFXH/nJ4HgjyJUqLOE1Awu3y+GFbcZ7Jk6fVqfuUZ3IPp9ASOl
	U0JRZQFvF7aelr4oHb2LgUzbTFSDli/kuVfM72W88i1ALWD5xMN9Q3OfxK9x+HcTtiy+FuRZmki
	n68/mPOkoSkWzdZ/k6gupvUSXczrdMqTsKskXMawJyrKUOp3ZYppA5L4q+Z+546tRxzksjk8P8B
	+Xnp7m0O3tlDm5VuXJQ2HsYLQ9R88GKYK28vf+bGRHvWR6D2uqEUrppmIBQL4/3qLowEQoF1AhO
	TI8RNagUPimpJ6wk7jd0kXJhiQsi7QRJU0P/YlbaZbowL2x5qy+hCtiNJIaj8pZI2DJ/KFlmZSr
	sdgooyhmp/4/sWKtKG4yKwcmQGcLXDofbIQZi9NtvPY2XTyPE8SBrN6LoBSgG1AKu2Pl028+V9N
	pvrwMH0ci1W35ByKzkJZXA5++btG+HspgV2mpnpkEk14xU70F2ygZ9PGPnsCamjzOjV2lU0Y1Oi
	A==
X-Received: by 2002:a05:600c:3551:b0:485:3c14:885b with SMTP id 5b1f17b1804b1-486f4476e2cmr10827785e9.28.1773773446274;
        Tue, 17 Mar 2026 11:50:46 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm152863595e9.3.2026.03.17.11.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:50:45 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Mar 2026 20:50:31 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-panel-patches-v5-3-ef99f7b280da@gmail.com>
References: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
In-Reply-To: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773773435; l=3473;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
 b=is/9H1uiIy/C4DtVU6X+cCIT0JuOVFC6SfqAqDeqZyS6xlZdifsCtoPxuuLOc27OyWE30vvIS
 dtEqLToBftAD/piEFdAnoqT7oYt8CS32zIzvUNdbL/gdzlShOh64Zrr
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FC0
DSI controller for the M1906F9 panel.

The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

mdss_dsi0_phy is powered by VDD_MX, see power-domains in sm6125.dtsi

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..6eb46967712554929ab68af6f3218396b7f0118e 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,33 @@ key-volume-up {
 		};
 	};
 
+	panel_vdd_1p8: regulator-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vdd_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		vin-supply = <&vreg_l9a>;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vdd_1p8_en>;
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
+		compatible = "samsung,s6e8fc0-m1906f9";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&mdss_default>;
+		pinctrl-1 = <&mdss_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		vdd-supply = <&panel_vdd_1p8>;
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
+	panel_vdd_1p8_en: panel-vdd-default-state {
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

