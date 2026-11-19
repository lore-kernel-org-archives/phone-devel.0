Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795077107;
	b=OaDC1en6jc8Hgck/KqrQpS7f1x5dCoDGXeCIcRsigFw2x2FPPUgfewjGNcBlPltFu+OZ
	 MRIHi9HqnsoWetdwgXet6KARsxk7sNpYAp+tYa/UjyN6ab6BWolBq/jByMmT0/LfgUpiM
	 3OeaFNlwx2hQctu9i8r24ZPaQTIapKxdHjEWRfXs3Ef1ztcA7Gvm5om7m/+i7wGkjZMG0
	 f1pn9f0/iGYNL/IsliU9mEl5vmHSpcxF4A8tSU0Y2uCx6oP5Prwp5DP0lUxypisKcd51R
	 ApGQiAahvhn39w2j09qVF+JcK2cGKaJw26ZOCDYI+KtsNPcieoiZbCerjzCx4zI/nmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077107;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2102FXx31z13J3x9MSIpkKRt8qyZgUBcTWdizNv0+Ek=;
	b=aAG9C/IDols8ZqqRPZUMAjkJh3pTTulQrbhNwZ8/L+AmLwxD2dUGusKrYRoTtzrnOw/z
	 Nf1zOczvguNx4JsH6tOeHMQ3f5RgyqURyTgl7dUn5qrhVrMKzVjx3c1ogWpNaPmYFYvph
	 9/ExL15fkUbZuaEtH/RW+JyRv9U/IRJHmFDrE7OtZCiu57pjLq6dsoT8ol6fbeec3fYhr
	 RgN2yPiNLNvNtsi2C+/5R4a1MFMzwHWApp6H/bOdXv6PA+XW4oH0xC4+SqFu/Bv0O5/Ja
	 vHQTuExFBrSCQkdRdgLGPdiFqbnJf3/OZvQEEgp5KkpsGk20B+7/eFOO6FgE2u7IrTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXq7fu2o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F2606A338;
	Thu, 19 Nov 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXq7fu2o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795077107;
	b=0QxguDqzb5dct5/Ubh5juP87XYdJpdSRQF2c6rlN9YqyMRpmz+dxjDlqSOa/qEHqen2e
	 kD7CNwALbeSwA/lxP+MzKPGMp1AR0E5KuwYErtviqON3GxHTUs/WewN9ffrTQhT/aL06V
	 h50xetnXw2lip1WIBbyLCBkynbZ1ztjGdoS5zTI55TjA5k6+VGjMFm+sin8OYsG488ONi
	 7JICBwvJsHsgxcPGyRWEZNOKxe8hg0VAargdFiAc1G4bavhZyiLVrl1QkCX4b7xIfRh2i
	 +Og+fFvTD+i/wpaB07dlxw1ssv2gLLENG2V/XeLcQ8+f0BqKfBkqkbdK99vdoPczD6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077107;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2102FXx31z13J3x9MSIpkKRt8qyZgUBcTWdizNv0+Ek=;
	b=REX1cjtWX3CrBlJTy/ZkUSXZRalueiGAMPjTfm5TKwbO6neuHouxL9KQVOUmXAAQCZeb
	 6fOgMSYtOHV+2F1/TQy5POAi2SQtgM5g27wmWW2kuUzDfK26t5O8LFfC9gbVu0eonh94W
	 Zfr/NAS1Zh2J4vI7IIz6d3b4pOgilYAauJ3wnQqPG6LiwbWbF6N9hwwujMwKlGrt/6cKR
	 zjlFVf8V2yZWGqFmr2YyWRl1Fl+Duad+ri145fIUlfeFIa6fluPc63AeM3Jv3yJ1AL4Om
	 2cimXI06hAtK7nSQSaGr1eB7tvWEY/jT6MqbFklEgLXlD4Sgpfq6vTQvn9fDBBSGd7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B74A1F000CB;
	Thu, 19 Nov 2026 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077107;
	bh=2102FXx31z13J3x9MSIpkKRt8qyZgUBcTWdizNv0+Ek=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=iXq7fu2o9CzEXWsqYmce2gJ0u0gP9KZOE31GyHC7Sa6/INwG2NAUFp/WkAXJtbB/3
	 uncod1LV55t03LPUZ8klLmq+AiGyP5dxW/+Sd+BFM9SYBErnMVfmt9nsrK7ZhWzoo+
	 HKNsTy7/70Bb8iK3ZhFL+ZbDIDqF0b8RU/USUinBg5slG6LYyBiN9w/pye9zzWlO75
	 E0rlIwf9GETBfHEGFyHCyP1RONtfaHTLYlh5wwhbXjaO8Ylom+6QIdh3+cAtFRYrif
	 otSq1Gwickv9hfQ26PGCRHUd10SF0zaLwEE/o1laR60X9xu7Rtcacx+QgC7M5Rkl6V
	 TUOezuQYXSKew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 725C44B19A;
	Thu, 19 Nov 2026 08:31:46 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v3 0/2] ASoC: Add the NXP TFA9865 amplifier
