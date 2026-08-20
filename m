Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D4432BFB;
	Thu, 20 Aug 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226261; cv=none; b=YCAtgHvXR0rz4RSnlgmQmtBJlFBPTEVpKMrmGKVRhZzeIrokvdfdu7npqlGz7T8Sk23H/v/baRgnouBN4sS8akF4//7yEfP1EGMN6yeNTSjegGxOFnB731hwYhncGZwkYPbwJ3W3fr32tk10ThT0GSsTTpgz1mgdKkUGf40rubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226261; c=relaxed/simple;
	bh=KjTtbbfsLy/iJ+qLZJii9LRytjpzuRysJfBf56rAyzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t9TZYGY4b6Yea3ET7Q61CduZAq3Nzbqs/U9a7PZtqupqf68tFP3XhtAnE6Mu/zJx8t0NEIf8wxwX6wUlJPvDZ9+NQoO6Z8rAdZn19MT6SJyAN/8ulSY8cDkRJIOtIbaa6kAyT/R6tDF4LJHfDiRTqDMFmtViYpxQ4UN7Rsafyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYLFNorz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYLFNorz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBAFCC2BCF4;
	Thu, 20 Aug 2026 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787226260;
	bh=KjTtbbfsLy/iJ+qLZJii9LRytjpzuRysJfBf56rAyzo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZYLFNorz6RYWnAtT6al1+BPccvTs5jf6W3XxOT+AdO6mEbVnu8LKXAQB4JfLTjKZ/
	 cvT9Qb3xZ/QKS6DDpeBcQT4lxBC/IWQ5/6VYW351Rfl0PkCJjgRU0+9DZeixZIVGn3
	 JqK8G2I1g51ns71m9t+lIIb6z/tHs5cNQI/kHpr6CLyaH1liCiNLdMSRge+3uX2aqM
	 CVVEBprtiUsHcJ01URfaffqmdjU9mqAXWLL8c/Jm4AUzHdSUyHQRjL8kw/tbleTkJ4
	 WCOYR2Q69zxj3IzC8XF55kLORMvtJJ+vOlxiDlkGDh9DkdcdqwOoWjWCMbKOpGJtFB
	 nXi0TJbQo3rcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B0C5DF87;
	Thu, 20 Aug 2026 11:44:20 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+neko.altlinux.org@kernel.org>
Date: Thu, 20 Aug 2026 14:44:10 +0300
Subject: [PATCH] usb: typec: mux: fsa4480: wait after enabling supply
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fsa4480-wait-for-power-v1-1-d13aa1bfac51@altlinux.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yTogQrmJczE8rZcGQFsGEc
 HdHXX6L9w4wUiGDoTlAaROTMldcLw2kMcxPQsnV4J2/ud47ZAtt2zvcg6zIRXEpOyl2zDllHyn
 GBDVelFjev/H98be94kRp/d7gPD8AZg6qegAAAA==
X-Change-ID: 20260820-fsa4480-wait-for-power-7ffdcd2bebbc
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 danila@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Vasiliy Doylov <neko@altlinux.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=neko@altlinux.org;
 h=from:subject:message-id;
 bh=K2ZEjaY7duFaOOqp6tQTqAMIYPK+WD+zGvjwrwwoMyI=;
 b=owEBiQJ2/ZANAwAIARqnoh2z/c/oAcsmYgBqhuiT0/Dgmzq1Fe2TFKLAibHgogrbkEn5+cxJm
 n3wZlxCmICJAk8EAAEIADkWIQSoUhUyqEiYsiHywZ4ap6Ids/3P6AUCaobokxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQGqeiHbP9z+hEJhAAk9At4iF1jISeCzTS5EhH1PSi5P4RZsP
 hgqTspW5YIzuN4nx1iW/jdWdV/G3vzyzZqj/b04qATcQOmOzmWcoyeL1fLyiB3eqxw5t1pXFlJT
 6XP7ndKRhWNxyBs+WeZjLRmi6xg4kTYxSbi53qWsKbLJCO1z6cxhLny2boAyUSEbKWBlf47BuHM
 GqFQjt2y1B/d67R74Iq+2Xu95TdX7UPZ0NU8gQWtWUSiYC5uH47MIgZLf17DNrLAcvZ4rJG9694
 Eyin76uyKJFzIt8WdX8mxsA3y95GgAeW+K4F8FPP/zQw4xG4fig3ZUdd552X93hwhJrBMCZCJDS
 NUiZPiAPu9YwOo/72YonTUOcF1qbA/uGQM7qW3vGbt7rSMeeKMTPYjSx7IVh31qcAZDM3jcY+if
 grxj2rf9CBWHk2tbvFqV4IgKP2yp/LGv+yE6L7rsMMuRkzKovk5IKFZod0a6yS90Vdhx5jJcSyN
 4F/VVNRQjWXNmfzlt2JNqk07vKEJ/NoxtFSUdAyPFZ/HTTUwXXzDTDape8ryHS9OiV7bhqSkiIo
 is8PS+FI0yV3g7rfok3vPV1bsIO4HTsjHpvMI7b5xZgCbRmKP221cErlTS8I8689Cbc4whMkkpp
 YEAAT4FI6utbwr1UotRSrh1VkFIFIikqLEeXjfQ6vqBOHTcAOTY8=
X-Developer-Key: i=neko@altlinux.org; a=openpgp;
 fpr=A8521532A84898B221F2C19E1AA7A21DB3FDCFE8
X-Endpoint-Received: by B4 Relay for neko@altlinux.org/default with
 auth_id=966
X-Original-From: Vasiliy Doylov <neko@altlinux.org>
Reply-To: neko@altlinux.org

From: Vasiliy Doylov <neko@altlinux.org>

Add a 200 ms delay after enabling the optional vcc regulator in the
FSA4480 probe function. On some platforms (nothing-spacewar) the supply
needs time to stabilize before the chip is ready to respond to I2C reads.
Without this delay the initial DEVICE_ID read fails with -ENODEV.

Tested on: Nothing Phone (1) "sm7325-nothing-spacewar"

Signed-off-by: Vasiliy Doylov <neko@altlinux.org>
---
Add a 200 ms delay after enabling the optional vcc regulator in the
FSA4480 probe function. On some platforms (nothing-spacewar)
the supply needs time to stabilize before the chip is ready to respond
to I2C reads. Without this delay the initial DEVICE_ID read
intermittently fails with -ENODEV, preventing the driver from binding.
---
 drivers/usb/typec/mux/fsa4480.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..4dab12c2b9d7 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -278,6 +278,8 @@ static int fsa4480_probe(struct i2c_client *client)
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "Failed to get regulator\n");
 
+	fsleep(200000);
+
 	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
 	if (ret)
 		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260820-fsa4480-wait-for-power-7ffdcd2bebbc

Best regards,
--  
Vasiliy Doylov <neko@altlinux.org>


