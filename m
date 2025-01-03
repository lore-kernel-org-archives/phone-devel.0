Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218E11F8F07
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902727; cv=none; b=bAGjx0Tg1gutkDlUygMvDg26qkhsXDE4jhkFHHldz/R5wlm0HqJACzrjPfxLIpzT5ZChD+1bAqru6DJhedy6b2nwMgQNG+AKOL1G/lzK++4gykQAenLb0KLsxxEi2sBc6ZiicGtg0aAR6UEk43Qs1G1wH1zn4ayUsjaBPjmd47U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902727; c=relaxed/simple;
	bh=k/+Dav64Dj1AsO7AF4e4/71hUuQR84tXM9wYoKmRizs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gtwv0Ia07XTtwvypv/+JYIoIMuYWqd1qwSiNOBTbrMpIlk+Fst007FC2af/RWIfdabqGLEOXPPHrFBnMH46m2lMYcB+hBE16vK90CbCoXJ3yqUd2SzO3oPIrQKDfS5QRL4tOdqk0ElszC0bwbw09rAqCqAT80QnsxyWb9Cix8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EuvVQut6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EuvVQut6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1900126966b.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902723; x=1736507523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=EuvVQut6OEwRSXzGBNQhIXLG3M1ppZ6s1hVyQTk58JE3023kiXQw1VEXUEKZBM+rDQ
         Wdwo2Wf5LGFXKmuxzo8RAqCBLarxFq+orjrQbPmjJMvlYDNeSg1fWTys2Q35M5gWuBgB
         FppIKw29pH6aXIszwt8QjEvA1zEc1cHfM1dc1OXGIYRm5lrkCqP11KeeVXCwQN1LAp8M
         m8HmMdF8Eym9cnxjlzZvLdyu6B6JMIOFoFsY1J1cjaJS9u7KECgqz6/VM2owcU1D7sB3
         NY+CcCgKKpSHwADMwBNLuMo9Iq4wUjbP83LzRKo0wtXtQD1W4o/cFiZK7Z5EwkzyRVqz
         dq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902723; x=1736507523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=c+yJH8wTS1/aZbg0CSBmIniaKbr5Tek9Pb3UOH61GhmF/Smt9BjJHPV1bR4E8+Vlg7
         WlN1tos16fYxFoB/vkGa75c9mPPm/Ar/UoMNDhi4itR2yw412dEdgPJwFcrME/VJe+X4
         m44lRtDT7y/k6CJQlXuXL1pyP4TYx8CZ5r6U4tiur06VGV5KW1xKLxYRXTQjSzk3x69W
         ptuvuSA5MEAZYBNBRXY2MiMI6Pswdy8Lw6W6zVUmHPT8ROrRB7adB2mpweRHIgE6QrTb
         nC3cPmjvYniJZxJbKyKK7+6SW88xjiHF97u6XASMjseEwa+hwuS4rE0YBF5TMmyB6tpi
         osQw==
X-Forwarded-Encrypted: i=1; AJvYcCVmzqWpG9aZSW8hYov2cyMmcfBpLN2DX13TSWF2ifEr0fquw5D79mP2J7OXidm7r5tMZVW1DItnwJ9XuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfB1/zsxSWUw8cV3msYk8FOuSL8r6EV4mapReZ2NXXvDiWR0I
	99UBFFYtE9WA9C2eRfptDdfohZP/n0udh4PURyjYsZwlB4xrq8GWLDM1hoDzo4U=
X-Gm-Gg: ASbGncukvGC8XSQpLguLciBtA8Gkcb8eZb7cDvxAnqzRjRfWHfXbKtRt28HerdXSz2N
	IfQZI74cGxjwwvi7fV3tJUpxvb2kY0raHS7mlXF0A2Lvar1DLOymKoTFCqGjWVyRt4Rum0sKyOu
	u0anSLZTVM/ME+wh4VHayK+aGCGkvzrLYe3yuDZWuLxn2q6+CMqfcyuMvuW3cG/dCZF355tZEQf
	TDAG07Wi04idWAfvDFggbxjAaPcD4MfW6nf4FRPb1ID0fNGFeYo1s9fFwA7AZccE0D5ZDZQrFKw
	3Wfb4RaRxRdxZvGmysUWrMLrVg==
X-Google-Smtp-Source: AGHT+IGxXhlOWbNK7IyXotx6Xt07xXCLWDYVJCz7UEJajTpXBFKX/Nmbz6mqm9dh5HVCwWU2AoE16w==
X-Received: by 2002:a17:907:c10:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aac2ad7fa23mr4318970566b.16.1735902723018;
        Fri, 03 Jan 2025 03:12:03 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:59 +0100
Subject: [PATCH 3/5] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C256C
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-3-88dee1b36f8e@fairphone.com>
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

Add the compatible for an 256Kb EEPROM from Puya.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index a2970c7c8f27600ad0d495a7e14875a3be611c03..c9e4afbdc44809c21fe4c073f1a2494e899dfe0f 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -138,6 +138,10 @@ properties:
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128
+      - items:
+          - enum:
+              - puya,p24c256c
+          - const: atmel,24c256
       - items:
           - const: microchip,24aa025e48
       - items:

-- 
2.47.1

