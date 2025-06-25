Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10231291C23
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842819; cv=none; b=X7CUA6cekj+LQHLricKotWLmhtFaPSwnKBl7V8MSNdr3FUfCS5UcprDvuy/xVdYBg/r4pTlXaXsUNmrUWw/OaRWhjSGwyCBB/ruvZpRqeeDVRDJxet97OYFVZvnyV6MAwNAvBjGQq6/9Q7JqIp1H3hF3R/cqOqaX3mDxLxivtXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842819; c=relaxed/simple;
	bh=9nfrU5ijXkLs3ISq6JmH8/jsRdoXO3aCH4+beJtQ9Jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxGBf3crGBC1+Pe3nQ7AiCDiUD/ByxUBjUrziWPIfrrBqajusUbkvFEai08xSzMROAQBqVfAj1rqVE+EnSAYfd9e19BGo2HqJX8pfcOfisSHfznP6BSbiQbQ4dPdrzECc3A1V/5JulPY056AZG0mIeUBvPhImEqOS4g2P891XxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eA7ge5S4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eA7ge5S4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso12037254a12.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842815; x=1751447615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMZlZn1FzWmvG3BoKQGh9OFPo1eSirohwNwNt3ELPYQ=;
        b=eA7ge5S4JRP2/uJmdJEMhOIkZUly0Zmgyc1A3SPrgm7stLOIffj+Q+mWP7P4A9BBSj
         EFGv/jS6AVxD1ALdRNRtwFmXZcJ3/w1T1wUUH0mzwS8c3g2WhXKHBjy8v3t88hd8MB1Q
         VdZFmRgd6AwvctTkv53dL3KF5zI/EAitOGL4Im6eOeWKm3tYZ052i2c0PXRJmhlXhobj
         kB3XAWAk6iwn5Dgmdwu844OBKRsI74RdC026q9Y0SdEB8QwsW1HDjAwNs5m9kZPg7GgM
         S8CeTzYg3y9dXAiPQk07I0knw1YRfly0P5mHoPLqgTiTRlCbPxv7D+aXTZRyN+FHpDWH
         VPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842815; x=1751447615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMZlZn1FzWmvG3BoKQGh9OFPo1eSirohwNwNt3ELPYQ=;
        b=Nc1rA53yTJjDF3hTuGQbusWyfCDd2SR5a1pri0rGQrVEFSIhv0t90KkN9vQ2lNAFB+
         MinuoNB1QEI3iCtRhXABmPojAzJN7CQdtl6gz8Y/CyoCv6MUPlQgf/UPDqyMJTIE+oEm
         /KoAC3SF+kQv4G7qGbaVbneVhHuAh4H0qB6ag5pFgEkxx0MRPaFv+j2Vs0ygFSJXlqX9
         d60n8YJ1ADBaZhwVxO5DDK5zCVx+8rc1l2cz8Su3tloYxdv2ayWUV0lR7KKwjmNstGDo
         S48z9dubVNM30gngxkc2Tl1pHPPU0LRbkUy+s/Wmm2R731Zpib6lmuk//wbyiaDv6tvF
         /STA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzGcInNFnPQJIdVJdNClLQqeZ0LYoWnw2YhXNmraaFUKSIcwWQZgl5AvsdJl0ZhbVj0e5mLXyP0koIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7AbCmQQrnMnJCY/1mQ3uZAzZeiUJYfJKEW1Ba+NUPleF5ckY1
	OZwF0OK3JcrcWa7x5HsOWOyd5HtIWXEbVkomeKiwb5w4mf3WAEn5i8GAlAgsJ7rpFWg=
X-Gm-Gg: ASbGncsEV7kCkUwQkEAm3DodbCmeed9fwhcvyqO2ekfOOhceNXvlTLPnrDkoU+sv4im
	AY22cE+UZsG4IR8ZvH4Mp0Y1zM7vYIMQ23VS/ewnm+5aHLT+gDwqLxaL/UXnbJT6OSlnPRNIY5+
	uA0jUyivkyOOzwv3rCgm8TJP7dWAGvqP//fqim1EOD/WGia0JRutv4GgV6vRuTxh/0H3+/4Fg7f
	tbv9MAnen6BjjzzY9uDKU/lcdpDFmckeGJm59pBW5h6RF0yhcESnlvRKGZFeqql5cBpulMsiy+q
	/hcUi7lH1vKf//rU/QP8Oc1A1vZTVZqV+AjEZDSXoZTPe/QUOUwFxWHRq0e6AXXMyAMO2VVeLEc
	ff5cIkIGNL2eC31XxBWkWjNm/XAhoKnX1
X-Google-Smtp-Source: AGHT+IHR1URjo8kysJSi6uPXEzBhsvfZoEJcjoRVk7llj5UViGsHOgTyjXQnr8py7j8eqC46rqIeDA==
X-Received: by 2002:a17:907:7ba2:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae0be8601a5mr251120666b.16.1750842815320;
        Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:13:24 +0200
Subject: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add SM7635 power domains
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
In-Reply-To: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842813; l=1696;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9nfrU5ijXkLs3ISq6JmH8/jsRdoXO3aCH4+beJtQ9Jo=;
 b=u2IIEsL/Lq+rFYqYNgYUPLYZBe9VGsPrucUzo4X8uUASFhFjqXoJ0tEda7goamJCvjMP1HbpI
 TCC5bg3HHe1CwjBNKAJ5CFVJWveJ23h+idmV9LvlI8RPuz/mcfSfIw9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the power domains exposed by RPMH in the Qualcomm SM7635 platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 078323b85b5648e33dd89e08cf31bdc5ab76d553..1a747b6a604c5c66e75abce10b337874e15df030 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -407,6 +407,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7635 RPMH powerdomains */
+static struct rpmhpd *sm7635_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7635_desc = {
+	.rpmhpds = sm7635_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7635_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -742,6 +760,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7635-rpmhpd", .data = &sm7635_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },

-- 
2.50.0

