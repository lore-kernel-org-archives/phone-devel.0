Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40553009F6
	for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406488; cv=none; b=TrmEv8dvJyO0mbSiF6FXYUT9KdnRdGd54XUMW7f1Lzy1LE7acNZBScqPNJRdaqaOEF89vZRJCV0J17gBH7yYIFx2ivzYwpEZGe9VyEVn1KQmBxjrICdNPFIVT8BoBng3lc1CQtkAe+rbqvVgc9FLoz9pVFdAHsYn065HohEIAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406488; c=relaxed/simple;
	bh=LVWWWUYdv9PCfUhr1DTi4tk8Hze1kjyRj4+I8oegEow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0AXJtZGK/UfqzQLMWI2bJVnNTr5SkQp3PgVl7PBGEQFLdak4wicIxZb0VpauMssTnHxzy7eCT2wgELUtTy5kgoGyD+jKQCEepfEzraGy/BY9K5Zos4KHa0zP9nW8vWlATFuTbZaVss2/vgq4G1Eldt4BxtAl2z0mlPaX7BjTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKvODCBM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKvODCBM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so21658595e9.1
        for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406485; x=1779011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RKvODCBMXGHFhmD+8r3Nqe0oYd2nUXpE3d7VKaUzaj9Bla3JjpSb90JCwiz9ASi50Q
         Smhy3PQ9U6t3WSsF3BtGjAMHkmkAl1ZmCAW5U9T/qhigXX0qym9bsOLR1X5mMCL5p00+
         6OVrDcHWOgw6L2Hr8eCa624MwnriX8hH2T3e7zeRsfkHANW3Y8maceDumTCd1kiYk6Ht
         ig90YfLXoT/qTRt7/1aw9AoQvD5V35xxnOWDfuLD/k6sv/skdG+ArFpNfQEh5t+lx2Wh
         +/WB6/MxKSvzCz4680wdVnZeT+jVJkLfYKWOLu92HULup4Z0tlmoha+umPFXK4xTCZln
         V/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406485; x=1779011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RQhayy+38bHwRWDed6YE0Ni9wHd2K8H5vfAjLXLH9mgYY08Mh+E/Rsh7Wag5qN3nmP
         v7Bzn/0Z+Vk6M8/HzOcFLHf5MPZ+2fgllR9HvEBGSUCqfMQBP/fsbSZ0AIqLz2QqFhfF
         /hGIQPRKKlC2e6epH/v5wgADxTuyh/gcIYdYMoj0tutRVm/be50o3br7zxjmPsjtGu8o
         B7z6FlUxFIBdlJr12ATPRb67yIqCmb/bYirbXzfbm7wTrVHM37b9pojWC9vItaKo6vyZ
         r6Ex0Z0opcJQYWQxAqfl8HovIcccoL3KQPVjBsCNzKQnzxuOeUl2jRYxNRkFNLIX5B1b
         +G4A==
X-Forwarded-Encrypted: i=1; AFNElJ+v2Pq3JKmod6hgC3gPg3CrcozyrHnnkcQJgK9dpVoQTPn+ZMwcqhY4at18oFuegkB5ht77siECVvl9Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/izSgnFec+qbhxtoveg9MhteNzXo2PMvMi9RpAznRXerr0gM0
	+NBqheXTS06378n4psFpIg6jSTKJsLvs5F9E1EMn1XHiNVwj6OJ0GwUg
X-Gm-Gg: Acq92OEx+AEuj8r29ozU2TPe3V7N+RQNOvq3IiK64NkOOP1P+pGLBYDhrjsBhZIV2Ti
	2kUjXLYDIUYuCjvqpndLYis4TJl1o5xRX4QDQmMmOXXuKv1dBaEFAB6yqht8IACh452lQUDO37J
	NE3yxTfKVqoLlYW/oLT/YwGrSOvTHaGbTTcha/94BZ2IxMT/M9VjVIPSOUDpBQ+dfqZTWEwnrqW
	zcyeRkw/Ef1G9zXrwiNSfBUXmgJnuuFm7+PJycDbDBZQtmkz9HXNBvNN95jGTespeBlwvagwHM9
	sFKRDwb8ptBJ256sE9WwrsGfse4JGRg+nptRaRwlvnSJVP9shU5CKo6aujqxcptWKeu9MbF9l4M
	+UvlHyYegTKf0RmnaqugVe83QLlnEpKA7origBk63Kil1Ro2+t6rYNjCvcYjQU8xG4Zc8sg64nz
	4K3oVa4BbkKTaKTGVgJTOw8S7dZhD2
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr174341785e9.7.1778406485414;
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:43 +0300
Subject: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to pass their control to hardware.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are set to be hardware controlled, they can be switched
off at any moment. Vote for the Venus core clock to enable it later when
GDSCs get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

