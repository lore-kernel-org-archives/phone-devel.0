Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D93644C7
	for <phone-devel@vger.kernel.org>; Mon, 18 May 2026 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142194; cv=none; b=oYLSHIht2wMIg/ZQyorw4MvvHthYc0lsa0iy+h6DK45BKpX0BA+6tf6fcO4rxC2j8LxsUymzlwWNlihiW5nc05QSmZ8JBXCNIXvxKK9zwFCkKVvs40+tGdYeH2fQrkIRQQXSAqsIGKoJBPMkYerMyE0jc1mgtGo1nTX82obAPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142194; c=relaxed/simple;
	bh=n+PAD86hX5fAbCBeVEAKy9jRtwKnRnkCMUzs5oPxyJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHmTIcuxvfE6CHpawtzzUV6Ut/E7k8oD+Acqgrwd2FWConj+w1wVxgzFyhUQISmhq0PPxL6LEgWR4b9OECqH5SqII+XNW+8p4uuGRUz3Jd9V9WWF3asyrCutaimz8kWZyugcD+UdOYLVjhLqUw4LE0dNG7dkW16AGPFQ0HWkHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Aw72sxJi; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Aw72sxJi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCMxzHRZ4GceZB7pioSAng9MmhdiXjI9TjB7qTw99L4=;
	b=Aw72sxJiYOHYXBAPEvJNje4/e7dCtgeP4oHGI0Oti3fyQ+X7MKJWYSr67ZOHFQVtWiRTg/
	Q06+TTSipjwH5M8GIDOcTYxJH/JA/Nz32bH4TmMrztTVNyaD2xFZnBir/SfG71dq81FZ6h
	ZvFtURREuhxsSu8vl+6zz3ht6puDL6KhYDoLkj2+Xig1Mt13Jhb8pzpDtBSEhRQ3l6il9v
	R7EefWNojFxPLqeR17AXLfc4dGnfMsoR05iqb6Xd0B7vUMaPPCO4tdmt0wz2YGunlx24bA
	DTvsSeN0KgtJeNlp3CZ2wh7zLPuEkR988r2wNaGSQoXE35607yNwxGuA0MFTzA==
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
Subject: [PATCH v2 1/7] ASoC: codecs: aw88261: support changing sample rate and bit width
Date: Mon, 18 May 2026 18:44:30 -0300
Message-ID: <20260518220906.347958-2-val@packett.cool>
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

The aw88261 driver only worked with 32-bit 48kHz streams so far due to
the lack of a proper PLL initialization sequence. Fix by selecting all
the necessary PLL settings based on what was passed to us by the
hw_params/set_fmt ops. This replaces the strange downstream routine
that tries two divider modes in sequence.

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 247 +++++++++++++++++++++++++++----------
 sound/soc/codecs/aw88261.h | 116 ++++++++++++++++-
 2 files changed, 299 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a6805d5405cd..2064e72b51af 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
+#include <sound/pcm_params.h>
 #include "aw88261.h"
 #include "aw88395/aw88395_data_type.h"
 #include "aw88395/aw88395_device.h"
@@ -158,7 +159,7 @@ static int aw88261_dev_get_iis_status(struct aw_device *aw_dev)
 	return ret;
 }
 
-static int aw88261_dev_check_mode1_pll(struct aw_device *aw_dev)
+static int aw88261_dev_check_pll(struct aw_device *aw_dev)
 {
 	int ret, i;
 
@@ -175,71 +176,48 @@ static int aw88261_dev_check_mode1_pll(struct aw_device *aw_dev)
 	return -EPERM;
 }
 
