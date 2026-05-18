Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B83A7F45
	for <phone-devel@vger.kernel.org>; Mon, 18 May 2026 22:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142199; cv=none; b=CEkxYajUIUMSwCeb2S7Y1c8gZoxaz/SL0HEstY5Agvd72jSrlJCyYqz/m4IlJ3toQF5orbdEXmKXWF/FNbGO53bXIm2lLYwoJfxRyb0IJ1iLgpJOVy5FdKiBxJB3tzbcSAeO69Luf8B4dWl1bzxLSVjf1lVOMfGyEilaw8Q6Xws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142199; c=relaxed/simple;
	bh=77AepnSdVDrmAULp8CAfLBh/vzf1IdV0R8OmQSQknrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T308Y3MyJHRoI8FSxVKWt+7Ilxc3RwH/5X5XpsOt/5BIBf3pMkQP5LXnF4JmLNxDIdSsVr+DbyAW3pw/j73scj6zYRrkZVov/SJ+gpVLal+4YQQB2atVt7QXoDfoRFVZp9YH7zRHLBYgD/STiu+Hc7mqno0RWdJipjXQWTh/ikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=gpV7kJOA; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="gpV7kJOA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779142185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=76Bd/wdL4JdQ+u5XbikHHF/fOqFlkw5mBAvdEfJoM88=;
	b=gpV7kJOA1ULfi7egEESgMfx8ROIADQ4whBUL4w/pJP3PgYqvWJVzBbMyeWBVa6zmChPmJS
	YNYlqyYNLD4cS008z9E3e8gePLGtdI3krMWTvLRDGtOlyGYDyf74M16VHQs/Vh5XdwBc+q
	F3FCWS+rnxk1WMxA2dqHJXEQFMYTbi2jr8Q7bxYF/H5XJgCX0kB5jV1xcW3R7x8yeAKZ8I
	q59qeR7hzsmSDeemsoBFnk9IV7r+7y6P7iqgF81JpN5XWzNYLnd20V+La/XYO1GITaViIm
	AR/jmVxfIGg7Mev9TGOo0Dx8psXHjP43jXtmKLNHNCDwHvDVEcxE8ROB2e6vMw==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: codecs: aw88261: fixes and cleanup
Date: Mon, 18 May 2026 18:44:29 -0300
Message-ID: <20260518220906.347958-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The Awinic smart speaker/amp drivers were merged in a very
"downstream-brained" state, where configuration was only really
determined by the binary "firmware" (register list) file instead
of properly participating in the ASoC system. Let's start
untangling this mess. This series makes aw88261 actually usable
on devices like fairphone-fp5, motorola-dubai and xiaomi-pipa.

v2:
- Add missing sample rates to the switch statement (turns out we do have them)
- Process the conversion from requested values to register ones directly in
  the ASoC ops to make sure EINVAL is returned early, from the right place
- Do not include untested aw88258 fixes.. (why did I think that some support
  for it was already present in the tree?)
- Do include TDM support, logspam reduction, a newly discovered mask fix
- Remove misfeatures inherited from downstream: async start, fade-in/fade-out
  (hopefully this won't be too controversial?)
- Also overhaul volume control to make it actually usable as PlaybackVolume

v1: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/

~val

---

Val Packett (7):
  ASoC: codecs: aw88261: support changing sample rate and bit width
  ASoC: codecs: aw88261: add TDM support
  ASoC: codecs: aw88261: reduce log spam
  ASoC: codecs: aw88261: remove fade in/out on start/stop
  ASoC: codecs: aw88261: remove async start
  ASoC: codecs: aw88261: fix incorrect masks for boost regs
  ASoC: codecs: aw88261: make volume control usable

 sound/soc/codecs/aw88261.c | 612 +++++++++++++++++++------------------
 sound/soc/codecs/aw88261.h | 179 ++++++++++-
 2 files changed, 486 insertions(+), 305 deletions(-)

-- 
2.53.0

