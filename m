Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B2326D65;
	Fri, 29 May 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085187; cv=none; b=o/09HWq8S2G3tccPhpyO1cRKGmEQnbxDPCYMyDlCQsmrW8SugDfFSiu+24rdnJey5ZJS6KUqBH0rBHu22FzpbV4E0SQSsZEf9JK9T4mArr6NqbdBavVurWcSCRpAkMsBwiNf59xiWLJoUE1HJ4hpimwB13YHiqRrxQxbrFxQPZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085187; c=relaxed/simple;
	bh=CIUeZtR9flmQY/Rk2shYwr7gjCwZWoK3WGB9353uXZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyKnp/VHqAei8TUL9poUKqjlAf3BOCAOZ4xsnNLVGpfCs5keCecIR8xYIJK4szTgV/0Cy5rErd/Uyet6x3lp8tJO3dALwgMWo3ojZGOKm4ziCqYUg++Uw6MQ/qYnvD/aVmiQfySMPgp18FdzC8d84f7v4LCfDQ5tLX7gKqClx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=OcSx3las; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="OcSx3las"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rcYy/l6NXcLq2eqDqCytUXXd+j+CJAl6HB+DkxvvhDg=;
	b=OcSx3lasArCugWDw2s6i4zAImr/C2xbw9dSZkMtN5qRCpC7CEBTZz+2+C0REKxXqnje3Ys
	0WzffIoh9KfXT9d/YZ15KWt9Kn+lIGkrIY6grfl8KOkrCdvFj4Fl5YJlMC48eL1C78J5xK
	cW3mYIGkTpMDkxT7kZpnIiCM2Q0DjEActwI6e/2N8f6ula0/mowyyN6iJNx+VmFFWEs5lG
	BRzYigNLXvdEh1O8xLb2xB0bu9rPoXvOqnleNVqa78D8Gq2/L4ztNBw+Qlso+IHeUJbWIk
	LwFXLY3dDrveSc9z7BfGjU0VVH25P43GlXumF/bI2KpOvnInDA/Gf3OIXVJPsA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] ASoC: codecs: aw88261: fixes and cleanup
Date: Fri, 29 May 2026 17:05:07 -0300
Message-ID: <20260529200550.529719-1-val@packett.cool>
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

v3:
- Set default volume to the halfway point
- Restored mute-until-powered-on behavior
- Made TDM slot_width override the hw_params physical_width
- Made set_tdm_slot(0) reset channel mapping to I2S default (L/R == 0/1)
- Pulled T-b tag

v2: https://lore.kernel.org/all/20260518220906.347958-1-val@packett.cool/
v1: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/

Val Packett (7):
  ASoC: codecs: aw88261: support changing sample rate and bit width
  ASoC: codecs: aw88261: add TDM support
  ASoC: codecs: aw88261: reduce log spam
  ASoC: codecs: aw88261: remove fade in/out on start/stop
  ASoC: codecs: aw88261: remove async start
  ASoC: codecs: aw88261: fix incorrect masks for boost regs
  ASoC: codecs: aw88261: make volume control usable

 sound/soc/codecs/aw88261.c | 627 ++++++++++++++++++++-----------------
 sound/soc/codecs/aw88261.h | 185 ++++++++++-
 2 files changed, 516 insertions(+), 296 deletions(-)

-- 
2.53.0

