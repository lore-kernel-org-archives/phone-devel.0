Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E637CD57
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013360; cv=none; b=hvHAl72xMAUXDK5KkHkZYVf9ivFMCLcjigJJYV80BW2Th02eDbyR+K9pun0Tx5vxDCpWttmURyWsfRX5mMsqNztxRgdO3TFuFxnSP+1+YIr4IRU2LvXMIJecrls5xBgLWnqj7HuNe4V61BxVfIdhAjWjoU35UbKKyPDSW04n0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013360; c=relaxed/simple;
	bh=sfr5sGWKLV+7cUgvRiDdpIW68jelrwa3IWn9b6yAFYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoaekjVzF8sXejyF1UtW+kRWbgEFLNaq6g6J55OZzM6j8D0S4l6Sey9ZirFpTe4x+3T+q9ve6L3q8wiyr70YBjy+eXSofs6+WyNM+1QWQXxR/RKLgkSi4Htk/aYkHcimJsOQGtT6JB46bLxMFz0Ve+nL1gP06YilFs6J0hdu40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rNZ37vFi; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rNZ37vFi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS032EvzVpRtfXSTOpPqWmTUv6U6bvbz7aB2vYumwkc=;
	b=rNZ37vFiVJ7a52a8JvW1yYb1biVPo2psn3XbM4MHLjKnNOGarZ6PUomSTaYVtpElG3yny/
	yiir48NXO3o569slUh7m/iv5+NwJLPtzbozBv3pHLkQ/EJsA+/fLmav52W+g12ghPvsC1T
	sztNbm5myVnEW+lCl4i9/q5VeP78aQEqwbJM6qJeriUcKGF5vw8IOI1NKgR1F0FmaM1PrK
	BKAFdp3nT9m12i+wRxSoHTX8w5uOrKs+YmSYOXDe0B3ANeRupMt1ERz5CSXAqfw9o08mrv
	v5vusvycj1lrsXWoASpH7cZZqtuFGSezAuOWW2hrj7UvYaqE2p6sBQrtXE9aWQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:06 -0700
Subject: [PATCH v7 01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-1-87217b15fefb@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=4272;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=sfr5sGWKLV+7cUgvRiDdpIW68jelrwa3IWn9b6yAFYg=;
 b=r3QHidy0VWifypBap8f7UPyRoEJHS3ntq/kvsPXjjSCzmY95s330JxvBf/5Ce/mhMmpyg5P89
 vu9zx2RMdAwDv3eDyzu/c6jO/7Tmz33fCord4cM2wRkO1ljUgvpnCE9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Improve adherance to style guidelines below:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 0ee2f4b99fbd..93ed8f240461 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -38,11 +38,6 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		qseecom_mem: memory@b2000000 {
-			reg = <0 0xb2000000 0 0x1800000>;
-			no-map;
-		};
-
 		gpu_mem: memory@8c415000 {
 			reg = <0 0x8c415000 0 0x2000>;
 			no-map;
@@ -99,6 +94,11 @@ memory@9d400000 {
 			no-map;
 		};
 
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs-region@f0800000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf0800000 0 0x202000>;
@@ -467,14 +467,22 @@ &mss_pil {
 	status = "okay";
 };
 
+&pm8998_gpios {
+	vol_up_pin_a: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
 };
 
 &sdhc_2 {
-	status = "okay";
-
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -482,55 +490,8 @@ &sdhc_2 {
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;
-};
-
-/*
- * UFS works partially and only with clk_ignore_unused.
- * Sometimes it crashes with I/O errors.
- */
-&ufs_mem_hc {
-	status = "okay";
-
-	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
-
-	vcc-supply = <&vreg_l20a_2p95>;
-	vcc-max-microamp = <600000>;
-};
-
-&ufs_mem_phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vdda_ufs1_core>;
-	vdda-pll-supply = <&vdda_ufs1_1p2>;
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	/* TODO: these devices have usb id pin */
-	dr_mode = "peripheral";
-};
-
-&usb_1_hsphy {
-	status = "okay";
-
-	vdd-supply = <&vdda_usb1_ss_core>;
-	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
-	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
-
-	qcom,imp-res-offset-value = <8>;
-	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
-	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
-	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
-};
 
-&usb_1_qmpphy {
 	status = "okay";
-
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
@@ -571,12 +532,51 @@ sd_card_det_n: sd-card-det-n-state {
 	};
 };
 
-&pm8998_gpios {
-	vol_up_pin_a: vol-up-active-state {
-		pins = "gpio6";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-	};
+/*
+ * UFS works partially and only with clk_ignore_unused.
+ * Sometimes it crashes with I/O errors.
+ */
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	/* TODO: these devices have usb id pin */
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
+
+	status = "okay";
 };

-- 
2.53.0

