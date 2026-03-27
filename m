Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD6349B0F
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627959; cv=none; b=clFzSYRuk8WKSq6rNNztqkXwxuANlF2PYvcUbKlvJIINkGDsTE7wkCghxDfhjuoUvQHn8+KgOEFPejwBPBguAKH146uVdrq03US5J9X7xDqbbQM9jCrZsOLctoXiw5p3RWWPpQlDx16K1sCUbu6NqbXBnFCWRRFEyCtY+yRZPaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627959; c=relaxed/simple;
	bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfJ5O8NRPvtRtEiFSM1wfpMw5KQ9CwYQatoyu4S8nBE0Ob1Lysmzhu94CD1d8cGA+/coPP2tfCPHy6QS2ECwKuDLFsA8QuCujnUojG4ohAwUy021nxA7eGyhd3ByGz1p4IQM0t7Ocu4njUO33ln99QLg9/glxurbicMCVl0+f04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TD6Y+/Dn; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TD6Y+/Dn"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b98133bdc4bso275717066b.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627956; x=1775232756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=TD6Y+/DnMebuVJMFs6ASMGZIC9H8GNw5FEEUp7aIBurPXYMaxK24GHd62pgKKSVYVe
         7G0sUpR0A2rC3livq9C4xhj/fKdh9/Z5NG/vrAYixu1I3IiTx+BZQ1UgCmBIRynZdc9M
         C/TyR5do0KPuBY20/7JmQ8qomqkaiMXBYy+DuyLUbsXbOfbBUhzeqIvdF3LEbFsK9KKv
         Fuhj9wXK6GobTdTwMCpHp8VCCyWuVy4P0/3qOgM9ZAqaHEmWnCWTP7CQ+ACd9VYvTnAV
         mNGcaO04Zh9WDyfhhh1BLE5w7ue90FIIVOsmaAh2cIiiDMTY7nXtdnhG2fEnJ92rZ3XD
         K34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627956; x=1775232756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=mrlGdAXjS9AY9aHm13S9gvHAs50WGMiXJ1/GWxjCvpJImVHWo9m9tvRQXX8DwpuWKQ
         +8e5WKUjbNhfPahPBNGpoQsAKMgD41Jzg7DFDO4P9NwdkxbR52ZZkhQw/YRgs925aIWw
         h4llsqNRK00kHDxTeWU5gStzCKH6Xik4+oFiKY3am1zIMuZGb0PqmuwPMITdntvTtuMG
         5q7Ktku+rgiMSyDbNCchkoDlBkrllefjGSqk4PnRtHfkowW+dZ1bf4C45ptOlaObFvZb
         4akxpO/JJtCgVVTGQfubXY21PQtAg/yUh5TND+0x8mKfO0Sr6wM0AE9qStiFUfe3wVcd
         2t4A==
X-Forwarded-Encrypted: i=1; AJvYcCWhEJoJFluAY1ttAYyXHhoJQJK0IrrFuq6/hLR1t+jznJ7CLLM4YbrxYZLaE9wwhfACJPA1NqBZW1ApkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lXW911H8IoDuHmw8OayZiy1sb29OF2qTcHj1LufdfxzntvRi
	p53BILvSTwCwhbK6/qQCw43c1rdj9pNUlLB/BgIMZVAhpw5pEzKXQFpwepvlN+sGquo=
X-Gm-Gg: ATEYQzz7dvJyPb9eJbw2zSAWS8sePNQuCm6eVxHolsTJyPEy6oQKuxXRLJdD+6Vf21h
	te2OVPANSw12Swq+JqXjiMyb1GZ0pXyaVMbt+yu7kauO+UMeR7/rCaoIUI3G4UsVMwVG5g10QGc
	xUvcpfmRnT/UlSGu/PMtsCxu15og8ysXiVK4JBGX3QH13uaNoJgwZXow0DI0uDrkR9Riy2msh3h
	awseIeLk5LKrBTa5pYmbXYstnmFMnrwFFoCEtVoBB33sI4Hdx8Y/ifNXezI3uqJICBusGl/nM7A
	PdCtvSi1BgHYUUIBTYdfU8CdLcNAaz1EgDvgOlruGYSy+LU5gnDToZ88bTrI8Ku9hPmccICsmDd
	HaXMxez33S2tS21o0L84wdQcboB0YVbCtZ027vEuZAZ50XIaaKt2oBFzvF8eFh8JqW2sqMMsZ6q
	rJpcQBlR1Uf4nYpUR7BKwR7gJkAfK9QrZz3tIBacSACExxx1r1cS+cV/90M3nU0+trS0DinHGoX
	0zl/w==
X-Received: by 2002:a17:907:9306:b0:b98:4abb:cc49 with SMTP id a640c23a62f3a-b9b502bfd00mr209569466b.5.1774627956162;
        Fri, 27 Mar 2026 09:12:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:24 +0100
Subject: [PATCH v2 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-5-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
 b=aIVcCFwLleXDR6BbWbAVLdZGSgSQE3T0zkh07vYu6x6K/HU3SUHpaustvo0IrxX3T00BKLHOA
 f+oyhjM/FIkCWLIqvrDlNpWYSCHXcofk+OrlUQkx6J2XtUJlVtSdlnu
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
2.53.0

