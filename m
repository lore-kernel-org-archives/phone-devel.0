Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FE38550F
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318078; cv=none; b=orGMaN9JOW3remjP6CCV2O0zrvgzUyXkfi04YjCNO0txRS7zaDHdxw27hi81Kc0GLUSIH5injq7TI3fGGJDw0F2uj3Fm4A/qm+MijeqpEmRJxblLF6mBpNPyDXRM3a3mfDFR8tBUTqc7orYwwScDKmM3kAS5ljRfJ1P4eGVZA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318078; c=relaxed/simple;
	bh=XaozY6V2l1QaklKTYNvOo8aGckeWG+irOY45x7wNvWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQfcrIhQuWOtAzTWAR2sIkmv8xXi+JbZFiJoKoUMC28M7LuX0Y42pq0D5OS+RUt8F34ypWSMVB7uEowVme1/+br5DpvF4f25UoSagtTRGu/M6p2f3gD0t9fju4kH4A/X6u+7khrOrPczMWnIGnNeirvwCrsSU5Z4btinzz1ibZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=lFKf1hT4; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="lFKf1hT4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw17GBMFZmAjhtDuaY577SOgpTPzKTiS0e2bSIgBtzU=;
	b=lFKf1hT4N3Y3swQ0UTVqkaSvDdP6qjMzKoC4XNfbNBHgcS+Q7bbppWGk60JdriK9Pg6TsL
	unszbBMdcLH5WBVR9k05CjKwhSxlerlxvQoVC11CIwuBagnaK22sSUTLOecsNlUGhbzJC4
	3vmJUndlzWRpCZIHxAsiRV0w7OAIYvErTGmCmNbxMZcvCYhqufrxXzTNoktV7Yr0OPKUNV
	Gxj3SPXq0lSazA3ngfEStul8oM9C4xm6cluIRBLD/jnBY8XQ74ynBPSj0GWKpy4EsmkW6a
	rxvJVlMHjJfezS3AtasVFoT+jJ8gXzPVge0lT2+/xb03tcbXFO8GcLefUFde1g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:34 -0700
Subject: [PATCH v6 04/15] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-4-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=2873;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=XaozY6V2l1QaklKTYNvOo8aGckeWG+irOY45x7wNvWs=;
 b=6BjWxtPp/RU0n5GNOnrqSFXiUiCj5+dkXaNnaOWOVerPiOWv0GwP50ZarPez8AKg08MQasjej
 l0r2bI90VgzAXayDDDZkuDCygqtpyTdbQAWgwpeB7IxjtWoIOnrrTRo
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
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index eb8de8d01177..57badeff16a5 100644
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
@@ -490,6 +497,16 @@ &qupv3_id_1 {
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
 
@@ -540,6 +557,26 @@ sd_card_det_n: sd-card-det-n-state {
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
index 09bfcef42402..e530a08f5e27 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -43,6 +43,14 @@ &adsp_pas {
 	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
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
 	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
 };

-- 
2.53.0

