Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190008;
	b=4+y7mILMwzGJz+lYqOjIBhZU5sAt+WqkdUpD0GuV6teig/cT40F8zrpsKpZEUhYFjZDj
	 GTWIrvH9Ghq7AVTT32O8Ppibus70rbEzP4CONSPl9JblIKfXev2mjpqK0YDr/e4JhWoS5
	 bT5l2qj35wpyNRtppCkomuDXCFxKAILQitJy/4XMM/MGS+coildWXcEkPmZTgyIY5FJdR
	 rAfodJvuyy2vIj+gzTgGv5NOzko07nmnhK8mwyOEMtFRqklMjXrYmm8s6UQkHDUyDl+VT
	 EazMzrOCB2wYYzhjuUrrMeS76vIBqnqXcMCNCWOeo31jIXdv2BtIez4LoNTRiJJzLrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190008;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h52WnGgTA1yuEWFQm/o2bbiViBSZ7ApETccGmr821cE=;
	b=nCJ+iJH/F6lz2hCYe++BSXnK/792x3J2iM+VvLeRBNFWLbbGF73s3c8/GQRFvPXh1rW8
	 DYeY8rDFj9FfRN0uT5e114bzDouaiecrwHpZFXa+ISU61y9oNbdP+YzK/KwRVa3VHe19e
	 CczTrE4+uBTFVxgFfperj5qcd8UFdVBW6sdDI/iLnPsBAPnZBd8UkyBv6UbPZF/5Gimgb
	 hPpPIZByfwwvUD1eLPPz/sZIsCIemb7gcl4rfAccW1zbrydbjpz0FpneY141wXV84wLTm
	 I1lv9HrF1suqg2/95thfEamw5pcEPu16RDsANNmMJ5quq0f1Yk9MX9Uf0RfWmtehxOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9hj72R2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0460A2636;
	Fri, 20 Nov 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9hj72R2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190008;
	b=dEtP6sWFiBIH3XsPHXkm4CAceiWJrlaipSfE0HjhR6njHTKVxPQBS/3QgQKKo+gYnmB1
	 08N2WVs0WUGq5G+BtHFDkG16oQ1VnS+9xKiLAxH+/9BAMWm9xKE2g7vpXXKAJFXne9iNV
	 XvKZXDgVWs4FkzWlgCMbiFdHNGUNWrdVTJ+xTDS0VlSqPt7N3kXWkPAtHVpWix0zJyshO
	 OCfIHi6R5ZtZhPP2xy2lzyXhuusRCtNmU5rkT4l6emNy6XzB0pUix4UBSPUUzugfrK7Ru
	 Pq+QahCkhcomFFropVdDHvtOd/usCxKT9zfk9zkOOLcKQufqQaZklM5z1ZxJqVYC1Rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190008;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h52WnGgTA1yuEWFQm/o2bbiViBSZ7ApETccGmr821cE=;
	b=Hy6Dv8AcC5cr8p3Xy2euKF16v/DWmLYCHbhK2gwLlSFNlP2A94OhPWf6to5YktcSIyWD
	 ydrzel35GZOrXGP5lRV4b7AyIakynUwNJ4TTFnjP3nflBtewxesBoC8arvv13xt2m/UKX
	 Aibd6RgcnNhfWcoZ4VSWAfP+e6sQkvlkUIRPLOQsECyYpwiXDiBLgYOkfgW7aafAlua1M
	 Sf/VwEEJbaKZaluCjXbk6vkaBO/YSYB061xUBuB6NmqPnl5vDSrPBWrewMRypEvavmmzd
	 gJw/rSMCR9TM5ix6dU636omdBSo3PNhV1BaO2LNCok2AzEIrXSzT7qDe3jVDuVQLWCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF2CE1F0093E;
	Fri, 20 Nov 2026 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190008;
	bh=h52WnGgTA1yuEWFQm/o2bbiViBSZ7ApETccGmr821cE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F9hj72R2PXrbdi6OKBOwubSScubvc1lPL4E3J5PJInYHPjXjGGxrnK0HaE7+R3144
	 3IJczPULGhJZediSBjL57oTHzhSM78INvtDfjhlA69fHmhyPhMwVGyLskZCl/fXom9
	 sAHqCBcg2INmS5V3e0JKL/d0LGS+ELmmFQV9kHwaaQTv7roCjLlsyR91uq4lSUkJIk
	 sSRn9RQFE2syb2wG+vAZwqZG/vSJcNuersmWnLgJurnmV3UhhOCoCipUvRNfLo5vbm
	 eRjrsHclkFJjs4GHyzmOuaKVXdzC33gXbFCZZYLawAiFHiV6DFUowc98Y2H7iayVi3
	 9PuJx2R3beluA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 799694994A;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:11 +0530
