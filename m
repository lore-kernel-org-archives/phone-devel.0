Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C687E40800B;
	Fri, 10 Jul 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679310; cv=none; b=C+x0tj9gyI2VQN2D8yTgD65jQoZeT+RaD7ldIY71rNS2bZBT8lSJBc7f+XqQTyR1NqdETOkzP4PnKfUqUKjeJwXeyA3pry607nOOAr6Xu1hJeGKMh9/qRphb+cLylw3KMrmz/rklPBmhrk1SPVG00NX/CnAW23RUeDkic4o9slA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679310; c=relaxed/simple;
	bh=mOV2tzckd0rVyjljkX3ZrGReEaXi1MYOVMs9+Um5Bto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TF1Z6vXutH15BS9341tQIlL2tbkfhzJRUDgVQevp8pfGW/DLerrN6e7iFfFobiKVeJ35UPCPIsouCpJNthIDxOFF2K5HChLtSQ34hYMmgNq+UcZJ5trzJVLxAzhuUrTCpdI62CO95/ICfwA6mykTfMkTkmHPwrbEOV0LVQZA1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VleuwWBO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VleuwWBO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F93C2BCB8;
	Fri, 10 Jul 2026 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783679310;
	bh=mOV2tzckd0rVyjljkX3ZrGReEaXi1MYOVMs9+Um5Bto=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VleuwWBOKNgsUaPP/cjeboj7xDRVNFaTyHUO0t/jSgvmGonDarnFo7nCEqlIqjRjA
	 4D+JXvd4WxS2fQAKm/BGk5KrqPMS5BbmDtHcyxlsRwcXE2fGpQLJvVHPDS+CYPUTAx
	 Qy245vTMs5FtHSnyWp41CMW/pWu/vdHG5kI9BpmGDuaKhFSxVQi8cn4v8ZC37O5RyF
	 BxgmIn3v1Te8rfrWXsJcZhA/QAriI8fpaRi+tgU+ZhCGNZtvZ45acYIpp2F57gPteg
	 NO3rkaHs53KrCbAwhg/hKovL6W086v5R49mORnvYR6jOViWOm8f+gFmzAYCivhw5QT
	 i4nXwYZHekh9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242C0C43458;
	Fri, 10 Jul 2026 10:28:30 +0000 (UTC)
From: Federico Amedeo Izzo via B4 Relay <devnull+federico.izzo.pro@kernel.org>
Date: Fri, 10 Jul 2026 12:28:29 +0200
Subject: [PATCH v2] slimbus: qcom-ngd-ctrl: fix ngd register base address
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Zi2glBX3sOwaGGAmkhxikQh3
 N2CF3D5fn7eWyAQOwpwSRZgmlxwvo+gDglUnelbQldHBiXUWeRC47PyD+zbGplaF0ZitCYQNu6
 NJtO5PBlZpLaAKBiY4rzLb+WPw8veqRo34/boosHzZ69Pcvv9FZokSsya3Ni0aLQS+urm2R8H9
 lCu6/oFEg/iG9UAAAA=
X-Change-ID: 20260709-qcom-ngd-register-base-fix-a59713a184b8
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783679309; l=1720;
 i=federico@izzo.pro; s=20251017; h=from:subject:message-id;
 bh=+vuRfWB5TZ02U83zLp1dfXk7Vc/G5WPRtcOB/wAoh3Q=;
 b=0N3znYgt/Ey7czV5f9j2HziGVCJSAu52iQ0fAv1CAhUsKaYwkodgsS9BeRdAEjMczYzt73ypn
 8rflv6Ol1gSDn8HNrKVmenFd0qUwl6WPTfCiKV20KCavAOkpo0FgCzT
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

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
---
Changes in v2:
- add missing Fixes and S-o-b tags
- Link to v1: https://patch.msgid.link/20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro
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


