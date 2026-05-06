Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502D3AEF4E
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 20:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100216; cv=none; b=t/QEN+fUmVMfpi3kHsEGX/eEbQkI71QDJp84mb9ehyePrkZg2QoH17ORQf8AMhNlwfHr5bnSe0fi3K06mr0q8WoK3L4roazHMY16WCPptS8yWYP6sXrGsPhzQhfL5j/2+Tx8m6MC80O7wD11UVbChKBBbxc/UmLUt2TcuESuchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100216; c=relaxed/simple;
	bh=mkrWHkKQZ9EXxIWk183p4Zi2Dz7rdySdphV8oksIZCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CikBQNCYzJfkBYYpLMNIEO0ZAHqrLlbwVu82wUGl2Ll47QvlxjEcrH9ElMCa/1tQDYY086V3jxQS2WyXuZcC0eQ4JuqzTc/JIJ9NCIhf/6x6pby0oZhOzaMw2QTS925dJyUOyGPXikcmLVMv4f7afULxfHNCybYMTEMdTsL6wbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TmcAFRI2; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TmcAFRI2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zbFSBdUC9xyHfVZkO54oOJ7WRei6/sQgEnNOLMqrdM=;
	b=TmcAFRI2HTH9Hvp2Df0XjwLHCT+LX00wS/b1+gIm9h0mXUyq6tNUy1Qn1zox1GQOVm0buI
	x0oDjXHDK77BppoMwYApd8siBZNstquFypeL14kgrjrVvbuxi2/RrJ3MqMI5mixUGK2+iv
	qaS0KNngyHhHyArrxF6bXAz3MhL0sDnfv/JKZhJgCgH3h23jqGPjno6iiwxPfp/ZteREs3
	Q5rwGPVJbNWBN1V994KX8Y9CMwclYhzwarNgwt6iyTtmC3wmixVOvl/2tYDKBPUC8f6LyO
	fBmNdlSEz1vUgBIVwzNg8QeGI3ucphh3V3iI6iR7+Hwd/FC3H7tbAJuNajek+g==
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
Subject: [PATCH v2 6/6] ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs
Date: Wed,  6 May 2026 17:33:07 -0300
Message-ID: <20260506204142.659778-7-val@packett.cool>
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

With MI2S and TDM interfaces, multiple codecs typically share one bus.
All codecs on the bus should receive the same format configuration, so
apply the codec_fmt to all of them.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9f0f846a14bb..7bfe6d282231 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -167,7 +167,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	int j;
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -177,7 +178,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -186,7 +188,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -195,7 +198,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -204,7 +208,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SENARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -213,7 +218,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
 				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case PRIMARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -221,7 +227,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -229,7 +236,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -237,7 +245,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -245,7 +254,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		for_each_rtd_codec_dais(rtd, j, codec_dai)
+			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
@@ -253,7 +263,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
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