Subject: [PATCH v3 09/11] arm64: dts: qcom: Add Molokai (SM8845) SoC dtsi
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
Message-Id: <20261120-molokai-soc-v3-9-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=5059;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=JokOG4obUd63XfS2cq2C3xH7KcXpsCJpv2l07gGe/Dg=;
 b=1lBJITCb7NdORlzKinY8unUYXKvOeMd5ePDIFln8RB3tWcyjtGeyNYk4stX65kfJHtPEg51DH
 44c9Iq5JgrfC193BmsrHuEy++p7cjD5xbf6TxeNLu/4Vw09dK0L2LPK
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai is a Kaanapali derivative. Describe it on top of the Kaanapali
dtsi: it has its own TLMM, with different pins for most serial engines
and a different GPIO to PDC wakeup map, and a PDC with one more interrupt
range. It has neither the I2C master hub nor the fourth QUP wrapper, and
QUP3 SE5 does not exist. Its graphics clock controller is not compatible
with the Kaanapali one.

The SDC2 lines are muxed on regular GPIOs instead of dedicated pins, so
the Kaanapali SDC2 pin states are dropped; boards using SDC2 describe
their own.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/molokai.dtsi | 204 ++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/molokai.dtsi b/arch/arm64/boot/dts/qcom/molokai.dtsi
new file mode 100644
index 000000000000..82fd31bda1d9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+ *
+ * Molokai (SM8845) is a Kaanapali derivative with its own TLMM: the pins of
+ * most serial engines and all the GPIO wakeup interrupts are different. It
+ * has no I2C master hub, no fourth QUP wrapper and no QUP3 SE5, and its PDC
+ * maps one more interrupt range. The SDC2 lines are muxed on regular GPIOs
+ * instead of dedicated pins, and the GPU is an Adreno 829 instead of the
+ * Adreno 840.
+ */
+#include "kaanapali.dtsi"
+
+/delete-node/ &gpi_dma4;
+/delete-node/ &i2c_master_hub;
+/delete-node/ &qupv3_4;
+/delete-node/ &uart18;
+
+/delete-node/ &hub_i2c0_data_clk;
+/delete-node/ &hub_i2c1_data_clk;
+/delete-node/ &hub_i2c2_data_clk;
+/delete-node/ &hub_i2c3_data_clk;
+/delete-node/ &hub_i2c4_data_clk;
+/delete-node/ &qup_i2c19_data_clk;
+/delete-node/ &qup_i2c20_data_clk;
+/delete-node/ &qup_i2c21_data_clk;
+/delete-node/ &qup_i2c22_data_clk;
+/delete-node/ &qup_i2c23_data_clk;
+/delete-node/ &qup_spi19_cs;
+/delete-node/ &qup_spi19_data_clk;
+/delete-node/ &qup_spi20_cs;
+/delete-node/ &qup_spi20_data_clk;
+/delete-node/ &qup_spi21_cs;
+/delete-node/ &qup_spi21_data_clk;
+/delete-node/ &qup_uart18_cts_rts;
+/delete-node/ &qup_uart18_default;
+/delete-node/ &sdc2_default;
+/delete-node/ &sdc2_sleep;
+
+&gpucc {
+	compatible = "qcom,molokai-gpucc";
+};
+
+&pdc {
+	compatible = "qcom,molokai-pdc", "qcom,pdc";
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <58 534 2>,
+			  <61 537 20>,
+			  <84 559 14>,
+			  <98 609 32>,
+			  <130 717 12>,
+			  <142 251 5>,
+			  <147 796 16>,
+			  <163 783 2>,
+			  <165 531 2>,
+			  <167 536 1>,
+			  <168 557 2>,
+			  <170 415 1>,
+			  <171 438 1>,
+			  <172 579 1>,
+			  <173 703 1>,
+			  <174 708 1>,
+			  <175 714 1>,
+			  <176 68 1>,
+			  <177 86 1>,
+			  <178 96 1>,
+			  <179 249 1>,
+			  <180 504 9>;
+};
+
+&qup_i2c0_data_clk {
+	pins = "gpio32", "gpio33";
+};
+
+&qup_i2c1_data_clk {
+	pins = "gpio36", "gpio37";
+};
+
+&qup_i2c4_data_clk {
+	pins = "gpio48", "gpio49";
+};
+
+&qup_i2c5_data_clk {
+	pins = "gpio72", "gpio73";
+	function = "qup1_se5_mira";
+};
+
+&qup_i2c10_data_clk {
+	pins = "gpio8", "gpio9";
+};
+
+&qup_i2c11_data_clk {
+	pins = "gpio12", "gpio13";
+};
+
+&qup_i2c12_data_clk {
+	pins = "gpio117", "gpio118";
+	function = "qup2_se4_mirb";
+};
+
+&qup_i2c14_data_clk {
+	pins = "gpio68", "gpio69";
+};
+
+&qup_i2c15_data_clk {
+	pins = "gpio80", "gpio81";
+};
+
+&qup_i2c16_data_clk {
+	pins = "gpio76", "gpio77";
+};
+
+&qup_i2c17_data_clk {
+	pins = "gpio52", "gpio53";
+};
+
+&qup_spi0_cs {
+	pins = "gpio35";
+};
+
+&qup_spi0_data_clk {
+	pins = "gpio32", "gpio33", "gpio34";
+};
+
+&qup_spi1_cs {
+	pins = "gpio39";
+};
+
+&qup_spi1_data_clk {
+	pins = "gpio36", "gpio37", "gpio38";
+};
+
+&qup_spi4_cs {
+	pins = "gpio51";
+};
+
+&qup_spi4_data_clk {
+	pins = "gpio48", "gpio49", "gpio50";
+};
+
+&qup_spi5_cs {
+	pins = "gpio75";
+	function = "qup1_se5_mira";
+};
+
+&qup_spi5_data_clk {
+	pins = "gpio72", "gpio73", "gpio74";
+	function = "qup1_se5_mira";
+};
+
+&qup_spi10_cs {
+	pins = "gpio11";
+};
+
+&qup_spi10_data_clk {
+	pins = "gpio8", "gpio9", "gpio10";
+};
+
+&qup_spi11_cs {
+	pins = "gpio15";
+};
+
+&qup_spi11_data_clk {
+	pins = "gpio12", "gpio13", "gpio14";
+};
+
+&qup_spi14_cs {
+	pins = "gpio71";
+};
+
+&qup_spi14_data_clk {
+	pins = "gpio68", "gpio69", "gpio70";
+};
+
+&qup_spi15_cs {
+	pins = "gpio83";
+};
+
+&qup_spi15_data_clk {
+	pins = "gpio80", "gpio81", "gpio82";
+};
+
+&qup_spi16_cs {
+	pins = "gpio147";
+};
+
+&qup_spi16_data_clk {
+	pins = "gpio76", "gpio77", "gpio146";
+};
+
+&qup_spi17_cs {
+	pins = "gpio55";
+};
+
+&qup_spi17_data_clk {
+	pins = "gpio52", "gpio53", "gpio54";
+};
+
+&tlmm {
+	compatible = "qcom,molokai-tlmm";
+	gpio-ranges = <&tlmm 0 0 206>;
+};

-- 
2.56.1


