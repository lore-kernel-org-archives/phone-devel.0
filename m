Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1311F8F1C
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902727; cv=none; b=qVu0fhuxQt9MvVYfmojlcpDmRmmv/3Q5auYDJ5c8hdjHgKeL0qLs9ByZGg2yez5nUj+qxlNAFQmU01yZL9dLJBSc81MR++GlX8MZJLQV4wM6KiT8lI9gibTNtw1PyVqHPQU3/X1xp0DQqMGdJqdKCZLA5vAn+zJpWcubpQoi4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902727; c=relaxed/simple;
	bh=lGFGwODH5qNtH4RDKkJyeypOnyurQWFJKqc9t5ncCnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NegmbQaOfsKaqB7pscfq/I19XzzvTSmGM2MhtlJdytSbET+ieh0GaQ91bq0R3Xe78nXImspjk6UqH1/ftLczV/9exCRoqgnDWqZ6Q54NmrsLR74LvLM6sH85Uy0f8HntvS5nd9Y/ylUKvjmYAD/8BCkMdZsMUXaK7x6xjm2FI2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xhNr38+M; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xhNr38+M"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso306421766b.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902721; x=1736507521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=xhNr38+M9dgopFlgZNephP5Z7FABcIPk3jgz/4G42h0vqjnxUB5B607s34QEaHVWPF
         fySQzK5fzZAvGYsaclPSBDM9prRPXvjmtISVXnT11wEIKywNPLkKYz7Wxz2BsMYLWEMo
         6h8D2bgwwclDOo2nZLqQGGCfC+nO6cNqKlSEF1NIrHm0/OfET0pq8khc79fmnvqdTcN8
         X2j4w1hH2MveUv9gOF0FCconFYzJrI84b3VsyGZ+4DqKXi9Hqwhg0rZox5XmWKyUYiwk
         TRtaPeva3IvAa0JSUtQ/adUnrBUNJIBpZV5WwBq0BUeMc6VjLREq/VKnHs0XkNO7X0a2
         y6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902721; x=1736507521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=ESei6JD7S5XIj3KS1didvX7XB2WX4whtkHvqFIFfKBBvXRWLHJ/8cqmb6jCnyBMCwB
         a5lEb8MmtaohhuMLabg5nMpqehg88z8Gge7X6I/ewtfDNTgwOXrRpSd6fnQ+AEhPt9mr
         /R2sq865wDy5p5AZAjrwbpKRRVijELxPZLyoGSri+qBUsRywtH9bjveIH9v+6DdlFFgu
         CUszsZwObqL2l5GvE01+chfs6JWHqvu0vN/dzbD+fmJXw9eFodFWyXsijKq9pw9Jx+RK
         iZopLU09rOfuw6J2iZwxuouuDO9KqP1McWbZ86EfHtyA03PhPl/ajVDUG5lYbw0c2MKs
         sHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeCga5k87jWJVf7KPbPAbwGZ/87+bpVQM4jIZk5HRCM2NrVMm/UH58TDH2OxxFWAcWM2l0j/afF5PY4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQGrbd8SIxxikKYazrGzumzecbsnQuOUXzeXYQr8GNyviGTNa
	x2LWHDpUynZnIGxvMnDQUM+yDcyiBu+b1r4R5bf8NlOWvNk0yvVkp16XhzgGSptQKW2tM5khJxk
	J
X-Gm-Gg: ASbGncuXSZi9LYYprFKKyi2msZO6t7Eatee+FD8zg+fzCJdLhGmnnADHCRPZhCxdV1Q
	HRxhj1ZMhUpJeYDPZNkWT5GTR4MEmM+jMSVhnbXwC9yycy3zkQFxWnSvFxGlvma3e/VIcMkYr8H
	O6FJj1sd9KbKNrxz0ul+F6kwyA2gTIMOl63AqDQIo2+oZlXe0pwkY5wJ6aP5qXOJH/O+P3RE/EU
	Z2VQtuUAUJpjROp2Ewtop9TbSRbx3qSHqRXUIgk04snhUt8lUajxu6CfqrzmpNpich3yW1m+PXB
	Yolhw4+aqnoh3UkhHGpgTTcaDw==
X-Google-Smtp-Source: AGHT+IGY3KCqXAMnzfDM8VRtAfveUdsHx9ReCbN6sAoZ3bDPUXRPiNKubpCdm919+ev6Z3E8BVckAw==
X-Received: by 2002:a17:907:6e8c:b0:aa9:1b4b:489e with SMTP id a640c23a62f3a-aac2ad8ea23mr4537239166b.24.1735902721429;
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:57 +0100
Subject: [PATCH 1/5] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24P128F
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-1-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the compatible for another 128Kb EEPROM from Giantec.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 590ba0ef5fa26180b7dda4789fd49ce9b27564ab..a2970c7c8f27600ad0d495a7e14875a3be611c03 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -134,6 +134,7 @@ properties:
           - const: atmel,24c64
       - items:
           - enum:
+              - giantec,gt24p128f
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128

-- 
2.47.1

