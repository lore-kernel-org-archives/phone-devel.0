Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB16381AF;
	Sun, 18 Jan 2026 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764629; cv=none; b=nSrHXlqQ/sXPrA0l6iagbMZB8xATYhP9hR3F0DRnkXQXdU93lVCGaL6lb06iEy/UxYNM1nuFN75mgA2BlrggSAt2CFjqOii2lSLBNyXHNNaTKgQwqE3mA7216poq+JsLzeaOZ9I2tEM0OcOkQ2+UjZbXkiQn4UYwN/U4yDQkeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764629; c=relaxed/simple;
	bh=w9QYyTcwAe2ka3aFlyovTt5OeIMXcVESE/SndY73rWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AtYGtc6MefktKlXSv98tWwXGycXfW4vOsXwE+BdmoysHoB+6X3neGiiMVvGvdPxe9ZzTvGHeTL0HWDXqDayZQZ/RPd1JOY1eQIWOIi9ISAEQUxaSbu04dMVl9phh7szGYkU/WYeZnA9mvxFxi9Bwujz6zAOD7zDpokeIYgUlvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ3KEvcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ3KEvcy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E22B9C116D0;
	Sun, 18 Jan 2026 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764628;
	bh=w9QYyTcwAe2ka3aFlyovTt5OeIMXcVESE/SndY73rWA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fQ3KEvcyJwUylutPPZGSxLuI+S80CsKK4AHBvgU7on07vuDujgAEJnUXD/3EBM4Q0
	 +q6Yx0rOaytQvWXjc4sHSMxaxslrLIsQ9Zxlms9qgn2T381qraqCJKocAqr0q/rzT8
	 IpWRE2eiJpZs1jgxMIKAAFn1EUAEkDfH3YxvRugKAhJf7uIHBiFa0v6mUI57M8cXX2
	 +LpUWSyAAfy/EGOnhSA7CUpJr18geFYjyCRAxiKDbtJeiVnBC328EXP0kcvfBalG6l
	 psrsTyiHfn4nokLkoPykfwXHpMu0LqzRxeu8iQdHAKA8l0lOYUUfaP50quobqA01Of
	 tdfIfxT2lgOfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E6CC98315;
	Sun, 18 Jan 2026 19:30:28 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Date: Mon, 19 Jan 2026 01:00:22 +0530
Subject: [PATCH RFC] ASoC: codecs: aw88261: Implement renaming of controls
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-aw88261-rename-v1-1-d4236055315f@machinesoul.in>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBOaiaS6SrSwHGsWWShUEN49a
 fkW/7+QOAonGNQLkS9JcoQCrBQsmw0ra3HFQDWZGtFoe3cdGdSRg91Zo6PWsltm3zdQojOyl+c
 fjlPOH6L4GVdgAAAA
X-Change-ID: 20260116-aw88261-rename-1d25aedcbf93
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 bhushan.shah@machinesoul.in, luca.weiss@fairphone.com, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768764627; l=7728;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=iwqJTkyzWCExGcOWGxSpKnKqIADpvM0STYKVbaSzEYg=;
 b=WnJ04zXcF2EAQkj1cso2NrDqU7bWbBF8Wf1PhPAwcPEM2kWAkxHmFVKzEZatMnmeXFkTb715J
 N8imOqC7x+/Bbk6WfUIWNpZJ37ujckhyEu15Pw2o4zpZMwyzmgEGj7h
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>

When multiple aw88261 amps are present in a system, they cannot be
enabled together since the names of the DAIs, kcontrols, DAPM widgets,
and DAPM routes conflict unless they are dynamically renamed to include
the channel number as a suffix.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
---
When multiple aw88261 amps for different channels are present, their 
controls, widgets, and component names are the same and hence conflict.

Rename these to include the channel as a differentiating suffix.

This patch is an RFC for now because while this is the approach taken 
in the downstream driver, I'm unsure if this is the best approach.
Especially because other codec drivers don't seem to do this, generally.
---
 sound/soc/codecs/aw88261.c | 157 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 148 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 36ee4f7c3d0a..9a2d167cf809 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1130,9 +1130,24 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 	return ret;
 }
 
