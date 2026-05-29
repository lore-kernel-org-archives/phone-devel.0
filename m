Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5643D4EE;
	Fri, 29 May 2026 20:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085203; cv=none; b=N3B9xD6PpJPIxQ7+SwgfIqHl+l+Kj+qO+TwLYQJHlKZI48IzlacRZMrUKwApMeAXrpwHzjDJasbT8ZpQrqykqRlKI/vPf73oeTr30WgTTChxQbeYpXtnWH1u5yjFcEnVgIt1eNqrb+L4bXrm0hnxwpGcEJuILapnx6DUJVfONtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085203; c=relaxed/simple;
	bh=NQCGUjPcYda/pylMgITMJiPXEpkpAkZXIM2YXv0aOig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy+UIS/3B9MzJ6glHN71JZa5xooz7my3r+OHQIVhb7MelVFaQtezIWRtftAdv3M381eU+7VXLGAbY3drMv6DJgidaxkwHvPx8lOL5rsO2k3+ZLdlWAGFrt0jtc2C1FXXTpGad3hfwfL1otN6apOLYFDD/Lk7cAg7nqjoUoZwK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=KflyKL8r; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="KflyKL8r"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VL+pAs0fYoDbMxSGaf0xvSKkHteSEBRZVSVccDAbyto=;
	b=KflyKL8rm5iiR0qeMo64BYVFCgA2xsenZ04csYyFIDshm00UKYdnD5UQ0y3s/CxnDfTHAd
	+eze6PMTa+LiWtYSKTikppQb4HoD3VuiONeNhar55ZP4qZHpjdH3AD4dHzFgxt7H3O2Wfs
	y82XA72Qw8k4G371GJrwU37XkLJY1+qX85Pco+EcAIcGcSLQBtDP4ZC/KARlxTtk4JdRPi
	22CKcPwmdcys/+RBKJtmvsle02D+gNkwaqtY2KqQjttxXU1zr3R674ajo9gyFFEzJlPkil
	DYTR7/O/3pZ6hCKMiOnLPbU/G5YUNBGqI+5fmYbGuTPDiusVyZXYuzQUS4yT7A==
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
Subject: [PATCH v3 4/7] ASoC: codecs: aw88261: remove fade in/out on start/stop
Date: Fri, 29 May 2026 17:05:11 -0300
Message-ID: <20260529200550.529719-5-val@packett.cool>
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

This "feature" was copied from downstream, but it does not belong in
the kernel at all. Remove it to simplify the driver.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 158 +------------------------------------
 sound/soc/codecs/aw88261.h |   3 -
 2 files changed, 2 insertions(+), 159 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a20b66239d50..f6a93244046d 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -45,50 +45,6 @@ static void aw88261_dev_set_volume(struct aw_device *aw_dev, unsigned int value)
 	regmap_write(aw_dev->regmap, AW88261_SYSCTRL2_REG, real_value);
 }
 
-static void aw88261_dev_fade_in(struct aw_device *aw_dev)
-{
-	struct aw_volume_desc *desc = &aw_dev->volume_desc;
-	int fade_in_vol = desc->ctl_volume;
-	int fade_step = aw_dev->fade_step;
-	int i;
-
-	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
-		aw88261_dev_set_volume(aw_dev, fade_in_vol);
-		return;
-	}
-
-	for (i = AW88261_MUTE_VOL; i >= fade_in_vol; i -= fade_step) {
-		aw88261_dev_set_volume(aw_dev, i);
-		usleep_range(aw_dev->fade_in_time,
-					aw_dev->fade_in_time + 10);
-	}
-
-	if (i != fade_in_vol)
-		aw88261_dev_set_volume(aw_dev, fade_in_vol);
-}
-
-static void aw88261_dev_fade_out(struct aw_device *aw_dev)
-{
-	struct aw_volume_desc *desc = &aw_dev->volume_desc;
-	int fade_step = aw_dev->fade_step;
-	int i;
-
-	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
-		aw88261_dev_set_volume(aw_dev, AW88261_MUTE_VOL);
-		return;
-	}
-
-	for (i = desc->ctl_volume; i <= AW88261_MUTE_VOL; i += fade_step) {
-		aw88261_dev_set_volume(aw_dev, i);
-		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
-	}
-
-	if (i != AW88261_MUTE_VOL) {
-		aw88261_dev_set_volume(aw_dev, AW88261_MUTE_VOL);
-		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
-	}
-}
-
 static void aw88261_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
 {
 	if (flag)
@@ -122,13 +78,13 @@ static void aw88261_dev_amppd(struct aw_device *aw_dev, bool amppd)
 static void aw88261_dev_mute(struct aw_device *aw_dev, bool is_mute)
 {
 	if (is_mute) {
-		aw88261_dev_fade_out(aw_dev);
+		aw88261_dev_set_volume(aw_dev, AW88261_MUTE_VOL);
 		regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
 				~AW88261_HMUTE_MASK, AW88261_HMUTE_ENABLE_VALUE);
 	} else {
 		regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
 				~AW88261_HMUTE_MASK, AW88261_HMUTE_DISABLE_VALUE);
-		aw88261_dev_fade_in(aw_dev);
+		aw88261_dev_set_volume(aw_dev, aw_dev->volume_desc.ctl_volume);
 	}
 }
 
