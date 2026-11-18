Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019093;
	b=kA2gyPs8SnHXaXB7HR5j4KZi3b6N8IcZEO548uaq3zjrZrEdWKzNCRPhqPVe9IiF3QVH
	 X6QX17DirLgUS77b+QHhr2ZFz86jC4mhTbl0f8NNrqZg+edl6BSgTKBCiVMCsLFIQzoLL
	 +yfKXDApA6N0FvInTDOhhgNTikj5AMUXWFVtTYPgue8rVH8G0bGGHUegIF/eUdVSzYdl6
	 ZJJBkYuF+ouiI8kw4as5Pb8ex2tacnw2ckhOm4Q5YozFMnHknTFzRSVdZcsCo1SRs2gsI
	 85BODlzp9AkuWxH7biSwZ0VpSg6ScOVQn9zXBDetd/7F/DdOlwZt/1QdP7rMOgwnqZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019093;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sj5KpsIwTUBmj4SDKaAp7l531UhyO06KcqP7nTjAiBU=;
	b=pnj4Jciw9uerKRqECKZletotGHl0ceAVbbbLqgGvw70FFHwi2W+6EzjUnbi+vuPJbOrB
	 yULGA29MILSNNYSaWALCTNlnXm3mjWX69f0PtlwhSjvv+MfVEa6tvptgl8TzUnNAjv7Mq
	 2ZzYDEhpboSsAswVFaHT8pus2lk0WC9AuTIJEJi4wzoessDN9EsUTuiAZ8pGKXGX6tnHq
	 MToRft1D4TJTP5PEgpKmvXC9kaecxGif6BProRNOHstes9eK/FpGk1ZngGj2Ub+UCpwo+
	 IJHj6vNiyAMyu1ZxCdDQ9bT17nDQOO0nAfHu29OV/QyjpxDZ9Y5Eh43C/277KbIOt4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0YW4sOG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D50606A334;
	Wed, 18 Nov 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0YW4sOG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795019093;
	b=Fqs2Z6icoO1t7ft6NyQMucw5blXCJ1+378vbjWdAHdWCCwbXjaXqLoPX7HwjaqSe0D5D
	 gJy4MomaJtfFRFmSOiTIZE1G079QwMn97JCHamuax93w4FsG3NVa+6K/F+i3ksqaHX+A1
	 z2fe5Uxn22BpyUq3iTSjr4zlCHsH6uV/m/GW7DbmHsmA+EilK99BwWv+RMehIXhwz30QZ
	 4xwWLucaVwRgCssjrn3PrVGbzZRMfOl8XS5CuWANBvah/mpofUvG3WZB7HjHpcLn5N2py
	 HilBjx0hna/CJ11FbbuCNBsH3R0TMlE5u1f1mryZKR2t3hiTl23xef4jm7v6EXo3coQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795019093;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sj5KpsIwTUBmj4SDKaAp7l531UhyO06KcqP7nTjAiBU=;
	b=LIifPFaff6sR+83GorAwrq1h3KIHJXGg1il3ifunidTzSOoSVKPQzhkUjxjATY9bKBEr
	 RCDtC+i3wxrOfnD80ebAjPlIin2ib3WDKhmPnIpvWnEk9e+sjpmxHV4WpHf8bTfEDao56
	 qqhWE9EBYw5A2xZQyszwsyJ9ZWWQ0n//0E6FJ9SX4FU1aHh/2Y2LHCpojaJDYaO+kpnqa
	 uGBGDbIGeocZeS8zgJEVQyf44Nj2Up/ZSQvxEKuRgYYqAc3Qu/jZsbau4f8YzREFiOGUt
	 nqtzBypDYJQN2Sz11unu5lRqKHhsTyCgQSfGbXm28Ed6UAkHXIbtQiy5ifPhIIyW3KA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36B3D1F000C7;
	Wed, 18 Nov 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019093;
	bh=sj5KpsIwTUBmj4SDKaAp7l531UhyO06KcqP7nTjAiBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I0YW4sOGZ0Qecw6+IlHOOcREPwXIETai7vF/mdCj8VHf+CJfv1zgE4V9S1bbXrpyh
	 HqmEgSBUQ0BOFyxhNW3W0PaTaVBVEX8+YBahiHDrGs+d33UKoG2CZCYxVuKUE+mahK
	 i8PDMiGzQZHFbOY1i9h/XVLMpu3TvtvItXBUoyLBuD/kFCEZlAz6WBPRDdUOy0cEkJ
	 i9EWuP11Z1kTD51VLDrybRHn+5KaxDxATbc286Fpcay1GpSB3UnDtyXYLY+lud9bt1
	 Yp/6o2DwWTmu8tJEjZz9H6JdVwZx3DySDrn7Ej2g0iy5ReRhcM58ivE7IHdQ1g4leF
	 N2bd53hvxj94A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B9FBB4AE48;
	Wed, 18 Nov 2026 16:24:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 18 Nov 2026 17:23:58 +0100
Subject: [PATCH RESEND v6 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
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
Message-Id: <20261118-dw9714v-v6-3-48cfd8ee4c4c@ixit.cz>
References: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
In-Reply-To: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8WfzFF7dr+OowmKfQ8hjpQk9mPH0Ypxx7JTqVv2IOQg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq/dFS/y/x42kMST2Z2z/1EWc9Nor9x2Q3DCD/Q
 CUlFhi/8WCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCav3RUgAKCRBgAj/E00kg
 cshCD/9lrAYzMdAWoY8TrNEZtgzVA9suFWfzHJH6KCsS0Rp+C3UxEKXVK+aY0jMrp7YYhu14aE9
 eEewy///BLVCKE8nmu6tfK9pzEQ7hiEc8u9YJOM4akKxk3NtsP71Jr9PMIAzqhgGq+VrO6dM4XJ
 fg9a1kSMi2cRI0pAtHN6bQjkGFta0lOnuvfkL0kWml6bE6CEiRWERcRpRdYwTexXCUtqnS8/uOQ
 Oq23G387JhwJezjqLHtV140PEG/1Wemp7Kmw6dJK6MoNhuNX15B5IOsgisGPNprRRC42XH2/g0V
 H+tablT0Ot0TvonGPMc3HclRS5EN/fgc8IREGS16CtyMUdAZnypymsPXO4dfYuF23MYQmuK1s2M
 VnUdP+lrryBS9NlF1hUGzGLRB5GSiMhpbMNDILI8duxApQFSHuKGMKj5DCyb/tnPOpGMlKRofGP
 5FVV0SvI/UgcxE4OQqRpRGV7FrcwsoXX3AsS6f8HtptU+jwlxxRaOMVXqtHr/WgYqZhigExWz/D
 mgd9DX7OpAlzK0cMMIG72q0GzK8LqLPOFTVdCbx5aESL6uiqb3P8wQ/oL5d2HxgKngj9KEaJDoi
 /6NdxBoULETxaxnc+7QMElTraJQc7zHWk0EJ152IvOlwGY98dGE6xkVJX5lKX9ouZbBD//HbgGm
 yvPcuuB5N2WPhVQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
actuator is a Dongwoon DW9714V.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


