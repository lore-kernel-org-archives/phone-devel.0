Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8E37C112
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 22:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884337; cv=none; b=ssx3x/xGKWqw5pHMV7r53VjKO7vMLfqXxMnZqjACnmN5rsYvleBzt39bh1GkB7ZKMUGjHRFr0sgQPbUMbRZHRRO4CVqEZeBo6H4AMOLcoZj/D0y1bIXzjMy4Ta7Cj2A3ZEglZK5b00QN1LXdtiKId9u/r4zMiHf+f0xqjzQj4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884337; c=relaxed/simple;
	bh=iJ4CbTCrYdLmFrPnd8AD2DQXbeKk4toKBexKglpoUVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4GlHwZHOBrBtG0Ef0X+XCrJrg618N1VmiY64tgMKr3jya+7sUC1i/tFMwxyKreoBP/LApf09foa4NWgSZ5VBvXqBvu9cqKeY9c8hF9UY5WExCg7hARW68UgguQXILEP29dQYACim+yQHzKSVCg/aO7V3CcvkGDp9jKgHkyXtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=sDVSFi+Q; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="sDVSFi+Q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgbEvxCqnxS2xWV0vKpYj1iqUy5PwFQB8T1ITONd/tY=;
	b=sDVSFi+QofqC3UwKp7uh5iF1KQAg1iW5fNL8K3nBvK/KYl2tnEUBXtCYVxqDjjqP08D0Gm
	JQSHcqywRIBxmvInqISR+/LluT5F5ssRo79BVvzq/Sp81zwM1c+TyHDppZjGYTzxKxBA1S
	lr7pwD7AYfgM/kXK+2h3Gt9ZV7MjhDOvf5BRm/vTh2K6aoFV6/56s5aTl+yhlgk01LFJ2Q
	3pkFDgs6kLJspHP82IKYcliU17x5UaaYPvewnQkpWC2BhyLUAUISRTWYNPUOCD98Gl8vR6
	Gy0Nd52XnqoZVKUNwR4haWAtdzK5qwg2FKBRzV1oX0DaIeTOfH39lNZbpjwy1g==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916-samsung-fortuna: Move SM5504 from rossa and refactor MUIC
Date: Mon, 23 Feb 2026 22:05:12 +0000
Message-ID: <20260223220514.2556033-2-wonderfulshrinemaidenofparadise@postmarketos.org>
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Raymond Hackley <raymondhackley@protonmail.com>

MUIC varies on fortuna/rossa devices, which could be either SM5502 or
SM5504. Move SM5504 from msm8916-samsung-rossa-common to
msm8916-samsung-fortuna-common and refactor MUIC.

Disable MUIC by default in msm8916-samsung-fortuna-common, and explicitly
specify them in each fortuna/rossa board.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../dts/qcom/msm8216-samsung-fortuna3g.dts    | 18 +++++++++++
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 32 ++++++++++++-------
 .../dts/qcom/msm8916-samsung-gprimeltecan.dts | 15 ++++++++-
 .../qcom/msm8916-samsung-grandprimelte.dts    | 18 +++++++++++
 .../qcom/msm8916-samsung-rossa-common.dtsi    | 19 -----------
 .../boot/dts/qcom/msm8916-samsung-rossa.dts   | 18 +++++++++++
 6 files changed, 88 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts b/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
index fba68bf8bf79..aed90c8089aa 100644
--- a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
+++ b/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
@@ -16,6 +16,15 @@ &battery {
 	constant-charge-voltage-max-microvolt = <4350000>;
 };
 
+&charger {
+	richtek,usb-connector = <&usb_con_sm5502>;
+	status = "okay";
+};
+
+&muic_sm5502 {
+	status = "okay";
+};
+
 &st_accel {
 	status = "okay";
 };
