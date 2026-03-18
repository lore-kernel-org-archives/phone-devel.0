Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84337D105;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869335; cv=none; b=g2QFE7eNXMkZreAUeCq5lZwzAeKjQ10pqBtCHSg0ogRd+P7y1SldyNsuS9trewsTuvlOnHpnQDPmDrNC51gU6cszy3++/iyd0c4BbsaocOgpFKP4jWq5JYzCN3ts/eX3vQLdC41hk8cqqiwuA2B0Z1bzbcTKWP2VE0Q4O7Uh7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869335; c=relaxed/simple;
	bh=8inGAOjfCMh8ykkyf2sqyp3wlzfz3pjJ7+fo3uDlQS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddgSg2HjDhGF4ByX2HXBVf7rPOKIeiJ7X3EN4e3bjuSQkVxRgDAKR8thTPmqKcTtIUS48vsSFz0IaXgnNlMLdP6oATWzC9jdhXnmCDnnCg2YCvvH7Khjj8y8eyKaE5X6+rhonz08FqFrrCHvt28K8HbTfxTjZDKQL2VnL3skrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpQzZOVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpQzZOVy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07AFAC2BCB7;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869335;
	bh=8inGAOjfCMh8ykkyf2sqyp3wlzfz3pjJ7+fo3uDlQS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QpQzZOVyUc9N86Wl3xlvBcWb4Mn1HmQqV6zxU/+9JZwDQLhD66I281Qo0N5I0XUVD
	 xD7GhAvL57Ilt3tcx8jPGStv2rsPxi/dSQpNf6FkkrIA9rTp504+J6mgcIx8x07I+/
	 yGsWgwUf8w4r79Q7N8EoQTFOcf2Xy3imCkLfjCnkRJI2ILyN5afpjNKWDuv3Ib0bLk
	 fqVo3O9y2AczvveU7B6mr2Rzgomwhx0JfBFVJltHJr3j/INq4NdbbOIDfSIWmXWkeG
	 IUdvdUO1MDoK6SFrkEiTNNiV5h2GU1HajnOPqQeEYRST1LNQ+pq9h1pPg+oFdSaRyO
	 Pq4ESZE78m3wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C4A1077607;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 18 Mar 2026 23:28:14 +0100
Subject: [PATCH v2 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-rimob-new-features-v2-6-c1bf8917449e@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773872973; l=1490;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=BpEZAxaRMbsFvhAErL6IwwI9A2ip6vYnZ5JNw0nz32s=;
 b=whBdo/7s0zM3mHmWzAdJdGUUI6jcZyDam8GsX/EJe+E24kLpf85/XjK1HI0gANmQvGzI3qNWg
 +pErE36jT2UCVJCTKAFsqlckct7MYDaicolZRIHbvicXSSw+pbmy4Eg
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Enable the Hall effect sensor (flip cover) for Billion Capture+.
The GPIO is mapped to SW_LID events as in other qcom devices.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index f641ec9f9486..113ece32edbc 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -47,9 +47,18 @@ framebuffer@90001000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_key_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_key_default>;
 		pinctrl-names = "default";
 
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
@@ -329,6 +338,13 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <135 4>;
 
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_key_default: gpio-key-default-state {
 		pins = "gpio85";
 		function = "gpio";

-- 
2.53.0


