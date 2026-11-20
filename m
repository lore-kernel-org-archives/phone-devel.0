Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190101;
	b=CT0snKUGn5DCaNOjwYVq5Bfd7ZrRLgwU9qBa8YEZee5WFM+IVQAF7WD/OnG7DhUQm7vO
	 MOBf1YWMzQF+G6f64dRjzbwX3m/7VQTPGYN8KWVRySSJ49YA2H6/vaquGimTCHB/s4dvw
	 14E4hl9KsCn9xr2eBRuV6zt9vJEQqNSDxVpwLJe9d1do4K0RFXHVLg0CtQKi8JvnWuP7O
	 BHZ9iognM6P6DOjiDpW3kVdHfLa0GYO1eTMmrIymD2EmE+Li2C0pCP4AnLrtqTGR5Vziw
	 tuV1Z6YbEFnYxpfjTO98I7iKIzm+X+0yM1STSIuRRIRQbRWIc0vomJO4/M0zOZKKT/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
	b=WyH0VmuFE5pcXISIexGtXuknwqiqXq4Fdoz8sYkLOM5qmJrvXja12oDMHUQVORTPjJeB
	 4XgkO6r6iDEWycsUWVDRBuf4AeFQverPv1wLKeLWEW4JaMpLetFvpfUrpD2q9HqSFmUKB
	 wGH7LuWyZpoFRPp/yWP7A++WnMVk+zbE+BV7KSjeAwpsr7GZeH53D3AfuvjJhUVHImYmv
	 eCh/9uNZ1ESnSJTDfO65xBQD6O7R/CxH1cnsKcftSdXirGFPMzJp0+dB6b/cIIXkU3Q1x
	 OFiEKbDBJ++79tgTGBJ11l9qkyKMW12D803whng6AwF8HixKdWT4I5vdM1eOEmOJHsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1660A3838
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F1660A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAyWppn+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so10769105e9.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190099; x=1795794899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=LAyWppn+jN42g5ue/7dWHD/Z8Rwq1gOzYhPpyTTLG+WF02MlqFwSGIxO0B+wQgN5ld
         hIz6rg73oHcqjK7Vag/IpGzqWwwnzY/a/cCaADa5Z0V90oK6ejnhzwJEENTZciKdwXoP
         Gt0WphRiPIhG+iIlFesuiTZ7Yc/Qzbu7EKR0vX3yAE4INm9y5QN1WgMyh2PsHUZaE/xU
         e9OHMF9JkVbKGROqvTn5JYcKeLjhqOTFPEgmKnN1uzVYgJTol12wujkvy1XkgiaY6LYS
         Uu+rFittCfRVMAEKrwKhOvXb3AKOuXRR72c+on0w2EsBbPbTHL4/WTrKT+K+ZJKGswEL
         Osng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190099; x=1795794899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt1Ey6vqlrKjY9t+x5QDUocIGkE3O17FTDnJ0augaVA=;
        b=yF97itlW1c2Y5OqCDwyNpVsJDKJPH7k8HNYUI1wWhE66pjuEUEUX7HXrN6wRz4e3LX
         gywSTldAGt/5TeBkRTVSYxr0ofQ2nOwX/oWx8j9T/loOCQ2WCCte5CJfN3L5B83QF+iP
         IrvJ2MCZu1aUBdwNIvU9pVoARUeP1uNE7Ym5oSqLeM0NKAvOHcvFyWY8By6D2s3su4iC
         fvMX0bOLJBxy7gEsk4YSpXE2e6ghBKtSjxu48RKrnoNRRObzNRH4d5XrSLXEBZ3eGmCs
         yZ33sr/x8zT88fnPmjUMfthi08PCjnkbzAyHhwQyJhW/Oq4wwNcz48Z5hJp0e5cyIizl
         Zg+A==
X-Forwarded-Encrypted: i=1; AL+hErElPy5YgrOejoJp4QD0NopFjx31eX15uk7ffsIIBZMG+HsOp5AWP2oQZ0/8f4fRRCJ/UXLUQu0lYeNBhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IB8TjZ9ghZdQc/75Mdc8fSsCWYi1G20o8+TK6GfJ4KQTJQk5q
	b/8Bt0rWNOotH3bUjazJCNkmlFloTAgctRh1OA3En3NKn4ZOpe7d/qZR
X-Gm-Gg: AYBFou11hykfoFDOzSAGBjs8QJqIyv6/SpPfNFPV24gGZx9Mqx/iw6i+8+r5ReajcD3
	6oVHvTGEupOpOLZ/Cwp50eQt9Bmf7kwmHm7ktVeKCd2wCWEhjqFZDdeBoZ6ONSCeKgtUF0V4IgZ
	zd75knDXRhjEsR5+Xt/Mbba+9eOTiSVl9YJITYX7oc6zYyoKrDbgWjEwmxs74s4AOd4plBRgBNW
	YwcRthSVMq4EkmjFZq4wpf/fY8e/yZ0ex1RVRhTcVgVOWKMViZwdP01kv7LiTJ+PpHUbTb3zq6g
	KrWtsQBJb5g8JrfnR/YJr0nR1xDTk10h+jLO6gMre4vw3r1iaDT/C2DHdmWm5PcOwh4/xtlclH8
	ivSD1VBbYbt24/dW3f2W9KycK8dLwJzRiTubnM1L9TcS2MzFqSKsJjwIvUi+Y5kzEHbgrm0FyX/
	RVzcaKdBf1Sf+gnVR3ggtYSsoU+1XcrSX19J+cEhr+fYMMj4NFaUPrgyVSeqdcUFRSuLoX9lHJK
	ma27uuh460Q9vHzEqcppOEmLo+uSss0OpLvmdFNxOtFSGj8ZXJdQTb+nGy6pLuWMGPXiNBbtfMO
	6/ML1u8ZMMRfqJjVBHJNjjy0kWKvD/h5Sjxe3BAZILnOOSUjA16DjVNf/Jlp0yaxIyGkQvPj3ok
	=
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr71997325e9.17.1795190099296;
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Fri, 20 Nov 2026 16:54:46 +0100
Message-Id: <20261120155450.7719-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 20aaf70355158..709cf9674e2d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -461,6 +461,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	assist_state: assist-state {
 		pins = "gpio1";
-- 
2.39.5

