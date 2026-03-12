Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C32C0299
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316402; cv=none; b=ZPdQ5swk1erRhuq3YzdJl3nQnm2NTza+JXSoFVefzaS0yWNCz+UiM2CNvFMg0JP6zYVceKuFjc+Oxsmlg3GokU/GhEKhB07A+hdRRNgVEKCcbamp1Yj1Bn8XlFHQMJT/m5aZ9VuZpTX7AvMq1X5U6mwSyioT9zDbrPiVF+NSkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316402; c=relaxed/simple;
	bh=2iIh6/jj/6H6G9sjbI72U6v40DlA/kmaSOoZzH3A9CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVaIXIHJrgm9EpXBUOPgVj2TJwe+lkY6qd44wqMojmjfuxMn1H+7+7kf8tEH8nmKFTBmnQpiCyne8b0VEbxeu0q9nHAPERQmz/D1IoKj5r7n5KrNTxin2pS9jvcAnWgWP0U1BWxRY0oKquip4zfEAcOt79e5mfXgSkoxdz1jm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkyYbbL7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkyYbbL7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso601334f8f.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316400; x=1773921200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk8qVbjj9bf3D7zS5clldQ8atXUlML3S3z10DBlLuFw=;
        b=FkyYbbL7aZoySwQlbBWia42i5HN4GslFA78IhvI6pIY+6+AvbjC3AItvOu/Pev3iNS
         WmLqRlhsTE4yMJSdFXvWI6xt5q1ibXqyuMeTfFtVWkLGSc1JhRDVz9qiUJNlm1p+hmgR
         x3kk+0KA36ukzsm4I0rKPqwTWfHSGXD4Vfo4kq2vyE0f5AEm32EM5Ln3DwagqGAiBTGr
         SLiM9Bz70dahF3Rm2aXvgtnb8yu0QHYXxxx2Pm/LgdF+X/TD8rJfaMY9tAsp+Pj4Tu/h
         4jr60MHL0vNERXC0Wr4BXE7p/lwxbc4Mgo4egckQFTdDLPVSDztgK+kZyoUEuEv/IDfh
         Qprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316400; x=1773921200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gk8qVbjj9bf3D7zS5clldQ8atXUlML3S3z10DBlLuFw=;
        b=tJp/U6/Xiph6BUjH0zG7M/iQf2XL5fTXdjUjE5f7cMKa7LFqkWIqpeTO6MsL/AMGER
         ZNSGZFVemOk8gJVlwf5qFY7osGpc+VpBLqZFVvaL0dEUu1je+J7S0VEq0AhArrKkYPCV
         kEOnM59k9BZaTKD7hxdq8vWIndlE9+WeNDRnqNrjCQnHvN8YLuPI/T8oySv+XmTFkua2
         2krQ1J9QpCULXEPK5Z9z/xWQtG3bWLbeC5BS1j01V5CFL3kvSF0RrRykmeZChxlVVOvp
         6J77lY2LJV8sdJd5E9noVsIAikpLRnAx2RIAmZQk5PfHbZllcrtUrK5uV/ihZus4Njoe
         Rc9g==
X-Forwarded-Encrypted: i=1; AJvYcCXel2smKp59pNchiyj3NUo9hZ7PSnErxXHu/SY7IVtd7Vb3rMTND207CWVGJgMYZnvz7m4YwQj7GvKI/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYel+MB9I57p4ddFIK7rAzY7P5xQzWjiZsExaOCNwUOI76uUBg
	SXYC+ob8+qj5fn2opJAIJzbP8RLWOMIVegCle8dpOkYJSLUeaB+HV9KAZ7dm6GfA
X-Gm-Gg: ATEYQzzzJxUg+V+34TdCfju28EEGeGiELweWiTi5stswQR6Q6rFvxCUBQxfiNp/bxdX
	JK2rfPm6sLZ9V+23Aqsi/b9SKUXSYI0cAjMHMoGwybWUxhQy2j+CorGfKEQVPxewfZBwXZxinGh
	SNSB0DEybc/XHTGZxLbKegp+qiUzrzhaRuQ+Ptgw59k/mg990Pb/RytjGmasV7vM49Y63HBpk3F
	eF2gru1GJasdxHVJqGLHGwRQjoP/Rhdqbh1fjWq/7F3tG88M4td+fFBzSxAJYbtuaY1+wvJbMP7
	hzEZFv6w+/XsbvUwlTYFv16f9EnHTLvZmbW1cRNCLhuf9yr75I4J4c2bMfSkOzCP/JzkDDyc6s2
	0vMLXiREyAN15bAZkVY65TA+lupuGMXFrgVGCkHUzwgAQmJhOJ/OMWFQyhq5saUrErC8Z1Uk8Wk
	Izqws2ZVU26upv9kmtVCFki+NMGg==
X-Received: by 2002:a05:6000:40de:b0:439:be86:5051 with SMTP id ffacd0b85a97d-439f8415d9amr11408103f8f.59.1773316399868;
        Thu, 12 Mar 2026 04:53:19 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7044960f8f.31.2026.03.12.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:53:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Mar 2026 13:53:12 +0200
Subject: [PATCH v2 1/3] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-vcnl4000-regulators-v2-1-2bdebbcbb58a@gmail.com>
References: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
In-Reply-To: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
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

This commit adds regulator properties for vcnl4000 ambient light and
proximity sensors.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 2ba4d5de4ec4..a1b4c02db246 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -33,6 +33,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply: true
+  vddio-supply: true
+  vled-supply: true
+
   reg:
     maxItems: 1
 
@@ -54,6 +58,9 @@ examples:
             compatible = "vishay,vcnl4200";
             reg = <0x51>;
             proximity-near-level = <220>;
+            vdd-supply = <&reg_vdd>;
+            vddio-supply = <&reg_vddio>;
+            vled-supply = <&reg_vled>;
         };
     };
 ...

-- 
2.53.0

