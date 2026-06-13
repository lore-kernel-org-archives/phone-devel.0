Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCF1CD1E4
	for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360470; cv=none; b=QgetsqxXn+lI+AfyHNnk5tedKv0DS1lluljjUiqcKVckVKcnAzOkc+RWMoWnYAM9KBCWZgSRatadwDo+l6xabrmElI/NhjJBvyQRAuXkPuwrNqzKPhy5JpWLqwmOqXo3aLZZMVnQq90EIs4jG5TH4/Q2WV3fSObD18bIS6pfrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360470; c=relaxed/simple;
	bh=4RwIQpnSS540rrz2XwThfQIkCSAIA9Hi6psUTMlB1Vo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PI/da3IZvhP8oSbIYmVyPY1fhBDu5dWFUtYlZgbb3xGm+azYflc6mKX3QvkuBCXTpryszJbMCxCf1UnAZlrE/osS1Eo8AaRoNB5msTYpHVG1wKFw8VYXHLnVEWwlLsis/LRRDneNC1UlZrGaN9XjmIdKFLbXZrLwot8MLlXyU+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJEdfk8d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJEdfk8d"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so1476901f8f.2
        for <phone-devel@vger.kernel.org>; Sat, 13 Jun 2026 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360466; x=1781965266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TU4VglUkVPVW+6N9UdLyGYgN20Fi0sqVSdBe5wTIVLQ=;
        b=dJEdfk8d67237pMb7W3yrtf+pHJQFxxGYko4gyVen+2hqN6MgmOcYWSgppfSqMLn28
         wb0EweESxozNmAHES5kmgLIt6xC295cXZ/btCi2VYG9DlgYEBIwZyr3niZlrlqMH6/Fu
         uuf5Gz57tlj4w9Zb94QU5mq86dFkmrmPSSZvklbp0SvrqZ1DwoiuAOq5HbI21Pzpq4fM
         FywE+qHW0UizgvlvY1/XEguUfsJkpi5iss4k9p3KAPwGamn/vBwiPyvo+9weQ8VOy0Wa
         QWLmIh8s3ukVyiG6D3ywAtlYxFp5BahqUudOpCwD0iyhWj6FJVIT6HSNNENrk1F0A6Lt
         AdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360466; x=1781965266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU4VglUkVPVW+6N9UdLyGYgN20Fi0sqVSdBe5wTIVLQ=;
        b=ATpLuKAcYNIXVDhKicjNCiKlmrgM0AYNpZPlilJt2KV2myMydc5yNa8nfmeyL22mPa
         hzb9Zy/iitKDTuRfRGDtNA6/EVmWdF+f+1avQjWDJW8K6UlAKgYJGwQIRzXWb7YwLHo5
         aF5g3CXpqUibYiEeb/Dk6U4VcqaU2TUQztgTE5ZI4UBU0gSoy7kTxfq0lJ79eMHfidFv
         Zxb7Iu6a0l5/8KAMEw8hrxvT20XakuXVgBh83kr/0kzuuNOTJETtGUzpsTgBV04obAZt
         rqLCQU1lujK6wj8uemf6HzzU+ZDYtntz/5PbhBEQY/LNhImRAqWjFrMyQSSBRCyvtxG/
         PNPw==
X-Forwarded-Encrypted: i=1; AFNElJ8jhWuIqqapixywRvgxCe+ff1U4S6xonUAyswwAME/gEuxeDmlZilNRQqVSRy585TLyT1zfkn4b3pubCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsFLBgtFPUeEue9jPIz9J/ByMNcnJti+gmMFfU99ghzx6ppC+
	3nTnl6a30M2A8jJX85+RIsy0gAB4R4XZmsG6vxmqTzPJkbdk1EkDMysC
X-Gm-Gg: Acq92OGWfME8LN9Is4KxeQdYb6Cxy9EKSu6I14SubhHO3EmB6hZu1Xb77dt9KDPNOJJ
	XcjqHyLctWjZL9/HT4nmEX+uMOfTBQHYFv1GpV0o0XqOAi6dXO6llRQYvcFf4m0mu8mLXLRv83Y
	hrIqiO7eo+4HHpHy8XboPMTo8rcBPNlUljSkvMikIfQHkuF9a6qQCG2iOzHnJvwHUPn4RuwZZNA
	4cCG9WtcN/aU0Tz3PtjMnpaXvoVS+RYV0wkFFY277acOST2PFVeLowf2QdPEm8bOEM4wTsJnS0q
	wPLSPDvrggkGVlJo9BJ4vtIMGL0esA+9ddDfSi0m2KYvBDn+kBbJzFq6Xsq7vBlaW7g2M6zL2j2
	tIRZqaJuH0cBDJGWSf9XnjrMsOeM6L3oVGtk5WJVELlRdVCjcw7Uyo/VffhvLa4F6m+zIX59N8p
	eHUBl2CEo30AVtRl+99eWzLBHCETsADYXDHkaMpipa3kBA49zVglMAJbykEpDor31nnBUpc8lIH
	j8hz9bLuQLxOPdvnuuknK8=
X-Received: by 2002:a5d:5d81:0:b0:43b:5672:efe with SMTP id ffacd0b85a97d-4606da69f80mr10130839f8f.9.1781360466020;
        Sat, 13 Jun 2026 07:21:06 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:05 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH v2 0/3] 88PM886 Vbus regulator support
Date: Sat, 13 Jun 2026 16:20:52 +0200
Message-Id: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OywqDMBREf0XuuikmosSu+h/iwiQ39Qo+SDRox
 X9vtF11eWDmzOzg0RF6eCQ7OAzkaRwiiFsCum2GFzIykUGkokhzXjApp17KggW1eJZjppQ1pVa
 NgViZHFpaL11Vf9kvqkM9n44z0ZKfR7dde4GfuZ9a/KkDZymzQhluTaZ5iU+zdNhTPDUG0vd1e
 0N9HMcHWRAU1MIAAAA=
X-Change-ID: 20260516-88pm886-vbus-5e3bbfd9cbad
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=4RwIQpnSS540rrz2XwThfQIkCSAIA9Hi6psUTMlB1Vo=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wNeHXj86PasNb+Suve9zHOcrVEyPW1Hwc/jh6t5F
 ovPCxWs6ShlYRDjYpAVU2RhXip3iS81fKJDkW0SzBxWJpAhDFycAjCRvkiGX0w15o9MUupK8zd9
 Wtblf+ut7BO1jX8mvlv1M053Xkfa3WuMDEfMtd/EfYhMW+m/1/HOlw/fvd9ve1Cpw5XGGiHekNb
 ozwoA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

Hello,

This series adds support for the USB Vbus regulator found on Marvell's
88PM886 PMIC. The regulator enables USB role switching on boards using
the PMIC.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Initialize battery page after chip ID check
- Clean up includes and variable ordering
- Update trailers
- Link to v1: https://patch.msgid.link/20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz

---
Duje Mihanović (3):
      dt-bindings: mfd: 88pm886: Allow vbus regulator
      mfd: 88pm886: Initialize the battery page
      regulator: 88pm886: Add Vbus regulator

 .../bindings/mfd/marvell,88pm886-a1.yaml           |  2 +-
 drivers/mfd/88pm886.c                              | 21 ++++++++++++++++-
 drivers/regulator/88pm886-regulator.c              | 26 ++++++++++++++++++++++
 include/linux/mfd/88pm886.h                        | 12 ++++++++++
 4 files changed, 59 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260516-88pm886-vbus-5e3bbfd9cbad

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

