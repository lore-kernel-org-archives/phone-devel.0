Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE9314D13;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097547; cv=none; b=Wbw6Q/GWnA/aItfsE0nTU3BFeC4N18zpZm3ZmgWElvd9EfoE95Xd6Ebisixf++Qo9rjkYooGgXzDOXRx/kxAmdAHlXvkBqsNW6FXDE9n6efpp6gdiJgcgZjCTQ7mFUGroAtPNmPExTXwyxJkYz9v7uPg0nwyzotGIKRTFjliWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097547; c=relaxed/simple;
	bh=DXCPklQlaMdsbJnYQs6c8poFEg6YyAXU0DXLOMPqOgY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A36itFneN4ynZPW+AuLsXFsZKKuF+sveX/2Pd/IHASHrJ1Fep3TglAsTFOJnEYUjq3vOxqjC6A5mCxQUh3/tq9aUNBNRmrBEG67nOw6WpYvtXW28afkAf7iDGuN+EJjQCctt9gpWBDK/SJM14wttvQ2ibKGxpejI75idNTl62bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4zw1KEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4zw1KEy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 129BBC2BCB7;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784097547;
	bh=DXCPklQlaMdsbJnYQs6c8poFEg6YyAXU0DXLOMPqOgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q4zw1KEy127u+sxMzbAsYqHSxQZX/o9ZRyAn0zz5KcUMJ3nASgotlWO80C9gdG3T3
	 71BKE4mTUWHY5fJO1bKHa9JiMJKI+vgdHLv1uiLUe5su0d7+lX7V+drRQGqLw+kgCf
	 TX49WOdAGJXw/lR/T1anubfgzBV7s215c1HrqoLMlT7fCnuynr05o4YHe38Z6g3pIY
	 /vQK1wWHXMZHaZ6a0x8UMKVsj1+d1tVIKwZcTwP5UQ1r7qwXjO2MWUBoYeyB/dCV2K
	 B5elniRZxfGZxKC73yu2YZK9ferxqQqr+5Id4yaErFxccqJk89sz9Fx2OBEct4xh4b
	 5rHnmB4t+p7Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96B0C44501;
	Wed, 15 Jul 2026 06:39:06 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/3] Initial PCIe0 PHY support for SM8475
Date: Wed, 15 Jul 2026 02:37:45 -0400
Message-Id: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RhaaousvIdhYesoYwJtWiAaw
 t2luHX5kvffXyBRZErQFAtEmjmxHzaQhwJcdxuehHzfGGQpdWmEwtTXypzQTgGDY8KKKnPWpIV
 TBNsqRHrwey9e2x+nyb7IjTmTjY7T6ONnv5xF9v7WZ4ElWlkbYUlaRe4Soh/9cOwJ2nVdv1tUO
 PK7AAAA
X-Change-ID: 20260714-sm8475-bup-pcie-3e3796e61c4e
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784097545; l=1058;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=DXCPklQlaMdsbJnYQs6c8poFEg6YyAXU0DXLOMPqOgY=;
 b=0goYS6cTjDxMQMw2HZnPcWJ/7uXDiMnvjqOFKfhc6a3+SijbKl60TY0IUojz1BqgY26QZBANY
 IHaycNsKF9PCKsLJrOhXPvH4oT38mzOv2/4uNxg10W06GxTsfuQ1N7N
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

This series adds support for the PCIe0 PHY found in the SM8475 SoC.
The initialization sequence varies noticeably when compared to the one used
in the SM8450 SoC, hence the need to add support for this PHY.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Split series in subseries (pcie, usbss)
  - Sorry, it should have been like this from the start!
- Link to v1: https://patch.msgid.link/20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me

---
Esteban Urrutia (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SM8475 QMP PHY
      phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
      phy: qcom: qmp-pcie: Add support for SM8475 Gen3x1 PCIe0 port

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 109 +++++++++++++++++++++
 2 files changed, 111 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260714-sm8475-bup-pcie-3e3796e61c4e

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


