Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93AA37F8AC
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461187; cv=none; b=cIyUiCzQy1S3Cw5fciOtvVGWxps+OyPECZ2cQXHTnO46VNtGiEeOF7jSqEiYrPTdH4NuYLmFMx9k/0PdPXv7bTKEzLuDLCE5lcrlv0hTGgMTlgbntBX9SL/FKo8yNoAGw+70npfM0fs8fDo7B9KkfsiN5Q/9FtgPABULSvHCZLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461187; c=relaxed/simple;
	bh=qoLnYPJqnHUVZXd8RXxjoQBFw/TAaSr7XQYY2BSu/bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dmuir5+zdCzPXGQpxIAPoel/ppx8aHwJMUf3A6ilLJ8+vldPp1zGsRTQ/Fx2VLV4hBCI2LhsKwmAKC86bvHmJwW5sYs4TubXK1FhO+dY6PWe+GGbNqLCRaSlyjGZ6iNGAN6Yii4GckankFLnkiSbjXEHg9BlR7vwsNpoFOb3bqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u5N5Oy57; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u5N5Oy57"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso1092643566b.2
        for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779461183; x=1780065983; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGAwIuoj5JvRKNrPuvWOwKjLuq0UQO0ceZvzFpGZvlY=;
        b=u5N5Oy57vwLrbKJSnZYz/7tQLXSkpkjZaNJHbwoJWSoU0REFryn84yyhKsSVvaoFZQ
         STJ8CCGVrzHlR6U9kyp6Y1f/SVnMYC5IiM52uk3RcjV5WV8uLnruNrDZjgjr4rW+lSfh
         9whWfB4DBE7D7mCMB3y6UMw6m1K71rAhdc1gvWp+MYdG+33Z+vqy+K2i3Lo9h8mHbeCn
         9wBqyMsyYSbwhUH2rvksmLnUNIWFwoXsHeJTJVon+aSN0iRmQix3I227dGlWtXHhKcuZ
         fNpu9KCBNfCGM3R2dUPfRciD8bz4PSkrxVrkOODy26IK7CreK/TJYNbuOYcFXDSrjd8Y
         Pu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461183; x=1780065983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGAwIuoj5JvRKNrPuvWOwKjLuq0UQO0ceZvzFpGZvlY=;
        b=AX4upvwIJni0QKwD7YO9mCt7iGbyQiGO0jT6aCP6DKzwdqXyr16dgMUtILsc/z21A1
         sOZAyYNQpA+NaEVKeJ/WurT0L2CvaFHs8QyJnPo9ww96lRL/9z2uGslbyDQFcRFFd6F5
         5URW9TXCMJWb+31qwaXSdC7wfLctllFWhr621nJR/jURLMR4SQhh0qqHjPEzwcfFecLI
         SU9nesy1ay5Ek6lVccSgYTiCziKXXDJxcjdL9EW79ad64GY6U3V51EfPSn9t94Vf8S/H
         02LMAh0h/1MygPQiKWI32FUyvQt8605KepcRO8HB/shTYIAarhW07IGLrDfg+Zp0qozF
         tsZA==
X-Forwarded-Encrypted: i=1; AFNElJ9u+F3WWvcRZb4Mfej6f+lu4lrquQGpCVU7nbT00u/LANZ6U4vz3NlSqnUj0haYP8Z7+vJXiHDASgUPug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRaDYAxRiXvql99SuBRnz1VjOoQ0nNrzY2Kn4k5k4ZR/r2b7xT
	K6MtzTa+myZABlZCARRQl3i1MlA+FlvHIoI08sugqJKGE2Ocfa6KBF464StQ90aYNPk=
X-Gm-Gg: Acq92OHthlBtSHNK3bomnqO2t7YGEFn8iaYqD1BNoh3T1IOHrdfN2zpVzM0psP+PGKS
	g7OZD+bBkT3j0hz/dxUA+qh30syk7TCFdutwBIIiKHD4sH/bho5EbuRVwkjFv0QQS3AkSdmguKY
	DJEUfDitOU+VIW+YUScvXJnVtBKHzC2EJexY7mBxVej/7lyW9EZRBawALDoU6aeYZP0ST5R5v3W
	BkwJyXwCXfeA+MywnspKrgcgKbGXWYhqV6K87rXUK3RbnbCES+BKBcMxrpzEwgpFHdLuDZsAOA3
	D+fExc9sMukM0pjgLEy5fMOSHfFmgpGzQyFSGyjZ8amterhRCPA7DyJYAe/nB3vK+EGWOnncr5z
	mkI5ik6izfcyTULW2V4nFzUTUFGagvtxvnTQbrnyNbYcicNJkXd9QtleD4OQYZLozt69qTvGRAZ
	GBR4dZ6huzxnQerTsIKzXNos18L4uWtRJYjknVE5Iu+mCPZTc1PBtNjzdkLFlNNh7kFlHGJEFpS
	10ifw==
