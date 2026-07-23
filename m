Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE62E2ECEB9;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772182; cv=none; b=XbYUvXjVxWJXaaQTBXiuhL77vDI5wk9ZH+ZEuAA5Lgafw7hLFafaqioC8b/475YPl1K/OBMXTKEtSEpMdcfbYzos+cq8z523KWtuFpaPhV+sxStBwjkK9zPxevo9LbGXxriWNZTNDD8Y3mJE5dRa1KRXJz2Czl7G5ybkLnarX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772182; c=relaxed/simple;
	bh=dsucI9dtuef998/sTfbGEFix5/XY1XUkRggnOrmadjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c7RQgY7FNj4jmZkiwmmMD193bj4AUBUfs6qzJ+nUeM5HGnj1JUOTRNm7slWmnv9kpzrGrOON/TxzoBc2MhOgS2HDt6ZJLvjjAvTaL41wpUGdAFIXNCG4HuRkgy/3acCdGoN5tSqUxgvYwXeMv2uagsCPNP+YgxhttNm8YQXlZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqZzQeSs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqZzQeSs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DE74C19425;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784772182;
	bh=dsucI9dtuef998/sTfbGEFix5/XY1XUkRggnOrmadjM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iqZzQeSsHqqZoWAKvzdabH4HelGwmtu8tp544GkZohh+Tb/Fr9jyt/w7oXWgznhMS
	 FaO9K85endEBCNK0ljsbzuk6nsbgskZ2T+5eUd1tJ4qgHHYxS/01KfgftC7uFkSMO7
	 a1qkIWptpmuqbBxrFuo8Y9mSM3NdEMNYNCT8Oq3GxAQDsnvQW4BhhMehQLevs58BzR
	 tiUte2jG7Ts0mUqvxzyJWe3nCZ6dDVlayP2s8lzFDGbEyZRUlxHVrH76jHamC+62No
	 kPYp9SiAC1jZWoW+YEdvop5HQnRQx2bZcHABSQr6zsVg/d7digILxNz2gYO4Nup+0a
	 Dt1H8guLQrLUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC49C4453A;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v3 0/2] Initial QMP USB PHY support for SM8475
Date: Wed, 22 Jul 2026 22:00:00 -0400
Message-Id: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Pyw6CMBBFf4V0bQ0t5eXK/zAuLAxSEyh22kZD+
 HdbcEGiy5vce+bMTBCMAiSnZCYGvEKlxxCyQ0Ka/jbegao2ZMJTXqQlExSHSpQ5lW6iDiUihaL
 KRC3KrCuAhNlkoFOvFXm5bhmdfEBjIyc2eoVWm/d607PY+4v3jKZU8qpkErgU0Jwno60ejwOQC
 PZ8P81/zTwPAN5WLXRZLVmd7gHLpmbg6cLT9uu7LB+SBjj6EgEAAA==
X-Change-ID: 20260714-sm8475-bup-usbss-e68349473f6e
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784772180; l=1558;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=dsucI9dtuef998/sTfbGEFix5/XY1XUkRggnOrmadjM=;
 b=mcIU0Bs0PVZBUoZGz2VaKDCf5t4VqBIo8iVOjBc0LftaQCqJUlAM7QgMum7Qqe/jyKLVt4uwo
 +vQJpBEvY0cBNiUdgibWzw7EeS2Hq9tqFSkibDvRphp+oO4YYFok05R
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


