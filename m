Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795305680;
	b=4nxKB9EzklXgFLS0FpziWQDv701XTXYILvZVBhpWa+ZYlFlo/q1FxYk5NrTfixdkf71A
	 Xu5zHasskjlNj5QZRA0nC4xRMp6/SBCslBOFIZ6i3R6o4aVZXfZu/Sh8M3Ok8Qx4VDy+5
	 cV1MR2rRwjybuECIJA4J2qbIo/sr54dqtV0u7xPjASYFeiDd/yLH1wDevo44YpauKSTig
	 +x+QCfzegngA3WLFIOZAM+IDznahGHinNVJrwIynC5WrnO1vYm7yxnBsXBbQH39czZcQl
	 hU/aVXhhLey1NTQMz8VltFqIIJXPdK9zibh2dnIf7CZiGHCwtoEvBzI6/yYeAFOnDZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V62/55dvE34zJUWa2mPj9O73mKBGhOTAaj9gydbUDSU=;
	b=a+iKlU9Xw6adQEUbtvptuZMnaOOn8cuS6ktgTw2Cja+12QgoctN1aphG04+uyvdfGewF
	 Ka5LOGNYv59/owihwmIwhy/29JSQcZS8sDxBj9xStskO+t/PQtK9vax/1hpvpFeddZefT
	 r4NHqu7knaUlKOHw0SjN8I4CYUdSZ5A1ukWZWMlW8btBVegIJ7ICBbuIxp0FgBZmKfElX
	 U4M3nvFR1yAdcgNpMPGmmKpZRLyYCtVmdZYDs2b74qi3Bg7WKhuhkaHRz04mRsiTTQ4r2
	 vhHEMrsUz7kd/yCex5Pu5gFe5q3Dz7aWKt7ulrzVT6z3LhPKisF7hxsgCtaiGeG2P8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvDr0wUP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA2606A320;
	Sun, 22 Nov 2026 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvDr0wUP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795305680;
	b=MWiro8qW9UAA49h3/GModyQMz/zl3R6jjV84/lQWQHxZYEMkaRrSy+3FeTl0GydhOKsW
	 rapmUlgR/ZqhR+C2yqH2kF0FsaLYDeaYObMVeqLNSjHj0RC507fwjL/3ZbUQiBpkpHSrs
	 tWVlqa519w4PMs5NeE1Rgtqn1KbmHdUf839T/felTDkjPr7jcRSy+ZrRU6YcnA9nx+qpa
	 PlEDWIyphBok7KQ6mC6gg6nkqQ4rSDzTYm0Lb0kGAqOPZ6OUnAYBZ6gwoPd93sntcOr+N
	 GNpbryGfSPCdXrODWyiW5HNBdaAB/s8kxE9MJv9rVk0QGseFb2RF8fz3ZCn9Y2nw/8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795305680;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V62/55dvE34zJUWa2mPj9O73mKBGhOTAaj9gydbUDSU=;
	b=o1VdLKQEBLIjfjslORuG9c5/U7B+68h/SD027zYR7y+wdxQrv1hccvXqxoYzCVvgAUFv
	 yYFfv8rislhPqF24iC2llLkAoYou0ea1J48SIstX2+M6myJr+DXLbn5ZzKQcvKM3kstyA
	 cEl/Np8eaieHZf+tPwmY0PtmEwfVqA43SXwC7/RfeBmmf7c+xwWebizweXsxheZAQcVvo
	 WfgecdS4P3CnVyJ2yZ3g6fKaHf7tuCZlyk50mOXpCC4uewgU3R47V/WEQ30CCzQkfYM2z
	 bUy0Xfwll4zpaZKDnEc79hdCugMcfpuZ4IE3ySM5U1x32IEi8jzmrXPzasA3rPXHMwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 970E31F000C0;
	Sun, 22 Nov 2026 00:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305680;
	bh=V62/55dvE34zJUWa2mPj9O73mKBGhOTAaj9gydbUDSU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=GvDr0wUPt3Riys2w/Zs0U3H4aKzjbri7WKaZrQU3KqdirSdPHNiMiGygv5Y1d+WU7
	 3L8BJk2VvsktYgyNuT6NU/Iub4IsUxCYqYTeFmXspbe2/dACS5qg2qfr7UMVYBvQ/Z
	 UvlxwTEyt4D0KSkF9Ev4nR2ogJ8N+ZVOIvPP8vGMzt+8I/Gt91ibXiWLt3PTjKZyQw
	 aauFVrS2pgoWcbi74YND52M0M6jsElc4WLvSQY4ODzMeLYLAxDPqSkkdgOvlOtSDnu
	 MoUwK4djwecTXJ88QWZ/REnr2OtqND2Dj8cMgLmH2wS+vpBLfkcRDhZSF+5EBjmA1x
	 w2uxuX4CGQwKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F14374BE7E;
	Sun, 22 Nov 2026 00:01:18 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 22 Nov 2026 01:01:14 +0100
Subject: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Enable sound
 subsystem
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
Message-Id: <20261122-axolotl-misc-v1-1-27211eded948@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3cSK/Jz8khzd3MziZF3DFGNjA3PjJONkI2MloJaCotS0zAqwcdG
 xtbUAYdgdL14AAAA=
