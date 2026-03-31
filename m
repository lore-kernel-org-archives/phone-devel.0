Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C204035C9
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986244; cv=none; b=MuPUWRZ2w2NpONruguJ0DbmGL4M9Y0KI53XQCKlV5630xzgrBcG9wqfjEVfGdUzOBmBgV2FY9erR0adTiUlK6tz8xxNZvKqNhLL8rbz7HThVOPaJjm1ljRooHj2JMq7JKa706sXoEr4tyZZTXYGK3MhYjfDiwwBzzdnhr0eMsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986244; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDh9svuzfqwlHGGZgUxJTPkC6jL0tRCvViuO9jP7hTf1aAWtuzG5tb1DilomwZvdnu6vsl3xCIa+6ePvbojzQgciT/OhQ03a6VhwvYToD/l2iK/9p7uxlDdG6JYLPEqQE7iXpz1fipldbRTLAoL7q9UorEvtUAF3YgNA2JhdNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaSqrzFv; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaSqrzFv"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50697d6a69cso32352361cf.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986241; x=1775591041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=MaSqrzFvu7/R012pxX4YHaxaJfZnyJusNRa2WCGr4L5mZ0u5S5dBN9RzZ8QV1E/hRF
         gdNP8fkCOB2zKBkhmzUjtfBqv/2MWLYlDAx0mvLW1924Gn7drdoVjNCnqVBJ5PK1ooSL
         dbdyUQUeIdJscj6b2Uw6QN21EsUT59fThvdG+TYJ5ClZbh8hgs0M+CbjiaS03cPWe6NI
         YShPa8GfPrZ37zeNeLF/QxTZG6fhtT86y0Qq1JBm/i8I54qQqqF5IRfuTdynUQklc8Rp
         eR/f+KTW0bxUMXJhz4jEZ2JS4jgea3WsqVLaEm8AnLP2dNL+ryQsXbr1igSP+UmmOrKL
         V4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986241; x=1775591041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=mPFNpXFOKRfgKeYmzs0YdlbqjybEwF5IO3r0CnuxYoCNMcnV688IwT7FXNM8jWZd6/
         vgPakbix42PwcFdmo5/iVzDvyEpuZ2y/UBgmY3eWo3xE9CZ1WhjAnbF8Y18YiRc9lqkY
         0DKC3jk0ds1quiBdX6XA92B5k3Zmj/yiQV5HW//w72KTTPbfdrNMP8DwRRfwdD86KYm/
         E2lIZ19aGtlkZOGiZMOggF5Y6G9IZfG8LzX8Z9S/A3lp1FIk9ZUO3X6MeuBIoK+OgGmE
         YO7ZU6BCa1JQ39tTJJKOEu80gTCe8XDX19CKZqYwArQiZmvOuRUbTe9wgX3eAQyfoode
         teVg==
X-Forwarded-Encrypted: i=1; AJvYcCUUH7QLTNV3ZF1KB6/4iPACU690SDu1X4q5ywI6gvd/tg14vunA4HL2mtGDSHlJT4eVgV5LhYWXx79Yzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxio+gwJcKM6Id1LODp6kUXKyN/BLHsSepcYFyJnfJSgFlwAfLy
	VAlPY1SGoXi0iQihZpR5s1ewpM7QMUqN3PYxc0IQwDJF4DxZWGhkVvul
X-Gm-Gg: ATEYQzwMmhvRHksYXer+lyzyvVtGkXlWnPfIlfPmwV9Dgd2jekGjXXotDG8lsEwkAAj
	VK1S2zOZ67ltyjDblQapz4XtiAYQ3vjsp5scMG8z4ljU0plpmBEdMxhvyvYDHuCmNUxfXrsnIV5
	a8aHgCJe8gk9EHzgIcPntQ2ee8YP1olC8Ic0PBbcyz0zf/kl9MbxrTvqcwT26Q36ZuhCsDKZjjl
	0tGe5qePWsaJQAXXdzPi4K02OQo9YUYrSGgLLVpuvb40cxPzcwEHSyEumw0XjCbSz7CsH0q8iDi
	TefHJcJX1voNIjDwtYXWsWajCk6kXdxkhd5p27SXokACay/fbX1t9cNHga3Kih7i1Xre2HX429L
	c2LzRy34VRepdpZQLzpg9m/m5+3WZNnR1My/s8IoI4KqdZvnXlcK8V8vQHPjFhVIT77XBGJVH0P
	O2cAOH0i/3JjyHONS1MAMwZ6sImFKeCVITuNE=
X-Received: by 2002:a05:622a:428d:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50d3ba37cdbmr13816891cf.0.1774986241560;
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm114230041cf.7.2026.03.31.12.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Tue, 31 Mar 2026 15:44:36 -0400
Message-ID: <20260331194437.41041-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
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
index fbd16b1f3455..f115bc6e64f3 100644
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

