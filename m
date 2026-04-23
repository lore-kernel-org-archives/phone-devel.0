Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF51E0E14
	for <phone-devel@vger.kernel.org>; Thu, 23 Apr 2026 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920997; cv=none; b=i7NfJmW6HR8UP+x9KC8piR1U0YCEh9vdMnMfpHq1Anm32rGzTCZvhOpqo8kD+zLH5Dt0wD9+Qbz6mFQvqXjLYeco7WDcspNJwjhb6lJ5bRdxk3j89h8Pb/0mGA266NPVwmgbCsN9S5GqvRQjkXVgR+G0ngFIWbHtn513QvBi/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920997; c=relaxed/simple;
	bh=a7UPogdHx0uTuy2OsCzLEkJENRdBPtTEH0oDkrvEHyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zk5gyWF/JzJAf4iaHryjMNP8QqqTKhUF8HP3mKuQCswTDFXkfy11RABxOKzAVx5j797ThF1B5aek1jgNxOYIPwFW2ExA2w1duO3Q91S+Hhn5TMIjUioeHeXuEciMmHNvhci81EbEvTEDUBjEq6ucwtrzkDtPIObLCJNvpDCo59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=l0DIAqww; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="l0DIAqww"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776920994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSL7pttxE/JRyeaeRaF62RvxOJmYhiI+wpWXkA20nbI=;
	b=l0DIAqwwyQY36KZQZ5WW/UZDPJlZ9MXFoFHsTH5vIds1lE1Z3mrTafN0plFaIB+9XO8uXt
	gUJKGRkZ0ptQ1XwuVOE0lQXued9P9ZWDZaOz8SBFQOTqwN+UsRgZkBHjaNTljE1ouILgtD
	Sta4B9gQvf6DlPK5Qlty2zYRoMKWfNGdp6LK94iKcBmugS7HM8VLf4GvUI+Mnma34x1gCs
	p4BnUf1B+CSH3icm3+w/cVLuqEUWqY/0/NxNMik89WaN8ZjmEgTUwdYGXeqO2D3Hkq4Hsy
	MvolBddAatscoDTtOr3zr5ZQtBV5K8u+J9g8H1iY20GOTpYYX7evEYe39PGrlg==
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
Subject: [PATCH 4/6] ASoC: qcom: sm8250: add TDM RX support
Date: Thu, 23 Apr 2026 01:41:04 -0300
Message-ID: <20260423050801.210840-6-val@packett.cool>
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

Add support for TDM RX DAIs which are used on some devices to send audio
data to speaker amplifiers.

Signed-off-by: Val Packett <val@packett.cool>
---

This is mostly just based on sdm845.c.
Is SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B correct?
Who actually decides these, or does this file arbitrarily dictate them?

sdm845 also has some snd_soc_dai_set_tdm_slot(codec_dai, ..) calls
with "magic" constants like SPK_TDM_RX_MASK == 0x03 which seem to be
probably specific to the first external codec that was used on an
sdm845 device? So I didn't copy that, but I'm still curious as to
what even that is.

---
 sound/soc/qcom/sm8250.c | 115 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a675913da943..ab1ba44baffb 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -17,6 +17,9 @@
 #include "sdw.h"
 
 #define MI2S_BCLK_RATE		1536000
+#define TDM_BCLK_RATE		6144000
+
+static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 
 struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
@@ -55,6 +58,64 @@ static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
 
 }
 
+static int sm8250_tdm_snd_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret = 0;
+	int channels, slot_width;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		slot_width = 16;
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
+				__func__, params_format(params));
+		return -EINVAL;
+	}
+
+	channels = params_channels(params);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
+				8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+				channels, tdm_slot_offset);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+	} else {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
+				8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
+				tdm_slot_offset, 0, NULL);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+	}
+
+end:
+	return ret;
+}
+
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -120,6 +181,41 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case PRIMARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case SECONDARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case TERTIARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case QUATERNARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case QUINARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
@@ -145,10 +241,29 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
+static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret = 0;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
+		ret = sm8250_tdm_snd_hw_params(substream, params);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = sm8250_snd_hw_free,
+	.hw_params = sm8250_snd_hw_params,
 	.prepare = sm8250_snd_prepare,
 };
 
-- 
2.53.0

