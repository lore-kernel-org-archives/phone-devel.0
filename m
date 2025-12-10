Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192F228CB0
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 01:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331042; cv=none; b=qSn1u9MkgeBDR0sRJwQaKeb+qroz5oNeGW3hkMTNF17oc3vRQ6bi15N+nAxp4EsQ8wOuxzCDXQfYKpVvGIrvfrRPdv7kWN1ThakBKnIiuxls8UR74CIgKShV2LMisxW29Bk2vglOt3xRqFFZRo7HiGW8U8eykwyiPNZJazUZAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331042; c=relaxed/simple;
	bh=Oj83634LuR0Sk6h6LV1CwwmH8/xA1oyqe0fNzBAzWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhtV2vbx9yPdmEbpKW8aR1uMcca9j6oANzwzhcZqy+o5Lln43zzsI4i9K2y7wbntJbTU2xXWF55olFhGHIjc/FQsiuDgJWUy8vs+O/lGcT7PJR2ZACcUDDPnYJE6mVh+njGUiVLzus2oiUQhriY7DRn+oBODI+PvFlaaMi8lF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hKS6oCp8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hKS6oCp8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so3079405e9.1
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331038; x=1765935838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umLdQ4Z0Oa1qrbBohYzZ1X9EBV4iKWUTwztaRyY6xyM=;
        b=hKS6oCp8m1f9thEctqo4PCFwr4b3BrEWMEXs0p/fhB4bGOQDmlNs9sTlQ1kx5zz9Bn
         VJV/1/UTftbaziYT/CEAJQcAnWPffAHfeFgomvOYOVrmf/G+uAbRmhbJRl6Pg2A4wR1/
         tGltNQtpBosKvd0TaRvGDp8lkrSMSj9W1lk/AprGgG3OL22EAj7SS8OVPPWX1i6AaI2B
         N5yZtKUMq9bcFmP1vJ43yQLAFXnZg6ZeAXc2OSanNQ01Ub2FK5a1yuhBliwPuJ7A7nTQ
         p6LritUo0UCZhkD17DCubEnPST4Em1834/cAKpvQFqYrcptuCPAAph476NjNLN8jR/8t
         ZJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331038; x=1765935838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=umLdQ4Z0Oa1qrbBohYzZ1X9EBV4iKWUTwztaRyY6xyM=;
        b=iw1OGwHC5YqucEMMll8+Q9KCNrVGax2fnCoMZreAOLXSDtyFB6VxlLCrUo6Mb5iMUg
         /G6BCYaBqGQdYmRqza7AtOGsUiIb1TAM0eNDkSkT12qEuB6CYX2CEiKVI1KfkbI08T74
         7EIO6ahldK+PsFEVAgNGdzY40+PF3gz8411KCqmFp6g8RslLAyIRKw0dliyyQaa45v2p
         KY55fumOp/6dQt1X3YA6FKJ+TkFHFSpYmsjb26kVRYUmOeB0GTcZ02FFb3DG1hX3rKc8
         35RMtvfFHYLNNAGEGKDA1R0FwIDVN7k8T8RvkKG+d2bMmliZJsOsSfzjKD2N6QRiGUeb
         Lp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVnWHiXaQFWQM/d7Hv/71aBVMzaA6C3+1K3qKEI9SA5VtTbO7NEWq50cvKbzoUE5h3TqA5jWi6KJAU2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8lKE840GPJ682uDKi30XdEPyqTkrIjGfhmT4rTUF7fkCiTQvA
	D8obnL17CF6S5co3tAkf5NpSQ1JDk/1bMA9IDDYCl0O7urLCom3YpIWj2vJQkeASC7A=
X-Gm-Gg: ASbGnctm0surymnb+/b2+cyhBHBg4L0sQo0HWuxwxsTC5HTrQrmmksquQgKrmuZA7pk
	H8OG9TPvW9swvkLBI264TTPFKrVDGGWA4W5vCkbUYNcLYEIp9Mv8tj9G3KjvytdyfO9EPnP1znm
	5uc8wAcgm9tn7eMzpgzgIKTKdLgbO2ek31BlzjXSauYG+eeE4dB4c2oL1ayMx2+5jaHixf+RmxH
	PELohDMbdEVOdjimbW4pwn0sp4+yAveZDR/Y+M1VocOGTlSJLBeuXISQ/0j8Q/tMAZWG952fYTJ
	qq32l/RjqEAhwsm7/1KclirI7fI2M9RtskQyUcEt1oXRHgybKAJ8yu2ehgorVKh98poSffcWhrK
	lqsxEBAomLv1Qv2deuK/6LEyf6j10Iko+IRkhLQAs5po+GM1T2mfW223aJrWncgOp5c32sV9+8l
	MWI0Mozs41ab0ps8do2/Ga2nDwMUg3pUFgcF7WKdpsevkARQsT6NAORvTDXBEI
X-Google-Smtp-Source: AGHT+IFxIH9jfV/RWAbce1/H/pLcaMN1DtMzvU66F5/t/lzbYkrchMrfDWq7ziyApOqmo0GYQ7+Rqg==
X-Received: by 2002:a7b:c4c1:0:b0:477:9890:4528 with SMTP id 5b1f17b1804b1-47a7f90f296mr22741845e9.2.1765331038494;
        Tue, 09 Dec 2025 17:43:58 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:57 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:28 +0900
Subject: [PATCH v4 4/9] dt-bindings: arm: qcom: Add Milos and The Fairphone
 (Gen. 6)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-4-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=824;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Oj83634LuR0Sk6h6LV1CwwmH8/xA1oyqe0fNzBAzWv0=;
 b=EOx8pyQClbvxV0JmxPZtxhQaHpK3rsiOVVqGjOi/NNcSkhi4NB2293BkQWHtDObYSmVC6Frya
 Yl7gJHRuUU6DjCXJCKCgPEBBMffksNyiPLo6G0Z5+OwcMXj2haqKv0Y
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Milos-based The Fairphone (Gen. 6) smartphone.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..43d45fe95ed3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - fairphone,fp6
+          - const: qcom,milos
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.52.0

