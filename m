Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB933996
	for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710334416; cv=none; b=tEZkdUff8/2QSP0wtiv4H0skOPIAeCStyieqeee23LUQeMcwYiYsTMpHcZJHGOUY+7uTGT+7ftRp7LSkYtBvN5omBX+e5Ukryxk9wFxpUomPNPs1hoizetEhfY/SMm8kLF9++35N96becstuUpHnJbEXWq+C33dQdLyOkJT6DmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710334416; c=relaxed/simple;
	bh=BOImlwNyoJ5AEVgrpwnc7YVwBPYRKZZ8fF2h/ivvZzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELkJQxc2tLvYV0EUfCgNg+Xo+yjz1DdYrRLlXcl8rtFt4hlXAvq1MWTbzOFDfdIq1TQTEQBhC4nKiWdaxsPG/rnKZJu5ngJ7COQqH1C3WdaiErNL0oVBG7GUZxmhewWejvUAzODBeRKnm7MKNlt8W5H+25G25Ydyqu618tqN+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hjylV/G4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hjylV/G4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a466381b411so45998966b.2
        for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710334412; x=1710939212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DpoAK2MGeShZaBJVW2zOw7CLQNlS0yCUw71mzlZTGE=;
        b=hjylV/G4OIdXDDBvC2h5l+/VhcxC8yAx7YqiMMxGKnoVWDym08k+EPFznaKFwvt7Rz
         RgwOwTbF/pkCEKQIs8AYBgEmYN1VJtI/bzPmzuQAMqRmTS0FYk3CG6JsvFrzAHzn7hLL
         jC68wyOu2rvPWDxeku0ExiuIAZghyB+r3dFOMLFOBzyzi9cBVdV0/8bYsZRqhfhdAcwW
         eqJ86eCaz/af/b/TkRVQgPpvLgC+C/8wV9ZSGdrWx3XGwPZj09+uIcQ5SQZoEcDklhMN
         9LOFbAep1yoZFsCnmzpLszyCggfQxzJPJL8xCFaoD0cPnHH7ZQju+8hCAgXMg/nNz7OO
         X7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710334412; x=1710939212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DpoAK2MGeShZaBJVW2zOw7CLQNlS0yCUw71mzlZTGE=;
        b=ZQdC/oUQQsdMQxXRPjBqttHIr9DZOhuAtXofJzAHMvzJuyTfOchIk2IDM1pWtqkDvK
         4A19JjkPULrbpHM4aOvqnXf0YpcNHT7YZFV/99ds2XRQV65w7aBW3TyeRqHZC+muolHI
         tTlRIoL46VIvWA13MM7fnJwRv3MKs+VTwmQ8FTmgQiJ3Hs1ajoOXjX2ugDVFxISF4yOg
         Zvi515xT3h2x94v1MSZlQqqqNpEsfqLqAoHazDL+cZd0lEOdHfIdFMEXHr4jlIW8nIMo
         h+YZlMNye1i5ZccYS7tp2aI8jweKtQp35LK09bp0gm2Z8e0vNndUR1W7ZDHSgys7ttoJ
         L0pw==
X-Forwarded-Encrypted: i=1; AJvYcCUpPOs/TZYExiX+EjgOXhTi9NLUlKSdMzeIJE40FthYwe/ztoqJiaPqp8iIMo2iYpoFao6JVsWYH8QsrsCLE47JxLKUcfQUNH2u3vo=
X-Gm-Message-State: AOJu0Yx7JYKULq1N4T3wJI0KBRiilog1n5rRb+EZqaCmKtv95DsNG8PV
	oHYV3SMRmfCIKxZ05mSS3ZQ+LPaSXlR/gw9BOtQsh8GgxQ1sP0EyMLnQ6qRuZHMIhqBoGahcZal
	x
X-Google-Smtp-Source: AGHT+IH/ps6t/lLUvOvsCHVMhjD0YxuS/qxxMdP+Nb8up7OIPs1mUG4mhDYnh4qFngYrG9bTsOwtLQ==
X-Received: by 2002:a17:906:c147:b0:a46:1d4b:d81 with SMTP id dp7-20020a170906c14700b00a461d4b0d81mr7264249ejc.62.1710334412318;
        Wed, 13 Mar 2024 05:53:32 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170906e95600b00a4623030893sm3249098ejb.126.2024.03.13.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 05:53:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 13 Mar 2024 13:53:14 +0100
Subject: [PATCH 1/2] dt-bindings: crypto: ice: Document sc7280 inline
 crypto engine
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-sc7280-ice-v1-1-3fa089fb7a27@fairphone.com>
References: <20240313-sc7280-ice-v1-0-3fa089fb7a27@fairphone.com>
In-Reply-To: <20240313-sc7280-ice-v1-0-3fa089fb7a27@fairphone.com>
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

Document the compatible used for the inline crypto engine found on
SC7280.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 09e43157cc71..a43527fb2ceb 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,sa8775p-inline-crypto-engine
+          - qcom,sc7280-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.44.0

