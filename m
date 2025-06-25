Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED572E9EBA
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843151; cv=none; b=czYDQ8I75XPbmgU7GZqcMYHGdiCG7X4vEgOU8rGYYrjo2eOIK8C9O0hXMOzyPjci0eOYwrtCw46sw2A0NyzuzTvZtCGRVLOLt4wIfvM1/iFjYGFmWnhU/xyl4GqINRvmOFrFMqU3YkO3dzkxh9D6gzVQS7ALmQWU7btZ1KMQA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843151; c=relaxed/simple;
	bh=At2HBbsXvVHz9rxjvswxCr4eB0qsSfZ+uDiTlrusbVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2WDOQaXvkZ772KJtuzTfpaRpyXzNoscoY+EUi5p0FKJ0PuCceq9MrSipVqprm0fa+R9NVMhGRI36Df/Yz6oZMKBzEGqKjW2H8H9uWSPqLNGZ3PYRFYaP/hfkg2I+NM+nH9/fEE1rOF6yuqWnl5D6rZLdvfeWtKbItC+Z4H4Ai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5ln4Yrsq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5ln4Yrsq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso9128775a12.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843147; x=1751447947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNd3fbEJo95yGNYgF3KFEKSMuGFIZiFKw1iK0PL8zKc=;
        b=5ln4YrsqZY+GnVgKLiDiELO8HL9wh+hKCgLlumv38bMmDeDzWBv6oJB9biOZTk/0k8
         NRNXTQ1M3Jdk393sP04alOb+Ca7qaRwWxi1YtZpRr70RqbVbjjCbgQ1GMvuD2fY+EIK9
         gAwJE2EDRZ5ru0ZYOHQ1DiwhmBMB01WzwJ36n2dNY8pBdLch9GsFDawib5A2GNF0ICt+
         PsRtZnZwL7aSzDyIRHQa2tAA2AIHNuX3OdDWFrOgZYV4wcorLmBmYuTBvH6pcVO9X/24
         eajZfm44ci5KBCNHscM2ceknWlKzDWv6c23fQujKexnWhCmn/ztcq8AlNa+eH+1XQRLh
         t07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843147; x=1751447947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNd3fbEJo95yGNYgF3KFEKSMuGFIZiFKw1iK0PL8zKc=;
        b=LGf7sx2TbLtSGMAhhyalXUBI3zfXb/a0uGktYl6G86BQcCLw6TYkWgP8ySlzmLqLHa
         8R4PxbGLvgMOm2Qk0MvUQ4jYzaVdPkYUi7yZmD5IaKV/PZArQrwPyTGeIW3GcK8U58QV
         y/464VkEIMdRBO+knkXcGtSOQLbZ6ox4CpEmyNr5Ws00QIO/GZaa2OFqg/A49RcKqK5f
         NuVxA5K7kIYgvJw1hiPGVASy4WP9aBvQ297+kMSaB7M2g1jOivSpuEJ5Jxn6w2FcPyg3
         ErWP7vZPutpW5bgRpSoZjIj1LKmGx6wJ6mXgA/igWxk1Ii/ikUd264ROtOp3WGyNHWHv
         2YVA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3xMbA7KRs8SLcPsuHZ7/YRPP0dLd8AIt/qGUPKmUQu+4Xmduh7PNgRn/fzpY97E0QSMSmZTNPKJ7fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsq7iIkI6KIWQaiOC448PAzY+1eSEd/adLE7xnWXIKt3TotV4
	FiqyXITcpi9xsgdrlGRyud1EeimS7fkjobxNWj5GX4PWfMmEZ9Ygxx8fe9MQ02vbzPA=
X-Gm-Gg: ASbGncvrcDrUt65zLlOzH3eFQPyXjkHHp36LoH70tD5nF30rftnx4cYymFjbMkpWikg
	QnIV1TxsBiZN4WSSXFq1rTJy3hbI4YMZ3aqF0joRkUaJctVsZWv1fwBSLYST8HhQcAY+W9j/TEH
	2rgjQwP7DcaZ9Jivh5mcWRAjtIC2BhDxFnC67kP5Yn/Tkue2OZu33puMc3qTjV2BDtfwKDDoWix
	1WyHuEDT5gjwChJLrTSdJbYlezLcv4u2R8r1bAvmXUnDNds+wlm12cafe6dmm85GSxdht4LgMvf
	7PnTfq61SlI47CaGxfZ8//KajXYzEy5dH+m59psr2rVoZXpW7CI1npKsgCDw8eNowMqS2nXi8H0
	ST27IzOUSCCeg41ctEhkcK5URONM0ZiBa8gHgjA1N6Qo=
X-Google-Smtp-Source: AGHT+IFrWmp3wGgOyhTgxlPt9IPhlOttoTglpXWgze+zdtqVFSVHTWvXHVCUkPD9wTziTvQxUHBaXA==
X-Received: by 2002:a05:6402:2712:b0:606:c388:636d with SMTP id 4fb4d7f45d1cf-60c4de1f0f7mr1624510a12.27.1750843147213;
        Wed, 25 Jun 2025 02:19:07 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:58 +0200
Subject: [PATCH 3/4] regulator: qcom-rpmh: add support for pmr735b
 regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=2162;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=At2HBbsXvVHz9rxjvswxCr4eB0qsSfZ+uDiTlrusbVc=;
 b=WxMVah8khmrJdoPsiT1CStb1PKFXN7peOrJoknPgFsvU3lLgAlpjKormdCGiDOBOPg2x5ce6s
 Ux0+q9cGoeSDb8awLllnJmDhpFxOlOsKC1z4/vwDLs+6YPJJJdjPqbj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add RPMH regulators exposed by Qualcomm Technologies, Inc. PMR735B PMIC.
It has 12 LDOs with 2 different types, L4 & L10 are LDO512 LV PMOS
and the rest are LDO512 NMOS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7870722b6ee21ce487c2cf911760fb4a385fc44b..7b1743d51fd145a44f98dd8e605b4ca410046654 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1476,6 +1476,22 @@ static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmr735b_vreg_data[] = {
+	RPMH_VREG("ldo1",   "ldo%s1",   &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",   "ldo%s2",   &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",   &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",   &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",   &pmic5_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",   &pmic5_nldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",   &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo8",   "ldo%s8",   &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",   &pmic5_nldo,      "vdd-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10",  &pmic5_pldo_lv,   "vdd-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11",  &pmic5_nldo,      "vdd-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12",  &pmic5_nldo,      "vdd-l12"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pm660_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
@@ -1667,6 +1683,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmr735a-rpmh-regulators",
 		.data = pmr735a_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmr735b-rpmh-regulators",
+		.data = pmr735b_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm660-rpmh-regulators",
 		.data = pm660_vreg_data,

-- 
2.50.0

