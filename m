Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466982E92C4
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843150; cv=none; b=K+i3xlnpwO4o0f5jxAjXJaYrS41sCrRQfXZBlCSR5p0vJBN2T7TboTsOorvOIjPbcmJVmdIRkXaVX2jVq2iwVdbSnWktQN6znoWUCxwBJi9GWcbQZ/KrSjbjktwj01jyIKm6/1HHmCgvasMZKaHt+SkKEIr+s7uYNChRPnB8P/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843150; c=relaxed/simple;
	bh=LRhM5EQe/E8dZLiWtrnYUcrxAzx0edYLOp2wjvSBccs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ4eVYDoeLgbt9ZCYm02tLrNDCANKWMeUwOftrY4bWMQdy5p5G/4TgWbv0vkr1PMMeaoeRW/QuXbRvDZaG4g70KphsISt+7teAiuQJiOf+dMoDVp1mMw3w7pGm7xEH9jj5R7Kt21fA53vKQObmJt4kwwCYH/XTwDX31RoprJFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EFdLpWdc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EFdLpWdc"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11881330a12.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843146; x=1751447946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XuaCq04YCRg7wjyDUukj74YYgdGBG6ruc7T9PeJYas=;
        b=EFdLpWdcjkS9sXj9WlVFkplYvAoKmn/0ut9M5AtGR8uT9e3jnCLHR91QPrfmlEkA5Z
         mXr3eyHJEIS7vqoRabMsDs9OvYY4K4068hWilz/AnBf9ZwxT5gGR+KEJtrtGTuCMvEj3
         55o6cJ9Rrqe2iBvdjNLfvJNPdZDJWKDt+0reHMh+pwne0Qvyd2aV+Uww97E4utbhZXht
         MHtPtcuZP4hDezWkYhV1Z/QEyhfsDoAx817KT6J+F1OuEcSvJck0x6zSftbYorP2MxSy
         ozp4L5sEp2jFafs0ohUMAn+bMT20MRO0XW3dUszKWO9W32jikbbMY0ftxM5bpGjJObQn
         I2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843146; x=1751447946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XuaCq04YCRg7wjyDUukj74YYgdGBG6ruc7T9PeJYas=;
        b=NUBXOn6CogV4EMCcY77KXXNHu/UA9+yfeFOcBP2M6ijSj89uMtM76CQUWB0ETSg1r9
         eyfELrh0fRvWJlY0jZOlNxJ/DLHI99CyA4knDYLgMxOHaLn3veElhv/jdR/HUlAyFqPu
         c8TuGDuZ9oZtoplZBCy47nUwvGNF3DZ5o+zXpgkC5O7RO64BvQC8t8rIxm0gNkenw7DG
         bvefpwZtpD3tJE7qSjFBvNGMw/UEZ7/1yRRlwEto+yXkt4Ok9KXUFEDzPyKOZPnt1dLH
         shwi+0krCoAK+iVt/XC3ywKsQuqPHVyesLFJ9LTWAeJGO3b7q8Pplf6DLmmShx4qpH61
         +sTg==
X-Forwarded-Encrypted: i=1; AJvYcCUTOZcnnVLx0Tzc+kfLkTbyC+3067skB6Iq+mLxHF7mVIDblRnyMxeOwm/HUKXEi1gJNrLIm67FnSvNhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlhIRRbd2iyL/1bKkkMO42Fj/7kWCUGZtjf7W94FInkKHUMzB+
	0p95QUjO2vTH9T+GZg1YyR7jNkFfVDXBcl7F0w9hstRRyyzjAMi3M7PSYpU86V23Yfc=
X-Gm-Gg: ASbGncvmGMKql+HQVCVDkaom0cIGOSxFaRfQfA/l1KslHPy1Vh6E6BH4xF6KFlDrFbT
	hQAFpbS1jxOhtjqOm0TF/R7xIu/PXBMqeNcSNIu2qqSp6cs92kQGZvUK0Xq3BXlpEQxN/QGNrOW
	Rn7g8Jy/LF6VRuMi5zFGJPU8qT6uUSvZ+Z8Wxem5wbEN04TeAJwx10Q+9s2d/+6tQ2h1H5ujBKM
	tvxwFOHnv1x7tgZ9KBRNDnAOJhPIEttaR12IFczUr74sqtMSMfkD6jaOl+VhePO28D/Y74ziUic
	oUfKwBiMyLTMk1uSoRAOiF4Gm/Yg4iLFSX41eRel7t36Zc0MOxpeOzqov7S858wD+cCJkc3KQgV
	jb1z/QpHSdNP4Y8yqqFODHyWqpjPQavu0
X-Google-Smtp-Source: AGHT+IERhYechcJvF+Dtv7X6Aq+Z+zOtEoXFGIE0yuBjIdgHsZfdoDBQmurBw1t4QoxOXWDqVUWvmA==
X-Received: by 2002:a05:6402:5113:b0:609:b476:4d95 with SMTP id 4fb4d7f45d1cf-60c4dbb777amr1362134a12.15.1750843146418;
        Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:57 +0200
Subject: [PATCH 2/4] regulator: dt-bindings: qcom,rpmh: Add PMR735B
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-2-cab8ef2e5c92@fairphone.com>
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=1759;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LRhM5EQe/E8dZLiWtrnYUcrxAzx0edYLOp2wjvSBccs=;
 b=T2Cmu1rQmNai2kvf9Wexy8yxt+NdIB2/JptwBzJUgrUFzMh+lMU3PXkc1dQkXO6/+plndKa8R
 fU5rQREmE0BD0clUOSCdMIZdEC4uUIBzNje/q3oRWogqE1v5vxcChGL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMR735B compatible for the regulators in the PMIC found with the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 3dd150e5dad897eeb46e13dce5bb2726fdb90627..4c5b0629aa3e622579b54a226785139a0b986079 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -54,6 +54,7 @@ description: |
       For PMI8998, bob
       For PMC8380, smps1 - smps8, ldo1 - lodo3
       For PMR735A, smps1 - smps3, ldo1 - ldo7
+      For PMR735B, ldo1 - ldo12
       For PMX55, smps1 - smps7, ldo1 - ldo16
       For PMX65, smps1 - smps8, ldo1 - ldo21
       For PMX75, smps1 - smps10, ldo1 - ldo21
@@ -89,6 +90,7 @@ properties:
       - qcom,pmm8155au-rpmh-regulators
       - qcom,pmm8654au-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
+      - qcom,pmr735b-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
       - qcom,pmx65-rpmh-regulators
       - qcom,pmx75-rpmh-regulators
@@ -445,6 +447,18 @@ allOf:
       patternProperties:
         "^vdd-s[1-3]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmr735b-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-supply: true
+        vdd-l7-l8-supply: true
+      patternProperties:
+        "^vdd-l([3-6]|9|1[0-2])-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.50.0

