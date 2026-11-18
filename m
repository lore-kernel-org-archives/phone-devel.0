Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003646;
	b=j5Qd/mLxMdojs3i7zhA+9w+AxhYKxo1qi64RurUoywKtjqUDvOX5q1W0O3T1UIm0zdAM
	 OvJglhuDo2h6xT3y+KM1dSHK7VxlgSmXQb2bVhRoFYqDwLB7ZdWKLOtO0pErDyj6p1xNp
	 e13mTfrXwQeAQAic8bINoI9PBL7PCekCNWP4bvCqySyYpunytXutKxbAxn7ytXLwFo88Q
	 qC+HlAj7zyazhDFpkWesyl5kWbAqw4X8snDApRWTC3JzPzLkxzayDc+UdC6Z8Ya2OkFFZ
	 s8fP5V5elGbMj8MfQxt9Be3pUYWQRvnE/aJbn5BjdxNj8vyhePwHDAkPnRovfwjckjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
	b=rX8/1b6zjZA9lVUfW4Wn65cdj1jdRTY6Ofl6oIYrFWg3HdLzvPIG+NwKCUrZqyx0iMfa
	 mdJ/Y/Y3BhhtKgxryB09v66jY0nrxWj0ISJtIfQW6Dc+N/PTCyXB76UsnfGX2aV9yHZsZ
	 zFg8TQdT8/DDIuvYN7L4oVad7cMyrFFYZKWL0sMWUqcYHwbddIjFLUDCkp1lE2xTSwVoz
	 Em+6KitJYniAhmjL9UN9nH9lnM9X4m9r0yNVacqOfBso+aJmip69I6X0zIBPNMALiFAkL
	 MxjelJ3Z9iYt7ELMRYlh2LDtfKEdotuVUkopiXlG5eBLSVp2Pffrflqgc0ICtWWTQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fjBWl/Oi";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C1F60A5BD5
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C1F60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjBWl/Oi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8393165e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003644; x=1795608444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=fjBWl/Oi0VKXCaXt0gJoCoC+8oLAfwByWw3J4b/IF0xfbjhWrRnVrP9YO7cQFxn6Zx
         /O9tL82nFc7U70oE0uGKHUk0JZKSwaBoGthVZp2RSXE/iNvC7I+9gZ6mp4Rn6bKtAJ2M
         LEp6AFxdYoxF7BYKrjrYj3pRmjemV+DeeLgAbTFuH/zymhi7LYt3zXc2AhS1ZNuz4kBM
         T8wQhx5EhhECRFJpshxJyI/oLbyGX4CK4kr2hjy9UrUGbjgF1KUTR7faAvbwLMcYdBQC
         I4Qvzoyy/jgnIjrFw9gI36mbD8ooCFPOIKJ+0J2CrCWDUEWXzJpLPe8bQKNu6piLEFF4
         bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003644; x=1795608444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=sITnamn3pCLWXdP+BWs2LAqUQ1Kp7AHBpLHnyd6xRSFjqSyZasCVbtT4u5PAORnk12
         X4CeHNZYH+CxY1ExsmT9qWrZqckvrXcWE7uIgOLn/UbI+eOm/qf7oIyZ2zg5E+gYUhmc
         cRTBxZjer4JuVszeennfBfRxXK023kKTiT3j213cbAOz2Qmfwr4OVrceRTbVfgUibu0b
         ZE8XtdWX4mmA8ugJUBVm5NHb7Cc0AysSESQsgqTOCSe0A1Ck0VbYcbd6v82ql8RoEB/h
         4LO9iXCyMpxNRqE9Vpj8y8+FvuNw33mHDFlKUyqqqx88eCnihqXz07PG5fpLHs9FWuVv
         iH2w==
X-Forwarded-Encrypted: i=1; AL+hErElLGnd0aWzwtY6pjvNzqSZ8wFJYUH7TA5XvuLfmxeFIau3jj2Eo76ThOuWJdQcscqH/qa9np+8LC6v2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z88QzCO52e0YuhOzo/Nw5xBFH63HObOyEp/a//+M6a/SxqU96Lw
	OaH0saRNG31Ig87+NjX9Mo4hz0PARNFAO0zLNhqPOqdyPZ7JJV65CSg0
X-Gm-Gg: AYBFou1Qta/c5qZwryBiqtsnrBz1smxuBAE0NStspMXPunfbPykkzZ4VY7YHmkQ8Iii
	OqFLsJBq5ushFmT3KzWqPf3P2CZyYjuZhJTU0FqeXbvaz0FCjPOPjMuW94XVnud8X+n80Q2DKWM
	JypnuPbssl6setx7ZkBeuORIqSO0fsuEE7h3tACqzOcyW1n6HzyUzXpB3sshr8t+3MqCMOPWqbO
	3I4kh6giXof9tfpy+Jdxx8d9wrCIwZ5gW0DIQLdozX34SiZWYaYNbViYAwknUFv3yI1yhjEsTIS
	h1aIc6+/zahiUXTZSKzQg4778KiXj9jZ43d11zJaOtqq14gExZMl6Yb+JYkCChzdGTBx3PGskjk
	AAdQ8OorwzC5TFU6gZmJ8bqXpaEBuZjVMissv2+lJSbmSqZl9Kno2s1fDsUb3cDdSIGJKlDnjk4
	i9PpaPMEFKn+pkN640ErE2ocykd7g9PF58yb24dlJ5rgXTCyNhzsRrYA99vQPsxJihgy3pv0pTw
	N5QiUm7HsBfQgKgK3dPL7bQYkxylbgVJ0hVoAqDw2RhMTfH+TkXcTRl3KT1LtddDZ1Q4VuRCPiM
	h+gb9FXMgbhwukGBUKYKkOYdJZsF58qgNKY60vfMjlVwYBAbCXNLopgb8L9Hq6mq0Fjcl2O9UcE
	=
X-Received: by 2002:a05:600c:1911:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb7d57bc33mr43616545e9.0.1795003644117;
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Wed, 18 Nov 2026 13:07:11 +0100
Message-Id: <20261118120714.31505-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 1b2b67486fee7..d307a52cd0e62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
@@ -460,6 +461,42 @@ zap-shader {
 	};
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
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

