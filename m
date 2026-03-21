Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221A392824;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106591; cv=none; b=HICrwNB6tNhalujOp7ZoDFqgts6BqIF8wjHNo4Kh9UrNYOv2a9UjHTmDGhZ+9T0j2AXQ2nPnE1n7OyZOQwVdDRKKHzK1Szw89ktPsouxcx8XwIazqcpSQpvVxxtWwsmyRIyvtTj2eRH35ysjWV2UOnVNcRCkQy5wZXR8WLxxyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106591; c=relaxed/simple;
	bh=X8kk9y3/T6U+5v+rvIXYxkhfQN2QiiYDUZWIvW+9ffE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtUo5JHfEoW4pbwmzfsY7euGAOkYF+jagzP1KkJpV5B6o66A2Yl5Ui7bjRitCAxTkTPx8WlvebsSXo0Hi8LtY7IbW5TaGF8YLFeuU1fuMK63ovwmjcET8VoBtCJKvYlsrjy+fbr+kFHcWu9ZQp9uK8uzcHAf0nDzU4Ud1vrqNbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+E/OI92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+E/OI92"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85109C2BCB3;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774106591;
	bh=X8kk9y3/T6U+5v+rvIXYxkhfQN2QiiYDUZWIvW+9ffE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z+E/OI92je2YtLd+3zJsHXxCaylKDaW9KMpSrJZqxCfQnnWu7P0DBtxp63/gqr91j
	 4FA53LDIskq6pNQSmoFjvlsjfRcjJlyVqRqCS0Mzk5/Nj784bgqChHpklXIDSCwl12
	 U7MVcwq2wCvxEqLsoOzfb2ExjqhcqrBEj0uh1E5HK9jkf57wwZVPLp1Jtnj9zoikod
	 aAThpVv91h8+We5eNOggKLniB/u21K4Vygbdhdm1QXt8I0YpIMXIImURZ3w5hpzNRc
	 DRoRWeBX57PVHG0yi/tnJ17af81cW1r319t2ReYbKsmK+UPKmR5ISa7cs4ey+3XAsI
	 mW4ux9bddya3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AF71094484;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 21 Mar 2026 17:23:25 +0100
Subject: [PATCH v3 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-rimob-new-features-v3-6-d4b8ee867de7@protonmail.com>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
In-Reply-To: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
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
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774110230; l=1551;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=ujtpWdG8p5BFdv+RAOObPc/pCeqZIWvZWLlolCjiSQI=;
 b=WCP9/DME7uCAWOxFEjyczF1OmsDT4gEnTxSHzLEperNg8Vx5xkZbEmNIBIsoyxWPUZPucvIbE
 HhUM8Ts4cwBBLQYyyxbGAQ6SoXWBGAz4hUKW9eAexlPNQ+p5RNolHYb
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Enable the Hall effect sensor (flip cover) for Billion Capture+.
The GPIO is mapped to SW_LID events as in other qcom devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index ddbbbc1eb5b2..d99e73f63a94 100644
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


