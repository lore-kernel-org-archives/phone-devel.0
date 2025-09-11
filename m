Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90008322763
	for <phone-devel@vger.kernel.org>; Thu, 11 Sep 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594633; cv=none; b=ow4USWFhbTZ0jujnr/w4bmQ8z4xuWFs63S9CwMUGlNuOSEDYB9/bc6vGktZXUHaq6ChAvSrVRSek2TcvE8K5mPAFwghIY1E0vf7Qz7qsw9DGdCj7z3S4+Jgnwga+yZy5EV2MsSjOMYgYfqo6T3jF5YHhWb+gwL7E1T89WvXgcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594633; c=relaxed/simple;
	bh=a+1IafQzMkRqd9Hy7+2ryDB7W6wFRG7cDp4dZjBJvkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7og/GWH5VVb2EOWINSlFZGDxnoVo8a5RmeZijoHKBcvnVxQhaM6Jfu7oYxetLZ6UMyfG+fKVpL24h3Ke9Sp3HJcpplOCpDXxYbXoB5sKJHMBsSIFElkDXjoO6ASikx5WmR/c7LHiXA3NqJhS8R5U0y261yRYMbcFVA3RIc0GoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM1A9Ec6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM1A9Ec6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso4563245e9.2
        for <phone-devel@vger.kernel.org>; Thu, 11 Sep 2025 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757594630; x=1758199430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoN8KhslkXmRFB53xJxTZys7BqlERNC+NzX0ipuiFjA=;
        b=XM1A9Ec63PIL6dD/4D84TuFrAs1yt7BbgsD9kQGQpLf9tve9uBlsTcOOhMiyufDtkC
         +SCZCAYRbQunKnm8I92kPkmlZ/3aaDTE4QomeQw32b+XCy2U0tGL6kIv+JHS+K/hFM3X
         TEQ64ZP4yo/NZuIrGAYtt8PZ/FgnTaQR50j3h21oFITAwMhTmKr03QOV6lh8Lw2rbVx4
         MBkURDx6eT6LuyWCL+9UYJXFFXTMgpii/hsiz3Asss8BT+L14KcQeFsQqk9Xkl8FS5+y
         MlYI63r/k9TLP+zWw+HG7RKxRVHmf+lUrWmaulbSPyRaxuRi2o/tAAH1k0XfMdYR5V2W
         ULMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757594630; x=1758199430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoN8KhslkXmRFB53xJxTZys7BqlERNC+NzX0ipuiFjA=;
        b=ewjNv7adlpXPHWjzYZdpovR5uP6QLCYSfRU4eWmvdZK3VatZDIt3lRzNjkS9gIOQDx
         TroLg6zX8w1ldwRRTufprlvHq5MXLWvZdZ3Bvx8WehwfD1fDsG1NaX7FOvR/xii1jEqO
         boB29YU5oFFNk8frAM45h46ZFLWeowALhvncRyWNCkhTdSaM0Xi+VxUIutX+yXxkOfFQ
         8AKUYyvnxMW3E0RlS1M2imYVcqO37tw8Nx4vzKUW6J+KLIAknawnVSA/POPqD+/QPso3
         VKENvhuZN1GahoqU05oSUPHy9EI6bVtTegfK2hGik3t75ad7Q7iXLH0tyaGwuV35R2rf
         JRmw==
X-Forwarded-Encrypted: i=1; AJvYcCWDK9LQsGIXf5Bx8FQ/cRPqm6dXBsXxfYcagDhBvXLU4Cfn2PZX020Afpe8EplPNYAeO03jRRyIO/eDyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVK6eu2msHnmOO753IKWU66QGKxmRYmUnGsFns/sCdB+TxqAK
	d8OFyqGMxGKMOG9jPzX86/3yFJi8f4oDPTHcAN4VyyiH2EoAQSlggGXx
X-Gm-Gg: ASbGncue+4BIlHWwzUjrJgubghx3QK1q3O35SfTRw0mFXPBAPnqvtxQXB8vcl5mvp28
	B/LFyYlIzfpQjDCe+s1ekZg4emmcqbBxyiUR/Cz7BpIDK+Ap/w3GusUni2bZpr6WzLa56q/n4WD
	rR9xTiV0WQSWOst8u+7Wc+7/hInMW4g+A3l+gIzd/SRLpCDf07Pvy49P6seqsfCEsyzZXC3dcaK
	vHhQtrMv8inzO3Cr+qowb3GQAhrGQ+kTLzqyi7n3v0qsq0hyMo/JDCu1CPp7LJSWnfwhgGuzMOW
	qIoKcQuY4B/1m02SDHSgnb+8AY3oUkxk67y37TtXMRlaB/I8lkN+/2I1iPkxTn86qkfpvAQFTRM
	bi2F6n5w4v0p4b7p7EncvZ/5EZ+5sBAiCUrKuTztMpD5f3Bng2klg4VvjUBnbg9zaVVKLK7JEV6
	oZ
X-Google-Smtp-Source: AGHT+IGe1XpReT0Pizyuk+QKSriouplCWFhyveLmKS0j9Z8nPLjbNJUdn7tPUVc9o8qqTN1eAfqofQ==
X-Received: by 2002:a05:600c:3b1a:b0:45b:9291:320d with SMTP id 5b1f17b1804b1-45ddded3454mr190632425e9.31.1757594629743;
        Thu, 11 Sep 2025 05:43:49 -0700 (PDT)
Received: from Radijator.localdomain (93-143-13-188.adsl.net.t-com.hr. [93.143.13.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm22591495e9.6.2025.09.11.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:43:49 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 11 Sep 2025 14:43:44 +0200
Subject: [PATCH v4 1/3] dt-bindings: mfd: 88pm886: Add #io-channel-cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250911-88pm886-gpadc-v4-1-60452710d3a0@dujemihanovic.xyz>
References: <20250911-88pm886-gpadc-v4-0-60452710d3a0@dujemihanovic.xyz>
In-Reply-To: <20250911-88pm886-gpadc-v4-0-60452710d3a0@dujemihanovic.xyz>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Karel Balej <balejk@matfyz.cz>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=8lO4nr828tWQwLxmjjV752k5xLRe27/oDan4m5yXVVA=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmHjjA+mxQe8XOnYVTbmVm3Gx2atTRdJabx75wyq3Zf6
 aVbtmzzOkpZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiB00YGd48eV8Wb/rMZhvX
 7OxNz3zvl31c9OLnza+ZZaYe2tIWLd8YGT5wprVvncL8rHe6ZNFE1fLQGbG54esFlARtBF83uCz
 ZzwgA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add an #io-channel-cells property to the Marvell 88PM886 PMIC binding to
allow referencing the IO channels exposed by its GPADC.

Acked-by: Karel Balej <balejk@matfyz.cz> # for the PMIC
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v3:
- Update trailers

v2:
- New patch
---
 Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
index d6a71c912b76f7d24787d346d4b4cd51919b1cf6..92a72a99fd790805e775727e39d457608fa1795d 100644
--- a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
+++ b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
@@ -35,6 +35,9 @@ properties:
         description: LDO or buck regulator.
         unevaluatedProperties: false
 
+  '#io-channel-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
         reg = <0x30>;
         interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-parent = <&gic>;
+        #io-channel-cells = <1>;
         wakeup-source;
 
         regulators {

-- 
2.51.0

