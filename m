Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85633313E10
	for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360473; cv=none; b=D5T7/mJn0GNyXBvVg2802CXcoXIq4RinWjs5JoNe7svCcm4TVFlBlPycTq3ZRvFDcl9CpS6OsfN/vmmlX8X6seNpzSWg+mUwFVr0iYDG1iOSS9NsSxsZuESTJdZCii1ft36cONFpizD+mxkjaEc9vF18F2q+c35R7B0h6SX3Lz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360473; c=relaxed/simple;
	bh=9yJu2dJxEoG69r7armkn1uXO0+LbbsdYRkSyhvXQmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5tPnOAvVLTcq3v1AvAl3ORSDEyMOKFQoog+cUTViboqqqj4ow6vd2mXacON7u8RxLPCuIPhBcpwT9E11hgbJAogdv8V0RImVIELHDDmeAHz+zW6EZqu9uYbxD775hcl0jHD4R4oWH2G7Kl52SKkxdUbW9ZcMWC/ro/jwzhK/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzoyJE2g; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzoyJE2g"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1652515f8f.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360468; x=1781965268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scBpgkPwRJRRB0oOaefOk5GQsdI4UdFOs60BEKTsuNo=;
        b=ZzoyJE2gLRMksNzXL7fl8/nhIi9Fr7QtCS3NjHsASE9UWLW6dLByr+5YQ32k7RHU4K
         3smlf9GUUPIXOYN/2EICetq/abo0pa3MfSU0syzhtC+xEJHbeaylXNDoM2q8GA4UopAH
         3NkwehSklW9Cau0Y2EMNR4W0W8OcQLw/EP0IeR9VQRGef3arkc66/k2VWhcp/CodrjaF
         /KKyJ4qti5gHzs7qFpKtucBjL2MxcAPmlTxYB2xD0HhM70U70ycmSoGNnOVLs+CFP1vj
         0S9v0ZH/Q0fYg8lYJIGMdQdH7aqY9LOq2461/oh6BOJU1K3Juw4N/xR+WonPv39fDqkG
         AXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360468; x=1781965268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scBpgkPwRJRRB0oOaefOk5GQsdI4UdFOs60BEKTsuNo=;
        b=H3OYqLdVygC2hgL+XVRXWYZIdWW71j9Quw8oLAtInsNmWj0CD5usGrdLs7bNVOvm09
         Oc8v7WVN3dhgOhQo8T5E7joOiVz5S0khSkLFf5NBclK6cdLkMOEzE239MRzuS2IayZ75
         wunYF9M6mpMV1N+XS1BFqRQWRBVAbnnM7/ZEnWuIHNfAaicTg7VoLUG26RACJ49ETWve
         jwD43s7MMU+0N3o0Erb5RcX2fcSYe1tEHBvThYDNrQj4IWBEOZFIqWNQ5rkA4Kfp/aF8
         1SkR4i2VSWyot4P2htf9QqLToD5txMpa9ivlRZfIME48A5YdAWcx+e7Nfy9J2Lu+dqGw
         eZBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xcQtN/0piSTE/iWekq2fDM3qfzMZFZ+oagpQUhvqPpZw4NEfsGnMtwj1dVS+FBm4PDuPi8YgP5fRMOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRDs4liJGd4z4fhW9srnAkMpmla03GG5iPVAcdBk3cJXwNz37
	Wg9GuMq2JVVB3RxXKQrTx6AL2h2ORK+ex9m1FXUES2ptTxgMkPsupNzt
X-Gm-Gg: Acq92OGKdzm7kQTKvKQeQjxJMRl5rGqgfdMxZq7QBxiNhhuD+oqZPG/wmSlD91dAGTI
	7WAcTSQRoaFloHjANvOPHiC6QZmcZHPEhAAjsnDvE9EerpIAEgZBYRg8ZWRY8/OsVp+2a+bpQ9v
	z7ZDoOh/4MImeBQkhuHjUPEr+TpNY8zoFlaATZzMC2Zzbtrt1RgV+fg6Ly/k0LAVt332DrOaY7v
	aT7rTh1nIhU6g1DfDyVbTr0zrId3OiQrPoNkOi3e5u2GohsUnzSsN7xaUkJIrlwHmGmdOqNjWV7
	LGK4ImF5caVzx/tz/wG1rBKAu19wkmRBjF2WFPMcTX4iYqv4EnJZsDS8E5+ZHktJB09l1fnHcnQ
	H1UP5b8CCs9ydt1ePvpAY5N1jXNsrBuYNAbSxYvOvuZ1cgjDWdq0G6V6nwXX6X9XH0sXSVU07uO
	B6dOqy+Tt1UtbLZiNxFlRdXB3FSm22WSP/b341elAm3FfOcwUH+01QSsa7vQZiETO/iVwwLJzIs
	O0gmdn0f86O2VPROs1Te9qulzBzPUQ3qA==
