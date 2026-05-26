Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E5A3FAE1A
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802304; cv=none; b=MWrdfkbLDe48z1BHkzRrZojEGiMQir1IaWrgYjIb4WJi/xVjdhg6xAIttNC9UKNOYvt9wYtvYpuNwME6vGX+suIkoM/Q1QCxSSuElLziirPxMLPLOKqAjZWKfu/N8rC7/RllbdStWns7AIytZaJhW7iaECcSA8Mv87zGl351MJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802304; c=relaxed/simple;
	bh=JnLKribf6AOHWDcyQv5gYJuWC2U2xXYnGbnDQ8hOUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neY7uXK1c6onhx3k8lRG+amVCQTALfdeYXF/uZveh1qNUI/nNbwH9bc3HUKubzSiKjP38AjMT793JzYb/+t2pta5WrwT8JVTnRRllW0c2wYFvAKi3uQZ0ouyUDoK2VSP/QRJ2b72mSgmMCb2+s7TEAr9ochukRJMy0VZmJTLJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkFnESDZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkFnESDZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso90429915e9.0
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802296; x=1780407096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=MkFnESDZ7DLJ9+quB3dxFSDweMX9dE1XkK7rPHfSbBH1SByaoAfLapOwalTPAFOebE
         6dwiCgT78lSxCDTZGTSW/9w3pf9YTx6xA4E2CLksFQDXRyLfdqVx2eea5wF/xkcYytDu
         CUFrOjhMgTBkllaLKxTCx9cEnug4KR+0ByL+V1c4Cz5leD3ei/lBJ9G5BH9RWz4YWrhe
         EuXqZcfFmRM2O8uuUAbLRNNJ73g8phLPsG9rfX1lRm9szKpVC22HOBkOqk8hdnyGh4of
         49rDKBXFSN5NJee9cCXvW0Lx6U7x9Bma3j+0h1iMf2b2004N/L4QuNKdx8t3ezTnFo9+
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802296; x=1780407096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=d4q0Rpacdq2nWkRHPza5a1hF9n3R2VazjTaJ8P33/Va1T6Sc4rtifZo4mrH9+bTDH/
         xFpF6ZVmeVCWav/6A1XdAmVIAn43IEuuSiQL7Rx7Scmc/Wgnk95KcJB7usZ4T69kC5IA
         sZxka937PfYFqjlV75Eq2dj/SZPZA/ORptvKeyg1ljXuJ30Rr6d7ncXKTr1s9Dxuwr7A
         Rs9zA4hagfDEBWM67vEKq2BuHSbjkmLwp/HOv6lBMz+bNwHHzkBHx/mTEQTk/F6cnO9i
         NVbgeOANUGfDUExiMXA0fWbJ+kyfbpOdmG1GgQxEQSfEzUMRMUGqOc1/PyMrWVxbfJKM
         rNMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GHDcL1n7u4QfFVFdu3qKR2Ti63AovwZVNCpKPIFzT4hbAfRaYkIVNrZkdAZcSIjqOijZHRiwQI9cO1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqgGZP/LHG5Px931eUSf298GZcal3Zuj8vUpXcCeiqaIH+5H4l
	fyY8L1F8Tu1bSZof5Vaxbskw23+M/gqhQLiai0R/AYihQStL7rH3yZ3Wh9GwPw==
X-Gm-Gg: Acq92OEwYgm8poRd8rFU0r9QfezSIRvnWsUlp66Jx6SfzbAHPg+N7Z/yp+lLwWyavmf
	dRbh38l/q/yEgtMiLJPLhcmVGHCW2WQ0zImtOwIWGdSU9Z+n2dB75T/zkEWRG0J7fKqWFBBFQGr
	bX1csTENCplddaSrzJL6QFdN0vFZaowzv5tlp2wZ3eXZSQvD3c13vkZY3uU4Tj/6BsDI4DVs/7K
	2a91nZmEqENo/L2W6O+nMX4bCawi9BOKLyNJFU05Zug1wH6Oq3MYnXGwagTt+GJIwaA8/tuHYsO
	rkkvySqRKbtxHHINMinO47pvFhY6rxMO03WNcKCYq7j6QSd1ekgH7eJ83X2+hPx/V9HzwavhxXX
	TK+iq6uifeGVceEHRXVGs8OcBvl95I/4HhgCI5XIJr8Vfo64jgEKegL/ZOTFYRXqH2uRnd3BDhR
	YhnQ4X7pE1NN/Zd9DRUKv78WeJ+A==
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr352432175e9.28.1779802295540;
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:25 +0300
Subject: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..956295289ae8 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

