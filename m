Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C93327202
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995276; cv=none; b=JpAaN22L/OTFr++EIwi75kzsn9m2PVvS6XynYw2fKkxVlp4FrwMlQUKpEB3YlminDHl4KyzlQmJS61hAbuek5Elr84k/1wkwllxdYabAKuVDlwMg9AO0Dr+QTOW1+/DsGdKbyB0KAo7VZ2W1ghUc+BuX7EKiQXekQIVt2NrWgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995276; c=relaxed/simple;
	bh=K15nuZjaTiUBVKSXtUhPDvjMT3AwbGOD/SO+UT+RLk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UwoAk+PjzvUOscwWVQQLsAV/6xbZWhxo4GTPYFk+7duXdSObf+T+LhL3vcqMDNQZ9GpzvtR8O9CisZ8K5rOpoPb2kJbfXxRYY5dA5rl7qYeq7wRzkTOHoWZQOZM1AJR2mnZkVSQ7suoAfB9g+jxh3JS2PyuyVPm1XX14pum2PoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7pS1ZSW; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7pS1ZSW"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so9105474a12.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 10:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995273; x=1766600073; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbVikF+2G1b3d7XO038cFmze5WHGBBZWgyB+3vlCP44=;
        b=O7pS1ZSWIOJDyPqRS1/ZKwWa/vaVFBZb1quTM0M1/jn69zG7HtnJd1CzSEJl52lORy
         ZaUmsvYsJ5v8ePHhxs/GQfQ2aRkplv+xXb3WT92vASgI/crapJ3ouzzE/SM+iETl+GaJ
         9gtr8ec+MkRObbofkmQjwwjZYokrynXgj5HZz048WqbguUz2yt4Vb3+NWU47o60ZROxZ
         0tGABTOrMxj1jJM7bPwZpqRo3iH7e1ElglEqJdMGIhuUnOWW7vAq4Pf9Qb5ern2wwh6z
         Qx7navV4pumQfi+p8MKG9XlLNdSNnmAWYmeQnU0xyPxk06PjKb0dNLIFDmhZDCyfgj5d
         PErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995273; x=1766600073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbVikF+2G1b3d7XO038cFmze5WHGBBZWgyB+3vlCP44=;
        b=mMfpK4Eq3oc+jR0+PMHf5UDAD2kQ6+17shuPir47hDCsMXofINLt9G0sUK89aovy+h
         TwvknBIt/pCKh1HnT2Txog8P1JK3LuoVjsk1ZRg4zvaRQ89w+KN0cSCxwHsKu124YowY
         i7mhIhwqhixWmMjTxoW0gKz6bp1qSGXwSGWSzrEox/u3blRqAQkUZR5BmD590/hmL+sJ
         1qjantpgmHyCp1PqYfjCzKKxLWOpw43vFC1mMkaCNeDwHD4LM8Adii55qLQwwo45U2vv
         6lTBDNUxexKUiNhT6SPXgHAOyeNu4Q7EsyC9WuUSNEwE3NUsFf+Kyo8PNNWDD0JAvP3Y
         Ju3g==
X-Forwarded-Encrypted: i=1; AJvYcCUqD1IgagfHZ5MA1KBGbh9UBSlA0EHCCTg4wWsbvOaZyfTiiAjzR30BuTIpXgK8avXhDkPjSaibSk+pDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0QVRmyTvh0VQg45NnQ6BwTg32ORPwESQqUHHDUBTUVr5wjjM
	/duSoLVSMloy5aDjvP2a8vHkCUhwcqlUpAx/ILNcvOxuvsY/KKGj0nIC
X-Gm-Gg: AY/fxX6WgqBMObnfsiS/De2hWPw4p5X7fW463eSRw7Z/GFayOo2tLj9P0zXJI0EcKH+
	W5oeyPQlkt50bA5OAlLTOOW4b5vmSoLFpSAlvGBW5DC5DQKR7WPV2QD1g5LnTJ0aBLKZMC0cHhH
	0fFluEVZx4BPsZQ61J+1EVOd8qEVVlWWhal7rrUU1z9+EcmqVDmCoE6l8vPBR3gRe0YDGW3DL2s
	xdR3H05KFHxysvt3clunnkKICgSph01TKnOIvpFiFUgoSmswoZVvbKiW6ABJg5AsyZlCyC61eBA
	replYP977L4ZU8k+lR/+1E94f7V8VIfnZlVJBMPkj02vcrC3eh9HUumlWf0vBHoEy7sSoqM4oRK
	kI3B5J+eKppofVWwcLPVEFzxY3clZsLLIdxKZTFX5kLc5vYDzh8WDI4kPUc2kUr9umxGAym3EDR
	BwOieeiwn0bNjPKrEInmfcOyaTGGMtQ8jF2Wxhmgx2kCgKPTDL5bQOJMy6i4Dk3kSm
