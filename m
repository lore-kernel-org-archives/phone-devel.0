Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696958;
	b=s4Y3hvHTgavm8oE92pj+7hfFgSkPFrvljoI3yhVihpaVSxWUFCsgq5LGDAnIXzc6IFcb
	 eYU4ULiXE9v/5yl9CdAzL4tBI1JwnNsChDezTJdRSSYvFP8hbbzU8SyBTRTfW5G0/TeIm
	 yUAsrG13y8fcpM5UcGRIASeUAIdzxHwu4AgOHf6ypbvuk0YWvIwshnHVR59WoADaexyvY
	 8HZa5xaUoxbA0vZ57k/4Gm0DtsdZokxgu1An6p6+dytf1jfRVOsgHaduP9J6UebTPaIg8
	 F9lq+9ZtCuZ05GMSkV1SYB2eB8CZnFYODZFYBE7R3+P6qNIQ6vZctADenW9PU0t9xAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696958;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=O/GD0QgnnZwMvdktT7NT9OGWuvPKrj5mWOce8WRE98A=;
	b=Z1h0oysy9oove5ACsL8TT6gFbroMbtJPfz6EcqlCpb653um1vZqqKgNZOwGYgo1ASyoW
	 rFbXW5ZFN6XTkUadUNci6hJ1DBjugOUzFupA0aqRGKzBRFBL2WgTeELv9nRfky9C6snh/
	 Tcltb4JvCEm/NnzhGrXN0bxrIGpqkopiDK8jW/9BryXwyX2oCaHMYVMM4jvKzIZOqYFaH
	 Em8HNsxDJbX/HMq/6r0G3PwtysZYygf0sxm17GfjwsJtMl/Bh3amzKTAtau2/7iC5Tdlr
	 k1sR4AJW13lesPB+BS+U4qJXgMlzjvzpwoCkXOWw8R30Hx8hn0MQnaI6GaXMxux8Ybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KqjtwfQP;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA06606A33E
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 22:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA06606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KqjtwfQP
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uf3ZtzEWO+m9+O53q0wwm3lcvSxqUa9UE4kohOpFHzM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696955; v=1; x=1795301755;
 b=KqjtwfQPmfmOUStAfngYV44ctCJA5wfY9aaoEqfheEoccSBTlrpsSFmt2Y9qY09OmJi/Mj9e
 Av3M6JWOKKt1QZItRjN+6PWTt378L7FEQXGnwXhsi31kvKsCJbzBaMZ6sp1LD1aD60Or8FBiVbP
 DcO422xXTa2kxY/T1O+/la5U1bgR75iXooPQT0OZr13BXMQjy45FwmkW+ZG56bdzWcAe/ZP2+a1
 W+2gUGksDokOKD3cD1DiM6uJGhgQsz52hHXWXLYhVBpbFT/jeRrnneKCjzFvhYb7h4Aelfh0NAH
 2KX5sY1Lr24dj/0eFQrARZsepDyMMe7s4oreKxkfDsgNg==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f484dd51aafbe032;
	Sat, 14 Nov 2026 22:55:55 +0000
X-Mizu-Trace-ID: f484dd51aafbe032
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:16 -0700
Subject: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=1264;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=uf3ZtzEWO+m9+O53q0wwm3lcvSxqUa9UE4kohOpFHzM=;
 b=hkM0bnEFmFYAinsmqbfdtCuL8zEg/ANwt0Wrz9gBhDZO5qQDrd/A5ryH6QcJ76RdbXWnh1DpS
 zgFVm+81m5mC/hb4sBUw2ijLHpiSiSTpmIjorLSFRRru0mGO/IlrH/O
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Declare the int within the for-loop declaration rather than as a
separate local variable. To make the code more readable.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 2937a0f92d92..7fe7e9dae903 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -72,7 +72,7 @@ struct aw2013 {
 
 static int aw2013_chip_init(struct aw2013 *chip)
 {
-	int i, ret;
+	int ret;
 
 	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
 	if (ret) {
@@ -81,7 +81,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
 		return ret;
 	}
 
-	for (i = 0; i < chip->num_leds; i++) {
+	for (int i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
 					 AW2013_LCFG(chip->leds[i].num),
 					 AW2013_LCFG_IMAX_MASK,
@@ -142,9 +142,7 @@ static int aw2013_chip_enable(struct aw2013 *chip)
 
 static bool aw2013_chip_in_use(struct aw2013 *chip)
 {
-	int i;
-
-	for (i = 0; i < chip->num_leds; i++)
+	for (int i = 0; i < chip->num_leds; i++)
 		if (chip->leds[i].cdev.brightness)
 			return true;
 

-- 
2.56.1

