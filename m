Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7A3D3489
	for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030616; cv=none; b=R3204wRihvziBTCm8cnjEeQ6c9EEBevYQLekcg+Cix8IMEclrnSfBAWRIIeXXl9pN57KKc7LI2nnz+rJdyhqi3N6vjeBoLXB9B+x6KbDBWu9vtQwrL7DvNW8ub/MYp3Bbmt8ugSqLv8K2ivrEbU/71mghkrKT2rmjbdRqOaO/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030616; c=relaxed/simple;
	bh=rKEeqVjE7wfvhzODV5z9zcNrAw4sm3ndUuu6PN9eKjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pNyMdmG3bv74qJt5D5ebODXQUs0HAoTsIBc2RCV+WCXYaNQ39sRyVjYsXq9X8eVpAjIx6oK209qf5vZMG2DQ/arZhG4GUg6DB+khc4ZmbVBABHsovsEmAbppa3OjXYJ3c+/fX9nUq8KG68qFfcca9mkuKzfUncUTnT0cxQHUWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU/4bZN/; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU/4bZN/"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ca6595c8aso1243984d50.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 06:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772030614; x=1772635414; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5kQ77vzvVXrrGoka+gxza3DJxHiQ4HnQDx7tuRIPuo=;
        b=WU/4bZN/VSsPB7FurFAyKD2xFJUePr35LRXNhCSzmMarD7zrW1uvTFiOt5BOEHUjVK
         ZNdX71XGotDL5pflPbwNqXzQbuagcsYee89LoKd8pByIYnckd+DjfZ7NyhTtjrQUgyUB
         TfKBoQZT0jqEq1q4IHJpa9yzzrTyiERuZlckkXzN8pTxFB2kL3KnGrsCFSJC0dbv3dLM
         Sod22LyFbCG+ytfwUVLwQa9A0P4kJ5+TSee/o0/v3IQAzI3ABkqFeusI6n0Acxvnu/CW
         vhAov4aRSsMOcIwBbiVeVm9xBHai2yxroZiH/nW58YGhA6EeL8NLEDOUZVNwU+1nRgxM
         v9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030614; x=1772635414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5kQ77vzvVXrrGoka+gxza3DJxHiQ4HnQDx7tuRIPuo=;
        b=h80Z95Gl4CusXi+r/e4Xx8j6L8kvfYWtvaa7FEbnyD3aJ07tV0jT7gL1WxvjkGBANw
         oAtlI/c3D0HO51FkblX79LQUwni07oeV7XuVnZLiEbQZhJa0nc4O3xQvvGsboL+h21Kx
         7NDwbbsMQZPsB3ErAThJ85cytTRTNmMDqPOxqyc4H0mAETIXWVygSebVlsSNbcAp09hZ
         lqmm21mx+zs8md3r2ztup5blyjDE03mhuE3LQAXG2O1FFvqz7xEv9boFcIcCsIxpcICa
         J4dhOqPgWexyjwlBN1H+9ZCefQduxHFUyNCyt4va9ERyou7dzcvWB7BYuc3xnV1x5Jmu
         a6lg==
X-Forwarded-Encrypted: i=1; AJvYcCWo25fEH3DEne3RwOaYlJfQOoZLy4f+eZGa/yhwCLK/mcAbqk5OL1elpq9uupormNIkLI4hrKV4MSr2OA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeu6JsBijVBsHm/ws+HrqL9owqnaPkjWXsCPclq+EhRJJzzhdm
	MwSELDb8gwD0gvosUVPD9uktxuWPMNNNgnMLuQImlMsqe0gKcByB+S8l
X-Gm-Gg: ATEYQzzDz82VmMxjzwGT0UeaLeraGBrfPeP37WOWvGeaot7FxyrszmCy2slpGjDvPpz
	6rhKpsMshU3z5xrLIB7btnBZ5vyYejlP5k52YpdLBTO3rL78/l6HKX1w7YCO73GissCkWAVDfhb
	2DI5X595GGXYRDfZZkcIV0ttaEUaThYFTFdoBoxAivWZkmyGCIcy0aCwyIcMJmQpHs7BhnxAkED
	Wv+u1mTTjuFxFylYN5bAAzuhZQsYr7FXphK36TLY9D+vkpDo1GLNsmb38BpyjIyg9oA8ijiOlNn
	lkdepD6vEzW0O5fmv9WS/rLKQxNspZ+Q9jY/T2NF1xhZiXHqvyGT0ysTBZzY1X8ZX13YPk8IjT+
	auKoEtClFT/MG3k5e2dO1ORIg2LmQh0nFzaZkHuWZK1DvUmomOJBIuEAGIiF6avaH5k84zquEOB
	64Ff/4luyMAS144ky2daCy5Q==
X-Received: by 2002:a05:690e:16e4:b0:649:b975:df20 with SMTP id 956f58d0204a3-64cb24d9de7mr443663d50.52.1772030613902;
        Wed, 25 Feb 2026 06:43:33 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a2520b6sm5555814d50.2.2026.02.25.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:43:33 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 25 Feb 2026 16:43:24 +0200
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and
 proximity sensor
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hOIGazMXEVmUdpUA1KlEZER7
 25x+Rb/n2BSVAy+zQlFdjVdckX7aiBMPo+CGquBiR0xd/gn2jD4VebZo0m2pWBM8d0H/jhKDmq
 5Fkl6PNfhd103OxgcZ2UAAAA=
X-Change-ID: 20260225-z00t-capella-sensor-dfd37c2960f6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device uses Capella CM36686 as its ambient light and proximity
sensor. It is fully compatible with Vishay VCNL4040. Downstream device
tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
actually found. This commit adds support for Capella CM36686 ambient
light and proximity sensor.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity
sensor

This device uses Capella CM36686 as its ambient light and proximity
sensor. Downstream device tree uses the compatible of CM36283, but upon
probe, we can see that a device ID of CM36686 is actually read. Possibly
a driver for CM36283 was adapted to be used on CM36686.
This patch enables Capella CM36686 ambient light and proximity sensor on
Asus ZenFone 2 Laser/Selfie.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ea90b00a2c8a..1a340fa92755 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -147,6 +147,17 @@ magnetometer@c {
 		pinctrl-names = "default";
 	};
 
+	light-sensor@60 {
+		compatible = "capella,cm36686", "vishay,vcnl4040";
+		reg = <0x60>;
+
+		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+		proximity-near-level = <30>;
+
+		pinctrl-0 = <&light_int_default>;
+		pinctrl-names = "default";
+	};
+
 	imu@68 {
 		compatible = "invensense,mpu6515";
 		reg = <0x68>;
@@ -330,4 +341,11 @@ mag_reset_default: mag-reset-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	light_int_default: light-int-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
 };

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260225-z00t-capella-sensor-dfd37c2960f6

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

