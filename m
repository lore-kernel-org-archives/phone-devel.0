Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F930BBA3
	for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680277; cv=none; b=hLIXyHZzyC51qbRpnHQ6jX3haV0oRR1vvRjprfDTcm7YhTjJda1vZgXcHQYuVozsLgv94vB6NwTUkcEK5vAfbla81G03Az3IZ/DX8AB2emqEgru54oKiNjThOKBNHFffYrCwoSQBAhj/CJnYAf4BLoAOkykaVA/AsuxX4jIQ7BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680277; c=relaxed/simple;
	bh=RWbkz0FLNAqiFbTIDMPZWfStC9RZXbov6DV0vU/FWDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzYmrX8E+HdwEwJD/2EYoFzfUZAzGVGmji7uglaW0URd6OdHdEyruRHsJfvVg46T2qtXwS04ZCgygtndNYxyz2T9Z8Zpd6UXlkMtlcCQgffAxFueh56x0FkVoCPEKQubB88Qu4hokTG8hkOMTJ55jbAbJiArpEPfiIYQPkeM7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPS7EjBc; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPS7EjBc"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a76afeff6so16047507b3.0
        for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 15:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763680275; x=1764285075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByHN86RKXbbjzL7Ln3obHD3GU9SMY5OMdZPiBZnxHUA=;
        b=TPS7EjBcboNVZe72bKawkMHSU3gQUHQ0ip1aX8M5+UqLIst3R42q1gKHE+KIBWzxVt
         ECOmJQ4M20+ZdO+knkAIRki92tFMGXt4dPVbW4QSCs1q04qAFgBEAmAxeR9TQ9SfTdJe
         xYBok/kataXs8QeJ+f3XaLd9986+nQgz/IZykPCA7m18XD4fH1wS7NiCMomgj1dEN3TM
         rrHlwgM8dpSmKMblBZQu04gTNd9Tq/gdis7Rccv3lvd2LtWpe/ujPA6rnQhrhNnxmteX
         TSr1L/yrIIL039jY/Rod7n4GxnTTPBnkZKF1NZX9zMqhmwUWkspao1AoGXxnfv1mdY6k
         wL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680275; x=1764285075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByHN86RKXbbjzL7Ln3obHD3GU9SMY5OMdZPiBZnxHUA=;
        b=hh2YOFwPNhCkckUv4kMCSlmLVp3oeIHd2Y3YSFQX08BgCNEUAMjF4v36+q+KfYjlkH
         9hFnIZsv3/YssEdvLueZs7E1s1F0rksz82kIiMUmtPxaKd15m3AD8mFJifS5y+AgLMdo
         hG4Gb7ZukZY47f8B0JTqSMHGhJ5KtAiXdVlgq9uBPG2xtzVqi0RibV/AsH+CsD80uGzL
         fEE3RY+0GoJrwEy+KlDdi1bYH0FayHXsczfBzlHSFEBkH/opKCv4q/51px/CEN4ig4La
         VJQ9acygObEbEUHBLvph+B0JznwgwAssG194w7J/XjSsEWvyPBvZWz/+x05/SVDHRrxC
         ZPzg==
X-Forwarded-Encrypted: i=1; AJvYcCXPk4m45uLT9LDNLJyXkEmFnGNg/Uf1WF5UOkRPLqLM784Dlvf1VNNkjxMtQ9aOJoVVOD8CMexivcHBaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdRF+qPLTiWkNy3FIhX3fIrCIoua+jQKwNU/Fv+94Mg1i+XjkK
	NfAP3HATxFpv+om1ElsgOAcSZIAebTPBcJOx0c8zi+KvN6VbTUQWtiTS
X-Gm-Gg: ASbGncuD8DN9ty76y5oiGZV/1e0ObTwUQkPFVTROk3uF0YT+YZW23Wg7J1m7hLrn5IE
	qmlaUrHJWB/idLqczwowoptjZ2zI2lEbDTHqZRxHH4oYHCkpcgwXJ+QLERCdkvTnjW4gFvH20DA
	dRqscborUeuEi/D3K1ZGkV0PdK82wAV2BGS/aUULiS0otQ2WukfS1GAk6buOP+1+q+aNTUqPtLa
	rxWHoO2lbQwPHhJRmlLRs4pk28sRtj1tU55X6f2UoEGuVg+dIu9Pmgn/LKrErd81LUd6fAUWgXS
	GNE00hYd7k3yDmTjuHFfM7jpPE2/5UA/jqV/jKJYS2MLZVtL5ti2UOjb83MbXkQpFI3OiXfHAy2
	9OXJ4lAJYKuPQKsbdxMXUELnUC9bZlzCF57npOmGIpPMJTRm5tL/vVBeItzKTc4GmWxctURf8Ox
	yaIfEowVTa1xZROA==
X-Google-Smtp-Source: AGHT+IHAqrI4OKxe6x7HzMwP3ZGJuM+Wn2lQgIYDF8LTfS7H2cC7/bDnF1Smik688KfunshhtI7BPw==
X-Received: by 2002:a05:690c:4c12:b0:786:68da:26d6 with SMTP id 00721157ae682-78a8b47f539mr1457147b3.2.1763680274745;
        Thu, 20 Nov 2025 15:11:14 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm11356807b3.20.2025.11.20.15.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:11:14 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 21 Nov 2025 01:10:49 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall
 sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-battery-hall-v2-2-d29e0828f214@gmail.com>
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
In-Reply-To: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
sensor for which a generic "gpio-keys" device tree node configuration
suffices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index b58f0a04abfd..7343fb00f986 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -46,7 +46,7 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_keys_default>;
 		pinctrl-names = "default";
 
 		button-volume-up {
@@ -62,6 +62,15 @@ button-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <15>;
 		};
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			debounce-interval = <150>;
+		};
 	};
 
 	reg_sd_vmmc: regulator-sdcard-vmmc {
@@ -265,6 +274,13 @@ gpio_keys_default: gpio-keys-default-state {
 		bias-pull-up;
 	};
 
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio108";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb_id_default: usb-id-default-state {
 		pins = "gpio110";
 		function = "gpio";

-- 
2.52.0

