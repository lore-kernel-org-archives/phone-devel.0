Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ABA31ED8B
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196460; cv=none; b=TCBbMaXHfgaauR6rgioC91lphDpqz7iHUoLrdEmGxEUtidnGrWbpPodlmmVwBHKsp3F+VSzZ8uNsKHzXXmFyav7rAez93I3yYxBjf5RHKtXyoNlUuulCbpropcHWubRtNwL2UyyraG+HDCfzn3QEfPp5hFpwpL2oFUbSpECaIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196460; c=relaxed/simple;
	bh=4XlumCp/Xv4Z2A12NCGaE5efLc7vIsAUAdlJ+AL8IkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ro12A6FGiaRVdMlccLUeD1+HpVzxeNf4TEzqQn5i3PeWe0zy7n/F2gDHsoBOg1o2ErPFxR9BwOANWtvDjMEmZDXaK+6nIUqUm2utdqwuuRftYZLRkxhre+yVd5DBXNgay6xZ5GAMV5hJmrfR40zA1c0r9OvOUu/059aDQR4jOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWjsLreu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWjsLreu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4093232f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196457; x=1776801257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=WWjsLreu2NffCOqg3VCcgPcWtdmM7Uo8j/+eZfrHpTHWNw2G7TuL/UcSD7uonYK9Pc
         GGzi4NmELh4MeRVxg1a/LYNPzWy20DLgyeuPispIcgiiY5ZkChpLI8nq57iGylooBERo
         7kmJ9uLPIP/iCVuR5Tl3exOt4FoR/ZgUGokFAaM1LuXtLFps+36WxLJOZJePmQaPH2Ab
         zdi5kK738X1hi25USmq6GJlyv4q0zRD+hajg6P0VbvD0xxhbkWVTJhws7G/IBjZ//4g0
         OZojANypj0UUA87cL4EJcQ9caN8IVg8CMQ8bSl5w0xiuW4sgiGUEhzpKDmFxDyX7v350
         xlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196457; x=1776801257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=UAziy4Cgx5qmbyjX6CMTDh6vQ38Vk4RYLbPoV5k6Cf0pJH16VCvn3wHEuUplDv8CDr
         CQ5FD/LGCpTx95wQxLlAhkXk6Yn9wneTomRxRSCERbYi2XPeZiTaDfDxd8xvbrZFVb6D
         ybeijdPXEud+w0oyo/CBkaFEIx2zzV9I8xKwrSXH8e/D0rLc4FDLlLfDzZ9K962cUvfj
         0QKovUoM+Ip/4Y/58buFF6XXhDQysS/siKJ250RDEfGT4i573XGVmWFnYxwGMmPc8yR8
         TJR3pJo3bJPJVYzxa9T9TPbwKnmqfvBaFS7nWFnQICK5WsicffBjfitwrXuTPTj8fkD+
         33zw==
X-Forwarded-Encrypted: i=1; AFNElJ9wHCNpxUHmnVkgpt8bluuuL/iXPk5gG+teCbj0n7B8b5g8cNxKbFDDid8YlvBbeNS52qRbNT6Fu7DwTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS36gaDeBpQUp+BAupTp8hCxNYyILMYvSsO46WO0+fAlvgF40h
	Xao0HCbSnAWBiuKNf6DLZljQHppZ5IN5+WITIoCzg9DA4oeb7ZQTy3SU
