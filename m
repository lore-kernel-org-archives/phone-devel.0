Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677831F99A
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809412; cv=none; b=Zg5qQUIiShzGhfpTZ3uX3Jm86zBK8W/+ZEvo9TbD6o2Vc8JNtSUCetV7LmT91H7XcsL/ykY5YftjKq+AkoekG7NjFG7NcTvAm78ycYiRO9y11qTRsm0Bi6d5i0w0hyyEL13aHIfsQeYIeUlFVM9sgEg98mW42BIAH3o95zCOVW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809412; c=relaxed/simple;
	bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oif7XmEtiuvVEk1hUih0fcYrv4eHw8sYieOJXTFnkj4LznoCOTTsOeEFewTDW/RLmsyDm6nZc4Gw0ME7WLGoowVokbk7vh9JJM809AApxorOzeKSzr7FbvcoX3s7APqXpq2ukUGw+Xosse3privX6V1gXjNZFgXxiORsC818FhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBPwvYY2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBPwvYY2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d75312379so9085993f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809405; x=1780414205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=hBPwvYY21w+3Kqj6/ns1M1Bz8PM2RUgx7L7AYPv27bqP5n1nxUYeYDr/GMP0QRLbAf
         /oB1excYIvSTwEFzycoE7gZ+uLZGSXkkxOhGEWlr1sj4evau5S/eoRUD15kXeLsmIAVQ
         /zThqbCBEgDtQOOFf+0AgUdzbNQ32pqguAi9De/6KVbLz/smPVETiEc7DbZznDd00EJX
         VPxfgWpQcrYI5ge9K5t+GMt/vKxS9x1UcJk4kvJYgQ9PanShUFU5df5yH6XHRRj6/U/g
         qjYJstEgM/HgP8W2BsiQrssQM7ptx9sdbLoeNbr8gFV5tMLf35TlMgkSwFl0ZwmFqjeE
         JbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809405; x=1780414205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=J54cGAg+OoBcdHK/iO9So9StXUVGPvlKjI/Xq47C9ciFvgv+QLjll44p3nEK3f4A7I
         +fkN8PNEm48F+0EUyD25mSEpTKDHtX1DI3DI9M/4eOsaIA6bO1e2kVJCz0ZzffkiZ27r
         aOmMfQ99FjUdDIzBHXn5XM119mwXoMLj7eDG8IkXW9/+SoNSfygx/KJ51JhYxW3AF+li
         BOSj3AY4QjBlBG37jNCQq7MF0wBdYugo2ZIQ8t4t4AGK9n5pLQCnCgM3qSNIGdk5BvoH
         +i6eUcloFBALkiPXpYszXoVnq0aY1CMFZg9n8Ve6fw75DfqPuHGvKMGRszLqYB7EBRKf
         oHDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xS1n6mp9Rlue/1FoXndoNNwxuDnbOk7raSjHI/O/e+Gi/al7FQ8Hw1xKNcac0sPEg+BCAyjqsBN3LJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaLpX+jNO2KqZr0pDvp2nucm2x+eTnzT/Dfvq40vQe9bHbEMR
	vliWRgKjwHbfk9dk9hHz5Oak8dZ8y2DPwUq+5CFywKJIzr5CdA+NxqHPLKBEsAu/c5Y=
X-Gm-Gg: Acq92OGAir1U0KRw6MgVnN0gWPpQNVKK5tkCEkAPt4G/SKdssaIzH2/No6/bhqKZHRv
	Nm1mjK3m4KhMwyXRUmzfZdxsfT41rVT1V1y0k6qUh0ahLzpOC3M6ezx/W6Byg6koipb48ObxJc1
	SjtWC0NquP88aC0tG1o06KLkxWjBrmLMSxaHf9bKEmt8Ll5Y3lmZXw/PrXs+tQtpuVLBnidwGeB
	qWNTH47/CNvR6Jdg13VFuA77fUU3xkQ2X1hJp25ZtwvQs6l9eMBIq8nurbBqoSaGpoHKHRJY4Qd
	O8R0ZMQj5N5BLgeyEMzn3l0OIuYDtoSnRSVakMyMa9paOLYed8NorfvleBjehvoDmQU9jgcJVyW
	C24bNxma+C16ncSJh6iML2xGtCAIo39uCGD4B2YQXHsLI4kVI+ZeLwkG0xCKGpifWqa+JCt1ylA
	nV0a0lXSs2NcIN7vHF/d5PXQHZIcmYHR2b
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr27242005f8f.4.1779809404418;
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:55 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: kodiak: Fix up LPASS TX macro
 v9.4 control names
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=6900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
 b=opyYbtZw6SUYmPrNcW3j6K1y7j4lAENYIJUfh4vzihODYxclG05oeO/6oBQLoTDqVlE9HaKJ9
 IcoBrff4BUpBMVnr8RGjImnxyVwIin1ve76FvwVv21237CSdGbl8J7L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

