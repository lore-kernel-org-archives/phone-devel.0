Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B5A283FCE
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570745; cv=none; b=Pf5JzkQO/PbP9SODWjs5NMKABWVj1JWYc0zuSfAinBSTthtI5I8mkINu0+iTnCv5xCTRFs5MAjYclNjymFfqThKFHv58ombWtOZNilJskdqJIq37YIK1/zwSCeQo5HP82Gl4ia6/GHzlRjwYm9pPov8skJ2DkiFynPN6iOElai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570745; c=relaxed/simple;
	bh=74xQUaywxzeebI3p/AKN6vOvKb6pTQmwzWbQ8IBCY4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAVuOVyOvz8C4RZJ+g9kRXiIxTUAhj8piqcHvzWcskg+buSeBROC/LqyiSOr4fF1bbrLGJEXzGtS8/MRBZ0KT2IhL3osBNUcCogHBOG6zitY2A/u82ldhKGtaghahFaq+2rT/SC4r2FWTyMVFA7xcawdBlZryGKpxrhWhDTeoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=whdr5xjG; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="whdr5xjG"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso3177512a12.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570742; x=1769175542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8zv40JK1XZcjIozgFMQWPRZtDjY+q87cahOipxhXqc=;
        b=whdr5xjGPAr4xGQWjzO6+5Xn7vHN2ilIZ3WAZSbBpiEBuhtq9jz+0Llr6PwiwP4bPl
         PJ5iH8SIPv1AEttVnfZn8ltO5svkD9irbu4sP5h8o5WtAGOODJ4yqur8qc3S5lPrO2XZ
         Cj/16udoG0q/YGt4r2QO3YhH8nky7usssrcTfHloRNHYctO9GwV9rBV0QjQ434MkN3qP
         Y7Vzl0Y3OGhFl2oLhgfdRgICk+axeU2fmt0aL1XTt5piN0yrQeVDIJ/AgXscHqrR+SD3
         hLIAkOsgO5hpUX5HaZpTe/YIxVVY/LOGNPJqM4MIZMeTEWcWdY1kcOaS0aNgN1XjOhlg
         o+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570742; x=1769175542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8zv40JK1XZcjIozgFMQWPRZtDjY+q87cahOipxhXqc=;
        b=t+XU1Wwasc86lFbA7mKSwMys0ygZbqf4cjz05hVyVli0/Y9m9Gwvoi9yu7rYezDI/f
         jsniFfRObwNWjoBcD+VxB4FfdyE5ULJ+2KWEt91vXqeyT1c2jBFy6+iBELnr8uebMr9V
         9vC1d+7WucVGpXyVIUFV8f7TkfcbTUVYa6VzB/dKNP0mpIRkqG4+V84fJEHHtb193meX
         +B4BgtHtKkMwgNjK9DjORgDa0qhWtOLNWkTvjNd7lCE5FC9jhWYhUHhhp94hqXFrUqxp
         UdmG1f1iFmvhaQI6P6Fcof1jQUVF4w2Ki8JHRX/Dh68RkZ08oGGh3nsCe5FAYPk7dGIm
         iKdA==
X-Forwarded-Encrypted: i=1; AJvYcCWdIzj5IUbqLcUBPviA3rJ86J9/S6OJj9ylMjl4JpJv6NtjgBlck0+8MpSHvEsOejQTpIxRJXJcJvsPpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgY0Hh6JgvVbrEhM4DznrFP+Q/8pkkO+5wMYwmz+4MtVBwVEe1
	J7oragkTC7QmqW4PeFzrmE21w6+vDwnCngsOriQNjgRjk3VACZ8zB7Phf77ynp0+R20=
X-Gm-Gg: AY/fxX4VgAk7YH9o0JBkzjC/mAcQ2w72lDtLpg+m+PLzEgZDw3+Ku7z8pL4njZeW5RS
	GjIbmvUDcbk9gHuM3LRQ22HjkAvmSjEkJc3d8swbqZnQpqRrSW2FXp2cxjmD1ux5bYb2tTMw0/x
	MMwfcwkKtvfizYrBFG311sx4T09EzUW95JBQee8FkbjzgqL5pWW/hAWkB2eGBLkigEubpZ0+jmy
	ZpH5ZoDSMAyvGF3pHnpwUPihZyCosx2m3S9HYSt77TjGWpTbfj9j+Ri8rTtqI+QbwLDCc9Wjm7x
	HfkTmBPh+0zggIz0nH6egCcbJxYd4QEocKJ+xNoUhWuzX3TaSFdlBMgB2nbQVKPkI44ILnj3nzQ
	fgAQRsuMRc//bJ6+QNgTJ7CtOBLo4lGUKnWcsV5I4OGoDdw6zu9yzqqfVbP3kZF3EnRb8U84osI
	MOXD3l8szqz3hu8Rdd4q6DWThCuwEdQAcON/lqSZ8QK1A49GJB4AOaz50JVGEBxXIe
X-Received: by 2002:a05:6402:2691:b0:653:9cd7:2003 with SMTP id 4fb4d7f45d1cf-65452bcc0c3mr2165991a12.24.1768570741805;
        Fri, 16 Jan 2026 05:39:01 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:56 +0100
Subject: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=74xQUaywxzeebI3p/AKN6vOvKb6pTQmwzWbQ8IBCY4s=;
 b=8ik9vEwbTmvcrvG32NYH2EN1MhNw4//P9Jd+czHCtEtrqLHOGMqyBC/ZV/QD9GSLNvH4R7URP
 trRK9NQutJnAMLsQlLa+UqGe5SKSbZShdm0MRdt/xRrUeziMBoeH+ZJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add Milos compatible for the CAMSS CCI interfaces.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aec..c57d81258fba 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-cci
+              - qcom,milos-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.52.0

