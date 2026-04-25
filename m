Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB837AA79
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141906; cv=none; b=Du0PwKk2MN/v0tIWL0dAKlf/JRhMw6ymsw+PYNKrfa72dXXmN6eujBO4vxCHaRi1gY0tBP4WLYpj+zmQft6z4pIMEYgsdySfKhbcECDbFsqp2EUM3VNFcJGNewL1s6da9k+c+2J68FOIfXUgGGqEEMcByOtjlo14SoHDZyPc2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141906; c=relaxed/simple;
	bh=a7H80R42r3F7Ek1jE2GWR+lyOfXfzqpGUFLS1QAha0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S06VSPt3CmuPqFEkgGilhuTtLB6RkLhcciAQ+vmsC8fIbFOjpawjnJZ077XkCbamgB5xfZ/Ki8y33HLzwR4i0r9w2ftjZpPwTxNIXTzmiwKnpMzBOiKU7M5G7wCoXfYWxeprHJgTTsw9A7RRET1WzxrPYy1+pPW97O0CQfTORzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSxqb0e3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSxqb0e3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ad135063so80913015e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141900; x=1777746700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=fSxqb0e344dGNAPKn/eAFTTXa2QGyYRMAUyJI/vwNvxXyu3ld6A11XMOEKMWmmps+u
         KrWWatBypeaPXHfhkTjyYX6SXQ/Bi690I4Dc74IAIJMKfUNs2GKioVDnmwWsV3782beQ
         +ErpIOnmBcLZx6ZdnnJEPn8Xbv75iJ+NDejoCeTmWYLXH8v/ajLf35MyG3RjU27tigPX
         9QRzMS8Le0VwdqmBJ6Nrt3qUUql3v2M0E27OtTaf2YgFgQMgtPERBGDBTcsxFI4GAbSg
         hF3Qi6HtBVSzHaxniZGZ0JcNoSmlymdu2RLwH5Sj/5dCiXXwPbz2dYM4uIkTcIXKigBS
         Nztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141900; x=1777746700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=mv/2Y4uBUzoyVldKnF58uBJ2qydrhDORpiEmQCkpHlezf+rEc2ZTWNrO5W4q4RzQ8n
         3bGmHJA8bbsR8ZAkktwUbtgFjf0BosMzOpuWDTnsPDaPN7DQ0U4Efrf5cOxB3Bq5ZhHn
         JgcVPSqE3pjNWZwZqLh4v17vvRJ8SLfMSP0maY65ZE0wP1drSKk51Vbux/tQR9IaI9Su
         QUaqNMmpdMIA6I9Eildqtv9eWzz7e9EGxex1fpNiZuctVvmKQ0Nyvmb0KwJvw4oEgySt
         9mx6kJ1foxYnMjAUP3+I5muQlgY1U3Y2AhsNOzMwhqsLmKoESQGcviob//WryoxU4qZX
         SyiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Uzkm3lXNsNiuWysPLZsmynPXERI43Mk8R9EPIWZV41Bm5W71czayXKWg3lPgy5bVRHbZKkvvGWGxiIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd6s9a7bZNyEY0p/ia2++DXmVNOyyWSQn+puUmDEnCioH3qCJM
	jnsVx7bWblGRrTypHZgXF1f07/2NuYT7E35MByvIPFFn0r371KnCAN+x
X-Gm-Gg: AeBDiev5VST0mPocOsBJtv1ai1QLjmcdcrjukTwPuvFIDvzdg2LTnM3RCTGlXTaqMrk
	nCI4t62Axw+3B+dMS0Q31+e0TkDRSOho+vlzJ43otglv13jcfTk37wlUG7DM611vNUYVmHTypRi
	M1s37/p79Hm7+260Onc6fHngDa9pksFx2//zcqKEFF977k30ZJsRZWyqRZ474BUfViV98o1LdSW
	ad+aCrBEkeVXcbzBSqXmHxM35chS/TizFbosz1V9gtjpcmT6Aex4J0CVUb87uMvQR+wjshivcCM
	17y9iJZQhSbWy6k5v/EATxyH8RtiHMvXV4PU+xuFIqgtjRH/ErIjHV1akztYBS0QftvsRSzYhYS
	69oZZC+MG8iDG5sA7H6Xfs6+tbXBpzj0jd8xwLKKV2W35ZD43iR/H74wWX4z/s6JcuXC8niDa2r
	oz+Txm76oKfDJ/7U39R2MKMTic+g0Okf7cWZs=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488fb745294mr323101045e9.1.1777141900459;
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:12 +0300
Subject: [PATCH RFC v2 11/11] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-11-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ebe166b5c955..98526a1735d9 100644
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

