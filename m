Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2C1EEA49
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218934; cv=none; b=eIDQ/AC/IXpCxBZUIre87UY8Oxs1gVlu3IDs7LQu0MvvU9+TCBKqPvycWNKHf70ZCX2fEJeH5VxllIvPGPa1kRuHWTtatu4Y1to6Rs56Rl6ZjlxlmiDpPCRcbi0MKQdOM8TRzWNLVxPjuy42FACU8F7AG6Ptrpf7xRhdQJLgB5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218934; c=relaxed/simple;
	bh=s99vjdSD8JKSjBLwhXF+K3c2uNXOfM1+ToBvlhwy8Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSVBpzQrnurl17tz80dDthY9DN4sSqacwOVilhFFMwTult+4oj4JLou+EK2lJNE3js5XVBpHc4Cs3g5KjMn2HvLK+G8B1RDt+DfRT4QVDa0wfiyce1E7LHOgPdkM6y74VsbmrapW4fsh8PUX/8hyhk+j6UmY2c3wGQTuppEs+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u5+ZKON1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u5+ZKON1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so2441761a12.0
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 00:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218931; x=1752823731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Guyg3Dku6gSOGJIk1yNtwz5/QvV/EdMIq4xoMzAjx+4=;
        b=u5+ZKON1xP8ejd1FHPk171F/iFmDKGlN1figQuH+ebPPRiPKLQgSPakyqWnNPpl2HX
         zCvYmWeFnUbQN/f5wzr3hrQZRTNMmQMsfo17KhWoq45dznGo1osPINalrgf/+kkj9lxN
         fuGLiqKLG+cAccZ9k/6lSazZsNeISfVwL6ju46FqtTutwrsrfU63soo0oaHPqfb9WzKx
         GgfQmwTHf6XGNL9eLJ3Qqb2q7StBzDarBjKB9a2USt/qfOUN2DjoX1bGX0o9FRoDJM+B
         lzjQXzz7jtC76+TjuJUJ3QYtHCSvegG0NL5DmNAul4xECR2MZlE4/5URorSS0yLfUkNW
         /42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218931; x=1752823731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Guyg3Dku6gSOGJIk1yNtwz5/QvV/EdMIq4xoMzAjx+4=;
        b=k/U/eIR/kvslVPbswtAb2+Nv0LjWrUagUzKclwEYbB3l2C9KRL4TKvhYbuQozqgedb
         p8xhGFKVv8Jyy8fPCPo7gRe5tc9GQWKnSyRHTlqLZ6L71i27wwT82XdwhNshjFq3W26+
         aJV7MCJ7VWpw/pheEF6fNhWjJ/Ilh40MuUQRM7oXqc/6CcrTYYbw06ERjGiwX+Rra1mX
         WiF6Uu+a/iRXTfZn3I13cTMWmFagiEr5egTKOccivUXKW8QzRmqyNXqU6w6J9GZUR4c1
         RDk5UQYU+jW+lP3t/X7LTPrXXTtKUNejT0T+gHXwG0m2mZSkNlmn7SuIonHRgI4eb1dE
         zUaA==
X-Forwarded-Encrypted: i=1; AJvYcCUsiEu1umuBPWQ9jC9rY9WPKad9VSDzqnAPi3S7ftmzomQLiAQ7Ffzi0Sa4w5hgRa8lo1cZ/Vcw4H4ZfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmA5jzbADM3GQ1GTrhpfwjHt3Z+Mk/mRiz8VUvNmv0IEgoRslG
	mteNUHY04leloLJym2ocmtv1fXL3qiz8g3MtalL2pebGw+Uh2fvXs5IM9y86Fs5C8vI=
X-Gm-Gg: ASbGncvDhWxUd5rCRtq9l99fA2KMzH+ZN6U9kzHU1R+QDky82JXY0AlvYjYtGk5riMD
	h3YfqjZgFexZQZfZ7sT3knqnroLrABVfu35eY3K4TBMJ590e1+mghW8J7CA1xZ03tBdwpWgz9pB
	aRlg7ITgQow7L+J3nE3UiWg1QG8k+f23pQI0CxckN3PCwMzjLcwOBJbb9y0mWLC7tl8oWtP8hu0
	GkdK16ePt/kZ8NsGuVcEuNtvTF84UzciBEpGGlzc1ly2qPRRWa7Ki7+5d5PKP6k3zgr7tr3cDS9
	ntHGEBU8ri/K6Yc8xm+PiK+k12V9rmYo3UJDYGiqbbSqucdE5/dkRotJTx6DibHrZnLyp6knE9V
	FXGY4sbrfUJBSkE2SvRtFQhaENipQsfXnG6byTcoE39clbFvFNrPS2KjTNQg8WHCaQN+j
X-Google-Smtp-Source: AGHT+IHp3s6DviSxN7N7I3wd0Qzn2Aj1Go37Mhm2IQsp0ta2KL9iVxYAHSfEDkuQksb0cQgcfTmgrQ==
X-Received: by 2002:a17:907:1c1f:b0:ae3:75e5:ff7a with SMTP id a640c23a62f3a-ae6fbc8a3dbmr233866066b.19.1752218930812;
        Fri, 11 Jul 2025 00:28:50 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm252600966b.4.2025.07.11.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:28:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Jul 2025 09:28:40 +0200
Subject: [PATCH v2 2/4] regulator: dt-bindings: qcom,rpmh: Add PMR735B
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm7550-pmr735b-rpmh-regs-v2-2-bca8cc15c199@fairphone.com>
References: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
In-Reply-To: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752218928; l=1825;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=s99vjdSD8JKSjBLwhXF+K3c2uNXOfM1+ToBvlhwy8Eo=;
 b=XEhLbu+scRD6Z80jYRQqaIzPK+6Qih+bpJLGgXCDOSrN6hMITrqYWWMIt4rHv+9mAk3QvOU2y
 x1HudWxFVSbBR+KAfik+T/K1IULnVNaxgIVnkg+taPLogQ+AUJODG3u
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMR735B compatible for the regulators in the PMIC found with the
Milos SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.50.1