-static int aw88261_dev_check_mode2_pll(struct aw_device *aw_dev)
-{
-	unsigned int reg_val;
-	int ret, i;
-
-	ret = regmap_read(aw_dev->regmap, AW88261_PLLCTRL1_REG, &reg_val);
-	if (ret)
-		return ret;
-
-	reg_val &= (~AW88261_CCO_MUX_MASK);
-	if (reg_val == AW88261_CCO_MUX_DIVIDED_VALUE) {
-		dev_dbg(aw_dev->dev, "CCO_MUX is already divider");
-		return -EPERM;
-	}
-
-	/* change mode2 */
-	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
-			~AW88261_CCO_MUX_MASK, AW88261_CCO_MUX_DIVIDED_VALUE);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
-		ret = aw88261_dev_get_iis_status(aw_dev);
-		if (ret) {
-			dev_err(aw_dev->dev, "mode2 iis signal check error");
-			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
-		} else {
-			break;
-		}
-	}
-
-	/* change mode1 */
-	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
-			~AW88261_CCO_MUX_MASK, AW88261_CCO_MUX_BYPASS_VALUE);
-	if (ret == 0) {
-		usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
-		for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
-			ret = aw88261_dev_check_mode1_pll(aw_dev);
-			if (ret) {
-				dev_err(aw_dev->dev, "mode2 switch to mode1, iis signal check error");
-				usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
-			} else {
-				break;
-			}
-		}
-	}
-
-	return ret;
-}
-
-static int aw88261_dev_check_syspll(struct aw_device *aw_dev)
+static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 {
+	struct aw_device *aw_dev = aw88261->aw_pa;
 	int ret;
 
-	ret = aw88261_dev_check_mode1_pll(aw_dev);
-	if (ret) {
-		dev_dbg(aw_dev->dev, "mode1 check iis failed try switch to mode2 check");
-		ret = aw88261_dev_check_mode2_pll(aw_dev);
-		if (ret) {
-			dev_err(aw_dev->dev, "mode2 check iis failed");
-			return ret;
-		}
-	}
+	/* PLL divider must be used for 8/16/32 kHz modes */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
+			~AW88261_CCO_MUX_MASK, aw88261->cco_mux_value);
+	if (ret)
+		return ret;
 
-	return ret;
+	/* The word clock (WCK) defines the beginning of a frame */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SSR_MASK, aw88261->sr_value);
+	if (ret)
+		return ret;
+
+	/* The bit clock (BCK) defines the length of a frame */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SBCK_MASK, aw88261->bck_value);
+	if (ret)
+		return ret;
+
+	/* The logical frame size is the width of data for 1 slot */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SFS_MASK, aw88261->fs_value);
+	if (ret)
+		return ret;
+
+	/* The I2S interface mode (Philips standard, LSB/MSB justified) */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SMD_MASK, aw88261->md_value);
+	if (ret)
+		return ret;
+
+	/* The polarity of the bit clock (BCK) */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+			~AW88261_BCKINV_MASK, aw88261->bck_inv_value);
+	if (ret)
+		return ret;
+
+	return aw88261_dev_check_pll(aw_dev);
 }
 
 static int aw88261_dev_check_sysst(struct aw_device *aw_dev)
@@ -558,7 +536,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	aw88261_dev_pwd(aw_dev, false);
 	usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
 
-	ret = aw88261_dev_check_syspll(aw_dev);
+	ret = aw88261_dev_configure_syspll(aw88261);
 	if (ret) {
 		dev_err(aw_dev->dev, "pll check failed cannot start");
 		goto pll_check_fail;
@@ -712,6 +690,140 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
 			AW88261_START_WORK_DELAY_MS);
 }
 
