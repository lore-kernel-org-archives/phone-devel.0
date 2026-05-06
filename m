Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B52D3AF669
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100199; cv=none; b=qlnwgP8XTpbAWpZprTYfwqn17BSXIrYtu3mP4Q0+xURLoTrYA5YmMJBGzxNLD3ZMpjm/boVyCnugvXlenB2PX4Zw13RLTDycHlR4r3HW79BiNeNHyp+jAw8xIDe4OyF5DxkUb8fMy7fhpQk+ItHMGMnM5WkZNjHeL5/99R5yK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100199; c=relaxed/simple;
	bh=2yxpfwbmtMhGY7toV/DOGqB0FSWoIMgpc7O5paD+vro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzL4woCfLYt9v5eO8P9J+/OeNAKnSvck7WSZgCKMAghQfzumLwV0Rnfp+ve1kB4Y9LEoO5NvTBhyBPBidvQj9WZh1Z5Myk7TWfhSOY6CUf1jXx5RfhL2ZIglDKU0XMjKqgbfFQktAYzY56qZ5/g7xuP8TMUv/WNj7GQBbHbRFCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=kPerp9wx; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="kPerp9wx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJvn4Kmgr3hYMJPtGfeLpjqkFYR7MaG36asqmMm2Wkg=;
	b=kPerp9wxHVJwxiQAqn6fQ1OIn2j97rvSrgT3dYiymEbjTwaWHB/EGAIN6bTznvfsmeJASy
	Edn7lWOIZLAmbhUL++3zgLTK3mp0xHY6UsY5ydP6j0PJLYw/3cTObQvBAno6o6h5l8rArS
	IlP9W4PwpXRua9rXTj2OsnU/jsscwZNXyA3FS1p0cMHUiglGiNuobIaXQmAMzdjw3OvHKb
	enZSJPEAAMKkHuveQLJxedTKLNboi+nO7roN7MMUPy1jen6fMdhzYOP6V3A5ihPn/Vyr+e
	cdkLl82S4d3WoVtJAiJSUS9mQSXLg1rRsdCBHEKyA9GnLlPdGP2zFIouZTBRKA==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
Date: Wed,  6 May 2026 17:33:03 -0300
Message-ID: <20260506204142.659778-3-val@packett.cool>
In-Reply-To: <20260506204142.659778-1-val@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This commit adds support for senary MI2S mixers.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..55119cc33d95 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -68,6 +68,7 @@
 	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
 	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
 	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
+	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
 	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
 	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
 	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
@@ -145,6 +146,9 @@
 	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
@@ -535,6 +539,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
 static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
 
+static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
+
 static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
 
@@ -777,6 +784,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   quinary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   senary_mi2s_rx_mixer_controls,
+			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   tertiary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
@@ -969,6 +979,7 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
-- 
2.53.0

