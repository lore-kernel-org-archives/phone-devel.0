Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC43876CC
	for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721032; cv=none; b=I7AhH0fC/zBGIn1tz2bbqYBy10bN3tTwYACHotMIPrcbcuLAecf3uLkbs55sSEeZvvhg+3yUsVs85YWBBoN6AODgUYmJTRaLEUute/cn47LW5s7i7esIsN/2xapnjwJNrl+osaTuW5VAjrI+ERsCtYLB3GMdQJ4/fM49Rqhtyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721032; c=relaxed/simple;
	bh=Yf0WPJgEw63hC4Ftd+tg8HDiNA4NmQPEsc/monuPMwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRsmX1pPk59kxt4Q4q305FHxwIW/BdGvvIthkp8EgFUyKKr7xQWipWxLOWsQgqK3c4Da7ZmafLDA9Z1GmZtGkzuIEmdKWxFvZWrzF3lfaxp04cnFRYd1lISKF43I/x6qcFemtdha9cGJSdt1+KcSV0Fyb6HNBGKk2HrHZ37qlmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=hwgH6S5t; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="hwgH6S5t"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776721028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDQnhd1Mjgk59m3jRZy2qUsquCCaUodGYFITXbEmC+w=;
	b=hwgH6S5tjmcIagQuDVgIeDmjCxuZ/AWKS9LqRE5D73g/NXrFormvU8OjfFL8JgwHcRrm53
	ka9vdy6vaZ+pgCdYsxWlOB97aEcfFDkBY79Dq1uXKoVQCPenTzIOXjoPWdjze8gn6XURn1
	6XYyQxgJPjpbCWLU20joeFvgcWDOhEcU1n6kb1Xpbgz4uWbLwJOTxffZf9XNaTPWJL2sRc
	BeM24N0MyTxHrgcE9lMPhxGyzWSeZpLzmrbeoblUbOTE/vtK2tDNonF14iYJUW8mCtgOsd
	qaTC+tmK4ejwgU7tyfWI7wE8lxxNkauURtmSKlAEqOIrwrCZGiiRPU8lx4ywJA==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: aw88261: use correct registers for AW88258
Date: Mon, 20 Apr 2026 16:40:00 -0300
Message-ID: <20260420213250.215465-4-val@packett.cool>
In-Reply-To: <20260420213250.215465-2-val@packett.cool>
References: <20260420213250.215465-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The AW88258 has a slightly different register map, namely the PLL ones
are different and some extra boost ones are absent. Before the recent
hw_params fix, the PLL CCO_MUX accesses were actually always wrong as
the PLLCTRL1 address (0x54) was from the AW88261 but the CCO_MUX offset
(14) was from the AW88258. With said fix the AW88261 parameters were
always used, making it work on that chip. Make the accesses correct
for the AW88258 as well.

