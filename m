Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD923B615;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126256; cv=none; b=EA3msha8TCtmMLXahPwz7OLRNB6fo+Jrmecqp1w2RjQa4wkL80PL4FW8mt5pKg9JlMA1Q2sMNC+8/99fR14E/9o99ioykWqZZADzkHq40P4M+jcWcDIinpueGDZMDIkv498H4+oJG66gvwAX4IfaRciR6j7lJJXVWzjAxmY2bbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126256; c=relaxed/simple;
	bh=xsMzQVWynxw6TgWLYUHhNMgavDQjYELzFPG0KOZEjA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Btt1tuUNODudRzKqVBevwwoROV+Nr0VU1jvnRb2IGB6N7pMPZgs7TQyi/0V9zf0Xbp4jS0gjmBiVkps3GtQIbYG0ej1V5wgUJtlkTZ+i6sIUnFTLuz3St9Q3IQ0dy0v3I9XTB7N/FNSUkX/VnJ5UhR0z4+Ocmuna0TQPOa6xA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MugEV5Zl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MugEV5Zl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58171C19423;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768126256;
	bh=xsMzQVWynxw6TgWLYUHhNMgavDQjYELzFPG0KOZEjA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MugEV5ZlssyFwevOsfriuHOM0Dr12YnG1k8f9wrgYcWbbJ3wKZI+An8iSPwfLikcQ
	 Sam1fUaOLvjNU2gRRNhy+y9yX3ZRu5Gew4GjXeph7WEudsvhLpXgyEk2a8olKhibZH
	 djLACUI+mBoWSMCOp13LTJBRYVQh6RnBbRsX8OGXfIid8FZu1bEh5sli/rtjPi15sS
	 Mz/+xS23LVke4QWKmHoNrs2D75WDJ6iOn9wAF9FLyOd+ecOmyRp8jpenMOh+IK2aBb
	 K2zhDUPhIxX+MF/D83agzAMkD02LJyKbAR8htpNPzFOY8B7sm7Pc4etA4IMATC/LV6
	 9a1PWmgL/7Bpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517ACD2502E;
	Sun, 11 Jan 2026 10:10:56 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Date: Sun, 11 Jan 2026 15:40:30 +0530
Subject: [PATCH 1/2] ASoC: codecs: aw88261: use dvdd-supply regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-aw88261-dvdd-v1-1-83fa0850d561@machinesoul.in>
References: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
In-Reply-To: <20260111-aw88261-dvdd-v1-0-83fa0850d561@machinesoul.in>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768126255; l=992;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=xIr52IlUNDq+dta2pfCJcyJY6ZnUYlCMSdXp4Olf60M=;
 b=c1yMno2pfazzXCrs++QFgsrEiPgRWjMBn823hwA8g5YITANQ61vSxsKmiEK9oZuFnk+sBgohN
 F79ExVHv0h3DJ88wuzxAfddpBnKtU9x12W9FulbKM25UYH/N3Qm3ZrU
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>

Enable the dvdd regulator on startup.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
---
 sound/soc/codecs/aw88261.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 6bd6e7ffd1aa..9a2d167cf809 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include "aw88261.h"
 #include "aw88395/aw88395_data_type.h"
@@ -1295,6 +1296,10 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 	unsigned int chip_id;
 	int ret;
 
+	ret = devm_regulator_get_enable(&i2c->dev, "dvdd");
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to enable dvdd supply\n");
+
 	/* read chip id */
 	ret = regmap_read(regmap, AW88261_ID_REG, &chip_id);
 	if (ret) {

-- 
2.43.0


