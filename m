Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF24749CA
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253148; cv=none; b=gHDc9/aR56uvlw099SzEKLanawnSzYB3raT8L0sPsF1wlGPluNo4Oj8L4i2hL5wsHzM6R/QWMHyLVk1XI9cEF0ji4hDqSb3BD2jR6V+bav//XeKwDCcLAK71B9lqcHwvBqDOidHZNSm6xRo7tSyDdcnY2zjLlUSrVOOKPn6sPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253148; c=relaxed/simple;
	bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gceT/xvryZrtxAfCovJWY55a4Eu0lxzS5KFRysi2vmQpakFnHhLyzKSmzvWxgroXN1/QqlsAh5SnhA1anIVk/O9q75W6ls3AHWVSB4UOimxjHQOh/rWSHliSNWN6iE2r17FeUxwqxhdtHvCKRI0qmwi8kdsnwpaDklKHni43yoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Uerwpnfe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Uerwpnfe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso734918166b.2
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253143; x=1788857943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=Uerwpnfe0YtAHFqu0fEgO19FcC3HQH7V+smK9iV8U1IkjlhnJiRtIvYYJKkpimm56C
         KC7njpMdkKSJtio5obECYIA+p+NdTalx1AGgWxxtg3v1tE7Pi5no4GhQnf4sn//yeqA8
         eh0AGdgErpC6FSE1lqQLa8+NQj91y8dlj3Sx9MrmB2OXKw413JrW1UrO1phnXBfUCbmE
         PxXsiar2g86MZ1DUJkdfdcaJONwUoVDNUv5+Jch5ZfkaK+KGFQTmG9qLxfcEH79rWe3E
         S6PHJqR/5eGBZXgJN/1VTkvrg1z/f7RBdcfvH/r0pDtAdUs5COE8XqhNpEBCI7oWlsvU
         rPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253143; x=1788857943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=ZzEzS3+EHGr0AOUKMtyQKl0Mj5mVF2Krya0kAdtAa/ci9uBdasraDbprmBXbXuiji5
         WsIs5nfiXRq62kTRepKQdwiRHlYYkMWGYwy3DCUqChsqUzOV1aseo+EeKQj5D5cSRhf0
         kU7UKbYr2nBFjwIYL44r5ARBIDF6IGUHnSCCALDSuwAkeDvEt9CXyF7WtbzWM1mxnPpA
         vOAj7hll/WHAvJ6Y5QzcCuxbM+iAZIJLnRvXWMu86jwlmb/X8s5S5KaXFm3FR/LmOMj9
         SAlgxjxT8Dz+vBm9Kp/dSY3SGi6apkeQs+TW6+0dmfByvDaxAgbwwNLJMAXzqff1rngo
         mB+A==
X-Forwarded-Encrypted: i=1; AHgh+RpNpH7H8EkqchJ75QSwc0GALNHFGfivVClQBGyhuFxjSjEDeI3GzsVLW6aJtD5DuSTjyB2Dq1rL/vybGw==@vger.kernel.org
X-Gm-Message-State: AFuF++m2S2AvuZw3juZ+T1EoA/L2PSa+Pd8JP/Pr1U3Y1ewTJn07nycg
	LJKoKMrtwT7+VnYLzd5xyIWD0TQ72gJdLUF9zNyeTl79yo9R1acv2K207B2J5njhmGU=
X-Gm-Gg: AYBFou0TM10clnWCCAmHUFHEdMJWVKhuYxl8vRhF1ZwKjh8ss1gGKZ4dEOf+IOpQVm/
	UlxqUxZgsDxBT0+ExuR3i14oatZzab88aq7nIaTfmivuqdjW/nRsufRr+/AjfJJr80orzBNjN7i
	k03Dv7mrJAEty5YtTeePeaZ07QEfDg9Pv0Z+OnDXuNv9SVBo3VtqN+WaJUpuz9ebpsxgEl0C63N
	VkkdcV0KxQplEU9xgRt12q1+LU8WVxbuD6mzqcGa0FMyU/jxfvtK/f9+SwDKUN5Uaw+uuLWoFK0
	l1JhnSrmmX6bMcUxtZ84mIdBAD7m9aZOPXG1tBYGqTdJ8zGCQs3mb6Zc2blU8st5fJw4QslcbKS
	Wgkbh4K0AQegex0jw1birs2PajNVYzXmdVTDC23j+MqsQ2Vnw1jOSVranuVrJAPiHnIYt/blWyE
	c6TLEu0rmXKXdKJHf8fp/I7ZVTMscmIwNAk1UazcBs14b/Ug1UtmPBjeJcWHfZg0mO4OTLnnwq1
	fp0ElCNflExUZbi+x0VNVz+TJkfnBbVB8Lxm4xSpRddtrLwPkt/Vg==
X-Received: by 2002:a17:906:1005:10b0:c21:4393:c41a with SMTP id a640c23a62f3a-c25b3c9a988mr335100766b.11.1788253142843;
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:58 +0200
Subject: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in PM6350
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=1979;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
 b=wTcjvPwxFnWd3nmkZRvV9d8daVlU48WfygpIRhMf845BuJBjV9RspxVJnrVwo6g5N4EdjTlGD
 05uVoGUWRcuCCD5BZKIPRjjPbWFAA/0jMQgWoGa8wIFyBOKpBnkxDT9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
are not used from the rpmh regulator driver on SM6350, the regulators do
exist, so add them with the types based on the datasheet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index dd2265961151..7d20f3e47760 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
-	/* smps3 - smps5 not configured */
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
@@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
 	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
-	/* ldo17 not configured */
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
 	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l18-l20-l21"),
 	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      "vdd-l18-l20-l21"),

-- 
2.55.0

