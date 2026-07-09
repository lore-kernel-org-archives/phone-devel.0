Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5339E19A;
	Thu,  9 Jul 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616416; cv=none; b=VlsuCKtZa2ZEqQNe35jE+yLP5U5+p0vl2/9JJ/a/oN7K/1JvWp1QkvkPbmjcPzK0L7cq+P0Jd3mJHlXLDWLc9mLqMWEhL9Ac/2WdStCO+xO0PYR1Om7O/pO4MMGn2C02X38HX42VM+cuv3NJ4FDwUab9dnFBiS+W3DK5ZsUOQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616416; c=relaxed/simple;
	bh=BgOB4cA8VuQ/dZ/q/j/sqfbK5UXDzkPMDIFs+OghEXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CpspIsBLhholBL+rdFjX5A4ta2jtrx9YWY6FPcWmcg7hoNWTkJ26Szd3BQTUoE4gw5eeCyDFsgimbgJOy36Pyg3dNxvw6EbbFRidEwX47naxll91TLSwIPdy4QhgVBcasTWRgHkpgcAu6wLfBQtAyQpxcjcv20guaXIGRcCJ3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA6KugSv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA6KugSv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD88EC2BCC6;
	Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783616415;
	bh=BgOB4cA8VuQ/dZ/q/j/sqfbK5UXDzkPMDIFs+OghEXs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CA6KugSvuBiMMvCTNT+U5g/sSPhmtle69wQhaiev2x/1qrq+5UOKL29C7WglUxzpE
	 URXKx7uYkPDoQchilFZ2KpiTF0hSw6RaCTScqB8q1N8yHbiZfYMfSYXnihG05K+KRL
	 PRcjiv0UzgUvs/FsVZ4elZmchEgBvb3w/MpX3TMzd1eDMdDEcJg+yYRmBeO6psBPtz
	 qSYzjDCopmEAJ2fXN1Q/flht1nsiD/Hm3jab0HuczHFGz7J9+BdXel63KIJzZATA3i
	 ooncOiQ2M8i+sAWeJXWC6HanlikCVMrBoWzyMVr7wEJ58WDLTkEc9oz2sO5KXwl0VM
	 6IWnIre8e+FIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F95C44501;
	Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
From: Federico Amedeo Izzo via B4 Relay <devnull+federico.izzo.pro@kernel.org>
Date: Thu, 09 Jul 2026 19:00:10 +0200
Subject: [PATCH] slimbus: qcom-ngd-ctrl: fix ngd register base address
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJiyjgVYyLtox1TCwyg4SEc
 HcqLN9f/AWUhEnhViwgNLFynzLsqYDwcikScpcNpSmvpjYtDqH/YIodCkXWkQS9U8Inz+gubW3
 PzjaVbyAPvkI57/P747D+/JvC+D/Cum5SVOQHfgAAAA==
X-Change-ID: 20260709-qcom-ngd-register-base-fix-a59713a184b8
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783616414; l=1498;
 i=federico@izzo.pro; s=20251017; h=from:subject:message-id;
 bh=YJ5NoHF16uL+S0+ruF7CdiW1W1Lj7X20ZzLrfsWs2uc=;
 b=6GKaN8cIpOR7P8+3A1ZUNjECNDVngPPRIiPIxLZutcAZeSce1HTeKWXEVgcnXYLH/hxn4qBbg
 QcvpdMOTAjfA5cvKg83OeN5nGnFp480VGzyArEMjuTzRhtT5iQzGZbf
X-Developer-Key: i=federico@izzo.pro; a=ed25519;
 pk=XfmNfpH48k8jLbId5NKrp0yoKoFb/uLjr97qIxBImBw=
X-Endpoint-Received: by B4 Relay for federico@izzo.pro/20251017 with
 auth_id=544
X-Original-From: Federico Amedeo Izzo <federico@izzo.pro>
Reply-To: federico@izzo.pro

From: Federico Amedeo Izzo <federico@izzo.pro>

The slimbus controller register base was calculated using the
controller ID and the register size, producing wrong results for ID > 1.

The expression reduces to ngd->base = ctrl->base for controller with ID = 1;
but for ID > 1 the other factors produce a wrong base address.
This bug caused a crash while trying to bring-up the secondary
slimbus controller (ID = 3) on oneplus-enchilada with sdm845.

In practice, the correct base address for each slimbus controller can be
obtained from the device-tree, so there is no need for further
calculations.

This was validated by reading the version register from the WCN3990 slim
interface on oneplus-enchilada.

---
Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 80877e951849..91932f8d021b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1547,8 +1547,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->base = ctrl->base + ngd->id * data->offset +
-					(ngd->id - 1) * data->size;
+		ngd->base = ctrl->base + data->offset;
 
 		return 0;
 	}

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-qcom-ngd-register-base-fix-a59713a184b8

Best regards,
--  
Federico Amedeo Izzo <federico@izzo.pro>


