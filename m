Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F22383C68
	for <phone-devel@vger.kernel.org>; Mon, 20 Apr 2026 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721009; cv=none; b=gZq7nwB6LvotT4zJVdYfrQsGgrmqE1/Zm4WdjTvsD1uyEBIV4WD5VOa3tIDcAHvlLAdAL3E3upqtSSk6Ccxuhmr8D1XI5W93+TXuCRwPwThUMkGnULahYKXm3JeraEytMpg8wa4TSIGowJ/d9lLNMGQ78tBG1PR4hTOO8dvmywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721009; c=relaxed/simple;
	bh=Zoa9UFukAnEuQ9c5K2BgTjKyv1xjsW93g1GcRgdd5/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nu5/6AJBKCHNQYOOTx32do/Bez3F+ID49xGcn+Y+xTQNPorrF1daaX0Gcu5F/s3NaLsGo4nhARbDYW23K6X6xwXCg2m4sUY/6xKySO/vjN6BtRkutLrNoL52ssUGm84IUmi5IbE8nAMkVm4QzrQ4Tm675ex2Z6W6Q6stPS4bnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=u+f72JwR; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="u+f72JwR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776721004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LVdcleR35uFx2dhc75lKVNMy76V7PNh/Wg93kc21brE=;
	b=u+f72JwRan4JbDYbD2LgiOH0fSvSWK/ym7mKC37YeaH2jl9rNx3XEqbfA9PuJZhyTJ67iQ
	tmU4uS95gEQDe82tfBBdPMis5gUxCIVvld/dmhydw+ZvtwiAtaVoqms4cwt9e/hSasTbSD
	j/Fi9rDQyyuXb90agGlME7CtfERdPOCde8Tjn7zCfn4VMu2tiEYAyBAtySvMwid+5GT7O6
	NjIocox0kY9lvlytSY0s5466Yxt35Ub7HyEdywNe7Qu05TddQ5J9JUdQ20ExymjfXRZTtn
	Y1JDi5Kac9mSyWaeTL/kHvu3JhnStH7Tr0mzqqdZ9d5yFXqHD7irqz8BlnXatg==
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: aw88261: fix changing sample rate and bit width
Date: Mon, 20 Apr 2026 16:39:58 -0300
Message-ID: <20260420213250.215465-2-val@packett.cool>
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
the necessary PLL settings based on what was passed to us in the
hw_params DAI callback. This replaces the strange downstream routine
that tries two divider modes in sequence.

Signed-off-by: Val Packett <val@packett.cool>
---

This driver is used for the speakers on devices like fairphone-fp5 and
motorola-dubai, but until now only with non-upstreamable hacks (see [1])
to force the use of S32_LE because it "did not initialize with the format
limited to S16_LE".

It seems like the downstream driver did not actually handle this properly
either, so I presume similar hacks are done there too. There are two
different versions I've found (in the same tree even): the "newer" more
complex one [2] sends hw_params straight to /dev/null and has this bizzare
I-don't-know-what-I'm-doing "mode1/mode2" routine that was copied into the
upstream driver, while the other simpler one [3] does indeed have an
hw_params callback that configures registers based on the params..

Except if anyone tried to just copy it, it wouldn't actually fix support
for bit widths other than 32. The crucial thing it missed was the I2SBCK
field, which is what's actually responsible for setting the "physical"
frame length! Also during testing I've discovered that the value of the
registers was being reset during aw88261_dev_pwd, so touching registers
directly in the hw_params handler would not work.

With this patch, the aw88261 speakers in my motorola-dubai do work with
the S16_LE format, avoiding the need for sm8250.c hacks.

[1]: https://github.com/sc7280-mainline/linux/commit/b9c78cb306ff069eee65213c67b7e7fba40e6221
[2]: https://github.com/LineageOS/android_kernel_motorola_sm7325/tree/lineage-23.2/techpack/audio/asoc/codecs/aw88261
[3]: https://github.com/LineageOS/android_kernel_motorola_sm7325/blob/lineage-23.2/techpack/audio/asoc/codecs/aw882xx/aw882xx.c

Thanks,
~val

---
 sound/soc/codecs/aw88261.c | 174 ++++++++++++++++++++++++-------------
 sound/soc/codecs/aw88261.h |  78 ++++++++++++++++-
 2 files changed, 189 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a6805d5405cd..3c7d3e3865eb 100644
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
 
@@ -175,71 +176,95 @@ static int aw88261_dev_check_mode1_pll(struct aw_device *aw_dev)
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
+	uint32_t sr_value, fs_value, cco_mux_value, bck_value;
 	int ret;
 
