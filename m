Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4D34EF1B
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217860; cv=none; b=kJ1g7OPOvFMmThh1IVtlyVIeVzKcsTx0io2VTJRlGEl1h43x8xlqijaPyyXzGNXPADQM0uzIzBVWtuFPzVPNVWL73I5K5cliIR8ph8tB3TE+/OMxb+WR7WZessBAuWtwrH/hBUQkYKP9SarmTZo52ZJFu2uLXmlJRMmFAzX//Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217860; c=relaxed/simple;
	bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkhXVRj1zq5uLc0+gpR4U43gMjDXdPinxOX8kIyCN2HOVtViA9G0eVsGyEZSxlwfTMVzwe+TxAhSSGG/SMR4QPLmQGX0iRo4z7CQ0Y8+MZ3ppDO0ihWrWMmsitS/mnEjvYEVhUu+pyK30YNk9LYw9qsJfeyWEMLHbogmB6gdF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RYmwMj3O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RYmwMj3O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488895ad947so21322735e9.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217856; x=1775822656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=RYmwMj3Oi18V+6AnIr8TGC+/BJ2JP77Sjv2H2bm5JkdF/T1FIVna98aVg4dmdGAb5h
         xhT2yq5v/+YXlPEthRSvgg5X3Pp6+0b5J7YR8aLoK75hFY5/6NZ1tMaFnTEDyT6vQMuu
         +CfbJ009aeQ4e1L3vjMOH9uE7kQZ59kmNo45SEu6TD3FnlMzt3CZrgfNxQuecG3skH5R
         Zg7IL591j39kanVPB/vMpRzKXZtsn0cQSPZ3nGJqQ1k8Lx6siTjIvqiKu3sN52ptiZrA
         mNUHFJQ7ACQK2VEcgow4zT9tEkq7oZGQ49oPUbH/7yUOeJx4vPHuTd+lcmcJbZ/jjQFu
         YPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217856; x=1775822656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=MgnTe6G4fbrFQ4adyghwGGzsrOoxOaMzGa6KJF+k/UBcw9v2rDD3OQmHorV/ys1clZ
         eAMU1grchNHQMzDvrozGy9k8Ps3X1lmJ0eNxallQXAtQDaYY4X5k9dU76RnjNOnUowqx
         eskjl68J4vsVv6XK65cpQlmaHlIlC1ETyjF00wc/C7NsQoSo6yAxr9cqgMcphFoiRJBo
         5uo4m4Iu/Mk0U0E3Qd+Fs7weWSdkN7IB+JYAF2Tm9v+NbAqmXT0kfCCAbIG/NlhvwmBC
         iRpprcvydJ7xM/XRtTWhfEx/Ll2ruaSQelk8Qqi+vNKyo+APIWFEaWA69ZjjAPJyeMM5
         tpqA==
X-Forwarded-Encrypted: i=1; AJvYcCXACqVIt4ALo9uRU3ictfmrDtnQzpgFCzFrHjd7jsZEMYZp6aKbkgeMeTXKPTZcqmBjWJfAMNA2mWmClA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxrSxsouAQFBYG6VLPomSdoHf3WcLkL71Cob76lIPH3cVAmpw9
	3pOiDhlAHPc01Bps6R9556S+ReTxc7tV7Jo69mjYcvV+IEMm7p6andBlD6fNQYru660=
X-Gm-Gg: ATEYQzwric7mkm6vHuY855QyHBel1pCtRntJc07NYvBcxKNn0nQzCXqdTAOoQ0b3NeN
	Luv1/5PjcaqDNRX3vk8Q7iEYHgryAH3oPBcHWPJ+ec51vb4wjct3mWhVmkYXgSKBKe7lNqomHeN
	q6q16kvT/GeE+3aP2tbXXXdzyvBWkpepcAeQZUBgkve6xd0TtJbiVRW9YL3zVzSpgE+YrDDqGhV
	QvlkuG+pE8M+mdymkUNwrYVhqa34CXgZErf203KJSTiHtZMVMwgRCgAAXhphpnIwpTwEjwh3fUZ
	34HP193x12cDi0ZKf7OqzDvMA4uBHtpH0gOM4S+TbJX5wYDTDZiRK5axd0dPGO+15JHeJa1W2q4
	ClhwvEZssfI2Y51fCgBEs5o4uowCwjxGFbqqaz3e1iJ3cJ/H2KML6d08J/OfimaqGbx1NcY35To
	l8UvUanHCPY+0Hm0bAKT+GF0YtgqMo6leVcw==
X-Received: by 2002:a05:600c:4ec7:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488997ed834mr42353285e9.31.1775217855719;
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:47 +0200
Subject: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
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
 Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=2000;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
 b=oK+n+UfVPUvAs3JqjYta0Wct4THXUio5bVmhJJzJIwOMs3yp1pA7dhAV/2ySBKNvNtMsVo7dN
 rOCjSo/YPbbBjEk9MuhEH4X5MfbuYAfiwbQ/AtDaNqOLsJI9mIUq3yA
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
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b818fd5af8bf..13e7892ba39a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -187,7 +187,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
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

