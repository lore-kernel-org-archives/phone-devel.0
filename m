Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654B4A13AB
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017591; cv=none; b=MMvkwylqBFD9hcBN0hPtQySKClewLKKIrqn9WHWstnLIT0n6Aas4H7Kf7oXKTgwxOrhZ62FMRLbvMkEmdB9bg56UDgTfry0WNZmuILVOBNRdqeLUEN6894gt3gcwYqFjdAGrTUObp7pU99xnZFgSkY5gY1+C1d1Dh6rGBwnDgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017591; c=relaxed/simple;
	bh=Y3ohJ1oOQhONh2Boqz1nsKxlnH05B9SJoydn8ICKThM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJOyyyeBpdQpIABEDCT46+sISrrnkLD/Ejnp5hh+e0bVvY9hAFv5Oq5Y2KrOPCVnluu7gU+xcYurWweEMlfhPq5c1OJ+9Acx3n3u9L+5V5V0gp3IQmKugjURcR9z2aQMgtwXqUn3WBsIvrEzhOiFFGmXSUDlP/8+AJCnYN2U/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiDf6cUF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiDf6cUF"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd5dde63dbso59303057b3.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017589; x=1778622389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=iiDf6cUFle/L8+TsbbPzd+HaRUbEaqWOswdiJgi6VIVywOvRJKTKEFNIlNcShXEoGn
         F91v3Ejq2icMUkidgk5OzFOg9TJK/ws2gXzQbR/39/TBJxxIMpKaju0Jx7rWhV+DISGW
         kQMWdocGG5r5uYFMhFBaNpFK4nCXFUiB+GauXz0zRU+sczy6JNJRD1JGgRLHy+3RV4Yx
         2hrQSHPXvCvW/PGgAReAH8C4qaZbLeCN8Vzkq1JFG5Xv++xE3/YxB7D9oTwL4XMdQGrV
         ElhAavdrwf1RW+PgvoradxnbQEyiEdFfIBqN7V6NY4hQ1c3GVtLtR3yLCpfDK4kgBY8D
         H9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017589; x=1778622389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=bl/37r8q7zQfaLU1t4OmkGtUieJ1X61BqZFOF8CopJFiH6zIZ4yio1vv69G1cFTqxl
         Iywkwn4G2dAMgRDJfw61RliAB/KbRj7wYNMlvgdj4EX/hSWMsRAFG0gvfBLQPxFTyEs3
         WG4cYUWu8qJtSFX+3Bc4aQTklPuZoJrFT+LY5Iips5Z9fvfJz8SzJGAf0K6AWH1GPWnJ
         PvwPBbVeBRQHkhWpHSYARMeBuwxfQ/2WvswVTvUWTozVWTA8EYOD+hBc20zjjc7Pjy4U
         BlOTaUbqb8vbdrX181CKNQngm0HpOXLKDXIw6TARghylZkFzT3enT33iNRpuNWWV2J/p
         3TgA==
X-Forwarded-Encrypted: i=1; AFNElJ/cI/gONYTNy6tNif4LkMMeHUtOE+LtbiyPKFaKnp24OT0HSHfxeIYqdEFOIVkvYvtnWYC2VZUVxEn/qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3OGpDMHp49YFRmG4h1P2uLwt1tCl0PqBwU7i/ObI5Vkz0n3BW
	o/X7lhzJDQqvtSevbKDkzJ8uVwj2iK1oSXp3eZR19+IQ4GfGp5eYDiune/5nxw==
X-Gm-Gg: AeBDiet8VbCHjptRoz8r2oMrKw7Ot+7e95/pBwQMgWKgXPbs4ediMc8cLpL7JOLseno
	22ukFN0OvvKUfOaZdAZ1IGHdSDIim/VJ02pTgPL6ir/qm4NQ/BxboY9dQ+9ak8CreIBqc0OHCrj
	X0KosttnXv2tOP4LtqjQLJHSdwZjydRqcs1TRzAclNPEsNLqQwxv/1tKd1kgbF2k8AIXZzmC1RT
	jzbaLWBMvfbMVEfs575gU9MYaCUjBrfhp16I7ArkgfUKr1YFOqLIru0spPpo+1TC1PAWrQHQXmg
	O4CdMCrhJQfGQB6E+OHZamZO53eHxnrOx4kgfLpeZP5ly0L0gXEYLkAynCA97HD8a/gC9XvgszD
	7zsZSa1DW5vr9Odao+1BXxw+TYUeDoRtMscmqcWtk6vVw7XdIJsAKR+nlvDy8Rsotj1lruYwYr+
	ZoFMTWDtrnRy13ppbLrjtpyzZHVkZ0KpoSv24m
X-Received: by 2002:a05:690c:d8b:b0:7ba:ded4:df5d with SMTP id 00721157ae682-7bdf5eb937fmr13916837b3.34.1778017588910;
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:45 +0300
Subject: [PATCH v4 8/9] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-8-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 80 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..c8f7f220c713 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -299,8 +299,22 @@ static int load_scale_v1(struct venus_inst *inst)
 
 static int core_get_v1(struct venus_core *core)
 {
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
 	int ret;
 
+	if (res->vcodec_pmdomains) {
+		ret = dev_pm_domain_attach_list(dev, &vcodec_data,
+						&core->pmdomains);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -319,12 +333,70 @@ static void core_put_v1(struct venus_core *core)
 static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
+	struct device *pd_dev = core->res->vcodec_pmdomains ?
+		core->pmdomains->pd_devs[0] : NULL;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		if (pd_dev) {
+			ret = pm_runtime_resume_and_get(pd_dev);
+			if (ret)
+				return ret;
+		}
 		ret = core_clks_enable(core);
-	else
+		if (ret) {
+			pm_runtime_put_sync(pd_dev);
+			return ret;
+		}
+	} else {
+		if (pd_dev)
+			pm_runtime_put_sync(pd_dev);
 		core_clks_disable(core);
+	}
 
+	return 0;
+}
+
+static int vcodec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec_clks,
+			       core->res->vcodec_clks);
+}
+
+static int vcodec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1, ret;
+
+	if (on == POWER_ON) {
+		if (res->vcodec_pmdomains) {
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				ret = pm_runtime_resume_and_get(pd_dev);
+				if (ret)
+					goto err;
+			}
+		}
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto err;
+	} else {
+		if (res->vcodec_pmdomains)
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				pm_runtime_put_sync(pd_dev);
+			}
+		vcodec_clks_disable(core, core->vcodec_clks);
+	}
+
+	return 0;
+err:
+	while (i-- > 1)
+		pm_runtime_put_sync(core->pmdomains->pd_devs[i]);
 	return ret;
 }
 
@@ -332,6 +404,10 @@ static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vcodec_get_v1,
+	.vdec_power = vcodec_power_v1,
+	.venc_get = vcodec_get_v1,
+	.venc_power = vcodec_power_v1,
 	.load_scale = load_scale_v1,
 };
 

-- 
2.54.0

