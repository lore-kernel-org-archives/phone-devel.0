Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A331EB5B
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285139; cv=none; b=G6XyE4zUrGSOL8VtSiZ8FiXbz8BTMYQAp0k7ibNyDVP0gRh64EXKSLAdsts0v+mRx47ZO1YvLD8U/bdyCCtRjerB3a788yFOV9mMMB8zuWm2CWAFrhJtqINAK3TT/nLImSk8M/gF/imTuHhHpUTpWW3ERTfNNHBKAjsnGyRU6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285139; c=relaxed/simple;
	bh=UZYObOCo+4Uc/zazdoJD2WY1/0RSF+UuBPsgZca65/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlp8iAVSUUjY4de1JJWbYZM9a7E48treUIC3IFrjwg6VVl3gFW42B5Qbo4Smq8Wns2wZuvNHX9a3x68Y10t9LyKpXx9XIFWcDssyp7SXbFOGsB/yw5tacA8xeP7iu9zhAFmr+DCqn1eRfyX48UvQ2Pm3np3YfsPbRMKzJ8GaJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jz+rBCHv; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jz+rBCHv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILY7v2SmIZw9ZvvKst2oBdkcdWOxzEcSMApNN4USfk8=;
	b=jz+rBCHvNqWCv6GTD/feeOn+hQoHdzYTTnU0S6uAVNKOj89vp+P1Lgfb8LsgCnvVPbFF6Y
	kqcMozxcdL6o6n1dQDY6iZNfIR9FIUnHBnR78jGY87lXxky93mQazv2xeIx7Sb0uuC2CCc
	MPBbPRiKLh7umSVaMre6w4TigoHZWX2f5ZsNHDDqpxHI5NRI9xxoySwnFyNuKC0wb8bO2V
	AGsu7Bj2I3kzca/a8i61qa4xUy+8jlFiCEPl9UX+fH8PCn0Z+dRrrNiaYcxQkaeSHbm1iv
	Mgk7LFGDgu4TsFdwIyH44Xgf+adrVqDQcU7WZ5hhsufQkrVKv0rbHx23h5PX3w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Date: Mon, 16 Feb 2026 20:25:21 -0300
Message-ID: <20260216233600.13098-5-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The MDSS resets were left undescribed, fix that.

Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 8ae25d51db94..75bd57213079 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -22,6 +22,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	DT_BI_TCXO,
@@ -511,6 +512,10 @@ static struct clk_branch disp_cc_sleep_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6115_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
 	.pd = {
@@ -561,6 +566,8 @@ static const struct qcom_cc_desc disp_cc_sm6115_desc = {
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
+	.resets = disp_cc_sm6115_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6115_resets),
 	.gdscs = disp_cc_sm6115_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6115_gdscs),
 };
-- 
2.52.0