+static int aw88261_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		aw88261->bck_inv_value = AW88261_BCKINV_NOT_INVERT_VALUE;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		aw88261->bck_inv_value = AW88261_BCKINV_INVERTED_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported invert mode 0x%x\n",
+			fmt & SND_SOC_DAIFMT_INV_MASK);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		aw88261->md_value = AW88261_I2SMD_PHILIPS_STANDARD_VALUE;
+		break;
+	case SND_SOC_DAIFMT_MSB:
+		aw88261->md_value = AW88261_I2SMD_MSB_JUSTIFIED_VALUE;
+		break;
+	case SND_SOC_DAIFMT_LSB:
+		aw88261->md_value = AW88261_I2SMD_LSB_JUSTIFIED_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported DAI format 0x%x\n",
+			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw88261_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params,
+	struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	aw88261->cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+	switch (params_rate(params)) {
+	case 8000:
+		aw88261->sr_value = AW88261_I2SSR_8KHZ_VALUE;
+		aw88261->cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 11025:
+		aw88261->sr_value = AW88261_I2SSR_11P025KHZ_VALUE;
+		break;
+	case 12000:
+		aw88261->sr_value = AW88261_I2SSR_12KHZ_VALUE;
+		break;
+	case 16000:
+		aw88261->sr_value = AW88261_I2SSR_16KHZ_VALUE;
+		aw88261->cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 22050:
+		aw88261->sr_value = AW88261_I2SSR_22P05KHZ_VALUE;
+		break;
+	case 24000:
+		aw88261->sr_value = AW88261_I2SSR_24KHZ_VALUE;
+		break;
+	case 32000:
+		aw88261->sr_value = AW88261_I2SSR_32KHZ_VALUE;
+		aw88261->cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 44100:
+		aw88261->sr_value = AW88261_I2SSR_44P1KHZ_VALUE;
+		break;
+	case 48000:
+		aw88261->sr_value = AW88261_I2SSR_48KHZ_VALUE;
+		break;
+	case 96000:
+		aw88261->sr_value = AW88261_I2SSR_96KHZ_VALUE;
+		break;
+	case 192000:
+		aw88261->sr_value = AW88261_I2SSR_192KHZ_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported sample rate %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	switch (params_width(params)) {
+	case 16:
+		aw88261->fs_value = AW88261_I2SFS_16_BITS_VALUE;
+		break;
+	case 20:
+		aw88261->fs_value = AW88261_I2SFS_20_BITS_VALUE;
+		break;
+	case 24:
+		aw88261->fs_value = AW88261_I2SFS_24_BITS_VALUE;
+		break;
+	case 32:
+		aw88261->fs_value = AW88261_I2SFS_32_BITS_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported bit width %d\n",
+			params_width(params));
+		return -EINVAL;
+	}
+
+	switch (params_physical_width(params)) {
+	case 16:
+		aw88261->bck_value = AW88261_I2SBCK_32FS_VALUE;
+		break;
+	case 24:
+		aw88261->bck_value = AW88261_I2SBCK_48FS_VALUE;
+		break;
+	case 32:
+		aw88261->bck_value = AW88261_I2SBCK_64FS_VALUE;
+		break;
+	default:
+		dev_err(aw88261->aw_pa->dev, "unsupported physical bit width %d\n",
+			params_physical_width(params));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops aw88261_dai_ops = {
+	.set_fmt = aw88261_set_fmt,
+	.hw_params = aw88261_hw_params,
+};
+
 static struct snd_soc_dai_driver aw88261_dai[] = {
 	{
 		.name = "aw88261-aif",
@@ -730,6 +842,7 @@ static struct snd_soc_dai_driver aw88261_dai[] = {
 			.rates = AW88261_RATES,
 			.formats = AW88261_FORMATS,
 		},
+		.ops = &aw88261_dai_ops,
 	},
 };
 
@@ -1249,6 +1362,14 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	if (!aw88261)
 		return -ENOMEM;
 
+	/* set defaults */
+	aw88261->sr_value = AW88261_I2SSR_48KHZ_VALUE;
+	aw88261->cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+	aw88261->fs_value = AW88261_I2SFS_24_BITS_VALUE;
+	aw88261->bck_value = AW88261_I2SBCK_64FS_VALUE;
+	aw88261->bck_inv_value = AW88261_BCKINV_NOT_INVERT_VALUE;
+	aw88261->md_value = AW88261_I2SMD_PHILIPS_STANDARD_VALUE;
+
 	mutex_init(&aw88261->lock);
 
 	i2c_set_clientdata(i2c, aw88261);
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 1fee589608d6..3d7483d625a9 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -116,6 +116,19 @@
 #define AW88261_VCALK_SHIFT		(0)
 #define AW88261_VCALKL_SHIFT		(0)
 
+#define AW88261_BCKINV_START_BIT	(4)
+#define AW88261_BCKINV_BITS_LEN	(1)
+#define AW88261_BCKINV_MASK	\
+	(~(((1<<AW88261_BCKINV_BITS_LEN)-1) << AW88261_BCKINV_START_BIT))
+
+#define AW88261_BCKINV_NOT_INVERT	(0)
+#define AW88261_BCKINV_NOT_INVERT_VALUE	\
+	(AW88261_BCKINV_NOT_INVERT << AW88261_BCKINV_START_BIT)
+
+#define AW88261_BCKINV_INVERTED	(1)
+#define AW88261_BCKINV_INVERTED_VALUE	\
+	(AW88261_BCKINV_INVERTED << AW88261_BCKINV_START_BIT)
+
 #define AW88261_AMPPD_START_BIT	(1)
 #define AW88261_AMPPD_BITS_LEN		(1)
 #define AW88261_AMPPD_MASK		\
@@ -264,7 +277,98 @@
 #define AW88261_I2STXEN_ENABLE_VALUE	\
 	(AW88261_I2STXEN_ENABLE << AW88261_I2STXEN_START_BIT)
 
-#define AW88261_CCO_MUX_START_BIT	(14)
+#define AW88261_I2SMD_START_BIT	(8)
+#define AW88261_I2SMD_BITS_LEN	(2)
+#define AW88261_I2SMD_MASK	\
+	(~(((1<<AW88261_I2SMD_BITS_LEN)-1) << AW88261_I2SMD_START_BIT))
+
+#define AW88261_I2SMD_PHILIPS_STANDARD	(0)
+#define AW88261_I2SMD_PHILIPS_STANDARD_VALUE	\
+	(AW88261_I2SMD_PHILIPS_STANDARD << AW88261_I2SMD_START_BIT)
+
+#define AW88261_I2SMD_MSB_JUSTIFIED	(1)
+#define AW88261_I2SMD_MSB_JUSTIFIED_VALUE	\
+	(AW88261_I2SMD_MSB_JUSTIFIED << AW88261_I2SMD_START_BIT)
+
+#define AW88261_I2SMD_LSB_JUSTIFIED	(2)
+#define AW88261_I2SMD_LSB_JUSTIFIED_VALUE	\
+	(AW88261_I2SMD_LSB_JUSTIFIED << AW88261_I2SMD_START_BIT)
+
+#define AW88261_I2SFS_START_BIT			(6)
+#define AW88261_I2SFS_BITS_LEN			(2)
+#define AW88261_I2SFS_MASK				\
+	(~(((1<<AW88261_I2SFS_BITS_LEN)-1)<<AW88261_I2SFS_START_BIT))
+
+#define AW88261_I2SFS_16_BITS			(0)
+#define AW88261_I2SFS_16_BITS_VALUE		\
+	(AW88261_I2SFS_16_BITS << AW88261_I2SFS_START_BIT)
+#define AW88261_I2SFS_20_BITS			(1)
+#define AW88261_I2SFS_20_BITS_VALUE		\
+	(AW88261_I2SFS_20_BITS << AW88261_I2SFS_START_BIT)
+#define AW88261_I2SFS_24_BITS			(2)
+#define AW88261_I2SFS_24_BITS_VALUE		\
+	(AW88261_I2SFS_24_BITS << AW88261_I2SFS_START_BIT)
+#define AW88261_I2SFS_32_BITS			(3)
+#define AW88261_I2SFS_32_BITS_VALUE		\
+	(AW88261_I2SFS_32_BITS << AW88261_I2SFS_START_BIT)
+
+#define AW88261_I2SBCK_START_BIT	(4)
+#define AW88261_I2SBCK_BITS_LEN	(2)
+#define AW88261_I2SBCK_MASK	\
+	(~(((1<<AW88261_I2SBCK_BITS_LEN)-1) << AW88261_I2SBCK_START_BIT))
+
+#define AW88261_I2SBCK_32FS	(0)
+#define AW88261_I2SBCK_32FS_VALUE	\
+	(AW88261_I2SBCK_32FS << AW88261_I2SBCK_START_BIT)
+
+#define AW88261_I2SBCK_48FS	(1)
+#define AW88261_I2SBCK_48FS_VALUE	\
+	(AW88261_I2SBCK_48FS << AW88261_I2SBCK_START_BIT)
+
+#define AW88261_I2SBCK_64FS	(2)
+#define AW88261_I2SBCK_64FS_VALUE	\
+	(AW88261_I2SBCK_64FS << AW88261_I2SBCK_START_BIT)
+
+#define AW88261_I2SSR_START_BIT			(0)
+#define AW88261_I2SSR_BITS_LEN			(4)
+#define AW88261_I2SSR_MASK				\
+	(~(((1<<AW88261_I2SSR_BITS_LEN)-1) << AW88261_I2SSR_START_BIT))
+
+#define AW88261_I2SSR_8KHZ				(0)
+#define AW88261_I2SSR_8KHZ_VALUE		\
+	(AW88261_I2SSR_8KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_11P025KHZ			(1)
+#define AW88261_I2SSR_11P025KHZ_VALUE	\
+	(AW88261_I2SSR_11P025KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_12KHZ				(2)
+#define AW88261_I2SSR_12KHZ_VALUE		\
+	(AW88261_I2SSR_12KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_16KHZ				(3)
+#define AW88261_I2SSR_16KHZ_VALUE		\
+	(AW88261_I2SSR_16KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_22P05KHZ			(4)
+#define AW88261_I2SSR_22P05KHZ_VALUE	\
+	(AW88261_I2SSR_22P05KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_24KHZ				(5)
+#define AW88261_I2SSR_24KHZ_VALUE		\
+	(AW88261_I2SSR_24KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_32KHZ				(6)
+#define AW88261_I2SSR_32KHZ_VALUE		\
+	(AW88261_I2SSR_32KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_44P1KHZ			(7)
+#define AW88261_I2SSR_44P1KHZ_VALUE	\
+	(AW88261_I2SSR_44P1KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_48KHZ				(8)
+#define AW88261_I2SSR_48KHZ_VALUE		\
+	(AW88261_I2SSR_48KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_96KHZ				(9)
+#define AW88261_I2SSR_96KHZ_VALUE		\
+	(AW88261_I2SSR_96KHZ << AW88261_I2SSR_START_BIT)
+#define AW88261_I2SSR_192KHZ			(10)
+#define AW88261_I2SSR_192KHZ_VALUE		\
+	(AW88261_I2SSR_192KHZ << AW88261_I2SSR_START_BIT)
+
+#define AW88261_CCO_MUX_START_BIT	(6)
 #define AW88261_CCO_MUX_BITS_LEN	(1)
 #define AW88261_CCO_MUX_MASK		\
 	(~(((1<<AW88261_CCO_MUX_BITS_LEN)-1) << AW88261_CCO_MUX_START_BIT))
@@ -370,7 +474,10 @@
 #define AW88261_START_RETRIES		(5)
 #define AW88261_START_WORK_DELAY_MS	(0)
 
+/* NOTE: 192000 has a reg value donwstream but not listed in datasheet */
 #define AW88261_RATES (SNDRV_PCM_RATE_8000_48000 | \
+			SNDRV_PCM_RATE_12000 | \
+			SNDRV_PCM_RATE_24000 | \
 			SNDRV_PCM_RATE_96000)
 #define AW88261_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | \
@@ -451,6 +558,13 @@ struct aw88261 {
 	unsigned int mute_st;
 	unsigned int amppd_st;
 
+	unsigned int sr_value;
+	unsigned int cco_mux_value;
+	unsigned int fs_value;
+	unsigned int bck_value;
+	unsigned int bck_inv_value;
+	unsigned int md_value;
+
 	bool phase_sync;
 };
 
-- 
2.53.0

