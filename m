Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438873EBF06
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312770; cv=none; b=YIkanoUrYHoj/kCqC/SqbidP97ErUeRhucMOWpuJhA1SapM3PIls4vLaJ1RCLv8V2FGXgRIb6g86wYBj2SUb9/rxXLdfzRr6s84LzFtT/mfbjygXerYeymejYR6dL3obidChw7EFvupR8WMWiUk3WcXmNQ5xrU3NdHyWGS46OpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312770; c=relaxed/simple;
	bh=W/jdrMMOR+FvAcaLb6DCGvMLoN/HdffKmNBgDjoCT/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M02vLw3Hw6EwnAFPQm6iF/pZHqF90UUH6mO53fQoin6T2zGl0m3RM5fgAtzpuV2iEJxJVbnEOFsFeQzeBhU7UFmDJp6+e/GLNQjN/4FCuzizqpnpo2GQxnpoEMdkmtJ7D3KW2Z4MhXJ5ITjhJhpIepHqbDn5/7V9ijeZ1Dw+mc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzglCDF/; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzglCDF/"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b186dfc1d0so148554537b3.1
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312768; x=1777917568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=RzglCDF/2/eTn0QGiJvDO5T7C3ClYwr9s24SDv4PCVNGiUOYSW4U3q2iSdWTF6OAm2
         fq5CzZ7cl8jWam3ugovu//q9vcliZncLWMU4EE+avV535MJRoOCsmvrHFJcJdwnqF3P3
         LkQoCnU02shXIWfBjZu8ioueiZbfLWO3J9CTPjkJeyla7TwKKaVOf5eIMvXYfuEuicnb
         AcsJSzLSR0dVgWg/NQMk4Ej7/IcrnZU6e/NoFxAjsxV9Vg7L0rq1MbNy+Pq2GI9Yzc9i
         ZX//2ANNOlE/bmmgVlnx566kEsEd23i5MMffPRmm0MVOTQLVpdK3SQaPlNoCHwAW82fb
         aSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312768; x=1777917568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+ZGKTVkBXN8ikP50VcfnPbIIQ0Oi7+ClKejUhvLkNg=;
        b=kAY4vo3NVCDdUe9jr0JcDgrBwHmURxD2A/EQRKsAWyOJ2jA0aKNBNXJup0j3hP8t9C
         EpDx86X6mGeNWoaAQk0Y73km9leYulKTGtkJNVLTFFGwEKcH3HFLgtMKv9o4jIPapKsQ
         h5pJ2YCRW2v8X/4mk0qMPf6x3C4Nyhjv7P27X6bq4PPJEQcfLBDDfM3e6Mupmb5dvKFa
         gq78TCl2Qh5+J05j2htJOCJJ1MMH+edjWLkN4cB+qNQC8aUzeNTwg+eXoDu/ssHrokHZ
         /rdYeQT2WOcmHnnpXp4MGoZmvSFUEWtWaQXA38crOlPazhOyAttkJ47otXNp0YzBQMPk
         hVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ek1GdL714XtH7C+Chz4mmlYzuCkWIdFQXqgLnv5t8nntBlzVXbWegJAtKmArj+CARZCyjPbJq+u670Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7jDM+YGs7GV3WY4BPbezuYWtx2MjqiZrdfvbcPmiYQa43kwC
	BGkWq4JXfYzDgIRUYgbalwPt+VANqUhtk7dwxhHbJlNGL63ZpCri3m+E
X-Gm-Gg: AeBDieuczfPsyrPc16XhJqSVLV+5gbVeV4ttp7wG0MmTIf5Go/DLkEAEAt7l6U7b/iF
	WDBPUft9rZ4+bMIDehkP0I8LpNeibgWZGqneqM2fxwQf9/0evW3595DwyaXQoVQxtPvDZjHKV5Y
	0VubWz96nRWquOiGlLLuDrm9z+bMNqHl7nalcfwMuywISP7yG0POjewriBNIa+/1SiO2C51ncCI
	gpFDaxafxqvnBVm31/5kH9CrNDPz7/XHQEyH4HOTnSl1/okwJzIup9u0Zq1a9szhS/QMckQMmsu
	JXTLbtLx5xDw+lWPj+TzS7bwTZ3/HfocVU4+ohGI9i5e+RU74+f64+6tLDxffdC6wtw4w/YNefB
	xSpXGme9yYPSrskXqthLKyAjUwrdFBQuCvGL2U9oWGwfG/oq2QI3XB4v2dCiySqswRyrbLqGHsF
	P5ydr9K7je7GCK+Yvcd4S1oAZbbgU14fFgIync
