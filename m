Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C343B0ADF;
	Fri, 29 May 2026 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085211; cv=none; b=a8OCbthN7UV3sAuQBBJgOy9lu4gAJHK/lEzg69o88hEUsUgYj9H5m6dFrFZQuecS+O9pemq4r4kzbkOMn6pK1c5haNSBkvxY9mZXXAoItDY5IMhOo0Vk4mXJsEIx7og2tCKR7ae5WixaYGa977adxAOQ5rc7Jew/Gi7KIiAwuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085211; c=relaxed/simple;
	bh=6x8xXuv1evYS6XT5SX8Tyi6gv4zbEt8aJT9TaH0L4D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwjViWidN2z8+vvTIp6V1lM3cFzahn2jfyeyCUPrBaIxK0HMPCzoHSAW0gj/LtgmIVAfms8ejaMS9I26OfzXEJWvwBa2Ljsyq2LBrDjiSZT6MHswFyQO3Llu0Hw5QRFJCCgIT/XsxdS0bDKlmmpRc9Rj1fMOCEBDWX96JTSnV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=bxglS0GY; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="bxglS0GY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmzgXK8uuDWGV4taVAIslo8kTJttKrvZeQsvEafDlrk=;
	b=bxglS0GYqEkzO7zdR2dPVPMd1KGR23qTRWKbCJjXrU6RJvTykREZiNdfLGUNAtQkaywSfr
	md0AacrCW4bFj6T+wZQ7oGerdIO4vsXtDbyH4MtHk7PPKkIZUkvDq4ZiM2M23kwSsaYQJU
	hKW8c8SM89dcsfeDALvVkq4ijlyoedFSS4kUz+slvv2BKM24JKeuQ3MyOB8tPPUvOf9iws
	M3syb17faiF3I2QHlC9fGSXLWwQZB6XKOM8p3siYCAuBsM+Lz7VLQ2qKEEUWx92jgj4ZU+
	pvdnlR7Kf+NPHlOWGnrCiG3AQGBAj614PDpPKpSdGPyr6EFrb7CKwjWqmU00Lg==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>
Cc: Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] ASoC: codecs: aw88261: fix incorrect masks for boost regs
Date: Fri, 29 May 2026 17:05:13 -0300
Message-ID: <20260529200550.529719-7-val@packett.cool>
In-Reply-To: <20260529200550.529719-1-val@packett.cool>
References: <20260529200550.529719-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The boost-related register fields used in aw88261_reg_force_set use the
exact same definitions as the rest of the fields, where the mask must be
inverted when passing it to regmap_update_bits, but they weren't
inverted here.

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index fca62dcfe15e..01e93bc018b9 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -245,22 +245,22 @@ static void aw88261_reg_force_set(struct aw88261 *aw88261)
 	if (aw88261->frcset_en == AW88261_FRCSET_ENABLE) {
 		/* set FORCE_PWM */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL3_REG,
-				AW88261_FORCE_PWM_MASK, AW88261_FORCE_PWM_FORCEMINUS_PWM_VALUE);
+				~AW88261_FORCE_PWM_MASK, AW88261_FORCE_PWM_FORCEMINUS_PWM_VALUE);
 		/* set BOOST_OS_WIDTH */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL5_REG,
-				AW88261_BST_OS_WIDTH_MASK, AW88261_BST_OS_WIDTH_50NS_VALUE);
+				~AW88261_BST_OS_WIDTH_MASK, AW88261_BST_OS_WIDTH_50NS_VALUE);
 		/* set BURST_LOOPR */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL6_REG,
-				AW88261_BST_LOOPR_MASK, AW88261_BST_LOOPR_340K_VALUE);
+				~AW88261_BST_LOOPR_MASK, AW88261_BST_LOOPR_340K_VALUE);
 		/* set RSQN_DLY */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL7_REG,
-				AW88261_RSQN_DLY_MASK, AW88261_RSQN_DLY_35NS_VALUE);
+				~AW88261_RSQN_DLY_MASK, AW88261_RSQN_DLY_35NS_VALUE);
 		/* set BURST_SSMODE */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL8_REG,
-				AW88261_BURST_SSMODE_MASK, AW88261_BURST_SSMODE_FAST_VALUE);
+				~AW88261_BURST_SSMODE_MASK, AW88261_BURST_SSMODE_FAST_VALUE);
 		/* set BST_BURST */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL9_REG,
-				AW88261_BST_BURST_MASK, AW88261_BST_BURST_30MA_VALUE);
+				~AW88261_BST_BURST_MASK, AW88261_BST_BURST_30MA_VALUE);
 	} else {
 		dev_dbg(aw88261->aw_pa->dev, "needn't set reg value");
 	}
-- 
2.53.0

