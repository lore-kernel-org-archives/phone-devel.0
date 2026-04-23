Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE5375F6C
	for <phone-devel@vger.kernel.org>; Thu, 23 Apr 2026 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920989; cv=none; b=Kyg2JzJmtXAe8s5Er/oaC2AyVlPc1sXmhvZzyPY5vDNibyU9X9NXfkC3+6vHYtFyu0gqWqq3NGiWo7SoSpkR69Lbb1FKHkmpIloTUpE7W/KldFGp3oJ/3wQnwzc1BAwICLtKc2lOD22DKlZBfN3Y3QHPptDXBnrnrtjvkPGB8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920989; c=relaxed/simple;
	bh=KK4PCBaRdORX6zmggbvhDPAyBW9xmTKLJ7Lr4HzmAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKghUOzujb/CmM3Db7qVzxUWEbHYETuYTy+cwZK+wqSzokTnWUl4rjVDmmfJETfR6TqjRhgkQm/UOxTtoA+NDF0w2AiNMUGv2EGUndEFIFQAblxPdnn3DTEC029fpi3vh0T2SPPl5zroMULo8Xq1WhSYc5+9APG1idTaMeyF15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WcDSDhwF; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WcDSDhwF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776920986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZApfdz3ALUTL6N7BA3ZFZeFOe0Ov8S9Lcryp9JLM2M=;
	b=WcDSDhwFUzJHDbgNTIpIsBcfDj8w+9BdUrvDUBB+22oajcdqDUvom5f6HGVMe6oHLpSpmA
	4vGovVOxSYymWbZwQJMKNrVgiWTViHgRpn6f4OCKIrdFssFUYwvepczIdt09G8+k9zZ4ct
	NywHR+x7Uy8N7Xr0zOf7tOfOFXfhSrLD9UFe0Px6ORuGCqawpTicH4xvMI0SJlaQlHVhib
	wkMfgAe91tYWNgXlwFavB5suY+wJrag+BCz1G2vhtW9EH6hkyUH5d9VOpW+2UV+Y4GiUhs
	/qyqv4/nTi9Nup41dGjZamxsy/lr3BsTr+31Y6HEE/+oddRMwYydoejv6MKXSg==
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
Subject: [PATCH 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
Date: Thu, 23 Apr 2026 01:41:03 -0300
Message-ID: <20260423050801.210840-5-val@packett.cool>
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

