Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33337382F07
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013374; cv=none; b=L1kXNR/NuCb7Z8CRe5lcAXUqQDBJbNs2HHQayGgrbpfx6olT2nBgbUmkkrk7Tg3fmoartoZDmSMLRJZ7Ja4BESUn1CzOBOYDEa/dhDKh4ZOMIgq81B4tpabdd8IqbAAbSD0y4h7mrkpbUvJ5ReQvIBchsWzVaQBwF/1W8NPJ7Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013374; c=relaxed/simple;
	bh=vyi3O+pshzmeG01nzP3Kg33X+WAqIlIf0QllZdSZYAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX9o7p60GsngdNQeqOFNMTZLLRWCJWWwm+KeSoH4cH377iV6EG0Bt5HOczM+s4aIXOj7z0DihdZXng8ru1D+sRM0XGmfoBZfFoLmZvQoqfGfLewoLOfJeMHMJtWDvWMJTdK8ZIi4ePmrvd+7X/wXRTXoKsnBDXTXLjlVjyeYwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=je1w40tO; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="je1w40tO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Km6l+SvAgwixRuIvp2J71CGRKML1xx3mzpIdz91b+xc=;
	b=je1w40tO0X98/S0wrtSHW8l1nXcy92Meg6WPjyvpFQkI5UOBMdtBy0kMSG8FiasEK6dpC6
	plK8LO+9sEdNt5dftXP4dpyHFDtJsqNxlbZ/2MynYFm0ez7UPtqDYENw+6TE1DaVLuVtTz
	PqMXS4N35EVQXqCZOI2A+BMAZE6WL3xBuNT2Gnj16+EZkhgmVId7qWb4FSBw5FI85a73Cj
	vn9/IPR3tuDkrHvCf9PmwwJlPRoS+xTJzMb0r4MsC+N2X5XjQkkt6jd4k7nsjbsUwyIOQ4
	0SvbpeSFjs2fZpGzTcf43QmBzCTQ9GTUjzn9AKCMCna4CNWMAWdH3IU8zrGFNQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:11 -0700
Subject: [PATCH v7 06/15] arm64: dts: qcom: sdm845-lg: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-6-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=3502;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=vyi3O+pshzmeG01nzP3Kg33X+WAqIlIf0QllZdSZYAg=;
 b=zZOijR5cH3mEMCw/kKy7bOBR+LQZ7U+xepYxSpsS2qQDPmrp7ScXhX6CZRckLGEsqS/Ag635m
 4NhHkTjdyFZCICO5q6+ZgA6R/vBDGwizuFsdovF6YW6yt61OktX/XkS
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

uart9 is debug serial on USB SBU1/2

UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
1.8V Logic Level
Tested using pololu usb07a https://www.pololu.com/product/2585
and CH340 USB-UART

uart6 is bluetooth

Bluetooth: hci0: setting up wcn399x
Bluetooth: hci0: QCA Product ID   :0x0000000a
Bluetooth: hci0: QCA SOC Version  :0x40010214
Bluetooth: hci0: QCA ROM Version  :0x00000201
Bluetooth: hci0: QCA Patch Version:0x00000001
Bluetooth: hci0: QCA controller version 0x02140201
Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
Bluetooth: hci0: QCA Downloading qca/judyln/crnv21.bin
Bluetooth: hci0: QCA setup on UART is completed

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 37 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 ++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   |  8 ++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 8b7a271b7568..27221b3afb30 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -27,10 +27,17 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+
+		stdout-path = "serial0:115200n8";
 	};
 
 	reserved-memory {
@@ -498,6 +505,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
@@ -548,6 +565,26 @@ sd_card_det_n: sd-card-det-n-state {
 	};
 };
 
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
 /*
  * UFS works partially and only with clk_ignore_unused.
  * Sometimes it crashes with I/O errors.
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 6d6cc197176c..90dd5a2a6f30 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -43,6 +43,14 @@ &adsp_pas {
 	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
 };
 
+&bluetooth {
+	/*
+	 * This path is relative to the qca/
+	 * subdir under lib/firmware.
+	 */
+	firmware-name = "judyln/crnv21.bin";
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index fd62abbb7128..efca260c3dcf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -29,6 +29,14 @@ &adsp_pas {
 	firmware-name = "qcom/sdm845/LG/judyp/adsp.mbn";
 };
 
+&bluetooth {
+	/*
+	 * This path is relative to the qca/
+	 * subdir under lib/firmware.
+	 */
+	firmware-name = "judyp/crnv21.bin";
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/LG/judyp/cdsp.mbn";
 };

-- 
2.53.0

