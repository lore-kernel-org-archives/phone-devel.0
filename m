Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE629E105
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842884; cv=none; b=KMnrmFmHOBUJAr4Lumg4q0apLitkw3RDAfIupyrW5q2anyASC/ZAcDaAbXkgL7vUx+uw30YcFjlMo1OsKdmfNLYp9KztTaVYF1rtVKA7bK1oscQZumuYoUWq+Vh88rxFysdXXVq3XALK/Q+DpIrnxDhJ9Ld12JQ9qKxHYWI53pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842884; c=relaxed/simple;
	bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWcWE8WTd0968nSOZ/ZAgpwixEVm4BWAocAMfeyy2bm+HudLwM30w6Q6ZVjAl/wj6X+qJjnYBfgf1Gc43/mYFrmvSneJMTlf/5uLs+gFeyNtn56ysd6eCvKV/6Q+8zWue2wkRVc6LEvWmvbDHKtnv3W3/RyVJ/rp8GUfazXvKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1GjBIvz3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1GjBIvz3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso2613333a12.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842881; x=1751447681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=1GjBIvz36b1r+IthEhw8y67JdzzAB9NTRvfVnbimVWoJelvUV7/9GcBb1tIGAbsxvB
         TnqrQYRZOfNGqpwmiSRSOnJefcmVH/YPy1Nk748GZY8s1U8Q5ESdFR5VT1Gyt7MenqjO
         knhfiP1W/PogDdJG9MQn+Uo1kK/MtkXX+oaXbFu0HoEab+PSQqDN4JpruzTEMfBPHgDK
         CJ7+ZFOKl1gc5m4RNFUfEHG7LEaK9CRq46Ew666CpwPakB+fQ6s1tVP1bjXnDwBPA86/
         2rtmVAt3dLpskSGFrAFi7BlLBpPmVzldClCsYiIwDvk1eLSx2qCGQy3BwSLYOgcBBJsd
         CzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842881; x=1751447681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=Xlyhrh2f8ZfF4mV1pWjmOCsnb8bVWR4xaxzf74KtiRbOpE/nDJwhL4Zf5wwfepZl7S
         Gifgn3/pjTMj/PNVVqwMqr/RZ16X5C2Hmx6wE2Tkv4YxOduEskCe0KW3/SkDDdckexgF
         tg5WwAdL2ShLYNfZyxjO9NRVzKKu4867Jhzvxl3mJfYdBiSyITRz/n6mnvEGfw8EjuiO
         PDyWkaESdJnlsFQXjuN7LXYv+5d8iuUsUOCugo/mWQJSak+ptrK4rkhTzuLya/B/xYvF
         MZGFSqGAftajjwSMgUxxNwDXhIwfkG/Mz4oraChACH9ug7CzS7D3MyANYdzpY/IeSB4S
         X2GA==
X-Forwarded-Encrypted: i=1; AJvYcCXZTPu08CvTOwSiK6x2jPr26fqoEwwgDzvNo85vEKSqQVim0JBIQinMrZExSa7zcjLKehAogNTBahvVmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5BxBIShf8e9kaadKatkkTiODbL/R4t/PbPlLGLDFq2RcbrKz
	4iT1Ut5RPOezHHBXil9o44NMxFoQwsns00hCwK0jpvPsl06/bWp0MZGIyI7re7XrgerKk99hHad
	7WwAM
X-Gm-Gg: ASbGncub8Z25PLpTAbteSkzWdHZ6WIN/miUnBUj4Ym4Wzm/gAWSIRhlqROq71niADHa
	XTfOCceSueAd6hEH6TQQoMxU19IH9CB47F7ZI4DBOak/pFy5kpb3c0PAMxKD5h7lwIqePwsqf07
	izATXqqN4X4VeHRsxIcn7aLb8Wv3FnyNfYHXrozj70+OBy4NwQbfevUhTGsgEIzB+CUAn3vFpAc
	MOPZexTattPkxb5JzXJQO3j/dIxFBXQDzGkOJhURjgQVKeeY45W/7hAy408HYFaSlBN167B8A98
	riAMWZeUVfU05tY/ctuLsUiwt8qVt/V5pJo8k1bPLyfWaZV6WENUxX9pUykJYgKBgQF1zXB08oD
	THsbo0+iQtEFfhDm0g451jMo1JG1WuCiI
X-Google-Smtp-Source: AGHT+IFunGF+TjIwhPwj7Rlya0zRP0lHBHlNUL1mjavzGDv/ErrwypExO8gGDjyrAhjbat4NdQqScg==
X-Received: by 2002:a17:907:94cf:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0befdd107mr232454866b.3.1750842880971;
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:30 +0200
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2: document the SM7635
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-2-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
 b=pP28XPa6bi+AGmir1JGO84WkB42ZjM3elJtM0fuLH4V4x+sBvSLyjs+iDvGCt1Ejj0fMGiu/F
 6MUAWaZpQkqAycz3ZyI0H9Xi+Fgd3En7swav7XUkjWFIENM9Kb6pWsQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the SM7635 Platform by using the
SM8550 as fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..478d6e315a4f19d624af28710eed676bbaa144e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm7635-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy

-- 
2.50.0

