Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036F43DA26
	for <phone-devel@vger.kernel.org>; Fri, 29 May 2026 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085206; cv=none; b=IxNCb43TbgdKA7ufuPl8UGxc22Drno/OzW4W7m/BsmQi98X8p1xQZoGmhERnUVpcM6KgDa5x4kKW67iSXuCqkfFoCni69gfXfe8u6Qb4ipXbkCJx5xBVBjfqia8MMOcVrW92suTroH9zeqHQ/XyAh8alsH8I1hnZBN+pR0lokS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085206; c=relaxed/simple;
	bh=kf59LgX13Z87sgrmdC7jOb65NctBRGRC3nX7gZBPtlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFevJBqjAAZva7bw5Xdie9ttAhacbD6TGcmMNrT3x2pMP8SK3GjMlqaJKrlqLqyu2UtxR2hWOVC7SUUv2DuWx1LnolQy3jNzr5bJTBwZk7QxIk/QGkJ2Tv4G+MxhyrvfAipvh4DLcvA2lAbgSQFlv92eV4VohxtiW+bP8i7xpkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ihUyNa2h; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ihUyNa2h"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VJ4Uo/AYQ2edpIpy8GTrrQDMMphqfRRykPhkSfcf7g=;
	b=ihUyNa2hXdE1qUZZhPSjgbmcDizvAG+L2pYfrcuwGWN7or+jB/ozTqLiqECwGmspFS+yH6
	w1qtaPge94PuQZPOqIG5ipv4qRD6BllmmajNv+ud1/DX9ZPrKvfCjOGu0vYjhXPN+gy1KX
	Ddrbmp3eETzYuLvXwgs+IHuPkdjArCHnW2i90TCFSmqntlnx9cDh0WAXn3rtpgeglAD2iI
	wBvkSb2HWYEl596Z0ocBruWUm5FVYdH+O2VHaRSGUT6cW2+IRSwhUydDqWJ4lapPADffVV
	j2J6ea/ZYsPxtp8uJM6rceHbfw4os4iefJAOufiExWYUFUaEJ24HI5nKoTcP4g==
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
Subject: [PATCH v3 5/7] ASoC: codecs: aw88261: remove async start
Date: Fri, 29 May 2026 17:05:12 -0300
Message-ID: <20260529200550.529719-6-val@packett.cool>
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

Codec drivers are not supposed to do anything like this. The result was
that the first second or so of playback was essentially inaudible, and
very short alert sounds could be missed entirely. Let's not do this.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 33 ++++-----------------------------
 sound/soc/codecs/aw88261.h |  6 ------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index f6a93244046d..fca62dcfe15e 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -651,17 +651,7 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
 		dev_err(aw88261->aw_pa->dev, "start failure (%d)\n", ret);
 }
 
-static void aw88261_startup_work(struct work_struct *work)
-{
-	struct aw88261 *aw88261 =
-		container_of(work, struct aw88261, start_work.work);
-
-	mutex_lock(&aw88261->lock);
-	aw88261_start_pa(aw88261);
-	mutex_unlock(&aw88261->lock);
-}
-
-static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
+static void aw88261_start(struct aw88261 *aw88261)
 {
 	if (aw88261->aw_pa->fw_status != AW88261_DEV_FW_OK)
 		return;
@@ -669,12 +659,7 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
 	if (aw88261->aw_pa->status == AW88261_DEV_PW_ON)
 		return;
 
-	if (sync_start == AW88261_SYNC_START)
-		aw88261_start_pa(aw88261);
-	else
-		queue_delayed_work(system_dfl_wq,
-			&aw88261->start_work,
-			AW88261_START_WORK_DELAY_MS);
+	aw88261_start_pa(aw88261);
 }
 
 static int aw88261_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -994,7 +979,7 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 
 	if (aw88261->aw_pa->status) {
 		aw88261_dev_stop(aw88261->aw_pa);
-		aw88261_start(aw88261, AW88261_SYNC_START);
+		aw88261_start(aw88261);
 	}
 
 	mutex_unlock(&aw88261->lock);
@@ -1056,7 +1041,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	mutex_lock(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		aw88261_start(aw88261, AW88261_ASYNC_START);
+		aw88261_start(aw88261);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		aw88261_dev_stop(aw88261->aw_pa);
@@ -1216,8 +1201,6 @@ static int aw88261_codec_probe(struct snd_soc_component *component)
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	INIT_DELAYED_WORK(&aw88261->start_work, aw88261_startup_work);
-
 	ret = aw88261_request_firmware_file(aw88261);
 	if (ret)
 		return dev_err_probe(aw88261->aw_pa->dev, ret,
@@ -1241,16 +1224,8 @@ static int aw88261_codec_probe(struct snd_soc_component *component)
 	return ret;
 }
 
-static void aw88261_codec_remove(struct snd_soc_component *aw_codec)
-{
-	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(aw_codec);
-
-	cancel_delayed_work_sync(&aw88261->start_work);
-}
-
 static const struct snd_soc_component_driver soc_codec_dev_aw88261 = {
 	.probe = aw88261_codec_probe,
-	.remove = aw88261_codec_remove,
 };
 
 static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 9a5384624541..4be6ac02123e 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -557,11 +557,6 @@
 	.put = profile_set, \
 }
 
-enum {
-	AW88261_SYNC_START = 0,
-	AW88261_ASYNC_START,
-};
-
 enum aw88261_id {
 	AW88261_CHIP_ID = 0x2113,
 };
@@ -596,7 +591,6 @@ struct aw88261 {
 	struct aw_device *aw_pa;
 	struct mutex lock;
 	struct gpio_desc *reset_gpio;
-	struct delayed_work start_work;
 	struct regmap *regmap;
 	struct aw_container *aw_cfg;
 
-- 
2.53.0

