Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147E33B6C6
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409676; cv=none; b=LjHFWjKrdhtCHdDHasEjccWNj1DFyMnQaNPmi++2Rjt4ktUZLq4upwhAF3OkT3eL84b0ynYUPSLWq8bU6KsYEbg3Q8QqlQKE1ah29aGjB5aBCXcN0m0nuLR6ZQCnSlzrHivoPzjflvMpHvhQtyRn4f5dTpTCeLotvdl5GLgaRps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409676; c=relaxed/simple;
	bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXx2NYmIjhUoCpKcFvD5GF6nl6f9lvHbXksj+2g6MJJTw89bOwJZvGqEXO8xVlVgAz5eskw130lgbSs9/V3H7ytT409MaMgF60umve8G9mn2qzvg/OFZbc0PnHO8I8plN7VsW9zCcblb/yEsBTvWB/cZYwFVOyp1oQKj0NdAJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T353sbhp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T353sbhp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so74129066b.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409672; x=1777014472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=T353sbhpS+lNjOkgF7NyeFa3EHFZiQPiyMP8n+iJAV/kFjVKOTGJ9fKDTW/wO52mDA
         p+HrfP0SfdMHRY9kgjiyQMIsDwThz9Sbrpm+Z8OibvCCbsqIlr/pI9IGtXczfFP+evKl
         +3DUSOCO7svG3/BNP2plZCa/7St3U3Dpu6LmPr1FaboNN0gO8OGkpbLU450URpiVMnhW
         oZrwt2NkIGlnznbqpMzgGu0EXVu32TYad0pHjd7gW22aDtYTUBFyAVFr4caIOPhqPdyQ
         lMMXs37Di5HTzW/lnxFdn5XNxwb9MR2F59l9R1tYXZOFPpyTWwcliqX4s1+BxsK0BU3q
         68IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409672; x=1777014472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=dqm45lc4qveuXnJVn/55z0Ax7z5WZDEaWMWbSDrTB/tOU82FYanLjND+EsdFDpMApV
         l5WDPz0VRotkRANTFdz+8AZv+e/sMjqLbIT7zCKNNTv18ha8spZkktA7XY9G+7S1sAPm
         U93CorjJA4IcXjJZBvGlU9PieKMx3uURJyc/ON/2aLQbrGiwW4a7gvhtM4Ek9H+S5hoh
         rubZEwby/w/yhgvaLzkzfkdpzryeRgXRgzAAl+ITgEDyqNnFUw21UQ4buczHBvVDfm4V
         sZgTXBgj7vUMN4OBAEq6OwMgfy4NGSQQa7CTqPeV+w4Lx9N6qOdQRDGsQ+AASlpBmhbA
         gyVA==
X-Forwarded-Encrypted: i=1; AFNElJ93+UH5wG52QaW6wAy64ezC/kC2SrO3xBwWgr9LVD+lzR93ov85bgsg807egmJSNH5g1ESB4VG4Z+E7sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjF03dL9OT3qJTHqc93mXyQnpqOcfFIFP0ACpy6lXHskmJx4b
	sCjCUv4dKoaZlR8RrvgBRcQL/0FUWk5Rh3HII7izn+fsf4qK7rtGxDzdN7c8p89DLmI=
X-Gm-Gg: AeBDieuxTpRlubRLkX/gHuixjBhFAoG1p8M4GlBkYpS+/CExM55SzalL59ddlt9iKTw
	Dd32lPT18yUPAxgB/v/lEY33WCkhclRUj7RWVqGkp88AVyUKO0Y4HQDre0Ak2ucFeZEZUNtjFtD
	f2Ucdxi0vZYRWxFcBLqkPy4hn2+o30jhyAPGoTwzzx3Tv4x80y+betxvmuiuImzHdxJ6wcBddTp
	h/gVo51ist+5ebBo715UGGlxgNz+qpuyl0EhqRH1QAP/7cJIvXgtcNajQKiqUDFHMebq3xt8HB8
	OLwRtVvh8Vw1iAgwuLGkIUJ1qMfZDlySdpSCvAWN85PgXr3vqMniogd4zImgNNi+jWw6EVlpGdP
	dxXifZifRrdtvUIJyzgSqDKtqQ6/Ed3HRhfsIiw6fcYJ+iPG8JPZrMSEVNkGXJuVf3VfFFdct+A
	WT1RcRCimWfJzK8YMmYCL94pAb39FYsn/1ytL/NuE6Dy7TtrkIkbhfeB1SRID+0MF1Dh1URlbLO
	VQsZ/94RWfBMe29
X-Received: by 2002:a17:907:849:b0:b9c:69df:4d7b with SMTP id a640c23a62f3a-ba41aeefa42mr87927366b.39.1776409672385;
        Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:45 +0200
Subject: [PATCH v3 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-2-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2067;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
 b=D1Q+NSNmBB5WEGCN3xpZmWLXLC0ji06xpDbVD0s5K0mlHcPmHDp0OIJIvcmuHELDdefVf2PIA
 BpHzZnehC+uCT/qY2Kt9FKSzS8FAQoPtZmCSxNVaig4NgT41gr0UF+Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..462c7615a6d7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -189,7 +189,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74..7b0af0ba1e68 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };

-- 
2.53.0

