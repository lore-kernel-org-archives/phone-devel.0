Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EADAC38159
	for <phone-devel@archiver.kernel.org>; Wed, 18 Jan 2023 10:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjARKN3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 18 Jan 2023 05:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjARKLh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 18 Jan 2023 05:11:37 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2A9241F4
        for <phone-devel@vger.kernel.org>; Wed, 18 Jan 2023 01:20:47 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id q8so12357699wmo.5
        for <phone-devel@vger.kernel.org>; Wed, 18 Jan 2023 01:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mdQy1xYPaaHGuA0a9LA6xfvLmFd2rIZsFn7hsp/hZU=;
        b=kjk11as6enKtJ8ibAc1ZCIpjdiT8YtLHKSbthYja287PZy8e8NGkx4pJVxC6UFIpi+
         ALnpv8EtNqxduasTX6l+KKPUdIzb/ewF2XYtjamuTAqMcKoHlD1sIcr3shnMRQgAmk3Q
         28NJBPjzoZm/PCjePyTaPwYU7eL+rSmiO3xPVZZeAa875v0DnIIGU19jgBVHYwKqRI82
         vL0iH63fp04hIN85U75FpCDDPtzAKPkr5+yH+rRmKj64CZ90D98jJslmp6rUc6hFnWNx
         KhPNOJ0NAch2X/EaDZFVGDztyA8yYdZuFicStNO0UH+eHobn0ST1XvpbLnznTBplJPhP
         2Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mdQy1xYPaaHGuA0a9LA6xfvLmFd2rIZsFn7hsp/hZU=;
        b=0ZMEkQKO4Y/FMRv6tyzFH7HnhpFbciF+OGgD3Nz9igkCznYaAqOJxw7Nj4wcKynuJi
         hF96tEN6kH3RN6gKVIfi/S6N7sOJwzoi2KdpS58BMeIxaqyjgu9/HbC0d19qoUEnBXTJ
         XzgzlBm9FpAmeMtPLqtiZHsqfTaAJWGHelDC4+19ggziANWK41P1W/Uc0eDa9DXdXk9w
         o85M/9WeFaiXpxVcTmTvqMSL2+P+5ojE/zmzgiGxCwUr3FTE0xKWxXLU578e3KodwHjp
         FbAIVESO26L7jKpdkLGFy+C8d9D0UEq1UXq0La3BBfzKY6Vp05NnqqCjUxn6v8Lqz5Rc
         cWRQ==
X-Gm-Message-State: AFqh2koaxkQ6obDVVm5wVqlc1bMU9fgxa/gbKkjnfSoMdeqK3A1J6wpD
        RSdpUqk7zw0M5m0v03XtUPDcXJylePzE0/EVXs4=
X-Google-Smtp-Source: AMrXdXtUunol89v+cbM3zPxVn5P5UERSja+yH7+yL7lS4slrV3hDbwKOrmLGF1hHEaU7dOAKgra5OA==
X-Received: by 2002:a05:600c:35d0:b0:3db:c4c:9224 with SMTP id r16-20020a05600c35d000b003db0c4c9224mr4264433wmq.3.1674033646422;
        Wed, 18 Jan 2023 01:20:46 -0800 (PST)
