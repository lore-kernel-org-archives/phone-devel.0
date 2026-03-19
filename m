Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8383A7F5F
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907976; cv=none; b=OCPeDj/8/j6NOMW4mMkD4+v6KV412cpuYwEI0naynOr+sTpqL8mcL+UgrxDoCgxZVJZePj7aMzBL5AuMs6HJfWlynrqdIKiEwQ/68nI3jPvau6OV5433tEaDh5A+5m3RkyF0x4K4lXo0Hd2YBPuKXSaa7im5enRgsozWY3kkUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907976; c=relaxed/simple;
	bh=dCF7jFFNaQYySPXUIQSlxZ6rCDW5AOggp+NK02rLQ9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ov0uJK1dXFK90JsJ1iBzSkP1QZ8t+a5sZHZLOLVZmKMTIzF8aE8dZNNKO/VgZvgzv+hqrtsKWqh10ELLT/MBtpdfA4pej3Aq3bHT6NT4RttWGtshnVQTN5+Cn5Ij6UN6IlhBf1Z9barOFcb4jl+rCRdiVLmPfH5W0ESKsLlb4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2BXP9CLt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2BXP9CLt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso1394725a12.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773907973; x=1774512773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaq6NxVT5tVwElid/gqEsdCBP+g0Me0eNhL3OknSzdM=;
        b=2BXP9CLtcY5+rg+kFDCY6Xuv1dDbmYEINxUzYMoL+ezlLDkC7GWkuDPopeFZe3hNyd
         PLYpWA7TJSTjMBF19t3BS7J4qKDcn8NkesYC9dRLXDLP5O712XU7ifswkktwy5cwGCqZ
         hpZ3dAAidPKvylPfPhwSktVRWpY8FQ1R9W/W1jNLrVV8oljhbNbz47QF7TVeND0yn4MQ
         LVgIlAPKLc0UzSn3YCA1jy7Kl0n4IC5OE46OFRNHVSi1F9WpL06HL5UPSqF+5zpumPIO
         +AOon8kX6fy+bmxijntL71UQwqIPAQT/QPPZttO62/GPh8uuwGnns9PrYFuK/IpnFmk+
         lRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907973; x=1774512773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iaq6NxVT5tVwElid/gqEsdCBP+g0Me0eNhL3OknSzdM=;
        b=c3oy+XRMDwPTbEkQOi/x2h4H4Hv3GfHK0vpIbjOMQFzTelpDMUHhUNIgDVfAXg8MxT
         x3PtzU5zsLz+LfZtMDvWeq9sTSd4bHyYAze9IcO3eBqP9tTb1bPpGxnJT2sS5ii8ix42
         0vx6KOJk5gS3MeEjXbKXXLBDLiiwykotKM0bXOjESZGvFk3ej3szHwCFRav/UoqlEc2X
         SKbsN22pbaZrHIq4X9xBntcRbuFST+LygtNiksgQMQ7DF+aFEKo8Xg0uZazMyoWn/tTT
         hnWtTm4b09G0Wa5lJ1rtsFYxNuy9w4qnWuXNezkNm7FGNhz4UIwnsSLHjByfgj+G+hWZ
         GRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6sZQknDkGqs3xe9lDw/io+nfRr5GkCky/A44QBy/UrerGK/ySGBWDD9jGAq1M4NJG8o/myN9UlJtsfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7bjGIyCTWVowVw1davNKpAPK0nLj1qd55Oi30JiRdYFgZoDS
	DTqzDWyJ0H02c4T4oY0uZVOuLBIOYPn8+9YPU8J4suL63VIQgorAPeTk3TsMLskdxI5AwbX/9rT
	TL83D
X-Gm-Gg: ATEYQzxXZBmVgWwMhUy5npNxjBEuSUaTsIWknmRZr0UWV0YMvz6kwuoGtJIx1PXSIcD
	adYVE6m8gV3iZfllN2f7VG0LBAERMLcj37nsFVPiySb3sRPo9GGEv2cmT1Osmklhzozb3UqlUVT
	DPV2fzdXILUH5xJ+6bk1mLhIzvwxwoaLYgf2Cw+4x1RH5xTEftkJZgKlq6eifwQ9gtu7IMWgkMC
	h7O6dALNW1wBGx8TH99dbTdSAR56UB7gSZi4+GtX5xtL8u8y+U8fw89pHQHY/j2P29LjzJh0vv+
	MVoi/IP9DjeEMwGiufiQhKV8Bsu5Vp6wcvlXPN/pSdZesqgJZ5aAOHWuuZ39TBFe6m5THldNGf5
	FgXmf7/30m7x6AAuXzqGBwZWYy7HOXRid1IsYc3eYgLvOUT4675ZEqg73roMGyqWSc+2d42pxkk
	ey072uArX1rNgM9dWSqeOedIEKvMO0eKlvx2biilDXrfeYl3/Rfg7IRFJs+k4mq+YGoGkQk0Rfr
	neT2Q==
X-Received: by 2002:a17:906:f582:b0:b93:5744:aee1 with SMTP id a640c23a62f3a-b97f4a1ac1amr400205566b.51.1773907973433;
        Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm399884566b.63.2026.03.19.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:12:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:12:50 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
References: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
In-Reply-To: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773907970; l=2916;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dCF7jFFNaQYySPXUIQSlxZ6rCDW5AOggp+NK02rLQ9U=;
 b=Lg7tagahpr79rZwic5irOFY1Y6rXaDP0dI/gdq5cOsOUQX9hk0x4C5VGhOQsJPwZfnDKuJ1/t
 2zLHPyffFz/CyZIfr11WNDcX/IzO3io1CE+s7whS6K13W4xyQpytKzP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add and configure the necessary nodes to enable the front camera
(Samsung S5KJN1), connected to CSIPHY 3.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 ++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 47 +++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 343da1b18095..6cbf6ba5fbc0 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5774,6 +5774,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index c9c24c36ba7e..aaba40478891 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -626,6 +627,24 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_s5kjn1_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -666,7 +685,33 @@ &cci1 {
 };
 
 &cci1_i2c1 {
-	/* S5KJN1SQ03 @ 10 */
+	camera@10 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x10>;
+
+		vddio-supply = <&vreg_l6p>;
+		vddd-supply = <&vreg_l2p>;
+		vdda-supply = <&vreg_l3p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		port {
+			camera_s5kjn1_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@51 {
 		compatible = "giantec,gt24p128f", "atmel,24c128";

-- 
2.53.0

