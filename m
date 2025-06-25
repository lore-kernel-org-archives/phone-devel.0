Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F12BDC30
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842909; cv=none; b=YjuOlsQ/v2rKtoOgMnxT+C6c57ZcY6Z8nhmiXm75VVnPrUDYYcy+vUxmL6wFFKjQsauvxKrh29LxEXxYimgOZdCQHxmlDGYBLRmyeXGpOpVBoYyxga5/wc0hHQiWyBIUxwygIiQ3rGg8Mez1yo7peCuv6gxZ17tLGktLU4znSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842909; c=relaxed/simple;
	bh=9GiaZ2p/nxP//ytqx6Na68602XUJeae7knZz2N0Hquo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQv6++HF5GcfefDzqZKQLOKxfkGyuJhan24PMF+IBuJ4Mi1lwt7fHojMs0TIfw2xUOMlilplj/r/cjuq1uDJNLomq1kHmKtGkuHBYwaKvHwN68ME7SmXKS7t1k2gSZQzw9tziMuF2GlHyJjO9gZQK9AnjJ8VnZ9Ia01tX0KWomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QF0rBibs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QF0rBibs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so980506466b.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842906; x=1751447706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAzlUWY2EqvaD05NI5pov78EMSJ4+ZBWhP35Qs35mcY=;
        b=QF0rBibsJUxWvNxlZloxVVGmOhSfA+p5wDTpTowR36aa7k9qmR44ocil47QiutAWsP
         DX81zXZ/iDvj0HW2UCxV0kSQnpdSkKkLycUJ1KxHBdQ5JTGl0KRQ6q/aWwdVN8MXbB44
         F5vD3AIWXEpKbQLRzWT3rFGeL2iAobPrfc4CbS9u0S9h2zWl0uyK/AO0iIxLU/4IH8xG
         17TFNZaJTaN9+biv9+72/z6AvwB6Jy1AnymdXSTBhmZQBeK4+MzKYY2n6NEseECRszHc
         /a60F3PuVVjSkj+bWnJ39wttOV2Z3UJ2Cz9cgFXBmJ9tux7eIIHicQaXzMBiHs4MG6xn
         ltCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842906; x=1751447706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAzlUWY2EqvaD05NI5pov78EMSJ4+ZBWhP35Qs35mcY=;
        b=SsEiiZNMMNOKHSm2ozu4BUoK30RaeBDJpoMlWHrIsx3fgaLPapPyo1rZWWUTah8ZzP
         THzQ9r1K0HO7ORPECQCnIooBIlf/xXTAEtnYTnrl2MPfF74n9S4vQ7G3fAJT56c/iVZR
         ndvva930zHF4ApyUepKxPFUoHh7UMySEy2toVuoVMwxt8CNsBj7LIoY+aFVSlIIb5ZCM
         XCOSZUjjhqEq6uz9aXLze9q9OqcPN7Shl54DUwwsv8CXFh1XN0Ct9bKxrZnZ4F/ZH2qN
         YiQuKfKdYnMOSKfM1MqbjfFZ3SJGobLelZQnusPNzQJ57Q+o5wqQWlIV4r8WyI3DnKjZ
         fjRA==
X-Forwarded-Encrypted: i=1; AJvYcCXH4V7RUY9kKl4v2BLmUfrtTbT/r0PuTYPBG/5fP7uI/BOi5uhZyiQFO9eeE8jtMD2oQuc9WzJpxGH74Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwigxiErYJoDmsxMjrNZD+VBhg6Zn5b/reWJ5XOu/ZdbLWmYWzL
	rpmIdWfWlTJueBm59+qu8MfgcQqSNGj6Bbn7SP7bQrWj+Raal8+GbtFzkTGzcmKgyps=
X-Gm-Gg: ASbGncsOR/wlUfupVwcCSILMJSclaJKwaUPYOvjE4547Xwyqp5yWnQkwiSRScn3nEb2
	3h0BNRiJ1Cvox4SJkhL4qG/QOSHXmZHnafDGzLL/FJtH2gbefNDKjo0xVpXdLp1GskDih9V0WfZ
	EXplJr5QzUeTKm2xP2drCNkKS3tfZOp9GObZeG9a2ABklN5rfDPRsmrEyU2bZ9XoZJR9lIGz9/S
	BzYawSb2EP9oqTDcI60cLfm6BSh9L3/P5gytXsyeBKksEEhGeHb8FLNxxHTwWJrZ25DRl7IP705
	MMGWMiv+Nk4vR80qDK/J+k35wsNyOxvuRXP/uz2jgQcES+MbbQbymZyUMmucILKYvc0d6Kuwwke
	/ZXTdNlX9xonkNZV4OY3lAhqqsVfRmo1x
X-Google-Smtp-Source: AGHT+IHfcb1R/5G1p1D1Z8iqejyo/Aq/XvPrfI1iFMiH4aK59J/B9AcF8vW1nRksr4D+XAcktFDzpA==
X-Received: by 2002:a17:907:d29:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-ae0beaba4aemr215314466b.41.1750842905839;
        Wed, 25 Jun 2025 02:15:05 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:56 +0200
Subject: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Document
 qcom,tune-res-fsdif
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=988;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9GiaZ2p/nxP//ytqx6Na68602XUJeae7knZz2N0Hquo=;
 b=sZOd6X/TTKsIXlQi1c49HslZ89NGfRuZaXpOsS2usgmdvQDgC8Ef8q5d5SXdJbjhaG1+NGSM4
 E6Ygjl8H9IFCR/3SZaedBtkip9bwaE0PYLi08jVFwrmWLgDWEbiKmun
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the FS Differential TX Output Resistance Tuning value found on
the eUSB2 repeater on Qualcomm PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e2992735998063b3ca390e04a03930d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -52,6 +52,12 @@ properties:
     minimum: 0
     maximum: 7
 
+  qcom,tune-res-fsdif:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: FS Differential TX Output Resistance Tuning
+    minimum: 0
+    maximum: 7
+
 required:
   - compatible
   - reg

-- 
2.50.0

