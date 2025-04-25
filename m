Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753624BCEA
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583195; cv=none; b=bZSUJDhl3eVjFwwmGkN2iQkWYoi6LeoRbZDzNOC3Ctu88i5887K+IjDUr7sGOaX7qstob33Shj6G4JNtq/ZmMeDCmJhKVzVjZUX+ugPsEgrNRWuzxmhG30IsgEiULKopS575IsDxPh8BHRy2YQWyUnFdSzQPubVnmrLmYttNST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583195; c=relaxed/simple;
	bh=66IJFF8tZyQ+XtDp+dxYFdjNhXj7sR1ftMG5k7qIick=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xmc1dznd6OuhQs47922GvqwhI+ZaFDMAPOLxaa4TJSrBir5Andj8ikaLklEMJZWhpC+dd2lZ2N+jdfcLKrF/hZYEnLcsUbYEYuVv2gzlUj0tvlkmoqE24x+w8VAoVbde8jlTzahlQTIJFz4c4UeAUC2HMIP2P2D8c8uE3LgGI6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fgmQVASi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fgmQVASi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2597883f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583192; x=1746187992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TgKVC0Gmp7hs9p7yLYcMp+rPuHQS+f7+bOOeFXRsfs=;
        b=fgmQVASicR4SH+b8RGOqbjkNFZRAaYz/zeEdy9DaP3LYtnhZGwAFnD/MJXPPNbv7Hm
         STsLbV2i6kI8E1WRNJxHUqcK+wEgSXVm+KHNkhqRmsmnujUSmqfJpPA1Wp48uJAsxthj
         cZ3yrnJq9Kmiu4Nav3gjy7uvbblnHwug2swGjmkondzLwfE3/oePiy4gmpW9E+zQLlXD
         7bL5NDkuaMzhsDJD4/eL7Q+UQ3U49aHCTEdRP+ZEZP7iIKCa9kmDlLCAtLQ725BjQjRB
         LasD38JhNlk82q45NlJjVYAtZPvpdwmb73jtcijChUx1+9m97VlAHsDa2i6mvi8yhZtY
         eN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583192; x=1746187992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TgKVC0Gmp7hs9p7yLYcMp+rPuHQS+f7+bOOeFXRsfs=;
        b=NvU8+D/2FIUPk8aNYb8iupj/mUUYTSpOGW4HK53etjcG4oE8FCtlHH2rVF61mtKm86
         R6hDt+LblCYlWbsnx6bf7wut9Mnom/pnAuqMaS3iEswHyahOdwR9pEZwUj2amvq4G2e+
         kzP/6nUTwg3j2tIV2HcRab63PpUheWASOlb8E6HKz9x/O1wOAim7YC/mZx5su+PYCEJ4
         O+bi6LtHyiZ0G+V4XChNhEEnkP1PFv0JAdcUYKlW7WW75J4teuXQhKx4ODArXRRcYEuc
         vc3G2usbwZJWAOxWOwMvcxiXO1C/nY434XF0fYM5fVIw615keysXJGeBeFKTilRtm/MZ
         Ae8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWij2MtCDhZPHRcqKPxcS8iiwbhdUnyZomnyo8I/XPk4toKo8nM6bmRDG+S2IInD57nc6bP4leyl9GrJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/0NHJTGRqTfb+a1q8duajYkH0M82dTFr3AA1iBFKJR0jBor9
	D+UYyZL0xvu+UZ+xYtbFs0VSvYVx+EhBRHTJRMbXJpCYVmY8B2533YRlAWi2qE4=
X-Gm-Gg: ASbGnctAWViA9iCK2JiEbFMBE3axbjP6gHq1R68asGAOGSqCM4feKUxJY/udMmU7JKl
	oqlN8K+mdZ/qlI1+i2C5nPVDLUocOelpfUkFPRs+H2IXqiODFSoIvzpp8uWXgGNENdJ4+ho0U9Z
	5pwWnfrYUObpJ7JZZ2fuppFedfF+7clgWWGvW/REMNc98HL6LxW1TACRNjzq8FJnIa8lSd18fIP
	5Iohh1cM3EeY7i9g0MbKsx2NpuP+j8eEXSs3QcMCHtq8MvbYBy8njyN3e63NVTImWluW0Q84UmI
	PT5meXgDnvtzadkHv7Zb6UyuQGWxN7F9j8qvThEaRLBxuYKgaJEJN90SEVd7ch47xcaSqUXAvEz
	8csKDfpBWwBJEMRL+8IIB2PPScL5BUbysftvP94THZ0oztGEM4pTq2RC7
X-Google-Smtp-Source: AGHT+IE0cfvasr+2ToJg0EBKEjRJcaZvkAeSTDJGgH4fyh6HVWM2G+6IlyQw8XahahxPUHgOjOSGHg==
X-Received: by 2002:a05:6000:1849:b0:39b:330d:9719 with SMTP id ffacd0b85a97d-3a074e2ee14mr1430875f8f.17.1745583191703;
        Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:58 +0200
Subject: [PATCH 4/4] clk: qcom: gpucc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used, with the exception of
gpu_cx_gdsc which has an explicit value (qcom,clk-dis-wait-val = <8>).

Fixes: 013804a727a0 ("clk: qcom: Add GPU clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gpucc-sm6350.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 35ed0500bc59319f9659aef81031b34d29fc06a4..ee89c42413f885f21f1470b1f7887d052e52a75e 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -413,6 +413,9 @@ static struct clk_branch gpu_cc_gx_vsense_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -423,6 +426,9 @@ static struct gdsc gpu_cx_gdsc = {
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,

-- 
2.49.0

