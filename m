Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019093;
	b=V4jKCyIYMWCci5RAcbvcnQ8qISZ7yytSfqSpgvsMsknmOR8bOBTNVf1KFvHSw2e9nAcq
	 aXPAo9PHEziauUsVJwyMWr6qVP+Yiq4qcQ0fFI+vwtNaypWEoa3l4KtuvfSrYGLFOsy9z
	 tFy3KArSr3JAFoPs1DsrDbp37c4OCXYtY4RB5ZW6EXl97wHVyyBKzidNuNJY8M3X95OWq
	 H66dWhhn7NK8teB7SVXhupRpAnef9QH6BHtqzX/Q/oLCxLlmCegE1yzw7XK0Tztv1/rwD
	 If3uy9kPUQrCBmC+rOT2RTKprbYetdDjHL63Sb5tAu5DmrhMGGRjM6EnGCWwl6nqihg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019093;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ksNtm8+HeT8uBs2nAi4XuNA+EyRPWhfnJxx1w+qIjO4=;
	b=c3fEa5i5+1tKsp31lPi3FeCjK9OJl8ai+0KZjpsoZN+vX9qgnVcyP9ZQELlARWjBqbOg
	 9rbDVxwBGVzHpAWG5pAA54DHyzCfgemjVxsW/rzt+QFsCV7ZH9SEymIPA6GZOGhGk6oF4
	 BbG2do4txjjoS4jQwzI4JqnrxSf18vsnCzL5Pls+6S+iPLJlmW4ZcEKprjZgxpRc2V2xZ
	 bby+AakxMCDTrmL6f/wmYPoiYIBMFYD+p2xYcGfsnkp7NNKBHkJPOcKuxOXgjAFsaYoLS
	 AjXeqjMgs87mPmszUjcoRUzCJpHE4kRV8U+zCkupJhW+Sgpo+grIaiLLYGKPhc3825g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmIgUwsX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F64606A33B;
	Wed, 18 Nov 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmIgUwsX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795019093;
	b=RV2Tof4AirLVC6Vc8dxTqENNes92ilF43wVhjO8mLZ85eU/3BKtvTdUfkrr46LfOVE5M
	 V7RPK2Bg+yTK1WuDiTLQRLIuiXlktrZXu0mN5TTp2KYnxJLoarX+cuj//1rxRm5iTcEAc
	 ktSmLsuaO56xlBcVlRLkDv1fhmhmr1Dl8hQHjYTcZnFMBk/5rpnyZ0R1II58R2BYhAiUz
	 JxiarcxnepTyK6jHfg0VZHnMdyi084GPe5amecHbHvYj6NOsnFGuhl22pqFmVd3t6r1mG
	 76DnycBtHt7dnLHPFsailsbIsP0SLtvOqZQqN5JjtH0Uqn4VQhEAITE9EuvzI2PdeIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795019093;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ksNtm8+HeT8uBs2nAi4XuNA+EyRPWhfnJxx1w+qIjO4=;
	b=E8SYEJujy/qVksv/ZD81k5znImL1MAuGPNMAlF5z5qDzQrXmARXizJ/5c2+szd3YHnp8
	 0OUHjZhgWs2W9StV/oadDYJt0mT5BqoVtt5OzncTunfdH2zU+Dco/Mi0X+xT/IpqPYK11
	 GW3XYLRWy/GFeakytfmjLoW2jNL6Zi8WT7fEdCJ6E5lLka8SrOxUUNbsTRUQUraubyhSA
	 DGdoXbpPVQIh6Clrmg7QSeKZ8Nh9p0GKnLOf7pcRt4whhXxf3pIqeWYhOirMnblGgvLu/
	 pltLns2evLmsAibKTv2rhCo+Ixu/oaOzcWGWijLmtPrJ56RbaALiItUBHhDxGjqGJYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A2C81F000C5;
	Wed, 18 Nov 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019093;
	bh=ksNtm8+HeT8uBs2nAi4XuNA+EyRPWhfnJxx1w+qIjO4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=SmIgUwsXBLJtnXBN3gE/iGF7VNHTiPDbdVjw0qIecxm/1QEyrjbBcX97OP94fV+lP
	 /hwP5vM/6QA3ga9tLwgaVdyl7raSqAVy+cXXSXlbn5/xMrjXMr3uLmR3Y+PIjx6W6A
	 GmaK22he0bEW869ojRZqciA5AC4zJLwgCCcV47s9LOqsuj1IyEwo0gyUVgAkxTqdDz
	 oSN44lkCTZd0vysQ7eW4aWk9brGqBTNCMwX8pu3WFx1X6qHZPHLhkF6Oh2pLqUlNtM
	 QjLR2PbnbJSNWQyE851Pw+HQp2CSEF2/LPICnaSUc3Dk92Qm6v1s7GRyeDavS827V1
	 Y/aNKU6C1eknA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 716D74AE40;
	Wed, 18 Nov 2026 16:24:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RESEND v6 0/3] Enable DW9714V camera focus coils on SHIFT
 6MQ
