Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484847;
	b=0emaiIXjm4FpfcMQNh7DvYwc9FtbvAJW7lSt27ovYDbbZwHgC09aa+qf1H1U/MX8LQ7m
	 fWdh2FbYX9QZlDdYnuSA1i5tP8v8SDrXlUJtJWgSMPBzEaAzSJT6pqv91mRYNwpN/ASOS
	 ULSNO1rEDdIa+zfTShkjTVAIPaUqAzaWeoHYcZ9/nvgd6oP9B1tm4kgAob2ehHDbcWSfN
	 CvdpmeajeLMTY/b+HzOCOka53VA0c2I5UpwcuRlSbEE+tyIHfCQiXZe9+0y+tFbmrog1v
	 nSBbLeswpTqE0pWyvDPqy6NC8b87PEXNed+7c6lVGW6xINaZslPO8JEoI0rTfmxNwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484847;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yIxpS/nuJ0i6AS7+eZWK91Iqf/SzxpUyTm1wvTNr/u0=;
	b=TRQLZ0Y+mzhdXWVL7bVw4xTgsl1CBwd7ZAVXMeIuUC5cfQOXY3d9IWLXX0/sRw7raixw
	 DatAZO/WW3iy4qfwKnyPqK5aLY46CZzkLuVPMu2NKRDNV4XSuCXkW3NWq3c16wt4KhzHY
	 2qIypoLRltnIcMk4/4XB9V5M8axzkiP7aKP4uhY2RTpRrfK5pTm55iGf3s1jNh/oFloBI
	 yHHsAtsTnPISH6LfTEKIMgySPFOmfAL5VbfflhixMaSXagNUt19xhuCSeVhi+NJBZoJb8
	 ZXH5SdYLJOVUrCJBUEhkEdcCXDT/W65nuhSkCMan4aQ9JAOd8oXcTi4b6ghZpO0dD5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fS8M2vLn;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F724606A31E
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 08:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F724606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=fS8M2vLn
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oOYcLk8SgSFDbJWze+I2ylWBx/emk3yDYK2BxxUumHM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484845; v=1; x=1793089645;
 b=fS8M2vLnm5JXRpF2X4MlviCyLPU8Nxzy6AuKhy/obZNC5zS59PtD+8fNnSGAkqq4KQNHjzyB
 KbTWFwW/725TEDmJMF6RGQZWCs2hrDBmqf3nu1ElubPTyq2a7dJHnBsSTBdvnz0E44mo7Ebw7CG
 OYbDOGqwUeKF+YirVZ9KEtCxRzy3wTVitViakdAu6kyj/RlzjkXYyx6z9KvH0agQQpMCbI57DNG
 Zrbwt9AsDzuj2zvPp4WSUL4g0/z/P1Jjl276hDJZMW810OBtVzdo44EAKjXXIGniX9HX7DQ632Q
 p0lp6KckzXa5m1sRzdU8C01wzXj9uqhRlujY+ahtvJA/Q==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0ee227f5af125605;
	Tue, 20 Oct 2026 08:27:25 +0000
X-Mizu-Trace-ID: 0ee227f5af125605
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug
Date: Tue, 20 Oct 2026 05:26:25 -0300
Message-ID: <20261020082631.1509275-4-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082631.1509275-1-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
device's typec callbacks, which are not synchronized with codec ops, so
a hotplug could be reported before set_jack was called. Though unlikely
to happen in practice, add a check to be safe.

Found by sashiko-bot via review of wcd937x Type-C integration patches.

Cc: stable@vger.kernel.org
Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 850be84d65ce..fd40c1686d66 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
 int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
 {
 
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
 
 int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
 {
-	if (!mbhc || !mbhc->cfg->typec_analog_mux)
+	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
 		return -EINVAL;
 
 	if (mbhc->mbhc_cb->clk_setup)
-- 
2.55.0