X-Gm-Gg: AeBDiesGak3JOlO4fQCT52rrhS7iNOzj+GdYwt1eVgeCvi8PmhiWgAaQ/0Ix38palWc
	674QGKGH6KTfcQlbiyrMdahXiUBsNPLnIIU6HpyWW+OzyRuKn1oLV0C10YcOTtLnT1r7XR1y2uE
	ixUo2tfE5LNb6HapMoc7azfw1sKkZcvpI7tMlgVVoEyL/8bOK3ePmxJZXm9FxhRJPG/XWkNzzPf
	oOqy3bJiW61vDCMQy0ruxGlLpB1mXhKRGleHMS2wXYHsQASf/AQCfMnLUPwf69UlsfkjW8SdKnX
	8N4j5C6U1DqziwB0y5E2pIK8aV/UkHWqI1Br6pHqOyTok5x55ZpJY2C3JdouulAGlm8G0HF2K8Y
	jnr+ZvaNxj5/I757d8lNu8m+oJeFEd7lob7m6vRE82yjWIoosmwOIjM/IS8rbJD1n6jowu0UjC2
	FYSPViPAWaKGOmr8G/khjckCc7Iwr0z14A3SylaEon6oNnRPmb9IENo+HqrqUsTYJ5Hi1xmO2xG
	HNrvDzGj5gq109/gyHXvP8=
X-Received: by 2002:a05:6000:2689:b0:43d:c95c:4259 with SMTP id ffacd0b85a97d-43dc95c427amr7827550f8f.30.1776196456620;
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:52 +0200
Subject: [PATCH 3/4] clk: mmp: pxa1908-apbcp: Add reset cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-3-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=Q4T/ABQPm6i5MvVgGhQo6QXav/d3IJrFZbQDihPCsb4=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68vyn38galmo13tMuVhFiqpQMnXzXuEHfdXjElS
 P0nB29/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIkcecHI8MnrdNWd572+f04t
 Nn95Jikr1JNT4tmEB2uPreebskZo1mOG/75vxbsYZHsXO5ef2WNUMWtDa+3sc56tN5PXTzr4xft
 KES8A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

It has been concluded by comparing the gate clock masks and vendor code
between PXA1908/28 that PXA1908's APBCP, similarly to PXA1928's APBC,
has controllable reset lines. Describe these in the driver for
correctness.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index f638d7e89b47..1aa476103553 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/marvell,pxa1908.h>
 
 #include "clk.h"
+#include "reset.h"
 
 #define APBCP_UART2		0x1c
 #define APBCP_TWSI2		0x28
@@ -24,9 +25,9 @@ static DEFINE_SPINLOCK(uart2_lock);
 static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
 
 static struct mmp_param_gate_clk apbcp_gate_clks[] = {
-	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x7, 0x3, 0x0, 0, &uart2_lock},
-	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x7, 0x3, 0x0, 0, NULL},
-	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x7, 0x2, 0x0, 0, NULL},
+	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x3, 0x3, 0x0, 0, &uart2_lock},
+	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x3, 0x3, 0x0, 0, NULL},
+	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x3, 0x2, 0x0, 0, NULL},
 };
 
 static struct mmp_param_mux_clk apbcp_mux_clks[] = {
@@ -43,6 +44,28 @@ static void pxa1908_apb_p_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 			ARRAY_SIZE(apbcp_gate_clks));
 }
 
+/* Taken from clk-of-pxa1928.c */
+static void pxa1908_clk_reset_init(struct device_node *np,
+				   struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_reset_cell *cells;
+	int nr_cells = ARRAY_SIZE(apbcp_gate_clks);
+
+	cells = kzalloc_objs(*cells, nr_cells);
+	if (!cells)
+		return;
+
+	for (int i = 0; i < nr_cells; i++) {
+		cells[i].clk_id = apbcp_gate_clks[i].id;
+		cells[i].reg = pxa_unit->base + apbcp_gate_clks[i].offset;
+		cells[i].bits = BIT(2);
+		cells[i].flags = 0;
+		cells[i].lock = apbcp_gate_clks[i].lock;
+	};
+
+	mmp_clk_reset_register(np, cells, nr_cells);
+}
+
 static int pxa1908_apbcp_probe(struct platform_device *pdev)
 {
 	struct pxa1908_clk_unit *pxa_unit;
@@ -59,6 +82,8 @@ static int pxa1908_apbcp_probe(struct platform_device *pdev)
 
 	pxa1908_apb_p_periph_clk_init(pxa_unit);
 
+	pxa1908_clk_reset_init(pdev->dev.of_node, pxa_unit);
+
 	return 0;
 }
 

-- 
2.53.0

