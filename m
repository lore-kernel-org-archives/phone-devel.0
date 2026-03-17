Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B693F6604
	for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773443; cv=none; b=VE17pBTQVjV4TLfJY492maxeoEkM7mBYkr0wRCYrjwVnag35ykD84U/vzd1f2uN3ex1Yt2qdrN7x6rw3bD2gJBej8PjF90fUmft8nZkATw19CVDVkyuJozUaJT/EYqEiJLs8BBiHQur4Zmm2FqbW4GbwyXw9x/6Z2SABxliLvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773443; c=relaxed/simple;
	bh=Za75U3v3+V3X3Fwu3C6KSoWJsyv9mKaunMybFhFCtn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6BDwn43UQkA+isfMIFvh7IlC3qoLZVBn4kXfkBwN4Vr+peY+Z5PIcKbW0aLQrT8CsL5yoBTqfuhtMu2b/G9hhtE6Nw46mz8SC78/3YGJtGE9W5zKS8cpEbkXbJ7DkrJGiYBjNGTNlJjvFBwkzTe/ImqAlaPGOr0A5jjsPFxPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6SN5zeK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6SN5zeK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so63590615e9.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773440; x=1774378240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DKiHHhW4IpTIdEWa3aiwC66PJec1HZ20IV3gMhmB/E=;
        b=C6SN5zeKlP7C9EXqXCUlA+oSBmlo1EQiAhln+XXK+0jb0N5hiMQOTgH7TENF9D7D5O
         RrCEQfl150Dh4VH8zjde3Ds6SX/ae+/JCUVILCv9fSRoKHEFGfcuOaZZxWIDBlq78dOR
         GffugjLLWPJwlidrKy/A1fJTseQgi9R2xu8XjWJd2EmCgjLhLleWU+yA3f/bMZb4X2zI
         938dWsZ4RoRITpfLcaoCNN2+7wAC4z9pYPzxdxGMkayprzj9M3xI1ihjXakjZ2Up7hp1
         4uMX0fIRkjucTEkvgdzkE8dkTgFX9TCQlHofT4TMIIkv2KJsuWtC1iOS0YYmnzt/KBDU
         HFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773440; x=1774378240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DKiHHhW4IpTIdEWa3aiwC66PJec1HZ20IV3gMhmB/E=;
        b=PaF9cSleBGjqf1qoHBtu1gcsHaAIDPmNFP7NmzSx2SrJE1OLY6dY9SH8e7uOFbnhxj
         wqd+psgvzicTUoN/lHH5NJxgT0EdjQmbhW0ZEOJwfqfdsZ41IaZzSWRTp13xc2duTCnX
         hJnEQuy6hdv1hRIPGF+lOkOXfIaJ3zYNEZFw/2cf0qMheDsXcCgX95PP/rSKmsoapJjA
         IecN34aZoneSGaujX1Ooa9e1enR5tIDoqHfK4d7/0xilZs9xOyiPr3+nz+h6VoxWB3cS
         V4+v8Y5P5ig21PU0AsrCQ9YX3aDw1JNN7LI3FCzBzhnNqNng8WHCsfsW5sRXQSCGOWHN
         1aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJOaC0wj/4wDlNgEJydP9Ci0dvxNVqA5+s3cmn1VB3wj+9m0mpUQbtHB3fib2nS5bzr9FpQzEBQ/RdOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1J3J8nZk6xopZrgc8dpfJ4v/FThfymEnhSmxUfw1Ho0V7KDix
	oj/i32aEnMd4XpX68B7YcS+7bjKXScxMzTmLkJVM+kdd3uXe0vfmwUNj
X-Gm-Gg: ATEYQzxDO6KxKMDS4sgLy/eBJBAELKxgwPIQP6pziR2XeoWtQC6Fee6QUUslXsr+f2v
	SZUXl93+q9/6xDGoYv/Pi+xScxgHTdFoQBtDXP92FhRX+3EYPP3ARJFMe9XtQuES2uNKVViorm9
	fzm4xYA9ag6To+6cqUxJipue7byr+Cot+bbykGL7AYs66MUZ58fnddDLRaOvGiYBGBlw0vjVwXX
	dcl7JlweZxJGFQtxXj14P/l5q1KgClH5BkVRl1Ub/pA+EkKDVkng27u2gi8+3PhJnMDff0fd9T+
	0YOlCm+W3Gq7CQ5AsadJY72c9kpjwoBi5jPToJ5lX6yS/1k33ez29IIs8MV6g+oZDYaPxXz+1zj
	UyCboA7xTUOtyMSlufpPKaSy+bv8fVlgAgVneXP46ys491zppdv6sVbgc8rcKTDPtqPeQZNOnlk
	p1Ujs4wmpV7nn2pOvWKiXcoCKJN9cwiuX4IL+l5KBIDc0xyXMN+VPQnaylt+IJZns=
X-Received: by 2002:a05:600c:b8a:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-486f4570873mr11068705e9.31.1773773440252;
        Tue, 17 Mar 2026 11:50:40 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm152863595e9.3.2026.03.17.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:50:39 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Mar 2026 20:50:29 +0200
Subject: [PATCH v5 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-panel-patches-v5-1-ef99f7b280da@gmail.com>
References: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
In-Reply-To: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773773435; l=1325;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Za75U3v3+V3X3Fwu3C6KSoWJsyv9mKaunMybFhFCtn4=;
 b=TZx/v52umP+9usaTTk4zKeDPsS507pIZ4B3HkCgcUrOc9nx+Uw3xh9sW8h6tffUC5rA56+sYW
 QxD8Ma8NnomAdz3IJsJpFL8HbpgkBH3odn+O3ISBMWr+8p//HMB8JHV
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Add Samsung S6E8FC0 DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
index eccfc66d7fe24fbe86e3c25f35beb0855c4fcee6..b271de575e15071bc8370466428bedbf41a93d11 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
@@ -8,13 +8,16 @@ title: Samsung AMS561RA01 panel with S6E8AA5X01 controller
 
 maintainers:
   - Kaustabh Chakraborty <kauschluss@disroot.org>
+  - Yedaya Katsman <yedaya.ka@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: samsung,s6e8aa5x01-ams561ra01
+    enum:
+      - samsung,s6e8aa5x01-ams561ra01
+      - samsung,s6e8fc0-m1906f9
 
   reg:
     maxItems: 1

-- 
2.53.0

