Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215762E11DD
	for <phone-devel@vger.kernel.org>; Mon,  8 Dec 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205977; cv=none; b=VD1my38fzNGKr9XWZtgIdnyJy9lfqEa9ywPLcLAZnAvnMOYq3XfQsSkeJJ1AUDYrEPeQCgTOQB7rSYKyCuP6vGmal9cMBqUpEYvElaiUvcvJT8dn17r+WG6rekIbr0DtITzwjJsZgDmJJMZmKuxDV2rUa8FQlgVzyLmVXL7d9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205977; c=relaxed/simple;
	bh=MlkWVUme++H5JcXF4dfTtEPbZdW9G8cP3Uen/uNsZkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJkz5F8Z7gk8Lf7ccDsmifNRoAhw1NwOH6HMVdTl5hkXAN/nfq+s2CrU+XawZLDhBQ9McCUzeQ2EGmVqFmzHTUoafWmL0yya4er2zcdGQ9F/Mwe8JaQsFM2NbpkKD8bB9rVZOpH7GAkPzGeB9BsRfCAR830py0tCJUIu0Lcj7uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDFUx2yU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDFUx2yU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so5923154a12.0
        for <phone-devel@vger.kernel.org>; Mon, 08 Dec 2025 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205974; x=1765810774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5XIZU6P9UPthLQXJjeViPkZ0VrzVg6Co8k8yF7SCIc=;
        b=bDFUx2yUcsDCufwZYLEwqghFLfJqDOucF9JIpGskeh9eXl5rRPSLplMRSiKdjcqzx+
         iGj0/L1axj/YQpRrpBxEEuuc5DDs5arFgzdCpBzoP/LR3jD2MXx9yLuqIAJu26kcc3q8
         mU1iFfebELA8PjHncMI+tbVFCtf7Okv4mVU83Bi8pl7DCDHRFIIZ/Hjm/1YzWqGGnhgr
         oUOpyNxebYhjlNkn4kVy/a8rJxyu6pcDuWZ4y14cphFp/yLpgfInbO1naMAuRNR86XdC
         GzTk6VBfu3CKYsSXY/52HQ+vi38xN8i6chL4b81sAVucJock8LAQlYf/HZk1mtpBn22U
         gvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205974; x=1765810774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5XIZU6P9UPthLQXJjeViPkZ0VrzVg6Co8k8yF7SCIc=;
        b=dViFVRbNIwd5T5FiwDwuueUqfHom45vh+W4xG7hok/PCfySU8L7zNTIdwpqBU3xl8v
         GEdJvDx1xT2jnPVEBhDWuBu47sepLHRfC6ND8H5bdWdce4KfTt6iZ6BqV4e8KX/PY+lt
         8mI9tWGm5iqCXKi0PiL8Esm6g8deUX7QAWIvRxGUlrLxvoXL/GajhslyDp5IwyjdRK2z
         h+o974mSa3ZO26BuD6JT1gsEn+zC7G8Q2Uqd/JOdmvWwqCTe4am9Y21zH7hAZpTY5ZBZ
         iXPCYHXckAHcyxpnjDsWjIIdZLL/Q3XWaGiVUvCuXD8saxcjJsdCq2s2LPY+0e9AOsJ/
         +cXg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnIOU9GA32NB1apZv2HtzAFNvK3kFgQtCJdfF/Rw/lFwv/o0z0teDa6mS2sTEGtz/WQRX7PbVs6E3bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxaVYg6mBLpmlss6jSrlaw2aC7Skbfq0izxBBEbeWHrS+kQTAH
	OCVOoBxCf9Sk3a8a1iJ7jQCHvVl9L8Khw8jWjvLdzqzxnxNV2jEeEQzy
X-Gm-Gg: ASbGnculgY5yp6z/R4ypfDMvbPG7+MPQH+RiP68YLWt78LeK7xWk2L2EO5GGSO6CoRF
	EVzmsZYsHStcLOXZgT4fDwS7V5ZLidW4ugCcQC5jiKx0mw5oJe3i1z8ImLRbiTcokDV7Q+RwLQ8
	PwO9Mcv1EwJ4NTm3sVst5J93E2wTvUh57nzJ3XZjj7CzW76GWNZ1zLju5dRZCR6YRBDNMULRyB2
	ohBW+1lXB4xkSQ0xAxHcfZmHrBfK0eDdeh9NLioyXu60SNapAcBJ2ae9bctJXQ8s0/hScyybcLg
	fdVhA2X6iI9lguxvQW+nfn+VFoCFutgyTUr3upiaNzE7J828Trcc8BXa0UAW/kGlmK431JO8omH
	1Vp3tD3yqK2buMKkeMu/daGcHLqXCvxNm4woly6EEUZlfZxF93LkufTUoO7yfRsYgxzPCzuoHwk
	AhTd1MbJB3Y5B1VQ==
X-Google-Smtp-Source: AGHT+IGczssAIpp9AksToXuOrtKAegtzYkcphYQq+Viwxf5QYrBRnJYVTuqq7Rj449rQXPSrsjhskw==
X-Received: by 2002:a05:6402:2392:b0:63c:1073:4a69 with SMTP id 4fb4d7f45d1cf-6491ae378fbmr4926950a12.34.1765205974372;
        Mon, 08 Dec 2025 06:59:34 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:33 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 08 Dec 2025 16:59:21 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall
 sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-b4-battery-hall-v3-2-84e2157705a4@gmail.com>
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
In-Reply-To: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This device uses ANPEC APX9131 hall sensor. It is a basic GPIO hall
sensor for which a generic "gpio-keys" device tree node configuration
suffices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index d0f0f80dd326..ea90b00a2c8a 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -82,7 +82,7 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_keys_default>;
 		pinctrl-names = "default";
 
 		button-volume-up {
@@ -98,6 +98,15 @@ button-volume-down {
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
@@ -301,6 +310,13 @@ gpio_keys_default: gpio-keys-default-state {
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

