Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932AC3CE49F
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234647; cv=none; b=YzQKcY/byrKV2napZqvy3RhU28SvCwf5E6+1T4+NSrLU/3yo3kT0jGkI3lMVdlAUJU5kjROiVIigtA5PzDJgi5ZUmhJjzfx36AuCLnXbfdLZUM819MrqlZNp+Q5Jy/52bX3lK4Ic70GCLIIyyisz7GKZpt+q1kP80pXxYiIqsgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234647; c=relaxed/simple;
	bh=c9ud9hMSAb29AtftWqh2+ul+32jl5aytaub0XxdrYew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONNfkjENjVWtQmU6EPIP2ho4VBUrFERrKyuoeIUB9WlgAA9h8ORzO5aYpQ64Ex0jJAZ35z+jgnERfwHn30zxFBxI0T7lmjyZtMFII6hpkLojH6T9PdWsvxE0hzA4h34WdHKwIqjZuPkE8Ym3e8X9rV6CJRLAMcHi+9KRSfD1+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=etF5eNW8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="etF5eNW8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso344357966b.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234644; x=1775839444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqZBtqbXpsXcGM064lzho6jfnaB+LmMlvvuZ2cyPGYA=;
        b=etF5eNW8Jg6DicZwBnIiQit9sNj0mTP2qqkZ9o3YXuaiaV6380KVNJvQCmdEBHsXe8
         ytw3jLrliwUR3/Hlmm+kslPIgZvGe9U2CWHO9YWDYQLRIleJcBBZAj2r3ii00uh5aTB5
         HGNgjGMs9U+izmMAcQRInpSK1OeBIo/hkfj66rwF/qiIGPvqIoVbZ1k1yIdtFgSNw1YC
         V2KKiAFgJHo5x/W6Z+b+YEwkmSjF9CI4IQmzfryfVq4/cMBQHTO70PBFUqvB/BS0qvzl
         YATmZ9GG3I2xx7bgbJ6zaBautH0TLY/2/q4A7gsjvLKPtopV3D78lsUJ8uAFYhmlPK2A
         R7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234644; x=1775839444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqZBtqbXpsXcGM064lzho6jfnaB+LmMlvvuZ2cyPGYA=;
        b=UzvPBCoRRGu5cO+J3nyaJFrOSdR3Hx/Ash4PB55eH8s2ZMowPtirQKlvK3kGclA2En
         TQ+YLKCuy/r+GP7hwTeMkyOEi9aCmCIriZNjC+cp7N2XfpXFVDCLy4KB7R8uAK142TN3
         u/emaOtZQ1v80uhbUR/2Af2K3w9CLX642jhVX6mVwshw1cB9ZWSvGxQkFs42pdr3l2+h
         qnPE4pbQfvH3NPf0PgxEFx/mToNRGVEed256N5cnUqWB88SWXlpMLUpVG9JsHR5zvkFq
         KNIX81e4CLUq8oXxyxMEheB6z8xjvG8/Qjt3U4wSVehGna8il9cn/ppu9bABouNUcVDk
         SB/g==
X-Forwarded-Encrypted: i=1; AJvYcCVD6Sn/4kV+wyhP1eNY2eNxC7awFQz5+EndYOn7ybHka0zQZjaYlQe8iVGqq+o2dRp4QWEE2MPZFxgaag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdX2yII1vr3Gt3rb43+aHYL/+WiQspF5kVDObCS64loR43QTw
	4SGpIUi0Ejt2SEV6UM3cd78MtJaZfxTmS7ehWB3AApoIi9uuaA0C0eNJ+HXSUhQn3fPJhm9B69j
	G6CP2m8I=
X-Gm-Gg: AeBDiesn2OM5R2S/lii1/l5BxXw2nJikoCphokpRTv9xJMgKrxHvh3s7n4E7jIJ5Bso
	98IKbf4B4qdiakQN4Xsg5neNwa4utwqQ4IMshsUj13o0ONjgTvkZTL4Nv7uXhc/yQ9HRTw57D1l
	e/E1VH0F21UuVs73dtQ5f6bRMEyYX/9DklxWEv03gG0phd+ywGBXD07A4VrKcSPd3CYbV4dgzf2
	dOqpfKr7PQWQnN9G24qv2Hd6DHLVdkkTCh7adarzIi4njth9jRDam+QfyyvWF7Ti49Ng3cpTK5c
	BOASse9r7q/gmG9iPXD7Qe8yiIldZpR0PWoEu2rh/S79oO3wnSQYBdGOrLYrkzpFP7Yt7NvJm/J
	/2/Lmdx2DYiB8dh3B81HBlWA5MepDL0v2OHismoJDYSZ17jyxvWmIbKrpj7t8EkqGXVDLCRo/pQ
	BLGUgYAJniDGZTAugXXbDvqv7Db3QQ4Cq+uf1A6RN/EquoefagAS9iYNZX6k5Js3mAX8m6XOmQT
	XbMf1JDZoyiyP2l1pZI5hPQE6aGZqaZTqK+VQ==
X-Received: by 2002:a17:907:3e9f:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b9c66e8f0admr191031366b.0.1775234643574;
        Fri, 03 Apr 2026 09:44:03 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:48 +0200
Subject: [PATCH 2/6] net: ipa: fix event ring index not programmed for IPA
 v5.0+
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-2-01e9e4e03d3e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1402;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=niHCtM98CmwGu9tGXQ1iV8G8OUNt7CyQAHGOy0w2ztg=;
 b=96TjL2CndxnnjLRlVhkbxUrsefNcmkkxoxcUib1ZyUIjblzrlIaLz8j/6EGfZLBeALxZc02AG
 rCUST7ZUZePDpYuFSjdZWozuZDKvMxsQvBPjxu48IEQqCxKA26ZqcEw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Koskovich <akoskovich@pm.me>

For IPA v5.0+, the event ring index field moved from CH_C_CNTXT_0 to
CH_C_CNTXT_1. The v5.0 register definition intended to define this
field in the CH_C_CNTXT_1 fmask array but used the old identifier of
ERINDEX instead of CH_ERINDEX.

Without a valid event ring, GSI channels could never signal transfer
completions. This caused gsi_channel_trans_quiesce() to block
forever in wait_for_completion().

At least for IPA v5.2 this resolves an issue seen where runtime
suspend, system suspend, and remoteproc stop all hanged forever. It
also meant the IPA data path was completely non functional.

Fixes: faf0678ec8a0 ("net: ipa: add IPA v5.0 GSI register definitions")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/reg/gsi_reg-v5.0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/reg/gsi_reg-v5.0.c b/drivers/net/ipa/reg/gsi_reg-v5.0.c
index 3334d8e20ad2..6c4a7fbe4de9 100644
--- a/drivers/net/ipa/reg/gsi_reg-v5.0.c
+++ b/drivers/net/ipa/reg/gsi_reg-v5.0.c
@@ -30,7 +30,7 @@ REG_STRIDE_FIELDS(CH_C_CNTXT_0, ch_c_cntxt_0,
 
 static const u32 reg_ch_c_cntxt_1_fmask[] = {
 	[CH_R_LENGTH]					= GENMASK(23, 0),
-	[ERINDEX]					= GENMASK(31, 24),
+	[CH_ERINDEX]					= GENMASK(31, 24),
 };
 
 REG_STRIDE_FIELDS(CH_C_CNTXT_1, ch_c_cntxt_1,

-- 
2.53.0

