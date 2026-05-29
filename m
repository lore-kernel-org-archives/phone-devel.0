Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CD428465
	for <phone-devel@vger.kernel.org>; Fri, 29 May 2026 20:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085217; cv=none; b=UUO2H/DXechbZRgsJLsEmQRGsUosd0qZT1gv+XliosBR6Ohy447/nBE56tXI4/4q7P/uOWWSvwi9oSAphd2V8jYZKi8rcE2kJ4a4LFX6CUAIZRT/zo+i+38Fwcc4qnLJn6VSm5Vxold/BZBXyDKRBKy1p69LA0/ut4qOJ7V70M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085217; c=relaxed/simple;
	bh=Is2FyYvAdrkQu6Ud6KN+4moIh7SHPjl0vMMpeZBgoEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWLQynO7PFuMOv+z/19S5kNs0yIsIx7dfZm3HiJoF5mtc02rkzAA0D0TDSqMB8znfY9pSt+MmdUT6SoFDzmMlzXydgSVSn3mDQcL6Z1aeZ1AIjMS4EVmg4j4In8B9PU4Fp/FhoSabQ11zflQ5lMmeA01vN2vIMfBeU1SwKOXraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ZOn8CYZG; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ZOn8CYZG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHnTwGhN3iwFFU6aGNvT4jeayluXw6pEtajSyI3X528=;
	b=ZOn8CYZG5aUMEpg57SeOA3+rvDs3gIPofMVxjcsCneqfgxirHrjkP0kGtuwGjNaM2w6POD
	yeBQazhIwXKxSRybfyx2SDMidl4t4vF/+anH64MWz/F3w4Irmt0vm1E+gkdTGBYkKDeVvl
	F5Qt01jnEYTvF25Hl2IjC3axtPHHgTJQ78U9JFRCXwGRiuTohlm/r+EgVHDbY/UCrblLuu
	ETC2aFlSmRrzkuO0WYXyeUEdv3DQgaNNUh/+c2q7N8nRtaE/h7yw0xJ3CZhEd4cqNhLOnE
	HgiVVo0mTd/tnsDgbgMEiBuJI4VPEQHyLN0wukwxz6fdeTNRYb8rWQ2+QQUdHA==
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
Subject: [PATCH v3 7/7] ASoC: codecs: aw88261: make volume control usable
Date: Fri, 29 May 2026 17:05:14 -0300
Message-ID: <20260529200550.529719-8-val@packett.cool>
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

- Invert the value to match userspace expectations (in the hardware,
  positive numbers represent negative dB attenuation)
- Provide TLV metadata for the dB scale (and divide the raw values by 2
  as the excessive precision used by HW is not representable in TLV)
- Do not unnecessarily reset the volume while switching profiles
- Simplify aw88261_dev_set_volume using regmap_update_bits
- Do not add the initial volume from the profile to the requested volume
  as that would throw off the dB mapping (if a lower max limit is
  desired, it can be set in the UCM profile in userspace)

With this change, it's actually possible to use this hardware volume
control as PlaybackVolume in an ALSA UCM profile.

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 42 +++++++++++++++++++-------------------
 sound/soc/codecs/aw88261.h |  4 ++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 01e93bc018b9..d059820282f4 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
+#include <sound/tlv.h>
 #include "aw88261.h"
 #include "aw88395/aw88395_data_type.h"
 #include "aw88395/aw88395_device.h"
@@ -29,20 +30,10 @@ static const struct regmap_config aw88261_remap_config = {
 
 static void aw88261_dev_set_volume(struct aw_device *aw_dev, unsigned int value)
 {
-	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
-	unsigned int real_value, volume;
-	unsigned int reg_value;
+	unsigned int volume = min(value, (unsigned int)AW88261_MUTE_VOL);
 
-	volume = min((value + vol_desc->init_volume), (unsigned int)AW88261_MUTE_VOL);
-	real_value = DB_TO_REG_VAL(volume);
-
-	regmap_read(aw_dev->regmap, AW88261_SYSCTRL2_REG, &reg_value);
-
-	real_value = (real_value | (reg_value & AW88261_VOL_START_MASK));
-
-	dev_dbg(aw_dev->dev, "value 0x%x , real_value:0x%x", value, real_value);
-
-	regmap_write(aw_dev->regmap, AW88261_SYSCTRL2_REG, real_value);
+	regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL2_REG,
+		~AW88261_VOL_MASK, DB_TO_REG_VAL(volume));
 }
 
 static void aw88261_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
