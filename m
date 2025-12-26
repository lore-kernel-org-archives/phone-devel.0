Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE71B4244;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720656; cv=none; b=Xni1FcQSqSJ0Ob+Op7Bk7WwAhqdBVL5chsLVpQvZ8cFtDd5HTtw3+FzdTBMwkD7AtXE3toKTrV0ZEl1cZnHX4Y+WNsXV3+72TVzyc4HRiI9RiDzm1JN0O28Dod2GJbOLSzictJJOvgyBGbkhovyMbPcUBXtI90s/5k8oGYmAS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720656; c=relaxed/simple;
	bh=EKBIi6eKC8bwV3JcDE8QBa6/BCkSbEYrwKPv7YvsO48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zw/DFA59WFuEirvYhhekZDlWfqzvEs284HrIeF4FeaUNgpG6tmlIMM5JAcZLUidymLJDTyiud6F7QJoL0ewTebxywRw4Loi22OnIgc3PuT2ZUM7oJC4g+8Rua0ElQFhZSms+Zsj8kh2JY3EaL88GY/6NOisY0P2yMp7htVsL5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtInuGZW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtInuGZW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2826EC4AF09;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766720656;
	bh=EKBIi6eKC8bwV3JcDE8QBa6/BCkSbEYrwKPv7YvsO48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EtInuGZWSvVK+yJ9Qp8U4xio8i2QkgWTjC05V7VbK77C8g+b9GxdhffzUY2VS1NK7
	 j10aHPyG0f6cbK1GPaZw8oRRovPwa5vGkFABFTzLmR5QAfrYvKN2di2uj8VpCqojmZ
	 ApIT31E6CcqWeWKfgiFhuwB1XZThX0ROQ3pNoDWSE/RmaWX7N0R4Ev0hBRdUom9CoC
	 W+qNaPBR5h4BNrdMynYBCyVOgLBP1OCG0YsWbY609m3Dx4eRlNJhgddeVvrOLO49GQ
	 f1CNCXedUdzLkzBIkrIGk+2PALcC3A4Td8UWd3g0wy4QXHRR6Xg2T2q7ZnWVn7LT0Z
	 5a9sAsBZ+LfRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13690E82CA4;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 19:43:20 -0800
Subject: [PATCH v6 2/2] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251225-ppp_light_accel_mag_vol-down-v6-2-8c79a4e87001@gmail.com>
References: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
In-Reply-To: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766720655; l=2096;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=73whftO4gyGNvsyeXM75XpLd8dUij1OhzKtrJMPtTnE=;
 b=2wmDdvBnsNlr47Cm6jczlYsiauKFzAVVHejv21YcBlNm2iRXcCA1OC1LsVECmlSPwBoBBgJBz
 ZmNcACNWI1KCMR5Kfs6BgJZ+zyVrwfYb4ahT3RKziGqbXEaVRs6uS/i
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses STK3311 according to the schematics.

Tests:
~ $ monitor-sensor --light
    // When the sensor is exposed, it get's fluctating values such as
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.800000 (lux)
    Light changed: 1.700000 (lux)
    Light changed: 1.600000 (lux)
    Light changed: 1.100000 (lux)
    // When covering the sensor, it prints a low value and stops printing
    Light changed: 0.200000 (lux)

~ $ monitor-sensor --proximity
    // When it goes away from an object
    Proximity value changed: 0
    // When it comes near an object
    Proximity value changed: 1

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 1d3baa557c70..e89759613b55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -520,6 +520,16 @@ touchscreen@14 {
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;
 	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3311";
+		reg = <0x48>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&light_int_l>;
+		proximity-near-level = <300>;
+	};
 };
 
 &i2c4 {
@@ -712,6 +722,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	stk3311 {
+		light_int_l: light-int-l {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
+		};
+	};
+
 	wifi {
 		wifi_host_wake_l: wifi-host-wake-l {
 			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.52.0


