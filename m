Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA430BB81;
	Fri,  6 Feb 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373654; cv=none; b=Bdm7D24gOmt2IETmT6GxKTFIZGo9giMbqmdCTZPqw3KZR2Kik//DZW7geVA49YvlYdi7MTS4DSA02k1x8KBAAGpN729P1IS3WgMdRcRyaXpX63mViRMCP+ANpuVnyhyIE6OdBA50nnxFUETJSrhmG8bVjddfl9z1QXZqdEIYBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373654; c=relaxed/simple;
	bh=bb8AkHZnGIuJ+7cT+GCvgzq7B3H5p2MohzntibPFGLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGS4InmY9dDARaPrOtjdYFujSjvlRkGUy1jOI5Hq3kis5IL+AM36HY0YuY4D9M7RYsJ/Gly+9OSZgIwRHnUSi227AJhf0eWRR7ni1u68Av+AefMi96P9dRzWYErI38dfa7zCDKKrBDZjqDaJg332sxQexGOf7IxreYJZ/DhInH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Bitv0eth; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Bitv0eth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770373253; bh=bb8AkHZnGIuJ+7cT+GCvgzq7B3H5p2MohzntibPFGLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bitv0eth9udeuN4/o0MSc/pUM1TUsF/2YJRHeb7drQGu4DwoXoE2rZscU4f1qe/5G
	 9UYbiJBXLd7pA4nWXUH8r6oW8koEkRVVrmX84L1aZeXOhqaHeE5+MZTxOxsnMZxOeq
	 FNYb+PEs9n0E43PfLT86hvHMO9jNPgUEJyRplOT4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Fri, 06 Feb 2026 11:20:48 +0100
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bb8AkHZnGIuJ+7cT+GCvgzq7B3H5p2MohzntibPFGLo=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBphcCDzskBqy9v4qpP4BZJ+QhF2ite7JcmFWQ47
 Rf5eqBdO7KJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaYXAgwAKCRBy2EO4nU3X
 Vpm3EADKOM4gT8umZZLojsk3B6h0DJE7Tej45JE3RwK1GLaTnTzhgGCasz0NlSlBf6QHbbuys0y
 tinBkBWQZe1LQ2kaq8lmggjVRouB2fpwr3ZnbtAcYpe4Kd0rwzsiFIrJ7U8cN8knxEv7Rv2L2U4
 PCjoJQ/buOzxweAfRGYjx/2lVhUm0yRZO1iN6eQEu57fvYX3S03VzVdLnQTL1uj05+jd/drdI4U
 icjTUrLEpyzA9dAUiZu/vUfFaPJIOuoBIjejKUgol90NE7ZMAQwSCdwO0WYlDGlCXdBg4MxBtmk
 CIZ9RS4kyeVp8WKSoFPcMDz4Vcv0JJalNj7lH85rTH55b0Z6erVJOJ6kjRMUh5jv6h+wbzHupDL
 u1LaYV8QTD8eiAMP56ojtZg07c4DdpVlV5dQHVC8XP5v34g1brVQAvux4Gnq/aYCKieMaLDIXj9
 6BEiu8pqNT9R4xrgDtMEJAtw8BrC0YpTZJRBj5bIItcHAmTM02pKXD8a3EEZmRj3pV7x/mgoM0e
 FMEaH90ItwQuWzDDxyQR7EWoTrqJuDWoTRRw/aUaEf3hVAFNIOfVMGL6Se/AEP+8gNGXteaNaGm
 NS6lbPpPUMyRQYL1MqsJzOUxjvBLtf/rz4qQ1IZfzOOCWY9fx6sSaQ2p2UFeciWFeT48vVuYRqb
 svPYqQfRynsGScg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Document the Mediatek mt8516-syscfg.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..a67699f1faee 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -91,6 +91,7 @@ select:
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
+          - mediatek,mt8516-syscfg
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
@@ -204,6 +205,7 @@ properties:
               - mediatek,mt8173-pctl-a-syscfg
               - mediatek,mt8365-infracfg-nao
               - mediatek,mt8365-syscfg
+              - mediatek,mt8516-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,mpfs-control-scb
               - microchip,mpfs-sysreg-scb

-- 
2.52.0