@@ -23,3 +32,12 @@ &st_accel {
 &st_magn {
 	status = "okay";
 };
+
+&usb {
+	extcon = <&muic_sm5502>, <&muic_sm5502>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5502>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index fb790b02736a..fd62e82075c4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -144,14 +144,31 @@ reg_vdd_tsp_a: regulator-vdd-tsp-a {
 &blsp_i2c1 {
 	status = "okay";
 
-	muic: extcon@25 {
+	/* MUIC/extcon varies depending on model variant */
+	muic_sm5504: extcon@14 {
+		compatible = "siliconmitus,sm5504-muic";
+		reg = <0x14>;
+		interrupts-extended = <&tlmm 12 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&muic_int_default>;
+		pinctrl-names = "default";
+		status = "disabled";
+
+		usb_con_sm5504: connector {
+			compatible = "usb-b-connector";
+			label = "micro-USB";
+			type = "micro";
+		};
+	};
+
+	muic_sm5502: extcon@25 {
 		compatible = "siliconmitus,sm5502-muic";
 		reg = <0x25>;
 		interrupts-extended = <&tlmm 12 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-0 = <&muic_int_default>;
 		pinctrl-names = "default";
+		status = "disabled";
 
-		usb_con: connector {
+		usb_con_sm5502: connector {
 			compatible = "usb-b-connector";
 			label = "micro-USB";
 			type = "micro";
@@ -298,7 +315,7 @@ rt5033_reg_safe_ldo: SAFE_LDO {
 		charger: charger {
 			compatible = "richtek,rt5033-charger";
 			monitored-battery = <&battery>;
-			richtek,usb-connector = <&usb_con>;
+			status = "disabled";
 		};
 	};
 };
@@ -348,15 +365,6 @@ &sound {
 		"AMIC3", "MIC BIAS External1";
 };
 
-&usb {
-	extcon = <&muic>, <&muic>;
-	status = "okay";
-};
-
-&usb_hs_phy {
-	extcon = <&muic>;
-};
-
 &venus {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
index 677e4e286ac0..15dcfe8234d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
@@ -86,7 +86,7 @@ rt5033_reg_safe_ldo: SAFE_LDO {
 		charger: charger {
 			compatible = "richtek,rt5033-charger";
 			monitored-battery = <&battery>;
-			richtek,usb-connector = <&usb_con>;
+			richtek,usb-connector = <&usb_con_sm5502>;
 		};
 	};
 };
@@ -95,3 +95,16 @@ &mpss_mem {
 	/* Firmware for gprimeltecan needs more space */
 	reg = <0x0 0x86800000 0x0 0x5400000>;
 };
+
+&muic_sm5502 {
+	status = "okay";
+};
+
+&usb {
+	extcon = <&muic_sm5502>, <&muic_sm5502>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5502>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
index 582bfcb09684..268277c1caf4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
@@ -24,7 +24,25 @@ &bosch_magn {
 	status = "okay";
 };
 
+&charger {
+	richtek,usb-connector = <&usb_con_sm5502>;
+	status = "okay";
+};
+
 &mpss_mem {
 	/* Firmware for grandprimelte needs more space */
 	reg = <0x0 0x86800000 0x0 0x5400000>;
 };
+
+&muic_sm5502 {
+	status = "okay";
+};
+
+&usb {
+	extcon = <&muic_sm5502>, <&muic_sm5502>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5502>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index e33453c3e51e..5b08f0e11105 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -2,28 +2,9 @@
 
 #include "msm8916-samsung-fortuna-common.dtsi"
 
-/* SM5504 MUIC instead of SM5502 */
-/delete-node/ &muic;
-
 /* IST3038 instead of Zinitix BT541 */
 /delete-node/ &touchscreen;
 
-&blsp_i2c1 {
-	muic: extcon@14 {
-		compatible = "siliconmitus,sm5504-muic";
-		reg = <0x14>;
-		interrupts-extended = <&tlmm 12 IRQ_TYPE_EDGE_FALLING>;
-		pinctrl-0 = <&muic_int_default>;
-		pinctrl-names = "default";
-
-		usb_con: connector {
-			compatible = "usb-b-connector";
-			label = "micro-USB";
-			type = "micro";
-		};
-	};
-};
-
 &blsp_i2c5 {
 	touchscreen: touchscreen@50 {
 		compatible = "imagis,ist3038";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
index 1981bb71f6a9..a5106afc3c59 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
@@ -16,7 +16,25 @@ &battery {
 	constant-charge-voltage-max-microvolt = <4400000>;
 };
 
+&charger {
+	richtek,usb-connector = <&usb_con_sm5504>;
+	status = "okay";
+};
+
 &mpss_mem {
 	/* Firmware for rossa needs more space */
 	reg = <0x0 0x86800000 0x0 0x5800000>;
 };
+
+&muic_sm5504 {
+	status = "okay";
+};
+
+&usb {
+	extcon = <&muic_sm5504>, <&muic_sm5504>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5504>;
+};
-- 
2.47.3

