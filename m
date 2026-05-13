Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D13B9927
	for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707582; cv=none; b=sm7QhbYOPY04U9XykIGC4G7642bd8b9l9cbKx3Vh21ER0DiaGTZ98NsZSCisSPZ0Z/RvKRqgYTKmEIM0uXLj0qXC8E5gvFR5vdRNGSf3GqBjW/GkGq90o3EzWrwvwWzCwT+NCRmLqj4Fr4VY8sQeXuvXoz4QK8ph5sKkcwmrQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707582; c=relaxed/simple;
	bh=eWvwFj63Oe5rLHhL9VyXX1Yhyfqj3Z9mzRiwe5LaGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxwME3TtlsSsk3wvmRJET6qw4WhQgZNbKf4dnmHvcSMv8+MrEUqi6RoEQqbFkWNK0i3U7lJykdamunia0SrIS8ZHewnTxTOzkD02ydiZ8ol1kwFwrHUDl0sbe4nxfTujH6VCL2pQOHR8+bH1aAZVquBK7b/qBLrybVEBaczdk7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip2Xvq6r; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip2Xvq6r"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503332d50.1
        for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707580; x=1779312380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=ip2Xvq6rdZ3Giv5cML3cUgYclSNkxIHf8wTKmdyNK38TiXuS/QwfgaL/fTWa7jcBfG
         sHwC6yuK3X+uFSbsPAlhDoDnlYXL4MKjdZlcXRHKhVEnOW8GvWl4TNg0QS+9+OEDoys8
         dmB7xLo0R//A2Ajz0XGYkFXPzceIUBvMUakJK9C2UnvO4oDGMzgwSD/NvxtTrNp3uUeY
         B/WMaQqzFIEGiEi3NenX3UPPt/kUxA5Ssqd2pGzJL40eluiBaGZhuCOX+72WT7E8m/QT
         mzqdAspl/az/o4bhQdo5eOsYz8FjnM3TGGwuKiOj1rbTMSz3M3w6pmwdfg+e5g/OJMRS
         qRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707580; x=1779312380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=Ur4XZD562tZ8N7QJ3SOlD/7Tk/rby58jC13BumEUGyC3STkq+eu3nrH+wNHCbVMRsG
         4L6N1lV9Ztj1zoZTopZUoxAOgaZ4LPzpdGw+wncp3AYZY4R2tQNbXFks6l0kAldJHQ8a
         aBt/YNMK7rI5m9AWR0gySRINGe+0fpZTp/tM4c62qJ7wRtMSSF6wmt9B12Uyb85vBSVr
         i4+EtIEixH9Z63/Gj1vXYS1Zgijh/ou2/A/ZXRk9STx5ElaBRPLkBbhabis7//gjQ4HC
         sLM+O9me9D/WSx1ThT9U7CaHRXSV7cxDXiWsf8nC3uG4oRYyxSGOlWp7gFkB4mBsC0rx
         2xAw==
X-Forwarded-Encrypted: i=1; AFNElJ8QbBWca0uxI9njvUCDpZ8S5zMsnENEJpp/UILw2KVAFksQhZTJM+ZKFeITwTsPw/v4bk+OW8PJeEtV0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNv7fqUB8qfcVE7CQUEudGnYvazoTrwrxqJfuBxQu+rfq/1Hfe
	1/7g3Fmo7F35wMMomkkeJD75zV7eCAnU7Rq5n0cqI7O/LbzmcLzx7V59
X-Gm-Gg: Acq92OH3ggV4XiqD0x1sDDE5FZYy8X38fGIH5+aOUJE/qJWz+jbjhahCJUyZAAcmFEU
	nFPheMPNPJ+ykIa+/WXiDTrvDfSRQCivBq2At92rWu76p8VtNcvjqADK3ikreQUVufa6xMSvK+2
	BwGJRehPFmqb60vP0vCDqWq3OwNzmf7vm9IH7dfLmskC9KRCL2tDw+51QbiragT8fp3VFRx1lhE
	p4nP8Uby5Qn//IU9iKw5K3nHQGVlUX1VO+7vwVvRsb/Hki0W05vJb715R+GNs27Z9Wy/lE/MaD6
	vF+RNuiSeb8yoTD63G7c4w6vz8NqoXBTMuc3pwfrediQMITQloSpFwqcQkqvGLGyblw627KsYi/
	K8dVZ2TEzv4FgZYduzHAfkedmTdTMlh5kiGuln3mhm/Nq158pse4uiyRFnMuMn90xFfOTzSI9E7
	JfMWhMWek42wwJcJryorBBWehGNw==
X-Received: by 2002:a05:690c:6286:b0:7b6:783f:2122 with SMTP id 00721157ae682-7c7e668eb6fmr11694307b3.9.1778707580397;
        Wed, 13 May 2026 14:26:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:36 +0300
Subject: [PATCH v7 7/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-7-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  4 ++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1b5e72980702 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ff9174a4e8c1..3f162b11e669 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
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

