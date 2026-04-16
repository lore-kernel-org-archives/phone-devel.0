Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC983CEB82
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347068; cv=none; b=KKxshmh9+6NoKogdEMsh6jJPF90/HaiPLFslweRJqF8tOrNM5UGDanxMYRWxiH6tpotZIuc3nyKlNWfjSUOfqCzreCnrthjV3Dp1T59sPWK7vhTNjjfZSPLGdjR1FWjswChyZy37Gnp9Cd1eQCdTmV3kYsRYqkazkL5wzJMyLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347068; c=relaxed/simple;
	bh=YUBIHQ6vOyWADg6NA3iKgMyw3HPZcQRKnuaPJ5Oo6es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQDxsfC9CvOFuGYqLdlNMgjWnH+tYb28aGbRi6sg/MM9zX24sk8vmDj+vdc7aHr6LygpYgmJqiMFYWBHhNGY1Upn6tZtdLtMOj6B/9yXn8L09zYSODnbNotYo48MPpyRTW7BowNJquFM4r1wGQ+VZKlry23bgSZ1O/C+BZFUxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3KSvbNp; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3KSvbNp"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986e0553bdso81184467b3.2
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347058; x=1776951858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=U3KSvbNpp35twvtf3aPtv2dGsRzOTTM208QLC7aO3+2jMI5h0+oh1pkD4YiHStL23A
         Qt3RlpZ9uU8/nrbFem4a6rPWqPfO5u3ABv6gKHuYdtMEA4aMkOzBrrsQVTmuAvOo/xQt
         DYwbTtkUhQvpYkXEwZWzKgHsCC3m0EerIyeM+Umb4/tcfdXk3p8+rvCIoK4T+igsNRvb
         5b+UhElNM2/4rWqpgYM6s+dUY/UhuuD5mv0DFeheXcSBu7/RCnptMJ1wjSGCVlmEyFz8
         MLTMJp2qxRfbF+bcTnnO4GkP1Rl5QU/fpNC+iwkUkQGfQleHQyBdGy1ie5Gr5tPbglsU
         nLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347058; x=1776951858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=hBJWsrdO8tvPY0nI6tFh3aliYk0xwMt2FWd9bBOGeGZallpf/E2VEG3oD8eooS3VIQ
         4ewmaruajcxP+Ku4xIwtzHIwT/BtfhcI7mOF7w3jRgZdEzbotTwwoDekxyBIW0EXc7P9
         1+YeM5Ss1z7N1OsXPC1Zd78gUbYjfR2vQfwOezqUyUtM6C4RowGCy2t1ROhEVeH0i21Z
         UrAMcgeN1VV49NkyAXPR7C9DOjuQoy1h6TSG/FUqp18cKt7JdH5LOZLFZWpvIjWBpF2j
         D2m4yrhWaBUKHCZOvAMk6M8uvDAjMxceU2n6aiL0ofTAUaRDv4aMDr8Q5qCnn4kg3ZWX
         BULQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aZJVzHV1swTFtQAr/aGaHGKUYWYH7zTLDfKyTBQteZARXuiblZqdnMeoMpzo7Yzy/eP0ZyZISwyIu+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4KiRwLDCQY0WiAtWGeWMWyjjkQztPEZq3SRIxuaSEZbL86uI
	34IpKnR+lDQyKnIUFkUabgbWAoysynB+lXQfgSETx8cMpfSaOZgtuA8Y
X-Gm-Gg: AeBDieuDjw9GqyqH6F2P6wmZ5lJAX0NyBNNs8pDZrVfQUjzSO3oj82gyyyXbWn8wgpl
	ky7zcxwlNQg/eIRjqSTkW5ItLtIQ4PdNYNoBzvDaEyMKh4IY+edDSBS+bd4u44Rucsj1lsDnQoH
	8i8YH3htb0/I4hFF7ByQP59nxlCxq44sEWzd3n4IREaBcArCIJkNN4UUIXb43XSz11Bzo8TTktS
	tq2TioWWEbF5lgr/nxS9tXhTxw89C+BuTZHG6wAFSy5Jzbv99UxapaavAwTgia2cgeC7B5QYocr
	QBpaTt/VhGxCIrpsTBj1f6l5tnP3xnbqkWHcIc8X/4gGejCdWLEb3cEvHvS0PWWaYI277tltJ1s
	a+B4z1jGqDzzDX7sXmS2co89SMf4lYMwGveT4zazJoVRCz/r22WzTLTyx7SBVMlgxkYrgVgSkAl
	S6kregr2IZ3e1w7kX7yUYDXo0i0idJpbayRfKx
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136804687b3.42.1776347058339;
        Thu, 16 Apr 2026 06:44:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:50 +0300
Subject: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.
Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
vcodec0 so they can be enabled accordingly.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..b67cf1628f1c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,44 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
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
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec0_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1159,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.53.0

