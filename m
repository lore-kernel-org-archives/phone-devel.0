Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8630EF94
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970951; cv=none; b=WTYTk2JMlco6+DhkxPshf/aP6O3ELVRzlLB4Vv1JFJ1Q4TfCSvWNZUqOBdBUBnDpiyO2lYgyBHGDrZSJWAYCaEXiNp1gPvtcuffEXnJ8yNGOabTGnNvSxnldObFXzZnZucO+AfVT9rGej+PdSspW+m2YQbDhRTQuc2le0MSq4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970951; c=relaxed/simple;
	bh=wRc5twflyyFQSILWhyg08ey4btvhfHooe2gCLfKHRmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=omab/SKnHYSIU9qiI72L78gXnoGTrdayKVXWbv67bih10ty63cQcXL3CTV9LF/Ky25bkFzPCJ477kpPm5VfD1qKqVcYIhz+KCTLB+haq6KHGfHEOStMTiNwOu4ZCBojD47+sE1lJrHPGmsIoCN7H7fcimXMgG+e4suVZaUploVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OP9P+Ati; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OP9P+Ati"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so917754466b.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970948; x=1768575748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeSyD6yfhxvpe/Oaa7+xX4FTSI4jf1sOWdVvCt4V298=;
        b=OP9P+AtimVHq0KQKrUZY1RXODjDNWKv9gnhyoHq22h0/RbcnQ7lYEKSIHsKnsxsSKJ
         7NEumAoh5LmuV1xOn0SaSNdsT9dxp8hWBPtVvwxEJeQ08j/I4t8UoPxlpYwC3iep84Fh
         2UhBP5mCt60MzozCdcJm4NHAkEEPum4n6Xkx1bMaRMc8EGZ4DmIn2+ttkftZeJPqdfJD
         7smF5wSLTB61NwDXZPflmDjJRgSzkgVih3ArVT3yYmD91fRsXoFZllUCZKW0wAKadYE+
         PPgWyXJ4+/H2TjwtTAxSlWeVvAP1qR9SYsCbdYywuPkymj78o6u9wKhGPEirXta871IH
         NFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970948; x=1768575748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeSyD6yfhxvpe/Oaa7+xX4FTSI4jf1sOWdVvCt4V298=;
        b=m8b0DqNj1KpvKb3DaXXM4UFOXvsIs0X3jWRGV7VOhlGT9QqZRh0F/tBMRxbaRvZc6h
         8FHhaEKVUyaVpSpesP2HLUj2uTW76sA40R+tWKTMA/CkBWDfK71NTltmWlPFKOckO5Lg
         b/qVAS79Sqr058sw22OSnKLyRtqsACTZ4GhXPT1NBJCL/pKTi9tl3LNKv4dvg5s5EDfw
         CW0tOxYExCDao80KXaQfTE0KddzCis+BnPnY+yEAtgsuPFI/7z647sl6S5lboFG3GInS
         Y1VShjsU2742nLNdbrLyF24697+TpalaEHUHZw5m4WV9uuNa2SWL1TYc/ukKAsVcWkHL
         CYSA==
X-Forwarded-Encrypted: i=1; AJvYcCWvk+n1++uJqxhnrfRSQo7eFzdUrV2i1v2K4Q2Tx4Tyr3e8do0HFvBJCb9S1dAnrXu9kOlOllrQ+dCpow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjIqHApAgstmGFHdHNe/XLu7OMBZ405aMaXt8GxFNNXF5wEqH
	3addPmg6rNq1XlVDdSSAYfql9NS8qKZsOxnHp9JIl7M+fcvDHNzFqSObNvXTgptyGu8=
X-Gm-Gg: AY/fxX6bIxXtzGGo43aH6B74D1eZ29e46fgBJcb/lUbDwCTOSX4uwmEmnaS7su8vbHj
	UuaG3T9uULcM/Xb1ir+FNX/JxP+dzs8/lje0Yiioz5AZRmeDoRNZTErfgP2iuG8oo5B7ovOg3GE
	gb846IS51KIhzmm5A6Co8a3pTeIvM4zSLJd34CQZofu2MW+Q97e2mCxylJ+AS48IicwiDszh8WO
	VNgq9zV4fZ5XkL3zxLrHmQQQe42Qp5P+XpPLjoIo1f8mDBtb0xkV/AA2OmThPFmSRnjXlN3oYJ0
	GNnQczn7+JWXxixWsHSHE6XbjYuaoxZtVS98RxP6F74ZkJGvC0bWjeQBBzjkYNQBNlL0DjFMPDN
	RT73I6Qj/AUhHP56hVUqfyup32BVHp5sVPFkqZf+653si+4xdy+sLuE0Mx0sY3b1vOiKreJkxM9
	oO0v1iaiO3wm1h3JrjX1KVIwwGAMf0Q7LdchojK9HhiZ92mHPOgmYAavTOwKgE/II9
X-Google-Smtp-Source: AGHT+IEjfP6A1CmXs7mnARjKVxJhdK8lh59mDTvHmWizSVj8GLhKK2kEDHpDfzSLw+1QB+x6+N6M7g==
X-Received: by 2002:a17:907:3d4c:b0:b76:bcf5:a388 with SMTP id a640c23a62f3a-b8444fcea01mr1075396966b.50.1767970946131;
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add devicetree support for aw88261 amplifier driver &
 minor cleanup
Date: Fri, 09 Jan 2026 16:02:04 +0100
Message-Id: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwYYWkC/y3MQQ6CMBCF4as0s3aSTk0K5SqGRaWjzoKibVESw
 t1pwOX/kvetkDkJZ+jUCom/kmWKNeiiYHj5+GSUUBuMNlaTduh/bWssYSh4tY0jHYzzxFAP78Q
 PWQ7s1p+d+DNXs5wj3H1mHKZxlNKpyEvBv9tAv207MZajv40AAAA=
X-Change-ID: 20260109-aw88261-dt-367910d29a1e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=592;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wRc5twflyyFQSILWhyg08ey4btvhfHooe2gCLfKHRmw=;
 b=OqOnuhXtyziGYKDoEYnnsH0FVInvK21ffvcVg6UwstKtcIHKnMW+jrM3ZKsOPvuJtLOX9Hyri
 uDiFLAQzxPpBlSHo5kg355FyTfM7cPU9ylO2WEBrcRT1fs2Su1LL/a7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

A series with a small cleanup and then a patch adding devicetree support
for the aw88261 driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
      ASoC: codecs: aw88261: Add devicetree support

 sound/soc/codecs/aw88261.c | 11 +++++++++--
 sound/soc/codecs/aw88261.h |  2 --
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
change-id: 20260109-aw88261-dt-367910d29a1e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

