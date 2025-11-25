Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCD1E0DD8;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042421; cv=none; b=h3ZGzBEkUPfPUsYeLCAmNAyE2lg7We4+bi1zv2Rt6ST+pjhMiYrSGeJbqC5Ylbhfh6sBNjQ86AKjQIWAS2GDbxVQlpOhfllDLCxGeGgiQjIw3xYhm7WjwN2cdtfPfguYILXn7Qd71J7EGx9SoWJMtiX090b30Iowmt9wm3K0cR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042421; c=relaxed/simple;
	bh=ycM7LXSKbuEanMKnAqYP54DyEq9xsY1JOHTdVmdmdrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiFGAltuHlkdw9NwcsErT9Zxu0MsgtW0T3usHBTNnwAqB1mxuuGbMXCffZ3WL0FVUhqGspZLlXVg6NNcGYpVqo8bPzhemClXE1mTiRORBgADR+SKD7G8CCLGehC+/RLZ7f2em0m7+t/U/XJceuk+Du8YbeoI6GkFIeYihx0hhjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZvPGvwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZvPGvwS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 599AEC116B1;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=ycM7LXSKbuEanMKnAqYP54DyEq9xsY1JOHTdVmdmdrs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mZvPGvwSZmfA2Xv76Eaoh2Nq0QduKe/rrFDuNLRmF/sovTWu3WznWhVDq6e1yEPJk
	 +5G7RUN3Rp7iTWY2fkJpJysWunIJ9gHAZ380zQpx55Awp4Qh46x1TwP+iSuAN29LIT
	 4lbbLltn6usdBq675cH6sf4FTuqAEMLeNIczboIUgG6qGh+1XyK5ZEFGiMT3mkhGG3
	 0DMU7kpCUM/Pj+bxV1Hl+Xa1xPYBRlAC16We5yjARQvEV+DWBsmNi759fYcvlcYZBf
	 m4S12vBolPLc/EFPSw2MG0MG681zKTlI7Pxi+pZUZ1yId+klJa7srRMhsNSXLHjZzp
	 cqAHFcAZ2sebg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50036CFD377;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 19:47:01 -0800
Subject: [PATCH v5 2/4] arm64: dts: rockchip: Add accelerometer sensor to
 Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-2-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=1266;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=owuI4HZdlvQp/fF0o2W6LK/Li46MndqpBMI0zHW5OxA=;
 b=FsSvN3r0QicnJ/w3S/WAeTY96iFwVszQDSQC0oT7MLn0LeC4PC5RFl3S5/VDEb1Y/4qGuCgQc
 ciIlNIszl9wDaFG9F9VZCx+tlca+23MeQ1xrJPXA0fj6iVKW99UO08h
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses mpu6500 according to the schematic. This was verified
via `monitor-sensor --accel`. While rotating the device, the output was
correct (eg. when it was face up, left edge was up, vertical, etc.).

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 2d2858ee149e..f8c74b43ae9f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -543,7 +543,13 @@ mpu6500@68 {
 		reg = <0x68>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&vcc_1v8>;
 		vddio-supply = <&vcc_1v8>;
+
+		mount-matrix =
+			"1", "0", "0",
+			"0", "-1", "0",
+			"0", "0", "-1";
 	};
 };
 

-- 
2.52.0


