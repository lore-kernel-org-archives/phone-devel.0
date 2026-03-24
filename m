Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0947B388E5D;
	Tue, 24 Mar 2026 02:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318091; cv=none; b=CbfT8aVekZ6YlxMwAeCIvJFwJm5H7d8WQH+a8cPv9LdEr0jiDKH0fPLftWqkxz5uSQgXmi+KyGhrdCHXfz6W4njWSefGguJ3/im1fScrXNtStFvOYx6AK1CC4P85alPrKshyfVWsvfVH5ScrlNd6HdWPsNBE0Iwf5QcT//YiMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318091; c=relaxed/simple;
	bh=AzKDgs0rCjBjWbO7qK+khHoY9WMVP4plAe6eQbC+yes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAyNPKs+LcpUHBtougQWPDoHOfwmb3g4L9e1eiMbTLDvo4dkd1mW1hNmRZY9uRccyHucAFA+Q5OMWC6MGPYlfRZQtSA0X6NJd9R4+uFzhE6+tH+aRHsqFvtKlD5EwRGAghmvLYYTEhd1kUpBIGKGRAF1T26Zw0QyVtm1kbdNVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=oo2hHfIg; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="oo2hHfIg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMTmoqcymrxjxTJckrDC3EryZgpqLUQFBkpwITrs+cY=;
	b=oo2hHfIgLIwrc84S9whOJ6thHWfk8r886a02o+y9F5Aa+lSbILZhNi0tW32FlJ6w/Uk3yn
	VCB8Q8U2yJmhggWH1iYp418n6UeF+wfJ9DBTUnpvvw6Y4Wh4HnH7j1O4ntAk/hX/XpsDNW
	uXLpX6O4bGbgbn+3GcvnRqY+0Px71vveQlHJgL+Y/11TZmAZgPLASo1jJ4G/Jv7PjICJnG
	gBWf2xjlfW8I3OYr81h6lHmL79AyyP6RgJFOS0g2KAcVsMk2NlYJxYpJvHztUQmz8tMjXA
	YzvSXULsQ9JAVlIO01G6+g82TarXNvsqUctDEDY5uPH5bTdFnEhws4iLR8rITQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:38 -0700
Subject: [PATCH v6 08/15] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-8-29d70ca1651c@postmarketos.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=3286;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=AzKDgs0rCjBjWbO7qK+khHoY9WMVP4plAe6eQbC+yes=;
 b=ppIrOWWN5ZOrR0A6pVe+BFyqGkiCuuga5DOunmHtYhHXXBswxdoNdyth/kTGvwi8UTEb1oGzy
 Gtzioteyt39CJRDnxY3UsHRkLVP6bDv9/Puw2/nfyYx46bYPjhc+wF7
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Also include other supporting msm drm nodes, gpio and backlight

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 68 +++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 7b0e14d3f57e..a5a04ec11eb7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -450,10 +450,6 @@ &cdsp_pas {
 	status = "okay";
 };
 
-&dispcc {
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -517,6 +513,15 @@ led@5 {
 	};
 };
 
+&pmi8998_wled {
+	qcom,current-limit-microamp = <20000>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,switching-freq = <800>;
+	qcom,num-strings = <3>;
+	qcom,cabc;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index bbfa709048f7..46119630d721 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -21,8 +21,6 @@ framebuffer@9d400000 {
 			height = <3120>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
-			lab-supply = <&lab>;
-			ibb-supply = <&ibb>;
 		};
 	};
 
@@ -67,6 +65,51 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	display_panel: panel@0 {
+		reg = <0>;
+		compatible = "lg,sw49410-lh609qh1", "lg,sw49410";
+
+		backlight = <&pmi8998_wled>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		width-mm = <65>;
+		height-mm = <140>;
+
+		vsp-supply = <&lab>;
+		vsn-supply = <&ibb>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+	qcom,te-source = "mdp_vsync_e";
+};
+
 &ibb {
 	regulator-min-microvolt = <5500000>;
 	regulator-max-microvolt = <5500000>;
@@ -102,4 +145,25 @@ thinq_key_default: thinq-key-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_sleep: sde-dsi-sleep-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active_sleep: sde-te-active-sleep-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };

-- 
2.53.0

