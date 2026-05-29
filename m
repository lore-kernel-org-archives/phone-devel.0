Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04B3F88BE;
	Fri, 29 May 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085194; cv=none; b=l1C5WJ3VckH90AbQJgLJMnwDza37+BnOAMrI39x5m8XoGhCa7O6RdVnJzoihBmrQIR6USPFjteDJNH9kG8gUs/FXHcWSHKoeY6LWKorhVBAmIWvDbzQWsSxg+at/Zvt/BsGnW++a2FnGzASbRUxtOtWlTz/jFREOtDn3nBf9Eks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085194; c=relaxed/simple;
	bh=wl4gtEG1KVXz9wv4uwkPybc5g3m1xGVvSEBtBFKC1uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6u+mlv7G1pOdWPzlei0s4FfEB6AogCPeBcp88EX4fOUPMcDyEeaQkiZtaKYAVOwkkCDc+sfzR/NjSy7XJpYJ2TNlhBRjlIwtrDqMiO/mE25lnuu/HSk3EHvOWj2gpNl7DrSy09zz8vKjSlBWgaLkBdAky+ZgGd3mtFF0GrsSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=uNwVFk1m; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="uNwVFk1m"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwvWEhvGxKfMUTHv546WllZJX3cjFvFN76S5sIanXbA=;
	b=uNwVFk1m5fB6yb1CZd+IhPEz6V3LOTTnGJb0h1xSLXyk1df32ZYVyXJ0YwZr0oivC92HQL
	A8f1uTXFg8ZxfbO3ihTGOvRMAL9Kb53xK7SZREiiEJ+pQBRwKLy1h/Kn+GS0g9fZUXc89Q
	DbV1FuUbv08DOeydLH6NSrxDB3qfRSWlc4zk7mMW8VumwxVeM7GwL4wEdEOwzF0HuPjLKS
	E/hopjqOOlQG0ncVQugpovxtC3Nx1pCOfTNTB9iTiALtZ7ko8/pYpwXVP3rgKPa6he4ABw
	s04V+96DnLxVMDCnKJY5DqW6W48YUJsXtvUe1Ik1sdBKkNH+WHCDGI8B9yKPcw==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] ASoC: codecs: aw88261: add TDM support
Date: Fri, 29 May 2026 17:05:09 -0300
Message-ID: <20260529200550.529719-3-val@packett.cool>
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

This amp supports TDM mode, so implement the set_tdm_slot operation to
let the SoC driver configure the TDM slot number, width, and masks.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 115 ++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/aw88261.h |  56 ++++++++++++++++++
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 6d4b911be298..d6a6173d8af4 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -10,6 +10,7 @@
 
 #include <linux/i2c.h>
 #include <linux/firmware.h>
+#include <linux/bitops.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -181,6 +182,30 @@ static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 	struct aw_device *aw_dev = aw88261->aw_pa;
 	int ret;
 
+	/* Configure TDM slots (I2S is represented as no slots) */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL2_REG,
+			~AW88261_SLOT_NUM_MASK, aw88261->slot_num_value);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL2_REG,
+			~AW88261_I2S_TX_SLOTVLD_MASK,
+			aw88261->tx_slotvld_mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL2_REG,
+			~AW88261_I2S_RXL_SLOTVLD_MASK,
+			aw88261->rxl_slotvld_mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL2_REG,
+			~AW88261_I2S_RXR_SLOTVLD_MASK,
+			aw88261->rxr_slotvld_mask);
+	if (ret)
+		return ret;
+
 	/* PLL divider must be used for 8/16/32 kHz modes */
 	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
 			~AW88261_CCO_MUX_MASK, aw88261->cco_mux_value);
@@ -195,7 +220,9 @@ static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 
 	/* The bit clock (BCK) defines the length of a frame */
 	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
-			~AW88261_I2SBCK_MASK, aw88261->bck_value);
+			~AW88261_I2SBCK_MASK,
+			(aw88261->tdm_bck_value != AW88261_TDM_BCK_UNSET)
+			? aw88261->tdm_bck_value : aw88261->bck_value);
 	if (ret)
 		return ret;
 
