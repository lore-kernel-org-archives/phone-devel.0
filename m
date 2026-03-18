Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB13EC2DC
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849935; cv=none; b=hv+ejS0fxylqMeIDe8ygFSDvpJClraE3yWRzpJC3lnBCWvoX21iW5yO9FoUx9qTO4P9eQqNqknZUG64lLXo/kIDuY053H4O6oTYk5HcU/+EathQ9Z06QVxcJaBDcqRyPZEMZWJRXCTnEsFQGBgVp8vKSXkbNp/OmLlVtAOK0VPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849935; c=relaxed/simple;
	bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkUqtHU1Ekd00UMkP43kl4DWJOZ0eU+YQKyv9UuWkH75nkXCi2MHafffZIch4xBC7DOxh/HmX8BeEvaHHHkp7nfRz+QKfqAaofzpOCOJDeMncaTHXT3wVqmcoWVPwmaNP5z8E0hxBgOlGbkGa0ci8Xjd+oJvllXv+FPCh+5xLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3FLk/sE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3FLk/sE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b96760easo36755e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773849924; x=1774454724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=k3FLk/sEOmaqRNMUtH2+PIKQmhbVT0sWG7aq2GW6SV62lcLBNT/NS+STsAhoa8DffV
         M8sw1djUaHXFNqZtW9VQc4KY2hAgtQWss/N56C2tc3qPR1wLZIcvthk1li7ZbiTMn2Fb
         mx1IYZtKKnEivp9e7RDzQXysRdIMmRQVsp/M9aieRHbowKGtjGT/os3uiQMrhWHwQjUv
         zyHyIVWAnq+owi0wmwKPRDQSH5vwJp+VnkbN+b2QsG5Iz2SFsJCbZUdR95+dy3WeB/Sm
         LXg2V+/ZcK44eaVtBB7Lt0RaUJjRCqVWbVvLmXmbHSdX5Rd3WFJyDH76QDRlYjwn3Z4B
         GMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849924; x=1774454724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=W4J1UksxZrI1lrVye+voOD14U15OD/PObyPAiFa3inbskqlOmxQ3qQ3UXtDbcPwbr1
         sf1kwJugWpQw7OzKS68Z0y7XeI4RfGhAFvdtxGc1HN/pW24v/inBhHr19P71O4D3DokQ
         //wzobB4S0ORNaHTeDHc5joQdi4iHi9hJX90ZOjXdiYpEFfeJKg4ddHDqFEoZ+iJLhBO
         K3XpUzD81d/8oE8aOu/YGm9AibcLGO1LytbfVGMKTzRmTRC/t55TOWe6U7ehixdv1cag
         d6IGggN2OFrHkvmWeRcKhhPkU6EBFW4st3F7Cb7yr6StJ1UzIoLP4jGKVK4iVSxok6+5
         wjvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTMOeczxTntVS/Jh35IyykLE78aYRbRGEySrb+AHxWsbw128SOpQIxsOsj9n2625hqt7ltozlcGIZ9Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26hnhThybXLZ67N4/9N1jd0DtaA37V2aGN5INmQtdb3DhiG1J
	8AW8dznRDXe8FCnRkDlZxaietbdKF98zX8FxoHAMwoKBF3jsS8IzGAKf
X-Gm-Gg: ATEYQzySTea8CpBrotmhK+IYhDD2tq0GZJdsnYEUZkStORwLLCGpGoUYqA917aHQlJD
	xGOS9OZ1Ztsh9M59Q4FAU/3uW1Juw+wvGvw9UTKI7i83gI3CDfUz5xYJIbFdCrImDHxAPHQeVV3
	Ux1E+gFx36v3qISlG/Hpse12kehpon70bK0tK3muyGnixq5S6qwwUXT7tJANWWZ5qql7HC8K4EV
	c2Y2tU+i/u9leoQJbKlYnNjABEZHys+K3SI0Wbmfqarkmi2q48sCjgbua5H/5Uhy0ZxJkDzf92W
	Rj4gNTI93ZByLdMy3DGB/QEIwWr44a3+0tEKRvw5PnJOhcvReX/+FdYCvneuA5Ha6YHtfG1gz+p
	vFihNASjwkkCI3IW59MwfJlLjYr3HVYgOpQoYXQQxZwvQ37Dra9ogQUSRikXXmnwJ++CcZxa4Pn
	ygIE4da2OnPrUi2MF+zUzKFB1c8qt7D1GpG43zokvKachm4r4RvVtdEuU9c6Sdo5F76hUKoCCob
	w==
X-Received: by 2002:a05:600c:810c:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-486f4475342mr67413535e9.20.1773849924043;
        Wed, 18 Mar 2026 09:05:24 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8baec5csm2282225e9.15.2026.03.18.09.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:05:23 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Mar 2026 18:04:50 +0200
Subject: [PATCH v6 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-panel-patches-v6-3-7a30c2f85e0b@gmail.com>
References: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
In-Reply-To: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849909; l=3473;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
 b=dYQiTGxFTslamVdeBsQYeDoKHLqMu4p1xhRxqwj/4rfnJtAiX0OJRX0t79Hb2PUQL4cU79ekl
 By44Ksiem0VCJoK3zRu+xTLhwe5Xhvq/eaGTH66U0I7qcn5SE05I/Cz
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

