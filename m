Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF311C3314;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720656; cv=none; b=oVVZkm9u+y1UsPJ7mBxWqcJinFc/zyK+xpcOpgoZYkf8I2tfPPa5e5dsetZp5jGYxWOaDKMhtinBhDEoSP97suvTzXzZm/lit4d51OGZs5yzc3NZikFyv68YXN7bQeWZns4mtMpem8BfQn7gXTozUn4yEfqiUv7BYtXgDd8g9Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720656; c=relaxed/simple;
	bh=Zi4zn3Y9G7BtW8d1C0I9fl8sHSfCuIBZKh7au6k0ucA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6ONLu+suoYV1g08J8YWawCajix4CJPyeGTrVMRn1n8JvCDEweqrWKWAer4CtsuOsU2IY3bbbLQCbIfVANydiXDEFN4248f5lJ0HqyYjF9XXxQeAsqgPaOdMuCr0lG0X79qhkS3pVjU3QibH8NJG2FjGcI9WZgFutA0lHMIJdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhA3GX23; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhA3GX23"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12B2DC116C6;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766720656;
	bh=Zi4zn3Y9G7BtW8d1C0I9fl8sHSfCuIBZKh7au6k0ucA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YhA3GX234xtLs4bXoBfNGFukrhuR1ETrR55YY/w59olrXYpTyRDrOj+LIYUtNhzRW
	 E+KFhPNg8xvM/ghuVGNRA8Xs0PCJKJVIDKKnXPaXu5OBzphr2TaENAY9qNXeCGVPvR
	 VceNA2co9AP7kSokDwfz7xSUalKGCF0XvbRdtOw2UEhfZlZkzOye9fbSzJhf46L5BL
	 TXIPJ7YOKOYqyu+rnj2Dq6zfZ6m1JELK1EyszpvIvyWRbZo5rFLuHK7lNqMQBY8/+X
	 DCM5vdkTScWrvHDlvYiuyYSucH6UWvLR6ot31Zp5+q/SJdiOn412YXD8VuW1WTev8C
	 gRXYjCp5gf0Bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3083E6B26F;
	Fri, 26 Dec 2025 03:44:15 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 19:43:19 -0800
Subject: [PATCH v6 1/2] arm64: dts: rockchip: Add magnetometer sensor to
 Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-ppp_light_accel_mag_vol-down-v6-1-8c79a4e87001@gmail.com>
References: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
In-Reply-To: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766720655; l=1717;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=0XuYXwAcw7Z+0HhnTrXafixONjaWrvmPAzuL5lX4iks=;
 b=XlQM56S+SOU0+omqFG/+SCuRoarfUKte6KV5pVrGOYfOtajHB0B+jNhlM8Y0eGL74qnktTGTe
 n3dqg6nrKQkChDEXMaue9NNWdFhh9sOIY3+FCDVNV506UEEonKowL40
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses AF8133J according to the schematic.

The mount-matrix was added by Leonardo on top of Ondrej's work of adding
the magnetometer. It was verified with Leonardo's compass app:

https://gitlab.com/lgtrombetta/compass

Co-developed-by: Leonardo G. Trombetta <lgtrombetta@gmx.com>
Signed-off-by: Leonardo G. Trombetta <lgtrombetta@gmx.com>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 2dca1dca20b8..1d3baa557c70 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -537,6 +537,23 @@ mpu6500@68 {
 	};
 };
 
+&i2c4 {
+	af8133j: compass@1c {
+		compatible = "voltafield,af8133j";
+		reg = <0x1c>;
+		avdd-supply = <&vcc_3v0>;
+		dvdd-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&compass_rst_l>;
+		reset-gpios = <&gpio1 RK_PA1 GPIO_ACTIVE_LOW>;
+
+		mount-matrix =
+			"0", "1", "0",
+			"-1", "0", "0",
+			"0", "0", "1";
+	};
+};
+
 &io_domains {
 	bt656-supply = <&vcc1v8_dvp>;
 	audio-supply = <&vcca1v8_codec>;
@@ -649,6 +666,12 @@ dvp_pdn0_h: dvp-pdn0-h {
 		};
 	};
 
+	compass {
+		compass_rst_l: compass-rst-l {
+			rockchip,pins = <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		red_led_pin: red-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.52.0


