Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F081331E837
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196456; cv=none; b=NGI+JFmOPxoS+br2SpB8+Ho6lIQd7o6vtrtWu8L4W0NPnSBuJNs0O41YEUTttz6R5TqFc0cT/0/H4ZmqcEwqI+biPWwTWOh2lLYYHR6o+191vBGeN1ck0ZReUoL1LPWcV2eLXAyKodrCg941eujayvgzztEzb/Ods5cLvWKIs4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196456; c=relaxed/simple;
	bh=Na2lv7sZsfV6sjTNYKi3Aocn5ECd8tG9LxfhjEXl82Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSYFjs/yi8MnUfAKgkxDyxjxCE4oRWwPulSiYCsG7gZn7mYuVnlonLDGg/xfbljuybZuHBc4QiLLXAzhD6vgtEmnnhAl0fe8gg7GzvTtYuifyVu9/orHG0MkoiwBlCzG5habHChW/KilPyDN7ZozDGxAe1J07YacIlyOaa0XTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gum7NSIE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gum7NSIE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so6030419f8f.3
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196453; x=1776801253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIpZ1KwOXCQcdsq/gACxs/fuFamyUr0HrBoVABImBLU=;
        b=Gum7NSIE4Y+Z2j1VlaMLr2LLg961CbDarG3PJU5Q/gFFZ/aZVU1xUCAV02eYycnFb8
         E5z/N4z2OXW5yAf5DyWKRFKnqiKZWqi+MnDnPxUs2qZq4wEcSTeB/UuKvRIoTpRYzyYr
         bpHF3Y6yU2cHCcO2FF9CZzzbqrJlGC7poEUVgK3J6CnacZ74eD0s5rpROR9f+fTcp+Ta
         RD+iXL0qmi/k1olAVccS/+ocfTF49P2oVL5WA9df5D6Mejgz3pegjI8L3mETH9p1ZCML
         obCQrMSH6ydFEZFzM1R06Wnpp0dHseq49+kRlAP+P4P+ZX0dCDlt33QI/fjdBk5PDv//
         4E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196453; x=1776801253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIpZ1KwOXCQcdsq/gACxs/fuFamyUr0HrBoVABImBLU=;
        b=WAn3fmCgnhsp2J4MhtQVrMCVvDUC2FOs0b+ofPk+LRA3UES0vf8Mv3lOU5XC25U/U8
         ZBwIPPvgV2FG7rqWttte61juPq2qhfBxqE8VkIgtFzcapzf+R5p+N4FvA83G4QChldEJ
         VUtJG4oOUS0RatnDatmB4NY+MHXtSZ2wtPSRDO8jeG7nSdMh7PAHOGUNQlbAWaD9sRrf
         YnYLxleQpczfXe1t5SNRtS2QtiKl3kbW5tbCmfKIAD3//Xv/gTb+HTs+pzoGdveRTrad
         k82J0kGWtrdjhK5b4gD1P3av+GQ6TO3JUj6l50Hlz+TtQqT5s1f8gAC/4Kn9M9L7DGDh
         hFJg==
X-Forwarded-Encrypted: i=1; AFNElJ+xI0GcN+mR4fb8HvYjUcmMtWYLii48Ot8dBmbgYY55Gi79rbakb27t59SeYPRMNEfsWOq0eYc+82yBhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9yrhe5ZWCR2j6G512BMC4X+0AuSX+eR8SYsxBDOsU/8shK/+
	9/RZd6S1RLRaC4UGsVGgub4uaa8JFd0yTplbd03xQRcorp77+/sKH6uv
X-Gm-Gg: AeBDiet/QeGqPC1tTCPCbiS09DjuGyrzs/aPV+rNzXnwqA4pPK0SJPtABalTgYYOy7e
	/yxidITz/ds1Utwhu1/ZTUqcK7O9DDOBSguSXByK2i90uju4Q4dRJ4RzQQOXZ7vyhJEiA9gjwc7
	w79WCkki/0btZUClEOpMm5mI4N8YfOhwWvhDqG3NMkoYDdZgXfRf9nrC+g+aW9rMGf05hqFUghO
	Emhirm3gj1hZMulYXJN4WL6hagNoDQi58Spx6t7mn/LVKkrrCqpjt+kBoo+iRKtFlrlZYoSVBrJ
	Yz8PYWmjZi2DEx558lzCyhU0Pofo3WGFdnCspPALo1hqhc3gfqDx8uZ+aGCIZ8oG91MGYBXYmBJ
	BZ+cPK8wQF2G057NTo3l8UmbtkQmTcX5TgMtkLEpke0JUkWcgml9NHSOMNvAgUW0WzSJu7zEpB2
	zq3FdPqa93Qe1d1l8LXI8EVAp2eSN5cNboyK5ujmDVvMZfUtJoeEIi47DP5rjbcUtrMy36rFjPC
	nwurMLvPy315HkBtpwrJr4=
X-Received: by 2002:a05:6000:1786:b0:43d:7722:ec05 with SMTP id ffacd0b85a97d-43d7722f1bdmr15810868f8f.8.1776196453250;
        Tue, 14 Apr 2026 12:54:13 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:50 +0200
Subject: [PATCH 1/4] dt-bindings: clock: marvell,pxa1908: Add #reset-cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=BP5R8FC0EJnxLApQpaXSZEWsmn62r66uFEV2C/KCEqY=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU5kk19Q6f9Oed3e5NN7fN78Vj66ocpzyxLjw5f5N
 13f4P1NoaOUhUGMi0FWTJGFeancJb7U8IkORbZJMHNYmUCGMHBxCsBE7FwY/js+uC+51Ywjbtls
 0RLNJ/tPm77RCL7zUDHs9ROV61LtRosYGdYUulnavbrP/MfxxR7m9bllPQqe8ltdp0RI6blrta6
 exQUA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

The APBC and APBCP controllers have reset lines exposed. Give them
a #reset-cells so that they may be used as reset controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++++++++-------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 6f3a8578fe2a..0db5504013d5 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -37,6 +37,9 @@ properties:
   '#power-domain-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,16 +47,27 @@ required:
 
 additionalProperties: false
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          const: marvell,pxa1908-apmu
-
-then:
-  properties:
-    '#power-domain-cells': false
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: marvell,pxa1908-apmu
+    then:
+      properties:
+        '#power-domain-cells': false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - marvell,pxa1908-apbc
+                - marvell,pxa1908-apbcp
+    then:
+      properties:
+        '#reset-cells': false
 
 examples:
   # APMU block:

-- 
2.53.0

