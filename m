Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03DA3EBF23;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946808; cv=none; b=ZmvS9HD80thp/f27c4oAFu+34jHxoqn78z6rN5wMya7MQpDlZZVX0cVbAzwSK4FcqMwnDcyk8DfALi+vY9E9P3yrx6gNzamNYejH28m/rnO0lyESRTsJzCFYp1Mglya+6Emm3hYhXhQKsU3dc/drctzArKdnEQc+D+lDX93vqnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946808; c=relaxed/simple;
	bh=oaYZShcYSsUTL1sFhW4dwU2LORUl0MIO6MwurlQVDR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRuyyMk+cku4gAhbDRgffLBgL8qXTCa3juuKkgDKO+dPc/Q1Q3BY8jBIO2k2wPG2Kf1RBJS1NOAabGqTBO5xOZ5y/IWqCcc8mmEraEnx2EubkT80n91l34n0X9IqTmOoyHsH2f4xbi+IWs3DCDc/70LwNHXk4BY84LSWgL4aAX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWpc8eUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWpc8eUU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BFB3C2BCB5;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946808;
	bh=oaYZShcYSsUTL1sFhW4dwU2LORUl0MIO6MwurlQVDR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rWpc8eUURvUUDqi1tNDZaYiw52jK7DGOudBOA4WAieMkWRRxW5xzSz5WcNbFJEqzG
	 /zU2OZ0IdvC2wkhDwmAzR5kroOhoPpP0S8/JI5PGvJLxYjQORLccXBlXwWHoYxYyca
	 8BhsSDzDTpfzjgHRJ/z46s7t6oBeeLFXNiFP/GByqeXN75Prf+qH5vM0L5FRf6wS3H
	 CGT0eh94WfaBl8fsgQvxsmoijgnWUzJ7LwTAOuJTYohBFSAYClZ8jO4UdvoQAFbU1h
	 s+idpwWRaFcDUPtCeJScZgfx0v6TUFnS6iQ9f2fTZovM+kgodY+X1dKAswTPa3sQ0M
	 JV3FSTY8Qgmfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C431FF60ED;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 31 Mar 2026 11:47:14 +0200
Subject: [PATCH v5 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rimob-new-features-v5-6-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774950461; l=1612;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=cmgghYxm9rnYA/NOEwStAlhNOC2KrHXp4tSkINzV8xY=;
 b=/ScLPd75ulkB7uiMrCF3K+muHvdBcCiCwGyDObDfjqTsfa8HdLMKUFmyulOQUFXJji3CEy99q
 sUxP4RZIu2BDEtExjKtihIchUIpmAb4SxUwq4wQW730rNK0ghcXAO8P
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index 060129c72264..978820348fa5 100644
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
 	panel_default: panel-default-state {
 		pins = "gpio61";
 		function = "gpio";

-- 
2.53.0


