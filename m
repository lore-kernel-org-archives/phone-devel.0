Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C814329C51
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162491; cv=none; b=VyZKOiwqpS6//BIb5TdvSj4a6uvJw6Ojjo41iSp1dt+LaStgUztkB+HmSTxyt/5Jsa80oHvbxtCWk9HdkgaOX8v7NeZZYVHTgsBN6begRRx/rCv0LcZwTgZtYURgzqi2kYtBMIcbUEpD78VMG0Mzm4bL6zLSeF+7Wd55jC1HEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162491; c=relaxed/simple;
	bh=LbaF66ke8LZxZbzBSqWF+LbtIQHMEYFknVPL8JPpg/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONiYbvq5Glosyq8FhxEaBjEEVmd6ofsz+IZyDjORvDTA1dEo2FWOrNgiQH/7Vm9GqZ3tiwa97ehuS1bSCEE65+naxdU5Kfk2qqQozU+jNdpo6P8+RoU776XXi1fZNXzyYLb5v3uf0iMy6Cu2N6zXza6kZ0FI0T8wLVvDNaNaYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iR/HRyWy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iR/HRyWy"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso2649388a12.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162484; x=1766767284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
        b=iR/HRyWytBvsluQHGs1uWbZEyhdPClEaoT+6qL2mpen5W8cwT16x/EKBTRCLrVnH/R
         0Z6KI0JJjxzMvtzUZwHXX1AeDtT1KNqo7y0d1xOIgrDqZJHGINyrqOIgnDYSj4u/UlRS
         Lge7gKT4q93y2b+mSRklybGNo0Y+HKvkm4IC3Yiz/aQVJj2cg31QsckiRTtA8QkgBhx8
         j+cDWpA0ECla214yE1h4uPUUzOfPsnfC63Fxy1xKDuo/FQKEm5qU65GG6IodRM/PkZEJ
         AsfCna+CZvjwRbTl5y6repf0fc1rj6pMbHEnSUgbknAj9WTOfDWljTcIOEf+uS3Y35PX
         6lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162484; x=1766767284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
        b=Bf/VBcj2ovBjeFy/RqH6a+yR/BUsQXBQ4V+znHJpSrhtmegR4w6gZ2BvJ7Po05+4td
         1r1n+LwjO9UQ/qyPDaBJ08sI01x+DR+1TX4GarUOpE6dLMUYjpYdhd/2ZWPckHGh9x/8
         hVXr8PgrMp4is/UPE5xopigZGLVLBNlFUP6wCyrr5zRkHigM7rHL5o8Okyw+s/VTpND8
         xb3n1FsPqKEjvPmiHzoKX5+qhPXJPaOW09U696RdZKq4WueMpXppLANKEASwP/l+qleE
         hAFmFDnQdol8krzfulc/RSDuBiRwK0Itoz0AEOGXoASLK9bWJt8ITN5Pxw4CfITNrXyP
         ofPA==
X-Forwarded-Encrypted: i=1; AJvYcCX1IHxK7z4ugRFLzqBBsdI4vlYDiI0QpV95SU9CccSVqX8jhXiXsOVMyp6w+z0MFyRhh7sFJJKUnlrCvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvIUcmO/Ng40na2l1yiKUG1oou98AbtY1l9e0ibGMvmVVNbwI
	8kIkEl5+5RuE5FsweYYRoZiKyYB5JMZ/TzJglqAHxt1Uc3L91p/h93WFL64JIjGI49U=
X-Gm-Gg: AY/fxX5RN+lTibxbqCNsxSzjTmNF72hyaCgsca9I6VBnxsypWRxKaip3hwWtraS1eMu
	sWKKVeOx1x5AbWhm+d4lbEeNoKv/ACS0Mvh1bULh27zKEmiG/OiKRRPTtx4sna+MfLIpe1kdGAm
	z/AbV/GiShmkJu0wv0qKLYLoulCAV8BO9QElfQeOpX5kS0Sj3M52ncN3uM3RAfW8iKsmp81hnUH
	Vq5bhVZ0RSSiYsSdqKCjcX2LdWLmYSSUdKexO7XjlE67x8KN2ksg+XsuvLZzQZ99nHeRQsE/L/o
	CoD2o9euTLQl/KdBbJV8wu4zIBCz44rM3FUVsFYtiRKte4vmJu3CIOjkrKrPhkOtpRrWlTmyyOu
	xa3bCv/FDsw5EN5w5dl+9xUCksvYHsqldP49O342GiOPAcGVF3M7bin8VIzfkJtRt5xENgIzf/3
	5rPWGUFzPtJzBov/u/gJQJsOYtTOT6Rj7hqs7pNy7wqBYxqkRt4mCLUr85lVPzDZTUA4i+DEnY7
	RW+1Q6FZZt/GYXEH78bf+9JxN+9gnxg4KU=
X-Google-Smtp-Source: AGHT+IHcMyLakLOiabV0zgp9j2BbCuOpJ/ILNqwAtFawoKOVX3o7aGBaAA9adOk/BitF1e97wb/uow==
X-Received: by 2002:a17:907:6d23:b0:b7d:266a:7728 with SMTP id a640c23a62f3a-b80371f8f50mr342762466b.44.1766162483979;
        Fri, 19 Dec 2025 08:41:23 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:12 +0100
Subject: [PATCH RFC 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable
 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-6-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=2578;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LbaF66ke8LZxZbzBSqWF+LbtIQHMEYFknVPL8JPpg/I=;
 b=Rv0hSkSQEMyym7EIZ+cVRBj/6SP1f7dhM4pzbEWfaCF2YNFHzOP6VQw+YLffiycuav+hx1xjB
 GC1ASefj0LAB0zCj980vbPgQ3vI8SRE/lnefKNNv4uybbds++qyTiBv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 71 ++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 92b40ab56c26..8cddab412581 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -612,11 +612,6 @@ eeprom@51 {
 	};
 };
 
-&dispcc {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
@@ -725,6 +720,51 @@ &ipa {
 	status = "okay";
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
+		// avdd-supply = <&pmiv0104_oledb> (VREG_OLEDB): 5V-8V
+		// elvss-supply = <&pmiv0104_elvss> (VREG_ELVSS): -8V-0V
+		// elvdd-supply = <&pmiv0104_elvdd> (VREG_ELVDD - OLEDB): 0-8V
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
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
@@ -883,6 +923,20 @@ &tlmm {
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
 	ts_active: ts-irq-active-state {
 		pins = "gpio19";
 		function = "gpio";
@@ -910,6 +964,13 @@ pm8008_int_default: pm8008-int-default-state {
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
2.52.0

