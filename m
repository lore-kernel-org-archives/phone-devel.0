Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6139C014
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533055; cv=none; b=QlIDWtwUozu7lX51lVza7GWVXke7FahvimhGYXcrY0AZ0XqQ0bd+1VetfYHVyvi9ZtQF2amHOrB7f9LczDWTEQnBOLNKmmtGkJx7x7mzssJAjtnMYXZLiOFa1rPItcjVBBiZNH0QqOTtOG/XYlkeNw/iOWy1UFM74ZGoXVxAhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533055; c=relaxed/simple;
	bh=8AL+NQRRa6kPH6NzCfcOC2Llr5owhpqb7+IMEyXnI98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwSCJMKioF3meOU1HgAk3P5bW+0txg3gDsSGIbLTSSSnCMD2QC1awnI8smn8nXJR1ctsbrU/5PtBC1g28ZQYSc82rSYcM0joUxU61M/5v7nmswypEynyb8k9kxd3Jzl84pKQBIUZOi+ebNXRIBIdAnp/gOHUK0W1Ox+bgCBkX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AwxS28zD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AwxS28zD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so7263895e9.0
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533052; x=1778137852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTAqoytpCjl9hfv6cX5jUP3f+PX5WWo9Fv2pGJKBaeY=;
        b=AwxS28zDjvWEb+gdh+pfIDPQLtR/0ks+4ylcY4HCnuADJUeHxieOkPwgLJ4M5YEc1r
         0VPccQ+CIO0h7kHi6TZhL5RvX6PY/wCQni3pImVYDMjP6GskY+X6HJGtkoGkEvechfAL
         sPB6fOKTLi0RPmIU4HmucxVx2R/KTSaw9JqdN7afXDNKI0o9IhULPr98VI0RI6QA02hK
         p09Iwueyg6cgi5Ff57M8eKncpgkmhExebtP6iKOIfrEDy4GBAAL0o5HZzk1yA6CDNO/a
         wK5k+TYCVsc12gqnPc2zRbXjSXUotVAD/2upeKydNhEQ0eH9L6ZGSpbU2mHMmwwTDd+N
         NLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533052; x=1778137852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTAqoytpCjl9hfv6cX5jUP3f+PX5WWo9Fv2pGJKBaeY=;
        b=nGbGEKtYwOxS6zRenNKCn7laYBWvplWEtqwql/IDQaFIa1Umvk7a92/+8EExqj0rJP
         4RxwaI9FbP/hu16v8iaHSIW31ZRNcHvYop8ZGqJiEs2QpypqW6xvJpIWuOaScmsv/Ikw
         tfH+odblyHOgLMuTlgv9w3IkA3KhMXzWbSAcTyMi96q2kiGBJcGS2cAoHWYOmaEPwFy+
         +Y6M5bKmc1qU6CtOenYVa/DDNhwwMDZyTZnybTzqwGdXcgFcYdZEGeSgEXgdTtLmI5Rz
         a6EduVKdIkGvsfjfYggw8usI3lN0iOVzJ+rktE9Kq4Tzs6i4rFc5XFspTdAsxPUos1iK
         rcgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LDMPGI3iBFcBytFNZJaZGVL/ZnLYzlDEkiLnTwlwYPObe8sA8E0OKqnpUkjziTj7ANuSEU4WGWMlOTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIw0+q/en4Wex7+AUVb16ZloxlZxjSKcuoEXgbItiQ8CovhTsQ
	fxg/kTIhzfqIN0nnXh5NaszHam+7V3ZOJpmKdJbE3hh22tEIA5FBvCxXmvUnxWh21ow=
