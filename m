Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EBC252900
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569450; cv=none; b=WOJiZxsXLgDWlwgIiegHcFSZvWu9dUucV/Q/Vyg/NKioI/zgG7BbUvK85X/LFUq1R45Z016ukoPUF2R9J673KINKYnw5Ajaf3h/OAHPfD/A/0BhxFmpKBZmGfkfD6BlSfpu0x8uYpdZC25ORWHFm7Inp9Wz6fr4HMbwSWtsmlUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569450; c=relaxed/simple;
	bh=RFosUcjwMh27o+Q0KFX/mCWwbK9ioGqTrDSRkowE9Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXsfH7ytnJrFz5+koV43+47pBWmHcLU8IOKLuI+Sd2kuJ3d9XBvRm57ZZNNI2hfX9mpBH5/+50p+v9LYVzpMXJIL8/UPvdHN4b634SuCD5wN+0gD0kWlJabj7u+14csZDMn+MDI76fzQJLRy2PonnGwOmOIwFTT8p4vCK2i2QMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T+o61sVb; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T+o61sVb"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8010b8f078so337581766b.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569446; x=1769174246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcR1dmGQ0EElYWldmNS71m4JZ3C7rndmOwBL8aoBqb8=;
        b=T+o61sVbhnn6bIlhuZLu1xPXtQuo7Zgxn5V4NGuWt+DLSSWVRdwFdR310OwQ1ow2PM
         XANcXOm3h+RcOCLupWMZZsqijD5HCN77RoC1k3j0THCKzBaWuUEvdtrkgNMdyP+OjL77
         JLmwD/qtKTFyMmjDwjbPLCjsve4XV0kUgPKvXwqBgPsmgmkphct6BzNzZin2tRvD2fo6
         sYmwY3tjwujcfZ/LpypN5qFJ8ib46Clqa/pdj31jcb6LJO0dfU9VSusbL3mBehZG6F7j
         3VZne8gDet1U1TXj7+X3vruzKOgY4CETPTedN3wBD/8b4nPSaU+EWLxZAEsLCek82DE3
         Hi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569446; x=1769174246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcR1dmGQ0EElYWldmNS71m4JZ3C7rndmOwBL8aoBqb8=;
        b=skGMv/NT2F/5i22XX6+4TD+3K3XbH7IotSdkMd/I7UKElUI+kZIwxM+7qkqDUj4QIT
         J4PaDAja2yBzs+amOalrs4I9OJSUP1sPGk/bd6D96vMg6CKcvfrcEHqyQq+w5tK+2t/X
         KUYr+pcYKWeKp8w+Hc31WKQxFHZ8TRapSmMdqLxI1ATkJWKU8sGTUYo5L+ESaRJt/NMR
         Im3T6xprrKDHIFTw4a8gAWz/zy8CKaskOWP7l4Kt/S1t4DQ0NRWb6Lv66udz6gv6U+I1
         cevkdp99RJ+J+OgpoWTpgvDJWSUsvhVwx+2kmF06yG+zap+xfiRTIrLvLM0nGR40ydaz
         /2Og==
X-Forwarded-Encrypted: i=1; AJvYcCW+HY8Bm++DruyTYdJvNUu9XND6xCG8IZNRkElLLofqFjeN6ruvK/fJS+ILlospLQirkHDguXJvUneoFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4kGzscsPprEyJidkk4NEnfAbR4ZC8cQraa2X3cINEeiIbYic
	NGUiugJGyu4H2SuaiyRCQJ/MYY1h0bTwBvCG0Y74bgCFLp4XEo/fauaxCV1oMdmrDEBKR7af+JA
	gyg8vMUg=
X-Gm-Gg: AY/fxX7WsFScOUKhLOAtoVdNlOhj9OykyxpajkWDmROmxPMMPnzo3RrlIsu5R3LO0Vh
	yivZV6qOHPxKZoqVVDsjAW1VCqw3TykdJWKOk2tEsRqaBz8PUZ+hkosML8Kt31WxWhTIG41vSRy
	QeTvbc2S51xgdWpYS1oq+Mzs6XpUeX+fgfLSQo1GSul4TpUNuTYyLMJ5xL3vYocnqRQZtr0KFMo
	BzJYqstGklcr9GMlFj298+L+ykONxWIrwDvCiwO/IwzpCdZWVZg/0tadTKzIlmCiCNcFvU4E0de
	/GDfrECAxsopMCnZCAUJVpVA8Myf8vfrYBC2XjxL1A7PRn5Z6C5IuT7rxYHgCWBqLri8ZSGbQMu
	3detzopAxdI2QQd/GnMRGTfQrzr9FXhhZVmTVkIlvqISPvivYW959jsqkIKL5GJGOoHcbOxSYZa
	QQPiIQH5q6YGtflkGfbImBfrGp7cA4YsAsX033gIx/EL7prSjg9F1wliJRmmbWUCBQ
X-Received: by 2002:a17:907:6ea3:b0:b7c:fe7c:e383 with SMTP id a640c23a62f3a-b87968e56f3mr211104066b.22.1768569445696;
        Fri, 16 Jan 2026 05:17:25 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:21 +0100
Subject: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=1598;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RFosUcjwMh27o+Q0KFX/mCWwbK9ioGqTrDSRkowE9Gc=;
 b=F3TPfwyBjFhqKF+HInQg1A97Mf+OjLhk6olL+d0GTCGtvDhv0vHvyzaFIZ0sGqrZJTnArQl1p
 Qj4XSnuvOF/Ast/91GKxv4KyvwPnFE8nsTermX1yRcoTl4vnkMG8kVf
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document an interconnect path for camcc that's required to enable
the CAMSS_TOP_GDSC power domain.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1..707b25d2c11e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,6 +25,10 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  interconnects:
+    items:
+      - description: Interconnect path to enable the MultiMedia NoC
+
 required:
   - compatible
   - clocks
@@ -37,12 +41,16 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+        interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.52.0

