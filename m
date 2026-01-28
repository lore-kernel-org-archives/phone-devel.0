Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828AC34CFD4
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603219; cv=none; b=WJ0qatoIY2PtZGmTU8jdoKFG6bfFUYIUn06KxWwWdBqo1xVL3ncX7qR6u8cbQLsudQehGdXvW7gdqfTOADEzeYrevGiKAuGe3D0choYtpOfax+pjU8nIdGCgndSWHPAkH9dBkN99KppCzhlDwBIosYQBwoVqnmm0M/cJfJc8EOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603219; c=relaxed/simple;
	bh=qkR3N/gsmXgYO2JfgTiDk4iF41iC5S+pPDgTyzbp068=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZC9kDCxSfdsY9uXQTWtZUlF8f/mb59Z67kKd32iyfy73CAaerif3itbYB8SL1Iql3D7snHNwrrYVxVXtPX7PPAIjCxkvI9ilrLHX9yxTin/SWzGWvrM9AWVaoxY+NFn3LUZ7YY/TWn23F4E9KAJNSzxY8XrBGNU9+OvJavjhhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5hl43f8t; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5hl43f8t"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8863db032dso863084766b.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603214; x=1770208014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jzxQ31iaqft+vnkSfOSrEvDmT77JQeklbr0dv7ayhI=;
        b=5hl43f8tCT+fXFyJnWSVbtiDKCcAqmUka7mwUc/CLWGJjrnRGoaLoAB68aZ3gs4LdI
         CqXxVEqhzLB62jnDGc/V98sPF6ItSJfb2xCDb4RGU5sEMGR1n8OTZZ6EvOhpQFAMqCZS
         xjC1ginQaW2G4VTTS+7xvq0rjHuUzstpHECd8/DhW5rlFPju402deJnCArhXR+V4IXv2
         eDwDV4PFj/FvqjvXDMTnnbv3hnL1DpfJb4NNXRFJabpLFqHzjFpjaTOA5cX3SH16Qm2g
         x3duLwhIudFhZ6mlypxpGGG8LLVY2cqudTk+55QzAmILbYojRx4QLBeAJUZY7up6EUfG
         5IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603215; x=1770208015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jzxQ31iaqft+vnkSfOSrEvDmT77JQeklbr0dv7ayhI=;
        b=gR9em6x6W/qQ259/SGgMJQ6ZaC4xJxwHJDWTQRsk1z+E7hXi4xrQ/y7498B2fsCQOh
         I5GonONinLiOvQKc2+lSHh4eDLTNWOcSXigj1FnFoSQyiWJOxSArb3tea3iNXJiCDT7R
         ur4Cw7WfbNhWkjy67NGogJ8a+b3kKneUZiN20NPkAJi2osBwaqakl4WQrLwlupoKkAba
         zB/PxTNcFhCofLJ/tNG+FCBmA5ooo7xzAmPZ+qstd96kF+PvegkFL0vYlAuNmdiPFf/O
         tMvDQ2k+6Q7fJwX7ahPOzhSDJ+TAv7aLxxjGNgbb1gobvQ93OwxoSv1KdNsDMQL+ggQr
         VT1w==
X-Forwarded-Encrypted: i=1; AJvYcCV2s1yHBwfo2AmM5sqzlLXcInFSavJ5VLrWabgVx9EY0WQ63vkx/GapK8dKsdDKyDih7ZoZTrl0XTCMZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOK69WDzhW08JswqWmr4jOV+7rCE1blA3RWXnhCouvKRfDsi7G
	uaJ4E+hmaZioJktd7kqpcRrHv64deh4ww8p0k5TNSxduP51zhINQGzzLW7WZkdcYBEY=
X-Gm-Gg: AZuq6aJepvoun+R035tJMWvUQV6iRharbKcyusY5K7xfv2bxnf2Kw5fQRQC05vLaVuz
	vhdNyNjJS48pvEtz+UDpwqDcYhoJb8FeOSu0eG3Op898oM9KqSB2omPEwOkLp3xq1qlOgQZewTB
	Zy/AVOYz8FrhIVInSSZUFILULRzl/1rsLeIBaBPFIXF5If6ehg125XlTkW7OI13MsRQvJ7gdn7+
	z1WqIAg829oLyBr97zXTMIwFA0lpGL2oYalzbAvT9uGQktPndZEdd92ywCge7eg9cGhdxOP0hVF
	EBZQLDt6Yh4+vSCEdIUwVtfpYGoGDFWKkGfelxzE2oKeehBEVAPdw/vfSwUd/OQbnKzR+xOTkiJ
	JVAN/GfMQsvtFWs0rVXiQk7OgeSb45dtbSTxTiDMhY419QKvCow6KsN2znzR8zAst1Sce/uEyBK
	J3CbI0XJU967M1fICKrJTfi8HSMI5sMRhA/442fbSNU6ulTHEiKHHFfNLkHx9sHFOxjQ==
X-Received: by 2002:a17:907:c807:b0:b7a:1bde:a01a with SMTP id a640c23a62f3a-b8dab3cfca5mr370108866b.62.1769603214620;
        Wed, 28 Jan 2026 04:26:54 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:54 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:50 +0100
Subject: [PATCH 2/5] pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1
 for slew control
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-2-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=2683;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qkR3N/gsmXgYO2JfgTiDk4iF41iC5S+pPDgTyzbp068=;
 b=D03/QgscWazU563APEDJzM7rEkI223CiQQFxLqunbjc4WLt6AEk/9Rcq6Fo7fPo/PsMFqsCIA
 aY6xDo9C375CY9IyyCLXn67jvPq9wusbNMRO5nHBoS2ZwcxH22VIlga
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On some platforms like SM6350 (Bitra), some pins have their slew
controlled with the SPARE_1 register - probably because they ran out of
register space for an extra pin. Add support for that.

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
2.52.0

