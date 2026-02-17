Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D28825776
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288104; cv=none; b=nRzbBgUlsp3ugPT4RjrKZQseuVkV2V6TqH8b3fiHdFhcbQ3Rxka2tj8KyPkpnxLPD6O3tb0stD3tqN6fXLb//iIGyKW1jRX9Dm5GwSx3yEGLplgyRi5G/v4/Nv+7CxbFmwo0YqJZe0/DKPggUr28y3Jpq9p5xdmeFRVH2Rqx7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288104; c=relaxed/simple;
	bh=BGFbjAQGLZNXddJ7Zbnf+eR42ONlD2v8hRdM+CSNiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFZsAq1lScUNcwjERpDP4IH8JaqFzx3N5ecqwvl/9rWPBbM+qo+agp/qmTd2wmVjZBaxNuUWADicZT+QXQ7fcKTJPoVvfqcVvrBZQCO0n0bQ2R+0ThZuPToyTFfzqMtT+ROrYKphlQYcorlw2WKP4TMo3kER8QSHP1rn5TePGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwTyHKlI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwTyHKlI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8947e6ffd20so47934826d6.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288102; x=1771892902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=MwTyHKlIZHZ0Bo53e48FiloGFvENqQP39UE+Ihv6dsOFDaxVKKRj8raRFeHW10y+u/
         ERaxic/7bgaNXKBlOIDBsKPQRp8KWkCkBlDzOhjBPtlHUPBkDgKT8rT4n/Xh9JHh0t6W
         BdXaPGvpJH3mPIqKxftonfMc3cGpCCozYgWBcc5bKX8DiCSWRD7zUu447qARkISZFeb8
         KDoOw6v7CpnwGF/3VDg4nXA1s9+tITHMTo7x6eu0eQsnEpR458FG3hyv5K1rgq4rJV8h
         Msv67MI3dTOweSzkNfAW4d6pmVp4cXek1I+XYBpGBfX3V84Gfid6FK1Vcm40eKerlRh0
         HMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288102; x=1771892902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=a+wTGq/zEg2SJhnomq5GSV4/M6vsC7T5RaIum1m6KpgHWqERlQmDBHPvzc21ghDjjS
         Oy7ZB6Pe3olQSQyTfOt3siXHTNTzfsxGhYvPoVemr5KSU48EfRjZfa3JugifzdvYXj3D
         9mftwzPEUyrvWUOxl2t9/P41jAuaFLhFtUbX+TpHt29nL1C2KmIZeb6v0cAMXlKl4e6s
         BWxnSGJVeHvuwhUSGcwSsm9+ALaLZvSgP0QxaqGe3gBkOjCqWInyECfGFERFYwqH/lds
         6WsnhpSSwqiTfeHrxn4S6MALtV7i97Eo6OxnhFtVAcGaKkEQj6D/gK6WevxmMoJ+A6aY
         nJjw==
X-Forwarded-Encrypted: i=1; AJvYcCVWT6Bk2XhXukf6kt/poUG02S7b2XHhM/6cbjezVcxuDEGVce/mWPPd2SxbLl3MjfWrZjXmay4qYI6aHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyya92I+Ff/u4M2H27Rwn5soEpq8e3YCGRFwRDtaDV9/Q9J2ESQ
	wG6e+1oQa2yS/VhxDDWaTiSSBetumEda4XIE4Rruc8b6VPYpdE2x1u97
X-Gm-Gg: AZuq6aL5u9KUxUvyS8uTsXi6qcC35xROOXeK8c2uS2CVTQdL1BnQ4CNB8smtTTW3SUZ
	PYqaVJnS05oWUw4p3GJUFKfBwDTHMK4AMFbsDYvHlsXFABp/1T9rsd8hq38tB0NJAAMDki5n0+c
	KIPYrBMgib3/7MGinO8Y5FCxbZ6Q4LLKwvd2hYVP6TS/I47Tg5+CSIIxk6V5HhmCVJSxZNGic3b
	MC3Z8tJIWWlfAgL23R38sIn3uF/rZZByQTWERd4Vf4C+jV5RkbHsfsSUbQCj6LrOQ6M7Ht7a0Mv
	ExboNP2Y4rWi+EUXK/4kKcaYrUdud0VpZL32Tkyh2BvYI6GA3AyELjRCWT+0+ynots8puK5JFYx
	E30CXDnIYLkzIFlXYJf6ZzpyKOTbV7BkeFifFxaZsEOnedYufbUZqUYl4H9d/WCRlQQ8lT5ibRX
	Ghrr1T0mM67WKf3vyYFzFm0wVV4zwD8g==
X-Received: by 2002:a05:6214:1c86:b0:894:768a:a8c1 with SMTP id 6a1803df08f44-8973628fdcfmr162944716d6.66.1771288102314;
        Mon, 16 Feb 2026 16:28:22 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7ff1csm150951216d6.3.2026.02.16.16.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:21 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon, 16 Feb 2026 19:27:37 -0500
Message-ID: <20260217002738.133534-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.53.0

