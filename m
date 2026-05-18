Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F53AC0E7;
	Mon, 18 May 2026 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142207; cv=none; b=VXb7byGWIZ9k3yWG8fPYW0O1LMO1EFApuyES74KDWyxACxTOdMuXaIaLD/WTTatrDnzF+zK9zSzv34HAuomobWgm8L4HfM8kVdpfdT5qqVJ0IOsuOFJ5H0R6MJTpeZyBoMjvPbJUrUW5QOr82oXmYpHOjahFi30IKNoPspm40fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142207; c=relaxed/simple;
	bh=URmp26tKBGoiicxLrMXpHPTiImn6hJvImXigNcRJes4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI9VOn97RRbB7PgVUXB6M3lyKjYPpYQZLebGVALGhP8qmsmWdAD4VISkDHrmmKplO4N14qZ/8osE00yn3SOEVgLv7NJJnvIV2O1boPlVcXlokIwLfLUdMLsxC44/aRu5BcHQsWYWy/tEejVdmFw92P2NfOxdN2Tkn6iHzgVgCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ZrJAXo9w; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ZrJAXo9w"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3K4qR9C35aVhEtDaP0TWG4lhSCAS1YIunpYZOMyKOHw=;
	b=ZrJAXo9wIvPAuFTTtDxsedeif5y655fPDRNNuTt3FkNRwR+tn3Yx8YVQCqG/WBhcQV+BOz
	5UFv84kHepcYehZ5RIjVKIK5KF8I6E5eheJtZRMN8IiybiBzphHkcNRCJ4qSND/98+/+cc
	9kzMsVWX+yWuvAfmuc+ojs4RN5nKaxlhlAzpSo7YQVVqgCDeX3TTL8kol8HYYEDZ6PgKfv
	cbCl2fI+2r59s+41wt0Yiyd57F9ku/wlvOdtlr7rfxIgS8JyKeiXVacIxgX1OBFOT2ztM5
	Rmj7lIWP0R/iTANwWHMBtLKWSZylLKHSTYvotwtW5ZNe7CBiL9vMNNtWgLSITQ==
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
Subject: [PATCH v2 5/7] ASoC: codecs: aw88261: remove async start
Date: Mon, 18 May 2026 18:44:34 -0300
Message-ID: <20260518220906.347958-6-val@packett.cool>
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

Codec drivers are not supposed to do anything like this. The result was
that the first second or so of playback was essentially inaudible, and
very short alert sounds could be missed entirely. Let's not do this.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 33 ++++-----------------------------
 sound/soc/codecs/aw88261.h |  6 ------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index ba2a0b0fc296..e0644fb445e5 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -649,17 +649,7 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
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
@@ -667,12 +657,7 @@ static void aw88261_start(struct aw88261 *aw88261, bool sync_start)
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
@@ -970,7 +955,7 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 
 	if (aw88261->aw_pa->status) {
 		aw88261_dev_stop(aw88261->aw_pa);
-		aw88261_start(aw88261, AW88261_SYNC_START);
+		aw88261_start(aw88261);
 	}
 
 	mutex_unlock(&aw88261->lock);
@@ -1032,7 +1017,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	mutex_lock(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		aw88261_start(aw88261, AW88261_ASYNC_START);
+		aw88261_start(aw88261);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		aw88261_dev_stop(aw88261->aw_pa);
@@ -1192,8 +1177,6 @@ static int aw88261_codec_probe(struct snd_soc_component *component)
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	INIT_DELAYED_WORK(&aw88261->start_work, aw88261_startup_work);
-
 	ret = aw88261_request_firmware_file(aw88261);
 	if (ret)
 		return dev_err_probe(aw88261->aw_pa->dev, ret,
@@ -1217,16 +1200,8 @@ static int aw88261_codec_probe(struct snd_soc_component *component)
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
index 12c98f01fcfe..1b1beba6a26b 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -555,11 +555,6 @@
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
@@ -594,7 +589,6 @@ struct aw88261 {
 	struct aw_device *aw_pa;
 	struct mutex lock;
 	struct gpio_desc *reset_gpio;
-	struct delayed_work start_work;
 	struct regmap *regmap;
 	struct aw_container *aw_cfg;
 
-- 
2.53.0

