Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5635DA53
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619737; cv=none; b=An85BVETC38TGFAsVQOfxHjUl1Hc4G2vL/W++hiWnQbnMShOeSQu2N834yDXh3TpE8Tzg8j/DqmluWqk3v4xhA7cxXqNnrnqAKG3ihpb4+vN4OhiCN0Ue0YYELY4oQsLTy0S90i98bl8FW4YFgH3fQON8xSSAomUiq+AUclMnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619737; c=relaxed/simple;
	bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JD5LQP/dmCvcoKTN5k+aMKIhBxa9jKRPfR4yp0SYvL16vHRlJOZuZWpKvu4aYMpPiUYdIopIjG7VnYHJAEvLD29YJNUJEw0D7B1jRSt9wPgHgNbRaInkLrS290iEVB8b+JQ0nXHwOqeBRTbxnmddu0A1d/3BJceW9HfCoIxmRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vDnDCMfV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vDnDCMfV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891f625344so18175805e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619733; x=1778224533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=vDnDCMfVj3wqZhNvyAkBmWrcnhsB+sgMWhfTBzDfLo5Bl4ie6Nh3leO3iWn322K9SW
         4E69tYyi8W3G85rJShywSt6+El86zzqLDGN9EvQak4lpQ5WehRnBfmt4LboZKPqxu1pl
         M7JEna65nhNmZbEag7hh7gyZ/C8lfDL3NKgOlWUJezkwl1JxbhA+pS8JXBaPfeqAEfJq
         5PMIPuhskm9p+e7Y/SE43jlZ5J0bWZsainy5qdA7aekSg5+D/m6aNsruThNhgyD/iHuy
         0hV6naFMrz9UFUMqYXoZDv9K4I620L5DmF1eRGYE7hUARrmmTbbyY888nQr1eAqTTD65
         8LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619733; x=1778224533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOClhrJ15xoCIS1DoMdb7YME2yq0/VJyl12Zk7EZgH0=;
        b=h8n86fVcKFQBRSAr0lLfJifhSN3WDidzps6GwMdvpkW+newFJZr/lsFS11H1OP0QsF
         CZVuhtcaS49ETvdoHQnFj+Dh2Oo1alkZJV7NA5pE5E44VE3Q8BRpWap2HzzLdQLlSa0w
         mIj9+w4/EWTu23UcUXdytwvVUrk1uQmeekZfeNPfYHTuKA1bbHYv3thTFhuVadNsBzVE
         0SCxSInVRd3A/EMlZZktYjgQIcDoekfnuONROjQH1Ug/+vqSvPi4fpymqUUQIr1cwEYg
         BrGeddj/YHLEzy4JnsIPZg3m46ftjbpTN7lQ82O4lDtFK5u5OyjV50vIW0HoL5y1LWqw
         kHuw==
X-Forwarded-Encrypted: i=1; AFNElJ+EQmEcsaB/Danl91Cn+Hp35n1qpFPvEA7ugE9kw6myt319z+KaHkLmCBC1/j5hrdXB2gw10FYrjegNxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IOBVNIT+XFu38Ynsv0Wmc1OGA/nXYqOnOmj8KbT431ybtNCl
	pIBPoL1HxfJECdq9miGXhhKYvmzzuBvAkPr0rO1vk51EesUCLrop4ao2AYQTVnZzzm0=
X-Gm-Gg: AeBDiev63OYs5IHxq90jVVstHrePQTiOPZYjR6xLvgq2QeiQS8D8BhZBIpumFiak2n5
	85FGrBIJVnSRx+yCQ5M4caCMdBssBTrPuAa4En5ELxCmPrmUXCDQsUWghRPvH4dLTMXp0gzuNvO
	XjC+Phcr9sWuKu1y07PXWq0Zo2/eUrmj6eF5Q1E18Qf7Z44i+mnEl169mODp+nkmDsjC3qH5U9J
	ii00rjWE0TVr0FvteRvb2dsjeOq30B3MbiW3r1ma9Zkq9jpLG7JumAzMUU7xJen/Iq8Y96vdEjP
	LdEU9gj6eUm33aJW1xqyVEL2CR3R56szueXnP8v6/viTpUqYkcZDnnlBlQV/r3elcYyCy7hJ4Sf
	Je26AYC5fPq26z3c7CEzvUPgZckNGjWZ7Xjw9d4cJnZMPV+tn+oHy4MBVYJN8/9FizqZUfUrQ/o
	8U66eXxdrYHk+WB4SJcDa1Pp3ArHbzsR56sclASjJ9kxu/dv918nY4Zn03KD95RCmgK/yTgmPiD
	ZIsemeFlGKEJixQ/E0=
X-Received: by 2002:a05:600c:4e8e:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a860758c7mr85960465e9.10.1777619733040;
        Fri, 01 May 2026 00:15:33 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:47 +0200
Subject: [PATCH v3 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-5-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=M4levVKqvb3E1M9kQrx1UfApgZmV6eS0fxmbvwGU/sM=;
 b=ACM2ohFxIVpVweQ73Py4edYjMY/+UctWWAm6q415d5l1h+x9zkwG1+1YDlS7uWPHXVnGqVgvg
 70I2MgwnnolDWVS0T80Y9qdtwDKYYSlgrRpbeRegXvb76KPmYt8sMpI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1551f270afce 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -37,6 +37,17 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
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
@@ -247,6 +258,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.54.0

