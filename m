Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B92DF153;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772182; cv=none; b=qon1tfn66canwzZOzhHin9MHhvBbquGh1x5S9Kb2pPisoeOZUqRX0sy4zs4ADVDqKPSXb/Kjyjr3ST1gWMpT6W2GLDfSzU/LN8rkAoDlEqJ/P07WKLfbRObVRiR7ZNOPRa56gLFEdIHUa+ocHN4ouMcq+c/dQE/394SIB4kebGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772182; c=relaxed/simple;
	bh=LljTN1JbQ/o4dwsCoWTAYx5FSatb5Nu41U6AEBfGLV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSiBJ4+L8z2lf7f7WEDpoJTkQNcYrfLjQ/OwUyhPWXSjKwfrnbqEI3uDjIIImGfcGr9ZTGPEq3hYOLpN8hPF9beSXTIWRo5txFJbkaJuPYzUGH28czIxokelhHjEqzUfTSRi1Wjz1RGjiyJge3+NgFwsshg2CYgsNRXgW5pGXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDWoQetd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDWoQetd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70675C2BCC6;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784772182;
	bh=LljTN1JbQ/o4dwsCoWTAYx5FSatb5Nu41U6AEBfGLV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iDWoQetdMeA1ir5Q4XR6XCQDPVqXp7uBTgtbyGlpaA48lbj0Dw4REudiCIQ3w4Ig8
	 qkmcSmZxrs24QunOYRdFsr4aoaaS/VutFmoIsU/3XE99tI91zhXNC4seiqF/zx4/G9
	 lEbtAI3ZRVzAkoIwWRGKQyACGZDn1o3Qzec4kR+w45lfkdQaKq8lufXZtn30XefoZi
	 52cOTfXHDzBamprfVcStRB+7fgNdjlbgZKopCpSsO8eDX0qJt9r2tdxqjjJDwUpwu/
	 FDMA47En+U7aMja2CJRD+2iEf64rsIlAzrqNeQJozHqQU4oFmrricYVXo9gdnsSUDX
	 vey+CZBTYUbsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FF3C4453D;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 22 Jul 2026 22:00:01 -0400
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sm8475-bup-usbss-v3-1-0dd5da218ab2@proton.me>
References: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
In-Reply-To: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784772180; l=1082;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=QrONa8UfuM7KhLs1br+f3olNhvY+ormmP5vIHk1Ddjo=;
 b=WUB+DblyoqVWwq+5auyteefmtxPX4XalUUFX+BULQK9wT+A4WphzbvQRd6qxxb7YGMcCKA0lZ
 e8y/3w34TXfATb+9GcbD7vYmBa97GCAN1VRNRWzATBwmMiAOEW7KP7O
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


