Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003648;
	b=2pfLr7wN6CM3uvfus/VHfTpib2UeK4dctrugHT5jnfkWpWBEpaqHS3G/ByneEoZWWRfH
	 855wOpZEU86ihpzkRr1LbA10DmO8Ti9FvnnxccsCsscA1exLHIPNF3waWiSHSr3XamdH9
	 WHq2TWlZ6l+xgjH65yqyeOLLRiKFzmdfudG01doEylORFhdpO9BkyzNr9PQzXeYOpkgi/
	 z2vddGYR399trKk0QL8xfosbraczb4b19D+s6ti8Cgk5yiTzENCI+5D4bLCnQS2mGmPu+
	 a3qQ1LpTqLrI/42KuCByXMPFhqjWEj0CPXOFMyFrZ/vX6w2eZqd3yAshlW7tyAavpgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
	b=jgHhSoDjqeWhzkSifXFDdR1cgOYKeamy8moUgD9/qEluoYcrcxkjc01TsFtloOfSNeNM
	 3w6bQ9Qh45LXgAo5izG4uCS/HqCW1VDJ/TmUNzt+okTpxbEodEOFc3IJ3b7vixcAJTZ/0
	 XOufjX4tTJVEbF5g3F1Bj4WTmMtwduJBnYmouanrICQauKXfYtrdY6mB3tMZr9SFiHQUq
	 Z/s3Eqh6L5ae+ke/SLgiN+lAUHVwkCz52tmbiWrcNGO6J+2rJ+e0HyMwQWNg/N5gWK3wL
	 s6+6cBXBfe88QooRwBvwWUU6LdxZUTj8NpD3IkEl1Bvq4Q+zAVgQjl3896Z1F/VyEdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249460A5BD7
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E249460A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so562511f8f.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003646; x=1795608446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=UpCybyBEXExg7fNyUzYHBW3rjcRsRXehyFFmfjaYvHLSQ90D5OFnveZgTMARiksJNJ
         uEo1gYGyFBz5M/L1biwqZDQpqSuBmv3z9cXIRbLCZCWB2YGoBTB5aNbXgwYOJxRmwMQy
         L5sJ5TsbCibNGc4ossOWkSSNPuTaSHaHEdNCf7qpeEonP8siaY2D3g6Nfvhwl8uvq7MK
         VQuZEzjtfY2J+R265c6K2fB5CRwrOFUpXNvB2V8Cj45FFnLMsxqOYMqoVfrw9Bt0UQDT
         DY5/T/+uKCoxo3cf2CGgoKDFlnirJjwoffAbXmcXRBC6bwGN9V/b7E0jYizr9J/2YsJs
         WGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003646; x=1795608446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=UalCi59uiNm6yzEMc8+yLh2xR62C4Wi9gHdsNEqJj43PtFI5AKtUw94x2abVJGGyDN
         dfV/oWfcGCBIS79wgCtBFJO/mZXyui0rNAwOayzE+GUXTJWkuob//4L8ByRZ0lDKdL4m
         brJrafcqgWQCiyE0+zeJmq74WQElBj/b2G46iSejmXdwB/TAWR/40isOL3mFm0PGpEG+
         9E/UUTYWWOk8zLQfSNRNFfrBUyEoqC4jGzP9ZX443psOQwf2+1ijp+B1d7bu8bFl7nio
         nRm6cf+kYeZ7Y/SsUC3O4UVcL3FbAB72PoB1dfSghfx+rxXr/n9ozdWaEuakHSOYvAGx
         ROEg==
X-Forwarded-Encrypted: i=1; AL+hErEuvTvbZ2knIqUzRV1YeaIE2TWbkTLOY92oAir8yIjrfdFLp7uo5idpcSVEVUjq+do7p2dZgxeID1PnJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jVovEGW2Pq5H/uyV1zC6Ah/nDCyBCwFL3jnJgnkLZygJTa1UW
	jdsxUbPwy02tt0PJnZix5c4vkNMhMQq4ssL1wy9HhLxXYzzpcvN1dEYlBP+COPOS6QmsP6Lr
X-Gm-Gg: AZFdTZfwFpVOHLA2vO4eyaBfPh4VQO657bGxd4UJ1ZZYCr+UKOjUbzpPwbI7SnkjAVm
	gzepc5ja1sgaXrYbvUtXzuBI1aZz+xuJjkCeza5aQGVJZZDs1hHPaVVaJbL5meQPy94SLemFglT
	sCmfnOV4PDEdEb36HO/r7h3UTPwY0aNwxgoAzOCdZQLSr4jXNGg64RjnuQsGb8YMgEUGLUNEhjx
	OWSTGNegJ9b06oJod3WnGBLFDfYKcRAU4QQGxA6JwTa54Ikto9yQdo15+Avzo+Q5m4yTV3hgEwr
	RRmPLNrE/X/IQ5mveJeIwUyb6lzEK+Q6BKtKDzAKXeIdpV3tpFBlZYpnHU4ERJgFaCn7qXR5LVl
	OewUGlwTUnL/faKAAWja+xFfnNz9dbQxGEPoqNymYdwxIxpadvk6QbF2KLGffkqiKQaWD0fXb61
	cDfz4H9TxVKvTaSAtkWUQYm8Tm8psB5HPhUsb2zw/QE7cvMkcgUiHrUYmtvbpMRE0yJ0Yr4AlbI
	wNfCPMqLxKclhglPh+HFMyJJnhsXanTg/1keOQy+1R36GPAdGh+KeeaGZbWSa4FsgrCfoUmhnuR
	6TpDfviq9MibLs7rn9ykddFSiSdVU3Cb85hopnPp7x6mkPU/JysogRT796/jEsMyp8OJ256XHDq
	vUYXeoNfJGMxDca/SGoLy
X-Received: by 2002:a05:6000:1606:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-4a63e6f1a49mr3049066f8f.39.1795003646222;
        Wed, 18 Nov 2026 04:07:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Wed, 18 Nov 2026 13:07:13 +0100
Message-Id: <20261118120714.31505-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index be5b894b677bb..12ca5ea921fff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,45 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
 &pon {
 	status = "okay";
 };
@@ -684,6 +724,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -698,3 +742,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

