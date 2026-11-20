Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160051;
	b=0wtmoPyfl54gzCnJ/F6Z3CGsV/YPUb0Pa0df+EluzjETUj2/b3f6U6pdnwG9DrIG4uGL
	 FDwSOw9LZ72hTR/13ntrdPQt2O6P4PWW+zieh/rrcoKM2q9i1qIBE1LYUo4QOhMJWbKj8
	 AtUFKeaDPkjNCvycI2OHe8+1D+44Pbv7oH12K3jGvgLXpl1lda6mqtTjoAXKHimbY6DEm
	 Q+S6/vKzn2yf2Lc2cpmPrnkiHenukxnrhs8vXgSBIu0Kd2eGH6Qkm+IQ2KIj74ATnBNfM
	 mqvQiyxvikLKd3hqe+l0tlO3wbbIQk57b4AAS0sdWCtMdC701wH3PCxLBeFNTjHtx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
	b=NHL07JSW9R0j3ES0SpHLLg/gs6zo2bry6VA+kOqVRKl+eznuYEt6ZVTMdcg4DlTzOZAW
	 J16gZyfJJtuE09awUG8TAT6YtSrlYKiwMksvK8Ji/AcGf6dIRR2fyMLGJQmYEtZwrAZP5
	 M7R0iU2Y/0VeHXYfHLJQGZ+MUYpeR/VdAMMkjxpg00DQN4F/odSWlFMqcHqUb1/GDVyic
	 XAAqaujn46HuRO6aQj9/tBVV48zDbHyGHdLzcrEFh8QJzpHRU6wDezpIMnX80qPcXrq62
	 dAm6Gg+dBh2p1DJNg0AliQRPothqgR2LRtQoiXR7gnur2jM+ACsiM7cUsDPe4d/pkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6460A263D
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD6460A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4055515e9.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160049; x=1795764849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=uM4EwaUGJ3db/pFbwtIa1AwHXGzh7FRaXsI3Exn9B+X7Y+75sVIT5aImQsYlqQAktP
         DgaBTApC542QL9npLpxxeTVf74R7zjkF0/m3xwM7xwescjyqHBWPycRakWxowLsZb6pX
         cGrY63UXSZ2H2NfsxAY4yq/X+S/iYRF3tiEce/necRond/IuTh8tOFzJDbtLj6fzPK1U
         MAKzBfqdFT2WqL8jMV4JsznILSHyDzkawPS8nssGskfTjuT9GGB1tNE4y1fIaSqBcyk9
         SX9S2XOPB7yHp8jDZF2G4cOaKS8o12dwoejRkN2VyyrPktVoqeYV8KlFIkSASm0WmVT6
         aKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160049; x=1795764849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=IMPgvusPwKsU24IHvwURI8NtbMa8IlqcMNSEP7Onk56tnxSwLlGLq+gYyrHTqT/S5F
         jDLiAYiCtGhVnu4C5eEDE51zq/NsldEibjA//qajTWKZdoe1u361rLD3HcRPp2XCtlnz
         w6ZZ0mJOCkXF65JXltJJEyU83x0St544fdPuy2ybwbWnzd+UyVj5wCxfL1vFDJToeOLe
         EujYRhlamYsU5Njm8Vnqwiq9ENHr9nb4xpgIsJhcll+zxyKpBo+SsijI3LisI4dB/n4E
         ackGhsx4ayhbY2s41qDAoSLayLs6IIUm6KyPjyxz2ailt3W80MRXZ8bDJWEIwt9L+znu
         DEOQ==
X-Forwarded-Encrypted: i=1; AL+hErEtooKHNPjvjfQWuKG9Q29pflBNXrGvBPnBdl2tcAKrMPUX1WqloLLOcaNy/nhrggNAzFBshB5Hir6U5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zf7zBi/h3PK+aJfnJV9ujYimBR5kYS2Ahre6YKCcPu99pAytp
	iegdDLzYedGBIidYO9SZaP6JnDETBfIM6vZJBbF1nZclmBLrbnOCH6R7
X-Gm-Gg: AYBFou1/92uFa4Pna+okNYytEfAtaXP9FVp6NZJKX+6QqR+MBwAb5OCZmgnjE/hN91G
	OlNTvqLV5sfEW+o2A/rOKUsItXHkbnNowMJ/YNI1Wt3v3xbkF2/qVw3EwrmtKEyeS6et+px1vZR
	jDXyzsuOLinZwOuFPp66ucKa2z6VI/8BP8/a3AvOxhigtItNpOaCqRIp5JnMkxPM4yXWuJ4AO9T
	7vyRucWdk2IzDrmRCsre/YocTPLpqDTlJ9+gjWRkk84Xvxa2U+rxfdniDoETaCuprGUlzCABZSY
	/xDegvzraFQ3TFROUSBLZ3w52zI2Jpi8oFnduzG51N5817eCz1hmeLYFFu35R9GziWwS2mAp0GQ
	4kW3+iSl0K9tR0ogl5mSStBjMFSI8q+8ZZEXpoKbJGLd7/W/fn9QFItH4x+sWeepVhU2EIh09+l
	MgnaGQDEQOzBfg+jlro/LYHej25CB3kPijESm8MsdijLyVcQqUtizY9SCeXjxfcN6+7dAPnp8dX
	qY8oRUMWZ8ZspjSIaD8DSZxsPVgIq5hMVruJVtiPmvNRHGEASnPkMdBWssZdYBm6yIjcOwar3Pt
	IIbIP/LIf/McOzQFasQWSx8cSfhjsXrkczd1LzmrpZYVijlwHKNzmx8HAaFJaxYsHHkg9ihvjJk
	=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr44615435e9.12.1795160049029;
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
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
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 08:33:56 +0100
Message-Id: <20261120073358.10267-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 709cf9674e2d4..16014df9c087a 100644
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