@@ -960,75 +916,6 @@ static struct snd_soc_dai_driver aw88261_dai[] = {
 	},
 };
 
-static int aw88261_get_fade_in_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
-	struct aw_device *aw_dev = aw88261->aw_pa;
-
-	ucontrol->value.integer.value[0] = aw_dev->fade_in_time;
-
-	return 0;
-}
-
-static int aw88261_set_fade_in_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	struct aw_device *aw_dev = aw88261->aw_pa;
-	int time;
-
-	time = ucontrol->value.integer.value[0];
-
-	if (time < mc->min || time > mc->max)
-		return -EINVAL;
-
-	if (time != aw_dev->fade_in_time) {
-		aw_dev->fade_in_time = time;
-		return 1;
-	}
-
-	return 0;
-}
-
-static int aw88261_get_fade_out_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
-	struct aw_device *aw_dev = aw88261->aw_pa;
-
-	ucontrol->value.integer.value[0] = aw_dev->fade_out_time;
-
-	return 0;
-}
-
-static int aw88261_set_fade_out_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	struct aw_device *aw_dev = aw88261->aw_pa;
-	int time;
-
-	time = ucontrol->value.integer.value[0];
-	if (time < mc->min || time > mc->max)
-		return -EINVAL;
-
-	if (time != aw_dev->fade_out_time) {
-		aw_dev->fade_out_time = time;
-		return 1;
-	}
-
-	return 0;
-}
-
 static int aw88261_dev_set_profile_index(struct aw_device *aw_dev, int index)
 {
 	/* check the index whether is valid */
@@ -1152,48 +1039,10 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int aw88261_get_fade_step(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
-
-	ucontrol->value.integer.value[0] = aw88261->aw_pa->fade_step;
-
-	return 0;
-}
-
-static int aw88261_set_fade_step(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	int value;
-
-	value = ucontrol->value.integer.value[0];
-	if (value < mc->min || value > mc->max)
-		return -EINVAL;
-
-	if (aw88261->aw_pa->fade_step != value) {
-		aw88261->aw_pa->fade_step = value;
-		return 1;
-	}
-
-	return 0;
-}
-
 static const struct snd_kcontrol_new aw88261_controls[] = {
 	SOC_SINGLE_EXT("PCM Playback Volume", AW88261_SYSCTRL2_REG,
 		6, AW88261_MUTE_VOL, 0, aw88261_volume_get,
 		aw88261_volume_set),
-	SOC_SINGLE_EXT("Fade Step", 0, 0, AW88261_MUTE_VOL, 0,
-		aw88261_get_fade_step, aw88261_set_fade_step),
-	SOC_SINGLE_EXT("Volume Ramp Up Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
-		aw88261_get_fade_in_time, aw88261_set_fade_in_time),
-	SOC_SINGLE_EXT("Volume Ramp Down Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
-		aw88261_get_fade_out_time, aw88261_set_fade_out_time),
 	AW88261_PROFILE_EXT("Profile Set", aw88261_profile_info,
 		aw88261_profile_get, aw88261_profile_set),
 };
@@ -1284,8 +1133,6 @@ static int aw88261_dev_init(struct aw88261 *aw88261, struct aw_container *aw_cfg
 	if (ret)
 		return ret;
 
-	aw_dev->fade_in_time = AW88261_500_US;
-	aw_dev->fade_out_time = AW88261_500_US;
 	aw_dev->prof_cur = AW88261_INIT_PROFILE;
 	aw_dev->prof_index = AW88261_INIT_PROFILE;
 
@@ -1456,7 +1303,6 @@ static int aw88261_init(struct aw88261 *aw88261, struct i2c_client *i2c, struct
 	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
 	aw_dev->channel = 0;
 	aw_dev->fw_status = AW88261_DEV_FW_FAILED;
-	aw_dev->fade_step = AW88261_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
 	aw_dev->volume_desc.mute_volume = AW88261_MUTE_VOL;
 	aw88261_parse_channel_dt(aw88261);
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index d75f55cdca42..9a5384624541 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -533,9 +533,6 @@
 			SNDRV_PCM_FMTBIT_S24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE)
 
-#define FADE_TIME_MAX			100000
-#define FADE_TIME_MIN			0
-
 #define AW88261_DEV_DEFAULT_CH		(0)
 #define AW88261_ACF_FILE		"aw88261_acf.bin"
 #define AW88261_DEV_SYSST_CHECK_MAX	(10)
-- 
2.53.0

