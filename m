Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F7241668
	for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781118; cv=none; b=IWW/OVKbCWVxIg4dKn7oe1avgVdjUDHT7KhalqGigsml2qBpkfbHx3/frOkVD5pepXwWCX8teqdHDvk/DMFSCF3oFC395afZdYnOED1Ehxvg2+Ag+xeSqO8eC6ZITQ3BMVTC71ytZqwMJUeG2VslrcBHN4pjRH02Qz20K/A9Va0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781118; c=relaxed/simple;
	bh=+RdyBIwxd6mquveTbaq2IR0uSqOPWfpJivqQDnRoaZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OI1Ony/909qfxETKwqS9dIZfIxwI6HKD+vKugHjdh1jl9ha6opyB/7GUu0+R/qJvHeWA63HHLMqFOMcz/vjMouK6Bk6c7IV0xnyzmTm3xyH0OG9lgpTYpYNKgK6U7E4jUNZhVxj31wAeGYyJf/KcJdg0I9SpGbf8J/hZGCsIgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QovM9UDQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QovM9UDQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so56562735e9.0
        for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781114; x=1742385914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkMjxLDjnh1hw80WvyyD7v+50HISC6qgR19rphkV2/g=;
        b=QovM9UDQ/gSKcsC5VJpoQZReOd8+8vfS7x1xxvKET6IakH3wzvnHcOLEbNXBypEJeS
         yNfY5rM0U707e/N8GWUEOIfce7VCHBwm8JqYNUCdSbks3HAyThNVnp35uwpuzC81XL+f
         BxQZRyM8X7bkFHPZmFo9oJ0cfXmDFzduOPV9KsuveCgu56ok2GPOjT+Rgumio8dneE5b
         BnlDq5/RoxiIjjKE8+vPnDfn1NlPUt2TgaPMzQktQumMvUJcVqWFmIOfEavpE4cAAnNR
         Su1pJpaW+BQWk3a085z9fVx/wJ8C38LoV1tJtclx3euZbl8SnjeSigUn3+JrE9vJqGM+
         NpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781114; x=1742385914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkMjxLDjnh1hw80WvyyD7v+50HISC6qgR19rphkV2/g=;
        b=YY+wCm89kmP4N8KWk5/O09s4LlczmmLcPpGDQV4SbMyksD3+HpI+OMQraveTM3M+rl
         CjTWkh1nd88MDBJFEUFtGPhAimkuxQk0QLg31fob9bT073FP2YUV8PL+qKRimtVuorS3
         E5WOTrdPsBbdJGafa/4l+9HB8aa61ZVcJTYqKEZA4bHWaRK4beheYhuho6QgVQodlrvT
         7caaiUO1/rii81U8tZ8PckqGXRtVpYuEeEEePOcjugpEVSCHGSnVPWjgP+E1+GyLx4gv
         MPqq5DXLGaoldTcGDEHXAMIVtJj0NPTaaoS2oRjKxQJiJykabxM7tlnLGkhpOd52O9CD
         GsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT53TWpitVxO/vYKsOOpE4ybB1HY3q5Q9tgFNQ+6zz5xiPmpXmRTOiKt5qthgX4uy1Lrvvh6ppmNRGXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKLUgXjLhORG23O/8kuJ2iywhaOK/KIZJAMGwLT21caQw1qVL
	BellLWoYfMLsH+t+I+709OaTQOV+9okWELn41EBUV8+1dDhdVUx0Dx/RX5Ufpzo=
X-Gm-Gg: ASbGncvl+N5AMKDzp6DgIBE91eas+AtLaF5zbOI5zZn7ndc55gFIxzJI9D5efw/5fJP
	cU145Fx8DDY78mdI5EPzCzBz8bEwRhn0RsFr1kDSu5a7maIeI36Hb2npXO4nlveK+GqxVT30MFx
	T6k/qIIgI8ksPqiTUaj0S1EQ6GddQpzufTZ2NbkiFnYDxq/fzKqnpm7bH1muMfBEegJkJARVlWA
	AqCfZweCU3OgKNUkYy889lO6Y5IGVbbBPy9E8fRYRkvn1WPTNotoCpFwPu/V27bwDjAjEBQHGNa
	wvkwf7cXORB6srIKPlA7JrDbcLBAjkZNvd0lSxkHOJwVur7/3Hbidaoj14hyUKK8tXWTMDWd/Jq
	KU1SEM4a6hufQhXarow==
X-Google-Smtp-Source: AGHT+IHbpprc/stqmYEX3tnPU/ZmItrK6xJD8r0+wEddtT9FgyChhU1SApLwR6TYweT37ILVW9W9Bw==
X-Received: by 2002:a5d:47a3:0:b0:391:329b:893e with SMTP id ffacd0b85a97d-39263cebb08mr7537227f8f.5.1741781114430;
        Wed, 12 Mar 2025 05:05:14 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 12 Mar 2025 13:05:10 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-fp5-pmic-glink-dp-v2-3-a55927749d77@fairphone.com>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
In-Reply-To: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Extend the USB graph to connect the OCP96011 switch, the PTN36502
redriver, the USB controllers and the MDSS, so that DisplayPort over
USB-C is working.

Connect some parts of the graph directly in the SoC dtsi since those
parts are wired up like this in the SoC directly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++-
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e0470be9142caa4bac4285a191725bbd60e706fa..9e8f9fb57c4723a24704a8239a86c6081910916b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -101,7 +101,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_ss>;
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&ocp96011_sbu_mux>;
 					};
 				};
 			};
@@ -761,6 +769,13 @@ typec-mux@42 {
 
 		mode-switch;
 		orientation-switch;
+
+		port {
+			ocp96011_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+				data-lanes = <1 0>;
+			};
+		};
 	};
 
 	/* AW86927FCR haptics @ 5a */
@@ -784,6 +799,27 @@ typec-mux@1a {
 
 		retimer-switch;
 		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
 	};
 };
 
@@ -805,6 +841,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b>;
 	status = "okay";
@@ -1301,10 +1345,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_1_dwc3_ss {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1331,6 +1371,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..f008694a5bebf6af1797a961e56ba0c355ceace3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3639,6 +3639,8 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -3654,6 +3656,7 @@ port@1 {
 					reg = <1>;
 
 					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
 					};
 				};
 
@@ -3661,6 +3664,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp_out>;
 					};
 				};
 			};
@@ -4267,6 +4271,7 @@ port@1 {
 						reg = <1>;
 
 						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 						};
 					};
 				};
@@ -4820,7 +4825,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						mdss_dp_out: endpoint { };
+						mdss_dp_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.48.1