+static int aw88261_append_channel_suffix(const char *format, const char **name,
+					 struct aw88261 *aw88261)
+{
+	char buf[64];
+
+	snprintf(buf, sizeof(buf), format, *name, aw88261->aw_pa->channel);
+	(*name) = devm_kstrdup(aw88261->aw_pa->dev, buf, GFP_KERNEL);
+	if (!(*name))
+		return -ENOMEM;
+	return 0;
+}
+
 static int aw88261_codec_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_widget *dapm_widgets = NULL;
+	struct snd_soc_dapm_route *audio_map = NULL;
+	struct snd_kcontrol_new *controls = NULL;
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1143,20 +1158,110 @@ static int aw88261_codec_probe(struct snd_soc_component *component)
 		return dev_err_probe(aw88261->aw_pa->dev, ret,
 				"aw88261_request_firmware_file failed\n");
 
+	/* rename dapm widgets to avoid clash between left and right amps */
+	dapm_widgets = devm_kzalloc(aw88261->aw_pa->dev,
+				    sizeof(struct snd_soc_dapm_widget) *
+					    ARRAY_SIZE(aw88261_dapm_widgets),
+				    GFP_KERNEL);
+	if (!dapm_widgets)
+		return dev_err_probe(
+			aw88261->aw_pa->dev, -ENOMEM,
+			"could not allocate memory for dapm widgets\n");
+
+	memcpy(dapm_widgets, aw88261_dapm_widgets,
+	       sizeof(struct snd_soc_dapm_widget) *
+		       ARRAY_SIZE(aw88261_dapm_widgets));
+
+	for (int i = 0; i < ARRAY_SIZE(aw88261_dapm_widgets); i++) {
+		if (dapm_widgets[i].name) {
+			ret = aw88261_append_channel_suffix(
+				"%s_%d", &dapm_widgets[i].name, aw88261);
+			if (ret)
+				return dev_err_probe(
+					aw88261->aw_pa->dev, ret,
+					"could not change widget name\n");
+		}
+		if (dapm_widgets[i].sname) {
+			ret = aw88261_append_channel_suffix(
+				"%s_%d", &dapm_widgets[i].sname, aw88261);
+			if (ret)
+				return dev_err_probe(
+					aw88261->aw_pa->dev, ret,
+					"could not change widget sname\n");
+		}
+	}
+
 	/* add widgets */
-	ret = snd_soc_dapm_new_controls(dapm, aw88261_dapm_widgets,
-							ARRAY_SIZE(aw88261_dapm_widgets));
+	ret = snd_soc_dapm_new_controls(dapm, dapm_widgets,
+					ARRAY_SIZE(aw88261_dapm_widgets));
 	if (ret)
 		return ret;
 
+	/* rename dapm routes to avoid clash between left and right amps */
+	audio_map = devm_kzalloc(aw88261->aw_pa->dev,
+				 sizeof(struct snd_soc_dapm_route) *
+					 ARRAY_SIZE(aw88261_audio_map),
+				 GFP_KERNEL);
+	if (!audio_map)
+		return dev_err_probe(
+			aw88261->aw_pa->dev, -ENOMEM,
+			"could not allocate memory for dapm routes\n");
+
+	memcpy(audio_map, aw88261_audio_map,
+	       sizeof(struct snd_soc_dapm_route) *
+		       ARRAY_SIZE(aw88261_audio_map));
+
+	for (int i = 0; i < ARRAY_SIZE(aw88261_audio_map); i++) {
+		if (audio_map[i].sink) {
+			ret = aw88261_append_channel_suffix(
+				"%s_%d", &audio_map[i].sink, aw88261);
+			if (ret)
+				return dev_err_probe(
+					aw88261->aw_pa->dev, ret,
+					"could not change route sink\n");
+		}
+		if (audio_map[i].source) {
+			ret = aw88261_append_channel_suffix(
+				"%s_%d", &audio_map[i].source, aw88261);
+			if (ret)
+				return dev_err_probe(
+					aw88261->aw_pa->dev, ret,
+					"could not change route source\n");
+		}
+	}
+
 	/* add route */
