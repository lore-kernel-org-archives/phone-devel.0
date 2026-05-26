Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB93DDDBF
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802321; cv=none; b=W8inoOCjQy+WtKqjJbyIN3HdXlpM60FxwSS0CCIqrIpdoG7P8B3G5Juz+iuR03voHdErUrAAZSIUNQwrj4imM9x/4Lmv0KKX7+/WAIu+vP5akaspbdLWSAxTQJkgKAb9mffkYBEEzrwO0naCC7m51MIoVFWybpiZoHiUQmtHjPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802321; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUL8xAKU8ILe6PjNlKC7nOUU1jmVI8YMihcS9PFYsh84IL1lJAaFCySIxXI3EtHTEG8e1BQtdc9Cv6Ou4hWecNiqqRTetitkcWJpaW7zOVZt44D4hjstGuOwQN81eaJDC7/U0Vd8ojgPs8Wc5AQzkACD5qCXpNP6eeXLeKg362w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaFpYZiY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaFpYZiY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44509921fbcso6776010f8f.3
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802308; x=1780407108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=FaFpYZiYG8kkPPU8xAUK0V1ai0Yrr41pASF/JQ+2Ywq7KfHjbjK9CWyTrczbjy04Pt
         DLq8Oxg1534SpO1GC5aMMNMIE90jX6JvXqHP0+eoBA6H0HoMaBX7pvW/nUrar+YKMtYc
         iPbwNUPNemE6g1gJ6YVrQ1iyYXdu7JfafFLgfJtrFy6NhgiQUZR81y+1y3087PhFbqZW
         uXg9kNrku8POn98YwlSrcaKysrobJ+7YKFMZej+oyHkY8u7+fi6xBbhiW6jDJjmzRHmk
         0iKD8hVITO3N1AEOM5nILjyAemFyrbZiVwyTe5OVvNSLuyx2+XAdcPQOVIvWTOkHgIT8
         ixWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802308; x=1780407108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=chmOmsHp0PANQNj5Em+lAXADGttnlMeDpgrWXqfMcj75VAUvS9+D1CmRzY7k6Hy7AU
         YraMF50NCq0wx7b1n8+HB81wvc54AvfHtEL6ForLEjEUv223R/2qELyRfQRSjz2JqOTg
         ePbzYZlPeIs1FzVAokim6ZdDv2wSRzMsIWE59nP+UKuOShLwRV3AdzH1IKlWS6fep/+d
         OwSsCaMv2CBrNbjOsRwLlMgNwnfsWuhsdz9DtT+eDFoBvf2LowKwPE51ojwfkpgSILnO
         fBjdPQ+DXzu2GJaT8iGLtuv9jumh6HGj2ZaUFOxKsYxz/fYE/GdPAUbwiQJZ8057+Ekw
         7QPw==
X-Forwarded-Encrypted: i=1; AFNElJ+pHNMf9Ehg2CHSzJlufOLHa5HbPpGNB+2BVXAiGzAEHEgKJdLNhPeKEXdoaNL0aJXc61afJab5+/bvSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqTZq41og6Z2MeRGITu3o9ZomSbeafYalUn0A3BFRDaKNwked
	4TH/VT5sSOuHQ0qJ6S1KUJC2R18/6LWIge0JGKIgS+jwsMOXeTaXdtfc
X-Gm-Gg: Acq92OHQc4w7uhncvI0vQkjFoQPXNUxmGEuo13OZCrtepi4ZFO9r2tjYdZWVJ31fOZd
	WB9RdJ5IGYcQ7S7OxVx5FljQ5+VBKOhlvhwlM+stGp+YHlpi8QjYQSJMUWdnmemGiIxrBkwauLD
	tQHyUM/f9qtlMCLf/bA2Q7MJyK7LsYjpD3I9vvSy0B/UccHoLbGgWx1GfIMsmcqS+Pp3kKyJymU
	VUmP1Nrvb4Q2X08Memt9G231wlYQt13pXaRgpkiQi6h5db1TOExus2oLtn8tNbR29GXqmtHYBoK
	3990ZD5EK3s2m01vu2tSYVoymi7KLBVqaX3PZQ5awa7pi912iPADSgEnq9RpjiGASlgGfNUuEGw
	5d/vMRmHKv312qHyWRpav0z84JRh5UlpQinAPAd4YRy0iVHTFI/xc5sLY6t7akJqxBUnFw4n5Fu
	g1MYhiQ7doFHgDnq53weuFoJgCRw==
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr262860365e9.16.1779802307589;
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:31 +0300
Subject: [PATCH v9 8/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-8-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

