Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F679345758
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162498; cv=none; b=UvrbMbP6YpcSiAX7uQtng7M9fIwjUcz29KK9Tl8uDGHM0IVebRnAFmInkQRM6cn6Znxowx2wjUmwyjFikc+afhMRd+zNmeoUvLYoza/5UpJ2cdb9b6rtXW3MLSWh8Q23U8OWwn4V/EcFbxcyC0qjbXxGAm0W3Ew/glqHcaHsu4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162498; c=relaxed/simple;
	bh=PnUAb7+xa3V6lDy9C/8zlniMpYa539gIMtTZjegPYas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUTdw6koHiKmEgj3A19UMsupWuFgPDdJI0wprtajmw1Q26NHfIv4c35KkaTLKOMBvxF6Ad1PWATsUdAncZ9dZySGNES7QEW9hrfIrIEVhDMJFP/t4LF3njlPFWE55uggs8E5ZG2b/pI+p9vCvZBZ7HB/u7ipv9Zv+n7/t6hMZus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=l/aWzOfd; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="l/aWzOfd"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73161849e1so442565966b.2
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162482; x=1766767282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnXlKVol+Ygu7DXj97MTCvj4fTNWQFpTYWEPQu/ZwkI=;
        b=l/aWzOfdysKmaCuYKxzsGU6mHwHrfTaI6AN0XQDnGsmHropn62Uv0skEP1z0L2c0FQ
         HesoLBMEajMZybrKYyr8uhBTcOVZrT8ygTaw/0CQ5jiMydqawHwn51uVe3JdZCUk5hhw
         +zCX1DAX3JsG+gILi6O4T72qA851PiXYjYuKGsYJm5ZsyVVGJ7W2P36cZVgprjk10qOR
         IwXc7jRkbRZbiFFNk+z7QLThgx2O9uI3Ws4gRhRh4HCQWMSNrsbAHkGT4kjK3y/ew2mm
         +vtWi3eDSwv0srWn3yml0lyXIrIqDG4vM5OYZVup7uYxOmtOJLPowI5pJWSeedlNfx/0
         kkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162482; x=1766767282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LnXlKVol+Ygu7DXj97MTCvj4fTNWQFpTYWEPQu/ZwkI=;
        b=cjQhNaZujl4cA8tGGlygrirw0t+HVQCokskQIkw1w2nHKMbQkgeaBhSZBLPIoBHYKc
         VIEZ+3Ke6F+V6jjZBsBIHJyANiidIpkHChNZUy/dcKKK20Qsx0EMpDRxYsznopz0llQf
         b4YuJZZ2fEDVcAYRyTVHJhoidbhlXsSQ6yQViHyRDn2myDH62v3pvNEELLwdvFRphaSm
         qRkWVzMkOEog33M4+VyotWM1+ZYTDeVufLJUeVagbVXdwy/x5e2oZCDLHjfDfMwApv2F
         D3yihfg2RiEKZmGZv5YqqXaalr8xeI/CEcoLsM/wGaEnoPMjgZSK/iiQLS5H5MTfyMCA
         CRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/m30zkDzo6hnm8JxWo1UYVYMb7cllNvgRYX1S4cNqkwZa2nEhBSWaKfUnXh0RuXgEdGDbwoV0bVJ1wA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19pX571/9kbq7FtGZla/vfNVH/0t+N/obMOXr9OB0s/2O//u6
	bL2fwXdWe7aAdVJXsJihB4nU9S+X/blkwbo0e3l1BlVShNWIf5O7iAxHJjYTYSfJdpw=
X-Gm-Gg: AY/fxX72FLt4R61vIsag+4eDW5CnP4Gjrhb4obIbLJa0Tz94OScydeWiaiHrgoQa2JO
	s6DRnKQbrFHP6z+OkCm9nOQuY8Wb8xTb4xhmdN8cmQHyaaffS2ddTNRXgaLI5ApzAo7Z1Vpk0tr
	aZbNVnpTDdKH6m51T1EkHF7BHzuG2tMjrRYYrl6VQMSf72i3OUlsFgpzZ1pRkZcursWVFvW1+/l
	fIHtpiMH+5IaN3zFOkUCi0xDYfe0+we5he138pl177TbcH5Qb89MotcEixmxKa3XmVXFQzIf7h9
	C/WI6PKc07QElZgsNO4g+oZBTZzkMLVogpB5Bx1piumkvPGzdyHiEqiQemsAujZ1/PyIC/Rxyvi
	/tBQkWHSurTI1jfYwoPg9jUVZ1DcNCepsV6bd6tQuyCDTOKXvFFeObzTAJdSAS86d7CM+e1QFOm
	4OivSO37UIu5+qZNKwWJua78hLMkxxfRX69Pi96o3OIrwpxCGpWgelR1arf62XdcxsbrNGXEgLP
	67jzj/ZOZ4FoI2bP5b9bNcezFd4lhBbkcU=