@@ -994,7 +985,8 @@ static int aw88261_volume_get(struct snd_kcontrol *kcontrol,
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
 
-	ucontrol->value.integer.value[0] = vol_desc->ctl_volume;
+	ucontrol->value.integer.value[0] =
+		(AW88261_MUTE_VOL - vol_desc->ctl_volume) / 2;
 
 	return 0;
 }
@@ -1007,13 +999,13 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	int value;
-
-	value = ucontrol->value.integer.value[0];
+	int value = ucontrol->value.integer.value[0];
 
 	if (value < mc->min || value > mc->max)
 		return -EINVAL;
 
+	value = AW88261_MUTE_VOL - (value * 2);
+
 	if (vol_desc->ctl_volume != value) {
 		vol_desc->ctl_volume = value;
 		aw88261_dev_set_volume(aw88261->aw_pa, vol_desc->ctl_volume);
@@ -1024,10 +1016,18 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/*
+ * The field contains 4 bits in units of 6dB + 6 bits in units of 0.125dB
+ * which is too precise for TLV (!) so we have to multiply the scale by 2.
+ *
+ * The range is clamped at -90dB to prevent overflowing the 4-bit part.
+ */
+static const DECLARE_TLV_DB_SCALE(volume_tlv, -9000, 25, 0);
+
 static const struct snd_kcontrol_new aw88261_controls[] = {
-	SOC_SINGLE_EXT("PCM Playback Volume", AW88261_SYSCTRL2_REG,
-		6, AW88261_MUTE_VOL, 0, aw88261_volume_get,
-		aw88261_volume_set),
+	SOC_SINGLE_EXT_TLV("PCM Playback Volume", AW88261_SYSCTRL2_REG,
+		6, AW88261_CTL_MAX_VOL, 1,
+		aw88261_volume_get, aw88261_volume_set, volume_tlv),
 	AW88261_PROFILE_EXT("Profile Set", aw88261_profile_info,
 		aw88261_profile_get, aw88261_profile_set),
 };
@@ -1278,7 +1278,7 @@ static int aw88261_init(struct aw88261 *aw88261, struct i2c_client *i2c, struct
 	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
 	aw_dev->channel = 0;
 	aw_dev->fw_status = AW88261_DEV_FW_FAILED;
-	aw_dev->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
+	aw_dev->volume_desc.ctl_volume = AW88261_CTL_DEFAULT_VOL;
 	aw_dev->volume_desc.mute_volume = AW88261_MUTE_VOL;
 	aw88261_parse_channel_dt(aw88261);
 
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 4be6ac02123e..270ccf375f36 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -262,7 +262,8 @@
 #define AW88261_VOL_MASK		\
 	(~(((1<<AW88261_VOL_BITS_LEN)-1) << AW88261_VOL_START_BIT))
 
-#define AW88261_VOL_DEFAULT_VALUE	(0)
+#define AW88261_CTL_MAX_VOL		(AW88261_MUTE_VOL / 2)
+#define AW88261_CTL_DEFAULT_VOL		(AW88261_CTL_MAX_VOL / 2)
 
 #define AW88261_I2STXEN_START_BIT	(6)
 #define AW88261_I2STXEN_BITS_LEN	(1)
@@ -538,7 +539,6 @@
 #define AW88261_DEV_SYSST_CHECK_MAX	(10)
 #define AW88261_SOFT_RESET_VALUE	(0x55aa)
 #define AW88261_REG_TO_DB		(0x3f)
-#define AW88261_VOL_START_MASK		(0xfc00)
 #define AW88261_INIT_PROFILE		(0)
 
 #define REG_VAL_TO_DB(value)		((((value) >> AW88261_VOL_6DB_START) * \
-- 
2.53.0

