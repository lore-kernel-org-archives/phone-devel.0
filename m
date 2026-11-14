Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696953;
	b=puohAb4ke5gvJdwB62KdYKOouOGj21N0bvkc+rorV+r1T+FjuPXJD3c5aFu4Hqnjg409
	 d7bKKMpnls2TRLWz1JPsAHl8VQrBRNp6fta3YqCiKhYiGSN7+mQz6CRmLa8wAZSh+StlS
	 HlmQqXMQfSeSDkre5ySkg/OahLGjGNWXj8xtJ7HiKNmPno8Bw1oZs7phfxWsy5S8ttb7M
	 TvmJ8JXQtbfl7dswdU/1+hC8gDB3aaRwPlhiK+6kdZ63cOfRh8Q05L2i409PpOKWDfUIl
	 TLPnKae3bO13GHLopAm/GJFOaL61SlsWXRZiqSNh1bx+Ir647egQXCRTkftg+Ryc6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PZ4OY3F7/lNYHpVPmua8ltLs6uqJvsbkMDZZeVa3tUI=;
	b=axyaRsDhiLX4TJg3O36NrhN5+exvCi42E75YRitI1rh6+EXcb5K9LQpSQGmo4mIkG/pg
	 5E2w1Y8gEXzQJjzMjwuVrTo0EdK9I922oIqorlMLhGV2IHJdPGnn4GMOrKsN6TNHc7Bw7
	 ho2J+RoWkQhLd+OfGEhgdy/vfcDcVGcKJZ1Jh13NsVeDV5AnzOXNVQJMqgtrK/Wd5sJtW
	 blbYrezF3vN6QBXVLAMAAOmBl5VIMPN9TQZWFDB87f0/MJ3RRBwggn3wRkIfc/JdvE0Ou
	 EwDF7M5IB0O9g9A1rU4twwTjyrzfI32v+CV2dO5Im3dNr4AW3a4uPfcCSJiHgg7EMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=NL5V3myd;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0257606A885
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 22:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0257606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=NL5V3myd
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gjolFnTBTplhe6l7YtIHJPJERkKRyJ91biRoDk1wj44=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696950; v=1; x=1795301750;
 b=NL5V3mydRqoo6Ck/wRo4NdOwd4yv+PFpV8tVqMqslFbfcuxa0Ro57BqgErW8URkw5RXRQTyO
 rraA4S5c3+36K1mIReLS3hwyHlzGvvuEFsOed7w/6Vw5DJ5dqNX7wGjXXyIRfc9mLR2MIYLqabV
 P/waywQRLVXxKwUNDCTfq6j9BUF+/+bjvzPl6h1meBneLCWCIGMUeBvdOJJeCGUx76LiqkMjAwn
 aT31A6dCuunjVH7za4q9vIgkQtdRTFYYhvA6vuWDrTQ2c+WrQKm+RBH6JljzYNYgosBSy8lXdSX
 T7PB4+jQri4hvrSw0QlspZtHKLKk1MWzPwxcR4uTzfYHw==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b081fa88f6f0a39c;
	Sat, 14 Nov 2026 22:55:50 +0000
X-Mizu-Trace-ID: b081fa88f6f0a39c
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:15 -0700
Subject: [PATCH v7 2/4] leds: aw2013: Use dev_err_probe
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
Message-Id: <20261114-aw2013-aw20xx-rename-v7-2-ea5a3113a479@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=2927;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=gjolFnTBTplhe6l7YtIHJPJERkKRyJ91biRoDk1wj44=;
 b=fRY/aemtxp+Hai7Jr2ONwXr/Xas5kvflmUMkOSlRD5WB4kfXuG9hvv7QaVjtMoAUGgHtAk9Ub
 67JJpgJidUsDvPxXcnZhGNRePDOwSl88NHoaQBYiPZiLthXOA0uf+X0
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Failure to use dev_err_probe() for regulator requests violates
LED subsystem guidelines. (At least according to sashiko [1])

The original driver didn't use it, but it's worth cleaning up
while I'm here.

[1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L71

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Reviewed-by: David Heidelberg <david@ixit.cz>

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index cf20e94920fd..2937a0f92d92 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -361,9 +361,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -373,45 +372,44 @@ static int aw2013_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to read chip ID\n");
 		goto error_reg;
 	}
 
 	if (chipid != AW2013_RSTR_CHIP_ID) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
-		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, -ENODEV,
+				    "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
 	ret = regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
 	if (ret) {
-		dev_err(&client->dev, "Failed to reset chip: %d\n", ret);
+		dev_err_probe(&client->dev, ret, "Failed to reset chip\n");
 		goto error_reg;
 	}
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to disable regulators\n");
 		goto error;
 	}
 

-- 
2.56.1

