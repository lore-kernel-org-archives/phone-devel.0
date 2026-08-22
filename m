Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6B2D7DD7;
	Sat, 22 Aug 2026 05:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787375744; cv=none; b=dQ66TsJHpghYmQYZcUjiIIVXUBne+KH3pmQM/fpr27VehyztH5PqCBhsdYG0cC/U9QM737eS252k9/pdFWR0ToTijykiDlFqb7knYQqGtYUMOROSW0nPATK4FKqJ9v3PbTkxaZViAAQM/Jq7N862lSR0soiy884hA4KVG4Igkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787375744; c=relaxed/simple;
	bh=OWTXtyjeFMgy0pedbYElIbBJks0vaqgsTW1iYCsAdKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db2BMztyp8P9yvgPYh1InpB+WIlZ7BWFXBt6dICnUEh617J93Sb+ocExlcsm3CjgSrVV53qnp48/bW4F6nH2FhYYbSMFtFJCmNzH72Lq4/ykrBUdap+ZsNA+qzE1BEv4YI1q7XDlLLywf3eZ1n12p691XNuRDlBZ9Wh/+oCpVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L235ytuR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L235ytuR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0D40C2BCFB;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787375743;
	bh=OWTXtyjeFMgy0pedbYElIbBJks0vaqgsTW1iYCsAdKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L235ytuRZR+xYkEiAb2REwcHOnViH69cR3GVrRvaAsdAh5+RFhV9U9wd8UoGF3lYb
	 aSq1Mq9A2hg4hMDnqdTfUv31t8br41d4mZa55H826pvSPZ4ZsPKBF3pPZHLmUKbWNS
	 bZIv7pHemqZ6Q/bcnHQmjJURSoO7xyj4itcMe+bJCBSe3nNKftMPuD/U5X8ToTgNBf
	 ycsVBCU8iG3hYhz7kmgN4WdLcrtYIVscq+w+ADsbnaAPfB4Y2FFWtsDwfuPsvit4Lq
	 fVtVpMNsUmKbfK07u6x2Ela8nX2fy9vBuNyc7M7/OpziN3Zz4o7mGsDVmXrO6ohujp
	 vywH12viBetHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A8AC5DF97;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 22 Aug 2026 07:15:18 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
In-Reply-To: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MkyskRm5zOC8VqbKWX20phVUAB1U8R05LT18kNWIUpM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqiTB+CyUjVppimaT5DUyiV2e9ZL4gfGthq6h9C
 mUY+80SfqWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaokwfgAKCRBgAj/E00kg
 csfCD/4/ps9N6J2gP7/hTbN7zynmdRUAlJZvBriMBvJpksogXr3sma8kirEKFGCo+zS1Ib/LsXM
 dXCvxsf3ZEywTrFuHBibmXQ65kTuBl4hp8kmgvMSrmySESqQe8KA7SVp9e1ColXl+1J6YJKdEzx
 C7k/CTt8ep4OM0z1baavJVsGQ6PduXlrrMCiMEU3OEK8fGcy3bntex4dFAM9XI986zpQ3huWzNo
 TOrKjvIHvBYHKycWVxl3G8NagEEPz8piaraWaxvVnKKMZ/sqFoh7B6dd5rEnDkrgAihHkOrsCB9
 UcntNKi2EHv8CeqsK7ALYAnffHbOY5sYa6FTlqQTZZXkcY1GalqRy3Ewvc0T1K04wq4BD1speyW
 GvsE/cxL2h1+gh3gqk49Y7gHaQCFTvsWjGML6Rnl0BaVQpwhoebM3NGZEUFUGCVD5wfE92GH5vZ
 +zk32BmMMAUuoqkKoaXnY9dxVcAspCmfzsD55qYlc2mjdK/025mH6XX3UYUDzXpQCwasE8ZYUVw
 4ZNHjM4O3LH3nEz/21i5Jb9GFA6+10+kXJ+VWmzNgbwzHHiLK/ue/k/YPUrHLoM+h0vrTh7WzTR
 LXNPkoL5NdkhDERCJ9tTqZXM3e7xJtqTCx7qNZsrJzW2DCVc6Vi/tQouraFiQk8wzXRj6Tnn8QS
 ylaoqhBaiimYiFg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
actuator is a Dongwoon DW9714V.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index f14fe8e175e96..3cfc11127f5e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -99,16 +99,34 @@ cam_main_af_2p8: regulator-cam-main-af-2p8 {
 		enable-active-high;
 
 		pinctrl-0 = <&cam_main_af_default_state>;
 		pinctrl-names = "default";
 
 		vin-supply = <&vreg_bob>;
 	};
 
+	/* SGM2036-2.8YUDH4G/TR */
+	cam_rear2_af_2p8: regulator-cam-rear2-af-2p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "cam_rear2_af_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <100>;
+
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_rear2_af_default_state>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
 
 	vreg_s4a_1p8: pm8998-smps4 {
@@ -484,16 +502,30 @@ camera-lens@c {
 			     "dongwoon,dw9714a",
 			     "dongwoon,dw9714";
 		reg = <0x0c>;
 
 		vcc-supply = <&cam_main_af_2p8>;
 	};
 };
 
+&cci_i2c1 {
+	/* samsung,s5k2x7sp @ 10 */
+
+	/* 2nd rear camera actuator */
+	camera-lens@c {
+		compatible = "dongwoon,dw9714v",
+			     "dongwoon,dw9714a",
+			     "dongwoon,dw9714";
+		reg = <0x0c>;
+
+		vcc-supply = <&cam_rear2_af_2p8>;
+	};
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/cdsp.mbn";
 
 	status = "okay";
 };
 
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
@@ -749,16 +781,23 @@ &tlmm {
 
 	cam_main_af_default_state: cam-main-af-default-state {
 		pins = "gpio8";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
+	cam_rear2_af_default_state: cam-rear2-af-default-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
 		cmd-pins {

-- 
2.55.0


