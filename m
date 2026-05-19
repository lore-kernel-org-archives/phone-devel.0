Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08939C017
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203620; cv=none; b=qErmhC+AWcXRsh0q91a54SjxDQQhrAaXMHCqAoSu3myCR8zk8Fno6+XlqBERfg6Apgxa9LZltuSEaW55Roa1087mAmy5qfAcssoqgACdY3p1zZpYbP4aMjqimWiPdLKNQkqSzSMbk2sAZ/WukQwsEUCsoIcL8nFpG2tBMQcx/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203620; c=relaxed/simple;
	bh=aYhaIzNwDkK+FVYZ56jaWtzX4RysdwPlvKRxwy6pzZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkk62txng2p7EA6mZYb9OwBgN8uabA07euq6ZtTNXITangthfQjZfpiNs8mFSawc0VEcygIiuHNU7r18m6oD1zhuZ8LYSH7Mv0yqdoYN1XHtgtXZRY2PM/1NA6W15itOX49PtN+l2TWF2RqlgFfSdJswz5DZ0iaSeZKSwuPIcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf1+b31s; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf1+b31s"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso6223881a12.2
        for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203617; x=1779808417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=pf1+b31sT7s0MlBVk/5TWXX0SFF4RL3QgP/g5YmRpOAiCU5ZhMon12oNTxN3Uv9GpG
         3BYA8nO29XT+FWgM3uRNPF9AZWFuEJ0GOUaFE7l1GWoImqNoUUXaVr2zjktjQ1oVxXIH
         jDGJqiYkjjM3td4PeIPh2wSVu9zvtOSIfjnbwNr+BHfmkhT4TF/XaNHclzI5gPn+SZdD
         HlRE4Z1P5nV5f4tQ+JO3q4Miv9UROF/Uhqx2c2OMGam9E0o1fAXINHPgB2UMB2utQPWt
         /GWYZKjLF/zbjCganFp1MELbp3FGkf7Im7t007WYeK4r9OBeF1EGLvGHVVRHHmURSJhh
         bI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203617; x=1779808417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=WpDO3WwH8X7KYAM9x6DP/9+TEz0k4uhz1NPhylqIyPo6MZ51XNK5glIWXZ4T38idnD
         WKcTiO5J48uyAW7iIEGtsgRUAADYUZ7asmXebZCGe4qCir80xiKPdNouuzb8R2eDuDxx
         DAAs96k1bYUXndKd5dHstly6roO6zEHTcnkDsqxwvipJYN/zNBNk9UWKYetlo9DNfori
         /SGsTr9iMx5jJUeehq2pLlr9sdyN2MldShibYqLeh0yZeiVD7DmBD4JN/mJ/qKjI2YdZ
         AlN8H9NzA7m43lMkrBLOq2fRJytdQ3/2HQiKiHWJqDyXsRLW3eVvvUaVRgk+ebaSgR9x
         HrSA==
X-Forwarded-Encrypted: i=1; AFNElJ8+zCidwOLh2i+vXHSoBMjrFdQXH+YLkUdpbpQJzOFo8m2pjwAQc2DYXx3ALmawPROdk1puz6iOm5WnFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/z3x85dZVO28Mr2z07DN/qtP7redjGE2cR3ugnQLYgfU/EsJ
	43nvEGk1TFFqQpr2FGUW92tbNlrB8mi0NEO838B5xlP2qOGJjog0rqBF
X-Gm-Gg: Acq92OFNP5SvG2Sjv8kv/2c3R6x78k1VsddYWwcIJB05jm1Ny0ZKg6actMxMwwrLb4/
	UWF7Iz4KB4pAiFYlzr9tF1+fdYSyE0r+4Ki9jnHNe0ZMOjEnvbrDEGHA4n2NvRTKXz8yQ6ibf7/
	FfW4wcHMoabjK5xS3WVCYwJUvW4gK/s/rZhE1OKUg1f0oiF5bh8it5dRU/elkrc3iI8Dl4qI+yn
	CbW4AQ6MqljKpAc2Nm6zt8+BsZQNf7/oicfRk3C8sPgc97cLFytfRAvLkwm3YQ4F6CC5PwsHsdI
	XDIAn73Kwuv+JYf/KAAJib3Ph7O2ctUuJR6AY1ROC7Ss2udwM3z+LTDBhTHcTqGSpY+DjqP2vv7
	S4Mzo3Zvw1h7SdTGPiAJlax0zVaaBSGBJ8X9LzVtq52xXt0nwnJms2tvJdPQwOt4RwhIBqORJ6t
	PVBfOPaWvGWC8KrZY7GrEnP1DePPrDimZp44XF
X-Received: by 2002:a05:6402:13c2:b0:683:1cc8:84a8 with SMTP id 4fb4d7f45d1cf-683bd28ac44mr10467337a12.12.1779203617448;
        Tue, 19 May 2026 08:13:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:36 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:50 +0300
Subject: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
them from loading.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..3baa6bb4968f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };

-- 
2.54.0