X-Received: by 2002:a05:690c:6609:b0:7b1:9036:a23a with SMTP id 00721157ae682-7bceeadc0eemr1800427b3.14.1777312768435;
        Mon, 27 Apr 2026 10:59:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:32 +0300
Subject: [PATCH RFC v3 10/11] media: qcom: venus: add power domain enable
 logic for Venus cores
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-10-288195bb7917@gmail.com>
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

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 121 ++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cc21a4762188..41272c194a6d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -246,6 +246,94 @@ static int load_scale_bw(struct venus_core *core)
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core, struct device *dev,
+				 struct dev_pm_domain_list **pmdomains,
+				 const char **pmdomain_names,
+				 unsigned int pmdomains_num)
+{
+	int ret;
+	struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = pmdomain_names,
+		.num_pd_names = pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!pmdomain_names)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &vcodec_data, pmdomains);
+	return ret;
+}
+
+static int vdec_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_dec;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec0_pmdomains,
+				     res->vcodec0_pmdomains,
+				     res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_attach(struct venus_core *core)
+{
+	struct device *dev = core->dev_enc;
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_get_v1(core, dev, &core->vcodec1_pmdomains,
+				     res->vcodec1_pmdomains,
+				     res->vcodec_pmdomains_num);
+}
+
+static int vcodec_domains_enable_v1(struct venus_core *core,
+				    struct dev_pm_domain_list *pmdomains,
+				    unsigned int pmdomains_num)
+{
+	int i, ret;
+
+	if (!pmdomains)
+		return 0;
+
+	for (i = 0; i < pmdomains_num; i++) {
+		ret = pm_runtime_resume_and_get(pmdomains->pd_devs[i]);
+		if (ret)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+
+	return ret;
+}
+
+static int vdec_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec0_pmdomains,
+					res->vcodec_pmdomains_num);
+}
+
+static int venc_domains_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+
+	return vcodec_domains_enable_v1(core, core->vcodec1_pmdomains,
+					res->vcodec_pmdomains_num);
+}
+
+static void vcodec_domains_put_v1(struct dev_pm_domain_list *pmdomains,
+				  unsigned int pmdomains_num)
+{
+	unsigned int i = pmdomains_num;
+
+	while (i--)
+		pm_runtime_put_sync(pmdomains->pd_devs[i]);
+}
+
 static int load_scale_v1(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
@@ -331,6 +419,11 @@ static int core_power_v1(struct venus_core *core, int on)
 static int vdec_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = vdec_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec0_clks,
 			       core->res->vcodec0_clks);
@@ -339,8 +432,18 @@ static int vdec_get_v1(struct device *dev)
 static int vdec_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = vdec_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec0_pmdomains,
+				      res->vcodec_pmdomains_num);
+
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec0_clks);
 	else
@@ -352,6 +455,11 @@ static int vdec_power_v1(struct device *dev, int on)
 static int venc_get_v1(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = venc_domains_attach(core);
+	if (ret < 0)
+		return ret;
 
 	return vcodec_clks_get(core, dev, core->vcodec1_clks,
 			       core->res->vcodec1_clks);
@@ -360,8 +468,17 @@ static int venc_get_v1(struct device *dev)
 static int venc_power_v1(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
 	int ret = 0;
 
+	if (on == POWER_ON)
+		ret = venc_domains_get(core);
+	else
+		vcodec_domains_put_v1(core->vcodec1_pmdomains,
+				      res->vcodec_pmdomains_num);
+	if (ret)
+		return ret;
+
 	if (on == POWER_ON)
 		ret = vcodec_clks_enable(core, core->vcodec1_clks);
 	else
@@ -905,7 +1022,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -1023,7 +1140,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0

