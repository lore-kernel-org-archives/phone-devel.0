Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC443C13FB
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822929; cv=none; b=BZ8d3+mT0LdWKZWbJ7ecqfYYGVOkb25MX+Y/6SAUwAzDjMCuvm+tVXD9WGSj8FwIcjgNURPdR/dlJUolcHFl3HXlQWgY4w1HMbza+8CCOAc+Qlb2QY1zyMb1HvgG4nLdR7xoAngg3+4aBhcGG01UUCNZ4vdf/5sCYinwAwtNzl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822929; c=relaxed/simple;
	bh=WKZkaR6hChcbvtz9fnQ2Xzs217Ktz7BqwB17pHAI4co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwQakGStUrqES/00NmecQ5iVdIqpn1APEHHqAt+UnKYE6iqZADbqZEtYg7uK2x8iTCELSsrenaaEhcNhe1eLZpHTVT0mTSQdcJ1kFhcAp74y6row2aWuPTHEgzG4uk53QegSd0DbVEFhQsYaOYUUx8e4ekq/d2/QqY8oXmXBfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeI+nPq0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeI+nPq0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44509921fbcso7021832f8f.3
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822921; x=1780427721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8YeelUo9iIehmhHQzzwQiFcrxsyE1qDmhCGrmArbqU=;
        b=IeI+nPq0366Nw3LT70q3fQC5vdYL3B1kg2crei7yl28sIV3Za3cDk8fK7wxOwIeXgw
         j0mhHXibwbIkM+c+SIABsPr61vrrcjUyEaAURvsNeMwOcMtwJQOHoRqK7oA3NGllGAKy
         bzBPGl6GZHfzFhxJgpSGTmN2HxQoQxQSDz5zxhSKkxowUV5SYBaoglnN7bJZS3wi3BaI
         67YH81Y4VNu/O9gGLZCpaE/isxER9TDlNrwJ+/F5HbSBycO+Pd7r4UJIb+1L1w8TShUh
         RZxf6JyylldCGevgIEsSxHTvTPT6LkaBCZfIew0vPq5nVBi5cCojRkYor1vYwOeU+4H1
         AsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822921; x=1780427721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8YeelUo9iIehmhHQzzwQiFcrxsyE1qDmhCGrmArbqU=;
        b=Ew1EiZJzvq1FjVjKb0ieLnhUqnnLh0j3EiNGnphQmHjMykNYsTbnemWbJ26VhabvSl
         z1TQRzxIIom5T0hLl/UhOxqAZaGqSY7nQJredHp3FUSpTaz4D2p1yUFaHC5i1QGVN8kV
         LWgWiRLV4a24QKYNILpzsPDxBHOzdDEy9uSE85kfpBlK3FlJKY5Ho0JkM8tgsbNrm7rr
         iamg/s6awZcCRxZNsn3O4iDxESvUjBRRfsuneXhy5590/R4syl6cS3A+xgnTEwkc0YCG
         aZ5MAr6t/qKxmb6cDIq+uHXfm+APmq7FpFfDv2bPVGj6DUObesQN4sSUC7JahTGzW6Ts
         Bd2g==
X-Forwarded-Encrypted: i=1; AFNElJ+yrtW2nIAaJc8nAMyi1uI+o3u/BySQeNaiUgOJG6+tOqRAxv9kAWAxbQIAzFMsIhksY/ij0YEry3Up1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiLjlILjqvLV1F+k5R85XS4vZCjP7gzyx4cf0GWKrxl8Y0NBr
	epPyEc/go9xGHAtXv17za8xspATENeZUHp8i7oaMYp2zlkdI8AZeml0l
X-Gm-Gg: Acq92OGebRs4C21qdXCqai+TU1OfKo2WTeR6QCtta0JJwkzy2nfp/YCs4MTXJmnt490
	1IdGU0IUmIHmzsUPPjnbpvWFWDFMuyYm8ccAiUx584q7xdXio9/Pybh33gU64wLomRgWOSGVqC4
	hSjyq569akecgbyNlpDB61JCE/LZMDJ94KdEj2SXTKRXnmcH74Tuz6CEtaGoyLeiHkqYupzMwXI
	XUbsMPpR+yd1xkuDQlBOcGOVVGmZtx6z2uhzxJnG8/PHp+z8O4d1TxH8X/F8zjBWrsFtlgsSGlw
	Rn1/rdxoEdF5cRM1QjKlx38RCA0q7nihZNjjpZcL81XNwJBRApr2HNw+ubE/Fl1oMcQ2Dxb85QX
	lPhre1IJIzMQRThSFMHYC/xuMqpZhDE0lf3g5U15IB2DNd0ofrBlc0uZXpg7bphNM8U7xfVgbUZ
	odq12DTJJ3x7P+8j7opyBslamZHjJnYxuUuj9uGm08kM1bml71SuCmNCAeAhnCseRb7eKdBf8oj
	4KGTzZiktLT9iD3RNZ7
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr35763136f8f.4.1779822920781;
        Tue, 26 May 2026 12:15:20 -0700 (PDT)
