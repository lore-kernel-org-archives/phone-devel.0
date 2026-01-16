Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA331A555
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573376; cv=none; b=Zq1chlqGcmWWsLJJHEQIAI/9gYel7dQXsNuEDDGtdehkoIEyHXmdM93TusMmI3Dt9lTrsOyMpPT4pHfj+sA5Ta1gslTJXqFoZt1e47Pg/lU4VgS9jsTvuOOOnnYP7WsF5AKTXLnRWSVMHYPM4Io3vGWRlDFVTCV4qJS5ytsS3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573376; c=relaxed/simple;
	bh=qpyArYbgGexp0kw5GKDzvXd4kBpE70tAA0DX+Y4oYPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BUPc2mEK5TBqmGZ+XR98TBhA6dj3ofdQk4YgnZ1NLjRG/vEpbmUPiDo6YBlRXW6WvSKzsY1B838wxIuNk1WEPbooJVmjJSwdhSQ4d3MpHC4JkHvKBrcGLXFkCTUvbKS/ngaOGlCU/hRzSiU9gnuL1Tt/Nll9S0aimyJFcLXwOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WSfOmN96; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WSfOmN96"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso3272758a12.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768573373; x=1769178173; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4htJr+mv+3MEm3YJIQ7F3EojQWw625TtO5UiPuBMOs=;
        b=WSfOmN96iKXxFRro8ZsEjZjB0+VznXzBvzfbcATUNuaBPPShfW2ZCBePPMuXD88jnF
         zHKeHQ3at5UKb04WKQHnmR4T/Tlzmic4o+c+5SB/tZNpTIwSouxry9lSKWFsUzZIPi/M
         ZzWdkQRqOfDoCrKNgCwFT4jDSdS0JOza573trLisulpNWAWud0owTAJsMkfRAo8siIwg
         RJu55IhBgbHAAKlgoQesTUNDSJxve09HzDuOtFokfO+3HNfMkh4o4j001z7PTH/5uwcw
         bd7QhTNe0tTpa8+XiAQyb02+bVUw4XpbLkrrBSddCYtwuuOHuvWqrSuwOcO/me0CziDS
         wKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573373; x=1769178173;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4htJr+mv+3MEm3YJIQ7F3EojQWw625TtO5UiPuBMOs=;
        b=XLk4zur7oeuPG16n2+3mtKVPiR8e0L50fHjo/zyoi5pbnSMdlcEiyRDH/MmJN3cgE/
         6EAAAdafAfk5tsZBTzksWL0ZbIA6hA7CzDPHdeptpcWeJ6J3pjv/8EsClCr4PmlS5GsQ
         fZmIKP5bRSRUpQkq+xLyzzVXj1R1NFDH53upiZNItGlS2HhzwKYe9+gl23UchpbF/tVD
         F8iL9+JgcZrhAXFhwuHuAFrQX5ZpO1NWeFzyAyt2MI+Mz4OM00wRfr4LPBX6ioQK2WAX
         ON2K91Aobdc1JSsZGHAmSrlznSTXlkdtCSiMLc4eijWaN7SCO2yy/WxKRtUci0vrIzp2
         YKmg==
X-Forwarded-Encrypted: i=1; AJvYcCVjmRi8jYFP/OxcfGLRBeM91DOWXyafeY06zSdVkAHkX3qC0Sio2UYUC8ysTDhRK7Z9xEVHrNSX1bQWCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRpCii8P35KrY2x1Csgubqjn+wLW4VFBgOBkXOJ+SW0XlOffS
	Jk+wHYEH4EYKe8SdmRN7FNcnBgs/Hf+mpuNXQ2bHxJfkrN5b/g1RSnJr1024NX9oI88=
X-Gm-Gg: AY/fxX6r/vMZJtXC5tIabmQmr+O++YKK0JvsWouJ32IHrih+QpQMK6uK9T8lfEZbU4Q
	7VD1719hEtWQUbwoYEweMYtgEno76f6Cg9oj1/rjunsi6QPMZd47jvJCQmE+52CR3Xhu6Aa7hFO
	luoYO2C7o23ywuMoYWK3CAdlrrU41c/wRvCNKMCsq2REShV2aSFMSqng39r6x9hv9gW+XDY4xWv
	QqFbp8/q9sNmieNM4FZFX/qrIvhIle1329IokmgoHbfmSHMfkwDMRDaM5lIXzxhmAffR+hE2V5d
	VDgIKBmce8lCbyMNUVzt63xJAH4hFq1Ap2pwUQVlhmMz9MEYAp37PTvNz/GWKXAxT9k6ubCgqk5
	k9D227+DgX/fBJL7qDURtntnrUpPPUhIh+DOIKr5EiSTesRG0oLFShvDB2eNUJHwhNTOeCFxqpM
	BngZSrFtciCvD5nQ29GyYUTSS7E0dMtaSPX2Vz4sGfQOAqItWyTajIowU+I8jCozwZ
X-Received: by 2002:a05:6402:50ce:b0:653:ea2a:252d with SMTP id 4fb4d7f45d1cf-654524c77a0mr2442998a12.7.1768573373244;
        Fri, 16 Jan 2026 06:22:53 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce56bsm2558871a12.1.2026.01.16.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:22:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:22:52 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrDIBCF4avIrDugUkybq5QsbDo2A4mmjimBk
 LtX6vJ/8L4DhDKTQK8OyPRl4RRrmIuCcfLxTciv2mC1ddoYh2F1OPl5RqEoKaPR13uw4dZZP0J
 9rZkC73/xMbTO9NkqXNoITy+EY1oWLr2KtBdsuO5gOM8fBx2O55IAAAA=
X-Change-ID: 20260116-fp6-hall-sensor-1049f2f872ac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768573372; l=1553;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qpyArYbgGexp0kw5GKDzvXd4kBpE70tAA0DX+Y4oYPc=;
 b=SUQPJhnuPQ8OkZKLbWyhCU/QRzhAx9RGx7gjxBZU+8r8zevPBYChTL2y+F93PZr8Gj37riMSN
 +z5nLTFhTZgBuq7+kTL+8T2uWWz3lFzQOkXN7OoqS89Hm5E7Tx1b0y8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the Hall Effect sensor, used to detect whether the Flip
Cover is closed or not.

The sensor is powered through vreg_l10b, so let's put a
regulator-always-on on that to make sure the sensor gets power.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..98b3fc654206 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -32,6 +32,16 @@ gpio-keys {
 		pinctrl-0 = <&volume_up_default>;
 		pinctrl-names = "default";
 
+		/* Powered by the always-on vreg_l10b */
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
@@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/* Hall sensor VDD */
+			regulator-always-on;
 		};
 
 		vreg_l11b: ldo11 {

---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260116-fp6-hall-sensor-1049f2f872ac

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

