Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A083D3D01
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347089; cv=none; b=K2TOWaFTCmfrvZFG6e3YyQ83EBOgrmniep13dSC857mwbjA33qebznXE0khHhk7VO1q8jxk63FHZZQLxOvmZpejT7XUHaZetTrX7HDfA88wxTb+37D/Lr/daAPD3BGB7duNSgomgb/2pCYOR/ViUXt1f1IhR+6+i3i+FyyIvdYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347089; c=relaxed/simple;
	bh=onS0/m/vDkiKzWD/tkw4RzM9xpJQaL3JH9xNGGk0fWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnIUJUER29Zu9dM2+NEL/MBDmDEKU9hRlt/zuJx3Erfr4xvpYGs2k7YUHxrkvec2cXd+Fd+teKeLWTFPjoFY9TLX8APFbqEz6Bp3JmOXjGKC816gyyBUcHTp63s2pHAWbyy++rTyrjIiCQVLm/Y9GZx+dOmGVo+ul+/3gWZ3Vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKeS/fIr; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKeS/fIr"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc4425b6bso77304767b3.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347087; x=1776951887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=JKeS/fIrS24+QrCftHVpyQgkwuka/CElhnzLAkzVsAKfs9Rf2S6qUUR6DvQib4H3pE
         hLBcoX1fj2e+uvUp5BZ9NfvB6dEMpNJIpPKbVDlZfOpFEdchbIcrTU6v8hLUBBlmERMh
         5MGE+sfAp5aeFUtlOckadwx6z7kupLtEDsY8qwRJch1fFXJTCvOPgt2PevP7WY7ocHFm
         8EfZh9UfIYtIMdBlCVGaBKzQMf0zVfgGB8GJyUt0adofxIOthHSO1zg5JAW0gZzKnc+E
         mwwcL2J1ytU9j/0nR4j3I9i55HRbDJmRQe954emWkf7jMZsD8STjxVSNqZUvY2H31PsA
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347087; x=1776951887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=lU0v9G5NAF4Yf0qdDga39XayIC3/HaI3rE/6S+W+Wz6z0KFDDXHgk7K6qLmkB0X+KH
         KX3BauFiPNkWb4/VmW8eQoRa04NVkZiwosYbPOc5iGzjTnbMagWgpAQb0xM/Cuald8ni
         IWv0WKupdAvI0bK9Wl19o3rjS0i40lcrrSQUpo4EUVAaGDS39FDPJumtq4CsBckxEkiG
         dy0PziUxVS58+PGdxaAb5YxPgufsxKxrHWTPEeHS5ekRsSbz8y9hyXrozUG7GL/+p6tl
         Mhr56cBYr2T9nbdVhmhG2oGX8vqM+lbJsJxSUw+/C92OroOo+N2NcrMv1cDUmLRcX8Pj
         RMKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ulL8bVLQpTiD6zBtAhIeJ16wJAN3rlAsjG/9rEKTZtT09HEdfSXqcW7gv+9IqPAZri6zGqeJte+Woow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx16MKLwVVKc3qtsoj2ZOl3MVcRjsJ5Ju6WPLjSdf/UelbNePiZ
	LXxn2dAv+qRK6mSJQOVvz5OrTSEi7kvtCJKqljEya6ru65Fqn4cvfygd
X-Gm-Gg: AeBDiesfvE76SQEVKEXtEOotS8Bup6lGTSXJKFiJ9xkGXCTLLbvWN4Ah7s8+uo5y3CN
	UsZRWVZH42fUeCVI4Tz2j52xqv08kFmv+XdmGTBLSN/hGg6/VbhRTlocWTLp4ycjuwANmfY64rO
	4jN2fnGJobq3ePc2aN0Z754fZWhJ9XwvC9HfRKPqRigG0rUnrJ/rUJFA0HR3EaqX+BtqKnEXo4c
	1BptOzSJzrw/8TjO4GiK7P67eT7XPW6nOcav7q/FOVUcEVV0JdZS0KNpbUIy6PyUfDxVc52YQuM
	UziO8A21ehGUPSeQRlmVHKQJKniXpfqo/ZDP7h202GMPDUiU1L3i92qXE7YXbnbzQZ0wVEtH8Sq
	2TF1tTK4r8LL4JHDKRv2b6uXxaRQxUErEFNCtH0VOpnrIQQ/wyTtT65UN54paIT6R9MrtMAkutB
	+zTYsiHQJLIzAbARBNOgcPDbyG3uu1jweg0TTU
X-Received: by 2002:a05:690c:a056:b0:7a0:4146:6ebf with SMTP id 00721157ae682-7af71e48dacmr224335337b3.46.1776347087013;
        Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:55 +0300
Subject: [PATCH RFC 08/10] media: venus: move getting vdec and venc for
 later
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-8-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Call vdec_get and venc_get later in the probe, after core->dev_{dec,enc}
get assigned. This is needed so dev_dec and dev_enc are initialized
when we are calling vdec_get and venc_get, so we can attach core power
domain lists to their devices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.53.0

