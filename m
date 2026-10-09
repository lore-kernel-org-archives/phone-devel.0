Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F574CDDF4
	for <phone-devel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545128; cv=none; b=XCOIZoovKCnmD1tlqnndSTOj+iWkp/IXEaHxf2sO2tnxvcEOUinQc4eSh8VtzxPeKy2INC89MkBnhBMbZMUWx3imqnlkoNdS+jgJIp/gkPiT4Xs9PzZfEevEVsFHo+CMf1lddoqCblni/7ivJXBbKt3h8lTAx1EgwRZVxt7Xdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545128; c=relaxed/simple;
	bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8v1A+l4juY7rSWzxc93WwrhlCYJm33LOdLXxcoC3NoZ60c9luEAi9QBLzvMmHrIJaqB82SCvNMzFtdY3vr1zjEvT/SIRyCdRPr9NJhzIIE7vrmUfaMxfTmb0DxDBydf81myc9s4Z3uwvahitJjQMvY+2iIJQ8cFH1YFKlb2BZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EHdwTzMi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EHdwTzMi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso6211622a12.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545110; x=1792149910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=EHdwTzMiTjdZbLMA/h1lqRsfXHXfVAfO4QghI2VWYjNb/tf0toHzR495NlzuxRbG2k
         4AdtS9MML6liWkfK5pJzr5XAyX9ZKw5llpvd9i1Tj46GRIbpZUOHNPmzt6tMtNEO3w2b
         GpE4ai882MtPjH9zPmpq/SGX37SamqUPcP4SR1j1TL6yaTgx1NRCzYqdXHmvruE+pbYE
         U7/WXTC4z/4EWSZ2IssKuOnqOG0WjQSbiESwpzT7f4EcJ3NH2u8db5YJ7jWbyJaTRAPz
         VGgcAIimbCY/o/ZqAElE2e5nGSztD6BCRRF0P/PAc5IFYdEMY1Kdv1jATchy52W25eQP
         HrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545110; x=1792149910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=028EQtOc9YELit4nemriW0AfwZj2Uj4ikoxM9hjtnD3zkPX1ToKFMfb7X34BstEvYz
         T7OTe2K+Bq5wpZ6x7r+btpHJZegknBC/bR23Xd0bctmrV3CYhX8PUQyXlLSfhn/xTLBy
         gLTW9bqn9CWXb1JmHtrR6ELvOIyTw6CiIxx/zU/gMjJG0Dw+odHUhjGubtcBM9Ysg8/F
         UI5ycTTJHsIHvhFVp2vH/o62HBQex9nTfvu5iskHwfPhvg2ty6Us6ZZPRt+bpKvyLuv6
         EfLg4+o4U4oKpfzM2w+qRoPpKuidcm6/QrLFyr5sytwWJHpYCqXNyWQQivb8xKHm59TV
         CsDw==
X-Forwarded-Encrypted: i=1; AKwUvBwsGrX1itoB1v8aeeTSrnBNNp2XAw7amB7uLWN/dUBfwaBXfpbDTKCFYSCl63iAn/JyRlxU/tDGmi3Xfw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpfyXZLYqZZJswF9wSOvPSfZnIkFru5jRmXq36tpYJ98B/VJWI
	onCyN1Fjz/AYKZXC/IjlaYE2w3o+WC12uRDURBqYb83dB7Rx948mTan4aT1x93Zb1vo=
X-Gm-Gg: AYBFou1aNc7P2WQgFNUos5LexMVksf7/n6VGSB5ra8mQCbQu3JU98jxbtF0nVM9M5NX
	nQnMlwJusiaXSfJ8qYiXHmqfYV/dEbYfhDUDd0hKcLH8C6LBSYsTIxm0LwE4kGhKEUOMe5gR4j6
	ivw9sYm6FMfY5RjZ6uzYrAGETiEJ1iPX70fQtrHZvzanBUFMEl54qKoZlQdy7qisiFaIULp9Jui
	11gVUVaknQ12zStlO/O9VaLRq8EQttb+NdcNKMb92pj367Eyzg/LUfm0PI4iOSdRu46h/U6rene
	hWxSswPI1qQP6zRGHretGbvSUtQtcLUOjOpdscIgEQHX5RU8dkVkpQ+7e/kJlweU1Cbk4RWLsmi
	lpIjdRkPiVoRMfN3XIWUeVlbVBwbaAEWtqHxASDgY0kysAQCXATihvuWaGG/IXh/dnpx0B7XcpW
	12+Y7eeDpZodE92IEkH6SR1cI8GTFUW9WU2gbLFa3nDQhIA1UrbOWTz94PhmBUmuf/XXSYJosAd
	O7ZepqoJhUqIfXTbnU9PYeJVDZjguip5RiU81p+w46SDtwiH//Z
X-Received: by 2002:a05:6402:190f:b0:6ab:6e:a8e4 with SMTP id 4fb4d7f45d1cf-6b17c2919a2mr1279444a12.44.1791545109895;
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-4-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
 b=+RENV5BTwuJZenkB/tqi4Ledclqeb7XKWAMWUX+RVt0JGWYi6hJZJFY91iUXFwZmz89TsCRE7
 /oHOtl9hGpoA3+AJesVeUI7yU+ifKJovTWzz+fN4xrzyAidTMUrrqNm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4e8777162b53..11015c3fa331 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -709,6 +709,49 @@ &ipa {
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
@@ -872,6 +915,20 @@ &tlmm {
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
@@ -906,6 +963,13 @@ pm8008_int_default: pm8008-int-default-state {
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
2.56.0

