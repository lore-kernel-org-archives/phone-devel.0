Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886304A13B1
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017596; cv=none; b=F48DHHQi7lDFadIC+8TcU0InbRVGe0ni3pTkBgnTYCQYl5IuG3Z3upXAx2UYbB7xJCQaTqVOd6WIWwyH3sK31GnI6XgR+THYNCUObV6mI3C5xRAVeRroVWteNeP8btpuCUEHRQULvXwexUEWAkbd0gGBzB/BslmxwD37+Cxv0XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017596; c=relaxed/simple;
	bh=//M46Tga2bI34hWrYo8a2BgcoG977Zc1LR/SYbuK1Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rolZgZjrdc4QNJkdszFrQ8TauCNCBWeyyeR0C/oI3P9pa+bcm0AqydszZnYyPHYkA0RIUNBwh1NsMtziukYpJcEnr85PydbS4PFeFv4qIvGcH6kewzLMQL7pQvx5mMeiOSQkziyFm3aM7ReUn2PUBm4C6ZywEaF+ysXXQmmVXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Iwfg88; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Iwfg88"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c37eafcbeso4148950d50.1
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=B6Iwfg88ad/vaK4zIvY6JIN1bYHDtPTP10C6SxOXbEGngF/B4DYLtXpXDTFvVzO6YX
         Hrfoqs6LFdoXQrZfib7U0NWXhu2JHikfTdH9PK/rKAIIAQgCr/SD98fug9BqpQESDjaT
         twOc6SIGXXxpBiAwHJnpc/NieIX68ZoXN3O13TJxzCkyg6o8JTLRgosqZSC2glWFEPg2
         tzf9yQalZOj4oAA0QJkJrxmYqOD5kGOspbk5ov3AVjNxEj2OiMb2kcwX2j2Qhg9zYpAL
         kAHIPhKNUPmLhDdy+XFbxdp8ZLPBhbRSm37fy0iZSuyBgnOM8d6YDIUKwf6jDFQQhSBa
         q0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=JE4xa+1hCTq0VZu1bjhUR+tsje4x3f/6f0Y4WRgMYuXmXrRx83WRfc56JwpnUK7iH9
         UeiulSh234zlAjlgs3ZSq+x7/3U9ovQ+l3pPykLsp29M9sAhbYm7i4Ebud5pp19ZEkSt
         WHY5S/Kqi0egsoqeKV3hotpZoptNKvuHe9d/chJoyPWnkI0EKq5lOm2xziiJc5WiZOna
         yuXPebsseq20P4hCw14PH+cEJBMkkCBcL53udUpZMY4LHyjnglRgiJ/pZIJy9ziXQRzx
         vwa120pAVI+xaJr7cY9vJNINOXunKOQYy0T24uI7FToOG2+OVey8EcL2AHkJXUDztUfq
         etrw==
X-Forwarded-Encrypted: i=1; AFNElJ/mVd0MEAp2LkmipkAHlvEapyCrx/cDw8kVrXXtDLNHdvZ2+hkXFWx2p2DmxZYjEQLSRLVYkduKZodXPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHrV5UYQtMnE0p0IkVxmBaxKPsZuXOKUO26ZrkW72PrHXWKvV
	gVCgQ6AfNlNLZJcmL43/hAyqleC2UH/y+LHaJdvYE++fjqD4VS1ghFboQpc74w==
X-Gm-Gg: AeBDiev0NJjMaVtLpaOX/t78BqCWIbT9zazpT1Z25KOmoLxWJ+B9fgZkwwFKn9juwxb
	FqE3zmY++9B8G8JJnuF+mUNaJmIpG182dV79ll4AVvL8Znc1zZHbQPfgHAUl7yx/zqy2JBA6JEg
	tsRDD5SRyMwwsv2BfMY2mmTp4qZWADN0q2mCx0Os3592t3fBVaOFar9bTkmp/tvC8gZrDDrcidO
	QorOCEhcuSWovoesg5lMMLq1I7GK7ryL9SvfjHBDqh0ZRcV7TrZl36dFcl9zb6lYYkOpCQ3kbD0
	UBJRCRKmAAoY2NG7Wd072KFsjdVx+xtZjIp07Ash3Ipfe4JLrM3p+XAjeo1g+Fm2pp0wrpgvNZs
	M+AO2xTBSuFJRY4j4ysaNJ1Q3anCUAYU54q7fqFZQFKh9AKa3PFtIbnWr+YEuc2kVQiCoA2sIlL
	AqD8vB/EAB7gooJsq6Laoyn5Q9RP8YLnq9UTiJ
X-Received: by 2002:a05:690c:a05c:b0:7b1:3579:2ef7 with SMTP id 00721157ae682-7bdf5e86fa3mr9817227b3.28.1778017593022;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:46 +0300
Subject: [PATCH v4 9/9] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-9-994f5eb22acb@gmail.com>
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

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1871cf3830ac..eda6b19708ab 100644
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
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0

