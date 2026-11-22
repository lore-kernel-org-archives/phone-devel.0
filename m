Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374476;
	b=ukozGD8mHbyWx7h3S8NhibKFtwnqWtjGsa9gNw7uKRe2B6WEXwrvkK5/wzrmWiBWT3Ia
	 qBJ29XN2TbWCDy2mOSPNqH9aUZRNIaTpjEJmqgf19LxvmFJ5pu34k4a96ZDqmH0kXQ76F
	 RVIocZSvf/VbHtnHccqYVYwIgvlEsHLcJX5zkJkv54EacPM9GOFvWpoqxp2Sioq/+gQXu
	 6ak+6D0WtkXympI5QwPo1QelMAlrJ5n3+hZl2hsnVr3WZ9GhR0vogTXjG67HH33VLY32l
	 /DdsR79NzUWGVWgWeoFiEtgWZ3A7R62apYMIXvdnCX34ZT8dYWKyO7jhFKZgS10UiSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374476;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=OrkGaSh2IsQKkSXNvE9odO6+7CsDPSXtjpnBXUaKmZ0=;
	b=qXjIBE2/QPWzl/xkQX0DYDn+Dx42r451aW3mhyJQ0U1zm+S0QdSdGDORs1LpCCAm28q0
	 GGEeCTO2gzzZeC3Sk6Pzaj+wxlqjz50QA9QpHUwZxVsO5IbeSvtyWtTUQYJDPZe9wAaRx
	 r3K1IztJM1PziIFNNjuWsKdS4WO6yTiTGZEX1vocH92dRzoTpcReOrO+dbIwZQYCIBYbd
	 +mdYD4CKjBq9Tmu+wupFbP6d/HQburHAEE1OwWcKzv8wxJzcJvMl8vCPjbh9YeubEqnJ0
	 Dl4c3WstvltIpJwOVZI01cx9vZIPGA0y4hpOged2poh9xQql9h4FeppSMWF+oFeX+lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdLvIgW1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93B606A331;
	Sun, 22 Nov 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdLvIgW1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374476;
	b=AE4ClKBnTjMg9/bcXgP5YVn5/IBDagqdjZayL6JsNj6HzgYTCZqm0Lp9NiJMlLNp97L/
	 9iUFILEVjOao8Y4uVo2ayPViN5whEY1g/k7hqdJHY6zUl1Zv3z1K+Lu7Tb4tJnjms1WSN
	 El9jJEliE8jLNMQarMi+OYMoc+sULCR6g5c2kDiwHOG3HFcSS+67X9hkGBe7XSCIecVLU
	 ZR8+/6euogDgofO2tr6YA0uxmeh4QI/am9Lj3iNaadSQ0wlojwXaV2T2lKajj6u5Q9v+h
	 IQyAgaP/h26G5Tx2KfL148IICKNuoTevxZO16ak16ZItsvJA4mDsvQVepjZ+4lHRszQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374476;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=OrkGaSh2IsQKkSXNvE9odO6+7CsDPSXtjpnBXUaKmZ0=;
	b=KqUT2NWqIXK7pf0OCgRtie44/dXJEDOR9z5j3wFo3D+u2anG4aFuCUOAyTPZo38IyAWD
	 5xmFSte1dM0xJvDbs2NRBloucehneIhoU1PvkZNfyLbi3cV3c9lQCD0MNjgvAST6h5+De
	 dKJLSYtbEFdltevCeGtqofhjU5u5gR5jLiPcKknTR7Ql1txh8FO3bfNjiBv6kCQA7f817
	 Q/TtdGDVYvSaUm/01RiC0C1Pza/mhp6s/vM0dZP+JtbEt25ZAg1QyK1PWNCuSXihnOTkz
	 BfWTAdT63yiNOyODdqYjTKuUED3mls0gwFq4pP6RcXcAC5xq0NbO565Cxxo9fQHpT1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BF901F000C0;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374476;
	bh=OrkGaSh2IsQKkSXNvE9odO6+7CsDPSXtjpnBXUaKmZ0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UdLvIgW1e1iysLVU8ASf0psts+yCC/4IeSFz/Dk0GbKuwnsdF6z2EyPsFqbPjZ9Oj
	 EHtXPjIaOAPUk/2g83OJOzCIu1XjEDa1GvCTqWDWbPwjSEzrGgLj6oYXIdedeW3IQ9
	 KxnaBbKoNPSmUI7hgKvuNT+TtPzRfWDITWqtsQESDRgxbvUOC5EoVb7FBe8nk+HPtY
	 JnZMuFO/REQYAV4adcgpCuE4iEvvixccppMBUY12ng2bJG3F+tZWKL0d1LGbCSQ0Nc
	 Xu03ELAGUr6AWfxPzGLAd0P+y71WNsOjoNcxXJkrTamKYYmvlsl5EeCqrtphjhmKiy
	 JJJjgBmVhxTeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F32674C19E;
	Sun, 22 Nov 2026 19:07:47 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v4 00/11] Add support for the Qualcomm Molokai (SM8845) and
 the Motorola Signature