-	ret = aw88261_dev_check_mode1_pll(aw_dev);
-	if (ret) {
-		dev_dbg(aw_dev->dev, "mode1 check iis failed try switch to mode2 check");
-		ret = aw88261_dev_check_mode2_pll(aw_dev);
-		if (ret) {
-			dev_err(aw_dev->dev, "mode2 check iis failed");
-			return ret;
-		}
+	switch (aw88261->sample_rate) {
+	case 8000:
+		sr_value = AW88261_I2SSR_8KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 16000:
+		sr_value = AW88261_I2SSR_16KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 32000:
+		sr_value = AW88261_I2SSR_32KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_DIVIDED_VALUE;
+		break;
+	case 44100:
+		sr_value = AW88261_I2SSR_44P1KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		break;
+	case 48000:
+		sr_value = AW88261_I2SSR_48KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		break;
+	case 96000:
+		sr_value = AW88261_I2SSR_96KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		break;
+	case 192000:
+		sr_value = AW88261_I2SSR_192KHZ_VALUE;
+		cco_mux_value = AW88261_CCO_MUX_BYPASS_VALUE;
+		break;
+	default:
+		dev_err(aw_dev->dev, "unsupported sample rate %d\n",
+			aw88261->sample_rate);
+		return -EINVAL;
 	}
 
-	return ret;
+	switch (aw88261->bit_width) {
+	case 16:
+		fs_value = AW88261_I2SFS_16_BITS_VALUE;
+		bck_value = AW88261_I2SBCK_32FS_VALUE;
+		break;
+	case 20:
+		fs_value = AW88261_I2SFS_20_BITS_VALUE;
+		bck_value = AW88261_I2SBCK_48FS_VALUE;
+		break;
+	case 24:
+		fs_value = AW88261_I2SFS_24_BITS_VALUE;
+		bck_value = AW88261_I2SBCK_48FS_VALUE;
+		break;
+	case 32:
+		fs_value = AW88261_I2SFS_32_BITS_VALUE;
+		bck_value = AW88261_I2SBCK_64FS_VALUE;
+		break;
+	default:
+		dev_err(aw_dev->dev, "unsupported bit width %d\n",
+			aw88261->bit_width);
+		return -EINVAL;
+	}
+
+	/* PLL divider must be used for 8/16/32 kHz modes */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
+			~AW88261_CCO_MUX_MASK, cco_mux_value);
+	if (ret)
+		return ret;
+
+	/* The word clock (WCK) defines the beginning of a frame */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SSR_MASK, sr_value);
+	if (ret)
+		return ret;
+
+	/* The bit clock (BCK) defines the length of a frame */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SBCK_MASK, bck_value);
+	if (ret)
+		return ret;
+
+	/* The logical frame size is the width of data for 1 slot */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCTRL1_REG,
+			~AW88261_I2SFS_MASK, fs_value);
+	if (ret)
+		return ret;
+
+	return aw88261_dev_check_pll(aw_dev);
 }
 
 static int aw88261_dev_check_sysst(struct aw_device *aw_dev)
@@ -558,7 +583,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	aw88261_dev_pwd(aw_dev, false);
 	usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
 
-	ret = aw88261_dev_check_syspll(aw_dev);
+	ret = aw88261_dev_configure_syspll(aw88261);
 	if (ret) {
 		dev_err(aw_dev->dev, "pll check failed cannot start");
 		goto pll_check_fail;
@@ -712,6 +737,26 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
 			AW88261_START_WORK_DELAY_MS);
 }
 
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
+	/* Only store the settings as the regs do get reset when starting */
+	aw88261->sample_rate = params_rate(params);
+	aw88261->bit_width = params_width(params);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops aw88261_dai_ops = {
+	.hw_params = aw88261_hw_params,
+};
+
 static struct snd_soc_dai_driver aw88261_dai[] = {
 	{
 		.name = "aw88261-aif",
@@ -730,6 +775,7 @@ static struct snd_soc_dai_driver aw88261_dai[] = {
 			.rates = AW88261_RATES,
 			.formats = AW88261_FORMATS,
 		},
+		.ops = &aw88261_dai_ops,
 	},
 };
 
@@ -1249,6 +1295,10 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	if (!aw88261)
 		return -ENOMEM;
 
+	/* set defaults */
+	aw88261->sample_rate = 48000;
+	aw88261->bit_width = 32;
+
 	mutex_init(&aw88261->lock);
 
 	i2c_set_clientdata(i2c, aw88261);
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 1fee589608d6..2100fddaa68f 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -264,7 +264,81 @@
 #define AW88261_I2STXEN_ENABLE_VALUE	\
 	(AW88261_I2STXEN_ENABLE << AW88261_I2STXEN_START_BIT)
 
-#define AW88261_CCO_MUX_START_BIT	(14)
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
@@ -450,6 +524,8 @@ struct aw88261 {
 	int frcset_en;
 	unsigned int mute_st;
 	unsigned int amppd_st;
+	int sample_rate;
+	int bit_width;
 
 	bool phase_sync;
 };
-- 
2.53.0

