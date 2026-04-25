Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03943793C6
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141901; cv=none; b=cLp+psxD8flgEBeTWDmxTqzg6CIsj11RcggwLg3dWI36IJZgCVHlPhJRwTjziDblc26l+nplXeykHpvOmY1txW7LZ2X+STDjqrK4/IuU6ZPYc/BqMzVb691z13IdvvdDDVDWZJHe5/uYsH+vA3I7U3yZa+voH5KjuNykTME9dNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141901; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTE9KpJuohPP3KMWLC8QE3bC4Lw4E8NOZucs1RsXtVz/zNBi1jm94USrTsxCIp6pGROtLm1gDamUrxuMJn+0USzrEB0d0hL22z4mPSr5AlmWDKD1kuGOiQdHddWNF8BbN+7VOzlh5KHiCFGvsjNNSZlwVQYzIOQ+jeimxLlJKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrg9nZ2o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrg9nZ2o"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so54457065e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141896; x=1777746696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=Xrg9nZ2oVuCLyJa/xI5QEQqJhXznqSmyn0SgsSZdYIp5rCOR2akrLBxAhpPx7/sQ2V
         H7LyvGk2LtS7137BxeIrPWfG6oiKNYJJLCgmCg6wpQNYplgY/XQKulu/tG/0y0ILK63f
         I5e7HhjQOIZygy33CYQDRjPRHMi2HI4G7Os5nPZISZsGnk8DM6k1jxJOkIavhXGPUpTE
         SInPDx24ZbnB8cgIQSz548JA+uAsk0DReys23W/4wquMfrz3pLIaX8xWePs0sZCHe+Tn
         XeBjyFZ6RYy6LkGvClVwcG3suIFJXumr5oiNWBNSQ65EWi8ye3GQQQfYaggZRazW1GLu
         +4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141896; x=1777746696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=bA0HNvhNb6oHITaH2l/eE5XrEK92qprQUObmGT+C9SNiEEEsINlaRpKKhYRlw4nTAe
         VZCrKt2Xh56/90bEm+OzJ4IcLluAgYWlGPEWNF+SQ/t6SPTHx0Z6GC7Q9lDcl0z8fcod
         oNkNi6g44wIS9OPvmuVLw2rK4UITfmhorEpMO3U17IydP9vqumbVa81ZY7recuxRIDsA
         NYL9cxT+qOiw6evUy9N+dzZYr20ki7teN4HPHa9b5fLMshkC2wPu+6vv8Y2APW0gmWFS
         Y0nmfCo8pHHZ4GKAG+nA5mRKIBsdwnq7LCrSK8//orC5d0b+g6qv/inQledw6MXhgBoa
         FYqg==
X-Forwarded-Encrypted: i=1; AFNElJ9jRu6rVCFnQB8HdsD/qVl7lxL9qDcJ3aUWhg/Ui1LFgFTx7KE+zmZOAv72lBm1lc6CaEhEQq5ADmhsKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JirCBi05M4l2sVLSJUF/hJ9nVjdPNRMmcXF7RAoVngaOexIW
	F/wcE+q7cynyIyyL2I+0XsAjrYWon2HuNzd/SEpZdw0MtvD3a8GKdLQX
X-Gm-Gg: AeBDies8QFwaqKGdAmLLeEP34I/9/0jcABQe91eEzm9rtQ5oziFOj7UGObvZW4h+imM
	HorglepFqnbe3Ff1bGDCbcu49szAucT3yl5oLdLyxo0ElWbdhRQfLVDykX7AUoDFci1UYaNQ1ef
	ENiNG1RWUN1SgjOK5wfaenn7sIEtpwIXTskFhZpiC2nwlk4rcTCM2A5kCfEZU94td5km5b9G5fZ
	O5Mhpl5Y19vlerN9WGxyjRyoKXSEoDXd/8LvJYC9cRmOi9cMDIsD/uOhwQgJ3wL590q/9TC7WFm
	GnKBfrLXnkIIzRnI02XF6y4PJcSAsIxQJFF37vCKGSQ2Y86A7HR+Tn4Tcg1QEW0P/aWWQj2USDj
	H3MUuWZ20+ZV6a3BpOifTg6QEITsylaNIgaXEp+nYYIiINV4mrmAm5HTnMuI6/rhx1HrV/Vg6Ah
	GELpQRMdwIVzgWIAcqXnaHPls4cVv/rNUKwmeLKVldgRUCtA==
X-Received: by 2002:a05:600c:a30a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a581c113cmr215288305e9.10.1777141896039;
        Sat, 25 Apr 2026 11:31:36 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:10 +0300
Subject: [PATCH RFC v2 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-9-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

