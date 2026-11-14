Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696941;
	b=TICFjcC6s3bZv8QkePyF9mdQJ7cbqxbg49uAMNr297lYuPdsqrf3a1lJT9b9lgDQYb0c
	 yVM6R4HSgGCBCqg6cF5bjQ4XGSFd4eP6WQthL7PSB7s/XnF5bhqMRGnBEHMumUd8wDTAQ
	 iU32gUTb2lKWHHduZPTQTLoWW27/HbVoJ5gCCv35alIXBwwL+Xpxsw1jnQJ1h4KtvH3OL
	 TffsizOdPs3/EQjGqd2V8jM2UnS/QrQYzeMhgEhxnag+cAqfop6gCkUlhMLp3FI6hN+1F
	 tNw6QZa+9KAPaR61TfdHOuzs9tqjd5kU+ywHc5vW4J6s0mI1QjQspafZS+2JLO8UqZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LiygG2iGiuebZIwuKX8EIYmY8QCLCyZHFTVPiI3pRFA=;
	b=PRw8nKAVJN3ywIx+XnF6LgUAsAkcgJ6GcXrC90LlK/Eprz5h6jspQpm5E8WRuUOLKrYZ
	 DT7aI85ABfJFcna+XTYqtX27qBKVaaBmaJAxsbLevYcovjlZ22A9yrg9Cv421ww4oTUCp
	 ZoZQx/N39u01v/LA4L3QobYFyOaaINIQingnRKQi4dlelld0WF8oQmetpKwfi32MO0I/n
	 CmPdKcRL608Zrftj8gfR8APyys5G9cYdC8GgiyPQIPWl02GUSOEi7i6/oHHiQSQ7Gz/D7
	 XZs5PolxrpIaBR/xvN8CBkG4TpJsb80l1LTCjYINsaRrHKq6tulZLhE6HUfC5poBHMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=SlJydHef;
	arc=none smtp.remote-ip=91.218.175.141
Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0A606A32D
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 22:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF0A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=SlJydHef
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RlekjlGNec4ex5TfjWTalwwAb7hHUJ4s1zUc8nIQObA=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696938; v=1; x=1795301738;
 b=SlJydHefjPULlMRtfV2Y9OgvEOKC0boltfvUN8SL1jMnL22OT8gBP4ib12qvyH1coAwtEw7u
 z4FHz2qhkGdtvkvFx9te5stK5gUAR7nmyAY+E3rP45UZy0sDnrlEmPzSClmnRtsOCxr0fJa6aD9
 CrdeiORhk6rgbHkzwFKNRvmFot7d86XQyVZqHLhoxXpKItJ52eNFMeSc4NffTsVQgb15gUusiM8
 0bN3HGqjLsnrKvwpMO2d/tqQoZADrnsSgifxLZ4z4oQZv+4WdMUw6ojtXmc6f9ozrB7MsS/kH4D
 Fj/tWB6RfRVYdUm0q0HTelK6ehNnYtmPZkLTTYAlfA5gQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf42613200098871;
	Sat, 14 Nov 2026 22:55:37 +0000
X-Mizu-Trace-ID: bf42613200098871
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v7 0/4] leds: aw2013: Add AW2027 support
Date: Sat, 14 Nov 2026 15:55:13 -0700
Message-Id: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43RTU7DMBAF4KtEXmfQzDjOT1fcA7GwnUlroTatH
 UJRlbujBARdYMFqpFl870nvppLEIEntipuKMocUxpPaFU1ZKH+wp71A6NWuUIxcY4cN2DdG0tu
 5XiHKyR4F+oG19qZj8rUqC3WOMoTrxj49l4U6hDSN8X1LmWn9/gHOBAi+s00/ENsG6fE8pulo4
 4tMY3oY416t7szfFiGajMWAQNiKd/3ATWMylr6ziDOWXntZR0Pfo0FXZ6zqxyJsM1YFBC3Xhjs
 n4gxnLHNnZXsZQHDsjWjWtkObser/WDUgsCHxVldonf/FWj5HjnJ5DSlMX0svywfWzblLUAIAA
 A==
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=3953;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RlekjlGNec4ex5TfjWTalwwAb7hHUJ4s1zUc8nIQObA=;
 b=1kZVx1fxp3Ybrg4Y6MEb4jvx48u59wsno7wfj2zGt1Ffs4u6YwjEsnC8h6p4DA1d+LoJUdFs2
 dWmJHCuRGMDB2f1JqjZ6QWpOPYMts8c4EFqRRd3+JxxPpBBpCvpcG/c
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Refer to PATCH 4 for a full description of the similarities and
differences between AW2013 and AW2027.

I'm hoping the sashiko reviews about unbalanced regulators that I was
struggling to fix are covered by
https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
and I can drop my failed attempts to fix them.
Let me know if I misunderstood.

I'll do my best to address all of Sashiko's comments, but it might take
me some time to circle back, don't bother reviewing until I've done
this.

This PATCH resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v7:
- Fix multiple imax setting/regulators per Sashiko
- Small description updates to AW20XX per Heidelberg
- Reorder dev_err_probe commit so that introducing new code using
  dev_err_probe is cleaner
- Simplify dev_err_probe, prevent unneccessary assignment
- Revert early return / else suggested by Heidelberg, Travkin and I both
  prefer else
- Lower Hex
- split c99 for-loops to separate commit
- simplify aw2027_set_local_imax and aw2027_set_global_imax
- Link to v6: https://patch.msgid.link/20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org

Changes in v6:
- Fix the compile error introduced by my unchecked hasty rebase
- Some adjustments per David Heidelberg's comments
- Link to v5: https://patch.msgid.link/20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org

Changes in v5:
- Drop move of chip->num_leds
- Make aw2013_microamp_to_imax more readable
- rebase to next-20261112 for Lee's changes
- Link to v4: https://lore.kernel.org/linux-leds/20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org/

Changes in v4:
- Drop sashiko fixes covered by https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
- Rename the chip id register value to reflect that it covers more chips
  (https://www.awinic.com/en/driver/AW2027DNR/640)
- Address preliminary review comments from Lee Jones
- Link to v3: https://lore.kernel.org/r/20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org

Changes in v3:
- Drop rename
- Capitalize commit subject
- Extra tweaks to cleanup patches (preventing more unbalanced regulator
  stuff)
- Whitespace fiddling
- Link to v2: https://lore.kernel.org/r/20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org

Changes in v2:
- Reduce renames to internal driver scope, to prevent breaking compat
- Address Sashiko Review Comments
- Split renames into a separate commit to make the actual changes easier
to identify
- Change from RFC to PATCH
- Link to v1: https://lore.kernel.org/r/20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Griffin Kroah-Hartman <griffin@kroah.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nikita Travkin <nikitos.tr@gmail.com>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Paul Sajna (4):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Use dev_err_probe
      drivers: leds: aw2013: Leverage C99 for-loops
      leds: aw2013: Add AW2027 support

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 240 ++++++++++++++++-----
 2 files changed, 194 insertions(+), 52 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

