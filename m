Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2509331A57;
	Wed, 15 Jul 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099253; cv=none; b=Alw16erw07ft6Z71oKtSgyA9psnci2QrXJyh7jn7fJKRdlHM4/W1rjCxTYKuppBHq/Nx6ldHyfeypz7malqvKWHnklRz1eDmdEXITPZSWVBJbEaUvespAPqNhZ7l6jcQRouuKqa93LDBQaAWGZQKrlzI8qc4vh/cwZ0hS2wsmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099253; c=relaxed/simple;
	bh=kwSTb1nva9AqjRKglnBgdgDIqGsu9278QfIcqtMqZWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZNoT9xKuuBTh7nd1+6POB9z2AI0IaPfdKEiD3GSCa4xKeXYTG5U/eCN/wbVNWiVwsPEzPTNcyPQ2bqAGF3vmVde6HHlnZ9T/MD7cFgUvTx17CSwvnxzLTnylWpLT+wLCdCI0mXLQ34o7aHnjzASmLbZXOLgvC+08tbf8MfH/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YC5etZrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC5etZrh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 173B2C2BCB7;
	Wed, 15 Jul 2026 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784099252;
	bh=kwSTb1nva9AqjRKglnBgdgDIqGsu9278QfIcqtMqZWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YC5etZrhi2xD4mYXYs6XuaVFPf/YnSXIMu22KfR3BoSn8/Ur9jOdZGZR29FDjrYz6
	 AT2xCwzI2/MpcYbyw9Y2XRM7dTSxFsaMKptr8VUd9+EKsoqpbYe1qwGILkI6H2Uwxb
	 ngd1cYwAFqe/OMZ6YPYP2cprn8fQurkfZj9Cm5JyJQAMeoisf649155TnCeh69LOkb
	 3BHelL0Rm1w+xaRzU1hASZitz0IikZMxoktXaheG0u0YHb2uAN9a1UhaMD+EIabW7y
	 XCyXpvr0XRzSQiWTHwRQjlNyA/tpheVb5NcIju50uvgmTzf0w6CBQgd73svtHqsxsa
	 it5Yj4l3UxI6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6EFC44501;
	Wed, 15 Jul 2026 07:07:31 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 15 Jul 2026 03:06:54 -0400
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-sm8475-bup-usbss-v2-1-2d8def39b190@proton.me>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
In-Reply-To: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784099250; l=1009;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=QlalgE8PWhdVYi02z66OWZNjDEJrjwh3NQS1V1WaGAA=;
 b=haiZVjCw4UMBIhhGef/d6rYQcIN7xtQNJYyQBDGCMzWTSkX0t+Pfa2AFhaa88DHjjmcO8/7LP
 bpF+CLIGhzkBP0diV2HaR7/ft6UFUW9fACwNa5qUw/A3xAvC5Dtu7z5
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 init sequence for this PHY varies significantly and can't be used in
SM8475.
Add bindings for the PHY found in this SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..b9d0de25f43c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,sm8250-qmp-usb3-dp-phy
           - qcom,sm8350-qmp-usb3-dp-phy
           - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8475-qmp-usb3-dp-phy
           - qcom,sm8550-qmp-usb3-dp-phy
           - qcom,sm8650-qmp-usb3-dp-phy
           - qcom,sm8750-qmp-usb3-dp-phy

-- 
2.55.0


