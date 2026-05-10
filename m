Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3B37C92B
	for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406497; cv=none; b=huOEy0OVeaJtCgshU5V9ZXXGxRjO+NuW97JzKW92N+Eh6hGp5UIaoMTgM4Y1dE8cd5Ajt6foOGnwPQbjOnrlQMcl8sNeF/RqNMalqfkkOaMRrhEeH+5aMmx3Sn+YG2MiMQhHWftmcjgMYFmFfixQsZvqVpibAmFtqBU+CanKJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406497; c=relaxed/simple;
	bh=oPx+TYWEbOLSoB6gl8GiiVCXJsV3cGiWKVqM3xR9UtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9iWVZfbyGr1AzLzW8JN/1GLYprDZdEsQZPGIvUZ03w2dnAZ2fNM6UWGRUG4MCsbCQ10O5PIMvIqK2d/BSCahYq6ZzDRfoE5dWbSIW4oNqKloORPqtr2UNb3la6u3ofNZI73HQZsuOT20QVt4/CQic2V9XAalzVxSTUHHcAVqxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FToPpjRm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FToPpjRm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so56170475e9.2
        for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406492; x=1779011292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=FToPpjRm4RG+zsaGViYBOCvdo2+0SXHSbBAleSZ2kQyCB2yac72sRj07vVMsyJqIDl
         Go8ZubrjIwoGCm6/SPjgs7lo/T5z3cCgYmEix0dWTV1bc766tNJqpLzYJ1h6D+vnscK2
         79tb5DObwslWUk3+oRFLwsldEMiVUJ+lLxPikurtOlCXxL3fvs4U0NL/0ljpOxv2vMIv
         KNXjcL+s8ml2G/OO8G1OafDfZR7UzNDuxFzoKDWm2K0kV+HULejHtsgsTWfX3SuA+4Pe
         A2sGn4uTLfp6NrXrukjlfxMpg44jMl3wkSmMQxKHdiL5A8mliDyf+04pJSwkY/aBve3h
         ZHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406492; x=1779011292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=arDRFc90g4Z13vZ8z6W6QLXE08x4E2AvVU6r27gwibSMSTv+BTLCbpw1GgLFALKzhb
         QQe7oDcIW7YoRpe3/Ua0m+UI3CBlbhH4zjYxIzo8P0/5lpvfc+5cbD6ik4zrJzDEJ8kA
         yTu0Q/eHUNzsUD0RdHy+Lgq1ANLUzbRLT9BqsEdZcQQHVA89FmpDPWBwU1RR2Uu0uqfg
         /PA32mYlO2H3Y6quU3jXEWbv/YTeydHRpwnI3CgCMUV+c2NRDTICxJOVEfAqqutCl2U0
         X8CUPo3Vc44fV8KntqZWLt0nblb7ZR7kyEBxBNVaaJVHnncL3VRrn5q0MQiefZZga27O
         qmug==
X-Forwarded-Encrypted: i=1; AFNElJ8uK7apk905767aexJ5Snk0Q+sjDxg8bRXYIrE5ZNyxRkNU4VhHOAu9MRU4UNFIeCO1101kn9wMr+rhlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+zhqUzsiVtTb3NTp/BrLc7z1w41gsdw4+cuER3123WwouRUO
	Nc0HV+HgHFkBkB5IRuYe4PNNEehLYeDGhg1BYzpSYS5sSy3OuBYAMtFO
X-Gm-Gg: Acq92OFg/jJtJmQ1hy920joTULjHZvlcYmLt3ZJqmQ/BzOo3HBVb6vF/dlu0xNYZ7cD
	vppsSrTxlWXfdBeaSdgjWklzt6tFoePeLCdMGn1l4MglD8cBxOhfy3qqJ7R+o0oxHMbEYACm6G7
	OmCWU4aXB7v/We/Gx+jmd08nf7FQ0JIyP/8r5MUIbepSDQlDGqqpcgdemANXPTigO9T8eFHelHQ
	bwfUxR8bso/jyq9CpbBQGyp8XNGUVp1gATfBugspTlk6+ljOpofUpLML+CamVCQmuT8ySXqbc2w
	Yop6wfDYW+Cx/VzG3f9v1kVXNupSVvDElWsuZQGjf/2dlsPYGlj7PIR1njl/BEdP/PbHNkqw5LE
	WJ3U/NptecG+LStIyLrKIhmxAEWnsT7juru9kE44JJSweKj2aeCS3gR2Ottgstdq7lC/ZJVdJsQ
	6bYFEUvp4iSaSg8v98WImGf8akMse/
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48e51f4bab4mr180086765e9.25.1778406491652;
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:46 +0300
Subject: [PATCH v6 8/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-8-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

Despite using HFI version 1, MSM8939 supports HEVC decoding, therefore
it is not blacklisted. Add HEVC to the type converter function so it can
be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  6 ++++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..75cf63b452dd 100644
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
@@ -724,6 +728,8 @@ static const struct venus_resources msm8939_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..514dfb99449c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -84,6 +84,8 @@ struct venus_resources {
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

