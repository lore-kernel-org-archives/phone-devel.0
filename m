Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EF30648F
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242763; cv=none; b=PrwKP9v4CiTOVbAKLQRAA15jozLlhFRj6VopzTz26rlpFlu+hMC9wLH/ho/131kmhpNQbpl5/GfW/t5FXoOA1Dx+VNoCO+LtMvgFB48tHh7Djpabrjr2+JCO4hr7q00rkVvO1Y8eNHm1dUlX/gALTnWKm7vBLnDyzKiBz+RKsq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242763; c=relaxed/simple;
	bh=lvctC9UZ9/7NZkyWnJLbdkf1JYHTsQZ/REX9jctNvl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTaewhegpN1Q89aVFQP9kdQqTdVT2TN9lpid1fsPF5ksBfJjosFoCHc6E/jIN52YdELOUw2zRKrJJ0yhsMYtZxNQhVJPBGTh5qwkiykgyYJgbfm/cdwTPkLYi3DpuoUJFRHiBOPvfWOQdJXeMsQ7/VHxI4gqzDzC8ncvGyqXNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QDzZKkIb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QDzZKkIb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7322da8so1177028666b.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242759; x=1759847559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPU0fkE7kS9d2V6qsy9O55PBYIoaiLsw1EoR/Hm7yn0=;
        b=QDzZKkIbXRNwEDkrjK9sOfU1fb57i1eVzYmJFEdm+z2elqzxdZG08b/sRo0LOKim4H
         MTlBiw+NGn8R8QjtxX04vCRnNN96iCZQrdtAekMsmSe7NRemCG3QNVfiwjSxpTiYDGrH
         Gg6hgQ5hJ3zVOZusozjXv/26mlnDqXR0igHV4ZfENu5gLld4i5027cbclMdTitf4gIqY
         /jjY5U5BsHj7N6Zh22GlT7YAtaqzs3Nhuw35ddqfHOUxBGzVETrr+fH+IJxO/eNF/77P
         RbfieerpwmlZ4d00Y6TbRvCYqKZ4EWRbpj8zFJW7qsmgQQu/rlG4VvQSNUPc7JRGLQE7
         ADpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242759; x=1759847559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPU0fkE7kS9d2V6qsy9O55PBYIoaiLsw1EoR/Hm7yn0=;
        b=wnDAyAXnaRGl3M+aMvVVX1HBEHtYIHtfcpPvIwyhr+nS8J7h8NjkUDYbmEXaOnCPbi
         VwlSTihf0ee67lYPs/htvonA9nA1tRQkiZWzcgn91TQJH8ZcYKmE1JsRPOHgKg6cmgHD
         CZl5UWoqt/QvNk0YAr1PiRyWAL+cMP8A20Y8osaw+IMSEGRu0+4uHA7tf++NVCmSDIMK
         /pGySga0FdlEdyp6MDWB+CF6u7q11RqJc0TDt4X0eran3hzXKJrDGR2ozZP8AMH8gEua
         8YkmePS1jBjtobIJTtG5WU4dBYb2+EJOMl2PpP2z93HYdrncItmTlMXAW0JzXpWQjAKx
         4Ygw==
X-Forwarded-Encrypted: i=1; AJvYcCVpCqFqJBG1P0MF4y02iS+qVSseelVt5Jo9rnB74U2C3SNcDXerryZZkfIuPQu272KbFZTeUmEl6bm+9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJODaYKTNpSgylmcc83m273dkiToRDZPM2P3HCNjMO1xftHEBQ
	PEkQscFGogqeffg/D75gQGQfpKePojQXILleLdCnkOk3/03FAK2eXQjgktMsfLTVe60=
X-Gm-Gg: ASbGncuuVorijcvqyfUcl0EZbonaftIn6Omk5G3TjvAxiaweJEP/a7T3eRib+K8qyF3
	IVUh0KBBm4UJ8msUBMizJTw7S97UrPZdRmZxfq2oa6UlBkLNk4hH23IvSH735KAJcJgWjmloZGh
	KHLUSL2vY0257T1BwQRafSwGy0W+Q/V1jsp08K0EXl5l4mnFf/hXHIWOfxaVmxEfyaF401xSgUc
	8C63JTorh4/koQQKchCdWeVcquLOotkobk7KGQI/T9cGz/FPVBkexUaRbd3SIT+LHT3DP9fzJIY
	DAylRaIMIiu7IbwsVyNU8f5Xq1M20hGX8WeVGzR8qGqxFOsHpoKUPsiRQeDPa+gH917OV4M1ZWT
	2niv8xKexHDPgAi0aOg/nIuKYKezV14SNbwlghbAM61LL0BMNNwRbSYKKptB3Tsy64CpOaE/UUy
	nrDOcPrtFpEDF2PXqKEXyjmFzlCDC7
X-Google-Smtp-Source: AGHT+IGT+tcwdtG8+Nk5QcSQLl/1P9H18xoE0BkX5+EFdQ/TDVamP3BKtsWgTbMh3TfkbM0QHAZksg==
X-Received: by 2002:a17:907:1c15:b0:b0a:aa7e:a191 with SMTP id a640c23a62f3a-b34beba9405mr2469612266b.57.1759242758446;
        Tue, 30 Sep 2025 07:32:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:23 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1112;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=msVLhRVtyqqzcb6CEAQvjXz9Vl2Le/8AL8FbBJzu/UI=;
 b=juPccTJVCdUljWzxuw8dM2AJoUPx5guCgbIJ2bhQkA33KFFP+NMXg+y9PPjFVdfpdX1bCr8Rn
 GjBR8tNb2ggCcjRRV5pNmAntGlg/BQjlIoMqleUHNlEaMY61XHIiFjJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

Enable the RGB LED connected to the PM7350C (PM8350C).

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a01c89210bd261993 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -632,6 +632,33 @@ led-0 {
 	};
 };
 
+&pm8350c_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 

-- 
2.51.0

