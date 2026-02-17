Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21556266576
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288106; cv=none; b=YVphZkYewZO9Bl8V5BeLRzNn5b0llxLTkhu11aTwFONuevuC5OVxvRcBB0+jh/4Rdkc3H2VhJxm7g/Lm3w3Q5FE6TpuRaett3p+RWsXS95wWyfXaUPZfFCU3kjxciEM3yKP9JBUojun05DM3zwfC1ahmlloG174/gL8Df5WY/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288106; c=relaxed/simple;
	bh=EcTRKDBc1veGtECuqy6AI3PYeK9xENvrGwMb1X7Kpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIGQ+vBLHGyvoHzBMtAkrDDAIlX1SO25LEVjKzqAT3PhCnCnhdxJXa6sdJlPgHifBWYbk+ixCW+g82oSVQZllvUeePysEggtRVQFL6PrBfee2ylov/r0jVpSI12ECr6+OzLNj0H+8GbOMTKFg1UBhhqWMfoJWATHH7ljDdFxLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtA+1sQ5; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtA+1sQ5"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c7146b0854so389103985a.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288104; x=1771892904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=UtA+1sQ5l4f4RNGmavrlB6y0MohCS8lTN2Wn/IKmV1htTSe/8B1J22dBmyYs1wRH4c
         l3mYHpndvy5Wbo2xx7rRLFvwkikGKoJfZQhCPCtfck6tCYICZ6tn/PgFA06fFBhswRdm
         qdoYet1iRR85Jp+nPJekj3T9MZOzM240oaOpkIhPa2O+fngTmGAPEZ7zoPAeGFKA/BZb
         F7mEuEQq21qsB3GLRjv9NrouMvfA+Axkg1lXUtxbbnoqmTyaqCoqaptexc6PaBtksq/a
         5df7wHzNba0dyg9vM93RHJx5rpxNfOFJi5CIaoGlZqyQYjz8PNACX+4y3IxO9tXAj+pL
         1agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288104; x=1771892904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=i1xYuEKWkQ/6/Lpy193awCuO64dU8WnkMiKhiOlqgHoRUoXJPNWF3mpWxzV3Y6nIL4
         DHs5vk4qLMortSiIElA1oa5MN6P+afbz0KUUmse8tH+xPFJzNqewVQMPqG1pSeeNzXgX
         XDtEsoD+Msed3tNbFZWulccxmJkXh6U0OAiWlxL3mpSIc1eE+7TjsTpbPNRDgZ8CbjH4
         g9uE8YM+GMP5VeTZVf2/9nmQLbbVWd5ipxtZrKFIsGj8s/wZ0ssgSTd2qqF89xUbHO5K
         Icr2P1dwmsYFKsxDD8CQcabIDcQEwEBpOeEMCnsL77QLfKSlSU64YTs9aR6mT0fn810h
         opsg==
X-Forwarded-Encrypted: i=1; AJvYcCU7XfZrl9EgJhTCnR47WbRZu+d6EBahAGqMpussM3I6vIV9Hd8N7572OWIbxoVbsNMZR6ise44f+F4OVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLHR5lNG9unaNncAyaTOfj4f4csuHJBZqHKH7yY5vEru0YwE+
	DdIzGCqqTKbOp+VUzcw+He26HwiUWQfA8dnTsmypwBLsv3cmficb7jIU
X-Gm-Gg: AZuq6aIEyv7FBInUF85sSfW6bHS8MA3Pv+MzH7wITk6kLW7Bnjq7SwFo07PLX2kSFy0
	PGIXfxzhzXpcml2B64/vW+EOF4MjUvLjLoYdfAqX0PvVhG6Ktb4DJdSkl86upAxWS0yenpxhSs+
	eRzMw9hBNBrtMfM5GTFYPr7oEYuZl9OLJOdnFTYLVH1cI42VXbAqb/IuK00CYiv/BP8JDM8obAi
	sXvaevAGUwpPhka/XexoeWZgGfKQ7RX7h0pu5q1j34G1mGrVIqZdDSi1upqHyM9VwqCwWu3iDYE
	jCDLNNHfQNOWFggdwXPBVow+NZREiYx9uLOC9UP/C+y1Ei+dcA1+6t0Cr2v84fL4uOpUI6ox2nC
	YrEHfjnet+LlMvYzWtojQtZb+r/D5hN7Yi/9FHgO4R7kPZz0C5TtTt6WYK9nHsUWH+mm+yueeba
	KuQO9EBjEEqEoE7gKhsxRTFHLUWYi5UvZl/QuFiaUl1Gzg+00czccHZD8o+/vyvRdEUJv7fKfv7
	sW8CIl+l6qVVnVypWk=
X-Received: by 2002:a05:620a:3711:b0:8cb:668f:b7a0 with SMTP id af79cd13be357-8cb668fb89bmr268485885a.82.1771288104126;
        Mon, 16 Feb 2026 16:28:24 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7ef7sm1509044485a.28.2026.02.16.16.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:23 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 16 Feb 2026 19:27:38 -0500
Message-ID: <20260217002738.133534-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
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
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
2.53.0

