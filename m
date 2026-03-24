Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239C37B010
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317735; cv=none; b=KWGub7MiV/YVdatg6c3ZJ6r1seUDSd1z5KZYCfrMv2t2QnOBnozWP+QWFWGgS+B7RfJqbZ4ANat/5icHfwv+EhvdG6wqJcdLy8eCRzR59TNoT3Y+OXANS3+vR74PT93YSNcA4iZAWY5ODUv5GN+iqO72Fh2GJbpNocnMdUQgK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317735; c=relaxed/simple;
	bh=HFdRTqvrye5U8yos/wdW5qeoGTAkRp5Eezn/1E7LhWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cC2GHmxFFT+z309mLT89kCW0LJH/Jq5E0GZNjXdQ5mqo2dY5UoR24wJ+EVZ28lgK2Y1PxVG94d8IGy3+RMWPVUPwHiL4YfT+Fl9yhZGop1hgr4L5dBtLNUIwiedGYgU2yP0wESP1FMIM1czimxWyHcWbqIf5X0d/xO+7Z2cbIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgHLGHwP; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgHLGHwP"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfd44fa075so94528185a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317733; x=1774922533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtPTZPYooQW6GNCdrN+Ye4L+nIxiTmejXf1QJjJdEjQ=;
        b=sgHLGHwPCu1dAt1McFEBYvZB2iHj+Mi0SxVA+C6T4otBh13OeUgozlNedtRYfdI1HG
         ZVspuFHZo8WL0epAE1HtjMDpJ1Tef5OvAYvC5FLnOrIpx3r3iiXvWHJg1hLltY+iv8/y
         4WVvLCnEn8Pypsq4IbXi83i1nKt7T5s6s8gYm6QfBALAP65UcBhL5vHh7znmqKZycwM0
         UMor702wY2RUb/VE4IXhpobhre6+OOlcOBY/ovnTO7bHx43cYteQTL0WsX49pLEuN7H3
         sfHSTY99Vef7x+i+UCrYrHXEoUh2JwpMuxDBDNuP2wHzf4Sw2SNJFF3+Aq48rhcQHCvw
         tbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317733; x=1774922533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtPTZPYooQW6GNCdrN+Ye4L+nIxiTmejXf1QJjJdEjQ=;
        b=aTDBj4swGJmfDJxUSZVd60s5i78qnsNpmtHEyZG9py2jBLEL3uYOAd/f8sGs/hQ0PX
         b4+lQeYXCzPnX+7n38cI3zltO3TMrcwt5dT+dUw+lexKVaPlJf2VvXQNM+OQ58LQBUJu
         YQavdtwNXZiEUIKaAuYuIZjP6TQbvJ4w9OhjDi+ZWAvHr2l2Srhh75J4/YTt/lAzJifu
         uA0Iq2wYHeGn9IbHNFMjSsAnFHEKQS3UJUjElGJAMVPU5Uk/v0SaGiRew38Gw+OtMHaX
         Nyel1+6X+5gtSRymoadh1k9py3GXHSLgeM11ofXPWmfMdRU4pMIoBnyAjM1fm3EKc30+
         M9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXKa10Uhqa+VyCDZouD98tKdoXs1sJRA2eifwJofN7ze+dyxq4xREcZVz6KHIpRuIIbbyTxoRso9n8y9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HG/mfgW7IO2XWxLh7UMicpZbaFv8c8NA1exiRzwqzYVHb77U
	zaQbMzcwd4FtEx3dptLrBXE429Jx3OF0TKrhDxyeWsAnl+DSZA1ia9Sv
X-Gm-Gg: ATEYQzyLJ5mgeoNyrgyrJaJT7gTOS5EVHgGRRBPhGUlMQnYY8JQWRtTWE7wDwef6ZxA
	mYVTS5ZP8wcFoiahJjeNjHWm+5H/K6NBOVYAuE30G+gc2AGgLKhK3rhsuLP8wuzswEntqyfjeek
	OyaDkBRf9njAZ8pHgRNx/KqQUdiu+ANpr2mWiMg9crOs0QDFYeTYDF05qDwm5Up0sy5W5/0z6pZ
	EsPOPnqi0WzTV7uQL7bM/WKXXrP8iFL1tgftZhQ/DdhlaNWe+zdR/uqsO1f2GfGH+x3fHfWrafV
	EkevqTi9YwE6Xu1aAi1qTGI9fEpoqns8YNDy9aQIq36YQzrA/yNcZF/zBUG9mabM1gDmT0tkozT
	aqiNGEDGFYBAg+H85FhHCl/GgF4SIFxnYR4cyo4D3aOIaHjsBF139rkrzOqwWOCut49dB8kqCc9
	2cDf1YbrazBfyvCeR4uXnz81DVhA==
X-Received: by 2002:a05:620a:1723:b0:8cf:da2d:d6d0 with SMTP id af79cd13be357-8cfda2dde34mr1302317385a.47.1774317733093;
        Mon, 23 Mar 2026 19:02:13 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85256c47sm102598506d6.19.2026.03.23.19.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:02:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
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
Subject: [PATCH v11 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 23 Mar 2026 22:01:32 -0400
Message-ID: <20260324020132.8683-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..8a2ad7f66b41 100644
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
@@ -392,6 +420,61 @@ vreg_bob: bob {
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
+		/* Set 19.2 MHz for compatibility with Linux driver */
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
@@ -490,6 +573,14 @@ &pm660_charger {
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
@@ -508,6 +599,12 @@ led-0 {
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