Signed-off-by: Val Packett <val@packett.cool>
---
This one is not tested (don't have the hardware), but since I've noticed
that the CCO_MUX was not even correct for any of the supported chips,
I've decided to try fixing it for the other one as well.

Code style wise this is kind of a really annoying situation but hopefully
this looks okay enough

~val
---
 sound/soc/codecs/aw88258.h | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/aw88261.c | 37 ++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 11 deletions(-)
 create mode 100644 sound/soc/codecs/aw88258.h

diff --git a/sound/soc/codecs/aw88258.h b/sound/soc/codecs/aw88258.h
new file mode 100644
index 000000000000..7ae177667ae6
--- /dev/null
+++ b/sound/soc/codecs/aw88258.h
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// aw88258.h  --  AW88258 ALSA SoC Audio driver
+//
+// Copyright (c) 2023 awinic Technology CO., LTD
+//
+// Author: Jimmy Zhang <zhangjianming@awinic.com>
+// Author: Weidong Wang <wangweidong.a@awinic.com>
+//
+
+#ifndef __AW88258_H__
+#define __AW88258_H__
+
+/* This file contains definitions for registers that differ between
+ * the AW88261 (ID 0x2113) and the AW88258 (ID 0x1852). */
+
+#define AW88258_PLLCTRL1_REG		(0x66)
+#define AW88258_PLLCTRL2_REG		(0x67)
+#define AW88258_PLLCTRL3_REG		(0x68)
+
+#define AW88258_CCO_MUX_START_BIT	(14)
+#define AW88258_CCO_MUX_BITS_LEN	(1)
+#define AW88258_CCO_MUX_MASK		\
+	(~(((1<<AW88258_CCO_MUX_BITS_LEN)-1) << AW88258_CCO_MUX_START_BIT))
+
+#define AW88258_CCO_MUX_DIVIDED	(0)
+#define AW88258_CCO_MUX_DIVIDED_VALUE	\
+	(AW88258_CCO_MUX_DIVIDED << AW88258_CCO_MUX_START_BIT)
+
+#define AW88258_CCO_MUX_BYPASS		(1)
+#define AW88258_CCO_MUX_BYPASS_VALUE	\
+	(AW88258_CCO_MUX_BYPASS << AW88258_CCO_MUX_START_BIT)
+
+#endif
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 3c7d3e3865eb..172f38a4921c 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
+#include "aw88258.h"
 #include "aw88261.h"
 #include "aw88395/aw88395_data_type.h"
 #include "aw88395/aw88395_device.h"
@@ -179,37 +180,36 @@ static int aw88261_dev_check_pll(struct aw_device *aw_dev)
 static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
-	uint32_t sr_value, fs_value, cco_mux_value, bck_value;
+	uint32_t sr_value, fs_value, bck_value;
+	bool bypass_divider = false;
 	int ret;
 
 	switch (aw88261->sample_rate) {
 	case 8000:
 		sr_value = AW88261_I2SSR_8KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
 		break;
 	case 16000:
 		sr_value = AW88261_I2SSR_16KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
 		break;
 	case 32000:
 		sr_value = AW88261_I2SSR_32KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		bypass_divider = true;
 		break;
 	case 44100:
 		sr_value = AW88261_I2SSR_44P1KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		bypass_divider = true;
 		break;
 	case 48000:
 		sr_value = AW88261_I2SSR_48KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		bypass_divider = true;
 		break;
 	case 96000:
 		sr_value = AW88261_I2SSR_96KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		bypass_divider = true;
 		break;
 	case 192000:
 		sr_value = AW88261_I2SSR_192KHZ_VALUE;
-		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		bypass_divider = true;
 		break;
 	default:
 		dev_err(aw_dev->dev, "unsupported sample rate %d\n",
@@ -241,8 +241,21 @@ static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 	}
 
 	/* PLL divider must be used for 8/16/32 kHz modes */
-	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
-			~AW88261_CCO_MUX_MASK, cco_mux_value);
+	switch (aw_dev->chip_id) {
+	case AW88261_CHIP_ID:
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
+				~AW88261_CCO_MUX_MASK, bypass_divider ?
+				AW88261_CCO_MUX_BYPASS_VALUE : AW88261_CCO_MUX_DIVIDED);
+		break;
+	case AW88258_CHIP_ID:
+		ret = regmap_update_bits(aw_dev->regmap, AW88258_PLLCTRL1_REG,
+				~AW88258_CCO_MUX_MASK, bypass_divider ?
+				AW88258_CCO_MUX_BYPASS_VALUE : AW88258_CCO_MUX_DIVIDED);
+		break;
+	default:
+		WARN_ONCE(1, "missing PLL regs for chip %x", aw_dev->chip_id);
+		return -ENXIO;
+	}
 	if (ret)
 		return ret;
 
@@ -306,7 +319,9 @@ static void aw88261_dev_uls_hmute(struct aw_device *aw_dev, bool uls_hmute)
 
 static void aw88261_reg_force_set(struct aw88261 *aw88261)
 {
-	if (aw88261->frcset_en == AW88261_FRCSET_ENABLE) {
+	if (aw88261->aw_pa->chip_id == AW88258_CHIP_ID) {
+		dev_dbg(aw88261->aw_pa->dev, "force_set not supported on aw88258");
+	} else if (aw88261->frcset_en == AW88261_FRCSET_ENABLE) {
 		/* set FORCE_PWM */
 		regmap_update_bits(aw88261->regmap, AW88261_BSTCTRL3_REG,
 				AW88261_FORCE_PWM_MASK, AW88261_FORCE_PWM_FORCEMINUS_PWM_VALUE);
-- 
2.53.0

