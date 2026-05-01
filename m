Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084C3BED76
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643584; cv=none; b=umHQb3V88QywoEZSDn3rIdjKA5msvQjlhMterUlPEQzIVTkBDc4akVj202QapBa1gWvoDsW6dEZNfP6VPcZEhMw7XjyiJSoLxkNLG2xwKwkGi/BwJbx17HXsedmPNLhNI7gHAFHv+AGF+wJAvKHbimmZ+0XwTRd63tEY5xvNZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643584; c=relaxed/simple;
	bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6Vq25aNZwH6XOWOSRxsbSljN/LTqtiGTVHwdIo43xZ66uiH1cgBMA56TzUzRsqeo+sQNYev/JyGePykf0G4Y9J9F4PRf7N9uCsOLDMqiBVVTeAfsMg04o8kM2PX+kfdOv9HkOdx4Fovyncexr2+VoCTBx5AfjkFHCkIM9QbbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WFqjLdgq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WFqjLdgq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso14262815e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643578; x=1778248378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=WFqjLdgqikb2NMmt4R0e8pbx4vsG03mmeG9DJn9HCaGT2C/j/P0yZKs4TI/Y+7tE+0
         BD/bQPoHd5iSu+10uuqChkc+24vrL5sGcBcYM+40V00Rm4mqY2y7i4bB3RGkphUi8wXD
         9+i/kaJhyVGf9Ai5Lrch/2LPCoaskWgHnVbyqy6HZAUDbkjgjnpcfgXGg5dAh9RzYD/P
         OWtxEn/Vl3lyJTvn5a7Gnsyr+fUeWRhKSxhExra255dJncv24S9OnrxTcJUgcHIrU9tX
         4SaxMIkw82t0/C1bURo1HwFxcDSG6iSDb7wLHpJLa3DhVhROiWKfUSupQi4HgTbu55R3
         mYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643578; x=1778248378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=E4GObVUcwb23/MZvs9F4du5nKGAZK2G9h7tW6OyRUqumq35vbd4KH1/+X8QdheWXp7
         jPiex3MjwhPBoEGc9BsNJyrmgrqy1I8d+G1ySKjRmOyvuOhBAvFxHlSYKBy8wLqYsERo
         /HtCnaDO2q1HXryH48k3JS7sg/SiwjHh+XkiwP7HCX95l4zK3n7hReZbMYBOdq+uUALA
         pbOcmXJF3HO2yx2WQe3rgkSELmBsFUiYxcc92kpOjpOJPP08/fILYSzF1GNTZ1tup+pX
         t68ls7/c8xJ/PkxBB2xL/M8ROtRGCzgzG902tPqxdsXNKWSZ8RNWuJKFrB9dfQZuuKAP
         aWiw==
X-Forwarded-Encrypted: i=1; AFNElJ9uLAZYMkh16hi6dXNtIMNJ11R4ojn5mAqNNMF0o8AozvuNNfE9Cfsp0w9SSbmdaGtuolH9wDHM9QpzRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycXoAa3cb+aR9/2NI/7fC5smw6fm3MOdtcRJs2kyoiY40sLDSJ
	TjYk+hhDjnKebh2LNUAN3z4v0dJvRe3x+XMKc1NyJxPSMS/kWxAolGop/xf3VO/kmhQ=
X-Gm-Gg: AeBDietgTDk3KSfCDDIUPldpDv7eAscN+a7oHN0s6QXNoQxZWsyprFAw1cva67hCHkW
	Pfm9z+LYFQf570Tb9QMfKjlbwPURY0OZeP4bi5LGfukdonyT1TskAPWARulN+94L2hUWHlewcW3
	ICqQS5OfbCTaD6uQqj0qn/WP7+myYEx+mrm3ZcbibmwbSqCXtMqWt3iQFnSgIazRL8SvoNIo75O
	xccOjvRV9UAVjYIY3sDUNZqunrOinPAKcEAUZGLTVZiGV59sj9zi9R4Ml8/k4BXFY7/U0kpb9Zo
	ABgq+JDkLtgJxzT5UrGIFQ7fq/Z5h/LiljeYJcpKCHgFWrzvLv3nSAfno8IomAP+wF+MxFuX1wv
	9HZZRMVSHswyfeL7pLe8+6yktONeCIqeAPLS2vyQgeRckk+ohMJQ6tZNqPGM3ucW/veEabS6Fy9
	4nKKNS+Eg2YGTnRmOelkNbryeVf1KFZxGs8/Gqs3hTrBzJrWvJ5c6/2vh4pmjEfpRaDZn4RYGiD
	k0MD+PQ
X-Received: by 2002:a05:600c:154d:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48a8452db0fmr123395355e9.25.1777643578635;
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:48 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2182;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
 b=xUdq3R4ju7VrrbMlrUU/wRM4VE4j/Gq3F++FNx2yt2ZNSkOtxB3Z6xk+BWK459qJKnyJVug62
 HKSGQscN3s/DYYGuA6wGOJHtguzdzmbEjMcO1sdhcPpAPHGR5hKvG/z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 48e87bd8ec2f..a6c467a27d09 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,49 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -848,6 +891,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -868,6 +925,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.54.0