@@ -710,9 +737,11 @@ static int aw88261_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
 		aw88261->md_value = AW88261_I2SMD_PHILIPS_STANDARD_VALUE;
 		break;
 	case SND_SOC_DAIFMT_MSB:
+	case SND_SOC_DAIFMT_DSP_B:
 		aw88261->md_value = AW88261_I2SMD_MSB_JUSTIFIED_VALUE;
 		break;
 	case SND_SOC_DAIFMT_LSB:
@@ -819,9 +848,90 @@ static int aw88261_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
+	int chan;
+
+	switch (slots) {
+	case 0:
+		/* Just reset everything TDM related to I2S values */
+		aw88261->slot_num_value = AW88261_SLOT_NUM_I2S_MODE_VALUE;
+		aw88261->tdm_bck_value = AW88261_TDM_BCK_UNSET;
+		aw88261->tx_slotvld_mask = 0 << AW88261_I2S_TX_SLOTVLD_START_BIT;
+		aw88261->rxl_slotvld_mask = 0 << AW88261_I2S_RXL_SLOTVLD_START_BIT;
+		aw88261->rxr_slotvld_mask = 1 << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+		return 0;
+	case 1:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM1S_VALUE;
+		break;
+	case 2:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM2S_VALUE;
+		break;
+	case 4:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM4S_VALUE;
+		break;
+	case 6:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM6S_VALUE;
+		break;
+	case 8:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM8S_VALUE;
+		break;
+	case 16:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_TDM16S_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported slot count %d\n", slots);
+		return -EINVAL;
+	}
+
+	switch (slot_width) {
+	case 16:
+		aw88261->tdm_bck_value = AW88261_I2SBCK_32FS_VALUE;
+		break;
+	case 20:
+	case 24:
+		aw88261->tdm_bck_value = AW88261_I2SBCK_48FS_VALUE;
+		break;
+	case 32:
+		aw88261->tdm_bck_value = AW88261_I2SBCK_64FS_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported slot width %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	if (tx_mask != 0) {
+		if ((chan = __ffs(tx_mask)) > 16)
+			return -EINVAL;
+
+		aw88261->tx_slotvld_mask = chan << AW88261_I2S_TX_SLOTVLD_START_BIT;
+	}
+
+	if (rx_mask != 0) {
+		if ((chan = __ffs(rx_mask)) > 16)
+			return -EINVAL;
+
+		aw88261->rxl_slotvld_mask = chan << AW88261_I2S_RXL_SLOTVLD_START_BIT;
+	}
+
+	if ((rx_mask & ~BIT(chan)) != 0) {
+		if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
+			return -EINVAL;
+
+		aw88261->rxr_slotvld_mask = chan << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops aw88261_dai_ops = {
 	.set_fmt = aw88261_set_fmt,
 	.hw_params = aw88261_hw_params,
+	.set_tdm_slot = aw88261_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver aw88261_dai[] = {
@@ -1363,12 +1473,15 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	/* set defaults */
+	aw88261->slot_num_value = AW88261_SLOT_NUM_I2S_MODE_VALUE;
 	aw88261->sr_value = AW88261_I2SSR_48KHZ_VALUE;
 	aw88261->cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
 	aw88261->fs_value = AW88261_I2SFS_24_BITS_VALUE;
 	aw88261->bck_value = AW88261_I2SBCK_64FS_VALUE;
 	aw88261->bck_inv_value = AW88261_BCKINV_NOT_INVERT_VALUE;
+	aw88261->tdm_bck_value = AW88261_TDM_BCK_UNSET;
 	aw88261->md_value = AW88261_I2SMD_PHILIPS_STANDARD_VALUE;
+	aw88261->rxr_slotvld_mask = 1 << AW88261_I2S_RXR_SLOTVLD_START_BIT;
 
 	mutex_init(&aw88261->lock);
 
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 3d7483d625a9..d75f55cdca42 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -329,6 +329,8 @@
 #define AW88261_I2SBCK_64FS_VALUE	\
 	(AW88261_I2SBCK_64FS << AW88261_I2SBCK_START_BIT)
 
+#define AW88261_TDM_BCK_UNSET			UINT_MAX
+
 #define AW88261_I2SSR_START_BIT			(0)
 #define AW88261_I2SSR_BITS_LEN			(4)
 #define AW88261_I2SSR_MASK				\
@@ -368,6 +370,54 @@
 #define AW88261_I2SSR_192KHZ_VALUE		\
 	(AW88261_I2SSR_192KHZ << AW88261_I2SSR_START_BIT)
 
+#define AW88261_SLOT_NUM_START_BIT	(12)
+#define AW88261_SLOT_NUM_BITS_LEN	(3)
+#define AW88261_SLOT_NUM_MASK	\
+	(~(((1<<AW88261_SLOT_NUM_BITS_LEN)-1) << AW88261_SLOT_NUM_START_BIT))
+
+#define AW88261_SLOT_NUM_I2S_MODE	(0)
+#define AW88261_SLOT_NUM_I2S_MODE_VALUE	\
+	(AW88261_SLOT_NUM_I2S_MODE << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM1S	(1)
+#define AW88261_SLOT_NUM_TDM1S_VALUE	\
+	(AW88261_SLOT_NUM_TDM1S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM2S	(2)
+#define AW88261_SLOT_NUM_TDM2S_VALUE	\
+	(AW88261_SLOT_NUM_TDM2S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM4S	(3)
+#define AW88261_SLOT_NUM_TDM4S_VALUE	\
+	(AW88261_SLOT_NUM_TDM4S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM6S	(4)
+#define AW88261_SLOT_NUM_TDM6S_VALUE	\
+	(AW88261_SLOT_NUM_TDM6S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM8S	(5)
+#define AW88261_SLOT_NUM_TDM8S_VALUE	\
+	(AW88261_SLOT_NUM_TDM8S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_SLOT_NUM_TDM16S	(6)
+#define AW88261_SLOT_NUM_TDM16S_VALUE	\
+	(AW88261_SLOT_NUM_TDM16S << AW88261_SLOT_NUM_START_BIT)
+
+#define AW88261_I2S_TX_SLOTVLD_START_BIT	(8)
+#define AW88261_I2S_TX_SLOTVLD_BITS_LEN	(4)
+#define AW88261_I2S_TX_SLOTVLD_MASK	\
+	(~(((1<<AW88261_I2S_TX_SLOTVLD_BITS_LEN)-1) << AW88261_I2S_TX_SLOTVLD_START_BIT))
+
+#define AW88261_I2S_RXR_SLOTVLD_START_BIT	(4)
+#define AW88261_I2S_RXR_SLOTVLD_BITS_LEN	(4)
+#define AW88261_I2S_RXR_SLOTVLD_MASK	\
+	(~(((1<<AW88261_I2S_RXR_SLOTVLD_BITS_LEN)-1) << AW88261_I2S_RXR_SLOTVLD_START_BIT))
+
+#define AW88261_I2S_RXL_SLOTVLD_START_BIT	(0)
+#define AW88261_I2S_RXL_SLOTVLD_BITS_LEN	(4)
+#define AW88261_I2S_RXL_SLOTVLD_MASK	\
+	(~(((1<<AW88261_I2S_RXL_SLOTVLD_BITS_LEN)-1) << AW88261_I2S_RXL_SLOTVLD_START_BIT))
+
 #define AW88261_CCO_MUX_START_BIT	(6)
 #define AW88261_CCO_MUX_BITS_LEN	(1)
 #define AW88261_CCO_MUX_MASK		\
@@ -563,8 +613,14 @@ struct aw88261 {
 	unsigned int fs_value;
 	unsigned int bck_value;
 	unsigned int bck_inv_value;
+	unsigned int tdm_bck_value;
 	unsigned int md_value;
 
+	unsigned int slot_num_value;
+	unsigned int tx_slotvld_mask;
+	unsigned int rxl_slotvld_mask;
+	unsigned int rxr_slotvld_mask;
+
 	bool phase_sync;
 };
 
-- 
2.53.0

