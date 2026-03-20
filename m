Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5904337266D
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994220; cv=none; b=o6GsletpiEhxrSqbFk6FdsatkT6RmhateQ2cL2/1VMPlXt3UIHnzWo0tEfmTGHzcuDnpXH/c8n99pjj4MwmOy6nWTR5219/zF0w7X5dMOw1Q5vS0xEPW+en5NeqrAo6Y6RrY3n2H4PWOdWY3bIdOcf6HZNjv6cEQvoFpP6TVg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994220; c=relaxed/simple;
	bh=6dtGZbRSVFWRCcAZr6CS/BmuG6zhDBUqyFHzgT0ZE3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4QV+kZF+Fu7I0GUjr4FANxpJefWjHE7pK+EXfpUdbaQqfBAfT5szYshjC0vhIHO2OlFNgrBQp6DkcLxC4f7uaeqnTOHojYFoEuEgDM3UNKuKWOVMFrCmhXztMAqrxg8EojFHhQI3o0Bl1Gz7rKEHsa61RUwAXIAjDhnZFYFahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ITfFca0f; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ITfFca0f"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-666ee394529so2212913a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994217; x=1774599017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BxUoG301RPYcoM5PiwD0xgoq1X+VWOiiJLhYwNLDCc=;
        b=ITfFca0fryZbQjsoaTVOK5meLa/1wyj8MwO9rvKvfZrCOQS6sl9PS5SoYfEp1fRVEi
         pWCPlBEbm0r216kPMJMhniYrPyJoDMFAJOqyq/x5fSn4M3BaBwnxmqKUWQgM6mdsbAmM
         n3X6URMeb2XP8DlbqvlweBy2OvcxUOnEVJEY/UXbohO4J4csTcUK79T41/UJxH6rZRQ3
         OVlCWxqzpfZ0Ok5m++t8JYCEo3MicFy1PZxUCwzh9YSGFRX58uRDETglxHxMtIuLJObK
         z+498bW6aCa2LN7CifNagbdg9w1R00pixxhAnWmHB6wjRM3XexMaqG6pQZ7eMgcPzvkn
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994217; x=1774599017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5BxUoG301RPYcoM5PiwD0xgoq1X+VWOiiJLhYwNLDCc=;
        b=Z+bDV7eT4cMgDjp8ydcVeK9xO2GiMopQKarlGvL+GByr2++tQQcoFV5o1gwZ1gg7ep
         fBWoLqzQbG+gUtF4qRWHRJTQDpLuIVcKVY8HZr1fb6V8SEiw9gUeaHWjrdo+hL67gFjX
         LAav3CRBpYOFWBsn7jjVx3LNFpn8abdEOAIyAYRf8Btpm2glZu46EZZt6HF7JB6nJeRU
         dZJfCZEOADym7wCzvyjep9njWZjh3umT0qT2jMAt7ASP/M3UT4IInX0HixL3wsmM/f3c
         9OsvBHfjJ7jwylQFfaQv6QOfqP0ybntB3ZThUaT6QUqlRLPnxfpgAPGf/gKvGztIiqIe
         wtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkAd0JBo1yuBxNU5MJOAFrxWmlvi0D0V9xETDTehL+CIj6DwsvKyA9EzNOkJAbNQWN52pz3ePLQ4E2oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9uORoAoizZFv8TQBIobTvOdiaRkNR2Q1kG69oU71gZLcf02E
	eeKUz/VBdmKLSDUNVe219YcsFjLEIk7CNoVSoY/mXtKczJ5tmqvG33cfB9vFPeRHbgERdjCxOlr
	GglHu
X-Gm-Gg: ATEYQzwNiizERAwTpv/b6Joa4B8vwhahT86+eE9UQ+tRTbIabce/uMugsLPGR7/BTlV
	ntxjLhqqIxcL5AEbyH6mxT55iG5viGyjlC0wwDUdfSZNh6F9/BakN7BJ5BQkOTAC5sloAFCC9WX
	uHBAhRTrUj+Cf4s3TnXhbekMdlplCXCu1oMRIpN72VV73h+SZa8p5Vzo1j6wkXggW4FmpmseIZ3
	dnZNSftzr3YlZ4J1dT6hm8Oq95kXWbj+JVT1ta1Z4VX4A4pwVyTkD32SCWWftljRojBsyDUfq8K
	FdE1IYiEPCtrG7C8KS6WU8uN9I3OxjEgDrBMg0N4DxQXdx0hKwuIwugYBLp1Wg/MCQDbamjpbKr
	PvDnW6qWGeFpXI1Ku7nEd4XCgMH0lVWlN6X/q7rJ4IJblwAF8Hh1HLj4kq0NuWGf1HWVZlL3kun
	uNlNd+bg4LhsIYNaCbp6vK7YwEfHlkx6sCb2srmnfkQdz01ic40IVvPx0hRJXbUxM3rHZvFb0j8
	ynjig==
X-Received: by 2002:a17:907:a191:b0:b8e:fe3c:2255 with SMTP id a640c23a62f3a-b982f0a94f0mr106385166b.5.1773994216560;
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:49 +0100
Subject: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-1-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=1353;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6dtGZbRSVFWRCcAZr6CS/BmuG6zhDBUqyFHzgT0ZE3M=;
 b=HSxUaO9sCaviuTGLssmZ8jeEeOxakzeYqv1aIQWxIlpi2X6V7G8CHUAT2UYx1zXBV/IKgZDFH
 LJnoayH07leAU4f1eWpCQ+/7SY+3bIxZ7xRBhwiaAHwfs31WCyV7avd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add Milos compatible for the CAMSS CCI interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 399a09409e07..816c1a48edd3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-cci
+              - qcom,milos-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -265,6 +266,23 @@ allOf:
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
2.53.0

