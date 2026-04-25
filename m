Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12737881F
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141896; cv=none; b=iy1oIXiVRqB491PGGb1RI9MZ3stry5yACU83M1rl967H07QSX5IQZ8HY9xtaHFlV7r70JaGAqn9bjgQ9RXfhYYVAv5D+b2/xARqwHr8D7eBXgHeIcG1cWmJICsl8l0y8OqlBhlQiiweuPaJESKCHRhmk52WWiWc8FeUr44ttOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141896; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLxeK8+o9TBttRskSP9KE0pkaVnhCibfheQbkOxT9Z2GtkTrWxDnM2tfwppNXZIzzjwApgy0X2JWwZsJknkr6hCBRxN3BPdza37P4mt7YXJMAuWOII71x//J0Ck/rKJGy+uBKLylgFNacjiQqaZMAmArBDcVVlQ7NUDWXYfoBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3bWBZMS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3bWBZMS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so80912405e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141889; x=1777746689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Y3bWBZMS/mcFFkGD36D5wZookWEBsU/W7RzuCuJG1bTN/LngYLXZtRhJ6jEnioAfRd
         QPGWsOK8FPte1RMcqLeHyhHsfubHgWB8fe8PLfap5P162//Cvk+l4QqcSsU0AYqIgvxj
         hxOAM8sQEBtcxcZSDc9pBY/ARDoNELA74e/684bWDsFUwBJrQAA1TdbWsd/OeEQjYfLH
         MOQv1JBi6hK2xTwv2kl5H9Ko7mn1A8OStDJ6mEFuQdZWdOl5fGVOvM8vCKb0iRRK1vqL
         Bg3emTp1LE6TG4WUrJPfkgIZ6fJN0FHKLMgfGDYMpeM8UYV1r5c60+HVXB7hFEsLptIv
         18wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141889; x=1777746689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=SyxEvq1Uxxwo+YXY4VAgc5EZabSEowcYw7YVn2O3Zy9rFVKKcL3/sSP5BvsnejcYmV
         pi9SKFGwTnUAcSMrUprtTVm45sn9qGTYTEIlyCzTqahaw241mL/JQR7XYE4Phw5EvfQd
         t1JL/vtEs6NC7fC0xLBNSK5ie+eiOOxChdJgn+soFpv7OEJMAxnoKaGDyL3nDTEkLqOT
         070cSOsYJeofnKYPxZp3l/AJ637KW6OuwKWLmq2+sKIEY+Li6dj0BgMlN6Baoban7LMt
         87JihomBj04W6Ne1QvYtcTC39yl1bXo3Rj+Kgy9HG1a5zK+Ipuk7hgaai7KjiybKcoYq
         HytQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tYpHvabmbzkpLMKsvnPHcWJW4W+iZ+vqKdOb+y1+kB2oi/mtusIbSwjqdHVagajJsEcHu6AKjLSOsvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyge3uv+OCa7NgHwyuXmjbidrGOc93zA8nUOmzfRI0TiPvI5fL3
	nl5L8AOFxvDs8XghGLe00yfuCqjP8MKdsNtfdQCtAJuVWxHHIy+4kLYC
X-Gm-Gg: AeBDiesMkJxyeDkOlkh+cN4ZwLh2d3xRiAF/fQeWVXogoiC/GEggIM825/RxWFhvFVw
	6VBVKYuHts4ruY5LrUd7WC/uCA4hvakVpb1TxVLV9bfSrvyo1yO1468ksRqxO0x8h3hYq7CbAqv
	4Gm9ECzKJbHV9sLKS8JJwJ+DBv3/cwqW5IHhfJLy6wvgM2JRtAgeIQnTuA/QwWNESAEUTNkWtFt
	M/tqlqc19IFYqNVrZ9FTejck+2NpHidMF5hgjR/XPRb6pRDC6hQGHjU2c0gpdbskELCsUQ1Ll4Q
	b36phoNm3vyFuJXiuSrGsl0r4FWRf0+zWRHJHP1VOnX8XZZY9P3hCwn+eyYJ/z7e7Ea2fs0JYqO
	HXYo7/GGqTR0ydkMY5qUA3CKqR5jzvMREt2objNMYsQ303NAMYj72E62anm0ZDgo92iHSfNgmJO
	C4gaQROroSxeCgznrs50QBDX/MF+eiNJDYUWg=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr512182135e9.18.1777141889423;
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:07 +0300
Subject: [PATCH RFC v2 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-6-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

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

