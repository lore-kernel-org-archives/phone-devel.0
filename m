Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11501FA272
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219159; cv=none; b=FwwttO0NEl25gmsraCnWKmEllge16hCnnGLh/hpOh7W6IzmJmTmkQzroQrucP3CqNPPpFg6tYbJqlMO9QcMDlcN7hMDV8wxf/cQ7okomn5g3sNlua7yc/R132hFM2yTJ8GkyCGHtglW+2NvMw5G9tbcHodi4rmSAIZ+lfS39chY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219159; c=relaxed/simple;
	bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFgrHZvq2gF7sF+60g47tmskDKnCFWblri3lucbTHyDrbCnqGC9fXsC4PJSrau5s6FT9fMUCAwojAVVPOXQ6CA03gBhcE/8bnIFv4Oiq2IFZtpaZ909DJ3kK2wd0YISMCGPfZ7fWCVV+C4vMxkSNeGcJ3HAjB+CPaxjzCPOUQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=k7h6MOsa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="k7h6MOsa"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so57197666b.1
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219155; x=1761823955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=k7h6MOsaOMD202hiBcaDQ0SqMtcXCNh/RCsUmN6q486K68eJwO7MJYW2g3+kBVktMj
         +mntqtWE8o7/tdXODOJW/OT317Z8ZJer1lqkZ74ke3FOWEmGUaGFo3403vFQDccmplCK
         /ZF2Z0z+LoJkFD9HxtVenwX37MShXoqH0UvxsAktcoejIkmQqsOyBNHsLgHWX2DWEiZz
         OFl3ogWByE1XBjVFtdzDU/XzoYCiXCGCS+RBKG7nYrK+TaqxdEEyEFGPHyUlnTMbam+i
         bgqk+DWQol8yjcTor+JQ16wUQnKH4lahhg/w4uT6aHNZoAecipohogGMKW7uu4r7UPOX
         nAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219155; x=1761823955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=pKc2GZwLl4ex2+hC4C3e1yj4TmikncPaNqVWW5mBjcRUITEsopO3n0RN5RxA8vtArP
         uCtgRykRwWHCBEkLee+w3h76PDd28Twn3u73gZU3klwtaCoy91oL0d50UuFOCStmqQ1m
         C1zDE83UOs6uY6+NwZWRAPoH1DvE76oKxNMTUHpc6CUjYWa+etKZRVuFYGEcXPiJ3OxJ
         B+Euq+thkunXvtUw/IS/v3aYAUpSM0uTr8taUk4jQ4KG5S/EOIa6nv6ueaMazgTyoHJe
         qBAOKs6eIyi9IT2OmsQYPXWilw7lnKoFtwfeqyp+8bwdVJO1z2nFTlmK38XX9MMtuuo0
         MC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9hcfbJMWA2o2rJ7N4NBcrc+QgI2phGYjUa9+ljlu7MX1x52d5H9XpnX7AHKxJ9HB2CNkiu1KEo8BRtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlATWuW5qGZmrDGP0tMlZO34l+UVmj8OlWDeJzqq/CZxxO5xu
	TgZ6iqZTMJQCDiFONKG3iJ/nM12KcXi09FZAfhTSZ9DBaotuR9tIDJeg35EPxN2GsBY=
X-Gm-Gg: ASbGncv/InPajJZ9kPBSNsX4W9R5nawFTyL1NPvbAFs+RwQCUm3CoPWlR0I04ay0lbC
	PY4Ey22LWVzyIcSKk8FxAmpRXIwfa9EIECZ/++PxSlsT9wgLArJZqq0nH8inxlR6DzHTHUfskXm
	Y6x45s1/CKlPCthcq2JXYY4xJ26pTy/Sy1GA2TQ+h4lT6yMlU24oyDZ0NB7GRmSqfOOlQMtK1Qi
	Tnh9aVEJi2fQRRDo8kTQ2vyy9F6fczNIkdAvQqqReBv9NK+8He6JIWZDdeEmEYtsYNXnhjQ1yKv
	WoO4isI9UbyLRwaxPK8k74w52VEa8u+DkJfhROsvHIIU9eGSOhPOk/ha/TVFqXm6RkVvwhi6qKv
	P1DpBLrq5vNZ2pVWglFMl0SIBxHN1UjrnEtRuKdOG19C9XzJuCZOWE872KgcmbhZWRsfr/P55KF
	XX6WDGKjlxYuphc9ALxC2IiQS7lZUoY1yYmou33qnxeucAX0SxVbiwXBzY
X-Google-Smtp-Source: AGHT+IGyvy+vosOGhAVyW26FRy5VuLmJAby6oQyCi95CiOh6ji/6s6+Drjmz7GBaGHKaPJ1tX6zb6A==
X-Received: by 2002:a17:906:fe09:b0:b46:57fd:8443 with SMTP id a640c23a62f3a-b6d2c780045mr842584766b.24.1761219155404;
        Thu, 23 Oct 2025 04:32:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:25 +0200
Subject: [PATCH v3 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=888;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
 b=j89EwbY2JAhGXJpHxxGsH6u2oxbgZtWs6paN5vbiIuiZHuJEhqK/8I5HYQqEYX6szI52SCm3Y
 Da0QHu8QSSpD5Ppa/++qNNAHGINmzpw9AJwY/tzlF50tZIr7ncN9jqB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PM7550 Torch and Flash LED controller.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57e..05250aefd385 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,pm6150l-flash-led
           - qcom,pm660l-flash-led
+          - qcom,pm7550-flash-led
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led

-- 
2.51.1

