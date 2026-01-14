Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F4392B8E;
	Wed, 14 Jan 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386808; cv=none; b=LjhAfHDj05QE/8KISf0BS2B2CPr7UwbWl6p+tx1CnPyzlOIpL0b+Rj+MYC4AcOmlhCbZXv99a3L1H9uibe7U9wvsaR7Fj0v4xSpWtd15m5kiXFlSj3IDh60f+43Ubm0eD0N98aMKu6LwTN0yLZZyG/HPyOIv3B8WP5f41qfEEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386808; c=relaxed/simple;
	bh=WPs1qB/0LyCKIIy2QS6lVBV6S74qxzRR/rz1aA0heDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDCuD4KTvmRHepJzRUonI4Czo6gzlBUy3OH0hVgpzHY7d+EwPNv8C1848S0ZA+F2Bann24ckcdi5gBHK0XfFUarHqpiNzuRn4qGVA/+BSnH/ZjAM+hzumPfSAMEcNkbUJX63f2GNC2AsR8K+J15ly4qSOkXtWTZEfHd1mXJnQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qg876WF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qg876WF+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C731C19422;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768386806;
	bh=WPs1qB/0LyCKIIy2QS6lVBV6S74qxzRR/rz1aA0heDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qg876WF+TYfrBW/Rtajo/BeflA5nOvKHgXHW1SZKm4OhoErV7Vqid/Grx9f9P1O4K
	 TcouXg7yXZa3I5VGCflxwcsh1g+YTNswChVIOHPp4fErulLOL2BGX/GZ18qZLmkWgV
	 F6mI/D4SbNVqX3GIyOIBrbgE+mx4+Sencnjb8TANDfTyS3cFXjOgwAq4Jy4qoETsBM
	 svJwP0xzmfaqhUhXSUbxaznD6x48J5jAA3tYOR2cu+Sz5PgS4kn2zbg4edbgfzmwgg
	 b1QeiBrtQrVDck9SrxN/h30Kplo7FtrXTU+HRTbrsUCJFAsQH4bXg4l1coDWauasbc
	 StySVcuBp+2ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDD9D29FE5;
	Wed, 14 Jan 2026 10:33:26 +0000 (UTC)
From: Bharadwaj Raju via B4 Relay <devnull+bharadwaj.raju.machinesoul.in@kernel.org>
Date: Wed, 14 Jan 2026 16:03:25 +0530
Subject: [PATCH v2 2/2] ASoC: codecs: aw88261: use dvdd-supply regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-aw88261-dvdd-v2-2-ef485b82a7a7@machinesoul.in>
References: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
In-Reply-To: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768386804; l=1058;
 i=bharadwaj.raju@machinesoul.in; s=20260111; h=from:subject:message-id;
 bh=5/VP3xlRbiTybkiC7ajPqUVJkHZa2zb+dXom5nXLPzg=;
 b=wKph1TQV7Hhg97we4Q4c6WN7gfcv9MZkCXzjOYMn/AxPgv5/tN4QcXtOZYz4gPW1YNg9cpASw
 e+gi+0xI4MbC6vZhneKxlHJ7R0ei0iT0A8GwykjM8w7nR7g+WX11Mfe
X-Developer-Key: i=bharadwaj.raju@machinesoul.in; a=ed25519;
 pk=0M1a+iMXDqasbx7bQL71NdtuutFXu+lVxsiSnEiyAIg=
X-Endpoint-Received: by B4 Relay for bharadwaj.raju@machinesoul.in/20260111
 with auth_id=598
X-Original-From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Reply-To: bharadwaj.raju@machinesoul.in

From: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>

The AW88261 needs the DVDD pin to be powered on to start up. Get and
enable the dvdd-supply regulator.

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


