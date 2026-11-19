Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107273;
	b=JEicILpS0uTXTtX4HaFVdtPkcKiMzg80K7VP+afxez+gr0ZLEteP+DnTNkI08PDYc8//
	 kgh1gA7YcooU0bsexSABbXSqRmyjhOAVs+hS9leNdyHl/pqoFQCSRavA+amR0VUMf69WR
	 ASWZgTvdd8Ea5Um0hcIjH98t+CaguIZZbbV9D++X2jwTQw0VeLiMR8l2KhqJIb7QWbD64
	 rA30l2QuigYUbvdiWWqB5/3jyy8pdLwVnmopZI7yamvOFBSNEYAz+eXDKxOXMEiFW66E9
	 eMQNCTWaMbmW681pKYkoXIGXK0rcB4RR7f+LDkdSYDz7cKlzzBRangO/ddYogMDo7hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
	b=NPFgcl+xBLgh1iTIg83m0L0SuVpMFhicPWVOgOgQHU8uE6aRu6AlwtGHKabTMw9ZlMMn
	 V81vUsCykZlaBG5/KOKP7gisUU9bhOJDgyHDOWNW+76vOZEbc/KgG+T+9jImLS1DR9Sjk
	 zC8LzPVw93JJ0HDIDZ/2M9TjEhCuSGjtEOEHYhRLF/4XOBVv030CYfEToLe8mP2vkoH27
	 /NzdeHDqR4Azqi+chEXBKt1/hddX0/Ym0gjnqVugHBx1VFHQP1cTyFStVDSIdVEemc6hK
	 /6s9Q6PF8GLRdwKYVIJWEtMxTytYDBRUxlJHY9gT5FKYU9jK7DmHLDeS2VQVGK1ZMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A160A3826
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890A160A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1297749f8f.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107272; x=1795712072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=juhEOwGF2GOjxoXtmjs2wXb9+vc1RddKdvLf/LxnA0U+tZF2dd0cGF0s07L5ffEOWJ
         h4LKn62uiKSoqVEeqMnvaD+aMjk40J3zn0ctuFQISREnxJV0NphasYOXXvBl35yMvtey
         mwHSYKhcUkiHIIGinJfvjQuMHKufDYa8tpA/QGGslQhw/IaeX+ZzQUTPn9ICizxOENbf
         oPA8kDxf0gZqOt0n18v8pvMKVxK7TpJKlFNPOYjOfxWlrp0ngsZCoYs/cdgXK7uKEklF
         WiflhUjEAc83kAny5N5Y9O5ZfB1i5Z9B1GgXYh5RP0Ho9VQpIi7+POg/jvs3ZMpdWNfI
         49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107272; x=1795712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=PbhREemfb7tnO4ZNrAS7IuqrpLqJwmCeDX+98uRT3iw7mT7aD5YVsu2mn4WaPxn7jt
         LDZUBXAF5pvm4RkjGBgqqYyFoXYtGlXVie8PdYJDYMZVG3AOhzpvayw3c3KxVvGGC7t2
         cvPm+kz6TLXnvpHP0P2r4Um/Snn903qrx+sCqL8jgQGYEr9rsYR6vWgb+oGrHM+ycq26
         V6Da4DNtS4I06t8NGAgFdil9ppLoiWT8QoBUGTmksgEOjywWvasjIGD1+UW4B5wEAaAO
         B7fmPtULDEGzmWm8VvXkBfFPHPsuVulKFtNoh2ceJvK29tX5QWcxehDSRDgkaD0xp3RZ
         1u7w==
X-Forwarded-Encrypted: i=1; AL+hErEHPRXFJdHlDIONV395C+FWKMjHuQyFJbRQoADXD9mVm8XsqJQDpuYqWLRK2VuAiX8a/IHkc2bGCZbd5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2v551hEwemKw4cf3XhXH+BawmnrLNzLGz5UHJbz8LXXPbpPj
	0T5KCdxOUJwT62NoTwNIcy1zlmamt4B3fQM7ZmAtx/HCDtoBNpZYKHKZ
X-Gm-Gg: AYBFou1hVWUxJ5qf3N4oo6fbHE9kIsEWp0bzTXdhHIgs8c4Ba5GRxe/SO7cQwFRB0PW
	zkXi1EGr6YP1sruWv6pT2Hm9BjLf1vHSVyS+ZfSlrmIO/RIeC45yFSX5bg53wdT+26VJFioQS6R
	UyFOzphp+Ujysoweg8vvJ3vr5RApBOZw3E0pgVP3/fcSy14YPcgOLlohqvskeve29OfJxtI20QQ
	0PlgrDJiCC4mrv4+O2bq9wWTahtIflQ74HnISU8XjdVDI4TseroS2J9bxjAiQpniixqZTFIZcqc
	Mm+nvOq616uupxIJ+uz4JjhZR6pcebjuyOaia9fGD88RJbPxNNWFQKHHgNa8bZPkP7i+auWq4U5
	9+WFhR1gzw4TYVZnhPZ3yTZni+3Pro9/8FEAl8TZi2F6EsCbKEJBYdlAOg3VifITQPLexgqUAOX
	0CLwoXTHXWNkUHafcBtWWloexhBXum+vcFUj0vJR3yjgXW8EWnBgGtE6uRqT4PQguDn+eZx5CVg
	9KkJEf84P2OecL0CyVO9iJqaqHheUthKXMI6IU9zlWME8H5vzsLegwvOgYByHq85zuLOx9mWBCJ
	2DLNrJnkc3GbdAnGQxit4LrYg/+hafmwO7872638m6mWItNXr1IiD2AJE7lcpbLcpgwZOANx8dI
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr1755525e9.9.1795107271789;
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
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
Subject: [PATCH v3 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Thu, 19 Nov 2026 17:54:18 +0100
Message-Id: <20261119165420.24466-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 59d6c1518a469..160b6f4c98b17 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
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
@@ -461,6 +479,29 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
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
@@ -580,6 +621,13 @@ sdc2_card_det_n: sd-card-det-n-state {
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

