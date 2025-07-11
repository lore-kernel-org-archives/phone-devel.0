Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8201F30A9
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218936; cv=none; b=fwypCCYzlV9T26EbF27leOm0b17aBU93cXY4BS/zq7h5l8kaSzzPwFf+3H7rSfWvMsi+1FzyV6FSlAaI1tstGNaT8UpG40W4J72WL31869r5W/5o2UXFFsnc0jxFHmcUaqHBf8XSxBmQzIV5LsXLCSRLLkOYq3drjDsLmCsyQNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218936; c=relaxed/simple;
	bh=kQ8IKCP1kcQ/lXs1y++kiYaNah/YKFW/72xoS7GShJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRurPXY0WWbxRvtUZWabiDjkRJP7+rh3fmjSevnndkouYnMaAEOxxzEzwQ57ES6Y0G6/NW4rbFSLTNwrx9/KSGvat0gwHuqeOJQ+gKDbfuVXj7UaQC5QjExYXvqMQ7lWKSiDaALQx9SCLommpey0cwEu1nkjYUA17/f4moSUh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LQiCoQTv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LQiCoQTv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so3379546a12.3
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218933; x=1752823733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtgfnZbVJ4jCikDvmiJRy1HnHbQOBcOZj3V5tl+w2H4=;
        b=LQiCoQTvfebSXbPEw8KLNL2/V0JzXJWcgFFRYb/sTvbyTGCHRwz3H8tqynFGdaNWGE
         +VZqHRUllJIW4YoLGeuPHTFPAG0DS+eGVB/mlZBMIKEnNPAhvAvYnzatiJ6HDq4ryGU2
         TZu9ibkIJLSIFDa9Z5Hq1Gn38bprxrqGb9Qf+dKkF3/ZIa93BaFb91dm1l+8k+J815TU
         4HSU37e8CZR1Vtp9TNrGXo+wunxniYv0z2QzDC4g6M64gTjBlSzm2bXtnuHdXszxyDop
         U7XtIefm8JCl6JTcg295o89h+ch6PlsmUQ/j+vzHg7YraaqQeCXOiHcLxyj2uE89w1/m
         INxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218933; x=1752823733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtgfnZbVJ4jCikDvmiJRy1HnHbQOBcOZj3V5tl+w2H4=;
        b=leKCMp/gFksuLPpGqG7iqtlNEozschkqekk5Cg74wV0wF5Q0S52CZFQRSobQVQSgxo
         r9zWBRK8w2PESIbXCwZSUasg/V99jmFO2hN5RS4+dYjCc0ZCw5sML5/GzRvV04CQ5Tlb
         5uryhqA4+fxYTiAFt+muCn6ipf96hNIAdktfLGk6WANhj6DlpxyGquyWglDkps7zYK1z
         kotEtYpnINfbJeiKKT2PIMuzIiA7m2++KNC/kGtv6whod+j42FEuun3f7v2uT0L4SZah
         rN1eF3cwopArquu1qyQyccsG6a8745Vd0YtRUHPrIvSEro+z7MokyShzUDSXoRYo7MGd
         s1bg==
X-Forwarded-Encrypted: i=1; AJvYcCVT1g40eJ0kVFQGlD9iD5IhpY4wm8GFMAU9QhsAltby9AHHgx9xDpGptFnoZNa+npzLHSXXycSLC8UM4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+ocZ1uOYZsidT4LFAj1bG+XE0bnCY7Q8/vq08pdT5ZA6wOqv
	FBiUJRtnM9NbC6fwDJNVduSRSdYjDg+VbEvUp8D0st+zay3CegqMEWZlNnL/8x37IiI=
X-Gm-Gg: ASbGnctDQQ4iN+oq2MhItIQicJ2oCd2w1KjQKDz42BYvUusfYvr9zpWVwj/1nrPldH4
	nq9bmLJTU8CKjauFhJ11Yfz9LlWwfJx9uP7L901u+bmtMUwGlfwRsR2X1JH+4JIcRfzZGpolMF2
	H7nJggTZSgUJLPkZ04GIhSkCcPGQr/+nWJbTH4eMI5Go1UhqyB3MrolHm8+HprFL3xl2sYaOFs+
	bmZ5cVd62o3FGYHzW0m33cDYKUdtVAvAYkrZ4chtEHrtc/QH4+BJrOUqXk+M3paNGrofPZE19cp
	jEdX7ewCxD0TAGfk2PohS0SUo7HIDZKqQPqnTIo5ebD8outb6dw0a2sknJ8srULJrOko78eyv+y
	iZJ3qM8FSMxsrxtgIlwh2fKJhlMubJGr2t4RJ7LdShM2jc3vDzym+I3jksLI8nZlmZ1/gmXYmTl
	j6E8Q=