-	ret = snd_soc_dapm_add_routes(dapm, aw88261_audio_map,
-							ARRAY_SIZE(aw88261_audio_map));
+	ret = snd_soc_dapm_add_routes(dapm, audio_map,
+				      ARRAY_SIZE(aw88261_audio_map));
 	if (ret)
 		return ret;
 
-	ret = snd_soc_add_component_controls(component, aw88261_controls,
-							ARRAY_SIZE(aw88261_controls));
+	/* rename kcontrols to avoid clash between left and right amps */
+	controls = devm_kzalloc(aw88261->aw_pa->dev,
+				sizeof(struct snd_kcontrol_new) *
+					ARRAY_SIZE(aw88261_controls),
+				GFP_KERNEL);
+	if (!controls)
+		return dev_err_probe(
+			aw88261->aw_pa->dev, -ENOMEM,
+			"could not allocate memory for kcontrols\n");
+
+	memcpy(controls, aw88261_controls,
+	       sizeof(struct snd_kcontrol_new) * ARRAY_SIZE(aw88261_controls));
+
+	for (int i = 0; i < ARRAY_SIZE(aw88261_controls); i++) {
+		if (controls[i].name) {
+			ret = aw88261_append_channel_suffix(
+				"%s %d", &controls[i].name, aw88261);
+			if (ret)
+				return dev_err_probe(
+					aw88261->aw_pa->dev, ret,
+					"could not change kcontrol name\n");
+		}
+	}
+
+	ret = snd_soc_add_component_controls(component, controls,
+					     ARRAY_SIZE(aw88261_controls));
 
 	return ret;
 }
@@ -1234,6 +1339,7 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 static int aw88261_i2c_probe(struct i2c_client *i2c)
 {
 	struct aw88261 *aw88261;
+	struct snd_soc_dai_driver *dai = NULL;
 	int ret;
 
 	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
@@ -1259,9 +1365,42 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	ret = devm_snd_soc_register_component(&i2c->dev,
-			&soc_codec_dev_aw88261,
-			aw88261_dai, ARRAY_SIZE(aw88261_dai));
+	/* rename dai drivers to avoid clashes between left and right amps */
+	dai = devm_kzalloc(aw88261->aw_pa->dev,
+			   sizeof(struct snd_soc_dai_driver) *
+				   ARRAY_SIZE(aw88261_dai),
+			   GFP_KERNEL);
+	if (!dai)
+		return dev_err_probe(&i2c->dev, -ENOMEM,
+				     "could not allocate memory for dai\n");
+
+	memcpy(dai, aw88261_dai,
+	       sizeof(struct snd_soc_dai_driver) * ARRAY_SIZE(aw88261_dai));
+
+	for (int i = 0; i < ARRAY_SIZE(aw88261_dai); i++) {
+		ret = aw88261_append_channel_suffix("%s-%d", &dai[i].name,
+						    aw88261);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "could not change dai name\n");
+
+		ret = aw88261_append_channel_suffix(
+			"%s_%d", &dai[i].playback.stream_name, aw88261);
+		if (ret)
+			return dev_err_probe(
+				&i2c->dev, ret,
+				"could not change dai playback name\n");
+
+		ret = aw88261_append_channel_suffix(
+			"%s-%d", &dai[i].capture.stream_name, aw88261);
+		if (ret)
+			return dev_err_probe(
+				&i2c->dev, ret,
+				"could not change dai capture name\n");
+	}
+
+	ret = devm_snd_soc_register_component(&i2c->dev, &soc_codec_dev_aw88261,
+					      dai, ARRAY_SIZE(aw88261_dai));
 	if (ret)
 		dev_err(&i2c->dev, "failed to register aw88261: %d", ret);
 

---
base-commit: 65af168f341f34ac12f878d7b7f8326df7921190
change-id: 20260116-aw88261-rename-1d25aedcbf93

Best regards,
-- 
Bharadwaj Raju <bharadwaj.raju@machinesoul.in>