After fixing to the lpass-tx-macro driver to use the correct v9.4
configuration, some control names have changed and therefore need to be
updated.

* "TX SWR_ADC" 0-3 becomes "TX SWR_INPUT" 0-3
* "TX SWR_DMIC" 0-7 becomes "TX SWR_INPUT" 4-11

Update all usages in dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..565f7db91e77 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -860,7 +860,7 @@ &sound {
 			"TX DMIC0", "MIC BIAS1",
 			"TX DMIC1", "MIC BIAS2",
 			"TX DMIC2", "MIC BIAS3",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
 			"VA DMIC0", "VA MIC BIAS3",
 			"VA DMIC1", "VA MIC BIAS3",
 			"VA DMIC2", "VA MIC BIAS1",
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..a36bd6120ea2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -736,7 +736,7 @@ &sound {
 	audio-routing = "IN1_HPHL", "HPHL_OUT",
 			"IN2_HPHR", "HPHR_OUT",
 			"AMIC2", "MIC BIAS2",
-			"TX SWR_ADC1", "ADC2_OUTPUT";
+			"TX SWR_INPUT1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index c2cba9d7179b..ffe028bd0c72 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -101,17 +101,17 @@ &sound {
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
 		"VA DMIC3", "MIC BIAS3",
-		"TX SWR_ADC0", "ADC1_OUTPUT",
-		"TX SWR_ADC1", "ADC2_OUTPUT",
-		"TX SWR_ADC2", "ADC3_OUTPUT",
-		"TX SWR_DMIC0", "DMIC1_OUTPUT",
-		"TX SWR_DMIC1", "DMIC2_OUTPUT",
-		"TX SWR_DMIC2", "DMIC3_OUTPUT",
-		"TX SWR_DMIC3", "DMIC4_OUTPUT",
-		"TX SWR_DMIC4", "DMIC5_OUTPUT",
-		"TX SWR_DMIC5", "DMIC6_OUTPUT",
-		"TX SWR_DMIC6", "DMIC7_OUTPUT",
-		"TX SWR_DMIC7", "DMIC8_OUTPUT";
+		"TX SWR_INPUT0", "ADC1_OUTPUT",
+		"TX SWR_INPUT1", "ADC2_OUTPUT",
+		"TX SWR_INPUT2", "ADC3_OUTPUT",
+		"TX SWR_INPUT4", "DMIC1_OUTPUT",
+		"TX SWR_INPUT5", "DMIC2_OUTPUT",
+		"TX SWR_INPUT6", "DMIC3_OUTPUT",
+		"TX SWR_INPUT7", "DMIC4_OUTPUT",
+		"TX SWR_INPUT8", "DMIC5_OUTPUT",
+		"TX SWR_INPUT9", "DMIC6_OUTPUT",
+		"TX SWR_INPUT10", "DMIC7_OUTPUT",
+		"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
 
 &wcd9385 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index ce48e4cda170..bc492346f7dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -20,17 +20,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
 			"VA DMIC3", "MIC BIAS3",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
index b25df5a99161..c6606b1eb71c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
@@ -23,15 +23,15 @@ &sound {
 			"VA DMIC1", "vdd-micb",
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..e54379147d2b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -101,17 +101,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS3",
 			"VA DMIC2", "MIC BIAS1",
 			"VA DMIC3", "MIC BIAS1",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.54.0