Date: Mon, 23 Nov 2026 00:37:45 +0530
Message-Id: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WR2W7DIBBFfyXyc4lgsDFYVZX/qPrAMiS0sUmMb
 TWK8u/FTqTuLQ8jDXDuneVcJOwDpqJZnYsep5BC7HJS3q0Ku9PdFklwOS+AgmCMCdLGfXzRgaR
 oifBeGVCVBc+LTBx69OF1UXt8uuZpNM9oh1ni9qPH45hthuu3d5dm9c1j2LctMZoilkxgxXgzL
 T5/MdvDaC1xGo2DupKmcs0E/0FagiLKGllRxSmD8sa0mJK+QfdXCoAcbWzn/kPnY34ibiAmdC5
 020QmRijBfKj3GiqnNzGl9XHU+wy16xweZmGjE5L5JgzNSmhZC+dLIUUtpXVcMZBGgKu9Nd6LP
 F0FtfTFPNNdSEPsT8vCJraM8MfdLIVwA4gKqNfcbE56F+NcwaKTG/ydhcwqZ0vnckAlvrL8Awv
 0M8szW1LuasGFrJz6yF4ulze0rtuHcgIAAA==
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
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=6401;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=OLW5IpM5lx/sMbUpLqrEF/UbHsYus5ThDdP/7X/aU2g=;
 b=HTBI9upxer4Av/Gfq1RqmoxoTGnFzs4IoXo9yhN9K9GNT5HvrTXbx8jgP5CmZhmWZaYhmvWKi
 ialGtLwjPOjD5myzl3XUmB4I715QwZyJcp1W0nlk9eeekLYFs7stJBp
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
series, and on Krzysztof's series that moves the newer SoC IDs from the
DT bindings to the socinfo header [1].

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
it. Dmitry's pending "drm/msm/dsi/phy: power up the digital top before
starting the 7nm PLL" [2] removes them on this phone.

[1] https://lore.kernel.org/all/20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com/

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v4:
- Define the SM8845 SoC ID in the socinfo header instead of the DT
  bindings, on top of Krzysztof's series (Krzysztof).
- Collect the Reviewed-by and Tested-by tags.
- Cover: point to Dmitry's DSI PHY fix for the PLL warnings.
- Link to v3: https://patch.msgid.link/20261120-molokai-soc-v3-0-403d763685d9@yahoo.com

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
      soc: qcom: socinfo: Define the SM8845 SoC ID
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
 include/linux/soc/qcom/socinfo.h                   |   1 +
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
prerequisite-message-id: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
prerequisite-patch-id: 6b1cefc0d9809f1e57b649ecdb879e383314f49c
prerequisite-patch-id: 7d4d44b53b5037ba282e2957d25cbdc33897612a

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


