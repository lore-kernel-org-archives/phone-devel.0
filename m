Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925E37474F
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141901; cv=none; b=CwfrFhu887D1H0fSTngmvlEgDOmhJ05YIUC+r0jrxu3FKMcVwLW7NaSu2xrad6onmuSSP/MYIXORYSIgKGt15AYDQlkcnueNB7QPNB9r/abaZJSf4xlHXeakP/2tjpWgW35QiFkBk7GphvEFX2n79s6LdIkT8cY0unEqdENp9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141901; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XX2V4pVxa4Vn+PwuslAla1Lab+eeaJW/wqul/qnMu+Aj3bQOWWI6RAtHU3R7C6mKuWboWnGVKb+Tz4bOccCRlQJXzvaS4m0+ZtJDGSPSFt4UQ95rAwXSQtygLSTEVe7ljV7MWIggq6+RWrfMtEM2GwGAKZo7uD+gnvvvzMCZgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL0F4Cu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL0F4Cu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso123377385e9.3
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141894; x=1777746694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=bhL0F4Cuhij0g00JTwrvocAdkSOsjDTaw7hE++UVsu6HLQ2jaiXFLNITMyMRikYCNc
         jIdO5qepEk3mZWXEfgsmOGE9UMclCvh0KkCE7dXKKSB1U7I/pdm90MfKXNd6JHSmrcyS
         MSi9xzVoGEfbEqA5i0nOnFZwsjl6k0g8vK3K4yxw6ohmiRPKOjvskA/r9XsUMnw0Bs1x
         nNEsqw3K6BivPUV8UbLD1trTmIknRA7OrrsT77HUo4f5t2woEaAFuYy7s8oYLcTpiHeS
         VYYB70aSec2M/ka1sbtSgdHeUpJFPkUhk/BeyV4CvfY1cLeGClce36RUmmWjQz4tj2cW
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141894; x=1777746694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=IEktdY30uW37DG0UW5G/WJu6bHA7mdHdLdHPi4U6qtvelFv+zlaLCgJmxfylsdxrz2
         Mbr4m67KIVeK7sEiZdBRzMIC8xnbCgO+kQI0fuRL5Jm92NRolbp5K/T0rUdnDK/clyvx
         CZvAq6hBFUJ0o9GpcW5OpChQeA22FacUuzBn6JlgE+Mgf55oeSDPvOMzKbEykQCXuELT
         qrdUZzq89hSzFUdOHYkq8dOWMBgUz14FBQiFaypO6OHF5+3bkDDyXL2ojfGtAdAvCEb+
         /LT8SP2m+AmcWE+/UctYI83YxIPUKKwt236to8TWDzmx4FHc+wOTzTangTS/2ZBzmyKO
         6a7w==
X-Forwarded-Encrypted: i=1; AFNElJ++XQwh+YfSmyWO6I2pTbU6qaDGjztYRP1YQxSDWH17KoZ6kMyqW1NsUqOsmjxtUsziCyJhQtvUzpBjKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBZbkbDXO1/1fuMQWEiEpg5mycEPGvnmXrBjH/BcRuXnBvgcS
	7ZfiqYlQnw7LFjYvVZ7FQVl79E6jFvpLcoiYONiYTPdbgQPk83EOfKzU
X-Gm-Gg: AeBDievcKgas8rbaL2mf1vm33h3iqxNnwKjRHFpTNwF/8JhzLoQz3+HZvt7vPdFYjDc
	DFkM6VDCR7FeOCrWjjJhvAQwlVvFC/4HIOF6ye0gadYcZif2GAsEl7+pTDf5ZhgUdq7xKmz56Dq
	jZ6FYssKrf43dDr+cpgGWOeDrSzzJNY6abD8nsRhegejlKXpFDtc9gXFi4M1l4tgRgLSQRpbeZ0
	NTpa1MnbHZrvjEAput/IkStcDy8KjwAv8yWUE246MwpZASHv3FFdH1nhUodL9X/ZOqb21Dft69/
	fcyP7tt0hK+TYd/3t2DNQ9eLRuQ39lsd9QO3tsVahbeLSaJAoaEu3UZ1c6KWW/2q5sOLgYHKIoq
	8sUjbAr52mfaNOWxX+ZMETdLD9nRUfhs8tnNv+X+6iaMiHWqAb/URZXsm2PNBTUaPHxwSZzvUkr
	1xZuV07XqIw8G3IGOC0R8FoY1mIrJB14C6ZV8=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr348688125e9.10.1777141893727;
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:09 +0300
Subject: [PATCH RFC v2 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-8-f69e52b36207@gmail.com>
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

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.54.0

