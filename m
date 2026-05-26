Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8DA3FA5D4
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802312; cv=none; b=vDB2HjZssWEzJPUX+ZjwXrzBu11/TThxISIERnpORHQL/cfSWYApsUkX30lVMmZdj/vhyCI7F76bsqgRn37PYczbaJhhjsBnnE2Jyhy68NI8CDEzBdR4tmvKLbZt1XrhRzg365b3+ElLlblTydDt7CaEhluUv4mYty7bN0JZa4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802312; c=relaxed/simple;
	bh=DevLhieZ2Jb0JoG3u3mXqGfpLCKqdiC/50tm4MHf7SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XB96Carqav9eGkw+6d6drhvw9/uI0tg4IuV5/Bab2hrvog8GVdEzUiEk/n0De59/fW3rPFBUWwaYq6vbUvXyYfM/gK2joF4+IreyGe+Aen2dITPLchCu6GZTDkVOGB5nUsgVXuW27t0uIJlcDfjaxi5g/SANjJt5APUn+l011P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrZTYUmm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrZTYUmm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso54683375e9.0
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802302; x=1780407102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=MrZTYUmmg9/KQcCudWc1YnxidIPEaKqKlH+V11h9z2R80GGaxsHtIgfNM1fSm1zZOW
         7dxaiW4b9pfXsh/Wk2+8Ecx3nGkuALUFkshw9DaMqurjBDI6swKk1WRtTOLmshHvZ0ju
         OIGM+a82zpyh0E6I/rfi8sOCroFdvY4t+HMt+6fhWmlcsExqXXnd9Q2wOEGF39GUCtmA
         yypR7IrJs2KBmO4LjJfbNuVwoz1QeYXgF1kYJ1rj+Po/qYWMAT7AKUCEfIdoYdHzFVlb
         Jluluw+XR/FUXlgoqUmDt5Pg7bNWUjP5mVgsUA/4ZSgsz/xQFQF1rrlzUCr13anqR0sQ
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802302; x=1780407102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=mG4hhJrOXeHIHVMamCjuF8sTQvxhrrUhYQYqAiB159iSo4RLF0+dTdM75hqefMYmM8
         mQ2iki3N8BIuTsYfJHgnEMPMrRH9lDWMBfQLyt58HMD5NDRduu9Yw/FnIkUaLzd/hpx/
         SfJwTIrYFOT7dbAEckk/hqJ4BeORrnHSF+CwfU7c5XqlfE5qZnJTxvCXMM5zRUieTSW8
         CO00miEWiXalG4wH6Wvt4WPCalJ3QRm5+sr7kqUMsqSaehUGAdHV95xe+YiTxJU61Lz4
         4aSgba8YQiV/jjf7ur3oqED5DfjXy407nojfAKMWSFm0NlmazGoBcfpiPyovP7MKfwx7
         D2Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9WGSi+9ieDcIX07BabDfpeLQJs4UhA9oMUIHDyPE8LbtARjrp5/fc+TbmLFUWWyFPFhyyJPbV3jnU+tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwklYkwCx5XeahtKHLQxTKXpWuN3tjKYSslb05gGhVIbH44VLQ
	aO/pFKCVLSSs4JLR9oiOKE99LYDeBYImlL+4dJmHOWP5FxYjNTfALrr9
X-Gm-Gg: Acq92OEfzDD+XfZiG2SUNTL/5Z2vvuISv71CObCqrLVA2doqJopUX3AekiZNWptTqF6
	LdBrRXNg2NA2X95qFqM3VTKbHp3V2N8Qs9tqxXr3i1kLbqp1yUIcQ7T1ICWmDBHy+wQpBnBLwvk
	ryCgMeCsgLEcxzztGGNdRnHZmHT0Fcjgivm8ObGC0RWyd6ULquN7D9dyoRfX2mpLj/82UTXgEL0
	ZO9eRL5FoxSg/NUgYDJJgm1uHT68IMxZ/fpnOjqSGqGEPxqyFbsZ/CIZuIIalmmH82nrqgl+zHA
	Y81lLsyQLbTtsf7gdcH3nhueeMkbEShcSPI8QxIxnGBGSNffA+v+7mrFxMoSbfQR+XwLgvKNXQy
	WsfeixW4Y6J7pToAAKD6NYRJgzkF8FCbk797QZnKtsjp8DD2bhgRedxZ8wI00dMPvXWdkM4XQsl
	uEzfCGc36wGCvjGcqdfcYYW3l+wQ==
X-Received: by 2002:a05:600c:84ce:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490426aba7fmr175000465e9.15.1779802301797;
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:28 +0300
Subject: [PATCH v9 5/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-5-bb1069f3fe02@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bd88e2b484a5..243e342b0ae7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -693,6 +693,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1133,6 +1172,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

