Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25131691C
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162488; cv=none; b=bpdP4rSJDf+WXbppTtzT7TTxKrmFemDFer/uTk1rMPBnzzXfsOj7Fy0Ur5k1R1xfU+aJW/Q8yAGZRc0if46HPhcAfkrkSNJrD+lDwWNctH8LA9/NTjV613/gxYIJVpA3jYzX/hfr301rJC/5r65lK4r0iqrJOWcjRgTXziDnmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162488; c=relaxed/simple;
	bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFZPuDEC1qOVdVpU7xP+fesBRIvfhZnhl9jvmO89y7Vl81keJOfw/mEGStzKXZPGjLhLPz3uJgkHUMAkb2mN41fZzOcMiBAUvgQM8nZuLjTdekkvzYYceO0JouE1mStLJFFa4KwrZQpmmUhuZSeszg1jtf4xoZbQ0+GnqX87W9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EAuzqlZv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EAuzqlZv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so2559100a12.0
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
        b=EAuzqlZvGEuA4Dns0/pGJOnoH4TOeuXnSflTgprotvvtjilsboHqjLctUdDyEI6bER
         d5/+QVzMuzMVzlM0vemey8EHzlC0GeUCD9lTvk9pKqDX0MWkOfg0rM63coyzRRRkt6BL
         xuDdYy48+oy5ZPbe/eaVQuHdgoSPA83dlETnVz1zTQV0uJQ1xIa9TOgHJh48DK6b36iv
         ZFQn9JO/QaFq4BjjQI40yTvighVrSsg+x+HVYOIudIOZHdaJzEQS5lFx2XSzaGbfop0P
         3Sbws0tEZixigMIMtjJokRogT6YH/1aSsjytJxgvMrO1Amf2Ls4EFEIrdOcAP6iohKvM
         gCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162479; x=1766767279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
        b=u+pyDJQWNR8ikPR6y1pane+2hZq9ZAmpLVkVa6E9Ql7oTg/FjuPuFDED20NkYnP2Q7
         vU5rvMuflZkIA2NfUBwV8D2KrOheD3Bv08YoGo6uBJZJJPjDyPqW3iOB1VyEgD4tkLq2
         xOeYAhd3W9w0jEPoih4xm/yW1Ezdr5j4yABh/+ieUKAM8lVC5R+wjmWfI57swXs46B6S
         FtC64P0xWELbne0sfSbaUObCDTvirwiYCwq0LTypEqF+tdqABvNPCS0uFGx/VGOdFKIv
         YnsCBw3/mwV9/9KAAfjJpDo7P1w5zfq7H66CDmjuspbBFYnzss5MtvoGu7BtNVsdOpbN
         uYlg==
X-Forwarded-Encrypted: i=1; AJvYcCWI4rRO3PLVL+nYwEaXlc4pzIFiHMmudTtVlmaIs2ezejKFtQ+0OfYoIlkfH9mTWVhAR++cr7teeQ2TvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0j3ZNKeHed9mDkXNtN4kU0hDDX95CiTVAN85tctVCrmDAuzaL
	nL8LQLq/o959pJgZuNhM0Jv1VUG2gwQ2sKXEYXDNd3+HuDBrQ1tFZmWUr2B2wmZ/WHLwaOGobOO
	Oed6mxr6Waacl
X-Gm-Gg: AY/fxX4bbG2ofOgwsvely3CAncD117V2+NoNqjwU4b2U9zQwh48DGK9bRCaRGx8G3uV
	zma97nqtFyX2fxYZNdmBcYk/dBePqCTC8Eo/Lk1uGepSvHYOMPXyX6pQT8/F1qeX4qRLOH6Fncj
	NUjfqzERMfhgYLR6ZBcVABHX7m0lvdhmGAgVCSjmuCEj+L2eDMd5W3p2jw3Fpdo9fDA2axuXeOS
	qB+TE3n2NNzP7n6wvowB2pRqnDrNmjUzeKk7ukbTF5kb2sEemiWN/ejXx2X8dZ5D8dol1OIbUk1
	LKvVdQZxDz+iAKsioppcZSibAQLHuhaUbr134HSBd9xxpR+ngeHAh30ZwVx2RqpZddB0Ax9O4H0
	ZwX4Fcm/FTU7+AGPPV8P/DTxmBoJDPrQGp6EKBi0GqwUVDloOU41U1NWpXt6KddltkFdFGCFe3D
	72howubFQUJP3gVEGCvVmb1oQ3oA6noWLO8ckKvVMKY5M2GCodr4OHb6VVfqO74g6x9AOhhgvHf
	y0mG2a14YGH2uoMstRkEnPTS+r4jOXoiIM=
X-Google-Smtp-Source: AGHT+IG5xQQDju37djeKp8Zgcj7rgGU7z6CWHlLL/w7AfRHVUi9V/ccXZ3Gb0icbkIvDeWOUnP8NhQ==
X-Received: by 2002:a17:907:1c1d:b0:b7c:f77c:42e7 with SMTP id a640c23a62f3a-b80371d37b9mr396657766b.43.1766162479431;
        Fri, 19 Dec 2025 08:41:19 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:07 +0100
Subject: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1527;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
 b=EoGcG/sMLsZ+n/tQW2JV/CykTnYFk5wscZuExCSdKs6oC1UTb3wWbgCcx7IrWQcQSUcMonII5
 z2uIyuCf5hSD4AWSUC+TFtP5nwTgjA9IkL9CUto62zfEZhNtEBAZwyD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231..790e67c7db3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +234,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.52.0

