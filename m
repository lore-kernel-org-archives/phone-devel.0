Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174592;
	b=ZZ2zPAoPoQh5uyCgm9uySHs5dq+x1lSYT40kOA7nPu+Heqq1nmUjqMUixKU2CeGtBbry
	 kbYuPbLK/Q4C3e6AsiweuPcRVbL0/GpDdYm7/b7c/U4tniIlXX4gf0qNtg1Gqq7CwuVfB
	 4o1O8T85Ov1uU1WDC8cC1nu3e+0ut/n5g/lT9r0FwSNr+7BkWwWmMitPfZFvmqZ05AClL
	 ZbVoscOV4uJ3Ht3QIFZoQn3ivKuyABfaZR2/dXlJUEgc6YA5DaW32A22zSpeNQ2AyccOZ
	 WnltSDXAWuqOm1V5bFZv0Dm4rrNBXdQ2RvQsMz0vlP5LGSJUltAt/ZIhRKzJLVBsb8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+TwsPHLOwb34n682qcPLKZ3VuEl7ybbeCtYLA4lwg4Q=;
	b=T3yfOH6oOUQcsHKXfQyupkSht7j5TdUFoYdmaql96jdv1GfaknbhHE81w0vJvo0lHETO
	 UOJYIiskxT1K2/o9+vHTX6QmA/ka9D7nBlOUj6632nVR2iw4U6K80fWWfJclzpBE1R/Py
	 fZk6dDgpXP2BNAswnWk8icJInaEuU3ap0oqgdkbXGpMxr8oTA2CSGQXLHigZ7xp6AWJ2E
	 D/saXcK6z0TGxlaShoFQVshrm/T+IRpVS42oMvLnccfVzwd4D5b+KzgEyP9Cq036DM1EE
	 GofUvV6y+PYdkyAkSrKLlXMITjVIba7SF83KvQohxliBOJS+CIu6kj3NJa7FNbMtTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	arc=none smtp.remote-ip=91.218.175.108
Received: from mta0.migadu.com (out-108.mta0.migadu.com [91.218.175.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C411606A322
	for <phone-devel@vger.kernel.org>; Sun,  8 Nov 2026 21:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C411606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rSxBoFd8yi4ayeN+0LcJZMJqNNHJYlNR0g1yFAosofk=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174574; v=1; x=1794779374;
 b=lscAILz8sSDU7lK8pPBRQsgo6WbolR7x27tev+iy8Mh/GZnWsonyzYtN2pn5ozf75Yvjw/Eo
 Bv+5TdLh3DslfXwevo1VlH78QW7gA2SJacTKCjgkTRoWczSSVjsLDkmqCWqDs+qw4CSXLeDBb94
 aDzefsU/vDHPMYTelL5q7VpUS7NolmwkJ6IDvK/vbUNbuKlNsifXJ2+HqIVf8kkzWsymPESVbtT
 rlKpeW8xgXODxFyxf/qx62M6z8QpiQvQqgmDnED5+A1qzXG9R3BqpDQEAgV9THXLm0UgaN/Ounk
 1whp4aSCZI+zNuFT+UgGHLly5RiF4ghJtq4seEWa+PpSw==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de6896dd19b37bbd;
	Sun, 08 Nov 2026 21:49:33 +0000
X-Mizu-Trace-ID: de6896dd19b37bbd
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v4 0/4] leds: aw2013: Add AW2027 support
Date: Sun, 08 Nov 2026 14:49:11 -0700
Message-Id: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQwW7CMAwG4FdBOZPJdmhDd+I9EIc0cSFCNCwpX
 SfUdyftpokDFSfrt5Qv1n8XiaPnJD5XdxG598mHNofNeiXsybRHlt7lLAiohAq0NN8EqOYxDDJ
 yay4sXUNK2aIitKXIT6+RGz/M7P6Q88mnLsSf+Zcep+0bsEcJ0lZGuwbJaMDdNaTuYuKZu5A+Q
 jyKye3p30KAYsGibCFs2db5Tq2LBUs9WUgLlpruMjU2zkEBdfnCGn8LiPx1y3V2fy2M4wNBfud
 kbAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=2493;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=rSxBoFd8yi4ayeN+0LcJZMJqNNHJYlNR0g1yFAosofk=;
 b=B+RflLJkBClvn5XesEBOCHj6bPWkEuzWGRNpZex3RGQd7Y0Zn7LvWvlLiVEe77jR49n5z4Hv9
 TUdEPvQuIM1BW190CCE1m8ev199al2tICtc4lxFaH8dhOxLaIJqqxK9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Refer to PATCH 2 for a full description of the similarities and
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

---
Paul Sajna (4):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Add AW2027 support
      leds: aw2013: Use dev_err_probe
      leds: aw2013: Move assignment of chip->num_leds

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 177 +++++++++++++++++----
 2 files changed, 146 insertions(+), 37 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

