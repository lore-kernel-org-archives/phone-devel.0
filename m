Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13D3933F3
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575055; cv=none; b=ZrLazHl/S7sJZAs63YKnopGpn7HiA86AjcRlA/vWjTCgv9uxfA1kLORG9aDjS+LgHCcu2VRpgPXsdKg3yn9OMO3Zfm9qa6ySAPBbGyZdNlVtsiRS2IDAwf+B76tXcFJnzWMFWKWe8M2bNX7wXr3KQ63DD9Lo6YgRtxkWyuO0SWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575055; c=relaxed/simple;
	bh=gjhNyyiXPMwDxet4wKDSHV0d9wDjmHjHxnL5eNbp+F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+6s+p1lOOgD9MVZ+vPANugQqkueMaygHGV/cgXwMnhJcHfKTNBJrwpslT1G+Va5FzGeC0HH56SHEE26FietgmItjXNDOlauyghvaVCW5QPjha4LMH29tQHxHQBZRbPRGyWksCQ2jusce6DNalfrsq4Vz4e5guJsaTaPd9V11LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M/KRtbmx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M/KRtbmx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so3249020a12.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575052; x=1769179852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjx8cp8u1zTtz+8HPO5dBG1VmcVVPk4nfrHWtFsxXSs=;
        b=M/KRtbmxY3K3nTUwFVbNEsKQliOss69ZFDb7zTwda8rwFtHsq1s0XjqPu9tS602ski
         W36mjZLIA6U7YXlYRSB4ijpJykNVPOZ8Bq1acWrkwV/wzrC4low5lnlA/45me8Edfgom
         ISXeNBoTYnwiH9Na9IioySD4Qn9L19wd6xG048k2Sw0xOOcko+ZTzg3FOrx8LQVON6ZY
         M41HfsU/UbXCs1XdL5HHGbY4BXGhcWk+udSxsSOPT73E4MsItanaxnffuhYGyFs5zU4W
         1KTF2qdMUqOG69HV7aez5ql4o06yFEuAWcicusIskDPstQ6ZoZu4H8UunbZ8iRv44kbF
         KBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575052; x=1769179852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjx8cp8u1zTtz+8HPO5dBG1VmcVVPk4nfrHWtFsxXSs=;
        b=mRRk/nCPOZgBOLB1CI6HbuuXLCokJG04FOeH2cP1rqgevF+RUhY3IJhYnZkhieru6s
         tHNLgnynp7kfxR738tHcxfRzao7LF/QnDb/EFIID5NNKrOFCBKDkMLOE0v1yGMB85cbT
         UvpIMtTk1Z1md/cYuP/admLK+LyTrRy9ypQhevoz83tm2seJQjf4zM2tXeyhFATbHrXc
         DAFRC85ScdqebGGx7eHf4tkONH3FGZfXGQQWxFOhT1mNxR8q1u62Yl8GbH1zfxMIKYNN
         cPPsRfgB2NkQAZk3i0aa9MWzsUjuAehEHCvTGuHj6Kov6D9Uld6hTFFZFnXvQbtRSJ0r
         kfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfQxFwTLg6VL1lEdfyKwLdc16++UrL9zOllb6gQoa8itqc6mvhokNV3QjBk6wtijOs4oFjO7lfm7vH7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwILuikkOoRTN5ImFm2ylFw97/iTfWQ1c0RMS+wDPxbjH1hcoBS
	UBrQFTSV3365Kaqo3wDZ/P18TH/fZJJ7LkS+zlyJWzH80sYwrnHLzCeyO+DTCkQlwnk=
X-Gm-Gg: AY/fxX7aXhiEuqglQkZP4E+SquItFjQ0jfHaSO/mfhvn4qQEwSXaR5ipQbmGBt4F5o3
	9NHLWMa2fpUD4aMVIXdbotz0wLJLVRGBx7QQIwVbwF3JwSbmeJoY8Hpzo9n51AyFtk/ImY/NVxX
	ZxsRNdDMQtEel9Bg6TeNMXR7LEBhQApJURKewTZ4xVsJnxjPU48W76zF4IC53eUtypcc965PR+7
	XQMJmUPwwwA4b1JkwaB8Yh/W0imoaWiAcTMdS2L+X00x6vHrzWEhoJAeW1zbVwHrfqqcFBTTS1M
	pRQD7rsH+/qj1bRjGCnu5GBFTO2JTCHi0oX5YqsxYH/UJHuVD9JXhwrRryEYsyXX2mYCx+DFQKq
	7eQvk1dakdQBn/y3qWzD1sEViTT8SYpBlubkDm35nVb+vBKN8MvCXisS7+mvcURy+wlif8BVVOE
	5WqQo/9MX6hHYghc5DT+yfhbhjQd7RAs0xcFv6G8iaQzsoVAeaiB5H/haxM2ZiLB5Z
X-Received: by 2002:a05:6402:1ece:b0:649:2347:e15f with SMTP id 4fb4d7f45d1cf-654bb61af82mr2022241a12.31.1768575052026;
        Fri, 16 Jan 2026 06:50:52 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:48 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: milos: Split up uart11 pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=1821;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gjhNyyiXPMwDxet4wKDSHV0d9wDjmHjHxnL5eNbp+F4=;
 b=9aCWGUk70yj5LCtl1yQkbB+PuccQDjLr6m/nWRrB15aM5nCuUYvR/4W9Y8+MxDkkNrS7kb8u2
 C+9KiWmMFacBR25AAZ//iePt3boxN4/eIxF6O2AZgcmfclRZmZWZ7i9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0f69deabb60c..024e1c9992fe 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -915,7 +915,7 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart11_default>, <&qup_uart11_cts_rts>;
+				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
 				pinctrl-names = "default";
 
 				status = "disabled";
@@ -1835,20 +1835,24 @@ qup_uart5_default: qup-uart5-default-state {
 				bias-disable;
 			};
 
-			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
+			qup_uart11_cts: qup-uart11-cts-state {
+				pins = "gpio48";
 				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
 			};
 
-			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
+			qup_uart11_rts: qup-uart11-rts-state {
+				pins = "gpio49";
+				function = "qup1_se4";
+			};
+
+			qup_uart11_tx: qup-uart11-tx-state {
+				pins = "gpio50";
+				function = "qup1_se4";
+			};
+
+			qup_uart11_rx: qup-uart11-rx-state {
+				pins = "gpio51";
 				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.52.0

