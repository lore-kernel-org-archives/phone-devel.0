Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0E3845D5
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013393; cv=none; b=VCLQFwGc/89S9ieW4vlV4R1POKapKi0hFKi3RE8zsBHWvSWsahp2QNbe5z9VlsYPprfyWbjPN//BOJlwmsg7icQDiDewfQYwud3MliYsHnjlHKVugig6CTHe6nz4ZHaVP3yeodyLH0rXRPc9pL00tcT/ZdS8jzdWK+t6XC6vtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013393; c=relaxed/simple;
	bh=WtfODlgBwX7yesm+Pl3Dubn53r644++74J0MpoGDg8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aB+aWnMbQYSSZE/YFOgVjNYRXPZ2LINDY4N0th/Szn+VCmhcFXkBwbdSMchHN9rLzV70AmA1PHXHuVu3wCre9/cF197ejXEGAvPG4TQl0LTzKsRZ3zFEO7e9Oe0yTs4nNkrp5FZ8ulRiEIH7QPk4/s2kBeBgzfLd2RGq1s0lkvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=gseRJDIb; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="gseRJDIb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ol1czq2fbIURRkUxh5a6uK9xUalCC05SxBCuTCDHo/k=;
	b=gseRJDIbsuOtJP4CYSK7X1JPvCOFjS7wGaawmQijEdi0Oxzu5wetAJisR+86vbj0eqoFtX
	R782LDWaZuFzlaA5pJRpWmg+QsEo3S5ilEjFtu0rxNGAQsRvgd2pwPnRH1xIBb6YcykfzI
	YKYD8PR0ksplNuUtW9opWez4EIwE9j4Jbk3A2To3z1TkqxaC37fydvkcgF+X9EdCpJEyzI
	U3dSE71TVvzXMAo2tMaIULulkVJNVEEGYUruU0nNj9s/YstFbVCRFR3UG+ZFnE9FXBhDL/
	mtwHgOO1PjvzamEE+ep9Wfq2PYlRD/1WhveH3aZROA7Cku9r5shBVikwzS2lyA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:16 -0700
Subject: [PATCH v7 11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-11-87217b15fefb@postmarketos.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=2782;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=WtfODlgBwX7yesm+Pl3Dubn53r644++74J0MpoGDg8E=;
 b=kwWckvircM3VKnxf1OaY7V0sDbmchblpB3rOAIwL6gAT7aEoSca6nq4Ko9EcrMawpjHrK2c7M
 D8R4Ug2tf0ADEyU4KmVM8llDAEY9a7X1kkYGVh1SoL3sGXl26PnROn9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Wi-Fi now works with this patch, relevant firmware and
qcom,snoc-host-cap-skip-quirk

qcom,snoc-host-cap-skip-quirk has not been approved/merged in mainline,
so it is not included here.

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   |  4 ++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 552d9719bede..8481f0cce974 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -670,3 +670,13 @@ &usb_1_qmpphy {
 &venus {
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 7948fe3dbaa2..adf41aa0146a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -175,3 +175,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 &venus {
 	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
 };
+
+&wifi {
+	qcom,calibration-variant = "lg_judyln";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index efca260c3dcf..d244ebdd17be 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -56,3 +56,7 @@ &mss_pil {
 &venus {
 	firmware-name = "qcom/sdm845/LG/judyp/venus.mbn";
 };
+
+&wifi {
+	qcom,calibration-variant = "lg_judyp";
+};

-- 
2.53.0

