Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BB3CCFD7
	for <phone-devel@vger.kernel.org>; Thu, 23 Apr 2026 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776921008; cv=none; b=TuKlF4I9dHo1fFsDXhsvtU4ydKEm7jzwKGObSw5uujx3FZEuClWFVVhOdWwMeUd3yCUYp4Q2Oo5qymFnxU+XsWko2vkDi3YX7Vbwf0jbP1oNDsBpTQJObPwXtdetplTqUxu0zumAz50rIpH7zd82+rSRt9G1GHu7U+Y0d5fpXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776921008; c=relaxed/simple;
	bh=OlY99gRCdd5x9WMjHA+ibN+2JjyLjohIWqWM8HbFr+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHKg8zFItVXdt5zD0nMbuX1qLNTyKAQo8+dr2iuEdCLoxnZDWOzaHgJbQdxbq6RQ/dijyPG7IYvQbPa1eyXNdZ4DWkzeL1oxkWLGCCWZwgzTZs8J0ogDwQjTM7/U3PP2vt6JPHegUArXmJDCh7avU4Sgc+bgUHRo+6DXDZmU3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=oqmThNId; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="oqmThNId"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776921005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCMXnLkh1m7lCUTps3Ofi8S7MMCahQQbrgJ4E1PAcvQ=;
	b=oqmThNIdIGUuYcCp6H6A2yYdCnvzcSAzw3kbdrmgRTunem+4d2T1h/pdko87ni2Hyf0F1b
	M+3Y9/euNm42Lrp8YOwBzxMj5uY7rxitvpdAHG/wEgaMXKaY7/hdrEwRIya9Y0skMPZ0RL
	iMU7aF6SSAH9MxmtXYFpAUOktg60oEXuSirWR1yaYYJJ8MwORMXHYdRteRoC6Bf/HDkQrW
	gR8Q4gZnXD4mj9RGGSa+C3wp+hWphh33mZOZj5N8jbNR1sCfOXF69G+OZBaAew81VS5yEZ
	F3apud3YgfwOOuLr6TEYd1WwQTrWwugcieO7BIgpZ2r35DsJVBJ7FIKBjIMT9w==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs
Date: Thu, 23 Apr 2026 01:41:06 -0300
Message-ID: <20260423050801.210840-8-val@packett.cool>
In-Reply-To: <20260423050801.210840-2-val@packett.cool>
References: <20260423050801.210840-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

With MI2S and TDM interfaces, multiple codecs typically share one bus.
All codecs on the bus should receive the same format configuration, so
apply the codec_fmt to all of them.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d67b7bd09c94..6e0e3e0ad55f 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -141,7 +141,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	int j;
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -151,7 +152,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -160,7 +162,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -169,7 +172,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -178,7 +182,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SENARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -187,7 +192,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case PRIMARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -195,7 +201,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -203,7 +210,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -211,7 +219,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -219,7 +228,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -227,7 +237,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	default:
 		break;
-- 
2.53.0

