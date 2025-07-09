Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0632D29B7
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060161; cv=none; b=pmBPH3JSoLWvmp4h9ry1YWkRo+PCXE2bV/KMJSWJ1/nJrxMRB8gFrDT2iWQBgA8YScRPcFxPQXmkSGHmN1DmN1trFzEKUCwjTRzfw2D3nS60IOEpvG0VD4IdM8xMa2xz0XQ/TMc0hAiV5HPoCdrgriukF3YVCVBQQbWj7HWaQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060161; c=relaxed/simple;
	bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XokcpilecHvI8Y5DX24KzSBnUCXeLagHDeBiW1NutK8DIdQtcelgMppBVpFylM2ytuQHI9o2+XkaqSQc+E9aB1LAF23Elgx1BFTLzrXyCQvqTGkC5uuNNnUpTdYv0jqMl05mIIupFLBeY2Wsq8En1sxMfPvi4YB3iTzNfN2/kP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=04dw6U7E; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="04dw6U7E"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adfb562266cso868906966b.0
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060158; x=1752664958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=04dw6U7Ek5LafvOGTqY0m78dHoV9wA1VGICE/nKznHED4BeJFMVmQLtrFoWgCleQgf
         7/VWIGFQsDy6+fVmn4nxdXklMjHnon6xqNc1A5nah/broM73B957q0XCooLAmkQ6bE28
         2DzHmqba0pGXDRNFRhUotZ8SvB0EK8QUfHyMfEAqkyMevdr+FaJJUXzp1fEDKLrie0ch
         QxK4WJj+lBVpS1MAoWSIHF4mwX5MlgcZRKKCn9GDacyzHg4b8b9TvG17aNTSl5t7kngZ
         5O2xf9Em9fBDcHyNuhu/3bseXRrnvxlvSMSMpAKchsECGyi5LY0wIRgXvMz8Xmv2S5hg
         xcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060158; x=1752664958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=d9uVE5fPBmzQ0NdNWiQ0SprxwNfcpnMjkoLaAQUZFgE3/+ADc/hpRNm90lhUenbAT+
         +Gp7zZYJbXaqN2NjRd0CBGeWKb2HWNZ1ulFhw1Vwj6iweXrWhe3bMfqbbI6sjdKeOXjx
         Dr7zcU8VwGZsciqjfZKnOTYQwjsmJ1cqFzsEqp4HjqNyrX82K7rNtDkeS2N5OyDsSf7N
         LGPAqq8RZMUf0r5v0WZYLng1Q6/khJwFJcImLYp08/xWCxL9ofXZue9MRK+7fbwMW6vo
         S9bmdN5+dRDCvTgz0QyCXcgYs1s3hZy+WCd80Nkod6lFAIfZ98kRZj1yv5pWDcbWnZ2z
         miYg==
X-Forwarded-Encrypted: i=1; AJvYcCUyhDkXStDMwmHmSAGcdRL4my3AJmwVv8T+5S3aIhQfhyo75QU7AgkgbjLMQ2NoS8jbV8e0ZPDYCrn5eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/yv0NlcH+yW0y0Qq27HeEsIMntIVeLvV06y9LEN7a2+Y4i2et
	EzRDbQpamJrga/xdJiLoPMFRAo83stSXLEnb5Y88HRb0InkiPM1ihddv8wlgEQxWJuI=
X-Gm-Gg: ASbGncsh19lqGNtd75BSbBsJmaOAHBR8llRkhsQ651UIWLoFCIHtpCfkZqewkWaSiIh
	npxr3CCFsn6Rp0gLdvBZvHN/sJ0ng3hq34cGTOc/EJta/5KKyTq8qmi2nc9dlKCoGPaJZb85Ib8
	nFx0fRBzY6XlyFGO7Bijy6HYZDHZwPESE15v43ismfyTXaG1x8DrMA3GkzTkdWZUJ5Hz/VX5kV6
	By8GBmXRLi6BmFVTfZsiUjDFPT73envi1fFJakjZ+bamLcHGRAA6HgMCDTPtBKrYitLNOaEFZ/S
	1NazXCZcT0L1SfcyDMeLAlLz9QAb1OKIxvkurlgZRNX4GWYjQo37qvWYAxj25grAYWevlW0DE7F
	1yS75LMecCuTlr7Wl72cvwj4Z6OMOqiNk
X-Google-Smtp-Source: AGHT+IH9vnwKDQS5PWwwot23KnBBMguALefUJ1bpdte4R5ZQwSrr0oNdJ1eGm7MuBqcVRYX5nvBBlQ==
X-Received: by 2002:a17:907:7e89:b0:ae6:abe9:8cbc with SMTP id a640c23a62f3a-ae6cf58d2b7mr206062666b.12.1752060157745;
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:26 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-1-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
 b=Otrw6GqfkCGtNrkH58EJ4GUrammLwH2oknPOBewjtua7t9KC5rGMlkhlpPhzPUwHFelgxeMT3
 +qMFSSdu4mSD2v5n3Q0vKlNgtFDFVb2k3tYJ5KIh+u+xDXf114lit1D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

