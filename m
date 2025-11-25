Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF94827F727;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042422; cv=none; b=aX4Gb8O3xvNo1B1z3RJ5LzAwtqTlXO7y+7VjslJtPEbIytCxAw6To+7jG22V/3hDqduJ+28If+N1/aBxp2obe4IBmy+fy5anvC84F4QAV9ZbiWxshwr6EbeZUhy4++wiT1jcmblnAMC8zJP5Y9wedKarlxjN6t30IUqPf2OZjlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042422; c=relaxed/simple;
	bh=5l7nup7DC0Y8dqHhsU6KY6mQSCmRILk4Zjbco+Fq9Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0Ugx6gh+wQkQ4HNurHW/MAMtuIcjwMGFEpVDY+rA1taeGGbb9V5VGWao2hXCS6txio0ry8MIs8UypG2e/zBhHL6tEyneAKAHF2mCH3yg1LgslMPSEWpxi46d0xk24ytICPR4AL6rLRV5e22+T6wMGbqPay4pc17bMogL/13B7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7rQxDp6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7rQxDp6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B11AC19425;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=5l7nup7DC0Y8dqHhsU6KY6mQSCmRILk4Zjbco+Fq9Jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G7rQxDp6LFp6SImskkZNkYHvZPColq6OuCe6e4ZatPWGKyMNMwN6pTbMa5mc4UrL8
	 JJfhHqaO99P9+y4crcXyUSo73vOwoOLudUyuqhazf0q7CQS8Jp0n5mVy0t/a3kUdBx
	 b+5+c8gTQmWLEvQ/6lhxsplLxr53X+4Z39DX5y6BfGw5jXbV72FkR1b28GFXlWpXQO
	 NvClOrdOYnW1Cn+v0cc4xmFq226HIfN2QLIe9QdTM6JXjHnfToPuQ3iEa01xGGnz5C
	 LTSEEvim94ktPiCaakYMkpE3ttBexenN8dfJTp0K2d3midMmVyyzsL6E/TE3ooYyvH
	 ks0APOMsFFlug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4CACFD37A;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 19:47:02 -0800
Subject: [PATCH v5 3/4] arm64: dts: rockchip: Add magnetometer sensor to
 Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-3-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=1356;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=6kNPA+rufMDaioiLjzVrw3yC2YKarI4Xs7vCiBTyO0Y=;
 b=mjYYXO4VbxbQzJyStmB8AZAeOSbBj75gjJppJVbTQOdHHt/2CWOeQhbgrytShK5eHi5ku4QNZ
 fuP4qIKj7w2AxQqtJKaj3+ht/F8kA6jIf1mEFpB6PerrijUO2jTOo6z
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
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index f8c74b43ae9f..03721d71766c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -553,6 +553,21 @@ mpu6500@68 {
 	};
 };
 
+&i2c4 {
+	af8133j: compass@1c {
+		compatible = "voltafield,af8133j";
+		reg = <0x1c>;
+		reset-gpios = <&gpio1 RK_PA1 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vcc_3v0>;
+		dvdd-supply = <&vcc_1v8>;
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

-- 
2.52.0


