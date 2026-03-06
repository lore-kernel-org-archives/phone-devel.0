Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9215339A806
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804928; cv=none; b=cAgsK9ryI01AAKYbpKgEPIsH6jxrCPVCvpNofrDs61GW2rHiGQP64sV/ExxsPV6heeyjuVZTkYL1GSWnpWgxh/13tnhiYNuhNHVf0oaBQ2Om9UQOwYq5hEthjBRDlkTB4vBGpXnFGsGbWlyyy69Uav8suQs0ZH3jBNdg0aUGGBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804928; c=relaxed/simple;
	bh=tHyTmNiv3FTZ/H61OgV2oLKpsfPNjLHaPzrbeiCniH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjskBI6rKdbxnv3dLej/C6rUPzhWsSzYvXSmWsYyWVqsHuHZ/YbPQiflP/uMXg87VTVwZvFMloMfJereK0TJRRS7+qvRRJGVNqjoIkT3oY2tyKCkLBVzv0KvXguSxCeJjLdc4QD8o5Rnw3QwG7TQWNvUFSqYNUaNfW8w6gvKPbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rLGgAIJw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rLGgAIJw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439baf33150so4377961f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804924; x=1773409724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHspA1nMRRBKEdBmLpX8hhFfkCXZ2adzsDZvyJnXm0g=;
        b=rLGgAIJw7BXlVX6FxlAkIh2yZ3H27oHy/DkVDrW9N/dDCIujL7maXI0XuJ39WQJhOv
         g0EqpwRP0EJ183KR/QHVpce1NncGU8pPwqz8vTgehOtAdEtuObSIhRnQkwahZCByN0uf
         0MshdaYGM89XkqlS5SuTuh8N4x8zRnRfsg3wOSGxBMqG0FCPj/rh4br0R1j1uSo0epdH
         u7Fatw35uyWroEk9w84RUwDs35nh8Q+SaJMIzCkUni4Jm74/pGLNSIj62Ba70A4K6Im9
         0s19HIekXYnfSfX8EVCpeSaw9ZdiS1FAJRB0b97Ybbie7LkWrS3wKGrruH0X7yiEw13B
         uNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804924; x=1773409724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHspA1nMRRBKEdBmLpX8hhFfkCXZ2adzsDZvyJnXm0g=;
        b=DUX0i3aMm1h1wA8MrIxXqgxg+XchE+9Hk7WkprZWZPZ3BrmCmm76k7RLUkn1XG3Iyu
         /8vupQZzVatSBA1yaYi/+/tf1NlBEpXC/nGFcexIlbxW9xxU1dJvq6L/KiEU2p973JI1
         nfMGGYXBzpG2hZuufOH9ieQEg2ZSElsFxQPl+xfsEdZ1RsK4p9U/g4N8FiZGf1BEoDrL
         Kg1NBVrBTXg+Kc8weODO6McHA23AMu2f1xls7CdYu570ltEh2hE7pqeMGTKBGss9uWQ0
         oBrhQjGpXu8lsV4HN8rQVOjSkHd6ks35aSHsFIPKsSrRnT3g08JCQ17dPspnqogxlc8y
         dFAg==
X-Forwarded-Encrypted: i=1; AJvYcCUthXJT3cyYenHdAlfFGMKIUC8KU3HNv3qtGStxitVRKKh+iJCNH/tAmGrVZSMTcU0t6h3QnrVvSpwkVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCm5nJTgxarsp5/LKIRXOr3jkFlsQRuu8fphbOQaUdvG+v+dG/
	gKZaXD/N8TkIUFOqU9ByHvf4KDxRhR/FHMWHCOgP+g5CxcZTNTtvQzmF8/HGmII82iNeOmlzXqk
	YN5wF
X-Gm-Gg: ATEYQzywk/Zxf6Deg+kGwWw6tsbHKoGxRYNCZTLbL9pfaEHIgo/ALWc5vsa6uQaLZxZ
	i5H4RpctzztwzHUX+NaEE65Ps1vcpWtGeCyb2pCxSYqMzM/KL1h8SBqgBqxuT72VBrd2zyhP5ZO
	2WxO6yoL0Vv5o1GJ2h91/HxY1YNpI4cy+bizzXMudMgnkDicBney/q2C8gY8DeuJpP4CRQqNAMq
	i4bqxVStTinUdeqZtOFumYp6pFnV68cHQ3GNxsNBqjnrc6Jtd3CpzZrdJb9T45XQCYsj53LdBYQ
	lXbQM0ENOkEqQdkmCoRTwMGsJFn7LUUsXNGci1/ByzcWNg6Z9r3yHtqV9zO5Cne91U1k7T2C9Fp
	Sf0mIv+eQpNJBsVz/49k3q9AOL6W3YWicuQQRPYLS72zgfn0zjVR2f1jpPNgrNXozfu3xvh6bZh
	kym2caCnYeRGNjmgoBsv64pOovwCe8IFL+AQMoPEU2Ge2E7HDaXO+StNd/OM8VMrepU8MGf91hN
	nDl
X-Received: by 2002:a05:6000:1a8d:b0:439:b79d:b9a6 with SMTP id ffacd0b85a97d-439cfc2e4d2mr11182498f8f.11.1772804923848;
        Fri, 06 Mar 2026 05:48:43 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:43 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:38 +0100
Subject: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=1876;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tHyTmNiv3FTZ/H61OgV2oLKpsfPNjLHaPzrbeiCniH4=;
 b=4pe087HcAY+QR4HJ6YGSGYK4ICTRgOj/8Hw/nMu1G9mRpX2w56izbXTkcBw02XWagU9dot/cB
 1Z9e0EOR3KdBBc9jDo0Ezlux02aqD0/0sCLmPhx36LU7cxbb6QH6+Mf
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 90ea21c3b7cf..155830140d26 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..d3899420d6f2 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);

-- 
2.53.0

