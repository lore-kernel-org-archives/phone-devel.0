Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485442;
	b=hAVx/ZLXF1sQHg4L3ODumSIOtfwumdZQwDGM7TAUiiruuSsdiio9fYvEIVCM9oqA049C
	 EgNAxNuI9JVQVMCeGhxv6AeGng9P5XD/xOiEE/NJqc8VPF1UXGzn38HQ1zS4B9+wRH7Rb
	 0MNbMgirZnP9JfrXsnkytfocgn/5Lnp+YbSxWff4g8ZQQVPQ/0QqJYv2xcwEXt9d1Sjm+
	 xzfrrsUvL4AAXT/YPy4E1VTcYFiljkyUMuPIAxkogCXhpah0oHKtG+PeYPRMRixImQGgZ
	 NZPS2v94KkiF3nfCEeJUp0EX6CUsra2Zio6RrWRuXMYYPEZLNb5dwIs3eIl/puN9Log==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
	b=orGYJwBSS2pKowWp/pgrHIkaPoXAbEsxi2SItp3KGDfeb40MJpyIZJlhKEJCjd5osvq5
	 q05uAgHo9LGjlX0ag/9Y9ZTfgq35ivWxZJ5SApStm0EqL/7cq9xIHl1qyuTkUaZ+QFFCG
	 Je1N0hxhyfNXkbUCQ8SUQMLvkYqrEOSPS6sWKT5etggBTqiofMXGwStp/7Gf+i7y/vEYo
	 mJ+P6722Nz2AZ41a+k/iIuOAi8ROWd50oSkCRKrHyEJL9QLdQk9Af7+q/e6xd40Lc0EA6
	 dwcqsmvRkgxX0SlUJhoN3D2+agHssoDJAg4Gzr+coxWddTSlTJqZNr3/dNwRR8rZXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E1606A335
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9E1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pI0HP7LA
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5366ae57896so41541431cf.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485441; x=1796090241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=pI0HP7LAUqSmIRHM1dqj9ex013KBAbfdOBRaJmYsB1gCAzOdQnUAtctNuhRTkQBGym
         1PYFqPtXVtWorcNn36WYS5OheMk2gemtrL3Pwd77GGrWYNAanwvByi9V9BR2wKcNykjx
         Hnek4vS1VvykppQQ6gAbi8wnQGhAmHHWrsDxo50c8Y9TQs20sQzxqMSbax5TxlenwoLD
         IhBxvQWus/thOm4FNJG9HD8WtHm4d7x2vU/QQUhOTeNCHbvRYTnV9HoXLaiKkUuFbN0K
         sqFnZmeQYmSisfVupAARY075Bpef9Hxi8VjPjtqM/iRds62TcJQJbYGdndUgtk4DwxwJ
         ILjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485441; x=1796090241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tHqukXkgmKVS7Cb+5H41Ptle1JnEwhRrnl1VEjcEgQ=;
        b=CeEbfYPx/qXEBTwv2hU5yzraj+OoJsSS07a5vT8lYzBNAs/AuxnyVR32D4M6zFmYXK
         2jp3jmfVpwef86811itupQ1Ue3stlTPXGh9SZm+/mJmYxq1Z+Vt1MEZ/SshSPc0tyz8l
         vn/bGPfTO49c34X6xuzk7j3ZleMVaeeiYG49KR2UmpfuaDVKXK3r/GYjvsBpNW1MhNff
         1uTIgRsuS1M59fiSjpBI6AMUFd++5tnXDOCXU6xdw52tPNgKfukfvZGPBnzsljHrTShn
         k5I67Utcz0ahHmVxfOkdzeieFGJKbTvMNdlCN17elLAPhfLj+A0SgIaUjeiNX1jgHgbE
         HEXw==
X-Gm-Message-State: APuU4Z8zMBkRuZqeFz9pd/EXOJvijT3QJhr7AtuPTjG4+FFbO7wzhVl7
	36RcSt8CoKIppmhpqY6OsWMTYeadNEp3/oeBoQ69YyTmji5X/EiRetUD
X-Gm-Gg: AZFdTZdLkcPztqYTuW7wyAP9klrU9QalgwKT2olKQfno7otjqRDQjb66UP7kK8rUXPi
	WN0wOTHwSL7lRXboC/CA7RK1At4EoTHNEQxHVQLdKEt7NC7Pwevff4KHTXiJVcqupxQ8+8YGM8E
	1x8VecTVszNYRpDBF+vDCrlrn4fjo+We81inHAXbSxxRjGWOAmtdz3134oGhIa5OMViT6dm/6mT
	lPAk5YvtMy8AkJHdI/8n3t7m9ajC0snIVkt/Nh9UIwnZA0sD0IrRK10Zg9KDUKp/lJSAhx9RU8v
	zKgTq7xWIW3kV6H9emiIa8a5sGBgVD+tKJRM/GxYKIvuRRPLSc+SfC0UgAw9uoN5XkL/uRHcM2e
	qJnOGHg2Qmj6b82PYjCmKKOGYUyz5Cfq8c1EiyX7hQDsEcylO2wP9VBb0bRraVUvBSvgvAS1F/S
	Jv5EHKZCwObu4DGynIuRr7tSBRnjVEbEwyfBDtvKf8tDT+yMb3aYUWTth8JexIJ4fQIRWy6jwpN
	KVJ3PAbPv6FCd+Z/rmxjagfcXhQHMOsiOiROxWjLWnKAk2Mh3QcBDvgCquJr+EUr5LcpyuUcPSB
	BEnFhM+8DjRVXFfdTlcN2i0tzF46
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr246641221cf.39.1795485441396;
        Mon, 23 Nov 2026 17:57:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm122810176d6.15.2026.11.23.17.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add sound card
Date: Mon, 23 Nov 2026 20:56:11 -0500
Message-ID: <20261124015611.187024-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card,
q6asm frontends, and WCD codec for headset audio.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 2044593c22f3..9c89fb79ce74 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -130,6 +131,84 @@ debug_info_mem: debug-info@a1800000 {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sdm660-sndcard";
+		model = "Google Pixel 3a";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "LPASS_PDM_TX", "PDM_TX",
+				"AMIC2", "MIC BIAS External2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
+
 	/*
 	 * The touchscreen regulator seems to be controlled somehow by a gpio.
 	 * Model it as a fixed regulator and keep it on. Without schematics we
@@ -550,6 +629,13 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -613,6 +699,23 @@ &pm660_rradc {
 	status = "okay";
 };
 
+&pm660l_codec {
+	vdd-cdc-io-supply = <&vreg_l10a_1p8>;
+	vdd-cdc-tx-rx-cx-supply = <&vreg_l1b_0p925>;
+	vdd-micbias-supply = <&vreg_l7b_3p125>;
+
+	qcom,mbhc-vthreshold-low = <75 150 237 437 437>;
+	qcom,mbhc-vthreshold-high = <75 150 237 437 437>;
+
+	qcom,micbias-lvl = <2500>;
+
+	qcom,hphl-jack-type-normally-open;
+	qcom,gnd-jack-type-normally-open;
+	qcom,micbias2-ext-cap;
+
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -655,6 +758,36 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@89 {
+		reg = <LPI_MI2S_RX_0>;
+		qcom,sd-lines = <0 1>;
+	};
+
+	dai@90 {
+		reg = <LPI_MI2S_TX_3>;
+		qcom,sd-lines = <0 1>;
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
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
-- 
2.56.1

