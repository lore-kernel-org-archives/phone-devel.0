Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189996;
	b=SqbDJHq2YE6dJlprRqpKx+SrZUhJJF+csD+XFQxdRFJ7D/RB/aQz/zS71XUCOCtWvt7x
	 CEtlZCnekahlNBhvRhx+xWmEONiHtjcgLu1DH4KbSuS86ZevsH0kFdhRxaUOVOXJHHPEU
	 0d+fWwX/0u1thAl4udpINKKiiv5qegEG4Qqt/rpjOC2uMMOc2/29rOLI3adLvXHTgygLL
	 D2xpHrKwF+KKX6A32xSDFB98gCdRhJJORVti26JI0ilZ0mmzM7vkjehsSDghduwwAYIgi
	 XeVrMeE65YNBxJqZEMRzn+GUXAYN2uABVsA5DuPUAd+8uVAPfU28MlWDZmI+UnSOtug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189996;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IOTA6MPZ2RgH+Ct/57WykMwBt6bzyadYEPAnkpOToWc=;
	b=yvsfPu2+Rhu4v28r7mGnNQFAChhbmLaAogLRDlh4yuTNaaiAL9FuT4wdHDADvg7SRA1B
	 uALPrXTKy3VL0qaD/zZVzxFHQZN6Wm5pa8o7O0Xejej6rVZOijUEcz216Zhvm6yqqmKpZ
	 LGR0gXL37wCivaxG8S4yzd2Xe7wdsH0zXocOk5H4Fo9FDZxKEfIeNMxoRQxJk5+MJHRhg
	 FJfrct5tMqOvZc9X9nZpQp/NiYZ+VMGBtnEFW42pzuZwRWH1saG6R/UFz4M8Mmv0400sp
	 PrNh3s5JcAz+I34eMjP39st7CONWmYpDiIELp0bdE9lQILLRh+W35pjy6lroKsOS8Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMhDDNke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D6606A335;
	Fri, 20 Nov 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMhDDNke
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189996;
	b=r8rEPHJBnIbVMDILm1c/Ir0wRMn9dJYvthxquAMafNvGrZ5RysTg/MIy8YUMbsF6ahya
	 eEE++Jl3njubjB4nrWR/m7yFc0najnw+yNpPiCtz9nbEV+ld2ASDcqkB7lfEKmbfVUo0E
	 yEEFSGD75FSaknvF7hOLcv9AS0ZC9/SkXbCnOli0JbhMw7K4VEjwDXrM2fnjRPDhXqL/D
	 RzCDaSMmejxPyJmXInqw15IjIhYQvJNwXVy5O4fjvigmmLAj7sl4N5Y7iyiztWYOiritN
	 5+BdsR1AmqfAOlIPukWUziatA1ExebvkcnL83Sem9Xv/W+MAtLadDqsQ+sBLH4HMLnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189996;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=IOTA6MPZ2RgH+Ct/57WykMwBt6bzyadYEPAnkpOToWc=;
	b=GVixAl9IAL34/ty4HPYtG4Kpsb+gxqHPdbg4ybxIiV7EPGg+AvXhN5doOrXUZzgWS4Ka
	 ncTCD02UhtbxWxQ/0xgenqLpvszuEh4IrsYhMfe1epGbfiSGqTNSdjFRKEmJotDTN5HB8
	 ai4ZapolbRHPjuXqMBGovQx3StSjTOMSde61xkm5U+U4cTxdpseDuPCnQTMg59PnL7s7x
	 6M7A0ijpofklpT4XhNNPELeAQKUw6oAD6hc/NF+uzL04nAbqXRAzQGijuwECSdQ6oazGR
	 Ej5O0teTweN4GPD3uNaGMUIxWtTVVeJ9+9uQ3qAeD7mswgTYU9eRbHyJ4MIuijRnARA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 124E91F0093E;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189996;
	bh=IOTA6MPZ2RgH+Ct/57WykMwBt6bzyadYEPAnkpOToWc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZMhDDNke1kzqclalJLhmxZX0FfkuMewmuv6eFpdGRm//DgFzRYUILEj6PxKQTR7E8
	 L8qaKDS2QkyEVqgJ7nEUL9DG+GbD9gmu0qWX+Wo81zqxjRo43No5ckVShEtkjSpY9s
	 UWbOrDAElAtKyVbYUCecVvVQwpvJFHM6oGiR21g4B8WHeYPUjEpKalNAVlB+0JPMQD
	 uK1Jm8W19K3NVTAeCp9rQ4IBWdZt0LgXV8j5plTN11FO4yIRJZt1BLMCRkIoHiqGqQ
	 ZLd9G6++sJej8B8d4NItFQcoiuF/+Y6V3ZsmDuKLcfdC5O+MzQITdgmVkCVDGdBoBz
	 I41D77m+rM/HA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9852D4990C;
	Fri, 20 Nov 2026 15:53:04 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v3 00/11] Add support for the Qualcomm Molokai (SM8845) and
 the Motorola Signature
Date: Fri, 20 Nov 2026 21:23:02 +0530
Message-Id: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQzWrDMBCEX8XoXBVpZauWT3mPkoN+VrHaOEot2
 yQEv3tlpdBC/y4LA/vN7M6NJBwDJtJVNzLiElKIpyzEQ0Vsr08HpMFlTYCB5JxLOsRjfNWBpmi
 p9F4ZUI0FL0gmziP6cCluz/u7TrN5QTttFh8bI77NOWa6r32mdNW3jOk4DNRohlhziQ0X3VJy/
 mIO59la6jQaB09NaxrXLfAfpFtQVFnTNkwJxqHemO2DPqQpjtdSz8LLwT82sXDKqDCAqIB5Lcz
 uqvsYH20cik+2+52FzCpna+fyQCW/suu6vgMTroHYpAEAAA==