X-Google-Smtp-Source: AGHT+IE4RqDwQnKxSkBGyHw2mBgwanclnLP3DidAK0ZxdxP5CEZTBm7HXPRru7shMe6CbBsINHQt8A==
X-Received: by 2002:a17:907:86a1:b0:ae0:b7ef:1c11 with SMTP id a640c23a62f3a-ae6fbe13d96mr236893366b.5.1752218932779;
        Fri, 11 Jul 2025 00:28:52 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm252600966b.4.2025.07.11.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:28:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Jul 2025 09:28:42 +0200
Subject: [PATCH v2 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm7550-pmr735b-rpmh-regs-v2-4-bca8cc15c199@fairphone.com>
References: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
In-Reply-To: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752218928; l=3725;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kQ8IKCP1kcQ/lXs1y++kiYaNah/YKFW/72xoS7GShJk=;
 b=KOd9dBkJzHtkQ8A9OJhiSKHmuP4YxkBjjri2daBn9r3wQ9FigHGRSP94pooZgXyLZO2ieBYZ1
 PHLqMUPp4WtCIoPAI8gZYwGIza/w6b5JNijsa9BEKJEYqFiO+BK6Bvm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
LDO512 MV PMOS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7b1743d51fd145a44f98dd8e605b4ca410046654..109f0aae09b1df431d2e14d45a64d115e87cdec4 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1462,6 +1462,40 @@ static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm7550_vreg_data[] = {
+	RPMH_VREG("smps1", "smp%s1",  &pmic5_ftsmps525,    "vdd-s1"),
+	RPMH_VREG("smps2", "smp%s2",  &pmic5_ftsmps525,    "vdd-s2"),
+	RPMH_VREG("smps3", "smp%s3",  &pmic5_ftsmps525,    "vdd-s3"),
+	RPMH_VREG("smps4", "smp%s4",  &pmic5_ftsmps525,    "vdd-s4"),
+	RPMH_VREG("smps5", "smp%s5",  &pmic5_ftsmps525,    "vdd-s5"),
+	RPMH_VREG("smps6", "smp%s6",  &pmic5_ftsmps525,    "vdd-s6"),
+	RPMH_VREG("ldo1",  "ldo%s1",  &pmic5_nldo515,      "vdd-l1"),
+	RPMH_VREG("ldo2",  "ldo%s2",  &pmic5_nldo515,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",  "ldo%s3",  &pmic5_nldo515,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",  "ldo%s4",  &pmic5_nldo515,      "vdd-l4-l5"),
+	RPMH_VREG("ldo5",  "ldo%s5",  &pmic5_nldo515,      "vdd-l4-l5"),
+	RPMH_VREG("ldo6",  "ldo%s6",  &pmic5_nldo515,      "vdd-l6"),
+	RPMH_VREG("ldo7",  "ldo%s7",  &pmic5_nldo515,      "vdd-l7"),
+	RPMH_VREG("ldo8",  "ldo%s8",  &pmic5_nldo515,      "vdd-l8"),
+	RPMH_VREG("ldo9",  "ldo%s9",  &pmic5_nldo515,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10", "ldo%s10", &pmic5_nldo515,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11", "ldo%s11", &pmic5_nldo515,      "vdd-l11"),
+	RPMH_VREG("ldo12", "ldo%s12", &pmic5_pldo515_mv,   "vdd-l12-l14"),
+	RPMH_VREG("ldo13", "ldo%s13", &pmic5_pldo515_mv,   "vdd-l13-l16"),
+	RPMH_VREG("ldo14", "ldo%s14", &pmic5_pldo,         "vdd-l12-l14"),
+	RPMH_VREG("ldo15", "ldo%s15", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo16", "ldo%s16", &pmic5_pldo,         "vdd-l13-l16"),
+	RPMH_VREG("ldo17", "ldo%s17", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo18", "ldo%s18", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo19", "ldo%s19", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo20", "ldo%s20", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo21", "ldo%s21", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo22", "ldo%s22", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo23", "ldo%s23", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("bob",   "bob%s1",  &pmic5_bob,          "vdd-bob"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps520, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
@@ -1679,6 +1713,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm7325-rpmh-regulators",
 		.data = pm7325_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm7550-rpmh-regulators",
+		.data = pm7550_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmr735a-rpmh-regulators",
 		.data = pmr735a_vreg_data,

-- 
2.50.1

