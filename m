Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049F3E9583
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312766; cv=none; b=GNJCHHMhFtMPXRIYHCdFfZLklZx+vn4slFMMBkJCPZq3JhfTrXmxQptY5Q0fC7YszIchBbecS13ZRbOb56jaEq+cTotB/8Tqp008+7PhO3WvdMgNQmjFt+AyahTNyyvDmHuFl09Xm+RQPXsryDlPdipscg3utA4oqKij0x0fZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312766; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FncI9GjUBQnMGNrUIuDo61BMLKnPQ/dI9AOMo43sQd7kseXEisa0ypyk6ZIozhpZucvKnjxb9CSE4QjcO1MEbknilYbMihXIMMPIzJjkSOgQjwb6tw8Pm2x5lO7+nEIp5ZlfZJnAwbIy1aVO9VOdiXyLe72cHvJ3EofYDePXGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSx7iiWK; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSx7iiWK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79cd8f8e261so67571977b3.3
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312764; x=1777917564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=cSx7iiWKBRV1o1T2hhJCmhJtMMEVYuyO6T9HCFCREQm8gDem0cC4ZUqFTQcnafFlln
         kLocccXlCoQLdySM9b9/w+cHgLXvyXq8pu9p0wzXvZ64tkdjqvnCAMuhged6e1e6s6u0
         jnRqrSmImNU2fY+yZOx2L2btwZfzrBFDSyA5t4rigEMFu89red/G1YZgBWx+YHNGj4nw
         InrgiZPjQ+8Vj390CYPXRREa6BYJlyLsTOLgBEGwbfNiQEaknNdk8pZnE7uSL86XCX0g
         OhD3wfuuLtJunir3TJ53djWKdTEcD+PR1fmHQFpCJSfbTdB2p56LYc6v+TFoXvEk1EtT
         SRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312764; x=1777917564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=keY5pGWOVJ8cBPkE+LVW2oMdspVaM0nOK01Ra8qzgtj92jBHYhvuDjHs6BE9Q4fWwC
         B0tZVWZUHF1izAV4MKerAvoKH2UfuCKzfBivTsi7fzHwA6mrAyeIxodrNKNt+M1C6nMO
         L1bjrIvbXGAGqwUUXSxBr3UFnm+fTcASxKVDt3DdUNbN8VZJV9ww9n4DZJ0PSeezNfnX
         DTwEu+em/OlToWQF4zqyakDMo6CWImJU+EUqXwj5btBkXSJdSihwd2iwf5gHHhN/w26E
         fbAnKG8EL5osL5E/M/Gp6jqy3Okzu1rRDHCZBHFON7o0pPDvI8nHFJcMloZ/w5Ffp8HQ
         5rNg==
X-Forwarded-Encrypted: i=1; AFNElJ+lXWrcoflYnhH+vyckleB0k0/7ydJALjF/rB++FEEZsa2UkjK3n1sUkPn6lVNAtZvaaJeX2ELrWNHALg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfd3eehC8xLBuo/Adt6p8ygc3iyp5Zm5L6yc+jnwWxogyZcxWX
	xb0dh+R0J0VRKtPmYD1W+5ufAoUX5iPAEljOrXUt0FzRzHl0KWzR9sjA
X-Gm-Gg: AeBDiesD8ZIC7AD3zm6iGmPBxA3j+F4OPvFOvyB02wBrhuNo1QD5J4giiA6Wq4eMXG1
	jlNLtLw3DIYbIqUGtFRxSAOuMwEULnqXy623FGjtGWTlCwSO1opLhjowHnhBDwj4AGtsI2/zJBi
	sV0NaUhT8TEQTrhDSG/NKWC3lU8tk0KAgu19KVR1C0egPLSnmHQ/Rd+76WFzriRvz3GJUs8fPVQ
	qgWBLYvmIqc5dz0FAOt4Pa1heaeEdJDnItR+sj0HZfxoKF0QtN7FyFvvHbyA+sBNJ/1ruBDkhAF
	cdR/sQJbgFZ/hZCOlnLGNZC8bdxLWvx1Y0Jk2sEwItZBaz5QOLPuefN+pNkc8z/nyxAdLp36aio
	R/ItUMXjtjCkoKjHbjHpEXGqPYl4WRUaTQHtJnjHIz8p8f0yAsPzKrraMA+xUB48mUz4v4DrDB8
	7DbwgcvJrVJ86ssFJnGCAiwhwwPmbsCkgaStTq
X-Received: by 2002:a05:690c:c22f:b0:79a:7157:879 with SMTP id 00721157ae682-7bcee02cb9cmr3050107b3.50.1777312763881;
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:31 +0300
Subject: [PATCH RFC v3 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-9-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.54.0

