Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB92F290A;
	Fri,  6 Feb 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373654; cv=none; b=fimz8FObCggPxUzr17KI7YvwttUAB+j4LkeYZ5usN6l/sGyZLianpnCg/DmeHOViVnO45ek40/O7ryvM1SCXxHffc7HcEX6TMDVwHmHzsmsHjqpX5PVQU0guIOEt7k9rf1yFGPZgjjpp7LkFvcK4ranFlQAT55Vd5TCjcZQ9bY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373654; c=relaxed/simple;
	bh=R6d6LOYx1acrZEfT768rwpy3DqJ5O4GGUCRhdfOAiOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JbbZK0knwOPZEZB8DAN8QqqlPig4+Wpzc9V2C/hA9uwPf+oUr0qK62mzW98Ys8b8qf5eE9N16aS2ev9sO51FCdP4bTUjeXKNi0D3PUwNHCzHfzhvqMiOPj2WNr9KppFer+oh/XteJDU5FtWjhqonW9kM/t2u2G12DBqfgNzP//0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=c9xEOKQ/; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="c9xEOKQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770373253; bh=R6d6LOYx1acrZEfT768rwpy3DqJ5O4GGUCRhdfOAiOs=;
	h=From:Subject:Date:To:Cc;
	b=c9xEOKQ/su2/QSb8Z4jYID+ZTdPzW74lDLaWIT/7ZSAI9HcA6ZtBtv6a+Vb0AAhMi
	 Z7XcvChmWFJQTpLFvydDN21rBPSqWOCwPkfJtn28eohMzJmJYU8ab8ws5GZFa2R1r1
	 KvFpNCOJlwwg/yKBEV4wwfX/ru9b0PGT05czLSNI=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] Fix syscfg-pctl compatible for MT8516
Date: Fri, 06 Feb 2026 11:20:47 +0100
Message-Id: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX2nKCCi/Qr0aHHZnvIwo0opH9PP
 A1zmMkglJgEuiZDopuFj1jEtA3M2xgDKV6Kg9UWtdWo9ss7g0pemddQcUSF5BYz6RE9WSjpmWj
 lp2774ft+maRIpmYAAAA=
X-Change-ID: 20260206-mt8516-syscfg-syscon-6e5d1b0a68e2
To: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=614; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=R6d6LOYx1acrZEfT768rwpy3DqJ5O4GGUCRhdfOAiOs=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBphcCCle6WQVY8NfJ/FMmSJUdEibM9IZeseQXgt
 WZADv8RTTqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaYXAggAKCRBy2EO4nU3X
 Vs+eD/9LBSIv48EKjvhOdZoTFAt94zO89FZiJosZwfat8w8XNmaWa66EC2YdT4YjRiYeXn40Q6e
 D+h+Yo/szBLSwT4vWDU382eTBV8HhAoExnDPnH6hsIqgkfETc4B4kdefOkMXlGht8+jvNZOSb71
 dFxKEKNruMiWnvn4KAe5mDso9V0PZf5Dau2lzyIsUKKBHmft3RgXoJxCj78TK66vPF746VJIPub
 rmZgWZrhbPGsfve91HoWnXUUKd3JMENpNfQ2l+e1jLm6Cy2niFYAAoHKeiKsjkvnicqRCQK6yIu
 gHs89P2adwGFyjKZMBx1hg9AJfPliBNMfaYOP7E99FXSBdMMSR/LljV39hAtSmLZY0G2A4ETLym
 uE61xzKqL2IhlSWLicVqk/as5WNCGEmed2W+8AN755ABnswylamh8Jwwj+pr3g6GyWWmmAX+N1v
 3as7Gid5JHwaVBjtkYs7xBwNJacLuXS2H85EaVcDXz5svfvhSy08D17QFcH9nL33jq6Nt5tOx+E
 WbNoj7kI1qIUepNGqIWfAU6lAVelA3I+uSn0htfkE2Jktu0Z5Y/GQxuP9Y1jF6QQMQZFUThql28
 ywK4WMHLtrcjDGnfY6h2mUTb7Ejx4IULWOx1JS+UHQZz7tUOh73WSzmwcuPLIkMVrswzpPkaqk+
 B1Dp6RguibkHjaA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Address a dtbs_check warning on MT8516 by introducing a new compatible
for the syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (2):
      dt-bindings: mfd: syscon: Add mt8516-syscfg
      arm64: dts: mediatek: mt8516: fix syscfg-pctl compatible

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi          | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260206-mt8516-syscfg-syscon-6e5d1b0a68e2

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>

