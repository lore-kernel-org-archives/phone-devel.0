Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE3322B90
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622814; cv=none; b=XPx0JLQEQrpa5+SqdzzFKGvjiMd31V4pvIqhtfkEs90UkUKFwdaYZUOlTDyyE8p7lc5utQlCBFPCFeTX4UZdWMRhnYJjApLUg5KLH0l7Way3XnylkEPFEqZjbAwpbPQe/aycOhFY7BxGywgImJ/G08o64E7XTzmFhNgCKYl80uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622814; c=relaxed/simple;
	bh=Lhwv6D/imJe/RU+nFcTCBbC6E5wPYje6u7F4ebVJzTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJG4WoU7aoKpNPaw0imDUPh4C95yGT0l4k11zXexn9sOQ/xsNUuY9hHVivcOgvwHmNg51RkbTuDnBqK9AZIi9IGcQUDLrfovf/n/EIPFLllY9GFRvZ0d2fFktKIE3p8CXSkpRFjhgXCjIODagSNB3vyP6i55RY5rl/tpDEdvLXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGSdUHGh; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGSdUHGh"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c52f15c5b3so311767485a.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 20:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622810; x=1769227610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnjtImrdEjhPayN2qIroF2+jnyYbVa8YSS8vBZ23BfA=;
        b=nGSdUHGh7+PMc1mO2BVUTFNv3uMXr31BbEQkdx5pLvbCU9Wgakc939sYKlM26WOCVU
         FqjVKwkGSr2bEu6Ap/EHKzz+fLSeJULZdEMFtgR4g8cAC2Cu7vzrDMkFP6U0deTYHZRb
         6D+kB/OS49xUE0Ry1JhRvBNsqEFKxYDcv45PLbsoLyGLzyH54VnNAehI4nIEo5TB3Gkl
         t4KvlI4ERNiqKZFdOmC2O/YTB876ZCJNe+nmdnNlWM5+x+AXBCjwbGKqR0KhF4s6N0Jz
         ij2ViR1Z5b+gQ2ZTUJl2g3heeMq+gz1xTwuuU/yGhAwERhCHwVIxrYCZcoCApcLZK0O7
         GylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622810; x=1769227610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnjtImrdEjhPayN2qIroF2+jnyYbVa8YSS8vBZ23BfA=;
        b=s2HCqcaZLyxyyC3XkCDPKVwKx/2EGM/x4ojL9ZTmz6jTiHLxAOMRa1rfafFgRxD6P7
         3on319amNnbEPZm9YppaMtBbcqKyI8Anqe5E5B047qcOjo2Mv7QMXIvTU4q+YnUbAavQ
         wQ0Et216SSFew3NFQdHTomWCi9cwmSp9qoBtbGiVKZI2pHl//gD59rBBlTFootuG21yo
         X2eJ0qmfvUYCbrqCWuiOx63qY+JMnN5d2LAKKsYfecjmyRFmrJIil+Kwl9//isFlVKV6
         Qi+BqkkVL9al+pWAfmDOmzylWl0RXluT6kZ3NKHvb0vqQiSYYtuYDZQZIy4sWVwPSV5g
         GRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv75UkL4cg5gqJ+zT2XoR/IyZPuMli+IWKb1+g6hs5bsYrXrTm5TuQR/yMFR+jD3trcF5jAiCNLTdrCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrH8EPyNsv64U4PlBXqQJZlzHpYedlxHw3vy0MlbTU1aDes9C
	OrV9we1cLKsybxp+Kj+1ikLSGT5oVFLhri/T199vlcBuejgp5CuySwj8
X-Gm-Gg: AY/fxX5rPlyhe42J7o1C8pRVW/JKILWpTOYOGMV2/1QMpX9B26TpQFLhzPJGBOgCP5A
	4Qy9xqXoWOiXIuKqi8Y1E5iTN6C6YsMsO+do+oaZOVB/z5aqMxi3jmN1Iy4WYb1ePHjmRrTZfjg
	bOsiBlG4UKr6sbvpKedaExpPKGI6cCGRjyiuSl14aYUoiwFVFgkuBqQvsToyHkijp+x6T2DC5pY
	zBRdbN2H6tTTm3sxEPrlC1pB3PLv1N1lL9tdCc1+DM5yWeA2GEyKJaFYLmfiAf0je13zuPNJGGw
	VukJjWIgN1N0kpwhUTjyJ5e/JDn6D03E7mekpgW3cSaAwRNusoOUPjIij3p2zNB0czxnNudHXbN
	PzXsDYPSMckTk90C4SCSUKyu6MNQBDdCH0/8KOgg2S9zV/ZaXyB/pLlNR/z32eaWlMje87LficQ
	x0k5mhHK4vh4EEtTSoaDgaMsj6B94+z0M4Z4nQOhJjYN+vcNK+xWedC4W5lKhJtExmOLRH2P4zA
	0g=
X-Received: by 2002:a05:620a:1a8b:b0:8c5:2f89:6904 with SMTP id af79cd13be357-8c6a676dd6amr698697885a.45.1768622809943;
        Fri, 16 Jan 2026 20:06:49 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab272sm383499585a.2.2026.01.16.20.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:49 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Fri, 16 Jan 2026 23:06:57 -0500
Message-ID: <20260117040657.27043-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
support for it.

Co-developed-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..e925cba0381f 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 	};
+
+	cam_front_ldo: cam-front-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_ldo";
+		regulator-min-microvolt = <1352000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-enable-ramp-delay = <135>;
+
+		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_ldo_pin>;
+		pinctrl-names = "default";
+	};
+
+	cam_vio_ldo: cam-vio-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_ldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_vio_pin>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,59 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+};
+
+&camss_port1 {
+	camss_endpoint1: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&cam_front_endpoint>;
+	};
+};
+
+&cci {
+	pinctrl-0 = <&cci1_default>;
+	pinctrl-1 = <&cci1_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&cci_i2c1 {
+	camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&cam_front_ldo>;
+		dvdd-supply = <&cam_front_ldo>;
+		dovdd-supply = <&cam_vio_ldo>;
+
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -490,6 +571,14 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <0>;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -508,6 +597,12 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
-- 
2.52.0

