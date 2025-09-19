Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4E2F39C3
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275966; cv=none; b=njaKFalCZDDfWSvMpQGdvWqtu9uzN/zAp87KJXjXUeAfljaw37kutGLPwnQjxejTz+sT8t1C3zweMaVB0ROs1rxLFXhy64hnu4rXLvgVPKvlPQsys+5rIgi5vygTCbAo8myhkW5xzjG+uRlKVJjcz5/wb/HlpHbvUHCNUAGeXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275966; c=relaxed/simple;
	bh=vbP03XlE1h7xnXHsE6YxSmU4t7foc5GMAXHOnth1Kak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fW4CeGv1F8m1J01ZKpH7lllWDQPR0/0ycq/17i1wUQq6ArOCtRgawQNQYyw2BbwE7LjZMM5tFlMOQN7Dke+y4Yuqqcry3o9FRxDmO/O8/WGOgpzBwlDOewr30VoFh/vZ0jOcEQD6T6Q44+J69Lf4TmHqbJ2BQOTWbtlKqiepJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ljLPR3hH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ljLPR3hH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f4273a404so5593933a12.0
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275960; x=1758880760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRCjBM+UZmtDkzaHBLv8yNwvYcdqAmpzBt7Gyq2DkH8=;
        b=ljLPR3hHzSJXcJkUGL+iM62KIUPeW37CxYkOshGTYxeCiUOHiN9PY2r0PrSwCj1cUh
         BAphtPA3BKJcN6atFC39OCHXAjVU29ubGTvrG87/BziM4hAMHrlCqcjInisWvVR2XwL5
         yqHi0sEgurQ89N8rRfSrF9T2VEYRNiKIWw0seIcrQbMl5zg2/BhOyFlpNbzPKl9kDTzv
         6R60C2qXmWR5QJsOsuWeJ+m5Iw6koacaRCu31tM4HDPCZM+hGze3B2ABpoXIFfpf0OGT
         l22Kyrh1XkJP4oY9XUbVC/gX+m0dYMwqOvj7e5Mtns9wpwHwyg/Mf0KmMlUcANqq2apD
         I/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275960; x=1758880760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRCjBM+UZmtDkzaHBLv8yNwvYcdqAmpzBt7Gyq2DkH8=;
        b=tebLngYuHHo9GExE4BtlPEhdfZUq+paAoUvqFvQjREaYTkn8CiJOtvFeedLXoyMxu0
         3YfQSfyyeCckVsCdspoDdWslssq+Dto43GGjbrcDvF8tF5T4mxsc+Nx7YFrLMhapwMll
         6NaIm8CvJKA4Ei/hpt/IqDtm8PBA2/tJv9T2f0ERwOzbgG5T0QC53GY7M7B5F92poA2v
         xvusV7wBQd7rApNXU/OwhI5OZqynD9tZ2pVtxwAvvLEXGCO9XPNz2UIvt1iYBOMbSE/g
         j3qpaRcRwtZivUUOrW6En/O/9OzNWOXENCVYHzjLRcnEYbXyrRvqloyw1u6i8GMsETq8
         ltXA==
X-Forwarded-Encrypted: i=1; AJvYcCXqCIMPrs25S9L7yUIPjuqAUNz9WlsRxlMtnvRYbB6BmlsKe2X005P9MhHVwyXV6YoCKaR3WfKDJ27Hxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWt37zQPJYH+53el+/8vYYssOv217q+xFgq+FP1VqRNtsJr7dC
	X3uswKAAMTfjqANRxZrlBHr6+glznN1vwv2pu8wog4uS63cd0YuTfRazV65XHGZsujU=
X-Gm-Gg: ASbGncteypgPYwu71yU/zJ3bs4f1QYVsGEljPp0q4RQhCSPz2utH4lY2kx0QbzMYQSZ
	iB/AkMHuiMMQ2k1PFnKLNJ+5O1dgThveufroTDxNdxOfcuyfrLeuTlBuQiGh/3D//R/FIaTGHJ2
	RmUxd/xMisZkB9eFeTr/jmZeyfYV2GxGttwvmsd/z3zcoaD8rI9w5JaqanMczGp/EsolpGUYtP9
	8eVlAxkGG6v3hOUVpbynmv1aZwn1bontX6cqgK7an/i0MHMqxdKv2LQ+1QvEvzigjfEeuxM4bE7
	MZqKfwnAERyVnFO8rZZygRVF+RfTobY/vQP6Y759AuJsrv3nw3JElXckPN2m8hgvJGPEyLe8z1w
	J1OoKumwDxL2agfwG/F5PJIvIqc8w9RcbBkINsWsT0spHIWT5u9H6SmnIQbakciXbiWalIw==
X-Google-Smtp-Source: AGHT+IFgmVd41y35n12dNNDHlT8B0lvOLEpxp28IQxQRb5l7rrryU13J2m4N5veYjKoNAlTvU8u3FA==
X-Received: by 2002:a05:6402:20cd:b0:62f:a06a:5359 with SMTP id 4fb4d7f45d1cf-62fbe458ab3mr2516436a12.11.1758275959599;
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:24 +0200
Subject: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=1177;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vbP03XlE1h7xnXHsE6YxSmU4t7foc5GMAXHOnth1Kak=;
 b=oKNSfmdNf301nQfc/PDdXbR7+ZlQdp0XSLyKqYLiOBuBW9hrNj940/clNKq7jd1x61ljxPbO4
 4Zuv5gmqejyAEbeikZjWbZe8LVq/5JdMsfAnMcmLjFGp5mtmJrE06iX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the offsets for two resets inside the dispcc on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index b0bd163a449ccd2b27751e32eb17a982facf07d8..5b1d8f86515f251d90e01a4f3cb3b5582b5db683 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -679,6 +679,11 @@ static struct clk_branch disp_cc_xo_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6350_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x1004,
 	.en_rest_wait_val = 0x2,
@@ -746,6 +751,8 @@ static const struct qcom_cc_desc disp_cc_sm6350_desc = {
 	.num_clks = ARRAY_SIZE(disp_cc_sm6350_clocks),
 	.gdscs = disp_cc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6350_gdscs),
+	.resets = disp_cc_sm6350_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6350_resets),
 };
 
 static const struct of_device_id disp_cc_sm6350_match_table[] = {

-- 
2.51.0

