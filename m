Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D627702
	for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710334415; cv=none; b=DyEzi4QXkMB1Yy/yB3N8RhnMOOcKwojn3CDKsaiSjMszU2zTjJ2Sn5TW5NfCXtFWx2xwR+ljHD+l/b9P4pwp/To55xPOW/wMb0nP2eMexRocaR1+EX6n/sA4AGjPpGEYySlKsZqrSUWNCBEti46sFMIsgyfyPloTcO/ZJJsRUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710334415; c=relaxed/simple;
	bh=YMw6FXUUv+blIKXVMARtF/BZiC35J4VjJ2wII6LwQ1Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n0Y+95Jh2N8iRiip8qhNsWvecF4z1vu9Rld+mWK73WWBV+8x6t8hWaWfi3of28HP+9OFZfHEfJHL2K+UNLokpWh/eP2XdNf4XpVf6UN7jeqfg0Mm/Rj2X9evV399vghJvRgzY14VK3lvhOvKiQeS5j+SzWddn7sYDFjSgSsxmEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xR3PO07V; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xR3PO07V"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5686677bda1so1569559a12.0
        for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710334411; x=1710939211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8ViWIka8v0fvl6fi9rfxOWkjF5zhtO+EwXsSRYTTAY=;
        b=xR3PO07VvOpLlimM9PTTDU7rpOilBc8WtFa9zUgljEfKdKCREtGrDKzeR8Hr/AcY+k
         6ap/ULQofv4LclBv5x0KyOIs5xwlg4bz7+6ES7i2D6Qpkb4N/ik2R/12Bea9A1onc1MG
         YmNXf8+mxrrHL8o69rg+U+8HEk+anazBwrupS58jM7jwkaIeQRaZ0q8nTZlnhOvd0lDR
         0aOP+1aT0v+v4OyD6d4Rr2K+1fFfn+Zqv1U8+SXR6HNf8jEg+HA/H3juxojlGFg290sU
         HBuygBjlPa+ygtVEUnQSxtZGLUwWaAfvZNkhqAPaEhOksivOKrWX1tdgDopecT1tvatR
         NvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710334411; x=1710939211;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8ViWIka8v0fvl6fi9rfxOWkjF5zhtO+EwXsSRYTTAY=;
        b=vrHPFGp7M6iJUstFGklQExveGyQpgMqaLcc7V95DyVNX3pI8N8bCXsOTrD8pPMjhW1
         4/5/1IXgW3+DiErTh/cQwe0junZU/83vIdsAVDCJWAZRPWNZE1uf5CVzjF+UEOIfsdVC
         K/rKmpNpIw7NcnLxeul/ydZ1EmqVT6oMfPeQeczMhJCWEFsGK69l5ZW44LNaIuG5G8lA
         1fZHNR7E1wINHICLrxP4BtwC7hkXKjYB3ktBDkUtnYKCbgMV0XFjmPhYkx7aqfBXnTEA
         wVAqe19i/taAVt4sGoSrQvwV9zsaYJH2WPdfh9aVERM+f3aSJR3zxl3i14XRiXUta5so
         BNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm/mT/tFvpIomtbFDOw/GMaOUAoxFs4mu1JoO/18SifItWEGJ8rV7AmxDGa8dw7ddgVFcbHdcGWZc6dDQArFH8+SqR59umE5QOdKY=
X-Gm-Message-State: AOJu0Yy+CsFlXJbMhrr2Vgg0YaO0e0vwtR52qDUv/yv6+Ty/ISQOqbSa
	eevJgALF83wMxy0zRL2CMZhjZd6fPeXBCN0/CTSWatP4/76L1+AQSjlWjklYs0ZBTClqHI8QKKU
	m
X-Google-Smtp-Source: AGHT+IEARlJFryEqeY6MQ0xjILbFvD8WfbU2PPjwCmUkH81u0Z36qkT5RKRMbiaOFmE/vvt1bS6N5A==
X-Received: by 2002:a17:907:cb87:b0:a46:13d3:e5e6 with SMTP id un7-20020a170907cb8700b00a4613d3e5e6mr2421588ejc.0.1710334411048;
        Wed, 13 Mar 2024 05:53:31 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170906e95600b00a4623030893sm3249098ejb.126.2024.03.13.05.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 05:53:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add Inline Crypto Engine for SC7280 UFS
Date: Wed, 13 Mar 2024 13:53:13 +0100
Message-Id: <20240313-sc7280-ice-v1-0-3fa089fb7a27@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmh8WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDIwML3eJkcyMLA93M5FTdRFNTAzMjs6S0ZANLJaCGgqLUtMwKsGHRsbW
 1AFIEwhpcAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the required bits to support Inline Crypto Engine on SC7280 SoC with
UFS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: crypto: ice: Document sc7280 inline crypto engine
      arm64: dts: qcom: sc7280: Add inline crypto engine

 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi                             | 9 +++++++++
 2 files changed, 10 insertions(+)
---
base-commit: 5f19977109ce685937fee9feea9b807599dfc925
change-id: 20231208-sc7280-ice-a550626bfc09

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

