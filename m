Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC022A7E6
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 01:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331037; cv=none; b=QaBmWcI84ObSAcLb0oP5pCeeDXOnsjMT5PiEl1WlZbLZQNG45X5F77YCv/elOIzOyt13pfI2l5AHq7EoHVeAk7mOfdo3/sfeh4tQ83rJ4QvNF+5Ex/JcMNPr55RNFN2G7RPY/v0pn9EwuZ+xch/pqxvEMsm+HU2vFAPOEOa9VSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331037; c=relaxed/simple;
	bh=64R8FCiMEBBuwRxLEqvZs1seDkt/c99ioBjBkZyRvHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Du3rS2x7lDUnTixVpF8RSlKE+aJFhW0HrDkuRphCCy96aF2g0ngD2XqWz3Wg0OpwxcuEeJIsvAJJh3PepMY0AL+NDRvAsWPjrjGhNAy2boQ59IhlVEL7EwDoQHa46rLRQ5ptAMT5qty1pzdlhTURkC/IXsHjfdTpqUEmUUQb0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Im6H2wz6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Im6H2wz6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so80488865e9.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 17:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331033; x=1765935833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRkZVQo8Cy9rpkzUUZawgGrEURlfhJDKheEKuiyOhG0=;
        b=Im6H2wz6ZpCbSPMSItjq5MXhQRVhes/7SiyWlZRkjrpAvWuL5ZD/t1NP5jAtba8TaP
         Jky/oGbEW36YV08lAlfNlAbptgCKC9qmSRpfSfcVeeimYowD3bDB6JS5UuRFXIrqlZWq
         knIwyMg8raKGjClldjYIStxpJIFGP+gNrMwcmE/j4iRiTd0pzwrRGHdOQbjdz3rehznZ
         czfFjkdi1N7LIDRFtBSCi2gVUzdCSdDRpO7C9FdnHLtW7BGySW0wJEMTCN6ULWAYyQCe
         z7QajDfr1IO83kM84VSvDktSsVp7EBwaZXwTCaqjz8cbaaebZZLc23EpNF4a0Q1ucOkP
         aUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331033; x=1765935833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRkZVQo8Cy9rpkzUUZawgGrEURlfhJDKheEKuiyOhG0=;
        b=pm/R5pNCPpgWg2sZwxSlJEr4WATb9ccDXWA/HiSS8ZDNJU9Tdru/saSNWNPZwqHfQ4
         5TA/KRGqrdfajuqiMkM7KDIkwVgkZMgnT2smyoSasIJBrO3/hmQ7qVWJ+LVSl2BIeNIk
         QAfgKEd9FACgnL7r8vz+Oj2a+vmoUCQOTV4z2ZwdtPXS1wOVzXTRk+t7HXEPn4W3JnTT
         HHljiKe4BbNR3HJpfWsfjRrBYfy2hikra9OeZ3OeRY1FHeKor822lVT5UmDP68TtoVei
         yWPdloPz4d/SzYj9frVctR4NRzH8YPhjvxHcb0AS5Z+kz4Fc+sqrZNOqlwBXYaJEw7XZ
         MldQ==
X-Forwarded-Encrypted: i=1; AJvYcCUihNmsRuFwctyjL0Hb4j7PsBZrcOMZ8iT6hVTMmeJ5oekS9zDIjbiHsH3OqbzyCKe4Hq0XKB8olJcc2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxQDPIFRrJd3eh0uwRPtzlbKScYpkzOvIPGHvy4/6a+9O7/Sc
	3R6hCHInWB7xVXKKTWLVIpi3FjghKFay0VtKB9VOnuJd0CKP5J2I4hMrEpWvj3YD5dY=
X-Gm-Gg: ASbGncvigOpRT3t7HLHamcYHM3J8kasvvNrF8wCgdzwXozMid0xorxlesT+lsSWIyc6
	ml8yIwsrTpIXMDCtx4rNCxV8y4iK/Waplfby2s8+5eFfmuBhvjB1/Uu7Vr96O2D+hW6BTRQ3B2O
	Jh/lEMv1QTisPLMI0p5vnQXjwUBvYmpFbvk+Hs+sokpL9rwtE4ZorBYwHYozxA9JHveCbJRxpi4
	zK6Icyskl2pok1+q5pouOGLcN//FlqLtLnVO9g8pAsxyw+bPoZSLg9gnGBOTkSEopqCWZHOaypo
	K84lEFIMIcEmnNwxjTJWiFInu40A2qH6k26InMXGBphcF9stuZx1HZyQn0MZPDyQ3MkJpsH5BMa
	alqh/D/pa4Rxwwkry0QKiQSHbmRtnc5aF4ovYdLkZfDnsiWq08OPcHiRlvCqOBpBZ+1RqZukJ70
	I9TC6/29HbiLG7EcVWFeFhUbR48vsiCCrCNtMY2+s082SSm7LrFQ==
X-Google-Smtp-Source: AGHT+IEqEijBe4vhE35mjP/G97WmH3BU6oTyIW6Qj47gs0IT6FwNpkQDR5rTFw4LpB8j9mZgSjrgaA==
X-Received: by 2002:a05:600c:548f:b0:477:b0b9:3131 with SMTP id 5b1f17b1804b1-47a83745633mr6952945e9.8.1765331032968;
        Tue, 09 Dec 2025 17:43:52 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:27 +0900
Subject: [PATCH v4 3/9] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-3-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=64R8FCiMEBBuwRxLEqvZs1seDkt/c99ioBjBkZyRvHI=;
 b=mS3y+bW1cfkBNdq9xXjZsHMDg9KgFcK33rSnqdmmReA8YaNj9DNz+pBy+zfhLNlKKb8jKt0Dj
 9TE9ZpjTAS1AbioGTNl4NiN0f/N3jL0VZ44slBPjbpXyAPv/MTK1/BH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Power Domain Controller on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 38d0c2d57dd6..0c80bf79c162 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -27,6 +27,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-pdc
+          - qcom,milos-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc

-- 
2.52.0

