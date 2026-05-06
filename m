Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583002E1F06
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778040799; cv=none; b=Ens+zWglb4RzcKsXH/nYf59KQgscetCk936KO9sCY7TY9J0zEmfm+u/mfb2XwF+sjps1TaXUp6lzJ3tOowisHs3qhUfSp8MvRIB9fi8wEDVGpCznanPFuoBU0QQ+FiJTSUU6G9fZqMTeQfb//kpxaW5CEDBzC5pIMpHI/awyKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778040799; c=relaxed/simple;
	bh=frbzxEXgRRlVE51v+aCI98zlf4/cdiVrUDs7Jwkc0KQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gp8m9yT6DKwSTZzEBgTg1D6wQtsNzh4+BoE1zUcL/X6lDykh4a3w5U6O+5Xet90DLcGoY+CNvAxTFKkIK6UJBD5be7iviw/Zmg1+5BPlOxhURKdQ59jYnzYUoBsl9Sx4Maqxvp071U02ewYPmalvQ0N1hPKTBI1ZPuOuPi6PyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=xUvOWaae; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="xUvOWaae"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778040785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cBHmrDBv19QyurC3+jHUVbKKZE2OfTIyANnOpKeAJWo=;
	b=xUvOWaaeiAd8BM4h89r6eIOcG+GMW3d5rX49gC8wHsXfrWg99NpLOGd11kPA21LQ6uL6Fd
	Mf/GW8uo5g5fxy6FUIfIM9PJI3aWjToi1G8PUY1lquwDSYr8xMgRCdR50k3X/3chCSe7X4
	s86321knoLpUh6gMbjr96NyePoTyQfMJCajtG605cmaUb6bNmyG0aAZLPqd8MYzLZS5bwI
	5LpoX+5aUZj8GMfjMSSVNslutubexbGtc/axFzNwzPO8BtkGarIxn4nDB4msNV4T8DpzeL
	55wQGvd2433FVFK8lr+wFyHkuewz+GikC7etCYBKty+9kST66lb+dPwLH0fAEw==
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
Subject: [RFC PATCH] ASoC: soc-core: use the device tree card name as long_name
Date: Wed,  6 May 2026 00:58:55 -0300
Message-ID: <20260506041112.412871-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When setting the model property for the sound card on an OF/DT system,
the expectation is that that model name would be used in the UCM config
path lookup. However, the DT model name was only used as the "short"
name, which gets overriden by the "long" name during loading, and
the "long" name is automatically set based on DMI data if available.
As a result, adding an intermediate bootloader such as U-Boot which
provides DMI data on a device that didn't have it before would break
the UCM config loading by suddenly looking at the "wrong" path.

Fix by assigning the DT model name to the long_name field as well.

Signed-off-by: Val Packett <val@packett.cool>
---

For more context/examples, see:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/work_items/4386

err, for some reason that link requires an account to view right now,
hopefully that's fixed by the time you're reading this. if not, quoting:

> ALSA looks for wrong device name when using U-Boot
> 
> What's the expected behaviour?
>   ALSA finds Fairphone 5.conf
> What's the current behaviour?
>   ALSA looks for fairphone-Fairphone5-.conf, doesn't find it, and results in no audio.

("Fairphone 5.conf" coming from `model = "Fairphone 5";` in .dts)

So it's totally unexpected in the DT world that adding DMI info would
change which UCM path is used.

Now the question is, could this possibly break anything for anyone???..

Qcom laptops do not rely on these model-based paths at all, instead
having custom DMI match `If` conditions inside of "fallback" SoC-wide
UCM .conf files such as:
https://github.com/alsa-project/alsa-ucm-conf/blob/980fb83651e82c3e53d3a0ab7fa9b7d6fc2d809b/ucm2/Qualcomm/x1e80100/x1e80100.conf

So there it shouldn't make a difference. But does *anyone* use DMI-based
soundcard names intentionally on *any* DT platform?


Thanks,
~val

P.S. I don't understand the lifecycle of these strings but it seeeems that
the expectation is that they point to static data so they're never freed?

---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3fecf9fc903c..8456595bb41d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2995,6 +2995,14 @@ int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 		return ret;
 	}
 
+	/*
+	 * When setting the OF property in a device tree, the expectation is
+	 * that the UCM config matching the value would be loaded. However if
+	 * a long_name is set, it would be used in the config path instead, and
+	 * snd_soc_set_dmi_name sets long_name to the DMI name if it's unset.
+	 */
+	card->long_name = card->name;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_card_name);
-- 
2.53.0

