Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F13C9EF7
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234645; cv=none; b=JVXL4WQLlVOsBB7u8LBcqpD6ePKi+LNpDfY6CXlOjxBMtSD5OqRBvJmG9p1zyf6LnMDKI8GgsjqJ9Xc1yXvsFqNwS0kaW39fu6G1lAYRTuTbV46tjxVUowyaRlYqoi985lzLlfYw3IfrzvtIKAB2LqHAPtE3l6liTqn8t7yeXE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234645; c=relaxed/simple;
	bh=i4p562E6xl+MsawXqPrNM2npLjWfOncAEU+VEhgYYCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7kLEtaLs/2hTqZMEGCTppYe063liCqJ2CjTkbe1DyHu0v+9QLO+ai9QsashJb8M1aTHrvVVO1bDkhz6GzFMzz/ah5IeAEthjXldfERgf0Y4cKXGyRqVQ1JxqMhbNR/zFqkfYjqAyIgU5N5S5SDk0p+xoRywGamtbZdK8F9WQJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mhVywkwu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mhVywkwu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c04152730so312681066b.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234642; x=1775839442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTjtCff7Q4DiiNPMLHxYW0+3ALVFBVM6wubHOseE9mU=;
        b=mhVywkwuJvhO3WlBYE1/OaMAZo+a//kPHAerR2H7xcZmilHNo1HFI1aL5wsGO1cqt1
         8nu3eZoHOYwNGej3Z/DTHBvDzqA9gU84/jq7TQyPD8/9QEuskruHPVbahFKHRQLyUBBG
         gZga5ZP+WLNa2rrwSKbJwso4fT/zcCC/+5jYvtx9TpETIsZ6gILSXNK2SZmDspAeKBLc
         H0bHMNLiY4rW1rIkFMw+blYwSUiIKhu0D9Fp3IxL4b0o4gbYg61bJKRNxjh90yR3Clw5
         JZBegqsnMrDZzgZJIM/H/KCCEPW7rmI01tc4kcCMHJgTNdWdDqKq6GnqSERy1Hmp5Is3
         qv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234642; x=1775839442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTjtCff7Q4DiiNPMLHxYW0+3ALVFBVM6wubHOseE9mU=;
        b=dTPzzyZ90cyzkSalKcBQx4ShdCl/eNF+AM5xX9hgWO334csxeyAEpavlobyVJ/P24v
         6urAF+WWGQ464rGYUPxVFeB0Rlg7NoI7BqCIMrzgKNZihJGiVbpgJDBunYVwuW+C1hak
         iPvedViYcpPP7/qNKnCAvDAPpYDOAgkZBKK3UtCONdaYBdb9dKnz50huXFG0sdXkV7jM
         +ToZKnD5pkoYv1sXJbyRwQ3q2ByBMamsgcFRkzaVkIl0W5cL6z8M6zb304HabT+4nXIm
         QkzlbMQFFqHemyBRB1JbbyVhLghH1V4wOYHh7FY0woAeOxytWebiRloE3v7GjlZjeAPU
         +VsA==
X-Forwarded-Encrypted: i=1; AJvYcCXKkwloVVrKmC7JUXNF2VKn99CtImB9BfMD134nOIS/PjWmtTJz2pD31x2beXYaua3b3D/ifgA9AWL18w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZckHBzkjyMTZi3OThA8UHjv50+4xDsWBC9mt3A/IvCKwj2v5J
	qdcyyZFWlSixMmsotBj7upDLf2Zl7SYqqHHgxsl5PeAQHXkUf8BuljVma5JiL7BxbP/eU53zuo+
	7MgTRr4U=
X-Gm-Gg: AeBDietX+xK6XSS9i/402KvuXUZLj7Wu7nSVA5rq3rUiLjmEQa/5Y+gyli5FURSI7BF
	1qKhkr08PnrSdizWhRbKiQRoQuSRttAW7gBJTsu+Ro5OSkxfuaduzJLmhp7ax8Q9mLOxofZ5HGD
	yhkWZx12hi792eIKkRSW2rNmyBx7W5cFjflJzCme9QiBrZEGUe/DCloWv7ozQpeF7VmNSdV2+P2
	Pqm6VBA+thOsZcvWw9Ui6um9Xp6iub5qMv1NMuc1AmT2Jgk52I3XETdwyD0RdYSVMeyU4ir/0oi
	5DS1a3WR8c7NTZAVZnCwzOMwghZwNDYowIU+wblA/Mve70Y2wvwwYXDs5ubmtwDuaWzpT1cRS+D
	6LZD0ccDiPkxpiNUs2iOu75dQJ3tbbGq5wL6EBLI2SRU8+Mx7tZ4FCtVQbNsGhTkGM2h+Du0zFD
	pvyU/PN8pV3R/w8F0m4uPojYq/d55aa3JCRC+LroExxeuk+60sH3LOIuyZTM7Qj6L8fKGzn+IVb
	V+zoAbs78xZdJrjVEB02+JDRhP3FF4Hl0GPrg==
X-Received: by 2002:a17:907:c002:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-b9c67951901mr190889766b.32.1775234642271;
        Fri, 03 Apr 2026 09:44:02 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:47 +0200
Subject: [PATCH 1/6] net: ipa: fix GENERIC_CMD register field masks for IPA
 v5.0+
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-1-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1275;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wVWwdatovjkVmj3hE2xttOnjurwQ7/UkaxiXvhYrMnw=;
 b=6f7dlNEqx/WgDEZTogxKVUxQuHWi4Gkbilt5KzzC4a4NlQluDwn1CvyiwdceB4Yn7NRmtQsWP
 oYcEdeFiz8oClMj8bu54iIa6PvIYpJRVe8H7ObjLR1rRgq5uRxrnorj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Koskovich <akoskovich@pm.me>

Fix the field masks to match the hardware layout documented in
downstream GSI (GSI_V3_0_EE_n_GSI_EE_GENERIC_CMD_*).

Notably this fixes a WARN I was seeing when I tried to send "stop"
to the MPSS remoteproc while IPA was up.

Fixes: faf0678ec8a0 ("net: ipa: add IPA v5.0 GSI register definitions")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/reg/gsi_reg-v5.0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/reg/gsi_reg-v5.0.c b/drivers/net/ipa/reg/gsi_reg-v5.0.c
index 36d1e65df71b..3334d8e20ad2 100644
--- a/drivers/net/ipa/reg/gsi_reg-v5.0.c
+++ b/drivers/net/ipa/reg/gsi_reg-v5.0.c
@@ -156,9 +156,10 @@ REG_FIELDS(EV_CH_CMD, ev_ch_cmd, 0x00025010 + 0x12000 * GSI_EE_AP);
 
 static const u32 reg_generic_cmd_fmask[] = {
 	[GENERIC_OPCODE]				= GENMASK(4, 0),
-	[GENERIC_CHID]					= GENMASK(9, 5),
-	[GENERIC_EE]					= GENMASK(13, 10),
-						/* Bits 14-31 reserved */
+	[GENERIC_CHID]					= GENMASK(12, 5),
+	[GENERIC_EE]					= GENMASK(16, 13),
+						/* Bits 17-23 reserved */
+	[GENERIC_PARAMS]				= GENMASK(31, 24),
 };
 
 REG_FIELDS(GENERIC_CMD, generic_cmd, 0x00025018 + 0x12000 * GSI_EE_AP);

-- 
2.53.0

