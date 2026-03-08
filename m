Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55B280325;
	Sun,  8 Mar 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981577; cv=none; b=bor1BPWH/y7fkaeITHkfj88zt+1vPrErTfejGjhILcHc3XM7zBdocPBP/INgT4GOhJ31tpljyi8mPp1URD7YsX85LpM4w604k8C6RDNyCNbwnPHjoAi26C20qGMkB8Y/YHYVd6T8bcjLNDA8EwsEyvvC7tp150YrOmZr6WG0Y10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981577; c=relaxed/simple;
	bh=CakT6g7rPVSpEC0GQgAAW7YsF8XuSXjyWL1CXB3eGfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMYL3NH1b8cNum07CuOfSsqxdCr9wjGnCbjvZFoHOEK/QmIO/5ZF1m1QLPZOEgn0NzNgBx0CDyPP0pAWTBpx1lCW7gH950MEUL6ZqWwIiaAMaY5tqmeMjcU984mFs2wIu8Vn2+y0xk0kDTiStiydrtIDvXK7rIDjKRW8hKyyaM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3ELlh51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3ELlh51"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC34C2BC9E;
	Sun,  8 Mar 2026 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772981577;
	bh=CakT6g7rPVSpEC0GQgAAW7YsF8XuSXjyWL1CXB3eGfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z3ELlh51wJlDN7XPpM1aDAKUXdJayLEv59EdZxqSNuQJs4e1Av4dL5RI0oJER2+Xx
	 WjfD5o62JTguDzKK+gTRQ+W5glMtpGo6PCJgC+DAAhNMSnuOs1HY08rPlfnSy0Uvsq
	 8R9gNekZn1M4ZtRTWX0Om0Eqbt8Tpbgr9yjuIEfFWW7cXUuua7zlndtzmPD47r76SY
	 3Q7xbifulm1o/D2gKFu/Gboy5grmwJxEgDMl3sQz51ohcnpymljuuxqgi4yemWhjzU
	 iw8MFZadynQAQ0Az7BuU77rlRf3Ozi4oxZvXiLY7qWIxF/BNUTn1a1Mq3kejr040YG
	 IZYpRBtMVdOOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC83EA8520;
	Sun,  8 Mar 2026 14:52:57 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sun, 08 Mar 2026 16:52:43 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
In-Reply-To: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772985181; l=2496;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=OucZ1Y4hELJ4A5HRkm799al0dZ0EBqNmgbJMR0NtTgI=;
 b=hLUB2XoeA3Kc3SSzrkqIjnGR7RMQ41xtcRMEVepAfbcUE3jk4iir01xExt6tOBPM8jB/cdXCm
 YEB2o9sE/AiChcRi0aJtnis0si5iSEex/dXUEQn4ZynIjPwgWU+nmS9
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add the description for the display panel found on this phone.
And with this done we can also enable the GPU and set the zap shader
firmware path.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index ef4faf763132..a00cf83dba93 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -78,6 +78,13 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8953/flipkart/rimob/a506_zap.mdt";
+};
 
 &hsusb_phy {
 	vdd-supply = <&pm8953_l3>;
@@ -87,11 +94,69 @@ &hsusb_phy {
 	status = "okay";
 };
 
+&ibb {
+	qcom,discharge-resistor-kohms = <32>;
+};
+
+&lab {
+	qcom,soft-start-us = <800>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	vddio-supply = <&pm8953_l6>;
+
+	pinctrl-0 = <&mdss_default>;
+	pinctrl-1 = <&mdss_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "novatek,nt35532";
+		reg = <0>;
+
+		backlight = <&pmi8950_wled>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vsp-supply = <&lab>;
+		vsn-supply = <&ibb>;
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
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+
+	status = "okay";
+};
+
 &pm8953_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
 };
 
+&pmi8950_wled {
+	qcom,current-limit-microamp = <10000>;
+	qcom,num-strings = <3>;
+	qcom,ovp-millivolt = <29500>;
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
@@ -244,6 +309,21 @@ gpio_key_default: gpio-key-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &usb3 {

-- 
2.52.0


