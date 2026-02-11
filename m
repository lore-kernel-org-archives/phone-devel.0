Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF0367F4A
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805671; cv=none; b=m9l0xIE5Z8yjwJ7BghJL5lAcblEJatdrZiWzqfkDqOzl9VKi8bOcgnJ3Y+U5o9xIU7iNDVaLiJKT+llBw0krtT14mOLhHHJK9a86FKyzbsRSeBm1aRVT/fVmWZo71zchPbN1Nx4OuYAGTEcaBSikIsN18JcFkTrQNnPD1kogdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805671; c=relaxed/simple;
	bh=EEdEa3IUnYRnCSJujp56yp6HpXcw4IsB31pVJk5oyWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWo2ZhqJWJtIGEc7GrmUiTRe+tw/Zbxp8oorE5V36SwJaXImStTwQ21DD3p9LPto0QxLImNzFM+1KxyygEhhwrSk/jaerb7VwHaeYjX4H4Lk7/uz7HrL7+3xP2gJ/+uX/JQ+5NyWuVQFXFxKHFODFRsCD7q35G5NGqfw2tG3n/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eBNWvaPj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eBNWvaPj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so263522066b.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 02:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805668; x=1771410468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roAcgFRbH54UQCdhIFxSyx+KQ1p/KfSb2O/TanFU0qU=;
        b=eBNWvaPjb0JiecfddRXAc7G5d3raSV7PeD98Gyn2iVple2RkA/GQQcXYinN9U3ZK60
         uH26uaBXPUTT5LLUa3sKELJpA70xqTSgp5MgiGXd/Jf7BFrtmVTspBdASVlvJ7TzqBw4
         QtP4pgFD7pPsXn0GPkkyKbenHKzjKZ4Yhzd7wNKyfrrfFJyMpb/jsbvyGC9zWKprlwK+
         qG7fvrNPFV6aFuBALLokaZ01ighXCBnMilUGcXcGFg/FAs6BQeNbK9+tkhqB1a4Nj98+
         zZqlRx3uHQEEHwFzhepX850Qv1qVnZKpOZD5hCs7Wvav9RiiSfsplVW9XuRNwzdAnEWt
         aloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805668; x=1771410468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roAcgFRbH54UQCdhIFxSyx+KQ1p/KfSb2O/TanFU0qU=;
        b=arHjIFHa0WOSXRauJiMk78dyDIM91uWe46HPhBrSlRVYn+Sf+7+HgzuaqhxLutGNIp
         K0LiUqJkK80Lpu3atUWzzAg0fZPmxfwlZkfRY0531Q+16P/EyNNAbgHExsggzBxG3eA9
         Qq6pN6Aop8hDwKx+2c9UWFTRFibyclfnOi5p3VNYNMGaoy0/Yz3106XYnxHVE1YEoxyT
         l3Eh4mHpjk4aYUJ9J4mSG0LgKEL1EJbnemejz4HXnCNj8atX8RRiqVNqzZLf5deHjPgu
         JEseD0WR3h+T4FJAw94kUwlPvDiOpIU6rVn5sKhKpxQOeQx8lL9Q9y2ZE6PIVk4taaw9
         mQLA==
X-Forwarded-Encrypted: i=1; AJvYcCVbRmo/6xTlLgRCJ89a7UKU6QPRJNyAee7mZMgEzz5t+wiBidPiyG7FWpAtBbQvajHgQKEt4w1TY4VUcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/17MOCyTFIx1N00F2hkQu7Tnr+PGf+Xo1/Yl7bnZDnYpsRqM
	U2OAB8bISRjZvxxVD/n7pZPEy3cAXrcrp9c/OVgYlYLfwQUhG1vtI/bStkCgxfjVP1FJR84QYYp
	DVTsM
X-Gm-Gg: AZuq6aJ3EZeinBAXL3TnLPHxdXwMmmmZ+yMuk68XcDsz6QKa72DkW8iJQArUJMtN9Bd
	jCPZg1UAW2hmBE4xWn6hicxp6uyYHoZzOxnugPrrUVd2Rn5o02Zy6SlMwPF9VEynQIrFOc96yJ7
	BdzF14aZf9jzh+PrawEKhAxw18HWXplObY2pNB2Twh5iKPjqWkmienfk5DIduM59idifRbGBScL
	LjPh7W77qTo6wRXlLiLj7511fHv247U47czfHP+Ikmxb527wsbIkG4g2Qbu0cEbsco1dFwjUMXV
	sknYyZSfqDq5mGi7vZCCxSRHk4a727jw72mMKCzqo9j41/sxHM9KDZ7H8GNYOonqOBfe7CAbjB9
	nMdkGmiWD1n74/6SXzLY6fV2y7qTFwMXXoE2rpMJVrAKuK5QeET/BFV5svRTCQ1+0vJBbfeU+yk
	l82e8qQ1S+0xhnYjO23+4MUPvyLLdbWcaZjKWwjPeNoZwo43gJNGyizgViU6nzVtMa2GjDvWxRG
	V/z
X-Received: by 2002:a17:907:2da3:b0:b87:117f:b6f0 with SMTP id a640c23a62f3a-b8edf34b385mr1105176666b.30.1770805668021;
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:47 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:32 +0100
Subject: [PATCH 1/3] ASoC: codecs: aw88261: Fix erroneous bitmask logic in
 Awinic init
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-1-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=1451;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=O64Bv8tsAMjygJxOqAvbghMEW/OID2nPg5aDiw2JAmo=;
 b=l0mAytX0jWY9agCYFNdGfdJiZxt8eXnq5o9t+chjtb0Ha4Ns2Dqtmh2hsvZEVeTEU5UJMmnhX
 Uf2FjeO+lv4CgGRjzILPv7NFFMjpNQgRuysz98NogelOko4HSWnqU15
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>

The aw88261_dev_reg_update() function sets the Awinic registers in a
rather nonuniform way:
  - most registers get directly overwritten from the firmware blob
  - but a handful of them need more delicate logic to preserve
    some bits from their current value, according to a register-
    specific mask
For the latter, the logic is basically
       NEW = (OLD & MASK) | (VAL & ~MASK)
However, the ~MASK value is hand-computed, and in the specific case
of the SYSCTRL register, in a buggy way.
This patch restores the proper ~MASK value.

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
---
 sound/soc/codecs/aw88261.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 29b3fc8a1ea4..43c03d3cb252 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -424,9 +424,10 @@ static int aw88261_dev_reg_update(struct aw88261 *aw88261,
 			if (ret)
 				break;
 
+			/* keep all three bits from current hw status */
 			read_val &= (~AW88261_AMPPD_MASK) | (~AW88261_PWDN_MASK) |
 								(~AW88261_HMUTE_MASK);
-			reg_val &= (AW88261_AMPPD_MASK | AW88261_PWDN_MASK | AW88261_HMUTE_MASK);
+			reg_val &= (AW88261_AMPPD_MASK & AW88261_PWDN_MASK & AW88261_HMUTE_MASK);
 			reg_val |= read_val;
 
 			/* enable uls hmute */

-- 
2.53.0