Received: from [127.0.1.1] (93-143-222-3.adsl.net.t-com.hr. [93.143.222.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1c7bsm261529f8f.29.2026.05.26.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:15:20 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 26 May 2026 21:14:49 +0200
Subject: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=igfFYzore1LEJO4dQE+H7uVZripYWsm4WlNjLV+7NNE=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJEPzpxHJ/LVK433y2g1engkYm9DaypW7s/bSubtMaNp
 bQ+RLS3o5SFQYyLQVZMkYV5qdwlvtTwiQ5Ftkkwc1iZQIYwcHEKwEScvjEyLAqcfM12mdiFOwUu
 IRHPP5dyCTxfpRVds+fonVbWo2v9djH8lSsy69m3sHprW7f7hQdOUm1rM6bcenRq3xPjaaqBLya
 ZsgIA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add support for the PMIC's Vbus regulator. This regulator is mandatory
for USB OTG support on boards using the PMIC.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/regulator/88pm886-regulator.c | 27 +++++++++++++++++++++++++++
 include/linux/mfd/88pm886.h           |  7 +++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
index a38bd4f312b7..039822e86ec8 100644
--- a/drivers/regulator/88pm886-regulator.c
+++ b/drivers/regulator/88pm886-regulator.c
@@ -4,6 +4,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
+#include <linux/units.h>
 
 #include <linux/mfd/88pm886.h>
 
@@ -337,6 +338,25 @@ static struct regulator_desc pm886_regulators[] = {
 	},
 };
 
+static const struct linear_range pm886_vbus_volt_ranges[] = {
+	REGULATOR_LINEAR_RANGE(3750000, 0, 7, 250000)
+};
+
+static struct regulator_desc pm886_vbus_regulator = {
+	.name = "vbus",
+	.regulators_node = "regulators",
+	.of_match = "vbus",
+	.ops = &pm886_buck_ops,
+	.type = REGULATOR_VOLTAGE,
+	.n_voltages = 8,
+	.linear_ranges = pm886_vbus_volt_ranges,
+	.n_linear_ranges = ARRAY_SIZE(pm886_vbus_volt_ranges),
+	.vsel_reg = PM886_REG_BOOST_CONFIG1,
+	.vsel_mask = PM886_REG_BOOST_MASK,
+	.enable_reg = PM886_REG_BATTERY_CONFIG1,
+	.enable_mask = PM886_REG_VBUS_EN,
+};
+
 static int pm886_regulator_probe(struct platform_device *pdev)
 {
 	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
@@ -369,6 +389,13 @@ static int pm886_regulator_probe(struct platform_device *pdev)
 					"Failed to register %s\n", rdesc->name);
 	}
 
+	rcfg.regmap = chip->regmap_battery;
+	rdesc = &pm886_vbus_regulator;
+	rdev = devm_regulator_register(dev, rdesc, &rcfg);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				      "Failed to register %s\n", rdesc->name);
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 2c24dd3032ab..9e96d2cb92f5 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -2,6 +2,7 @@
 #ifndef __MFD_88PM886_H
 #define __MFD_88PM886_H
 
+#include <linux/bits.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
@@ -130,6 +131,12 @@
 #define PM886_GPADC_INDEX_TO_BIAS_uA(i)	(1 + (i) * 5)
 
 /* Battery block register definitions */
+#define PM886_REG_BATTERY_CONFIG1	0x28
+#define PM886_REG_VBUS_EN		BIT(7)
+
+#define PM886_REG_BOOST_CONFIG1		0x6b
+#define PM886_REG_BOOST_MASK		GENMASK(2, 0)
+
 #define PM886_REG_CLS_CONFIG1		0x71
 
 struct pm886_chip {

-- 
2.54.0

