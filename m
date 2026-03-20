Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008B3D3CED
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025148; cv=none; b=T04kC6Wa8VVYSTNNLt/wo/lkxuM6aiO8BCptdPHIhSBUGh+kS33Jslg1uD3KAH7EsmONbE32MtPsRl0cqEVyg0Uu/O2LdyKUmRhjmzcw15WVvgmGaBe+1lQp2ukYG92jltzkjf3w4AJR9ncyKPcByxhvjV3W04HfkRzWwhkePHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025148; c=relaxed/simple;
	bh=TDGGomY91nN+1JyvI5TZ4EVzE30ok0VSWE41vwKqiD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yk323w4Qx3rxOUJt+zdXdZjlIg7aMhOFf4A4Q9bgFaJ1w9EpPSoPQP3eHGUjahYGtfIjd8q2dFU4eR6YGX1NB6g21cKjMA9XTdOzp2jITUlRlLkLIjmRMTaenmZ59my5mrcAjc9QWKxN5ZNYqKEMk3bUkaYmaAHDh/TyNjefRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4C5h1c3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4C5h1c3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b98069e41b0so409462666b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025145; x=1774629945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0j1VhXqL1sZ8EwZY7NLMpbNkl6FM/lHHiEwrtRqEHg=;
        b=D4C5h1c3OjwmIar1o1LvKWf45bI8Z62PgEO3mAk42Ke6vDUH7rDapPLufhh6ZLLo44
         lK+qOPBklDCxqtzPjIh/qLme3MKwcEU26GjH3OZKWKGqcMFN059GdnA+sgJasj2Agx5Y
         ODNJy9R3i9wQaGRZA9UqMkoxxN3EN2ZsHrVduVQNwohiVIHlBnFi/1irwZZ7UlRKzuPG
         PI9z1Ty03tI9dWIvE9qpAqEt/uz/JUf3WKBMju8IC7sXMrWhSggSRGdO3Gv1rx0sLrma
         lLBDnyfu3dI9/WD3RandDaBSTIHxm/wEqQjnif55CApo80EDK3ubKSo1HBu8aSZxJohk
         8jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025145; x=1774629945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0j1VhXqL1sZ8EwZY7NLMpbNkl6FM/lHHiEwrtRqEHg=;
        b=ASnoFLOke+4p9clZfgJQ3O1eVAv0uIT+9smTJ27SU9IKeZb26Og9lN5h2N6w9ZY6sn
         acsXB4Xyd4hsysX7DT5FbjL7YuRhosD/puB/Pl1OrM+rCfvmlvtQ0wJCvyJnxV30f/ZH
         P7s2D9BBIVTCWWWoR3O9NhmSY+V9/7K59bV5NU4KR9ja9738dWRKgJMEcyc9RfOU4N0B
         EC/21GzDoMx9lgKLBBKLCcHD4+Ch7+vhYI771sVe0ecVi0kee5fNhYV86tlPleqsxQu3
         lzUHaUJVLCX9Qe3EJmuNFMpvJWKrj7/FVCd9b29I5oU/y2+jEQgcwOv2rE0PsziFwLaq
         cSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6B384hctSPv2CFuf8O2UbiPx/t24ytNlzDPBQtxfEfe4bmvOEI+AWVwQDyL8gqOAKbuHrNdbclP2JTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFosk/lgbY1IS3uAyykFtFBClr1YMCsE4ak/nn5MkfhJ9Ia6qu
	UhU8vIY+YjwR5SLwhbI3Ppq9QFj8rqxQngfzZIiXcldtjbxHnrwl6DQL
X-Gm-Gg: ATEYQzxb9U75TpcEdFn6T3GuRXHrYGR7pO/QKGR4B552LXLk7n85zrlxsZ7K0UJvmOD
	Q7CLOZqCb8J/xDBD044Rv6m/bRNRwsRe2u5vHzKX2NT1bMuiU7uhAj1pVb+tAgZinImIWbQi465
	1oL0KnP/9/LMjMr3ErghGLBcweEzYPf/zHhbiaBMAWmC1VQh1CK2wta7dFoKlJejYfwQgYHrLo3
	6PFtE+bgdBLUPd0Vzu0NwV6zLH7OIj3ua3m2lw/xibeHcrqIOIfjWar0CaMCf/4J8kWkKZz1en6
	xjTGXGluC5CXMAC1f0mxZ2I4CAMWCr1A14PId3VZDFZsFdUl0S0Rxoi//J97fFuKwJs+Zftz6IE
	GzsN7Yz6BmVEALhxfkK4PGgCVsp8ATQXiBlDEMEFj0QVhg7YlefYzuekh0Osa+deEezCaSQalDR
	kbmxd0zYyNTBlP8HO/K+NH8ZCXog==
X-Received: by 2002:a17:907:94c4:b0:b97:3376:7b5 with SMTP id a640c23a62f3a-b980fa62dabmr489218266b.21.1774025144508;
        Fri, 20 Mar 2026 09:45:44 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:36 +0200
Subject: [PATCH v6 1/8] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-1-0d24d20b1a5b@gmail.com>
References: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
In-Reply-To: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

These sensors can accept 2 supplies - one for the sensor and one for IR
LED [1]. Add supply properties for the sensor - 2 for the sensors and
one external, for their open drain interrupt line, to ensure the sensor
is powered on before proceeding with setup.

[1] https://www.vishay.com/docs/84274/vcnl4040.pdf

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../devicetree/bindings/iio/light/vishay,vcnl4000.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 2ba4d5de4ec4..516afef7a545 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -33,6 +33,17 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply:
+    description: Regulator providing power to the "VDD" pin.
+
+  vio-supply:
+    description: Regulator providing power for pull-up of the I/O lines.
+      Does not connect to the sensor directly, but is needed for the
+      correct operation of the I2C and interrupt lines.
+
+  vled-supply:
+    description: Regulator providing power to the IR anode pin.
+
   reg:
     maxItems: 1
 
@@ -54,6 +65,9 @@ examples:
             compatible = "vishay,vcnl4200";
             reg = <0x51>;
             proximity-near-level = <220>;
+            vdd-supply = <&reg_vdd>;
+            vio-supply = <&reg_vio>;
+            vled-supply = <&reg_vled>;
         };
     };
 ...

-- 
2.53.0

