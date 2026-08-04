Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93854854FE;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866809; cv=none; b=NAp5lBmRDCMO/uwy2ckfdqi9IwyK/L/BhMu1xNLy/aVDP4OrXvc5aL4bb4CBjQZiq2XcXDo9M5QpSCvqI47tEf6IXtqf4ToHZhPAPmFhdIT+878voLigwCDt7ui33X97aa7t0R3uM4kxQIqHfUPNw6F0YvPOMPLcPwS0PjMdNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866809; c=relaxed/simple;
	bh=LljTN1JbQ/o4dwsCoWTAYx5FSatb5Nu41U6AEBfGLV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=paQzLSBnxjuMidoZbAwUj089UZ4lyQKyA+LIAEu38j3uGaoNtPctu8VxGfdhmtMFEnUIHTIijHYjy1wf+Cu5jLG2iV69aqTVm/CeRilWDIczRO0zhU3hr+/lkPSWzoiW/X68dd5IFGKpH6d1zmOkO0XRolVBbTF7pSMoRKbcZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+eWgWL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+eWgWL8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DC50C2BCF4;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785866809;
	bh=LljTN1JbQ/o4dwsCoWTAYx5FSatb5Nu41U6AEBfGLV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W+eWgWL8NmKFqHop0knQXRJ5M+GQHK+wklDIbLS2j7f0TIYVd4uLyKFSOyyhZMcZ3
	 DnVj6yz1nL7PQJ19k3g/L0b9wp+gWUOxbWITtQQzAsiT3uvTXzCF1tGpjUFAdDLelJ
	 3RGH2Ab8p5xTKB9n1lYL2wPlnryAC/TyLitUp9KmE8Uc07Rdffz4gwb9sYo5ze8MI5
	 qOuOQ7897eGwuSCP83of+kvpOVPurbfD0rgR2XIjV96Q1rGHzY/9xSAKl/a0WvGKgI
	 iEhXE+7vt4GMAiYVVL8GuYprW3xXihLqyGf3w5LCTBzhAQnm6OWN209+J7RbyLsevx
	 ZfvSJK/jUELdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2568BC55184;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 04 Aug 2026 14:06:19 -0400
Subject: [PATCH RESEND v3 1/2] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-sm8475-bup-usbss-v3-1-9a5b9ebf62de@proton.me>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
In-Reply-To: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785866807; l=1082;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=QrONa8UfuM7KhLs1br+f3olNhvY+ormmP5vIHk1Ddjo=;
 b=NzowIrBJ87nSt21s9qYNPtdfF2wh5kLf3ODag8iF5ubD63ooOIncYo1vPnzSXTxajZG1zIGWL
 tSMN9bsFU9vB7O/vkO5Nh4/XXtbQYE6bnBP6h+NL79qimIlfT2dLmVi
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