Date: Thu, 19 Nov 2026 14:01:45 +0530
Message-Id: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQ7CIBAFf6XhLAYopeDJ/zAekC4WE4sBJDZN/
 12oFy/G42zezC4oQnAQ0aFZUIDsovNTgXbXIDPq6QrYDYURI0xQSgXOekq6nJPVSooOSyk7oig
 ozltUrEcA615b8XT+cHxebmBSzdTF6GLyYd5eZlp3v+uZYoJBSksGYwxn/XHWo/d74++o1jP74
 7Pia9Va1QujeK++/XVd39F2l2IAAQAA
X-Change-ID: 20261116-vantage-tfa9865-8885091e9443
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795077105; l=2734;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=SAuP7YfgYJXDpKBvo+qN5QpyZqR/SPWVmvxD2Fy4rBQ=;
 b=3tgadcKcihpP0BgIT0cM6R8z5zLMi7y9KTgJDIP5dqlXMjyzOhOnmhMLpbDes+SMRzEHN7YPI
 74ZS4CNb3W1AnpcS2tMfsato6b+dd2yBql4uNzs9Xo9QP5QurMpAzRb
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The Motorola Signature has two NXP (now Goodix) TFA9865 mono class-D
speaker amplifiers. This series adds the devicetree binding and a driver.

The chip has no DSP and a different register map than the TFA989x parts
of tfa989x.c. The driver applies the initialization sequence for the
device revision, selects the I2S slot feeding the amplifier and powers
the amplifier and its boost converter up and down. The register settings
come from the NXP tfa98xx driver. Only the B0 revision and the 32-bit I2S
slots configured at reset are supported for now.

Tested on a Motorola Signature: with the matching sound card the speaker
and the earpiece play audio. The register cache, rebinding both amplifiers
and switching an amplifier on and off during playback were tested too.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v3:
- Driver: cache the registers (REGCACHE_MAPLE) as suggested by Mark Brown,
  thanks for the review.
  Only the registers the chip changes by itself (SYS_CTRL0 with the
  self-clearing I2CR, the status and interrupt flags, the unlock keys)
  stay volatile. The cache is dropped after the I2CR reset in the
  initialization, so a rebind does not use stale values.
- Link to v2: https://patch.msgid.link/20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com

Changes in v2:
- Binding: drop the redundant sound-name-prefix entry (comes from
  dai-common.yaml).
- Driver: no longer mute/unmute from the trigger callback, the register
  access sleeps. The amplifier is now enabled from mute_stream and a DAPM
  event on the AMPE widget, only while the path is powered and the stream
  is unmuted, so toggling "Amp Switch" during playback keeps it in sync.
- Driver: reset the registers (I2CR) at the start of the initialization,
  so a rebind without a reset GPIO does not find MANSCONF still set.
- Link to v1: https://patch.msgid.link/20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com

---
Venkat Yadlapati (2):
      ASoC: dt-bindings: Add NXP TFA9865 amplifier
      ASoC: codecs: Add NXP TFA9865 amplifier driver

 .../devicetree/bindings/sound/nxp,tfa9865.yaml     |  63 ++++
 MAINTAINERS                                        |   7 +
 sound/soc/codecs/Kconfig                           |  14 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/tfa9865.c                         | 400 +++++++++++++++++++++
 5 files changed, 486 insertions(+)
---
base-commit: 4e019254b80b70f6fb90d17a50f211de1daf7ffe
change-id: 20261116-vantage-tfa9865-8885091e9443

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


