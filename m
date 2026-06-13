Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE6313534
	for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360475; cv=none; b=q1+nucrrN/OwdCKyOwJweXBOohOjhlbEDhyYJzY5WJyMOfXZACMO4I+gCNRB+eDcVVwF3c2w6hYjbow64M0dw4eCeR1VuBwVtx7f5e0EsLZjoVu3mkcaFoRyyqWqY+G7+glxCFyk8x9tlaDI60Ppqm4+nWpCURiMTtg4oyIxFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360475; c=relaxed/simple;
	bh=HsOIQUVZP0meU1up8FjT45jfTNwDlV/UQKJQd4Y56S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WitslWMAoSa6FpWJwduoYZowrYc2Fri6PypM/B9NooFE+Tn4JGn8pSiSCH3HpsUt02W+TQvsm2evOPEjSJ66seaelBiC+07rSjN5ZeWodcF96B4uY6ZTaSJySraCwsTp1uHPlT/F5d6JCgidz7BReT51FfSDv4T/9ADxY7kPATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8/o14RT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8/o14RT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2048920f8f.3
        for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360470; x=1781965270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIa0BdxxpHyXYoZXZICGHhLbBKJPg22HxWM6nxicHsU=;
        b=p8/o14RTQfTa6VqAjq8s+BGaKlU9lC/zvyyEawRXrxnr/8N0s9SnZ3Q4VeY3BHadM1
         FYVhgErdGVyl1LJuiycuRjUt5YJ0ZwLanBLto2T0lQz3I+MwXkpgsLgiwkN6W9tb4EgK
         uGXnxiTKVjwKrkbuHwgn6oUIaSFLvwflLjLXkhqf8yfePuvRAER64sULlhgfuocUU26N
         IJlFvPGF2RQT3vyrM+pz/Q3U5yFCNLlEjxjRKpheue2eWP8uaQr0CJaFf7ySaewKkVoG
         C5GN9uKj2tO2rxRlMRR9Zo1hEGneweTbH4m9OqNzyJWEygAeQEdU48pHgPQ9/MN/uvT9
         HERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360470; x=1781965270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jIa0BdxxpHyXYoZXZICGHhLbBKJPg22HxWM6nxicHsU=;
        b=Q1ndeVH2Z9L78gsrEDu0flSW2wLNCu2BdtYnauxzovxrUhxN6vdJa2qwHiSvoqUbvW
         rZcbDxgf+MPQ0rfVPFbxYu8hTBQvJcdzTfMwTe8ggKwvDe1i2/IFDbkl75CKqqgnCjL3
         7iOGNuRRVbFaaAm9EDNpCBF01soTxMD/HNsgSdRw+aYXBufWjtG+xGhJquAPeiG8LaOU
         5fTl+64UenfbirjfU6vHsTaQtq5200m09DkN3uim0jJs3kO7p1rZ/9VRGxPk6xesjaCg
         OUuE2WqePujp+tu5Qe3RIF1Jt/TBGh1f+l4lWtk9I8FHKAKttYfHEBQivcRLt+PK+3Oe
         QLCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cRxcWldDP3rtjd1J/aqi3awgU8jQtF0URQkGlwqLnumI3cTeKnZefpmVE7BoKHmMDDSV7Fe7BidrQDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6j9kginHDMoqU7dA9Jh6R8a6ClDBPjND8q618UZHk3Fk/j3t
	r7jIpbRz8ClwBW6fo40iGVpZZjEM4mRgPfO1xMPug26bbNCuwOSyATOX
X-Gm-Gg: Acq92OFkQOH1DHbKZitDxjfipF1psaQcCSimj91y54CGUgjX6B29npKwoJQCMOT/IXW
	TAoMdscxzZb6tJ3eJ7fP2IHl+6cEqQ84KFBUkjLlUa3xFTydj+9N+wdLAr3Pot8z3hzjcfhT0aX
	sjo6UWYkgS7d7HypJCwUB68qI3UNfjOSW6W5t9pHiKLh0RCDzfZDsRn2lORdYmH2wmqBNhT1EsU
	G+CU3kkqPN3/jfmlxs3kDWb00EIF89SYQZNsiTikpaQ4ZNHru1TUmh3urvEWX6eZpv+sLF/XjZ2
	vLdnOPmIIyARFj76r+fPvTCIhF6ie3q3CTa57g5eCPk3zxPSy63Oe+TawBqsNU1P96bhN+6+IWv
	V9CU2y4bktZFK5a8+WugjjEKYpzeeChYUs4JsUy7tFXEx5ETRaA843oB92jv3Dc8lqbkLbsR6TC
	YSwfrQwyEhvJK6JvROlWe01FBs3YLtO94EWf0/8+aGC7y6D9mTRlsI8S8+Gc1t3s/HSjSgpRG5f
	DAAKaAMV4qfzEDUdlNn4w0=
X-Received: by 2002:a05:6000:2889:b0:461:92e9:f83 with SMTP id ffacd0b85a97d-46192e912a1mr2169582f8f.36.1781360469911;
        Sat, 13 Jun 2026 07:21:09 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:09 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Jun 2026 16:20:55 +0200
Subject: [PATCH v2 3/3] regulator: 88pm886: Add Vbus regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-88pm886-vbus-v2-3-021dfb02c6bb@dujemihanovic.xyz>
References: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
In-Reply-To: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=LWAYeJg//k4Yt9WD2CLMT2Q79dhFXBPAg7/kBfUTROM=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wM+FEyz/7/wkkuUyf1D31RSrX4UT8qQ8t57QWd/t
 NGxE486O0pZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAEzkwUZGhsm6K89ryRcI3by0
 kOWC1pKol9q5afYFjekR870fbRWct5XhD/dO3R7LD4f+yS3bOaHs7Nt8lejHtwJOaJ0Xfpd2vEb
 hITcA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add support for the PMIC's Vbus regulator. This regulator is mandatory
for USB OTG support on boards using the PMIC.

Reviewed-by: Karel Balej <balejk@matfyz.cz>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Drop unneeded units.h include
---
 drivers/regulator/88pm886-regulator.c | 26 ++++++++++++++++++++++++++
 include/linux/mfd/88pm886.h           |  7 +++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
index a38bd4f312b7..53cb68528cea 100644
--- a/drivers/regulator/88pm886-regulator.c
+++ b/drivers/regulator/88pm886-regulator.c
@@ -337,6 +337,25 @@ static struct regulator_desc pm886_regulators[] = {
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
@@ -369,6 +388,13 @@ static int pm886_regulator_probe(struct platform_device *pdev)
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

