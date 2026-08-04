Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6EA3446DE;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866809; cv=none; b=MvZdKidVQ67hR+WkYR8bZL5e+8AO2nymQ510JqI/i8mSFp+pMRL2MBf5UFC1bcTPXWDUP8g8qP2gBWcRuKMPwLlLHzfYsAWGcniG1MbLtFjfIjhbc2sZTluvf+V35bKtDTMBr/Ci7I91ZwR1T2yu87Sbm99GUY4vXDQHqfxw19w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866809; c=relaxed/simple;
	bh=UYYeoFYGn74wN3HBRtWiUwkieFmQvRE83tQm10aXEO8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lcwp99s1f9X5crIvVMbnB4V8o04nTNtL8hmmPHrd5OKwErw/qztOdwkCpboYLckloyDPSyQ6ZeGTpK+xdj0eU6Lsfcrfyc/r6yZJUxX5LnyK1+9J9I/vl2CsnGKwASZiEqCbil/GQz8d1h/rIfKl9xCllKGAwf/pZt1R1k5xP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYpXThW/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYpXThW/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D04AC2BCF5;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785866809;
	bh=UYYeoFYGn74wN3HBRtWiUwkieFmQvRE83tQm10aXEO8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YYpXThW/dImuzbVnljcU+E2waCL8eO2490cqvCs3ii/5IvSpFDdiouFjpmwnCFtq1
	 fkuxINWN253djY3/h0IzbAPeMJB+2lJKcHxA1VjZDBXjsUnG9p1DnDuX2kbx2Y6Hp8
	 zw+F+wICME3JFFE6KsIXTGc+Zaal+0aCSXhIR6IYzDBzCShsQCmT55AqIFJIbGhFQ8
	 XsfYEdkHydTy3DUtFjRFZ1qafB1I9JHP8dExbUlYReWfkuhmqEk1YY/pOeKP5Q8BuT
	 F2nhjTTYhrx/11qbbUDH3zs/H9BrpfD2/z8K1/xvBMe5nLttYJt6VvWNh0kg6/abNC
	 Tjwthut8wipTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047CCC55822;
	Tue,  4 Aug 2026 18:06:49 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH RESEND v3 0/2] Initial QMP USB PHY support for SM8475
Date: Tue, 04 Aug 2026 14:06:18 -0400
Message-Id: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785866807; l=1598;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=UYYeoFYGn74wN3HBRtWiUwkieFmQvRE83tQm10aXEO8=;
 b=L72rDqhmOb52xnhpROj5aEtCiw6jb355ELkkORugIfTAJB/wS+qrYr4lrPMQFOPUreOcjir0n
 SfnUusl8AnKBK41/OEh97Yolcmm5lQxu+NANskHoyOBfHXxirN90Ylo
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

Based on the following patch:
[1] https://lore.kernel.org/all/20260711-sm8450-qol-qmp-v2-2-d14353bd6ff4@proton.me/

This series adds support for the QMP USB PHY found in the SM8475 SoC.
The initialization sequence varies noticeably when compared to the one
used in the SM8450 SoC, hence the need to add support for this PHY.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v3:
- Apply suggestions from Dmitry
- Drop PLL version patch
  - Explain the situation instead of renaming the structs
- Link to v2: https://patch.msgid.link/20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me

Changes in v2:
- Split series in subseries (pcie, usbss)
  - Sorry, it should have been like this from the start!
- Add notice about base commit
  - Reason why calibrate_dp_phy is not present
- Modify referenced swing and pre-emphasis tables
- Move v1 PLL tables to SM8475 support patch
  - Warnings are generated at build time otherwise
- Link to v1: https://patch.msgid.link/20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me

---
Esteban Urrutia (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8475 QMP PHY
      phy: qcom: qmp-combo: Add SM8475 support

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 169 +++++++++++++++++++++
 2 files changed, 170 insertions(+)
---
base-commit: 30b4a96d99ce8447f4589af6f7da35d4b43e0af6
change-id: 20260714-sm8475-bup-usbss-e68349473f6e

Best regards,
--
Esteban Urrutia <esteuwu@proton.me>
-- 
Esteban Urrutia <esteuwu@proton.me>


