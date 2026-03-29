Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD25135F60F
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816684; cv=none; b=gaAoV+2lNJ6TPYknmrIuPFxgwbERWJnMxMXTiovbEm3u8LDME6cJbQk6zBIMfKliFu+T30s7LXwaAlFG41IutdFglFDCr45XNyEZPwx62Oq8tlX2ArDuXVjdheROz7xBzN2UH2zD7kItVMSaETA9CwLut+0+3Q9r0DEZ/W1pSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816684; c=relaxed/simple;
	bh=CpHGf1fptuxgjZbCL86R16p8US9srsbzMQGuHkCRttY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xl1qYbkquWyCAGl/vsGzlO/8oPBXTIUxwOgaMzyJ5yWUcZBRdlu5nAZCJUrlGrC3zNexqX+JEV6nk+PovblAc8CjtWrmTXsgv0LOKK1MaUwsQbAk04m4SLlX/nqnlAFwFkcBA+/EZwV+KqnJmJtFUAmYrYCwCySmtRvFAK4MRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy2OYisF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy2OYisF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso44836555e9.0
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774816681; x=1775421481; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=oy2OYisFgkc5YveaEfYb8RPBOECHicx95C3gGYR0rHu19n6FvyekTPYM3ULnBwVNK7
         haaRqbww7KzvT0B5MbsLCf7MF0H8ec9g4ttqBZ11uLqcYBacMzgRK1Dog4py5rqFBTd2
         6nR1uvb3nAtyWoYF8sjEkmDGw70RIw9qfyGWI6EyxRIvCp9WJenOUMF9PsKcWZyns29d
         uQaiKdrFtgj2QcmK2lGngz9AkiBE71xFZji56l89DvUpM0uuKxJRrDpe51E5wXgFvcQb
         iOY7IYio2C0BlK965BzHnZYMUelkvFIXrT6eNClH9Pl61oxrVvxQ3zMgDygxg6UvC8gP
         hdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774816681; x=1775421481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=cvfah+yo6y58rWffXZXdfuRoOvPzOamRxTYsfaFXWC47dX/E5asi0OXxBuHReuEn5V
         RDEeH/evVzRqJwKZjH6XE+1pTTRYDEreg/vuP72P0HdpXj+4hcMkdTaVKeE+neEd+Km9
         1R3HtwHnQ0NRAW5yuZOKbCLH92grXmLJUplmRofwIJM8n5/HC+uDePc0jU0SNxRxPM8U
         V1wyy/xlyo8AQtTGQM8TCBUddlMEkNj2bFHN72clKReq/7TbEmQrtELdCHhUfCLoRd1K
         A7YuHc7g7T2DB3pl06U0Sjr7JiBHVp56diw0OK4NECFwprTLDHoGd3S2Ks6/7yJX+ei/
         CEug==
X-Forwarded-Encrypted: i=1; AJvYcCX9B17NOw4p3+RLX+lXtOPz3FqeQO3D2YeaE+PHe4YNUXtTMj9eYGf7m/nAxXpwa1JlwCb1ZfvOdiUNpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVAlvGbPxhdwvz/pl/qBgs8lC4a+H+ysrRMEvddhup/9eqz2J
	Rm+mgbq7GWHnA73+OJ0CJ0t/cjip4UAbO4rwCYDm/QRsQ/ugmZjUN+0+
X-Gm-Gg: ATEYQzz3ZI6Dwk610n5SOkhcWeoWX38FGzxVNwQBSO8ytnpjmBPRVm7uHQT4OIQ41kb
	V2hvtkeas9aclOFPDcKmm2iErBfjUV6SVePrJ+cnUUcZ8iw2ZeEolY/+DHIk5OPxh3qskQ4iCsF
	J4w5gFz8wYTjPDMTVpRCn+2pyid6AphbmRsaQVLrY2fvHBb9W9uopazW/bLmXqtDq14Kxki86aO
	wqpAqLpkU/UthRGzpI7fgA/EDBz0C7sKachK1NrHanHV6XV3P3ttw/XQ73vmrscTw9+YscuxSqc
	o4Rz2o/o32Rb4eJ8y/dO0Y9l9vNUFQA8EMPK/v3a7pAflxlEH6MxMF7S9dvBzLE9A3upXvS3rgB
	2geOZMBMjG7lyW6KS458h6M+f1Gnte7MdlYP88rRGlEkpni33IfNxOQo22jzF/8032YOmy7yZnp
	/aakxg/qX3oaGmQSD1WAp0fg==
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr171196555e9.6.1774816680834;
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
Received: from [127.0.0.1] ([2a00:f502:160:9323:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306996cbsm118974465e9.13.2026.03.29.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 30 Mar 2026 02:37:57 +0300
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdukbDqnr2I84ChYo0DaYYyEd
 3fq8Tv8/wLGKmxwrBZQforJOBTUmwrStRl6RmmLwZEL5N0O30QZ08OHEAMq9/O9yaMaxq72sd3
 u6UAJSj0pd/L6nU/nv22+3Djl7w7W9QNQfGD9ewAAAA==
X-Change-ID: 20260325-z00t-cm36686-regulators-8f138d47090c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.1

VCNL4000 includes support for regulators. Add regulators listed in the
downstream device tree so they can be powered in during initialization.
VLED supply is missing downstream, so it will be powered on by a dummy.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
and proximity sensor.

This patch series describes regulators needed for the ambient light and
proximity sensor.

In the patch series which added the ambient light and proximity sensor
for this device, regulators were missing, as they were not yet supported
by the sensor's device tree binding. Missing regulators for the ambient
light and proximity sensor resulted in it not powering on when a
regulator supplied only the ambient light and proximity sensor. In Asus
ZenFone 2 Laser case, the regulators were shared with the panel and
magnetometer, so it was not affected by this bug. However, for the sake
of completeness of the binding, we add the neccessary regulators anyway.

The mainline binding for the sensor also includes vled-supply, however,
in downstream, it is missing, and we have no datasheet for the device,
so for now, we'll have it being supplied by a dummy.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 1a340fa92755..90e966242720 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -154,6 +154,9 @@ light-sensor@60 {
 		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
 		proximity-near-level = <30>;
 
+		vdd-supply = <&pm8916_l8>;
+		vio-supply = <&pm8916_l6>;
+
 		pinctrl-0 = <&light_int_default>;
 		pinctrl-names = "default";
 	};

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260325-z00t-cm36686-regulators-8f138d47090c

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