Received: from lion.. (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b003d9fba3c7a4sm1315372wmc.16.2023.01.18.01.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 01:20:45 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Dylan Van Assche <me@dylanvanassche.be>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-*: add audio devices
Date:   Wed, 18 Jan 2023 09:20:39 +0000
Message-Id: <20230118092040.1444129-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Populate the audio devices found on the OnePlus 6 and 6T using the
sdm845-sndcard driver.

Both devices have the earpiece and headphone jack connected to the
WCD9341 codec. The OnePlus 6 uses the MAX98927 speaker codec which is
already supported upstream. The OnePlus 6T uses a currently unsupported
TFA9894 codec.

Two internal microphones are supported, as well as an external headset
mic. Each DAI link is expected to be used for a single device.

Alsa UCM2 configs for this setup can be found here, they are not yet
upstream and include support for call audio which is missing in this
patch

https://gitlab.com/sdm845-mainline/alsa-ucm-conf/-/tree/9ed12836b269764c4a853411d38ccb6abb70b383/ucm2/OnePlus

Co-developed-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 208 ++++++++++++++++++
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  40 ++++
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  29 +++
 3 files changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 42cf4dd5ea28..76017fad4443 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -9,6 +9,8 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
@@ -466,6 +468,44 @@ &pmi8998_rradc {
 	status = "okay";
 };
 
+&q6afedai {
+	qi2s@22 {
+		reg = <22>;
+		qcom,sd-lines = <1>;
+	};
+
+	qi2s@23 {
+		reg = <23>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+
+	dai@3 {
+		reg = <3>;
+	};
+
+	dai@4 {
+		reg = <4>;
+	};
+
+	dai@5 {
+		reg = <5>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -505,6 +545,140 @@ pinconf-rx {
 	};
 };
 
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+
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
+	speaker_playback: speaker-dai-link {
+		link-name = "Speaker Playback";
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim1-dai-link {
+		link-name = "SLIM Playback 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 0>; /* AIF1_PB */
+		};
+	};
+
+	slimcap1-dai-link {
+		link-name = "SLIM Capture 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 1>; /* AIF1_CAP */
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 2>; /* AIF2_PB */
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 3>; /* AIF2_CAP */
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 5>; /* AIF3_CAP */
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 
@@ -634,6 +808,27 @@ mux {
 			input-enable;
 		};
 	};
+
+	speaker_default: speaker-default-state {
+		mux {
+			pins = "gpio69";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-high;
+		};
+	};
+
+	wcd_default: wcd-default-state {
+		mux {
+			pins = "gpio54";
+			function = "gpio";
+
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
 };
 
 &venus {
@@ -641,6 +836,19 @@ &venus {
 	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
 };
 
+&wcd9340 {
+	pinctrl-0 = <&wcd_default>;
+	pinctrl-names = "default";
+	clock-names = "extclk";
+	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index bf2cf92e8976..aae1a3a27144 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -32,3 +32,43 @@ &display_panel {
 &bq27441_fg {
 	monitored-battery = <&battery>;
 };
+
+&i2c4 {
+	status = "okay";
+
+	max98927_codec: max98927@3a {
+		compatible = "maxim,max98927";
+		reg = <0x3a>;
+		#sound-dai-cells = <1>;
+
+		pinctrl-0 = <&speaker_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+
+		vmon-slot-no = <1>;
+		imon-slot-no = <0>;
+	};
+};
+
+&sound {
+	model = "OnePlus 6";
+	audio-routing =	"RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS4",
+			"AMIC4", "MIC BIAS1",
+			"AMIC5", "MIC BIAS4";
+
+	speaker-dai-link {
+		codec {
+			sound-dai = <&max98927_codec 0>;
+		};
+	};
+};
+
+&wcd9340 {
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <1800000>;
+	qcom,micbias4-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 1b6b5bf368df..4b1a5d3c3713 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -29,10 +29,39 @@ &display_panel {
 	compatible = "samsung,s6e3fc2x01";
 };
 
+&i2c4 {
+	/* nxp,tfa9894 @ 0x34 */
+};
+
 &bq27441_fg {
 	monitored-battery = <&battery>;
 };
 
+&sound {
+	model = "OnePlus 6T";
+	audio-routing = "RX_BIAS", "MCLK",
+			"AMIC1", "MIC BIAS3",
+			"AMIC2", "MIC BIAS2",
+			"AMIC3", "MIC BIAS4",
+			"AMIC4", "MIC BIAS1",
+			"AMIC5", "MIC BIAS3";
+
+};
+
+/*
+ * The TFA9894 codec is currently unsupported.
+ * We need to delete the node to allow the soundcard
+ * to probe for headphones/earpiece.
+ */
+/delete-node/ &speaker_playback;
+
 &rmi4_f12 {
 	touchscreen-y-mm = <148>;
 };
+
+&wcd9340 {
+	qcom,micbias1-microvolt = <2700000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <2700000>;
+	qcom,micbias4-microvolt = <2700000>;
+};
-- 
2.39.0

