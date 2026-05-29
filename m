Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1543C076
	for <phone-devel@vger.kernel.org>; Fri, 29 May 2026 20:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085199; cv=none; b=RrXcWNu1Qi9yqi3ADH+YyxGYQKZ+Fh/FhjckdMJ+nSmQXejQaQZDi4pkTDUA4H8WdJqfth1dix16Uz9I9dEN//mqMwK8z/CmEM75/Ci1cz7IG7Znz5IYmrYlUNdDrsRiBYMpfTI0v5bQDiuhnkmLcPMA00fxqI3sa5iHC1wNPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085199; c=relaxed/simple;
	bh=5CvQFhDhQ1li/v6s97IBZPEd9GeMkqK2YF1lHrzBNTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH/YRuPks2a4K9pkfT7q7dWSAElP+kDpm6yxwLBQhsVYf3zsXUEWmhAztNf/SkZxFKmsKAwLspjMRK0yT8GzbIAJ0C5ffdRJB41MbcZ7QX5X8GTSnkmrR2e0U6iJx9DplJK4/LmfGFBUST9yCaip1OFeQeLgV5j4RyaIsnTGhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WGbSH7HD; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WGbSH7HD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780085195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MARCjR0Y+8edNfhm+8iTKzm22hxVW2+vvTbHgb0X7lg=;
	b=WGbSH7HDaaT2t6NWiVRxZzNufczeHJQErZwol41vd42MbOxyszZgFOdcRemTL7IzCltqCP
	7jsEKIMZ8n37yRHrPm69KaEj8Jre0rdl93UrcfHKujFTPo2LErdWnUgQjS2rMZcLdU3cQw
	ybu5fqGE1iqhIfNV95oNYNDXpt1p8UxHW73nxeHRaztqUUyYwLJQvBHpG+XjECQqWoUEPP
	JKxCR6IlhT/6FzTUPTKov5kply4p1lLm/2VJayNaZl42T7BqpaRcdCC06Ga5CR3a4g+/Yx
	SW2Xs/Uk+7xngk2G6v89Jdgv0U+VzxTUgldZjwaV9G1UFSMK+xjkiuuUGTkNkw==
From: Val Packett <val@packett.cool>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] ASoC: codecs: aw88261: reduce log spam
Date: Fri, 29 May 2026 17:05:10 -0300
Message-ID: <20260529200550.529719-4-val@packett.cool>
In-Reply-To: <20260529200550.529719-1-val@packett.cool>
References: <20260529200550.529719-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This driver would create a wall of logspam during initialization due to
e.g. the PLL not being ready while waiting for it to stabilize. Change
intermediate dev_err() calls to dev_dbg() to reduce the noise.

While here, log the detected chip ID when that check fails.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/aw88261.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index d6a6173d8af4..a20b66239d50 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -153,7 +153,7 @@ static int aw88261_dev_get_iis_status(struct aw_device *aw_dev)
 	if (ret)
 		return ret;
 	if ((reg_val & AW88261_BIT_PLL_CHECK) != AW88261_BIT_PLL_CHECK) {
-		dev_err(aw_dev->dev, "check pll lock fail,reg_val:0x%04x", reg_val);
+		dev_dbg(aw_dev->dev, "check pll lock fail,reg_val:0x%04x", reg_val);
 		return -EINVAL;
 	}
 
@@ -167,7 +167,7 @@ static int aw88261_dev_check_pll(struct aw_device *aw_dev)
 	for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
 		ret = aw88261_dev_get_iis_status(aw_dev);
 		if (ret) {
-			dev_err(aw_dev->dev, "mode1 iis signal check error");
+			dev_dbg(aw_dev->dev, "mode1 iis signal check error");
 			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
 		} else {
 			return ret;
@@ -261,7 +261,7 @@ static int aw88261_dev_check_sysst(struct aw_device *aw_dev)
 		check_val = reg_val & (~AW88261_BIT_SYSST_CHECK_MASK)
 							& AW88261_BIT_SYSST_CHECK;
 		if (check_val != AW88261_BIT_SYSST_CHECK) {
-			dev_err(aw_dev->dev, "check sysst fail, reg_val=0x%04x, check:0x%x",
+			dev_dbg(aw_dev->dev, "check sysst fail, reg_val=0x%04x, check:0x%x",
 				reg_val, AW88261_BIT_SYSST_CHECK);
 			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
 		} else {
@@ -555,7 +555,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	int ret;
 
 	if (aw_dev->status == AW88261_DEV_PW_ON) {
-		dev_info(aw_dev->dev, "already power on");
+		dev_dbg(aw_dev->dev, "already power on");
 		return 0;
 	}
 
@@ -565,7 +565,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 
 	ret = aw88261_dev_configure_syspll(aw88261);
 	if (ret) {
-		dev_err(aw_dev->dev, "pll check failed cannot start");
+		dev_dbg(aw_dev->dev, "pll check failed");
 		goto pll_check_fail;
 	}
 
@@ -576,7 +576,7 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	/* check i2s status */
 	ret = aw88261_dev_check_sysst(aw_dev);
 	if (ret) {
-		dev_err(aw_dev->dev, "sysst check failed");
+		dev_dbg(aw_dev->dev, "sysst check failed");
 		goto sysst_check_fail;
 	}
 
@@ -677,18 +677,22 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
 	for (i = 0; i < AW88261_START_RETRIES; i++) {
 		ret = aw88261_reg_update(aw88261, aw88261->phase_sync);
 		if (ret) {
-			dev_err(aw88261->aw_pa->dev, "fw update failed, cnt:%d\n", i);
+			dev_dbg(aw88261->aw_pa->dev,
+				"aw88261_reg_update failed, cnt:%d, ret:%d\n", i, ret);
 			continue;
 		}
 		ret = aw88261_dev_start(aw88261);
 		if (ret) {
-			dev_err(aw88261->aw_pa->dev, "aw88261 device start failed. retry = %d", i);
+			dev_dbg(aw88261->aw_pa->dev,
+				"aw88261_dev_start failed, cnt:%d, ret:%d\n", i, ret);
 			continue;
 		} else {
-			dev_info(aw88261->aw_pa->dev, "start success\n");
+			dev_dbg(aw88261->aw_pa->dev, "start success\n");
 			break;
 		}
 	}
+	if (ret != 0)
+		dev_err(aw88261->aw_pa->dev, "start failure (%d)\n", ret);
 }
 
 static void aw88261_startup_work(struct work_struct *work)
@@ -1431,7 +1435,7 @@ static int aw88261_init(struct aw88261 *aw88261, struct i2c_client *i2c, struct
 		return ret;
 	}
 	if (chip_id != AW88261_CHIP_ID) {
-		dev_err(&i2c->dev, "unsupported device");
+		dev_err(&i2c->dev, "unsupported device id = %x", chip_id);
 		return -ENXIO;
 	}
 
-- 
2.53.0

