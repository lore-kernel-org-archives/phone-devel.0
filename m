Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839530AAB8;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=NA3wqKNw2AgXdFWjwQWGWiT4++lqLIPefdeeW7Fe7qREaQeS/CaczJswIGFwJ0wfwRBm95r+BevYLzx+V4/Zj9q1nMXM/mg8RaWNYZC6RfsgpdLP2tQ0FmciKgvECIc4vSwGgR/6ZXE8SRMb/rDI8vYfzV09vqTQeBlES5FWViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=cBuG9qIm4T9+ewT4unUQMAxwPyLKUDr1oTf2cMuk8gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2mbIgP3wczCQ7bbcpiVISgqKpRd5brqmVBmpTG6+Cw/l36QnNfzjjrhBHTDwdlkDdz4eeykA0GOf/KhTlnCYtskw+b3hbRMeJm7vdi0VD3i3v+bfZPYIDhXw4hm/MVG4KK5nJ7geYv4NnIUBifyjlljpUnRWjK0xgPBmpEbmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXEPa2uz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXEPa2uz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 415FDC4AF0C;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=cBuG9qIm4T9+ewT4unUQMAxwPyLKUDr1oTf2cMuk8gg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hXEPa2uzVzFD/KTgy16pH7ZzhUYxih6jhhwix2Qqqey2lgH6duX7xA+GGGnZvGb+0
	 mG+X68GsX87XvhQhzT+cR0fTJJhbl+ln+1097RsB5cxO0K8V6JjCHHHnZtL83/5A2J
	 PcQYpldV2bLm9nfueyebTsbk1pGeeHZZ04ysGSXxYW4cyTnzrJYE9MIt6LH2bu1Am+
	 g0wnGUn61HCCLNW0U+4SyT3lusIbxcigN0A0pRzsbfyDK3HNCuQ8GQzs91AVhp2uP7
	 4vMV4ic23/couB/GVQgpBbF+pFCAuTY+PComyao2OCaa6jSu05wrnljiXV6BOMshe+
	 EZgwKPRJwRF7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAB7C44501;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 14 Jul 2026 02:36:39 -0400
Subject: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-sm8475-bup-v1-1-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
In-Reply-To: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=1401;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=L4xMCLonX6m0jP1wAaA1TnmKHswCpMfIQy+ivLlYcQI=;
 b=u4PImQ3F7GkRpTteaHa6Wzd/Dj9d2hWYFwbCyrVusVmJ84ESsI2HspoHwZJk9l5TfxsT6hmQX
 JfhvrIZYNQlAwT74SVFKZ2YP4xxmulB6h7kKZ001imsCZuVCt1bTtK2
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 init sequence for this PHY varies significantly and can't be reused
in SM8475.
Add proper init sequence and bindings for the PHY found in this SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..8850d5ebac03 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -43,6 +43,7 @@ properties:
       - qcom,sm8350-qmp-gen3x2-pcie-phy
       - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-gen4x2-pcie-phy
+      - qcom,sm8475-qmp-gen3x1-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
       - qcom,sm8650-qmp-gen3x2-pcie-phy
@@ -175,6 +176,7 @@ allOf:
               - qcom,sm8350-qmp-gen3x2-pcie-phy
               - qcom,sm8450-qmp-gen3x1-pcie-phy
               - qcom,sm8450-qmp-gen3x2-pcie-phy
+              - qcom,sm8475-qmp-gen3x1-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen3x2-pcie-phy

-- 
2.55.0


