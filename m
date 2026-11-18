Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003647;
	b=lHWVP+SgdjDiijxjtspR0Vfr+H7iZb6pkQxNmwBZjIAzmgvzC1JmviKJeuTIacO7ah6K
	 us8ioqDSkX6GnOg6lBPh+19SGYze8O73mU4fTdz48eX60cyqpWOtSPa136zeZHBJPTiMx
	 zcRfXrr0STnwOKJlfUAKr/CpYZok0/VwQ2/v5kK3TwWxJL1mGAdT1P6L1MQkinTRvmFCu
	 GCXt42aICbabtxEfvpmgQqtFkKtr5IAibPC1ZZb+txjEyd1O0ZF3XQYldEKveggIPMQMG
	 ODzjLIow5I2SCcJVPVkRWxYqJdMdqla9ysrmgAdz0f9JydSCYpzqSoV1ikAHzLW7q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
	b=HbmgOWIP4EYs0NWHMW9xphlA/doQfDbguqllAmn2vKhPLWdXEo4Ah53Kw+wwDg1mJ4V5
	 MgqU26A1tflDSBCy2qCG0VlnHhwgCy9U0fvKhYbYEyMioLrsIizH0QpbL/Jsa5lBBVjqc
	 DIdYpiyZeBsyvtv/HyVX9qIQlExgMVYf4zIa64VtkgZL7b1sMofQNqiTgOOxSMBLFdY6t
	 a46RrRFmx50UAlHl0H3syrqOW5nwye561UMkRKMrKqQ7JJR/PrIO+tzeftHWIdiE0YncD
	 nt6Bds+Nmh+lLH8XYQuk4djEiYCqujYSGwPmkkDJuiAaK4hxI1ucL6Vdxw6Qp96bbSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D212D60A5BD7
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D212D60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so262722f8f.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003645; x=1795608445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=hCM3XXoABsifPCJHl+S9eIEkiniH8JknIKrQQ5Q4sOKVkcnlgSaYr4w7x6Lm6d08Ue
         TZ1dOmCDAbwd5+r03qljZcFpePl0kaycFVhaciEsPK8NYWUznZEYvVuDRQTNrJJ/cErB
         CwzXcoHVSixwu/iW9djD6fPOSrCq81FtTuYd9zHM5NR8oFkgkTUq/7+v86Kf6uK60RLw
         xIBruYyEb1eKcyjlwVe3KmMBsmia9hK3JkIWr966eDgD1FvzBi1elzbRLMkznNB2eTCZ
         KIcrOtAdznKdiLxM25GbEO+cUeIFZwIff93pzsBsPYmo8lt/MaygSGgz1sazwbOKgX+C
         g1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003645; x=1795608445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=yiQuLvI3xhEho2B1oiwOwMcL1Fb/7kVKZvKa3k0dTfgVX00zLRJdyK5szZ8b+Wi/pL
         ahJgcgU9NBDzz2E/4ioufMlbgMxSp6bv4cfmGF/NieGCMc8cVmRcpMAxOJc5Kujp62jY
         yx4z19fX1CFNNK0yJHN72ERykehTVz/VRouS78JyFQmkMM61vnODlV/z5M/NHFgYz6ln
         AD1GHAk3FFY0rrJjDQrVVSBuJEM6HVTzsoR/3np9ZLn6TvHzYrNu3CUh0g65kC4wQxVv
         JWW0Rdw/H9GL/WPYjU3sOPBxup7yPeg9X85k+PvwlukUPqF/Trsc3pTluOpNfbTVu3vD
         IqZQ==
X-Forwarded-Encrypted: i=1; AL+hErEMVxPrlGOkgK9XxiBjwGGc9iXK/7cZQAQacqs5U7gMz/r1TcR47q9RarRwCGi+hzQgYZWWT8P3xC8oFg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DxnJ546sinej9qL8zSC4udnaHOHHmwYxBs2yhgiKvOeu5/+Ds
	29ctl8h9GVOHVtYvkJOVV7fM4WIsaqwR3sP3ssixlnXSn0PxTSAIxUYYWV2NX89wewi3QlfR
X-Gm-Gg: AYBFou1Plf8IkumrVAx1T8Y2HU/HDs6F3gmRDLLaWF5ipUtyxpgzxakgXZikp/OIGb/
	xCkVuVRfs1yO6NGDPxT7P/cJS1phyVzsnKbp6jvs3lfBaaZApfnYyQryKJ+hKkzH1jaUR7uFEKw
	N2Z+dx/BGY36V9VcIYAMA4aHzNvgAjjyuoIcGTAxP3Hj54gihRL0X4BbwiVHAs1eb2ZYLNZLng9
	yfdYlFjukaeUmqn81ZUXUUkaVS5URHvmb1q9ZzJTBpbgYh0zYWhevvuDjR9P1dlpfsRRAbxhcbI
	+Sk6MkPPyAxJGyRanSnx9Q4wFa0OwFbXLFoa5VElJpnhULCende2bSoBu+cvvZUSeU42QDTKbqS
	DMK4R4GJVexvjxdVu20C4bhHLHeoR6ql/6GiXEkT4Qr/6L1y73YhTuOSMRQX+DdqgG4+dZG25ca
	SUwmFtxi+Nz5xlH50u6+yR1vCF4CPmQ8Sl3IGURcEfeZ63L7WeIZhIrDeVNnuVvsMGgpM2qPt8X
	I6RJnTTGFVSwSEQYNEG1eTWJxig7MWEIgxAW/WzNVe42GwTfznRJwBOZmV61CyBlJpaDRWb5+D+
	PyM5+Du/VkLAbBPbZ3Q7vriq92Sn/RmYbFJrAj1KFwgYRxRX6oHq7KI4w4YpKOJzCZx5nHtQ02I
	=
X-Received: by 2002:a05:600c:4e93:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb7da12f06mr44646025e9.17.1795003645203;
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
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
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Wed, 18 Nov 2026 13:07:12 +0100
Message-Id: <20261118120714.31505-9-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index d307a52cd0e62..be5b894b677bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -101,6 +101,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,29 @@ zap-shader {
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -604,6 +645,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