X-Received: by 2002:a17:906:8f15:b0:bd5:7a3:a58c with SMTP id a640c23a62f3a-bdd269b72cfmr257887466b.47.1779461182976;
        Fri, 22 May 2026 07:46:22 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc69d78cbsm59587966b.61.2026.05.22.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:46:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 May 2026 16:46:21 +0200
Subject: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SS0WmK4imFRylRHbCttMSSEu
 1uF5Uvef3+FRJEpQVutEOnDiYMvIE4VmIf2d0IeCoOsZVMrKXEMA+sR6cWZ0GkTQ0J7IWXEVdn
 mrKEs35EsL//qrds5zf2TTP6lDiPSNJe7vGvQ60RognOc28rTkvG4FNBt2xfuMR2RqAAAAA==
X-Change-ID: 20260522-kodiak-elite-macros-f4e5c185f63a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779461182; l=7874;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qoLnYPJqnHUVZXd8RXxjoQBFw/TAaSr7XQYY2BSu/bg=;
 b=PT+PSVJMoAsWcJ+Xu1Fo5SeW2/jOSsYSVBnybUQY5mI7iluYfbTQ+Wxm06Aa0WE/C81xvnmeZ
 3WiGYInMz3FDYgJu7b0NR3KIH7QW2DsmYctgMHHvJh9vyR/lUhOnc/m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
and power-domains for the LPASS RX/TX/WSA/VA macros.

Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
deletion of power-domains properties then.

This follows previous commits moving Chrome-specific configuration to
the correct file, leaving kodiak.dtsi for Elite and
qcs6490-audioreach.dtsi for AudioReach.

No functional change intended. The clock-output-names property will now
exist for both Chrome and AudioReach devices but this shouldn't have any
relevant effect. And WSA macro clocks weren't added to Chrome because I
don't believe this would've ever worked given it already referenced
q6afecc and the nodes were originally added during AudioReach bringup.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 48 +++++++++++++---------
 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi   |  6 ---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 38 +++++++++++++++++
 3 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..bdfa6cd47a4a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2681,14 +2681,18 @@ lpass_rx_macro: codec@3200000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names = "mclk", "npl", "fsgen";
+			clock-names = "mclk",
+				      "npl",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "mclk";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
@@ -2734,14 +2738,18 @@ lpass_tx_macro: codec@3220000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names = "mclk", "npl", "fsgen";
+			clock-names = "mclk",
+				      "npl",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "mclk";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
@@ -2785,8 +2793,8 @@ lpass_wsa_macro: codec@3240000 {
 			compatible = "qcom,sc7280-lpass-wsa-macro";
 			reg = <0x0 0x03240000 0x0 0x1000>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
@@ -2858,12 +2866,14 @@ lpass_va_macro: codec@3370000 {
 			compatible = "qcom,sc7280-lpass-va-macro";
 			reg = <0 0x03370000 0 0x1000>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
-			clock-names = "mclk";
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "fsgen";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index c1867711298b..037a5f6c030a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -11,8 +11,6 @@
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 &lpass_rx_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -33,8 +31,6 @@ &lpass_tlmm {
 };
 
 &lpass_tx_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -48,8 +44,6 @@ &lpass_tx_macro {
 };
 
 &lpass_va_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index debf62baec9b..5b25501484fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -67,11 +67,49 @@ &lpass_hm {
 	status = "okay";
 };
 
+&lpass_rx_macro {
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+};
+
 &lpass_tlmm {
 	/delete-property/ clocks;
 	/delete-property/ clock-names;
 };
 
+&lpass_tx_macro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_va_macro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
+	clock-names = "mclk";
+
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
 &lpasscc {
 	status = "okay";
 };

---
base-commit: 1e45adb287ae5d431afc9900b4d387f4e73d9406
change-id: 20260522-kodiak-elite-macros-f4e5c185f63a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

