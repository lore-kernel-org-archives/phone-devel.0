Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263123A5E8F
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880057; cv=none; b=rZcpkBxUY+fTR+h9ssTnpX8a4IOqhApllnd5uUTTJbevKpTpRjWDYlRa41PRXsOMuA8fxYxN61pG038VUdATIBRjUCMcpOIrTtGdLNTwGiH/tH5MoWPH6eNl8MEu9YOBdnUVv9S9r2RjJbg2uqj0qBi40PR1pcSWIwQTVdHoEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880057; c=relaxed/simple;
	bh=FiC7O5/AVkL96VfIo4Hpz6jiKHXlbB2eY8xHqyBt1Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N4ddZGQCKlx9o8JhZEY+IFcwkCH7jp0oZlpOO4YE/GCZxd2fLeWrmiBnQwaR1XMBpcAcS6xpqD5+vjJCIj13s3hrl9XuG3zdA1JMSetA5B0p4KlMYElJSGY/w66iZYjw5sC51+oR0PScURRXRIVhzjsPkMSEqNAc+8xxNnvVXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=U/kN6Lb0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="U/kN6Lb0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso8070075a12.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774880054; x=1775484854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLsE7gM2vKbSSueU2p48NhyKKDUQ0KqPPU3/kuQJal0=;
        b=U/kN6Lb0mQ7eDdLDdl+185b6ipWKQ+3fzZzqetaB+DEmxaUgipsQkcOOuwiQQmpVvw
         TmMbzhonK7gf5376cBfbAVoZi2bmf3JlB6Gfuu2hShEMIhEeBqybzGlirq13YbaasJGK
         7+px3YV6J2W0ZGRiCSqmCdBpPJDRTgJO54sMqw5frT6GNNQEb8gMfHrX6OTsaS0BxmpE
         7kwVuU7cpqKwnFNm8qI7aMOvTK9+bwDY6jVu9zrfXQnyv20fWPH8IYz/80o1YgoM3GwN
         LFdzRWUPFGD7iehxyXhLGQQIZEEp1kzKYu62ou2xmvbF9Gf/ACq2IX5eyZ4y0rD5Ml4F
         WFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880054; x=1775484854;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLsE7gM2vKbSSueU2p48NhyKKDUQ0KqPPU3/kuQJal0=;
        b=rvaVqfq4JfepU/CHEr+lgqaq7XIN1HZXF8r+KcahGc3HEDJl4OP9Mn5bdYyn9bzBgC
         hy7heodqcclqYBbwBCsORsYJmAi+ynDBQjQTJW+wgvmL1QgnW4vPjOk4Wyp60hHYFDRI
         7gewqrp+TaWyrTXFJowJ0+IhRYnTU/G2JyrmzsmO794hFpTX9v48Q6fNobYUfn52kSlw
         YfizJ822k7rK5Fe66HZYqlAvUXCQm7CoBU9AJ3etfz06ZlmO21l4H3CFA4R7wIZ8pcdT
         lfmgJKDW2Y8JVRMVHAhQEeTMGD11xCMeQ9yBTFtEPQxikSniXQVsPhN+DulmFmZlQUQi
         ZIew==
X-Forwarded-Encrypted: i=1; AJvYcCUKimxaONGqopSWnqYdOGbFqDI3NXZZjDfVTIMok/EcJeyw34meLaAxP9s5d31Om5saxbKwy4zIAuMGvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyll1HiKAQRMfK+VwNBAPLgAd6tJWNfgqVb1x2nONe2iQLAgM1k
	JWD+MVPViMUwkwU7jtF2iip+tDGd3SWKiGuUNNJUjSgQ2+tXEx4/ualnbKKwOxg+dI0=
X-Gm-Gg: ATEYQzzdOguOCQ+Cj4ZaMyELiaTW9nNkt+HoCZwEdTTkh1MnefyDx+7P84St0ZUxs4S
	Rr76Vt53K0F5zFShURPJV9QtpGU0TpLbHY3MlZ8mkxnPOeIEhqYufkIJG0k7gfLF+ly0DytJq6u
	sLxHrBq3KHv0iH38q07sIvbIPOuAMFvOf0XCPRxpEsaizLQgSKTOnUv0hlHh59YM/SG7a0UucZb
	KQP2AluP0kRNsBu0Yiw7Kd7wD1F0Ri1bWRdwdZfJvt9GuvCknPBzQZ8OHOKTJZqCsjDSrs7S4PQ
	4n49at+etRslmWoOGRGzawuZ4t2GO17gPq5D9NuF9TiSezOS7bXVuofV8ARipleEABuY2VX2ZDk
	mTqHAePFkM1r3caqttwBUwW56N9B+grCBzVO4Z0ZZCTd/8Cvx2EyK1RJBeqcyVic1B8KbwbdYHN
	1tHUAKjBt7QNRgU0TvcenfSzRnuUV6foq4UwqQBKVO4nlPmAaMdMQt3kKLXWnbsKlDbiALeJ1N2
	6wW9w==
X-Received: by 2002:a05:6402:a0dc:b0:666:d675:e2ed with SMTP id 4fb4d7f45d1cf-66b28b5d0c3mr6233531a12.21.1774880054479;
        Mon, 30 Mar 2026 07:14:14 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7340cae2sm2812332a12.11.2026.03.30.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:14:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 30 Mar 2026 16:14:13 +0200
Subject: [PATCH] regulator: devres: Use enum regulator_get_type in internal
 functions
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-regulator-devres-type-v1-1-d2c244576845@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTvJtBgxXsW4wPKDNQbITCEYw
 t0tuPwW761k0AijW7GSYo4Whz7DnQoKr7rvwLHJJi/+ImUprOimT50G5Qazwjh9R7B31bmVa+U
 kgHI7Ktq4HN/742+bnm+EtM9o237/mmjceQAAAA==
X-Change-ID: 20260330-regulator-devres-type-2174f08710ce
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774880053; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FiC7O5/AVkL96VfIo4Hpz6jiKHXlbB2eY8xHqyBt1Vw=;
 b=Hv1UpAXeLAn9vhYVbD6VL7zgF5g+eAAjv2ki/kufhpDrheNaUm7syeFsbOhi6fmM7YSiJRrA+
 hYr6H7r3K/oBkNHCkjduj2atnezAN6PwkRBOwdo6gpa4+N/qEnjS72P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The enum regulator_get_type has been available since 2017, so use that
enum instead of an "untyped" int in the three functions where "get_type"
is used.

No functional change intended.

Suggested-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/devres.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 2cf03042fddf..615deba5d22c 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -20,7 +20,7 @@ static void devm_regulator_release(struct device *dev, void *res)
 }
 
 static struct regulator *_devm_regulator_get(struct device *dev, const char *id,
-					     int get_type)
+					     enum regulator_get_type get_type)
 {
 	struct regulator **ptr, *regulator;
 
@@ -78,7 +78,7 @@ static void regulator_action_disable(void *d)
 }
 
 static int _devm_regulator_get_enable(struct device *dev, const char *id,
-				      int get_type)
+				      enum regulator_get_type get_type)
 {
 	struct regulator *r;
 	int ret;
@@ -751,7 +751,7 @@ EXPORT_SYMBOL_GPL(devm_regulator_irq_helper);
 
 #if IS_ENABLED(CONFIG_OF)
 static struct regulator *_devm_of_regulator_get(struct device *dev, struct device_node *node,
-						const char *id, int get_type)
+						const char *id, enum regulator_get_type get_type)
 {
 	struct regulator **ptr, *regulator;
 

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260330-regulator-devres-type-2174f08710ce

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

