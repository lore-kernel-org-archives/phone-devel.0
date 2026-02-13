Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7D225413
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770992472; cv=none; b=Yw71gGLW0XwyGydxHnZbrpWayvttP2/zny2XWZGAFtxjGfv2fbXBG/ffAVDho7CkjGwmQkhW84N3NGjRmg/iq3OU98/Jpt9IKLgk+Atw7Z5kOrOjCXeYYkdG8EkQrNoDMI1jybRdqzdr20I5raZXlGarD/fMFSV/5hb6T7JX8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770992472; c=relaxed/simple;
	bh=PaJDyaKNMJRWk4L74IdB8CguRyGRaIr/tCoXLPzHYng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KF1CTdnvMCrxdc+icdvLu44/89YlReOAuo2vlyBBWU9WBLlsj6isdt2qt4shgTeCSIVHz/yd8MVAHAFoChGosts9NYddyeFHjnoflDyFXxf5tnL7Yw4ZHWAqE2mB3YAA4eThT+l35pPit+BXlqfrHz959U9lANFf40xESOhoJ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uz+M8SLj; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uz+M8SLj"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b883787268fso115288366b.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770992469; x=1771597269; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lNvGn/gAEy5rTVgtFUfiU9KyxO9dt/WiWx7gXnF/wQ=;
        b=uz+M8SLj3xATVu/YOYuhviEGC6ogRgqDnQbRDM6YdS9+vr9D0SvJlWteCKGBX+NYZ1
         MKRKH9b9d9ebU/jVj5OouZVhI3oEET7U60tmao/89BnCW4wkYLqhpRuukHs69qS77JUD
         caalCLlxP1e7wqdXB/L0f4NcIAfjYungjIq4/EgLjrlQ0oH129MPXIYCp3ZXMPutRgpP
         Thz5rovYvYnGC7XADkxnZFIXYJ3wPBVlfO2OnmOdQP+kAFLF52YnhRvxJZOcnlMTLXgL
         DX92X4zA1qyQX+ScBdRSwWNTWWC4ZO0N8H/ob7vGUGZcmXqGLPs44TI2v64OfKrtv9Hu
         nY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992469; x=1771597269;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lNvGn/gAEy5rTVgtFUfiU9KyxO9dt/WiWx7gXnF/wQ=;
        b=b5KPKwScuTGHJvl6zf95hsdzqOD5+EcHzjR1uZ0iNN3gO6cfTANoUgxeuohtLUYQbk
         ZQ4KtNTa8DBUVr2U1nGnCljNSjYloBeFuASQWPHihxxCmkOwTz2FHCTIkzhY/y86odPo
         KUbeWpAnEq34X4JrP6rbKdlFoD5FTAVRkM0ZytGClGLu0Zk6RwlT1ego04hTW9WSvmeW
         o1Q1Rx3P7/lC3F81E213dyA+fCSDF6qAX14jSM8xD/LhQHl022/eSUlsBwIBwgrQ5xNX
         J1RwZd1kHlU0sBl5qShbPESZ1Id94ulsjOTimwWX/His2OzK0Y9wqU49mjWb0BU69C9R
         lYqw==
X-Forwarded-Encrypted: i=1; AJvYcCVvDy0WBSYGxQo9QOxiFYJRsVexNOLXc7+lnku5WFbQQyQaC0mk6ZMe1cayrcZrTfo4b8L8RXKfV13QXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nZibYK83aysWVTmAx1HvE0XUWA5xCLm4zNap8FLEzBj7e6iP
	h/w31+z5Ayq1dNEj9qRW1dSikaHiokZV8h6VhO2Hib0jrbjP0HQJ4fkFKNpdv9P5Z2A=
X-Gm-Gg: AZuq6aKt+a6CiHwp5PaEJtT3vL4PTXBHeAOC/Vna4LZ2Bfftl2znyr/r1Z8UEv4poJS
	f3ctk5Ro1KIm7koYw4QnxrtMKiJ7XEU7tB/JEPEm5vJL1xdzv0uftBQA4uBX1JXGbFlJzdP+AF+
	J0E76g3UiQrkGWzSz9lIniKaIB0Cwe93n7bmifBiH+M/3lbu0CMyGxPrZXi+vcm7rw64Q+VLHnv
	0x7ofwq9Fi0Xg2atJL1MJncqBHyhf2qmwHZ6n/Vo77LQrnAFmgNJOJfO0hbug1nzXcpKeGWyC5M
	a3Owg3vMXfjN/0SFRmKpBh18sPjsmLCl7VmQmN//ySkmLJB1a5K6yveYEpjfgg+JO0XIOIEE5yr
	gfAhDo9PoBAsZ6gGmqUuseIACr2hBfF4uucRHElUw9iKPc/hyRLu7QbgP3/upgJA844YnB53ZFW
	3fdHd644b8ozzgStSKyz6TLPNZXEPtQk2xEMUMfDaE/LRGvJYCYHzF51MnrrdjxjiFhdUp7Pumb
	co3
X-Received: by 2002:a17:907:9692:b0:b87:a0df:2f98 with SMTP id a640c23a62f3a-b8fb4672805mr106847666b.63.1770992469139;
        Fri, 13 Feb 2026 06:21:09 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f9d45e79asm130787166b.24.2026.02.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:21:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 15:21:06 +0100
Subject: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jm7RjaaAFX3sOwKGVqm0CLbSUYw
 t2tsHb5JnnvzwqRgqUIt2KFQLON1rsM/FSAMtI9CW2fGXjJRcmYQD0JNHIYMJKLPiArL43muq6
 4VJCtKZC2y158tAcHer1zOB1H6GQkVH4cbboVjpaEe5wzDj/B2Jh8+OwfzWw3/o7PDBmKhldXJ
 bq+Lpu7ljZMxjs65wVot237AnEmzH/jAAAA
X-Change-ID: 20260116-fp6-hall-sensor-1049f2f872ac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770992468; l=2287;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PaJDyaKNMJRWk4L74IdB8CguRyGRaIr/tCoXLPzHYng=;
 b=emdVErxPZvsDCPjFLjkK/Ib4DqAmZNg9hjAxRMoUzy1wy+86mc5SrhhyKAg08Rzttq9JlS+71
 djlXzxRZaZPAsK6yO5ZxWiEjMPHzgStUoYZyTtFkqODKDqxu9INg8G7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the Hall Effect sensor, used to detect whether the Flip
Cover is closed or not.

The sensor is powered through vreg_l10b, so let's put a
regulator-always-on on that to make sure the sensor gets power.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
As pointed out in v1, this would preferably go via some vdd-supply to
gpio-keys, but this support does not exist yet.
---
Changes in v2:
- Add pinctrl for gpio70
- Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 7629ceddde2a..bba327cc7a38 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -29,9 +29,19 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&volume_up_default>;
+		pinctrl-0 = <&volume_up_default>, <&hall_sensor_default>;
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
@@ -807,6 +819,13 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

---
base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
change-id: 20260116-fp6-hall-sensor-1049f2f872ac

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

