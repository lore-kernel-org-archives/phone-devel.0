Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97727511F
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564595; cv=none; b=S8UiP3fg0CvF1kdHH/GP8PU9OhJel86AJzA8nylQ3eH3XmuIsNRNk6bdJivx4qsRRFVJJXp0BnhsvhL3X7wFqWtXgVm/bcPX23iMJHp9BePfiHRpidHx3wVjw15r/RlGj+5RrPklsyCXAjxC1vu7YBeB1ZhmrgHMXtrlaGx7f6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564595; c=relaxed/simple;
	bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvnvTe6LGr5l80ZoAi7URCmVb+PJ4hpheYKCs+quea60/bOCA1yd2pk+/COROwliE3PAwBN2jsjhzncynPnDFOlnFZQpBPobOKdWGC0wLFlg5BeXh1nGL6Ab4dn0x953DtpMMdwACU1aZJ3g4ACF9Uais2rISW26tfJDJZCbYLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HWZeGdzj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HWZeGdzj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45348bff79fso58963545e9.2
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564591; x=1753169391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=HWZeGdzjEP6z/zZ/zZ0zN7CgG+V5fDdH4Er1xbz2at5VND1oTbX1O3xccHakadwNFI
         LuKzK9nlz+nY5rqu3VQqvLhFtXIWYL099fW/uZmqp9sPl1DvSHegGpEHWOMrW0Md5mC/
         L63Baz/ga26jIsutisM8qUEzgIWsc0kGBbylaxzd1BcHyCF7GXh9CfKkKve69paktVMg
         WtE9u9s0xSGn7OsSe77AWXnJ94Wbsw868x/fE7mlv7I1alTDw8Wv0+7tV1meXV9SiKOW
         GpSxn9AVXpqwyhmAOJAjMLxBI001AAmkkFBqqKIPPvvTvD+9zuO9RsZbajpwizYdQzFz
         IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564591; x=1753169391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlXDOuB2NWs3tsHwTAfl9oYldXG75qTwJcRqgkwKc94=;
        b=mcV+09kjwi2BH2oCCzey8eAvCa+3KirP9YLqS6PWvsBoXEpbDu3733UOOZijVUNd5P
         H40zuV1jJmCFm427d+pqWiXJ30l9xCoQG/wn4Ap8meEvGjElDkMSsJuZ1m2lPx0Km4Yp
         euD43oBcOkI4CGJoUEtSDrJOH89V4fkTdpqzTzsw8QgB5Jy0/zn1oORzv0yLPyXzJsFC
         y/fz8AQq9SovUmZYfEsdOWrPrB+O700gWrXejl2AuAkjPS+46B4HU6IFhj7og61KIpdu
         W2zhHI1X59kCwndSDeBycZ5mcxK4efcVkqK2ffaZ9GTIzvEqz4Z4MmNLNzC77VKlwAXM
         YkHg==
X-Forwarded-Encrypted: i=1; AJvYcCXsLUz5K7cWHpE+9GxrWwsax3ufXHPpYyR3Okphf3J9VLS57o14d+DYWDJP3JXmO4pyfFAZq9ZSIpID6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g7ngFVcTHX0PVoPJzmm+y/TkRTv8hDX1rsLrpZ6rna+XtEEZ
	Cz7/X07poiE9ZfXlPA82F1JMjQqjzyxHESx0IU2lhE2wqyc2sPL74gPz7Ms4V4BnO/0=
X-Gm-Gg: ASbGncu6lEUvPDj0Hbl1gvBwMJRQ/w0cqlCCYo/1lbPzXbuUtstz4+106Y52ATwIh+W
	PA58IdBwSpqu/ouXXyhvqL7p4t2lO5v/y8YY/r6pK7HdMdP39oRFH1DMv2CX2oUcZ9aY6bChM63
	Dn8BSVcKtqoJSCbs/yeGHRbdvmXiV1IfAW4Q2jbNZYxug6giQnvqxvRuHBYXb3UUS2Fb8mgZEtX
	clUi5IJTJ1UAOcs0HBAF78OdB5hfwRV7Hx3FlwiLrqGga3eXzZwYfQeF8TCLbJTWQMF9FvDq7af
	Lnko72nhjX+QUaL575t9ki270CthhtX2cn9zta7huN9vbPc19CkhG6fFadPrQJNOmE900gY9hJP
	Jo9JqxzSlEnXt0e239vMh9FO1GkIHaO95jYQ6EY/1HfCw7UtAP/XDKmUV
X-Google-Smtp-Source: AGHT+IFNBRgqSjk2HFJaRqvUEeFclqwrA9aBptgjfGQRiH2n8mqaepG8GqzAyox93VmumoOhYOZ6TQ==
X-Received: by 2002:a05:600c:a4c:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-454e3399cd8mr155077575e9.0.1752564590536;
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:35 +0200
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-2-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=970;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jzFcFIoWblJGC7al1pj4N6nIT0ZnqO6zL1kXGKeDmAg=;
 b=9yt+l6cGjdO9axu+nOBS510EXP8FcGFhy41mnRfZ/ANKPK8zyygFXbG0EduAhrC0C0EZZUyzl
 6ZVPM7LcNG1Csu0bgS6EDkRl0LvHYvoIMB/YI+mqmcaU8GyRyWltYmx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..854f70af0a6c1ff93615fa8dc1031b4c1ecc2e71 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy

-- 
2.50.1

