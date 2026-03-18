Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34937D13C;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869335; cv=none; b=c/XATZuQuKvlVazFxv13bsgKbWkNDvvzZQanWA92Gja6Mt3FEPf/hPX8iVA/XspjtN7lw6jQf+10n7mrV9ZlsOL1z4+38xqA1/Pm+D+40SGfKkEKTN778pzBYi9sGEW+ewx6upr7RDddHH0TK1FWQCwy+a59LFcl8gJf9ep++ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869335; c=relaxed/simple;
	bh=ektxWRnEpSIGcsZXfXej0R6lvzWhH/vJFJkEF99IZJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2T0BEwpkRlL3GRCOuNer6IDDn8HF1uBMc6jiGYdYS8d9gKRGwI4+SiIQZYrPuihg+UrDaxmcI543mMkwn8Ug46en9J3NN1E6J0puvQ4sF9ILTO0XK4dpayXBma9SomJTVnbgARXqmpAAan5G0iPPGXDAoF/6Stz1MRkMGOfUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmCSUMk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmCSUMk5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0202C2BC9E;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869335;
	bh=ektxWRnEpSIGcsZXfXej0R6lvzWhH/vJFJkEF99IZJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hmCSUMk5yb3npfUTwiFUrDz2R+7YCw/GBru/YmOqvXROC6w7flzHlC+WwY2KkiPnd
	 pYvbUKhqyXFHSb8Zd1Po0YYTDaXnhn3/AIUmcz6NNhCBFzeLwfZgLiexWtMHnnPog3
	 00qVXS/TwXCZAM7dsLIl3QSOzTdnbOTu9fwYHMHVa7Mj2l4Jd0lSpGw5gjL468ijfO
	 vOtDTyWxcKuPYnhsIOpI2EOgSkTC1Yn9gyq87u3xHw4RFg4JeE4i8qzLnJGRRRooln
	 x4INygoAzSG1CCwp6jOJjEOPgJRxZC18AoKyvn/MLne++VzkHvyNGbpP6mZslf8e44
	 J6OT59pjpuDtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DCB107761F;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 18 Mar 2026 23:28:13 +0100
Subject: [PATCH v2 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-rimob-new-features-v2-5-c1bf8917449e@protonmail.com>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
In-Reply-To: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773872973; l=1521;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=QcXNH44ceOuq5vwCAz4kBKVu3WJzySs2Zw2a5nsQCKw=;
 b=ypobSbKtVVIPNDRtWVMFSuhrzjmgFRaW6xfwY77HMHZQcxPWuut5E5hMu+cYY3xzC4WWqHjet
 6Pz/3ElttflBbHM4PGEQN40bKBQQOnBjfg5Q6NU7SBRu9WBDRgH59/J
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

This device uses a Goodix GT5688 touch controller, connected to i2c_3.
Add it to the device tree.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index 63e2c057319d..f641ec9f9486 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -94,6 +94,31 @@ &hsusb_phy {
 	status = "okay";
 };
 
+&i2c_3 {
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt5688";
+		reg = <0x5d>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+
+		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+
+		VDDIO-supply = <&pm8953_l6>;
+		AVDD28-supply = <&pm8953_l10>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
 &ibb {
 	qcom,discharge-resistor-kohms = <32>;
 };
@@ -318,6 +343,13 @@ panel_default: panel-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	tsp_int_rst_default: tsp-int-rst-default-state {
+		pins = "gpio64", "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &usb3 {

-- 
2.53.0


