Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3473A9D9F
	for <phone-devel@vger.kernel.org>; Mon, 18 May 2026 22:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142211; cv=none; b=Q4y5hkBLbPEjP2gexBZgKdVuTNgDFO0900pi5rg82ipG52J8lMtpS5/3kYAY+6UOjfYPpIwPaP80yZ9lFL6qeLfF8EQFZz9ai3OAgY54WutNCssxtYInlzktceewLORwzKx0t3l2HXQSR6YVI5i2wIqR32vOflmgpHAfdSI+bic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142211; c=relaxed/simple;
	bh=Hn2bJkM+wPBqb/3c+mJmhDMQaXMTitpPKGLZeUwp884=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPbsrERpdIRl6X6AIP1lWGRsGZ8ByNqvDV8isDlOvhChZ4wG8GkgaZAZwOrsU4MOHVZspInjyv9xucuUrSz+4qWZUm7bdrDO9ITzFxGQfERbiPyisR3tDaXVXkhAPKLiK+TwLMnrtwwXUf62V3E7vM8GvOvHPvBBeGIURQDKWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=XPKUI0wh; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="XPKUI0wh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cA+m07xuXA8ONwm95/Iao29FiNKsZwHD5SiIzqacaxw=;
	b=XPKUI0wh3i4+XWpltC981mbVF6N9cubBJ2EXaXNpwgBJ0ACIQJGKQ4qV1+JXDwq72mjc3F
	DKpRkXc1GOVAU2JJdop4Wdsgd+qZwjvEGM2+zwfpPxFUgsi0/LDtmo7v1s3nqAfx5QFVIL
	2o9YmFuoRpJNBbPEMR3KhsZca5g97UFUeB920HFr0GkfY7HkGvZVgo4jIYDbx/IWM4I1q6
	CsR+XCakugx/yXb8hJ0y7ezA4WcNdRp9jdKQbXYHLfB/VW6NPNZoYsT6WmKdw3kWO8V19W
	AJypAAPwFMcPt6vmuUSY/+Fg1tBD36Kro7+5rK6DlOOh8SWOly01yAC8Vx0NhA==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>
Cc: Val Packett <val@packett.cool>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] ASoC: codecs: aw88261: fix incorrect masks for boost regs
Date: Mon, 18 May 2026 18:44:35 -0300
Message-ID: <20260518220906.347958-7-val@packett.cool>
In-Reply-To: <20260518220906.347958-1-val@packett.cool>
References: <20260518220906.347958-1-val@packett.cool>
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
index e0644fb445e5..adc728e45f57 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -243,22 +243,22 @@ static void aw88261_reg_force_set(struct aw88261 *aw88261)
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