X-Gm-Gg: AeBDiesSDXw93CdiJUd/gSqRP8x27KsqSTsGCRuTtecTEITz51L+9dbHuKZAysEikux
	9sr7tuNQBE8GliK7ltSPzKIf0y4HedHn9CfYAnPjdLqTURsZcgDsoZ5dI8ZwNsfli/+ysSXXDss
	LeDXbyf+XoxVDCOx4ETaX7Y4bfe1d6Tuge/GzTZ2METy0cfqtJwS8hf7m6rePSp+TDdv5XYwQ77
	bLm7oFY2R4thzBJeMlSnbhkbRrzdFqrb+2Z4PARss7IF2xEgxif30ayz/4bThAjGwWMKJTwAmDG
	i1WNABiG2V79awKeszJoeB38NRvYvyW9t+UXWNGTGcBFwqioN1bT5lp92WWLEv86ZM/dXLMq6wM
	Psn4b9N0205U6a7F3O+qXm0KLHMXb+uqSWcSTg9vbecWLqUhGm22hGsmeVU2G1ylhnL3ftaubLJ
	WGIL6KWxsw6mWvfG9Hk40WTN43PAt6uBHWgGWE4zK3nK6DehJGQDUU0Qz72WjslA8CKAw01w929
	q07IfDT
X-Received: by 2002:a05:600c:a593:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48a8447c7dfmr14224895e9.25.1777533052159;
        Thu, 30 Apr 2026 00:10:52 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:42 +0200
Subject: [PATCH v2 2/5] pinctrl: qcom: lpass-lpi: Add ability to use
 SPARE_1 for slew control
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-2-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=2676;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8AL+NQRRa6kPH6NzCfcOC2Llr5owhpqb7+IMEyXnI98=;
 b=+MrwYSNWoWi0pZLMiyT+PYWHDz4bMO5KSMD0GqsL/a7Q4KPUi3ktOJmileienxzbK2uLaAs5e
 WIBgh2XEgoJCWbC3JqImBCKNIg8DSDE0HZ/15ncEtwbvPRXvJCQv9LR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On some platforms like SM6350 (Bitra), some pins have their slew
controlled with the SPARE_1 register. Add support for that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c |  2 ++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296279..15ced5027579 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -220,6 +220,8 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 
 	if (pctrl->data->flags & LPI_FLAG_SLEW_RATE_SAME_REG)
 		reg = pctrl->tlmm_base + LPI_TLMM_REG_OFFSET * group + LPI_GPIO_CFG_REG;
+	else if (g->slew_base_spare_1)
+		reg = pctrl->slew_base + LPI_SPARE_1_REG;
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index f48368492861..6ba0c4eba984 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -16,6 +16,7 @@ struct platform_device;
 struct pinctrl_pin_desc;
 
 #define LPI_SLEW_RATE_CTL_REG	0xa000
+#define LPI_SPARE_1_REG		0xc000
 #define LPI_TLMM_REG_OFFSET		0x1000
 #define LPI_SLEW_RATE_MAX		0x03
 #define LPI_SLEW_BITS_SIZE		0x02
@@ -47,6 +48,7 @@ struct pinctrl_pin_desc;
 	{						\
 		.pin = id,				\
 		.slew_offset = soff,			\
+		.slew_base_spare_1 = false,		\
 		.funcs = (int[]){			\
 			LPI_MUX_gpio,			\
 			LPI_MUX_##f1,			\
@@ -62,6 +64,7 @@ struct pinctrl_pin_desc;
 	{							\
 		.pin = id,					\
 		.slew_offset = soff,				\
+		.slew_base_spare_1 = false,			\
 		.funcs = (int[]){				\
 			LPI_MUX_gpio,				\
 			LPI_MUX_##f1,				\
@@ -73,6 +76,22 @@ struct pinctrl_pin_desc;
 		.pin_offset = poff,				\
 	}
 
+#define LPI_PINGROUP_SLEW_SPARE_1(id, soff, f1, f2, f3, f4)	\
+	{							\
+		.pin = id,					\
+		.slew_offset = soff,				\
+		.slew_base_spare_1 = true,			\
+		.funcs = (int[]){				\
+			LPI_MUX_gpio,				\
+			LPI_MUX_##f1,				\
+			LPI_MUX_##f2,				\
+			LPI_MUX_##f3,				\
+			LPI_MUX_##f4,				\
+		},						\
+		.nfuncs = 5,					\
+		.pin_offset = 0,				\
+	}
+
 /*
  * Slew rate control is done in the same register as rest of the
  * pin configuration.
@@ -87,6 +106,7 @@ struct lpi_pingroup {
 	unsigned int *funcs;
 	unsigned int nfuncs;
 	unsigned int pin_offset;
+	bool slew_base_spare_1;
 };
 
 struct lpi_function {

-- 
2.54.0

