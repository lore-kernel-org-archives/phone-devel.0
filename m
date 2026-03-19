Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289523ABBF
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910513; cv=none; b=IzFbW/qYeje/F/kdW/CvOJekAFG4BwjzszMxTWwky8Jkul9EGNpIywBsyAp9KX27Uqwt4txw9bY7A7S3PpDDEplY6J0rCGIDo2bONowVNOl+OaRDKZQKKda8c6blc768YDMXSK5s37qSXbBiktTzVljzFhxpJweKHmG4xu3em94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910513; c=relaxed/simple;
	bh=IzA7DVYs76tgOv9WJWrIsFdXTl5V2IRyQcUpczSkiBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UWt9bdSrYWdfkGyqjcyelS9QfzObEh0EaV7lXkcfXh8GA4q/3otrlEpsFAUDgngAsl3idoRTod+eDxbQ8EfK4f0ehfPodjYKfxX2JiI0r70E4Y6rNBA9rml9g8Y+S1WM9pU5J2rO12mCq7Ke97ZWXluTOvggOB/Shzt6UlQn6XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4E40rKP5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4E40rKP5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661be3380adso1397257a12.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773910509; x=1774515309; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHtIJcQ4yOLtdh3EcNfW3X1czpv1TxdBE8D7th0R/gQ=;
        b=4E40rKP561ZGR08+kjOzLmw92B4RAvzpjP0wmeib/6YuKDtmDfR2pUvBTi8q0459ro
         qV55hl03EWp0HWPt8m3PpzEYAq6eP1F/zzmkXwLtl4pG+/mdjaqDPUeUI1SwyjPQ8naR
         1xQ16WFrHIKXXrTodK1RnVApuEw4Eh7aT+H+xVOuRmVlyC9dx1Syq/foPYPUWBT05yBN
         H/I9ynFC+raXKdfYsEiZWpZN+nb2TDpE3wGvenC6QtpHnXETsomMCqOaMqkYVDCWzCvw
         19PpyQCjbg8pxk/ko4eyue1sRoX9IXsBwt52utndRtoIoTWBV0DtIGj8gXMHuXGLZ4J6
         hfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910509; x=1774515309;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtIJcQ4yOLtdh3EcNfW3X1czpv1TxdBE8D7th0R/gQ=;
        b=ELnAsc0SEtnBTTEapwJ2W9Me1OhWnfhIi6ncEspdAFVu7ako4D+xDuc5DaNEhAKOk0
         7z/XFXc8STT07/v6UGVS60a9bRCU6PAud0OiViBShKqiJtgeapw8605TIJb/J241i/N1
         FDZSMrpvW4FUxzbg/rxL3DzCGI3DWppiF/fSmG7r1wF12C5Ip6AKCsKNamkg0YPC9eVn
         SNoz3lg8x7xmaKInt/aPbXpjIpuY3xazAuCQ7dJ4IwTiqLzOrdLCTPVcRNAstrccJdQi
         Pfmx0AyIxKZ27Gx0GiwL3+LJc0fJvxzJPubPd2WnL9f9UsxxZpOkA5crcGityWkDihZi
         hkXw==
X-Forwarded-Encrypted: i=1; AJvYcCVdLLe88M0+HTv+5zX/ZyBYZLzKcy6vsypodDrzAdVt2bVq0KuhJER3j5Of4YqcB1yYX8RYHTzG2FvfVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMrF/QpFdE630Zt+81frkJS+9YsHtD7HUiuqvJ5DiObIQ1mZ0
	wrPb+vT6/boG2SHVWcImPeoBs+WMXXZdUEYzy91CVpLhLxaxsRPGIf8tjZOOYIre2ZU=
X-Gm-Gg: ATEYQzzURmv90OMcCkIji2hu+hJ4VI5T1vW21vaOgtShs+i6jOFRoBqpDM3LqkymmSn
	2U3+bUd+GTwipuML6OpcfgJrPhkp9QuseSnkb2jh8jDVyNasETrj9v66aOw1KbGsTnBZYKqCxDp
	ujm4U2H/q3+Vxs/eN2lHv5Ief/pmNiIMqFQw5Zf4/XzDsEEmg0I5Jxe1IaNna90Z9p2JxKOliGf
	jauMSXqaVcHxmYctUUc22WLldKrN2jJvi0VnjppJPyxDL1fo/B5p42GI98c/EuH4mVIfSZeR2/J
	jyY6iGjMpBQ3p/S9zb3Ok5aC8LSN20zxiaSy/E52SsBFPB6TT0hH2oJBQc968pqOrCxf04APb38
	PINRji8dFQz9m8qAjeDKnsQWWR9R0Tqb2JffZ4v9F5JHTWoYTkyAxHPJMmRIMKCGYgc802yjBas
	9HfYoRo6sGTbZ8EYjZqYivgc5YsLEypEvq1pGkd16nyUZ7iGjKIW4xVVp9/UOLxLbULg1Mz7ryI
	2t8cr7JYpPv5UyX
X-Received: by 2002:a17:907:a0e:b0:b97:f28c:fea6 with SMTP id a640c23a62f3a-b97f486677amr382865166b.8.1773910508797;
        Thu, 19 Mar 2026 01:55:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d7ddfsm409472566b.44.2026.03.19.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:55:00 +0100
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9W9jmEOpXxINop73o6FSEsb87P
 CaQZEiswgmGJoPyI0nOo4JtG1j2+dgYZa0MzrjedJYwRI/3rJfFIC9S4I6MI++JoDZRuer/N06
 lfFnpZ2NfAAAA
X-Change-ID: 20260319-fp4-uart1-fix-9fe390294499
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773910507; l=1651;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IzA7DVYs76tgOv9WJWrIsFdXTl5V2IRyQcUpczSkiBE=;
 b=2S1wO6Nl6QAu+Y/oouP1Cgz4PwvApvauSatoiG+hngdXSOZLwdj3C8wvO3LwpUYBu/LBkWGhx
 eQ54Cx0biQRAQo921yxM/935gTwwW2HWLuIN7Ad0iPSXUOJaOfqHfwx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
that needs to be deleted, otherwise the dtb will contain two conflicting
bias-* properties.

Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index a3c2b26736f4..3964aae47fd4 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -1019,12 +1019,14 @@ &qup_uart1_cts {
 	 * the Bluetooth module drives the pin in either
 	 * direction or leaves the pin fully unpowered.
 	 */
+	/delete-property/ bias-disable;
 	bias-bus-hold;
 };
 
 &qup_uart1_rts {
 	/* We'll drive RTS, so no pull */
 	drive-strength = <2>;
+	/delete-property/ bias-pull-down;
 	bias-disable;
 };
 
@@ -1035,12 +1037,14 @@ &qup_uart1_rx {
 	 * in tri-state (module powered off or not driving the
 	 * signal yet).
 	 */
+	/delete-property/ bias-disable;
 	bias-pull-up;
 };
 
 &qup_uart1_tx {
 	/* We'll drive TX, so no pull */
 	drive-strength = <2>;
+	/delete-property/ bias-pull-up;
 	bias-disable;
 };
 

---
base-commit: de79886ae0ce739608514f6b1ae91c14c6a9e600
change-id: 20260319-fp4-uart1-fix-9fe390294499

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

