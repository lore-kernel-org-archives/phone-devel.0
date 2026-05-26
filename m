Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0D3FB7E5
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802307; cv=none; b=MdMh9T08onGKtVv0nC7s9MALV4zGRhgCXu48s8fqmvPwJAOuRgglY2vDoEspWM29KsGkEwzu1Qds/m744Gu4jr7Q7X5J6zTVjE4j++oTGcvmENhh3unWcmfrdqHt6yqS6JC3lT4xgwjT0k3wrO5S3rKV8YJupMPI6b7pt0iZUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802307; c=relaxed/simple;
	bh=XGtDm0iA2CBt34o1okB+xYp7cM9M0icTJZWbbBSl+W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccQUWYo3uZC19WjEwD4mVUL5/YSzoUj4EUfZXz6PvJunm+YdpxLldteVN+mIR9Jg9JhDtJCD3zVrpZ08OI+Ng6lgDlyZIA9ZyycVbhygMfoUeFzdGNtNTZtMKUPjf5C1Dg1z/RooSk7ZmlAQJwuPyyftnsYryJB/PQcWa6tJAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFp96kBh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFp96kBh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so50518685e9.2
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802300; x=1780407100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=qFp96kBhche/eFWbLQbfEp7AzmsHTG2axZSFrY300/n1iU5C2xqJKfKF1TouW8E5iY
         XgInZZRxLw8Sjb+uOw3LOfEOK0mOLBy+VnyP2wJdiQ0JJvoYP0jWtummAgYaiZA/iUYI
         wt1XKh6iZZpChD+WXjD1CI0l6aV5yynl8ZqXk3tjPx4rEeuDLbMOlfg/+AsdvuIZuaHB
         NeGJALAmhiIBMQPexLGOLiUcqQAiKm1AxAA/e4X7etQZhcjDDr/N7JKQ814GBoYKdsHE
         8rqT0fiwt6gwJphrx7px/Zo+RQgm5hJ4Mu7cgErfGS0LxO6TqeQLmuZsqP99tvvrTAOO
         Yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802300; x=1780407100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=R3uOYbxcORh60CI+U9AE1jpIaGnNXj1YkJK0K0DOexKl2v4Jt0cspg+q0B47oKdDTL
         6NLl1I/Kv56enPEWniHHDxbgjRshDNSoTWxgmGXS/dRcOf7ENtjVFcK216R2590aUMvz
         FfCE0/zwkzx+BS+uJBhOp7i9A5Ev/Gyind2JdHZIZDhoQArmEGpBnwxSaMhl/BuILAKv
         rO3SKYPbIpRmBI82PDFEZbJ3w4BCKTBHxaiYRoVcyh+uf//yTJlMogIUHmOdvftKoheK
         iguOaF/w6Wtqw5uGB0p+TVHxhorfX0OMKBi5JeFj0x86hbCZSDKj5prtRXP2X7ZX3hb8
         pLEw==
X-Forwarded-Encrypted: i=1; AFNElJ/q0edU3QoRMlnKn/zbpH27sf7K3G15pDj+tMw/IhgQckTmHc4oLBcs8DOlNe9za0Z9LoG16FF16rCGiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCHi69y7p3zSr53tlupLmdPAnOHNsIzXBu+0I5QCxibmxl0L2
	Jo5G95r8bnPczheiexXcy4lW68Ii5WfWMHZPd6VpBswOYM7c1VpLc14M
X-Gm-Gg: Acq92OGRYIBo4nCjoBMioNGXk47KneSS7ZuXw0vmX0IPcohV/toS55v6HWchyvJIjra
	mzLCtabxZZ9Wx19EyeHlJfDrikeZpiLJxgfDTJdFZt7w1yS/8xTNFhcYP0x+yz4KVDoUG0zSiAD
	df5iqNOoWGSlIcsB9bcrVWh3abtg0Tznp9poq5Uro4wXBWcUCssAmav/5JYNKCshVYHuR4k3KP3
	OdUae0oPkb0KXYRHa+voRXnG+TMs3246GGx6yUq8xpwjBRxVEuBy3bwq9c7jif3dYgCUoTezgwq
	J6iqkbkYERq+ZSmdwqm7EkDBpj31GL4HOpbh0BMEub9VOdn76RmzxTieQHGkBxLCAR8iL6cKJm9
	kPGTfRyImOQaWQz6w3OiJ5e0PrldMz8LYPWGplRumdiNaSw6U0a4qqK5s2VylvFkqnM7fpZJI98
	pbuerPajBc0RLPLZcP16P/PZhEcw==
X-Received: by 2002:a05:600c:a402:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-490426c5b3emr264652305e9.17.1779802299999;
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:27 +0300
Subject: [PATCH v9 4/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-4-bb1069f3fe02@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..bd88e2b484a5 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
@@ -178,6 +179,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +687,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c1603eebd757..46705a666776 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -88,6 +88,8 @@ struct venus_resources {
 	const char **opp_pmdomain;
 	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0