X-Change-ID: 20251217-axolotl-misc-1d33073b3c23
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Dylan Van Assche <me@dylanvanassche.be>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7055; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YTj0uYzd+DRdhyLqXRtWaLi9sUqjVAzyoVLYvS8B748=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrAjDOWX+eQFGOoHfDcXBQG04Gx3dw4ZlrP4W6q
 dhJmTXx7n2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawIwzgAKCRBgAj/E00kg
 ckObD/oDrzVErBTGKzbhkfZHeuo4ZFtGqjQ/qVLGkMr6kOPJ0+Psci1+fOtoDvm5o78TrcA71YQ
 C3wTFQrT2GrmqFuTHckczHV0s/hbtRCUbfE2QSac6TzV9NgAAiwh2djNdhiJWU3NBAIJs7k/L3F
 kRhUta4EVmmpsEFcyvi/tHgJFSQaLkaiRje4tAoMkntSEzDgdZTwi3f1XW5enoNgpZu1PKjU7jv
 6I8Cm4Cx9tmFLvAra8yGoDA7h1EZKcGphBWpY/3QyV0Qp21QJaMcq+B4NZKN2RIkqoNPh7c2vuC
 TXXaj7cz+cUvkN5OFhCBjYgtIAsQvifOAE2VHDPxGIUY+gSC+RT9rdZAynApHoUkuKph8hiUIFq
 05zpi3G+vUCiEW5S3EDtu3TrtY/uJg9pLG7MxkPwNZ4DZpJJyHSmx6hzl7sWplrhNqjJY40JB32
 rtSYannshNMfJePdH8MssUjZcyrlL79xaL5GFfdKtRmcAxXONtSf/75rioGWexR7o6gwywH/YJr
 UYe54RS6vOI8LPLIIZyqXL5bHUXl/79LuNHak2cEtXI5dlNN1wGDlllIv1vaUw1p0M8nMozK6Ms
 tat9YPZg3p9MPTaLvG84yzGR/Y8YHvmdB4o6fyo8uPneDzFti2OzbAbxRVTSrBioHZuGXlUdIMC
 fe4EYu2Ewcd7+ZQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Introduce support for audio speakers and microphones on the SHIFT6mq.

The SHIFT6mq uses the WCD9340 codec over SLIMbus for the earpiece,
headset jack, and three microphones (internal bottom, internal back, and
headset), together with an NXP TFA9890 amplifier over Quaternary MI2S
for the main speaker. Enable MultiMedia1-6 frontend DAIs and wire up the
corresponding SLIMbus and speaker backend DAI links.

Co-developed-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Co-developed-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Front speaker and earpiece works.
All three microphones receiving signal.
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 199 +++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1b0eaeafbd517..e02e5ca868c8f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -6,17 +6,21 @@
  */
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd934x.h>
 #include "sdm845.dtsi"
+#include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 / {
 	model = "SHIFT SHIFT6mq";
 	compatible = "shift,axolotl", "qcom,sdm845";
 	chassis-type = "handset";
 	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
@@ -516,20 +520,21 @@ &i2c10 {
 	/* SMB1355@0x0C */
 };
 
 &i2c11 {
 	clock-frequency = <400000>;
 
 	status = "okay";
 
-	audio-codec@34 {
+	tfa9890_codec: audio-codec@34 {
 		compatible = "nxp,tfa9890";
 		reg = <0x34>;
 		vddd-supply = <&vreg_s4a_1p8>;
+		sound-name-prefix = "Speaker";
 		#sound-dai-cells = <0>;
 	};
 };
 
 &ipa {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/ipa_fws.mbn";
 
 	status = "okay";
@@ -654,16 +659,49 @@ led-1 {
 		color = <LED_COLOR_ID_YELLOW>;
 		led-sources = <2>;
 		led-max-microamp = <100000>;
 		flash-max-microamp = <1100000>;
 		flash-max-timeout-us = <1280000>;
 	};
 };
 
+&q6afedai {
+	dai@22 {
+		reg = <QUATERNARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+
+	dai@3 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+	};
+
+	dai@4 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA5>;
+	};
+
+	dai@5 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA6>;
+	};
+};
+
 &qup_uart9_rx {
 	drive-strength = <2>;
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
@@ -696,16 +734,161 @@ &sdhc_2 {
 };
 
 &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
 	status = "okay";
 };
 
+&sound {
+	model = "SHIFT6mq";
+	compatible = "qcom,sdm845-sndcard";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active>;
+	pinctrl-names = "default";
+
+	audio-routing = "RX_BIAS", "MCLK",
+			"AMIC1", "MIC BIAS1",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS3";
+
+	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	speaker-dai-link {
+		link-name = "Speaker Playback";
+		codec {
+			sound-dai = <&tfa9890_codec>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap-wcd-dai-link {
+		link-name = "SLIM WCD Capture 1";
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM WCD Playback 1";
+		codec {
+			sound-dai = <&wcd9340 AIF1_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM WCD Capture 2";
+		codec {
+			sound-dai = <&wcd9340 AIF2_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim-wcd-dai-link {
+		link-name = "SLIM WCD Playback 2";
+		codec {
+			sound-dai = <&wcd9340 AIF2_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap2-wcd-dai-link {
+		link-name = "SLIM WCD Capture 3";
+		codec {
+			sound-dai = <&wcd9340 AIF3_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <16>;
 			bias-disable;
@@ -879,16 +1062,30 @@ &usb_1_qmpphy {
 };
 
 &venus {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/venus.mbn";
 
 	status = "okay";
 };
 
+&wcd9340 {
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+
+	qcom,micbias1-microvolt = <2700000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <2700000>;
+	qcom,micbias4-microvolt = <2700000>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
 	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
 	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 	vdd-3.3-ch1-supply = <&vreg_pmu_ch1>;
 
 	qcom,calibration-variant = "shift_axolotl";

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20251217-axolotl-misc-1d33073b3c23

Best regards,
--  
David Heidelberg <david@ixit.cz>


