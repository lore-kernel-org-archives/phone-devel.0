Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93AD3C5DC9
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017717; cv=none; b=JB5p36mAPAD/lovziCQPFzS4+CyoxMfN/6nkjjxKLyDFVEP0GS/+1o3CfoqWdugq37Jyttm3oxENweRJZdvBjOfXH7G7o8iXaJ+6LKJ4v0x2gJBiQ9dYe0ezXlDmt2X/UNujIyOz9h+Mo8E9vFepPbF0DAJEPAO0HfrQBqg2itQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017717; c=relaxed/simple;
	bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJJpwKGRqnBJwwo7XNmLxBvs2+W9zCCLP5wGP0zfrMl9myj30ywwdhf/5YmRwwWYMvGEfhStxHBu4QNsDtFLnoQwzcX0PhA87OoGnEocE5lIxNyXRxy28LM4v3QDTUwOnP3sbcq2V69eRtK/PwIl+0om0bZZDgXj1Q6BsGBpw64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiapktGZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiapktGZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so6306755e9.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017714; x=1774622514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=LiapktGZ4JfS2M7bsep91VwHnX82ukv5YFkvouT+UXjArsp6iHoRdUFMLEnZVIEuRC
         pSQ5c3KjBklD8cZ9LHX6jwVPsH5uq5+yI237zY7m3JN04tImg1Wuwi+gW5/rCpM/E5Zj
         dn+dQY9LXaIPxkc+cvmWxko5U6LkpgzN+Pv7vrY/EkCvs6nKfSVh2maodGtxfurLBoPr
         K+Jx9MCJtSgk0qdRVRpkGlVMBDAztUv2vx2+wMs4DCMXNx/5VLmKuBvJ+lMiUCrqz7Bf
         c9J2c3tIWFV/kXfAZDHdq5j70LVF16n8RwKA+rxEByXCbGZ6AenxEfuBmIQlIMVM1Hi0
         5Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017714; x=1774622514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3uDCj5ujrrN7s5sHc5emouOCi1WukCaxLeNogjD46M=;
        b=K5XRAdF3aDEIEiOn4P0O3iVR3M/sDRFkNk8vJ6h0QMRVkF40G+wp/FwL/PzSj9fDC+
         DXryGUW3Guka2J2JPJpJajvyCs6aIJsYpbNlEpJOmnqH+jXj5VV4wBrSaYlPxKH1Z61E
         osgUSAR56Nlohfzy3f0+w0uEz4iCox31mUU/yc70itBgomISum8AuFbobuI1zXQZ3rwc
         i9+Irh7u3oqf0balCs7vaWqT2FL62BfzL4d1P3x3ag41e1uKwwdeB/FaJbNyAxpQzjKx
         tU5y0oaIDIl74rleQ+XzPEgZy7cAciGUq6vUu9UVk/t/Pos3QGk/WVQyaDxNdyJ0Ofz9
         E4AA==
X-Forwarded-Encrypted: i=1; AJvYcCX+fpuSjkVI33AvAGwzS5WgSEx6qqKUeVvOlqEVkRSWJj8Uu2fT4378oIcwb+IrVtZP3hJcuTkv68FXNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtt3LAvKhyBVJVqR0tWByjNsfpeh3j2IFpY3xpC8dCvzcbNdDP
	EiTDdqbU1Lt3Jmur3YN+p3CmSYbTNc26ij0MvBfeXpO4yAa7czbLKcpEMa2lN26m
X-Gm-Gg: ATEYQzynr+IA4HXzgrngMQbQ+HshEABdzSvdZakc7P4sJRnKrgmpGubvF8pKp8KFSL8
	RHPoGtQGluo78JSrX68rQxJoHt/ZASImhgjRxwoJxXaUyJykEmgjrY96nSVdveoSBEamrTi3/x2
	aG/8i213vVK+D1i3OYK9b+fGfpr4Qk9ZS+y1UfmekijMa+xiL/GJWqaMm+axAlQFDDmIyUo4LdE
	npXTlB5Mho/AkkYMgLuremAHz6z79SZI4OnAyH0rSZ7iuBlYn51jc87k34TKRdalxXoPLJ4BE2J
	OSSAbedjskgkLxFMubuX77FnYagooG9h/t0HEdZLduaASaMm5of7DApo6FRhPg1PhC1o49TM7d2
	VYh+95wWfw3u6mszUocsaJ28DPItiHDiMBavP2kHG4SY4yRR0rnpIT5BN9cN1vTW6Qi4o7zx1J+
	nrmjET9t7YXGU3+b+AjzKCQTJtTzN21O7OF/DK5iLFcBFVZVnIujOM0PCLuXF6lJM=
X-Received: by 2002:a05:600c:4e8e:b0:485:3c8f:e4c5 with SMTP id 5b1f17b1804b1-486fee049fdmr47723445e9.17.1774017713941;
        Fri, 20 Mar 2026 07:41:53 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm130648835e9.5.2026.03.20.07.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:41:53 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Fri, 20 Mar 2026 16:41:40 +0200
Subject: [PATCH v7 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774017703; l=3473;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=z5cWtDke+sL8Ldiyo6ylOZz0UVt/fRNgwxPdkXOleNc=;
 b=WHY8+9XaoSxSSE2KQ2TOtpn78+34uCdIC1zeND3T4ovWS7EtUwqQymYR6bvjCFI+7j0eI9ZtF
 q5GKppG0j2nAzqcPps59vM1DfETVxG+iVYZ/oK+XO4vs6YBnjp05RIn
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FC0
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
index 994fb0412fcbdf5466f87a325c48b697a37b514b..6eb46967712554929ab68af6f3218396b7f0118e 100644
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
+		compatible = "samsung,s6e8fc0-m1906f9";
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

