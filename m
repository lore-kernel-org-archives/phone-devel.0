Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1927FD59;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042422; cv=none; b=H7u3rIVKFqF5eBRpSoKOqmqkX5i6h4VJ+3CtgLd0j1QAiXDA9/PiJvXRoM7aBqu8c76V9M0L9oAvvxFN59eg9ERV28x3nTooIc4eRqF6RKU6pwGh8SZ9w3GcDHnbl218359hzjReRK+MnEzbRM0ufBiK53RkO1T8I2ZwLuDYnZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042422; c=relaxed/simple;
	bh=U2sKGfrG1AuXfw/WKYwLvQsUXr5m8ldv6cClmddJY0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuzhemNd2cHWvkMMYbcYdoeOhho0pnqswh34FEhwTTyohzliD0/g/PXM1upQ5bbCPnGp9jlbVpxsLf/ymFb0ws/UG5av2JOeu5OH2mg7CHovTiETT0F1xwIw5I8tQhvcw1ZhBoddlmVtO9Z5bLenmMaPPLbrRlzTMupcCfjpNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quWUt6dY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quWUt6dY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93C5EC19421;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=U2sKGfrG1AuXfw/WKYwLvQsUXr5m8ldv6cClmddJY0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=quWUt6dYC5b3SpWV9Rye7QkchNc+YUPh0c07GZa6QaIChSx+yKRnghUkDylLw3CY2
	 GxvxziRFCaI7e7ciC0TOlO/ux7iVCdLH6hcdkZtbGVoR2yxlTFRwZiSElB8z8abPSA
	 ztJVURMqyMexZQtovSdr+jXwk7A0sup7hFOJxITs8LTmR6WMXqAr3srfUStRn9sNBr
	 8TYqNbXGtI/iFMoVd7zsxzkg/YLcOd1RQsOKHqTbiCu3XG38tqbG68RIPGMTmJuydR
	 G1YvuU5ChwnRNCxbcz8F2CgSTQuvVJCPgbVggnEMQ+/EeW9o/xEzoMf6G/OG5P7GlM
	 Ajr3zj6sqQsVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3ECFD370;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 19:47:03 -0800
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Fix voltage threshold for
 volume keys for Pinephone Pro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-4-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=1551;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=8q5u/rrJlx+VcAI9BxZ+DVAqqoWsJx3wKRY3rg0cQgg=;
 b=5gNGjBiWQzw+Cia1/yrUL22IXp/WlWSV5+18Ip8iwkRCq8OzW9u5aVpnA8oMATmi3zDk8EYum
 FxWAeo9EsGXB2vf3+jyx5RVRoYyMrBeFOndSq6t47IXjeuNAi18CpJ6
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Ondrej Jirman <megi@xff.cz>

Previously sometimes pressing the volume-down button would register as
a volume-up button. Match the thresholds as shown in the Pinephone Pro
schematic.

Tests:

~ $ evtest
    // Mashed the volume down ~100 times with varying intensity
    Event: time xxx, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 1
    Event: time xxx, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 0
    // Mashed the volume up ~100 times with varying intensity
    Event: time xxx, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 1
    Event: time xxx, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 0

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 03721d71766c..5de08a155d10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -40,13 +40,13 @@ adc-keys {
 		button-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
-			press-threshold-microvolt = <100000>;
+			press-threshold-microvolt = <2000>;
 		};
 
 		button-down {
 			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
-			press-threshold-microvolt = <600000>;
+			press-threshold-microvolt = <300000>;
 		};
 	};
 

-- 
2.52.0