Date: Wed, 18 Nov 2026 17:23:55 +0100
Message-Id: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CTBuRRU/+SixDB/NzKk3xD/txNPor4/d5Mzcm8+QFgI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq/dFS+hD9wtEe+u5vVhlFQhFfaPSmNxNNkFHs1
 Je0Cf3KzPOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCav3RUgAKCRBgAj/E00kg
 clfXEADBiIu6BpPHI3h56OMRfTYGUECG2wUUJNaZaCkNL+PvttQdU/pYDVR+hLQfvqPc7VoQRWI
 g1pWxqXQNGSfjnlSy0jMLASyVNU95ZOo8uby5+KcMWBcR9f2IKcNqcSWmDM79JzfE5jJN4bVGot
 JIFrwnTV+lAZvcxjJhHcw1griDLq/AwPURGgSS6QyQaGaUPdns8rzPDHvn1p1fZn16rnqZzipvy
 e1M7edFCo6SRCBmW//OsPNI9iIfpLBmzAr9I6Kn+4sJubwaGWNelhPoFjOPJYmEnpQhKLZF2muA
 UnoEu/glCQfCTTu9UhvVpbGiFdyyjbfdFYmCP6qIGr4elKDP6kuHhz6Z9454cTdqAHvE1Neokic
 cUT0KWWV4X7lWu9hzuM4OXRrRbXEFjmL6mIosmu31WaY43y7WQQFgE5+utdrhmLmfmBEaAqHys+
 jQNBzVse3Jx1LxQ+hS1l81oxMVpEmDrvLiSEXW1LSQCgquL8J9Y67kb02AIFn/kdGN3FcF7ls0g
 jpFkl9T1iUZXGhZpVEKY6AiwA16wddXDQKUlVTOaA6FXczTtGXQLw8ux3geJ54y5wWK74scVvfP
 R430QRKXSCf/gAcyCGQB4dzushTUm2pLcb/xIu1KApnmLKCq/3Ogr5YgF8B0xGTVy0aIql91C4l
 6p1jLX6v+Q8iuoA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Implements wiring for:
 - SGM2036 linear regulator used to turn on the focus coils [1]
 - Dongwoon 9714V focus coil used by IMX519 camera sensor [2]
 - Dongwoon 9714V focus coil used by S5K2X7SP camera sensor

[1] https://www.sg-micro.com/rect/assets/efa85993-263c-41aa-9274-b488f59f85d5/SGM2036.pdf
[2] https://datasheet4u.com/pdf/1247146/DW9714V.pdf

Open question for future work: modeling the I2C bus supply.

Like many similar chips, the DW9714 has a single VDD supply, but its I2C
lines go through a level shifter to a 1.8V rail, and there is currently no
place in DT to describe that rail so it gets enabled during I2C access to
the device. As a stopgap, this series models it as an always-on, see the
comment in the vreg_lvs1a_1p8 node).

Direction agreed with Rob Herring and Mark Brown on IRC:

 - Modeling the level shifter itself is overkill as long as it is just a
   supply; modeling the connector would come first if needed.
 - Since each side of the shifter has its own supply, the proper solution
   is a generic 'bus-supply' property valid in both the I2C controller and
   device nodes.
 - Defining it per-device-schema would ideally use an I2C equivalent of
   spi-peripheral-props.yaml, which does not exist yet. The pragmatic
   interim is to define bus-supply in i2c-controller.yaml for both places
   and add 'bus-supply: true' to schemas that need it now (dw9714),
   deferring the peripheral-props question until more shared device
   properties accumulate.

Once bus-supply exists, the regulator-always-on workaround in this DTS can
be dropped.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v6:
- Mostly resend, rebased against next-20261016.
- Link to v5: https://patch.msgid.link/20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz

Changes in v5:
- There is secondary rear camera with the same AF. Tested with the
  camera (not upstreamed yet).
- Verified the both rear cameras i2c addresses, added comment about it.
- Link to v4: https://patch.msgid.link/20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz

Changes in v4:
- Updated DT bindings commit description. (Sakari)
- Link to v3: https://patch.msgid.link/20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz

Changes in v3:
- Multiline compatible. (Konrad)
- Dropped output-low from avdd_cam pinctrl. (Konrad)
- Then dropped whole sleep pinctrl state, as it's same as default.
- Reworded the TODO. (Konrad)
- Dropped camss node. (claude)
- Moved before cdsp_pas (sort)
- Dropped unused regulator label.
- Switched the i2c bus shifter with the regulator VDD, as previously it
  was incorrectly wired and keep always-on on the i2c bus shifter.
- Link to v2: https://patch.msgid.link/20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz

Changes in v2:
- Address Sashiko findings.
- Link to v1: https://patch.msgid.link/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz

---
David Heidelberg (3):
      dt-bindings: media: i2c: dongwoon,dw9714: Document DW9714A and V variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for main rear camera
      arm64: dts: qcom: sdm845-shift-axolotl: Add actuator for second rear camera

 .../bindings/media/i2c/dongwoon,dw9714.yaml        | 14 +++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 89 ++++++++++++++++++++++
 2 files changed, 100 insertions(+), 3 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260416-dw9714v-4566465ebe7d

Best regards,
--
David Heidelberg <david@ixit.cz>
-- 
David Heidelberg <david@ixit.cz>


