Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9623AD529
	for <phone-devel@vger.kernel.org>; Wed,  1 Jul 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886777; cv=none; b=POrvxNd9a+eGfKqZ2X5rbAP0G9reRl631bnn2z51964zJyUqxnQ0Xt7TZFrLnf9i/hqn4OHTCOK5aONVLUseZw7CgOgmAy0/1UAbNeUgAR7i3gaxsutblvZx/G2ZD443QkDURILlf8ENEvQrjJLFauUk2CprMyLoxz3lEVJ+Hp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886777; c=relaxed/simple;
	bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TzJbPQAAQTbGmUSyEu0j0FGFC7+3y9Tx0MCTiwXZcy4ZARF/MLmz/VNZR/8PAepLR3gltkCFY+NJJAqxVyr48YBp2NV6W9D7ePoe3Ac4N313qWIywf6Fg+SSySYnUO7SVPuZPIxHN2/4I/l+aj6OH2GdnDfyZhxyy9urhz0Ieo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xUq1NEcx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xUq1NEcx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso225063f8f.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Jun 2026 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782886773; x=1783491573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=xUq1NEcxIq0ESL4lfVzuX73zd+FCW6ZoU08QsS1bk8p0eewqXjlrHh/BV9bjWIRJsO
         YVSNhNje4IpOtEUNHDI58wNU+6T7BUZtkNK8aZdpzFp+DH/L/0OXp2HnKNux9pXg1Bvr
         GLHxfCVr0PJD2a7KIeHgDRlFrX+c20UHLfhopyfkKchefnNxYs4k5sPRIeu3XEKBQ0Nn
         6SMmq8XxtAyDyzrU5oJ5t+9zAeaem5vwyBZ+MVRNJESuksfshgBpt831epMBBOkyMKKP
         /xtrpOo38R8NvISqS9+r9mT6UA4dfbSjlnaRNM4D0hxK8N2br1szu+CemwTQZbND4f49
         hXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886773; x=1783491573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=RrZeDpAnbbOioV9MmJytcr7rKGJ1uUAJkcVeDXXRgn5MzcSF+eZHihVQs55s8HzT7O
         dDBwMMj2/wUdd4Mu9TnX3Y5ZVzoaYG403VJeB2B0cIWwZR+P2YRaX4zJfKIW/hxydJYT
         1x8DLGY6PFATtbx/WyOECHpuOWiHYIEcmRDY8WPvlH7cMitATxw6fk0GHnCB+UO0bAMd
         m+yfH6gS2HDEyek2mtp3b+gmehE8WRN8RfeTXMVdoI8m5okXbBWNSJF0YmgCKCjGwMfj
         fQkXXyKVBOg+A7ZHJr8gmGUBdhtC7eQLV/3x25GreXmYH252MTwaScHjoWQ0oFnq2WmY
         xhJg==
X-Forwarded-Encrypted: i=1; AFNElJ8zHOut9/140apnOOXdHC+zJsCg5sHA91ZBPjQqjQwWQDUatnM+0tjzkeYf/tsu1jxpLtTPUBRgA/7Sbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrjEweYXXrjBlo1nCyxeMJuNOdESoJlSyiVOkm9sOkD5y9EyY
	j066fH5DRkNhjJwXUvrDR4LnDLUoABEt6685PwjKKb4ktZsZYDc2I51F0WOUcPnvorQ=
X-Gm-Gg: AfdE7cmv9WhKP3HbB++BMvWsp0oUcIGqPJGpHmhXFKTcyDk+facxbswCpuMu+LySyYk
	hfDFP9+4S8eTowyMIHFilG//VHONsQd4mS9rVj8OTJ2jHc9lu60rSYayKDNQdN+9S3YIEm5jpIp
	SFFgA9jinVPMjRzP+iZdwXSHcaEIV6ywAgFjcz86tvPqKhDpAAbxtb4o2i+pr37uemGO5NQixm1
	/KjoKSSmV26BswxBT5KXQZ5zfxIQisJN4Yk1vgXQAOH+czhpep2/fAHd9OuPDya2cIKNs324MHY
	qokXOX5+b5kB6ujdWx/zR2G4Gxt5x2W3iH7FmhsEiODqLGxVAedIQmiLYuIOJ0HIWVl737bsUTq
	huwcsqKufk7ujwHID+x4N4qSsQuR2P56KoRkknYOtTHSH1EWqMHpTIdpuajO/o3ioiq7KqABgk3
	x/Gx+aKdSBnJ+prtQzss8=
X-Received: by 2002:a05:600c:c046:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-493c2b3d3ffmr2644035e9.6.1782886773243;
        Tue, 30 Jun 2026 23:19:33 -0700 (PDT)
Received: from [10.33.0.72] ([212.133.41.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm14748608f8f.1.2026.06.30.23.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:19:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 01 Jul 2026 08:19:30 +0200
Subject: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fScytzSIt3SvOTEgmJdyyRTYwszE9M0gyQLJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAHjbmdRxAAAA
X-Change-ID: 20260701-glymur-uncaps-9b538645f0b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782886771; l=1097;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
 b=mQrz1gNPzurdTuK+gXJ6oSM7mBxuhXNjzjZoHt5+V/7V1w1jwV2UE9wRxS5ime2wHKmUg+QDK
 BN1QGSiW8PrAbsH6RKrNTWZV4Mlh56gWTl0qGGPjVJaqfciqq3Vsqc+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
the prompt and help text.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..4169ecd95ef3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -65,11 +65,11 @@ config CLK_GLYMUR_GCC
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_GPUCC
-	tristate "GLYMUR Graphics Clock Controller"
+	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
-	  Support for the graphics clock controller on GLYMUR devices.
+	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260701-glymur-uncaps-9b538645f0b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

