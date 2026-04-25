Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550A37700D
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141899; cv=none; b=jCxADze5jwS9eDhhzucwJLhXfNwf5PRC+NJ5u7WoKP6T6M+GF42JEMfCCjUF6kq+qQb5RPAUdH5S6i73Gi/FovE1nxMxrnNZJJGcxnhyvhmFDNpG7pcJSuYVj5q9JHUxsBTjwJpye4lpC5sEAaZHVo4brYCWvHZs8JkXV6ZydNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141899; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnnUL8KlQphkaLXMprEXQbHSk7u3BjfjovuTl1+zVlBrz0T5hWpdkMkhauGrfp3gokCOq/XtDRvwUYPfV+nPPgsh2WAMpa/6iq9YA2xnmtzE6l4VofhStmn1OcgBcCcYzVnwbVqI60ioVZIvDgU81bywcs2PSwjVUXiy5KC2ZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrF3ZFKe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrF3ZFKe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so115083615e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141891; x=1777746691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=KrF3ZFKe9Um4Y3L4wnLDRe9n+wB8r67xgvFCC4NiAHHcFkHppT/aic0emKbhfjOr52
         iH09DmjVUvThCR3+G73rNsinQoTR8qrW3SormLF892Hi+xu4ryjXo6V5GavbTX5l8eXu
         BVSO/B+w0fOjFEUUlRHvSfB7FDw7rF6O42q+tXfVygchbQsG4y/Kc3SSsdQgN34OOftE
         mGq7AXjjIoBSfdivAtVSkAHVEqDY8wVr5laeU0iu2JZ4Wxg/EG3Lhz1DeIzPlHpW12OQ
         uMHldYFtefdqF5C4p3baji89Ri2qjAn3jL6oHekijl8ijqPNPG7jGy8gYJ8ImbxQ9qlC
         gHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141891; x=1777746691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=MK1TBa9/zud7c2E9DvCk2TdjinVNh4aY1cljS/KFKAcbRYuS16UW+7nU4NELedo18C
         bRJlZXVILyY93hTX0KWLtuM9HFhLaxlFIRLum649QFjwtzpdr2XclD8/saNpgNPe2GYE
         u2La5VfC1OiJsANFtQ/ZXJN/c1vWsbQhl5ML9D1vOCx5VhPN9mMXMU0Z/6RMyvg1oMbV
         AfBo1V3523tkzPFUAxEFD9g2UK4tA7RjrvmtoMj4YcXEDV23iZJXGzt6rvd++OfAZwd3
         hV1KcZetbODf4/B9+HqwWx2KpFOnSdir8N7GtQdle2hTJtmgmRfWVOm72CIDxznzwx3O
         zuMA==
X-Forwarded-Encrypted: i=1; AFNElJ8kSW43VGnV5jk9A9CMKjuCPgFRriBTFxz1mwR4CGOCePaPCBa1P4ETAoYQlp5VlzBRKkFFpI0LlbWOCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YLA+IiSLkmUbFZmfK1YR6qUWgaO2kKt8ekrMyaY1vinuLE8k
	iN2D8ZRXqba5a9nyCh+WAfg3WLM1HeRBXYSqoKqEwWuasBvIs208jMLX
X-Gm-Gg: AeBDieuBq1peDVk3zZjOwCWA4gmxfeV+mLDEW7T/bpPhBgZsvsdLCitt75qaEPhIrP5
	e3RUYjZKuKNRLxJ5g4+EyoeYN8o+ZQDAEFmzYtqMgnTTNXZ+J3QNIC+UVW4Nl+XSwcLzHyYjNRL
	33JHX+EqRRMn/u555w8GHyZNhgKAG4qpsV+Q6TPnkT001J7s4oHVm38HzqFKJz91WujgPln7j8W
	Sg/TCwWqsYk119ruezdYoV6AxQK6comCBFLk799zD1vf6i5U80GaRoWPnHrEqfjuxbNTyOzmmVS
	CBhh/pWMbaT5T5mBJlxf5X1NAnLF5STqUpobI13vQI7JBRLMci8CkfOwQlr9+TpwNXcGCpLdlWD
	wtEPxBxvyLqEwhrMSMtUHQ3AmA3H0P8vTsfeui+O3w0UA/JlqCfcmuJYkdGO9C9ROR8k0MS0VqA
	BcHRnWGIETrIe8nz0hnCXmTfa7jEiJm2LN5S/vNipAdDi66A==
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr579670405e9.22.1777141891411;
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:08 +0300
Subject: [PATCH RFC v2 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-7-f69e52b36207@gmail.com>
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

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

