Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858162D8388
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061610; cv=none; b=tFOoi3dIJdxfCRSyDyGPzr/iFt7RKhZJLvhZ/CUXxUjH4ZH3IDzkkxtTWpfE7pUb+9R/oEzIa5d669UdmSveD8nfexJpPDVdyRpkYGKOHgh3nWY+wQ8OEw+Jxz7CwLwcp9rUtAKtDCbHMS+28NWnGzLAeemsuRqHmGIIPeDRSF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061610; c=relaxed/simple;
	bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dk5lN82JrGA1lc6AQ37siNxbZVRybKlIV5BkXEMgYGPdsb7F0NPc0S8B3lFpLToVJwD4P28Mp8EAAx+6AL97LN1dwsu3J9f3RmTGndO7MkzOJprrxiskK+IurTc7P+75DlC/rJQmWaEdTYqFDctwj/Z00MnYzSNZpzEIjzCJk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VBt9VV5B; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VBt9VV5B"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1122295066b.3
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061607; x=1752666407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=VBt9VV5BGjG2qdOtZZi+3n2SISEIPJcgZK2ad7HSrLHG5Ci9UrUZKnqAvEtE8cVxPP
         ioOxHwEmswnyGrTCwSd6mzPxR/fKNLnSvmIdWygdAAoY8r8N5w/lr+nBr0R8S4pDfcUm
         qR/JqiNftu24j76EjMgcegC+fpurN6T8/LWYDAxcmN/x9QmvrRmezMi3+M+a8XW8vKnj
         70MkceQMDFmgJglNViG8V5Z/VQkQE4PvS6OvLriE61c8uYcy6dgkBB6wrgahJbOp67XZ
         8WeJ6FpoL9rnoXGbNQgvM0QbZFr2YdO1z1yLyi2NyShmRS98WQ7kyD6671HGS/ZlKCBE
         68TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061607; x=1752666407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EegHvYrrPCIQqgQ2t8JqZ4VMYnZfDGCQ8pNV8iQc7CU=;
        b=Dm8S1IVkDmIvHNdZMjg9wDAChrU+u6Ru52RdmFK3YNlvOYAr07VuOhVM+TwQ+8CGAR
         Bsix36bFm2fDiZUQ6nwrIMyZWhKFx5EfBXzIKKTgbuVrpn/CH77WqKK0q5c1aO1vBITW
         wJiGMP/xULIEw48BG6Dtbyug9haIG2PRKIjhY/bm/sk0lpQRqpsTQpfkIZ31HmgkKE4w
         YPgwimnlc3ClQiLkLgBTCYQN6CmF11AE99noeibwROf0WHMT50O4IqqFn6gEnmiajsns
         tZcY3qOogrMjZzesImAt2exIXVZwK7DqBtF5Wcc8FDw20yyG1kWqZgpEQLwczsEA0kRi
         mEfg==
X-Forwarded-Encrypted: i=1; AJvYcCUokdV1g4Fp/NMXL8wVDoL7F62a3MuM+HMmdFPDqcN8NDR39nKtB2KIJbZ+/Ijylz3nOg/4U8YbbCw8eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbrkJ+9t22zlRHPXJ3ay27J6oi5vVoykNcWA+wjuuUnOKuecj
	Or/axG6yxVBqKzCQIzlfDBgZORxPetY5bghY98HyERjL0+tESBN+VT3vpX3hQ9Lkd5I=
X-Gm-Gg: ASbGncsUgvI594a/eKQe2nY23u2r5Ogq3W1n2Vz/4QDpEc15NLUkjD0R800aG/AZit9
	h/ko+pLWP1YdTBzI4Tup8iZQcLS9Dd7e0ZCtywEXvrM3/uZ4jVij+JKfY1VhAXpH3eQ2RpxHMRf
	9M+UtTJ8ofWwYnqeecWJAKNEhjgQQzkguZV63u3Q7VK/BSPFvqs/l8zBCzshk4tnNAXqAlQDIrw
	+sbd1ZjgjtyxbPehA3M5mmTBTU/6SaKy3q9w6KokvjSrHRjPjUOouubdCb9qnvMi6MT+RdaBdce
	Ssq8yXyt1oK38SnfKvwlljbrZ3pPhONA5P6Y35PxSPj6uBEsU4Fhridh627MDpfcNO+NDxZQbIU
	eoEzK4DVDE3fxavYU78p12mA4ttqVTwJh
X-Google-Smtp-Source: AGHT+IH8++sSptF4PFmgOO2SoVkqa8kWBrD2klC0z8ScVA3E4cagnkpuHMUm8tmFrS3e+H+BAb/SOw==
X-Received: by 2002:a17:907:9304:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ae6cf68abd3mr244682766b.20.1752061606800;
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:33 +0200
Subject: [PATCH v2 2/5] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-2-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=805;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PvZsZ3xz+u5VNLl2F5wB5XkOzE0mkB7Ym735VGNcjBg=;
 b=+Lg9tCTaCrXGzDssZR84RrQo5jkI/91wtmSjNyg3a8RuAWb1/jKnh/d5ruDCxQ1+jtnzmbuLO
 xjJddmrddxpCCKc9p8vN9KaA1+nGMo2J39cjNnhUTDGOED0PeVOsLG2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PM7550 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..d0c54ed6df38db82e626ebc0687cd5d3887abc5b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm7250b
           - qcom,pm7550ba
           - qcom,pm7325
+          - qcom,pm7550
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009

-- 
2.50.0

