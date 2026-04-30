Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C5C47AF61
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572571; cv=none; b=QW5CSbVJKY0lc/SfXS10jgeeQxkhR8QPlrQrWmdTvkAq7+DYzLyp4CEdHuoW5M+59UWuE21nrTk2cmK50i48CrurrDZZ9+ZO8vGqphrIar9UnWJFy9+RlpwFuBojVNZM8Iln/Cnd69sndRx+ytwDm8a27KOXhkLTGpPeDA28gYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572571; c=relaxed/simple;
	bh=FYibyuikWa/vTjlZUt6NgzX7WyCdTHvsUo8Q0qEQy9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/5pd7J+b1e6ZNtQkekQ31bTCnYfwJHkUH3BAutYHYcXIYDnI6+plVeDGV+wDZoiALxR2cCymQc28iZFkDlc9SBdBOm5ojKP/fFQxdqgJlTVG3T5HOXt9w0uMLfoCFLzROqory+5AZCkBUEqJ2WJ50vfsBDwNvU+NL65P6JLbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfR0LU44; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfR0LU44"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8eb5ad01402so129100985a.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572569; x=1778177369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AAYRTsNhA2BPULeWDDXA/e2F5vjfAMpdwjSZENwWFU=;
        b=rfR0LU44KcrZ5nPmyQ72Grg52LufMGrgn664EMFo7/rk6ukHBofLmg47G9tQKk83GX
         2YRIj0VWRwOCWQXGeXeiZccvTKfC0TtppvihDMCKDV+a32L+Uk7n3IDHg45BfvSennKV
         U3uwdeqydUYGWQHPdChEq6PbxWSMtBghbMwe3bNQcmsZS95GV1P+xy/E8iOPk6OFYFbv
         2kaUK5Z74ngLafR+jnwy3T+xT8MVhfYBjSukNiP0Pr9/4M3LbpKW0mdBnuhHwwfLAYtG
         v3i1g5jhfz42ax1rCvIAdTpW+Ssp6DPjUpecyhHd8C+5s2hTBzkRcX9cfNfpNl9D+5MW
         0wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572569; x=1778177369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AAYRTsNhA2BPULeWDDXA/e2F5vjfAMpdwjSZENwWFU=;
        b=TBKvOeAFQJ9J/ho8wAd9fTdMd4JSgFgxNFool6HQMjIyndzfXn7Rp3F0t2il0VyBnp
         JRMiAclGh6CJP5+2zTgepdRdReadU+NvTafN68bVfO5/SQTbNnVhzn/xlo+pi+Z0KsZV
         jXu3oM9tCW9TWoaxkV6UuQ26tEuDDKOASxYAC59Kvv8C+05XD/6zk0WLDv/sb8io5gH3
         Pt6u7c5ozMcuFtXxnJXjLz7S1/X2ITmGtROd/UyoKydv3p/t+NHT3+0ZsTtAmiAr17Sk
         7BwU6GFd2Jv7du/JjlnVLcy2bwcOFPS0Q2kob1UcvxGvgwiNdSbgMs1tnH85cXExmYw2
         bQIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Cl0FXhoqsHEDV5q69A6XqjvcA8C82LeQufq/BLJT7a9hKOoUAqKRM/LiIjZDKIW77gW2oRpuapc5Biw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxa4P38D7F+wv1S8ZZYPQZe6rqsUy63XwyIXpX3bJFEmbtZlQw
	WZQY+xr49Wn/OlJEef7Xyw+6oBuH29PP9Khi8ooZVRdjRInXWl7psE3H49kf6w==
X-Gm-Gg: AeBDieuFtCIdu0aL9Ug0c10jURjLmV/NYAzu1IIXjlhS0y2PBWRbjq4Q9adpEaMKq11
	tAYD4p5ZhmvW1RyMAIxoBPc3Y7OVxDtDsXOHlLUeBC/vZqe4l3v1YG8qVCc8w5mYw6H2xQvAxXO
	HI0tzOkyrJE0cO0X3HjOmXtKeqzBWSDf8foKQs6Tk9RPKvABcZ1quy//SUz2nlX1ZChqFtH6Qnx
	09TKNiYhNCfIb5lG45qunWWxUVqRpAa50J5QkNrtMR4oP0O7vOYJmBC9xlNLTPhClfGqcMfpucS
	N0JX4YmcHISea+I6zCzRfam6355//QIVkxOoZnbB9VNLIceCRhx9KL0FuHAGSxqh7HD803nsdhj
	K/0Yo1Q3l73xpF/k0aQmzQ3Zh/wXjqvTTOYlJSBkygRDdSsxUv/kYdfk8fiBDXGS8OHpBLRejyG
	B0HMEg4nd0reevlkpgWBO/WKoFXIUm2tZNnIRb6pmdAkrZiLtZgSWL5R577PrBLb+FGVur6gGUg
	khMOqzH34KxNXd6cDrP2SlzXw==
X-Received: by 2002:a05:620a:bc7:b0:8dc:5094:ea79 with SMTP id af79cd13be357-8fa88847307mr627536485a.39.1777572569110;
        Thu, 30 Apr 2026 11:09:29 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb3d3445asm31956585a.32.2026.04.30.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:28 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 3/3] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Thu, 30 Apr 2026 14:10:01 -0400
Message-ID: <20260430181001.9256-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..eba2f3792dd0 100644
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
@@ -392,6 +420,64 @@ vreg_bob: bob {
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
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
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
+				data-lanes = <1 2 3 4>;
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
@@ -490,6 +576,14 @@ &pm660_charger {
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
@@ -508,6 +602,12 @@ led-0 {
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
2.54.0

