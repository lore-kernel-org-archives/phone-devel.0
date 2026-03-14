Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA9381B15
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524800; cv=none; b=mDu6zMgVAfL5MXhM5Zz0kvjxB13Nzq/Hat1zX+godRn5VJvm6vOyNfXbECoE+h25Zw8/ZTfBNhBKgMR27SigPskTER6DVbOhwFfS20qKF80JgDeiv9rsja9XVoACS1h3woJxSs/KO25aP2gPAUPAYfXmRMrEdl9v8U2vQWOVkeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524800; c=relaxed/simple;
	bh=MowvpUKBHWcPnQE4YIK2nePYkcrVYnXiFtHKOMsDddI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM4HG0ZhbXfn1DOANaW+pBNNayZJHX4cz4Lgh/cvmZvLX2m6h/oofWvflDx7pJHXp7SmySx/lwUm3J3FFE0y/TidwovnbMs0CGn7BtS2WDv1G33r1IslRUANdfcDN/YBkKx28END78g6EcPNTHfAApkYwGmRKppYMRsrYYZXrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0GuyJfQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0GuyJfQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3425050f8f.2
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524794; x=1774129594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsoJTFfN3Lcp672vnl+BCSyX/e4yOnsEQpHNAiLSlIQ=;
        b=A0GuyJfQc94m5UEhtTIfAdq56YUBCYJWaSTIsRFCT6Kgz6om7Ixa9ZtQ6UhzyQF9MH
         XRUwy8aBrbrasIrhuDDENW++4Ap3cgP8a7pOuTQlB3jFPdCoTNWeoSNFcmUQzkzHSqDN
         4EKSOHDYHmb1KYoxly/puprbnFDn89A+YQnmkIZjkhhmBSEjcwINDA3o+YJz6vl1ZYlM
         vyT29FXXpPAk6Iem0Xm52K2L2ImlOr6vBOFbl+U4RPjk0LhlheEa9YvXsTAbuJ1stGXs
         nm5u1sM3hIV48KONjgevjD4kID32ehSZ6pQalctH9JeMGfth2ieGsKQ/jiJ/eCBhKtfJ
         /f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524794; x=1774129594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsoJTFfN3Lcp672vnl+BCSyX/e4yOnsEQpHNAiLSlIQ=;
        b=G51JFCC8/W4v/RTMw5lNQHSrf34uThlPJtGsFrnXCfCTsx4/mRzHyidCdTMez4BlZk
         GvWleIJTp3FoIuVEe4GQMeSs5kmGCHBVDhdqwjPQbxgH/ubeDJngBsmaFLnhQIiW/9EH
         iH4xhpoeQXcydQE/buK8aHhyjWpDTEmZIEgPKuYWkHaPSJoppZh1Gbd8TM1MkSPtaG0o
         Ghsl7/OwNj+s+tJCT75FD5g1o8lh0ii5Mq3ZmAS+F/fLVFuxigM2J+/gpp5nn4ctYvmw
         ZotJAL2qlclzvq5vI+ZwLcF6FvAG0cIy8o7XNOL7u1Xlbhehdpx8JtNTK+zy+AfCk7Eq
         Tc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAR1Nex+LwS29T5HHAP5cV0tUoItjb2cr1goRgGwPQzkJQdFi6z76MRnHopq672+Vo4HHwP70a1DdJCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkIBNHOxu6bDjLobcqPN4RvuJk16ap1Jf820jtpZO/XNmN/0G
	Q/384J+oeyPcSiYQvM9VwNp46vLZiFV477mZtlacVRG/z1jTPuxk/Bm5
X-Gm-Gg: ATEYQzyhoKZweCE9r0m0mXJbzim1lEpAUnu6xz3icrM7vKnpHa4+RRfvdoKrZJOaYFW
	NQDOXwRlgXkXOGPxNp2ZiOAumuQUB0ze8frgEtMFwD/PHR+xUDax6H7ii9qOCvh4fIih3ctHPAX
	+pGj8li4c6Lf/JHo+eg6J8dXvCM0OcBFkJfe8g4RhlIqjKHOWsceS/ac4GKcbBlE8hkyg6CC29D
	NrZZR24Rg72SqBfpmyzDFmnssf0yJAwnkTzYzgEiLF1MLA34PAv3mtsn/DhQLrkLNwidXt6jT97
	sEmPS8/vdhOEicvvoyTrdkw/hNcvGdwZtH24ldMDkXAdPjOaoiLoCFtlbY4X+SPfTs3gp8WtKWz
	qqxPBB+fg401BJvJqcHpeyVsO2aJiu4C1OpYvFdBIr804nUNQxBguCKlEOEtVNgybO7elCa5rne
	0m/2XkOkVNrRzQD4NLYLZeA/vJmAH1iL9+uc1dY4C4FVgV754uXv3ITcZ+cvMPXtw3XDWWhpgq+
	Q==
X-Received: by 2002:a5d:5f53:0:b0:439:bd26:3c63 with SMTP id ffacd0b85a97d-43a04db4bf4mr13896214f8f.28.1773524794034;
        Sat, 14 Mar 2026 14:46:34 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm28756221f8f.4.2026.03.14.14.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:46:33 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Sat, 14 Mar 2026 23:46:23 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524784; l=3473;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=MowvpUKBHWcPnQE4YIK2nePYkcrVYnXiFtHKOMsDddI=;
 b=fjAjMIu63T3J89KrTMFMgceNzP8z3eiyQ/RYVuk1rw4Xso+FdysYzfH7tFEqPaGpEPjECwufA
 ZyYAKfsa9lhDS0lbq+DfbA14HoN7LNx4Kv9qt9tfs+0v9ATS6TkkIjO
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
DSI controller for the M1906F9 panel.

The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

mdss_dsi0_phy is powered by VDD_MX, see power-domains in sm6125.dtsi

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..9b046d21da1dc54bd851a94d0e209bf1763e865a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,33 @@ key-volume-up {
 		};
 	};
 
+	panel_vdd_1p8: regulator-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vdd_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		vin-supply = <&vreg_l9a>;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vdd_1p8_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_vci_3p0: regulator-panel-vci {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vci_3p0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vci_3p0_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +155,45 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco-m1906f9";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&mdss_default>;
+		pinctrl-1 = <&mdss_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		vdd-supply = <&panel_vdd_1p8>;
+		vci-supply = <&panel_vci_3p0>;
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
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -387,6 +453,34 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	panel_vdd_1p8_en: panel-vdd-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_vci_3p0_en: panel-vci-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0

