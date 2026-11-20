Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165189;
	b=N7AipskX7t5Y/J48ppxbiSNopUv7oBmcJbqASUPilY0/jvrnjsOXcZKEat7YBr7wtrLB
	 fme9JOMoyNCPUOYzzxB04d6DDtTHHsJJOROCQMDlm7q/t/0/4kzSbD/7OBiQ4v/SVloGH
	 san62Q1rdaILXxTlR/1Lovl4zybEzgISpyJx6Lj2zXpBydRY/eeQOHrm74To0tXGnMLWx
	 fhMVTNVkbm+Ht9pweXuD1807OuxySXjbqZu8Ho0hnzYcgHkgpPw8jowWCPRg5clYcAi7G
	 GXgYMNNjnw+SWNx5RYTL8W+FljQkt+9Tto4gfDmCKcKfRZip/WSjAwUVsYIsqs+U+lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165189;
	h=DMARC-Filter:From:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=huwLZXOgqNprnOJiV2f34ZUBxS8NJ6q/uGT1VaqAvzA=;
	b=NIdxkoRhjjJE15n/B2QWXgo7nHh27RjNV5iYkxUYTt2f/0Pc2AxPZWMfAlyTWgP1Mm2A
	 VgpvG5k0uLyH0blx2kWwKV3kXc7IPN8D61pO1SOP+hIzk5qhFs9jcZJWlAzo/g5VELIE9
	 yhc8KMbaT200W/r4rA0Atg4kZOiNVhtrCRaDgnrTtSlcdJczJiwgOYa0sC5+qGIRIP1PF
	 TslZvYUWTxh5Ll2YnMoJE3VWxtIdRM59EPUFS6NrWeBZq/w0N7r6lhAlwex+14O7P9IQ5
	 nBLb0P2BlUvGBRJe6lpkTVy9cYsE4zEJFA1eLeLLb3OSc+Un+Tz8z0lID07ZxW2zIKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=2PNQyj8N;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8438606A326;
	Fri, 20 Nov 2026 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8438606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=2PNQyj8N
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1795165178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huwLZXOgqNprnOJiV2f34ZUBxS8NJ6q/uGT1VaqAvzA=;
	b=2PNQyj8NhOg6Fc0Z5YQCI42cuZK0zSd7jSL+y6/8kUFD4mhJiPqZ0dVKh2c6fk1FCiCdfa
	0MuO7EFTLIy6BISJj/XjO2BCnIQb8lOKv38rGNc0nCywvf01Pd8H5RUqq+lEHYrKEcF0I4
	ygrxSVIjAAefemDyw4n6XhRYdzlcVgE=
Subject: [PATCH v6 0/3] Add OnePlus 8T
Date: Fri, 20 Nov 2026 09:58:20 +0100
Message-Id: <20261120-kebab_dts-v6-0-b7ec55f3d04f@fhannenheim.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTU7DMBAF4KtUXmOU8cROwop7VAj5Z4YYhIviN
 AJVuTt2WRBEunzS+97YF5FpipTFw+EiJlpijqdUgrk7CD/a9EIyhpKFapSBBrR8I2fdc5izZEA
 ejNE0sBel/zERx8/r1vHpJ+ezeyU/14HaGGOeT9PX9dgCtbe3u4BsJDARqKa10LtHLi9JlEaK7
 /eJZlHXF3XTq+Kp67E16JgD7nvc+m7rsXjNHr3VymJ/w7dbP2x9W7xzJri+YwbN+17/evh7X1c
 fyv/9wIQa/vt1Xb8BgqJ0mLoBAAA=
X-Change-ID: 20261015-kebab_dts-f13f9665e9fc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 Casey Connonly <casey.connolly@linaro.org>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=qMEViD5fdzTULOf6f+oSM0kqZXSvWaah6bWH4B9dDHk=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDNkM3I+KZv6ZmL5Qvfzog+WXvk3vK0iJa/XIvPxyuvF+v
 jyvWk+7jlIWBjEuBlkxRRbn6ZI/7CuFdfTD/ynCzGFlAhnCwMUpABPRMmJkuCq3UD7T5qtccChH
 YcRt08TDC7I0ea41SqyT4NvY/kK2guGfzez3R07qrJayv/ez5IRqhgiLymmxmOQvuUpfv1/35Lj
 LDwA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Adds a basic device tree for the OnePlus 8T (kebab). Common
values for OnePlus devices using the sm8250 SOC are defined in
sm8250-oneplus-common.

This basic device tree brings up a framebuffer, UFS, battery monitoring,
volume keys and UART. Further functionality will be brought up in
subsequent patch sets.

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
Changes in v6:
- Add Co-developed-by: Casey Connonly
- Link to v5: https://patch.msgid.link/20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net

Changes in v5:
- add Acked-By to dt-binding commit
- drop pon_resin node as it doesn't trigger keypresses (David)
- drop smpc6-regulator (sashiko)
- pm8008: use interrupts-extended (Konrad)
- remove vreg_f from -common as it's not used on all devices (Konrad)
- Link to v4: https://patch.msgid.link/20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net

Changes in v4:
- Order my signoff last in commits
- correct sorting of dt-binding
- Link to v3: https://patch.msgid.link/20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net

Changes in v3:
- create a new commit for dt-binding addition
- reorder /delete-node/s in sm8250-oneplus-common.dtsi
- remove prototype revision msm id
- remove zero-value board id
- reorder pinctrl properies with name at the end
- alphabetically order volume button nodes
- rename vol-down-n -> vol-down-l
- remove zero ecc size in ramoops
- add comments describing reserved gpio ranges
- correct pm8008 pinctrl
- Link to v2: https://patch.msgid.link/20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net

Changes in v2:
- Add dt-binding for oneplus,kebab
- rename power button gpios to match sm8250-samsung-common
- remove unnecessary qup_i2c7_default and qup_i2c7_default nodes
- remove qcom,kona from top-level compatible
- enable i2c2 and add pinctrl to pm8008
- remove unused pinctrl node in pm8008
- Link to v1: https://patch.msgid.link/20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net

---
Frieder Hannenheim (3):
      dt-bindings: arm: qcom: Document OnePlus 8T
      arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
      arm64: dts: qcom: oneplus-kebab: new device

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 525 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 125 +++++
 4 files changed, 652 insertions(+)
---
base-commit: 330fcc4f3d0bd303fbd9e2461dfc10ba893768fc
change-id: 20261015-kebab_dts-f13f9665e9fc

Best regards,
--  
Frieder Hannenheim <git@fhannenheim.net>

