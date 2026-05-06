Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9B3AF65F;
	Wed,  6 May 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100202; cv=none; b=ZDXbvU3p9ChhSQHPSKLm6OzmEDggtRZj+Api5uodXP0Nb2hUCnTCBLYXukfP0wyIIY8C9nBczW4BUCeNGOsk6uUjtGRM3wHlZvp5V6F91QQn+JDZsF58nnWj83mL8p1V/VnMNjVmQyAPT+zTKCQNbQusg25Zt37BO61p20c190I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100202; c=relaxed/simple;
	bh=KK4PCBaRdORX6zmggbvhDPAyBW9xmTKLJ7Lr4HzmAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlJ9zkit7RgXWX0WmC9K9rHYcJUX60ScVNveaCutPbPVNobbiERexLYu+BAGQrHa3aPl3tIp09pUlmDZ79JGcgLASH5/TqlYRiZhHxIhZVvHJnUjdkqC+H0dGCY9KZhnc8sAZWAxBW5+jsf45C+szodN3bwhr6rXZHMT/tONllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=pwSb404N; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="pwSb404N"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZApfdz3ALUTL6N7BA3ZFZeFOe0Ov8S9Lcryp9JLM2M=;
	b=pwSb404Ncyky1c/VDBuTSk1jeQ14hmKYkGvGvd3oP00kD8PBTWx7Xh77OeWDbc7rhKx0g0
	Sv8UctKkMjisAbn3D45ZEbDh2ZBhGhgbqaRTm6pJis3mCmv7N1uuR0NJPHY7mrMHXzhd+O
	1KD7WTch+QWPp/lsuBqY8ce8NMQhMnWR1IF7XR67E/W0AaT+wnD08EWkjKGdqb6P7fDQH9
	4pgCwd537XtBSRRGdVRSR2HsdemYNAoifLhOPCiV0Gm5vDhIRf82pOugGsfoNx2ZPMisM9
	aBgZYoP4PTEJQX37YC+55TCzw3cRLY+5mmtJnxUyD9usj7NM3UGv2xD4Mqi95Q==
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
Subject: [PATCH v2 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
Date: Wed,  6 May 2026 17:33:04 -0300
Message-ID: <20260506204142.659778-4-val@packett.cool>
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

Add support for the SENARY_MI2S_RX DAI which is used on some devices to
send audio data to speaker amplifiers.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..a675913da943 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SENARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