X-Change-ID: 20261116-molokai-soc-6ff9b295c2f3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=5487;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=MuRhKKzRPRYpg+Pp93w9+4h10DRmQvIHEm+Z8zkq7RM=;
 b=58B1v9IEGvaBN+S9+9x7p+eFB40A9+foyrfrThQLsxP9nxM55qWSZ4TkK3TyZdd5KyPHyu6X3
 vC0FJcO67+bC99lg/ZSIw5TNcfLXwr4nEwvE1KTOfr8n6XkikqHlg61
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850). It
has its own TLMM and GPIO to PDC wakeup map, a PDC with one more
interrupt range, no I2C master hub, no fourth QUP wrapper, a different
GPU clock controller and an Adreno 829 instead of the Adreno 840.

This series adds:
- the SoC ID (685, as reported in SMEM) and the socinfo entry
- the PDC compatible, the UBWC config and the protection domains
- the SoC compatible patterns and the board compatible
- the second DSI controller and PHY of Kaanapali, which the Motorola
  Signature uses for its panel
- the Molokai dtsi on top of the Kaanapali one, with its GPU
- a first devicetree for the Motorola Signature: UFS, USB with role
  switching and pmic-glink, the keys and the splash framebuffer

The rest of the phone (display, audio, DSPs, thermal) will follow once
the drivers it needs are reviewed.

It depends on the Molokai TLMM, GPU clock controller and Adreno 829
series, sent at the same time.

Tested on the Motorola Signature, together with the board patches that
will follow: it boots postmarketOS from UFS, with USB networking, the
keys and the battery and USB power supplies working.
dtbs_check is clean for the Motorola Signature and the Kaanapali MTP and
QRD.

With the display clocks on the simple-framebuffer, booting without
clk_ignore_unused and with the MSM driver enabled logs "already
disabled" warnings for the DSI1 PHY PLL when simpledrm hands over.
They come from the DSI PHY probe, which also warns without this
series: the clock core prepares the unpowered DSI1 PLL while
reparenting the byte and pixel clock sources the bootloader left on
it. I will report that to the DSI PHY maintainers separately.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v3:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter (Krzysztof, Abel).
- Note on the DSI PHY warnings below.
- vantage: give the simple-framebuffer the display clocks and the MDSS
  core GDSC, so they stay on when unused clocks and power domains are
  turned off (Sashiko).
- vantage: move the PMK8550 GPIO node after nvram@7100 (Sashiko).
- Link to v2: https://patch.msgid.link/20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com

Changes in v2:
- vantage: describe the PMICs as reported by SMEM and the vendor
  devicetree: PMK8550 on SID 0 (6 GPIOs, instead of including
  pmk8850.dtsi, whose 8 GPIOs made the GPIO driver read registers that
  do not exist), PM8550 and PM8550VE RPMh regulator compatibles
  (were PMH0101/PMH0110).
- vantage: the LDOs are PMIC5 LDOs without an auto mode, start them in
  high power mode like the vendor devicetree (v1 asked for auto mode,
  which the PMIC530 table encodes as the PMIC5 low power mode).
- vantage: drop the serial0 alias of the disabled uart7.
- vantage: drop alignment from the static reserved-memory nodes.
- vantage: move the memory map comment to the reserved-memory node.
- vantage: sort /delete-node/ lines, the clocks and the label overrides.
- Link to v1: https://patch.msgid.link/20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com

---
Venkat Yadlapati (11):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8845
      soc: qcom: socinfo: Add SM8845 SoC ID
      dt-bindings: interrupt-controller: qcom,pdc: Document Molokai PDC
      soc: qcom: ubwc: Add config for Molokai
      soc: qcom: pd-mapper: Add support for Molokai
      dt-bindings: arm: qcom-soc: Extend pattern for Molokai
      dt-bindings: arm: qcom: Document Molokai and the Motorola Signature
      arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
      arm64: dts: qcom: Add Molokai (SM8845) SoC dtsi
      arm64: dts: qcom: molokai: Describe the Adreno 829 GPU
      arm64: dts: qcom: Add Motorola Signature (vantage)

 .../devicetree/bindings/arm/qcom-soc.yaml          |   4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  90 ++-
 .../boot/dts/qcom/molokai-motorola-vantage.dts     | 791 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/molokai.dtsi              | 327 +++++++++
 drivers/soc/qcom/qcom_pd_mapper.c                  |   1 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 11 files changed, 1219 insertions(+), 4 deletions(-)
---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-molokai-soc-6ff9b295c2f3
prerequisite-change-id: 20261116-molokai-tlmm-ba0ee416e513:v3
prerequisite-patch-id: 370171903d0f17fe15c388c1656b22e24100153f
prerequisite-patch-id: d6b03a5669eb394f4d58e3945717b563a372db8f
prerequisite-change-id: 20261116-molokai-gpucc-daebd2758b5d:v2
prerequisite-patch-id: 0e6a86461e4d0ff585e2c950c87b4492ec9d96e8
prerequisite-patch-id: 6e286744dc03d7bd7216695a9c9632b22ad41f05
prerequisite-change-id: 20261116-molokai-a829-9cb850930124:v2
prerequisite-patch-id: c3a4e2985176713b54c997f91fa4975db8cdff3a
prerequisite-patch-id: c8fee006e015f2c35033a51779a4f1eb4655dcd0

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


