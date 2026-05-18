Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8237AA74;
	Mon, 18 May 2026 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142196; cv=none; b=lyHS0nNGQaNglrVtqeTH2mmg/5NMksK8kbkjWFwUlhhEq+N3rKgWDDvhp5lgvl3YSx9LUl1m5oUonaybie8gEXOAX6ixIYqnNgqlevIqYBONgGTNCtao3vV/z3cWXP3sy0+tZ2gMxYjVMfCZeqkUJfWvwUvA4EWm6Z7JMv6emf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142196; c=relaxed/simple;
	bh=sNCgfx+dhN326YffZXqEHe8zh27tqbPObYhlgAzT5MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+TRTOe+xbS3xfo/w3x1B4CKdjWFcfKoCucY7nxVJlODvK7GQq/irt/gCThsyDd8tzPlxkJK9ZzsFNKryALwY12NZKQ9+xa1pXxoS/XVMOBpoM8+3lqZTfDSH72KDxHNf/DVjaZNecaBBDwuR4FcHp3j5IYfaR1IxBbnJZpoJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=INBtLlhv; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="INBtLlhv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeIhWRUdId3RlO6icWSNz/L/CL6oMAeYt9e4+Yiosw8=;
	b=INBtLlhvVr+GlvS8r1DSJ6RHrNnzz0xQmj9BNf8Obb8CUWsoV52Jbht82thFlNLRxiT2Rs
	EmK+zRtnRQx2DavLKx9rBNtlBRuqDT6XGlPMj6sWn8aVR3bBuG+TmKVQuo4+LYj8W0SeTW
	vfeY+6T/cnKFIfDWzPjUREaU6htDBMBiuH+x2t5CIBfpyFWFarMDttfG5dHIrW5SXdyrdJ
	UAtZfgU2HjTqgfSU972Tpjan8dC8WuCyvpLBtDX+75kqI9UL2IkDILV+RaC3xHYYUKY93L
	4xxllGC8zrxLFjZIV0+jxMvtwbyQHF6LbEHJoxMM8UdE3yhkLywpBee1zb5NXg==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: codecs: aw88261: add TDM support
Date: Mon, 18 May 2026 18:44:31 -0300
Message-ID: <20260518220906.347958-3-val@packett.cool>
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

This amp supports TDM mode, so implement the set_tdm_slot operation to
let the SoC driver configure the TDM slot number, width, and masks.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 88 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/aw88261.h | 53 +++++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 2064e72b51af..7b0e778f5a25 100644
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
@@ -710,9 +735,11 @@ static int aw88261_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
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
@@ -819,9 +846,68 @@ static int aw88261_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
+	int bit;
+
+	switch (slots) {
+	case 0:
+		aw88261->slot_num_value = AW88261_SLOT_NUM_I2S_MODE_VALUE;
+		break;
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
+	if (tx_mask != 0) {
+		if ((bit = __ffs(tx_mask)) > 15)
+			return -EINVAL;
+
+		aw88261->tx_slotvld_mask = bit << AW88261_I2S_TX_SLOTVLD_START_BIT;
+	}
+
+	if (rx_mask != 0) {
+		if ((bit = __ffs(rx_mask)) > 15)
+			return -EINVAL;
+
+		aw88261->rxl_slotvld_mask = bit << AW88261_I2S_RXL_SLOTVLD_START_BIT;
+	}
+
+	if ((rx_mask & ~BIT(bit)) != 0) {
+		if ((bit = __ffs(rx_mask & ~BIT(bit))) > 15)
+			return -EINVAL;
+
+		aw88261->rxr_slotvld_mask = bit << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops aw88261_dai_ops = {
 	.set_fmt = aw88261_set_fmt,
 	.hw_params = aw88261_hw_params,
+	.set_tdm_slot	= aw88261_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver aw88261_dai[] = {
@@ -1363,12 +1449,14 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	/* set defaults */
+	aw88261->slot_num_value = AW88261_SLOT_NUM_I2S_MODE_VALUE;
 	aw88261->sr_value = AW88261_I2SSR_48KHZ_VALUE;
 	aw88261->cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
 	aw88261->fs_value = AW88261_I2SFS_24_BITS_VALUE;
 	aw88261->bck_value = AW88261_I2SBCK_64FS_VALUE;
 	aw88261->bck_inv_value = AW88261_BCKINV_NOT_INVERT_VALUE;
 	aw88261->md_value = AW88261_I2SMD_PHILIPS_STANDARD_VALUE;
+	aw88261->rxr_slotvld_mask = 1 << AW88261_I2S_RXR_SLOTVLD_START_BIT;
 
 	mutex_init(&aw88261->lock);
 
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 3d7483d625a9..02820795d434 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -368,6 +368,54 @@
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
@@ -565,6 +613,11 @@ struct aw88261 {
 	unsigned int bck_inv_value;
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

