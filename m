Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882FA30675C;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=YT+K/tezk4dkRJjp9hz/I13vIFaeGgSl19gtbQ7aetmMTRIB3SDXc07Tx/2MkUxrWSVa2OhYUraob12JL2EKx/ummCLLB8OqnMgeSMvZ/Z68eEk3kAMSOjvGk0jxOVJtFcTDSxe7F18IBo2D4Oq1HpNRISIGDY7D+XRmkBJZS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=loOVyJQdNo2C/7b6M2ZU7HXekbM+vRvrsTr0PcS5i0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b7liqVKuxDTRW76l8UtNjWijA4uWcsLfp1SscoWepFU4zF9yZPwHiOqqpAaEb5BeF1eBjv/BgACK5vs/qT3z4QNAym6GBl4XTjVxlLYXELg09sZXcLM+3rTV5yZxMMCbj+TSbWMYKSD3PIstBU9KHEKe5xRz+F7jSIqA6i5WGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbsZ7DbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbsZ7DbA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 267C0C2BCB8;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=loOVyJQdNo2C/7b6M2ZU7HXekbM+vRvrsTr0PcS5i0A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cbsZ7DbARYYRKCkPeeeSd+fbI4nSJXyAanHl+adiOga5VyzRQaOB6NMy0Ri7C8zXK
	 Laoy22nWdcdoExHig7apqoWZ7WAkQ0sJtIwXhSe+gUCuPHFcC77E7EVeZkMC0jlwsm
	 pQ7Q3JyBYt6OD0+uiSk2Wx+LmfKf4wcwteaowGQ6YzxNrTRRWTcsy/Nw0uX54LjlQg
	 K0Xm44KjH/3tVrA9itvShiuVJc78JsWYx5uf01EahMissc5AcW5UPQT43n0Ip726x3
	 2yKrjpgPFJNbdhB5exPnWNk7De/4G6RZI8Ccvmif3IsibNgRJHqimAFBBH1rX0lPkZ
	 GLLBQBpZrHp8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072D8C43458;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/6] Initial PCIe0 and QMP USB PHYs support for SM8475
Date: Tue, 14 Jul 2026 02:36:38 -0400
Message-Id: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWpRrVxFbHQGozETzqIRNxds
 fwW713AGAgZyuSCgAcxLXNElibgh2buUVAbDUqqQposFzzZ3Gjh9lVob2WrO+mUayAGa8COzm9
 W1b95dyP67T3AfT9v8AbObgAAAA==
X-Change-ID: 20260714-sm8475-bup-5c80d5f0b2ba
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=1233;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=loOVyJQdNo2C/7b6M2ZU7HXekbM+vRvrsTr0PcS5i0A=;
 b=2itTSQOEtB51eyLG5Ly2sH889FWi31qrOSgVL8uSfy7U8P+fKSBTFKWN5YEkKPK7gJs2Df/H2
 dOWy4a03DFPAiwLJ2r6Y0JDnVtWIDgpSzBNshzM3bkrsB1POy+5cDDL
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

This series adds support for both the PCIe0 and the QMP USB PHYs which
can be found on the SM8475 SoC.
The initialization sequences vary noticeably when compared to the ones
used in the SM8450 SoC, hence the need to add support for these PHYs.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SM8475 QMP PHY
      phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
      phy: qcom: qmp-pcie: Add support for SM8475 Gen3x1 PCIe0 port
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8475 QMP PHY
      phy: qcom: qmp-combo: Add serdes and RBR/HBR/HBR2/HBR3 tables for v1 DP PLLs
      phy: qcom: qmp-combo: Add SM8475 support

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 259 +++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 109 +++++++++
 4 files changed, 326 insertions(+), 45 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-sm8475-bup-5c80d5f0b2ba

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


