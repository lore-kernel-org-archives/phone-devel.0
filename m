Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9031274FE3;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042421; cv=none; b=Jf6cDLY5ckJJ17lcFlZ6PJqdqA8gv5jAi45mNnibAwMrmZnbCeL45m2F+A8YOLb2XaMek3cgYH1ZHU/3guWwJyC13O1pbSVa5BnFfdvOFd4ff54bMhL6ZLJQtLLHU00pcNMj6NMQu6CCcL4eyekg1E8L+p1uZYNu/GoKUptkapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042421; c=relaxed/simple;
	bh=4J3g5j51PBpP7n9+7mbzEOrB/xPKifWDPpyCNDHAijs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GU0iuiLBJL8ODV4Z4rVAsF6Gz0dfKrmnRb5sOLl9ISS9IyvsaSTw3OdYySjqFLcrV9SY51DgdSaaFCtzHkQvCffsJL0eHwn0V6OiY3ghm5eC2V7MBtUX8uMyM4YzuB7R8skR+Gmz89Dz0ju5DJ1Z6wJdFiSYIUkv16e/3mlZBtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgz7ubki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgz7ubki"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B8DDC116C6;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=4J3g5j51PBpP7n9+7mbzEOrB/xPKifWDPpyCNDHAijs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cgz7ubkiHQB+YPvJjBzXk4y4/EV4gcWAmbVLc9+A7mGlbLiAsHv00zS3SGuF2N9aF
	 VyqXCQ6D7dw8cIQZaSQ4sG7u0t/E2pWBSYUP+Z8h/+drd8hCqLZ3+45dRJXZLSiuFh
	 39gpW9CIX1/DW3yOiLAg4Dq8t93re1FqQqsdJ5XPGRSxLxnmqestJ4CyQt/DmxiEYg
	 IOkTImNfBARJIkn887xFp6rMYtXOabmoRctYC5YcEEIw4BKmhOuAFLTNJF1KSQ51vh
	 gG6qbhc6zS9xJf/GEr5dcms/AuZFvYUOk7foWfB2Z4IJKAJabJKIocxwHDmV9Z9kUq
	 JdlA1ROCY5/Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A2CFD315;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 19:47:00 -0800
Subject: [PATCH v5 1/4] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=2100;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=P3jxHkWmNKoMTa/ZH2mI0b285/Gcq9KBGUYb5ASdyDI=;
 b=ePPb+2twvyymvlXtx7y6tuGBD2TrnI06XJtJAi3RUVXg/E81weVnx5FMV9z0bHTAH20GUuxG9
 lLv17Ls0n5dAqqvlqB7pJBDa+PTWHU6QL7vHzdUvjEfz7SL7brgj+V+
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
index 6f97e57f36f5..2d2858ee149e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -520,6 +520,16 @@ touchscreen@14 {
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1440>;
 	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3311";
+		proximity-near-level = <300>;
+		reg = <0x48>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&light_int_l>;
+	};
 };
 
 &i2c4 {
@@ -689,6 +699,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	stk3311 {
+		light_int_l: light-int-l {
+			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.52.0


