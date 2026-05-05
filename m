Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC803AEF3F
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017586; cv=none; b=EZ2UBu8crf3B8aSI5iwHQzMEXpOueWCrcWF3po1JIZvREO+qyhv3MpUEc16fV2ggGAKLNjC2W+oHedEFQaUI4GpFbGgAhB4BQ0zc2tj/AbymMQ4l2eWuNm33GFjAj7A2uHnM4NJd13uYcDnHdYU+xoonER5PNFj/8O2ysameQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017586; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/nii5R2S4HNnbWWZ8/mmGZuhSIexUdqzsOaSOIYk9KVpXdXcWB/EkZmzN8l8qklLWzL50I9kp2yOSg37fovxGRWqx4+vqg4ulN4dE5IcpO0k9gpszabielZ8+JnwfYZ+i1JMK2EBWNBgKh2K2LOCZtLcPxjd/PaO1Q/IUQF9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Uvygq1; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Uvygq1"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bd9f61458eso18769197b3.0
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017584; x=1778622384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=S5Uvygq1FZKhtZ49BNJNEiSxKXhT+JmWafkSN+Qjnny7ap4+LfP08X7BUuF/ufaCgS
         /2fr1PLcIoGcv5sKHdvaTg97YjWhZNtIaKLVoiE9Tfuy3qQJZK4qTjpAnoZVMg6f5Tdk
         0gx3y6ED2bjh1ZUj8dDKfRVkEFr7b6dsx4wSGYHFiAwk1z3RJeyXeyFFICfyfReT18F9
         kCHnEC1v7Vy/8ba9UN2twYp54trvKh6nyYXpYGOMHe3d414JyCOYEp8OxtcDWSof/EoV
         3+TxVC4oTZq3gJFPSZUR1Wke9WfaNJCAl3I4eOu+UWFAQjTlXILZuerKTjDEpeiWvkTm
         PKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017584; x=1778622384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=fQX+jvpkW1octybLlXInReSvYvLRRIea/gYKlBxlPCTq2WldwIQz8Pm2UDrV13WY99
         fPu0x5s6xK+crjYjZoHSIBbc5avko5PaQeMsBJirF6ggUBniuNHYVuBtFjKAHRZqxwIF
         jeLZhVg4tdKz6zanNmHJYYQORMxw+4FEZfW3MsawQACLfzGCowEYLnxCYcTz/HlnQL+9
         JWQgUJ52Xby+yu3dSl/+bRH+HVR10SP0swBmPQ2PfrarHNKhPpsQGkkGMxN218YER/ud
         Oqc4v0vgeiIs0CnFEw7FkRealIs4VK69Pkq/pLplU1i55zpvsGH1ayL2A2CGbLSfUOTf
         rJZA==
X-Forwarded-Encrypted: i=1; AFNElJ9q7UGF2YEf4JwruxhQqoGNe7lNup+0QNl9eek+YztTt6kP+MqAdGbvbVlIvKXDngfQWdg6XpdXefld+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnpnVdACRz9ryMgtHbVM8PD3E4osKHsUIUt/q0DqX37lKIPPON
	lj6THdQcWpz0Ybi93cY8fMEkeyEtmEY/hcXMsD+QBBnCzzxtGuimG6T1odDtyg==
X-Gm-Gg: AeBDietCttjNbgSAhVXhBZVY2yjkDmCgpX7Dt0JCUWr0bJ9EbKuBTrJ6gjn2wpXC/O3
	9wuELCvfcWCQJoYTBSfre7PrHf8Xa++YzhXq3w0Zi2XvibxvHYAxH6EG7pxIXMId/6xMSHtguDL
	LS7TUo1V0+CyEa2sIelg79Dk1Q2qMQ9tbMxX/dgNXsT+ibRLzS+IuRLIXqtlDtAlaOFcgjasfVs
	34uI0WyuAKhyXa9TLR/Su9flL7bEQhRRppOjiLQrTPhkU8+Hx0MSD5CyblYcI+54dVvgIuiciz6
	yQks6KM8SxsbGMVQGBkQyWaD0mP+J+5Jc9DWV4XalWThm1S6mEbUyiEoUSzOZqY8IcPZiKeczDe
	zoxA3niNymtkOPRI+QQF0kSreMU33Au3jopgAUHGOwjUqFD/Wjmlf1Lfxm1Hz9FxF4QOWJRJcXE
	3NaOmVzsGY9Rui0gSlrrqhMOEnZ49ZBl94PjZY6yJWbxkau7I=
X-Received: by 2002:a05:690c:c50e:b0:79a:b1e1:49cd with SMTP id 00721157ae682-7bdf5eb3683mr13883347b3.33.1778017583808;
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:44 +0300
Subject: [PATCH v4 7/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-7-994f5eb22acb@gmail.com>
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