X-Google-Smtp-Source: AGHT+IFj3TCyaBMkYZdzStRuIRqQZOLqF7ec/I58OPcphVai+0kRlE2QbnpuALvqaq35kB4vGBD2QQ==
X-Received: by 2002:a05:6402:1446:b0:640:3210:6e48 with SMTP id 4fb4d7f45d1cf-6499b16a78emr16792502a12.4.1765995272511;
        Wed, 17 Dec 2025 10:14:32 -0800 (PST)
Received: from Radijator.localdomain (93-140-155-17.adsl.net.t-com.hr. [93.140.155.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5886d3d4sm152344a12.19.2025.12.17.10.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:14:30 -0800 (PST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Wed, 17 Dec 2025 19:14:23 +0100
Subject: [PATCH v2] leds: expresswire: Fix chip state breakage
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-expresswire-fix-v2-1-4a02b10acd96@dujemihanovic.xyz>
X-B4-Tracking: v=1; b=H4sIAP7yQmkC/3WOTQ6CMBCFr0JmbQ1tQ4OuvIdhUaeDjIlgWq0g6
 d0d2bv83sv7WSFRZEpwrFaIlDnxNAqYXQU4+PFKioMwmNo0dWsOiuZHpJTeHEn1PCvnbNAXi9Z
 4D5ISV+St8dwJD5yeU1y2gax/6v+urJVWfYstOh8cNv0pvG50ZzkyZcb9vHygK6V8AXq18CK2A
 AAA
X-Change-ID: 20250829-expresswire-fix-663d1b3c32aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4518;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=88T4mkMcx1ShNFI4rFzfnyovyPLWzXoaZQkJnadZHJY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDJlOn1kPXbT4s1472WKZyw3dpe2Jh4qWaE3qW/nhToHIL
 ZWPHlK7O0pZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiV84zMjx5bX7ygW2PwbN7
 CVXdOkYWfIssXnzmXPvG6OtWsSSFOdMYGRasKVkneSLe1OvV9r8rfQ4u/ik/4QurQUNA1+KpJfe
 9mTkB
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

It is possible to put the KTD2801 chip in an unknown/undefined state by
changing the brightness very rapidly (for example, with a brightness
slider). When this happens, the brightness is stuck on max and cannot be
changed until the chip is power cycled.

Fix this by disabling interrupts while talking to the chip. While at it,
make expresswire_power_off() use fsleep() and also unexport some
functions meant to be internal.

Fixes: 1368d06dd2c9 ("leds: Introduce ExpressWire library")
Tested-by: Karel Balej <balejk@matfyz.cz>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Update trailers
- Rebase on v6.19-rc1
- Reword commit message (fix grammar errors, simplify text)
- Add Fixes: tag
- Link to v1: https://lore.kernel.org/r/20250829-expresswire-fix-v1-1-f8c8c6ad6c5f@dujemihanovic.xyz
---
 drivers/leds/leds-expresswire.c  | 24 +++++++++++++++++-------
 include/linux/leds-expresswire.h |  3 ---
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
index bb69be228a6d..25c6b159a6ee 100644
--- a/drivers/leds/leds-expresswire.c
+++ b/drivers/leds/leds-expresswire.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irqflags.h>
 #include <linux/types.h>
 
 #include <linux/leds-expresswire.h>
@@ -16,37 +17,41 @@
 void expresswire_power_off(struct expresswire_common_props *props)
 {
 	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
-	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
+	fsleep(props->timing.poweroff_us);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_power_off, "EXPRESSWIRE");
 
 void expresswire_enable(struct expresswire_common_props *props)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.detect_delay_us);
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.detect_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_enable, "EXPRESSWIRE");
 
-void expresswire_start(struct expresswire_common_props *props)
+static void expresswire_start(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.data_start_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_start, "EXPRESSWIRE");
 
-void expresswire_end(struct expresswire_common_props *props)
+static void expresswire_end(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.end_of_data_low_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.end_of_data_high_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_end, "EXPRESSWIRE");
 
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
+static void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 {
 	if (bit) {
 		gpiod_set_value(props->ctrl_gpio, 0);
@@ -60,13 +65,18 @@ void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 		udelay(props->timing.short_bitset_us);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, "EXPRESSWIRE");
 
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	expresswire_start(props);
 	for (int i = 7; i >= 0; i--)
 		expresswire_set_bit(props, val & BIT(i));
 	expresswire_end(props);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, "EXPRESSWIRE");
diff --git a/include/linux/leds-expresswire.h b/include/linux/leds-expresswire.h
index a422921f4159..7f8c4795f69f 100644
--- a/include/linux/leds-expresswire.h
+++ b/include/linux/leds-expresswire.h
@@ -30,9 +30,6 @@ struct expresswire_common_props {
 
 void expresswire_power_off(struct expresswire_common_props *props);
 void expresswire_enable(struct expresswire_common_props *props);
-void expresswire_start(struct expresswire_common_props *props);
-void expresswire_end(struct expresswire_common_props *props);
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit);
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val);
 
 #endif /* _LEDS_EXPRESSWIRE_H */

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250829-expresswire-fix-663d1b3c32aa

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

