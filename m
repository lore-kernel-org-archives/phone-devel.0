Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E231282E
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970951; cv=none; b=XalQPyqNYRZJEE3OZ6h5IB8MqrS22x/bBhNOXinSMRQd2VYE2h69nfOYUua8eUFEiVXO5Hps2Oqoot43ZPiSqFqEmNZcvySDzCdLRYFpgAYqWjFN6Wj/ECPKa4PvALPdpAY36iOQKcvIxEd1D10awrBhbwcxUkkeGq0h+pI+QTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970951; c=relaxed/simple;
	bh=XltF23iU+jXeuJxhhps/NSwXwMI+UkoiIo8Coo6WoMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atTgu1DG1/7+beXFxqqBBZ/IGkOhJsmVscBh4qA36SVRcd/v08ullVE3FAVr9nI0uPdWOwm8YpQ35BlUF45PviTAAzIeY4CDs9OuDY/SAxkkgv9171NJRgRAqVRPDAts8M6fCmCrI2T29hkPFkekbdlq6QRqkoYLHj++f3Hg7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ceQM2pi9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ceQM2pi9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so4955994a12.0
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970948; x=1768575748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sF3ZcF4xUEC3JcJxQYqBchhCHAKMGuALG5ZGbk0glio=;
        b=ceQM2pi9AEtnn8PSLCTwjxZa3TSjk0X9eep/qzwqyOqQgBeUcLPFB7qva+mIQHw2v2
         anhhrzqtjiTfJhnzLAFUTFuJEEnet+Vye5WLm/6KzV5YyKokNGW7IrvOBZ0JRb6zZcXD
         b5ZjpZ3VVDwB6ar/61EKrGiwLSCVgkcf6v4oZCfVkQRvgaSN+teWkqGwcehlyVG57BDg
         6yLhhIa5kBduDH+5Wt4POOyT+xU98uDaZ4vseunqGvctnHvJTxa6ssIIv9QijkGB1ujZ
         LwLAgDqPTjjWTfQEPZe+zt9fo0PRKxBVFzp7gw9X+U59v7Kt6A+iWH9l87ADuwIFpsdy
         BljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970948; x=1768575748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sF3ZcF4xUEC3JcJxQYqBchhCHAKMGuALG5ZGbk0glio=;
        b=ihTTnkfNSgFSN4uuyaowjDj4fRLZl5FnLEWsbULSYD2F7n3vs3EYpsd4Mmu96zdD7V
         f6yGBG/ZoUsl7J5OnYxILqlDoXM+1SaFyhll54/rCsQ005KQVKNF2Ca59oSQUu/950gs
         vgcUzNMJXhBQBkT7zN+ifJjIPUR/oOwEs7hJZZwne++IHgrmEy/QHrx8hU3ApNUqP6HA
         chjcG+oXl+Z+6Hda9idR642NPmX6Yg8FWLST2SUnXUuIs3eZXPsIWJllKiJ6YYdDse1o
         895xK7+hh1cdrL0phRlbs6IAALA7BcZtHDvY3ezim1tsKy6Ne0wz9d2w5nL8PDtxVZ6A
         LhTw==
X-Forwarded-Encrypted: i=1; AJvYcCWqnl845d3UEpKPf1meUzrBIFJY5MI4vfQ3nBKjUX7GLCQPQ4Iuy44SOuaHwc9U8+f7Buhik2zsJh8OMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwB7NyyLOPckl4uaosKhenFnRgo2xgYpkvt6Ap6Ftr4ZwUch/W
	tx+bFQ+x+3e0w+RlKlavW9o+Bw+O/R0K4tNKtYZvCKpoU5ZRXJB2T+u/pii/jze49YESoNaP360
	TIYXd4RU=
X-Gm-Gg: AY/fxX64FrcS7iQKMvapMnXctWclkW45YKFpowIBhY+fF0dKZA9kSp15Uz+s2DoUp/0
	56XuoMx1IWHY7STZMeH1N1rZ30mrhiD05pz4vbEsSQ9h9lg9PmDLxJjsXbVT1lPaPL4wLUOHcyG
	mBHhsJe+p4ITIeyTJ2tPOiRMVzE8AzIO/zCiV3PxONCbxo6ZqLRwKg+Fxr18cfDnW1ULxWV+kKo
	oZoy5yWXvUYcxqdaxjDfheSxJYdFVnrCy6PgKQdZnftPwmRwl3xrnkzCbi/tDIVUGUCwFvb7O+y
	Vb5/8C2WWBfWJ1EHIxDB17ulhyfbidIUWBPdF+IAbqI8Yrb7vLSuEuo7MT2TiN1TnlXs0oUdVvG
	YCNTsqHLSvoBdzlpclQ4WP02CaEsCZdCJ7ZEKYaQ8/z5Ii08X/N+IZLO337E5x8vg2whiOjRTai
	HkBYBUrssTK3acKz7HYgOelblW3dNgtYv+PPymt3byhAtO1/LO5CmzV6cQSWcbLKOg
X-Google-Smtp-Source: AGHT+IG+cBf2hA0EYoyz1561smg916z9JZcPywz3ZjWA0KaifpQXg54JPVldJWWAs8yWfDRiVgymWw==
X-Received: by 2002:a17:906:d54c:b0:b79:ea1b:f13d with SMTP id a640c23a62f3a-b8444c59a0bmr1184074466b.2.1767970947548;
        Fri, 09 Jan 2026 07:02:27 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:02:06 +0100
Subject: [PATCH 2/2] ASoC: codecs: aw88261: Add devicetree support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-aw88261-dt-v1-2-45840c7632a3@fairphone.com>
References: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
In-Reply-To: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=932;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XltF23iU+jXeuJxhhps/NSwXwMI+UkoiIo8Coo6WoMo=;
 b=WBreLQ7JD/q3X5WW8rScbuygxh3SSuRq/NmB+HrnSOGBNJH7w0KRgIVznecs638h8NThVewcN
 BrqQwxs3f6dAJ0sePKTIqEsu+b4Anwf9NiScFKuL0a+DxM41b98/X4K
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible "awinic,aw88261" so that module autoloading will work
based on the compatible from devicetree.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index ceea0c8c60b1..810c90f5e783 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1269,9 +1269,16 @@ static const struct i2c_device_id aw88261_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
 
+static const struct of_device_id aw88261_of_table[] = {
+	{ .compatible = "awinic,aw88261" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw88261_of_table);
+
 static struct i2c_driver aw88261_i2c_driver = {
 	.driver = {
 		.name = "aw88261",
+		.of_match_table = aw88261_of_table,
 	},
 	.probe = aw88261_i2c_probe,
 	.id_table = aw88261_i2c_id,

-- 
2.52.0