X-Received: by 2002:a05:6000:2210:b0:45e:ee20:b897 with SMTP id ffacd0b85a97d-46074a87ca2mr4494885f8f.6.1781360468556;
        Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Jun 2026 16:20:54 +0200
Subject: [PATCH v2 2/3] mfd: 88pm886: Initialize the battery page
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-88pm886-vbus-v2-2-021dfb02c6bb@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=XiL7JAqbG0xv8gwNjEHmXefx65ts53pGI9Kg5zOFbVg=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wNcGY/d97eYK+uj+U7/Xerz0AniXkVpUy6ue/Fi2
 4ETNyzDOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAEykjpXhv4vz1hpFIVX5863t
 nxi/d4i0mN44Uf548axnycomKRwSuxn+B10ri36XFlA/oSv2r+pirSuzdDTCF2Tv71w4kcdoC28
 sHwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Initialize the PMIC's battery page. The battery page registers are
shared between Vbus regulator, charger, fuelgauge and camera flash
blocks, hence the commonization of the page.

Reviewed-by: Karel Balej <balejk@matfyz.cz>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Reword commit message
- Reorder pm886_probe() local variables according to RCT
- Initialize battery page after succcessful chip ID check
---
 drivers/mfd/88pm886.c       | 21 ++++++++++++++++++++-
 include/linux/mfd/88pm886.h |  5 +++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index e411d8dee554..f8401d5e6dbe 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -16,6 +16,12 @@ static const struct regmap_config pm886_regmap_config = {
 	.max_register = PM886_REG_RTC_SPARE6,
 };
 
+static const struct regmap_config pm886_regmap_battery_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = PM886_REG_CLS_CONFIG1,
+};
+
 static const struct regmap_irq pm886_regmap_irqs[] = {
 	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
 };
@@ -85,10 +91,11 @@ static int pm886_setup_irq(struct pm886_chip *chip,
 
 static int pm886_probe(struct i2c_client *client)
 {
+	struct regmap *regmap, *regmap_battery;
 	struct regmap_irq_chip_data *irq_data;
 	struct device *dev = &client->dev;
+	struct i2c_client *battery_page;
 	struct pm886_chip *chip;
-	struct regmap *regmap;
 	unsigned int chip_id;
 	int err;
 
@@ -112,6 +119,18 @@ static int pm886_probe(struct i2c_client *client)
 	if (chip->chip_id != chip_id)
 		return dev_err_probe(dev, -EINVAL, "Unsupported chip: 0x%x\n", chip_id);
 
+	battery_page = devm_i2c_new_dummy_device(dev, client->adapter,
+						 client->addr + PM886_PAGE_OFFSET_BATTERY);
+	if (IS_ERR(battery_page))
+		return dev_err_probe(dev, PTR_ERR(battery_page),
+				     "Failed to initialize battery page\n");
+
+	regmap_battery = devm_regmap_init_i2c(battery_page, &pm886_regmap_battery_config);
+	if (IS_ERR(regmap_battery))
+		return dev_err_probe(dev, PTR_ERR(regmap_battery),
+				     "Failed to initialize battery regmap\n");
+	chip->regmap_battery = regmap_battery;
+
 	err = pm886_setup_irq(chip, &irq_data);
 	if (err)
 		return err;
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 38892ba7b8a4..2c24dd3032ab 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -11,6 +11,7 @@
 
 #define PM886_PAGE_OFFSET_REGULATORS	1
 #define PM886_PAGE_OFFSET_GPADC		2
+#define PM886_PAGE_OFFSET_BATTERY	3
 
 #define PM886_REG_ID			0x00
 
@@ -128,9 +129,13 @@
 #define PM886_GPADC_BIAS_LEVELS		16
 #define PM886_GPADC_INDEX_TO_BIAS_uA(i)	(1 + (i) * 5)
 
+/* Battery block register definitions */
+#define PM886_REG_CLS_CONFIG1		0x71
+
 struct pm886_chip {
 	struct i2c_client *client;
 	unsigned int chip_id;
 	struct regmap *regmap;
+	struct regmap *regmap_battery;
 };
 #endif /* __MFD_88PM886_H */

-- 
2.54.0

