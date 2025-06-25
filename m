Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4AD291C01
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843100; cv=none; b=uFvUxxjGphaGufgNa7IZVS/Vpq7D2DxlAYKNvh8x/iy1diV0jWKwIkOUhalH7vxDXbOzHOi232pKe+lLGtiA1GGEN8EdefQ1DRckpBL6biJ+3eeOIupXqBiIM6gWYLp9nMsrIaMZgTM5xGxbO8nNQGOQsxhD7JSx6Gj7bF0aU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843100; c=relaxed/simple;
	bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPzKz0LwYLYemAEW3yv6ix0TjO37x7UGsfqtGnklP6vRi+Q+GMKtKi1L92/1r6HrIKanpNg/47jhjxemFdkQ/5HIvYHgi/5yT+6lXXwAFXGSbusKOCgH7dYImgK/n7cA75o796ve071mt2gdH9w3cHJmnzdYEfKHLZLRq2v18Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uNaTUOOR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uNaTUOOR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade58ef47c0so145692366b.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843097; x=1751447897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=uNaTUOORyt699w1SXS1CH76sfqNrxw8t2G721zWMKUg64cNvebxu8wBiaK9pjYZ6CX
         7lVBTaouM/NXE8f/sQlh5Xw85+kNIXy7GYIT9Zchphrn0nLsMCEPzXM165nAs6xQ66UF
         r1ZNDkNksoQmdfe1osabRWzW99/lY2gMcJPHcTptlVl3GUZzuaHslSTiWLIDvYYx/fM9
         0jeo95qSbmyKGmHY9jSCZxvPn8BAbvfMKLuW5R7cLZF8ZeNjUUhZ0g8pCNujn60xrX4r
         YJqLKA8qJ0U9+VHa4fgyIqtb0O25gne9FKzEMg1hi/+ZhgyhfZVgxi7WObg7ojCHwb+f
         aZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843097; x=1751447897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=S4noT4VsnHE/z10ER2oGV77y0hZmsd2Di/DOQqUQEyr9yjS19xsdgsIaDwx8QwA6iN
         lVuYvfqdWvk+9+m5Iqnab3k8mDf0dp+mI1t9eFwunSNVWSIE2QC5OvsiJI/9b5CcPL96
         BQvZvn1a6e07kDAXUOalxyRu/FfNnX0RT2R0CG0Dg58KKle3+qquSi24HJZ8AoqmhJTT
         roUxhpHLHEVb5ucsrZnO1qpO62NHDPY79wCW5jjZ5n/mGUQ+CYrVYR1APHNV4hS3DSRk
         XYbegMzSOYieFUAtsKmKKdtEIqAPbEa0LZML3ZxJt4KcqL6tdDjvUaV23SSUQQoR7EbU
         koKw==
X-Forwarded-Encrypted: i=1; AJvYcCX9mqh/R6GnmzNhiriBaNsYkty3vA5XcSpfCLa+J8AYbm7EjOlQxX0n3RFKwQ8LvlGfseBmOuRabExrVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTu522rKitP/IwA9XEgF6LyQOY4Idb6kf+ISI1QkjP16CpTJTv
	IRH970JzQbHsLyUU0kzLHjx1cT6zX4SpVAW0xrpcavHgPr8u5p36IShqFfkWtY26WZc=
X-Gm-Gg: ASbGncvLjQyqZadzg3gGZFtghAcCICJ3AUCrNLjbBNwukoAAM84Q8PMYi3GEnAqwj2Y
	OyZGbbLWUCTLq10K1hNC6RaADeJDYGa0EZv6/3UJXK78OBFQLLpd3pKnBccmuXP29KfG6viccPw
	x4jD536QaCXxiNXmg9TDqtmw6e/uT6ZOJgFfEa+A9gFUO3QNj4TcjbS0MTZqBaOpMjizlHWv30X
	1Hzs2aCptrMieT+maiakF/PQejmWeO9NE1s6xVTxziIxO5h2whENWWp+lFiad8Tnio52EZNK9mo
	bCWM8/XcPxx3ahQ07rSfKy/GpSQvUUAxCL295hClz0Dqyb3pWz4L/ijXuJM6jMWAm3ThNCx2GXM
	hCFIEOQ7qWiv9W4ozozlv/lVFKkic1SVy
X-Google-Smtp-Source: AGHT+IGYD0rC/aYIVmAXapkPflNDUng9xnrOy/PP1ovsYL3Pr4WT+utJBYAgP6x9+IrqYJvL1om8Hg==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133302166b.28.1750843096666;
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:02 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=829;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
 b=cfWhIW16u8AU3opUGXPjIMEz+f97knPAZaejc4RLCxX25LbhEo2hfOqSlizWFGlJWr1mlUCuK
 Lvms8zLfWujAlr9MWTSzk/YxpC+JHEZuQYOZF2Sbd/FZsDPal1KKBdI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with SM7635 SoCs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..c416f25c90d6d9f8404947d1fadef91cf664e666 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.50.0