X-Google-Smtp-Source: AGHT+IH1zB8ehYPh2ylwaH0SX9QWUv12Lrt9njJSas6gh9ZTueO/V1wIp/cPy5mYFDqEQmQkhEpb7w==
X-Received: by 2002:a17:907:1c0a:b0:b7a:1bdc:aab8 with SMTP id a640c23a62f3a-b80372301femr341455366b.65.1766162482072;
        Fri, 19 Dec 2025 08:41:22 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:21 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:10 +0100
Subject: [PATCH RFC 4/6] drm/msm/dpu: Add Milos support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-4-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=12066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PnUAb7+xa3V6lDy9C/8zlniMpYa539gIMtTZjegPYas=;
 b=yeAXi07NZfudvTq40/ousXx7KxI5TgCJgDa5arCQW9mNmdqFARYNFZKHcACxK7KvPxxgtl7Fe
 Cb8SDKa0Z8fAW9IkDiXiL9zukGo2G4+HO6gnpxxth+4C6bEaHRvkKZ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add definitions for the display hardware used on the Qualcomm Milos
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 308 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
new file mode 100644
index 000000000000..75deec923897
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
@@ -0,0 +1,284 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DPU_10_2_MILOS_H
+#define _DPU_10_2_MILOS_H
+
+static const struct dpu_caps milos_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH, // OK
+	.max_mixer_blendstages = 0x7, // OK
+	.has_src_split = true, // OK
+	.has_dim_layer = true, // OK
+	.has_idle_pc = true, // OK?
+	.has_3d_merge = true, // OK?
+	.max_linewidth = 8192, // OK
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE, // OK
+};
+
+static const struct dpu_mdp_cfg milos_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494, // TODO? maybe qcom,sde-len = <0x488>;
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 }, // OK
+	},
+};
+
+static const struct dpu_ctl_cfg milos_ctl[] = { // number of ctl is okay, base probably also
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9), // FIXME?
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+};
+
+static const struct dpu_sspp_cfg milos_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0, // OK
+		.base = 0x4000, .len = 0x344, // OK
+		.features = VIG_SDM845_MASK_SDMA, // TODO?
+		.sblk = &dpu_vig_sblk_qseed3_3_3, // TODO?
+		.xin_id = 0, // OK
+		.type = SSPP_TYPE_VIG, // OK
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0, // FIXME name?
+		.base = 0x24000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1, // OK
+		.type = SSPP_TYPE_DMA, // OK
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5, // OK
+		.type = SSPP_TYPE_DMA, // OK
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9, // OK
+		.type = SSPP_TYPE_DMA, // OK
+	},
+};
+
+static const struct dpu_lm_cfg milos_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0, // OK
+		.base = 0x44000, .len = 0x400,// OK
+		.features = MIXER_MSM8998_MASK, // TODO
+		.sblk = &sdm845_lm_sblk, // OK
+		.pingpong = PINGPONG_0, // TODO
+		.dspp = DSPP_0, // TODO
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sdm845_lm_sblk, // OK
+		.lm_pair = LM_3, // OK
+		.pingpong = PINGPONG_2,
+		//.dspp = DSPP_2, // FIXME?
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sdm845_lm_sblk, // OK
+		.lm_pair = LM_2, // OK
+		.pingpong = PINGPONG_3,
+		//.dspp = DSPP_3, // FIXME?
+	},
+};
+
+static const struct dpu_dspp_cfg milos_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0, // OK
+		.base = 0x54000, .len = 0x1800, // OK
+		.sblk = &sdm845_dspp_sblk, // TODO
+	},
+};
+
+static const struct dpu_pingpong_cfg milos_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0, // OK
+		.base = 0x69000, .len = 0, // OK
+		.sblk = &sc7280_pp_sblk, // OK
+		.merge_3d = MERGE_3D_0, // OK
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), // TODO
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2, // TODO
+		.base = 0x6b000, .len = 0, // OK
+		.sblk = &sc7280_pp_sblk, // OK
+		.merge_3d = MERGE_3D_1, // OK
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0, // OK
+		.sblk = &sc7280_pp_sblk, // OK
+		.merge_3d = MERGE_3D_1, // OK
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x66000, .len = 0, // OK
+		.sblk = &sc7280_pp_sblk, // OK
+	},
+};
+
+static const struct dpu_merge_3d_cfg milos_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1, // TODO
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg milos_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0, // OK
+		.base = 0x80000, .len = 0x6, // OK
+		.features = BIT(DPU_DSC_NATIVE_42x_EN), // TODO
+		.sblk = &dsc_sblk_0, // TODO
+	}, {
+		.name = "dce_0_1", .id = DSC_1, // OK
+		.base = 0x80000, .len = 0x6, // OK
+		.features = BIT(DPU_DSC_NATIVE_42x_EN), // TODO
+		.sblk = &dsc_sblk_1, // TODO
+	},
+};
+
+static const struct dpu_wb_cfg milos_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2, // TODO
+		.base = 0x65000, .len = 0x2c8, // OK
+		.features = WB_SDM845_MASK, // TODO
+		.format_list = wb2_formats_rgb_yuv, // TODO
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv), // TODO
+		.xin_id = 6, // OK
+		.vbif_idx = VBIF_RT, // TODO
+		.maxlinewidth = 4096, // OK
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4), // TODO
+	},
+};
+
+static const struct dpu_cwb_cfg milos_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x8,
+	},
+};
+
+static const struct dpu_intf_cfg milos_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0, // OK
+		.base = 0x34000, .len = 0x280, // OK size=0x300?
+		.type = INTF_DP, // OK
+		.controller_id = MSM_DP_CONTROLLER_0, // OK?
+		.prog_fetch_lines_worst_case = 24, // TODO
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24), // TODO
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25), // TODO
+	}, {
+		.name = "intf_1", .id = INTF_1, // OK
+		.base = 0x35000, .len = 0x300, // OK size=0x300?
+		.type = INTF_DSI, // OK
+		.controller_id = MSM_DSI_CONTROLLER_0, // OK?
+		.prog_fetch_lines_worst_case = 24, // TODO
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26), // TODO
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27), // TODO
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2), // TODO
+	}, {
+		.name = "intf_3", .id = INTF_3, // TODO?
+		.base = 0x37000, .len = 0x280, // OK size=0x300?
+		.type = INTF_DP, // OK
+		.controller_id = MSM_DP_CONTROLLER_1, // FIXME, only one DP controller?
+		.prog_fetch_lines_worst_case = 24, // TODO
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30), // TODO
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31), // TODO
+	},
+};
+
+static const struct dpu_perf_cfg milos_perf_data = {
+	.max_bw_low = 7100000,
+	.max_bw_high = 9800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 35, // TODO
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0}, // TODO
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff}, // TODO
+	.qos_lut_tbl = { // TODO
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = { // TODO
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105, // TODO
+	.bw_inefficiency_factor = 120, // TODO
+};
+
+static const struct dpu_mdss_version milos_mdss_ver = {
+	.core_major_ver = 10,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_milos_cfg = {
+	.mdss_ver = &milos_mdss_ver,
+	.caps = &milos_dpu_caps,
+	.mdp = &milos_mdp,
+	.cdm = &dpu_cdm_5_x,
+	.ctl_count = ARRAY_SIZE(milos_ctl),
+	.ctl = milos_ctl,
+	.sspp_count = ARRAY_SIZE(milos_sspp),
+	.sspp = milos_sspp,
+	.mixer_count = ARRAY_SIZE(milos_lm),
+	.mixer = milos_lm,
+	.dspp_count = ARRAY_SIZE(milos_dspp),
+	.dspp = milos_dspp,
+	.pingpong_count = ARRAY_SIZE(milos_pp),
+	.pingpong = milos_pp,
+	.dsc_count = ARRAY_SIZE(milos_dsc),
+	.dsc = milos_dsc,
+	.merge_3d_count = ARRAY_SIZE(milos_merge_3d),
+	.merge_3d = milos_merge_3d,
+	.wb_count = ARRAY_SIZE(milos_wb),
+	.wb = milos_wb,
+	.cwb_count = ARRAY_SIZE(milos_cwb),
+	.cwb = milos_cwb,
+	.intf_count = ARRAY_SIZE(milos_intf),
+	.intf = milos_intf,
+	.vbif_count = ARRAY_SIZE(milos_vbif),
+	.vbif = milos_vbif,
+	.perf = &milos_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9f8d1bba9139..4d5b57d6295f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -555,6 +555,26 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
+static const struct dpu_vbif_cfg milos_vbif[] = {
+	{
+	.name = "vbif_rt", .id = VBIF_RT, // OK
+	.base = 0, .len = 0x1074, // OK
+	.features = BIT(DPU_VBIF_QOS_REMAP), // TODO
+	.xin_halt_timeout = 0x4000, // TODO
+	.qos_rp_remap_size = 0x40, // TODO
+	.qos_rt_tbl = { // TODO
+		.npriority_lvl = ARRAY_SIZE(sm8650_rt_pri_lvl),
+		.priority_lvl = sm8650_rt_pri_lvl,
+		},
+	.qos_nrt_tbl = { // TODO
+		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
+		.priority_lvl = sdm845_nrt_pri_lvl,
+		},
+	.memtype_count = 16, // OK
+	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}, // OK?
+	},
+};
+
 static const struct dpu_vbif_cfg sm8550_vbif[] = {
 	{
 	.name = "vbif_rt", .id = VBIF_RT,
@@ -725,4 +745,6 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_9_2_x1e80100.h"
 
 #include "catalog/dpu_10_0_sm8650.h"
+#include "catalog/dpu_10_2_milos.h"
+
 #include "catalog/dpu_12_0_sm8750.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f0768f54e9b3..1f6b14f1c4d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -749,6 +749,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_milos_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4e5a8ecd31f7..7afd7dc7a0b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1505,6 +1505,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,milos-dpu", .data = &dpu_milos_cfg, },
 	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
 	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },

-- 
2.52.0

