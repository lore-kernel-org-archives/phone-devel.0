Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC63E8C5A
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312757; cv=none; b=MaPGbwYA695U3V2SBDFUlNqDkcFRMhzxahqPtifZ1zpEoS2261mA5K8EZADjRLjUFKOhzlV5A1kA6FCU2yXlsao841Fcwa1t9WGLzVPLv76Elb5SYUCgiGCL/+ReiFvhaQgAcS1nwpUyyaTPrUNboQR0q9t747gMdDC6m0IwBvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312757; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESz8iVYvU5R0pEaHm4SoX/IG0nLe9QLuN6UYd2SsFl69uMvoJPZY43kO3ZO1xQQBu83mPRMW+auTWTR8QrRcLmrsNjci+KZ0NehD2+3CEQcCvk+bX07hYo4TRv7rM7hWTW74hg5OsB6ICxfLoY3TcxVn4Fc7ImVlvSaeZik2P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ZVQvp6; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ZVQvp6"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b37d84a6b3so108936147b3.2
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312754; x=1777917554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=p5ZVQvp6TM0j/+XHmRcwDNTJPWaN261r7k6FsjHaTGeI285qLQCtHQJ9xgdScU6pbq
         RpNsQFtN7RSEGE+ccSPi54ek+KbCMYOH1YFuoZuHBs46NpR5Eo8xk0vC+LCdNhq4X+bo
         DTTarJZYrpketYNy2mA7zctymOEntvlvQhtitOu5ZHB8+8MGfQsFgVh54Vh4Er0AveP2
         f0u68oWeGx+DclCKgDfAj8M/8/xbGBaXYs1zXtUV7SMjrVMCHn0MAGUGNiJagr/IfImA
         JvhUohoOaU7lvLMwFTnJavaR18b3hdQhiod/hONYoGfomp2xXF9wglSoWCPdcROJgrX+
         iXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312754; x=1777917554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=NEdIVi+35rTZ/fpDEsIrgepyjEzo0vc2jUtpgO81ePcGxSJj8pbuYRDBK5zZ2ybJcP
         /Ei5i1S1iLVK2gr4vZ36WW6NEFLRNVJEbceCrymg1GNPiL33gPiUh7/SaFi/Ecv/EpdC
         E9ugWl/fK/OFijRxxvKO82fhh07VFC5aL5ysEzFFoaJgvarRVBqX7eTcos+L6Br7THC3
         fVboL93epjMbaa4wX0AvVVUNVFWdyXdVlcj3Dn6tB2OJxDHcL1MK7skDbc/4n4CMTtuv
         lnFHndBLvql4ajaQr0TygfA0u7T/mhc6UqZ+yEQMZTSRvDs/1I274a2fQhJBvhnBZtNN
         oaBw==
X-Forwarded-Encrypted: i=1; AFNElJ8lO52D6jNQ+Wqa3CAd1xj5a07nxa5Os1dTGUIz97bpt8+y8uKKmwNATvxcpTU4OERpyYGDVJ2aaYoZQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTE/TdKGh/2VvH9AxTCft0KzcK/D0IQqBaIZ1AKyWuGUaMgsAM
	DLl+plpnyTNkvfzO4mNAK4H5WJ0kzVWRgXsjWPT6EfzrTTWG1fts3EjX
X-Gm-Gg: AeBDieuQR0agVFhqZZ/FR1z2AOQyThw35zEovtad7AdoEC4z3RHEaQX/5HFS3j/IydS
	sVzfjfuEw7SNgnKSmRN2maem6lXr5VfIv1G/VDN4I82Hzleyt/MuCiTfWX8ds3RWzeUbPDUSfMP
	kLltOalZbE+ZlyZCQ6XIAnl4z+0v0YljrHReYbRqZV+AdpngFxtV9BuFiwz62kE3dxV3ObbYYoK
	WLGtfWaefrT1ovpvrzgsf6kByie+OGTsEuqxj2hZPiHq5CZdAIicpB6+iUVoAyLxbxU6g1Bmxs4
	LuYIROBIvxe0kDjtt/PswLrxZC4NL0j0zHraJ5heGSJMKAygvQHZGR51+Xmu06m9NQdsHtl0Syj
	qOeWmAP8uJg+stMkV9lp4Mo4tvrhsP1dXL3qkwUJcOgpARhBaC9TrtJnx/kXzQ+iX1WOWVsxhlz
	VtDKNVHhVwmOt/XE+VXNwgK8Pe9UGOGzb8JR4w
X-Received: by 2002:a05:690c:f06:b0:7b8:338d:7d7a with SMTP id 00721157ae682-7bceda1f77dmr4172297b3.14.1777312753954;
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:29 +0300
Subject: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
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

