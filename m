Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8539B4BB
	for <phone-devel@vger.kernel.org>; Mon, 18 May 2026 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142215; cv=none; b=nlRrL0E3kula8uBBTYVYMDErywzPt0sCOJ6P/8L3+kjTXJ/b9YBTnsPEvWsDcmkb4SYtPOWEqVnz/UArNgk7vyvG+cMqDGCUH6G5IiphGpwpMWtlC/n7Ta2ZRtU3mpoDRF8AxfcCvkL2fE13l8qD5iR4jxp7tn9wnJjbuZ4MfFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142215; c=relaxed/simple;
	bh=lv9N+7Z8VW0vAE7era4BadpcmJzvEyBHEEfXSW/r0IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8NHbzFicwk7ebqlEc73j0ZiOWQUT99d+Kw3xDRqMi5VKkTScPNDaihEue36m47ojmUgOFZkDJ6OQRLeFO8WVp2U/AWMhHHi9VYcIre6u96Umee3tVO7PPsaGHz/JxQcya6MGa9pKlBi3EsgirdlpwWuY8L7kpTgA0ITtlGHwyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=N5j8KoYd; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="N5j8KoYd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZHMcEa/nUuSwW8bqcx2odanePCj/SZB7U7QS52W71Q=;
	b=N5j8KoYdQs7yFYqs/+9KrPhxklbOPiN711flZIJB5vYfg64dagekhk3r5DhnJS6ZkJqtyC
	ga3bXk9KcRmvZChAhATIGbr6b6bL6HXZpeWNDa6JIgZWU0KzVzKFAAR/pH3XlR8vSuEuhs
	4c+V/mIC4A1Klgd/jJd5K7ei/YsTZXisSIcXDnkIHDKXP4nOwr9KIX7GlG8LMlGrFjILqr
	UgJ2k7xtuPdzpkej0WXQt1UBWorCv+Vj8C70+QLT9iIJI9p6qbOXvJEy1cVjAzGsrriXmf
	OEdj/mMsKzL6CNOSFjvdG8qvgwQ9bp2SqEP9P8O4p1PLXxUtdJt9s2mAm6Bkrg==
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
Subject: [PATCH v2 7/7] ASoC: codecs: aw88261: make volume control usable
Date: Mon, 18 May 2026 18:44:36 -0300
Message-ID: <20260518220906.347958-8-val@packett.cool>
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
 sound/soc/codecs/aw88261.c | 52 +++++++++++++++-----------------------
 sound/soc/codecs/aw88261.h |  1 -
 2 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index adc728e45f57..0e6b2dfe5db9 100644
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
@@ -424,17 +415,7 @@ static int aw88261_dev_reg_update(struct aw88261 *aw88261,
 			break;
 	}
 
-	ret = aw88261_dev_set_vcalb(aw_dev);
-	if (ret)
-		return ret;
-
-	if (aw_dev->prof_cur != aw_dev->prof_index)
-		vol_desc->ctl_volume = 0;
-
-	/* keep min volume */
-	aw88261_dev_set_volume(aw_dev, vol_desc->mute_volume);
-
-	return ret;
+	return aw88261_dev_set_vcalb(aw_dev);
 }
 
 static int aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index, char **prof_name)
@@ -970,7 +951,8 @@ static int aw88261_volume_get(struct snd_kcontrol *kcontrol,
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
 
-	ucontrol->value.integer.value[0] = vol_desc->ctl_volume;
+	ucontrol->value.integer.value[0] =
+		(AW88261_MUTE_VOL - vol_desc->ctl_volume) / 2;
 
 	return 0;
 }
@@ -983,13 +965,13 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
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
@@ -1000,10 +982,18 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
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
+		6, AW88261_MUTE_VOL / 2, 1,
+		aw88261_volume_get, aw88261_volume_set, volume_tlv),
 	AW88261_PROFILE_EXT("Profile Set", aw88261_profile_info,
 		aw88261_profile_get, aw88261_profile_set),
 };
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 1b1beba6a26b..76ef47236bb7 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -536,7 +536,6 @@
 #define AW88261_DEV_SYSST_CHECK_MAX	(10)
 #define AW88261_SOFT_RESET_VALUE	(0x55aa)
 #define AW88261_REG_TO_DB		(0x3f)
-#define AW88261_VOL_START_MASK		(0xfc00)
 #define AW88261_INIT_PROFILE		(0)
 
 #define REG_VAL_TO_DB(value)		((((value) >> AW88261_VOL_6DB_START) * \
-- 
2.53.0

