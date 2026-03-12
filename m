Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B839936F
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321152; cv=none; b=f2mslPrEjdR6nRthXJBchs5lWNXcQwqffgaIiFUJvzsWPIrxFnJ+l4/k30iU0d/uhW9f0ns51aM93p1+zmxJ9MzrJKBNwBKMh2RaJiKRkRZjN/x7mlaXNreFM/JPy0t4r6XluM4gwDhfLa7hwwFxic2dcFW51MdyfSfXFGR8AP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321152; c=relaxed/simple;
	bh=1dY0YAKWqPQKpy0wX5QfyVs4CI3YqPfP2ubH9Wa4uIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dw8joh6nM3/xACCC1PxHkvfEBqh2A3qbSWRgDa9t+mBcnyl3+TYP7ZqX0eX/J/LYAnSp3WCiDxSleO/ArH4rH/L/3lySSFnD3g2Y+m70uS5X2M5ShPx8WsSIiW4NkjHb77t28hpMN1lVQVphU9Ar9917NJ7EMu4FBrTsWyFW3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWDCm1kE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWDCm1kE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so5715415e9.3
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773321149; x=1773925949; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GO5Ex/QIWkGPUP7iuuggNm3NBAPmofIMJdKE65jaYI=;
        b=fWDCm1kEu/SIfBGLZ6yvApy7JT/SX++h9CKRWcZf/4h2FctXvlvjH4yY7PoStjk9rn
         6xAyDNhixRaiM4QVYpM8vkAcjQxOGocMh7w+61+eMXSLxRpIx+RAAElDNB+7aSicPBDp
         Lo6E/lJegwIXnqaANFNkbRY4WWnDjjiHY+Q12Q7UbP25tqQDpZxzdzaAeBJCZADUHpUA
         /UZ/lv3L+Mnlt6EklM1g5HVDaRVwRPGXMyMXeFxJl6ig2iilUQLLAUpj9qsrnfD7UfC9
         8qGnuSXHyDj2REOhYRrctw9lw5gTOcwt7ATHIV1spjTLtbnlqaK/mo2n6HiUEE6To5N9
         nyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321149; x=1773925949;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GO5Ex/QIWkGPUP7iuuggNm3NBAPmofIMJdKE65jaYI=;
        b=QKeacf00Y0jNciB6TO0un6sJEKQAjipJ2Mwb/BOxTRYYAmVYMZO5E6wX1eWtFx+EEz
         uCmDVPZaIdEKtB3ENeyGGNxOomJ/vGanC8kxeWl01syLay2RxjF94mE/GYVTrG3VFpXJ
         4s0euFWee2UbhvsauNInVR6Ng53mnwtNERLMNwQXviwpWZiG0o+8t4VxKMZAR4MeAemZ
         dwx6cwPUUDk9yFfVLlpUK6mEDm13akB+xIFoPh6M0yIjtcOTttheEcAc6IqNj7LUdUKX
         2UShpWz3U6NRJej+5r9QCtbFg5/g7nIa0okRHWiYzJipRrm0vNlrt5xAmJR5uB3rNhU+
         pY5w==
X-Forwarded-Encrypted: i=1; AJvYcCWNQdaQnI/9oNFCieCDXAgpQ9yk+RavoVHv/LyFSIZzlJK6ubs4yZu31D3TPw8DgnQYdxQMTyv0MzVSXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IRvUKiw7REf6R1h5s8KtKpXaYX/ErfdPUhsNKcu3dUPajFAG
	DAqdcElGAnu7VVtFjNaNbAprKkmro7lwepeZ7QDLptP11q8oZvYE9Vp23/Jar2pG
X-Gm-Gg: ATEYQzyLUVNVvpJQJjtAGQuZWO3JJ2BdgDv7NdGjzAwZ+oTNiO94yIBgm25tPSuPaMz
	ZstrKW5i2A/qPpPtLBA1lt/b6qLmIXWkFOdogwwKUK8QGMUx2X9K+91j3/LevwEfvM/wbpHO8Lq
	q+ZUiDQui045UEmjAUgezxSUPTAo7xhn6pjLKeXrjNDpvOaFEEELB/3aLHIyFayewQzr1NWjfzD
	XbppQ2TLtenOvDrfFSRAQEIxtmCHhAjIoCXd/fwYr8DnlS4xdXwz9KxF6Ftiwy+1OCa9Cylw1qr
	hanzesViHqEvTM3GjSUfcR7c2tL5w1V3z0kahfmHWtBvxBnWn5YXMCmOluD4gEizhjzvU+cITkL
	qTsWvjhegrnUhcaN4dSo4W8OpcYhZrVGrnIUOqtk+CYPFKoaofMXH0uimpm5qI2dilelA1OdSxj
	h7yZXZdoggRKTM8wPnQLzzrlc1Tw==
X-Received: by 2002:a05:600c:8b0a:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-4854b10c998mr108390745e9.22.1773321149275;
        Thu, 12 Mar 2026 06:12:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0bff95sm85143035e9.3.2026.03.12.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:12:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Mar 2026 15:12:23 +0200
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add USB-OTG pin
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-z00t-otg-pin-v1-1-ce86137ab989@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAbSWAS9ijhIGzVLlbaIKN7d4
 viG/x/IklQyDOaBJKdm3WOFbQz4bY6roIZqYOKOWst4ExXcy4qHRnRWLHHo2bsANTmSLHr9u3F
 63w9mLTF3XgAAAA==
X-Change-ID: 20260312-z00t-otg-pin-41e102d92c4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device uses an ID pin set to active high to detect USB-OTG devices.
Add support for it on extcon-usb-gpio.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
This device uses an ID pin to identify USB-OTG devices. In this commit
we add support for USB-OTG gpio over pinctrl in extcon-usb-gpio.

For USB to work in host mode, a vbus-supply is also needed. On this
device, vbus is supplied by Summit Microelectronics SMB358 charging IC,
for which there is a driver in mainline. Unfortunately, it cannot be
added to this device tree at the moment, because charging detection does
not work correctly - device begins to charge only upon probing the
charger driver module. For now, we add just the pin - USB-OTG will
require an adapter with an external power supply.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ea90b00a2c8a..6c19044c24bc 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -127,7 +127,7 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&usb_id_default>;
+		pinctrl-0 = <&usb_id_default>, <&usb_id_switch_default>;
 		pinctrl-names = "default";
 	};
 };
@@ -330,4 +330,11 @@ mag_reset_default: mag-reset-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	usb_id_switch_default: usb-id-switch-default-state {
+		pins = "gpio121";
+		function = "gpio";
+		drive-strength = <2>;
+		output-high;
+	};
 };

---
base-commit: b0501426597b91ad69359c312e32fefe4cd8ec67
change-id: 20260312-z00t-otg-pin-41e102d92c4d

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

