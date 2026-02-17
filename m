Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18440338900
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330418; cv=none; b=poayb/f9E8FNkWbv5mglFf5f8HOOn61n7cO+Bz9YJ9aLu63uHQmyfw2n/pe5V2z/am1QNThni8NKgWiJ/m2m5XvfIMiCSEgKWGXtwJf2qdnwnLwlZJLQ83y0jfMwMfkyWWx+FA91k4DyaA0F1tSCRgcZXpikXyvv7dwm1bk7vCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330418; c=relaxed/simple;
	bh=TfAEQ0DQqlw+rJE5RLoCHxNI1QmA0myGlCXlHcg8C9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwLiBf9ne/oWfPkHwogoB9HYKNUgF/el10vwZL3KEzzqv2cFYk4nO/YmNRx9wmkSJvrSsv7lXkgz6Ya1gSb6zyUOVQijgCzxXAeVCxSoKAFealox3wv6b/nvo/pEBEEoTeiQMuDL8CzZ9ij8i6rtqPZNc3RZXl1c7XObFqCfeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvzjbAcx; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvzjbAcx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7964f1405a0so42474087b3.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771330416; x=1771935216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=470sTxAyW3pl5tkqZsSbPmdvi73tkPic1jpEvnpVzmk=;
        b=EvzjbAcx9q/AhIcTj6BwiXAlF+071Bo3wrCZhVs5HymHKawwwaU7mRx7B7O4nbc1Yr
         YeYBYC/06W421UOOvHYny+GkHhbu/s9nNm0roWXoPqTFgVD6FAaF3dV1SYIOxIfuTv1B
         urLOAltgfaD68GZ58j+KTQKIVriMqGhLwUWgZaPlMFptJEQhWOrDt1MzKXv/stKlqEmT
         wlyrXTzOjPRAQPOpFtsHJUtF9WoGf8bGsHy108CBI4mXMcRK/GkQ+doATH1rUUZ3t63j
         tE7eDuL/n8JsaloVIi0o9YhF0BVfErbS+RX1v2QPIPJiOIVbhLFSBv0LbNUC+1DvSPTP
         oLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330416; x=1771935216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=470sTxAyW3pl5tkqZsSbPmdvi73tkPic1jpEvnpVzmk=;
        b=I2BYvvh7BNvm+5oUyb6yMrFZbqDD1trd5PHRq7wROWd4EHnpREjWYmJ9D8wSZZq9lE
         qRslOZlIM7ITIg2pG1jbBIZ3+xKtL7fIAReolSu6AsvOcAkPYtvBnm5qh/0SRO+CgyLa
         /K4NCUHyMZx+os24Ic73fDaTcMQRe0Nhx+aSKU5hdJA+s5T8+XE65M80G3R8XmoiZS21
         yLj9GiCXpi7snTA/TSqvBgqP1RJwPqTDGOPa05eDuTOHZqwNwb1U/Z16H5nZ7BL1Lmma
         jiSEmo42/ZI8i6SzYu3EqrAw/NBmL9+LpBBrCnBTmhtZm1bYoHMsdvuSRhQMSFV+ZfDF
         00+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXvoBlH7qx9VjaZWK5heSzWgDOBmQ3NIIhclED+T5YwdENSQovhXP3sfvjgFay5f3tZ3D70ccNyx5K1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/04bykcY5VIuK23iwjAHjSPmZ4HMrLJ80X1syQA3jRBMMu+i
	X3qJSK203c1ztNCvFnDat79HvsjNzbCZ4u+wdRy15RaKeHS+CkQvjasa
X-Gm-Gg: AZuq6aIDBNdmxdFH0mjyL7yRaARLU9Xia2Yw6iDb39By1fZJkiEqjNgrkWfiFHZkhA6
	z6nz7IbcYpCbkcri6dJ9vCUF6uAzVREgCmd9Qj/YmSzQLeeq71WQD23M1MMI3X+7lrYxqg3GXBW
	kqwDX6riH6fdIAEgdefDwoYQrz4GZ/VW3UIzjh3dzVavC6qAwDGEAqirDIZlpb+M3jFlh50WMbQ
	5Jq0Ys7XhhwBBxOY3Dm1Wk2kBWO8B65K35iwRHph5G0ILljONoYJEcenT+MudaiYQb/bRXc+fsm
	aoVOp15/NpyrC26n1KXb9j40ZTGaupWBFkv2b8akbe21qKWgdzbmAbZTS+MHn6qt++cSOsQh33P
	CpHlu0Y36eYvNqsMZrfhqpjpBLeDW1xdRPvtMQOyD+GFs2C9XIaPJn4QU5R8F7sb9IR1mmGA/M3
	d3dSA9D+1uICcHwgZ6osINgnp9Kw==
X-Received: by 2002:a05:690c:600d:b0:794:d8a8:674 with SMTP id 00721157ae682-797ac62991amr89062877b3.53.1771330416112;
        Tue, 17 Feb 2026 04:13:36 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16eb07sm115610727b3.7.2026.02.17.04.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:13:35 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 17 Feb 2026 14:13:15 +0200
Subject: [PATCH v5 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-cm36686-v5-1-63c2de9709d8@gmail.com>
References: <20260217-cm36686-v5-0-63c2de9709d8@gmail.com>
In-Reply-To: <20260217-cm36686-v5-0-63c2de9709d8@gmail.com>
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

Capella CM36686 is an ambient light and proximity sensor developed by
Capella Microsystems, now a subsidiary of Vishay Intertechnology Inc. It
has an I2C address of 0x60 and is fully compatible with an existing
driver for VCNL4040. Capella CM36672P is a proximity-only sensor that
is partially compatible with CM36686 - they share the same register
fields for proximity sensing, but ambient light sensor register fields
in CM36672P are reserved. Add compatibles for cm36672p and cm36686,
with a fallback for cm36686 of vcnl4040.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../devicetree/bindings/iio/light/vishay,vcnl4000.yaml  | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 4d1a225e8868..2ba4d5de4ec4 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -18,12 +18,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - vishay,vcnl4000
-      - vishay,vcnl4010
-      - vishay,vcnl4020
-      - vishay,vcnl4040
-      - vishay,vcnl4200
+    oneOf:
+      - enum:
+          - capella,cm36672p
+          - vishay,vcnl4000
+          - vishay,vcnl4010
+          - vishay,vcnl4020
+          - vishay,vcnl4040
+          - vishay,vcnl4200
+      - items:
+          - const: capella,cm36686
+          - const: vishay,vcnl4040
 
   interrupts:
     maxItems: 1

-- 
2.53.0

