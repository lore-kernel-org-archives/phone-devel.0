Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568B3CF04C;
	Tue, 10 Mar 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163307; cv=none; b=HltLqlyILrPKo06CDfmFmP2sQy9GuWchEVQz/PO1Htu7EH8TiSc4Mru3u14CVdNRDsLdj5FlOkdaPRxZgcH+8JfTl14csWE/nPAwfCFWkRZFta7GcG8Uo3N25zZSMiHz3nunb+yBiDTvhYkXHnaCdBveJGSIJE0FaeYQpLOOXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163307; c=relaxed/simple;
	bh=N0RGfxXkUDzWKGSrCm5WfYkhRXyx6YU06iE5hzout8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PcafeYPN9C0tMfsy6BfMANlga4+H0Iiie7EXXkQJbazpU/dfcEQNX/2ys9Bt5hEznIw3HgU43uzKBs7/WnSkfL/RApYrDgTvUOqbiedBOoR2Krd2YLGw83LU924gHnhOC2zP1fcKeidlrgniAWnDTa3zL68aPbg8VUZs2DfmRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AMaDqUFU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZKGanOCa; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AMaDqUFU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZKGanOCa"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1773163296; bh=dACeqFNvGbj0n51Dp8swwtM
	8XFuQ4z1hcV9mgSaSQw0=; b=AMaDqUFUEy2Lf2pjsx9wZl22mbQCvJzHkGsJkDyU6xPNZlqa8n
	56ICGtik8vrECSksytCAGIPAVxl2hFqwLRQ0vSmkGixRPCJ3gdvEVel2gn1MujHlc4PQrUdBK1N
	3oJ6FMG6CIGw+Og9FYG26yVLlFBWOdPdrdXG8va6kfEBkCBt1PbMBJSGmE5sgRiGF/8d8v996lU
	n2U5In/4QsaKA42lNrAfR4p+BA7exGAc/fU5RfzKJEQq+Mfh+/wUgmEtqrgTQxbBH5FyD+X/ZFZ
	Nw6a2jZBosHGA0/n8VTYYtamAq28GxJdCjfj/M2a4s+J7V8Fy7m6WTeHKyEnln3rONA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1773163296; bh=dACeqFNvGbj0n51Dp8swwtM
	8XFuQ4z1hcV9mgSaSQw0=; b=ZKGanOCavXc4+HfHCnmivCQDAc9Aw2BkOYU3E/UIcRsMLbsCxB
	dNelprgB/BD+eR3DpOT0ocMttHdHH+dvguCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/7] Commonize Redmi 5A for 4A and GO
Date: Tue, 10 Mar 2026 18:21:30 +0100
Message-Id: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMzQoCIRiF4VsZvnWGf1m26j5iFmbqfNDooCHF4
 L1nAy1avgfOs0JxGV2B87BCdhULptiD7wawk4nBEbz3Bk65ooJKkrEaYtM8p0iUctpqeWLaSOi
 PJTuPr027jr0nLM+U3xte2Xf9OYc/pzJCiRTKMy9vR6H1ZTYYHxgxhn3KAcbW2gdSwPMlqwAAA
 A==
X-Change-ID: 20260304-riva-common-66e9c94819a4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=2211;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=N0RGfxXkUDzWKGSrCm5WfYkhRXyx6YU06iE5hzout8o=;
 b=pYJfU+k3UHK0u8ZqLPR+nZx5yl8x7Uu04GFX74zvH5ktVqoApP3dOIJKP/p3ZeQrMIZ7V8/1f
 Q0co3gK6vMGBYCqPAP0KjVu41DmPinRkckUnjDrl+BPCQHcZPKnkVm8
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 5A is similar device like Redmi GO and Redmi 4A.

This patch series commonize it to avoid code duplications.

Differences between 4A and 5A:
- Different charger and fg
- Different displays panel but same resolution
- Different speaker codec configuration (awinic-mode)

Differences between GO and 5A:
- Different charger and fg
- Different speaker codec (aw87319)

Additional changes:
- Update Redmi 5A board-id for support nougat and oreo bootloader.
- Add Goodix touch controller support for all variants.
  The necessary touch controller can be enabled by devicetree overlay or lk2nd.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Rename msm8917-xiaomi-riva-common to msm8917-xiaomi-wingtech.
- Split goodix touch controller addition to a different commit.
- Disable touch controllers by default.
- Split new Redmi 5A devicetree to a different commit.
- Fix Redmi 4A board-id.
- Update riva board-id to make it able to run all bootloader version.
- Squash the devicetree bindings.
- Link to v1: https://lore.kernel.org/r/20260305-riva-common-v1-0-436f1f4b7399@mainlining.org

---
Barnabás Czémán (7):
      arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootloader
      arm64: dts: qcom: Make a common base from Redmi 5A
      arm64: dts: qcom: msm8917-xiaomi-wingtech: Add goodix touch
      arm64: dts: qcom: Add back Xiaomi Redmi 5A
      dt-bindings: arm: qcom: Add Redmi 4A and Go
      arm64: dts: qcom: Add Redmi 4A
      arm64: dts: qcom: Add Redmi Go

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 308 +------------------
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  |  15 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts  |  23 ++
 .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 333 +++++++++++++++++++++
 6 files changed, 378 insertions(+), 305 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-riva-common-66e9c94819a4

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

