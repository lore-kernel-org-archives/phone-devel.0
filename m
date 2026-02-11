Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0691314A80
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809415; cv=none; b=DGb/qpD8kjeKvO8gntFbl3LuJd+fkZeyFyfHJTgYiA/Oc709YOa3FeGMF+oKBmtBWftJLmdN2GC45rb8ATrluvXuivX1miLHlvSBIozdz+lEm2PNsKZ0uEBZYkyy1xJT1yL87SmMgxjB2DHC1dOZ/64ZqQ6bqJwzggTXYqc7X3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809415; c=relaxed/simple;
	bh=JydT74Ik20zhf7j+53D/IEutWhUVbmqSkEHShdtGWkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OL0U7dqrTjr73SL6ukXBDuzuwFtctRk+YMcnjeISLfA+bn1YNEm5Wxwb0TSLmddg/CrUvgl1gCoJklczyD34pae1a2vMQ6+/X3VHC7m453RqJr2QGqQ1tOhpY9W1d4O4KCUKq1+9tLTrvsFm4qNdpmOzhOmp99bLK4Se4tjgfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1yQOk0s0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1yQOk0s0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so336299266b.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770809412; x=1771414212; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3tM0LL3TR4HqHxF8JKfN9gElsIHEa+EJ7h4mR4mWc8=;
        b=1yQOk0s0I571PCVOY8cn8CfFb51cX70iuSkTYPEypWGdT6EhjtqeGg0uQXhPIXFtGi
         0ARRd0uNQ+3VTcvCPxlbWU8OmzfLa1clpS2DhTEacDeOXjGhu4KaW4PEYPfh8ygCMSkb
         J5TXK4vkIwJivsDhAyrpChSTwCiskgg3pwGnPamcjYwG81iEAmi5n8++/JfSxl6zYDAc
         B5Nl4f9jdlwRXhCV4KsItg13bfFQGAUJ8IDAhG5GH22UFXwmM1GilFaDntFs0IjQxFce
         8Vn8WhonmO1TmryDq/aadbaG4WxksadAmld6dzWz7zgcHrJBaJQaqYc7RJqlhLMne1RQ
         j6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809412; x=1771414212;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3tM0LL3TR4HqHxF8JKfN9gElsIHEa+EJ7h4mR4mWc8=;
        b=q1ol1zDfGXJ0YpnnPd3U38Gmkk7iPx7P5MmIv7V7yXsk1CA9sjq6wkJugeXJpfKOZ0
         B+GbSlmmWDpJ1JXm10uBcAzJQg/e9qCooQnpqQbrBfy8nrAAY4oHj9wzQ1Hvou+X63TK
         8R/sJEQzjbDund5oXYa+8v+yYw/Gy64cCSkOzR//3PcEe143HuVI2xeQ1siKrEs3NJWW
         N9iyvpK/3EPIv+qUsVCDND1ZDHv/UqNd1IsXImftNOQLgaiAgYPcF1meI/Us+XIfRfG6
         yK2hZX9B8nbMUUAkVXNR/yV73I/hVSM5CdzmwUxVVSGYWNHm6xDiur/gBVG71OTrXwMb
         YrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaf5/M3H2TS0iU8bCdfQcCZc2dF+axQeJmoJLGidZq6NPURHBBS6aXsV1GffEqKZFccLaFEeo+oSyCQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9Jndc3q6tM5tAkrM0pY8fe6+zRARRj6TH20OvXn1/FOQ8JHa
	EQYVayvB1gZ3dPb2XMRUZWWdSPqewxnSAskPNqoIvaku/gdYg5NpFFhHBm00uNobJbk=
X-Gm-Gg: AZuq6aKeA3KXTfo+2tQTTvkORjqkuMS9I0ktUbYs2q4KJHPj6hc2XcbbhRgUVDS08F7
	CzBBZ4g1stEPBc4LqIJkJ2usNi/Vp0TQBMIglVQqARlVaUzMWR/1gRGwVcekbZqaBNZlxcQ4ukl
	e57RNwO6ZCSSJHuDwgaEB9rddydk9VMwToWb5QpBOjpe0RBQQuE8EcUaZoGs+Wcd84WZUAYxOr9
	yoVVRKgVGbQmxpWYjrskTt97t59Qvzr/qVlP0nnUrl0x/GonPF5fjEo6yEnlIUdxnhJ9qOTDIho
	Qub4v5ZAr6C6sVuz/keD6PYVmjcv8xHjH7CNbQdk7Soo63j2wGTYRu8L/WP+pdOmiFMqndhxVd/
	AVmn1Z9sQGWD9vhBPQ3YzHuytBMEsUxWlcQe8lVKxLPmMcwp5sOFL6CE+1FmMoOYUIn6aj005HM
	BHMN8zzT1z6h2i9NR7inB4RHelYRlmdA9hPB/B6+w4eLxR4CyBt4T29NLsy9pDHFAFMO5eB1XLM
	7mXH4/hSkMLfjE=
X-Received: by 2002:a17:907:3d16:b0:b88:510a:59b3 with SMTP id a640c23a62f3a-b8edf40a6a6mr1078241766b.48.1770809412028;
        Wed, 11 Feb 2026 03:30:12 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm5827766b.19.2026.02.11.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:30:11 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 12:30:10 +0100
Subject: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAxA4atI1hNIA/7gVWQW1UbNwuo0jCji3
 S0uv8V7F5gkFYO2uCDJrqZrzHCfAobZx0lQQzYwcUXsHFoMaEvDJeHvr9GnExdlQ24olFVNPXm
 BXG9JRj3ec/e97weut9DYaQAAAA==
X-Change-ID: 20260211-snd-sm8250-quinary-mi2s-280d5670b0ae
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770809411; l=1126;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JydT74Ik20zhf7j+53D/IEutWhUVbmqSkEHShdtGWkE=;
 b=ix9w6XYmpDNWd5a+88QxR/nsD/I3Xxh8ndtsxAiOEhnOiN/Mvjw/zRGx6lKQVcfpjRz0jJyO8
 y6CPsM2F+j0CqL9L0X9dJvGuBceeihilY7kU6Y0hafUF/S0oEkwWX96
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the QUINARY_MI2S_RX which is used on some devices to
send audio data to speaker amplifiers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 05a8b04e50e0..f193d0ba63d0 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -104,6 +104,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case QUINARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}

---
base-commit: 1a2a7222c84a6954dc411caced820dfd6b991ff4
change-id: 20260211-snd-sm8250-quinary-mi2s-280d5670b0ae

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

