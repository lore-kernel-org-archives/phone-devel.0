Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79B36C0AB;
	Sun,  2 Aug 2026 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785652812; cv=none; b=cXi1pAztGCShbR2d8rgJFO/DbXdHhu9q1rT2lzdKx1A8imsyGHupPy6+s0uuG76rXo2j4QyhGaVerMKrUynBxCyYjaq3ciP9l1MgTrG7iQzKaCAN8rhOdPfVB5fxh7JoYJtGSojgvSiWGtpk0d6oAO286qnS58ImiPbTZEWcOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785652812; c=relaxed/simple;
	bh=In5rCKNTa55tl3GwmLgLp4Wwbw3pKVv4bNBORL90G7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iffi4nAo2rUWYR6AKS6BPSl1Tblk85BbYWVK/vDqRXfe9EyAYs5N/0lTndpjNXaEe1S7zlbmU68nqOXLHsLA3nO2EBfjEoB1iSsB4qht0E8QpKAKGWUMcju7M8dIiRRECKzR8km6VtFJAtU/jO70S/uoLLX7ACD2Lb+oOx8rhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzTw0wsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzTw0wsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45ED6C19425;
	Sun,  2 Aug 2026 06:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785652811;
	bh=In5rCKNTa55tl3GwmLgLp4Wwbw3pKVv4bNBORL90G7Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=IzTw0wsZgcVixw8dFzV3DASwzTQ0NIfWr9Nw+Iff+quqyHCT+fLm2AkNrH+zVDuoJ
	 vP50ZavPUg8qHO6Uhk4L9tBiZE3/9jI24a/qoDtH/fc5JvaSbQrqAZv+O3Vx7mVGtL
	 Paw4GMWD4+aRdY44ENoaLHvbX18Sr+UTfpNJ0LtyFHaqGF44cvp4X2aZ6B5m5Qy6Qj
	 Lcm6bMfLaXK4tZhYtJZCVNDtucOwdAjJMgQvL+YRT/RYVjA42IemxqQ66lGBDpjKH/
	 dRUiSXIQx/KO2sTSYOcsZfvNK4aGh4Z+9/zQGe1n+55YxU4r4rhjuSVLIYIY3qtmbR
	 HmswJOCKmiqTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4D2C55173;
	Sun,  2 Aug 2026 06:40:11 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sun, 02 Aug 2026 02:39:55 -0400
Subject: [PATCH v3] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible
 string for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-sm8475-pmic-glink-v3-1-45216e6ec572@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ7CIBQE4KsY1mLg9QfqynsYF5a+tqiFBirRN
 L27UDddGJeTzHwzE49OoyfH3UwcBu21NTFk+x1R/dV0SHUTMwEGJRNQUT/IXBR0HLSi3UObOy0
 EFmVbyQbqjMTd6LDVr9U8X77ZP+sbqilBqdFrP1n3Xk8DT71/fuCUUQXIq1Ioljd4Gp2drDkMS
 JIfYCNk/JcAUQAZxxVIbAG2wrIsH7TT1U8GAQAA
X-Change-ID: 20260729-sm8475-pmic-glink-57e56f98d2b3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785652809; l=1696;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=tn2xH0fzQ/e6xT6kAD58wd7odc28IuNeh1bh7VNPiEQ=;
 b=e08RXdumGEVucO+Vc+5VdB5GOkbF64uTxGj6Kjc5KWzP2O2qAnY/d2BqgZVdaGIR2/0AN95oE
 pHTp6y+OnwKB1QmhPab8ixfMFDrvd5Yn6HgoNxLbXRGqHvA59zLZrpv
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

SM8475 is compatible with SM8450 with respect to pmic-glink support.
Add a compatible string for SM8475 using SM8450 as a fallback.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
This series adds a compatible string for pmic-glink in SM8475 in
dt-bindings using SM8450 as a fallback to provide support for it.
---
Changes in v3:
- Drop patch modifying ucsi_glink (redundant)
  - Use SM8450 compatible as a fallback instead
- Link to v2: https://patch.msgid.link/20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me

Changes in v2:
- Apply suggestions from Krzysztof
- Link to v1: https://patch.msgid.link/20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..d4478d9b3212 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -43,6 +43,11 @@ properties:
               - qcom,sm7325-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,sm8475-pmic-glink
+          - const: qcom,sm8450-pmic-glink
+          - const: qcom,pmic-glink
       - items:
           - enum:
               - qcom,eliza-pmic-glink

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260729-sm8475-pmic-glink-57e56f98d2b3

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


