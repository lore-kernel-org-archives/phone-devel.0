Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753803C1417
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017712; cv=none; b=XXqVggsHjSfFs5+gWnSJnfoLJHvCcuv5L3EwdPP2PilpNsU9G6DXV6hki0fvFxXyHp4a3p209ypUBujWTA69UiLO6J3+vqlCEjtPi7Qvzk4k14wtH6IVtKZraWKlyEG/YnVyYBjOOzNdkB1ztLC7ziffq+crlZ0x2pZpLnrRFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017712; c=relaxed/simple;
	bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cA9I85EB/4ot+/XMaFinFC7EKnguxM8QQE4UoAkqspCQRM9WJyCjRGlzqJxNo3ZA2/9/V3VgY53YtI5npT+O+uzIAVGCmYPeJw4aaZisDNOKbGhCAMXuBxVeWFrTWIfDOK1ixzdQOyDBz+7OUHmf8+LRaj2G4ue7EtmysgLOnXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhL3jiRA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhL3jiRA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe655187so11439085e9.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017709; x=1774622509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=QhL3jiRAL8DIqFHA3lextf4XDTv0HbXfUgx2PIkLLlmumCHSoxB3gU4eUD39w4JZfn
         BsTUvlMETRzmw886VNmTUO/8SnkfYTQD8oXIfVmqdRoYLEnLq5bLDB7ko9P28cRE+yLa
         k8yaAYiTr4tMdhe9KCZ++ZIZqq+hdoh0BY6E0jbn+8KUGCwVuCfJBoN3BwDoSUazsWRJ
         36EWRzzuhUMbYBIlSf3r/Bld9uOtbtOX7cSGSVhYs0yAHHOLJuKzruMyP86s+enk4y6x
         AvBIzZeZxYu+zhk4L6b5ZTNm3priklsBbGUmTOSlhzccVNd+ZabCKiQt+R/xjXFt0iEt
         FxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017709; x=1774622509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=sRnEpzLCxRV3+1wNPZ+igGWmsIiakzxwGoa5mS87KlzVJb0NtlKHUI5LHvcGdqISvC
         yr60LOMhF5poYPp+ZvfrFq4r5lNOnJeOkZ0WTQTO90QJATy6PAe7ewVW6dIjvbtySDaM
         4JF4vdnh0gMW25uywBtq1a5ESGIW+UC6rmFGkfal1abpZUyJKEe/RdDLNPP81ag5j4Jc
         uoiC+5Y130jknOgAA+qtriqCauPZoDUcWli+Kr1R0/h/a4QKegF/fMwG7vmXebGj0kIC
         G4ydKfs7mqM4+FrU6u4nrbHXAGUDqPaABFVyQIuEXmbHhdlDhxLB4a/UUyMsHhaluOUi
         yxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuvv9TsHDbzPoMPNtX7V1DWsW408mH5csQEbqDoA08UK6eTTMIbtpHJl8Hl0Qvb0MjMrgFFtB32dYubA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30UTjuIPnk6gr8D2l9UIAkNxeftQB6inO7ACfD983GTbxJdPK
	Wu26+NM4wfAePyxPGyYD2GebFDnhgVHASkQx7VXpa/p4XwmNDLy9OmeY
X-Gm-Gg: ATEYQzzt3/9aWndTXKb7Cyd4RqNZDR9kgGWrPsVYznM9OBeH2S4SVF4glyAPi6upLE7
	Y7iXz/Vm/08D5cPYB1t5mO/Uh4LoDUuhL9r7QitWCbH/lio3PeW++nhXntk8kFyuGYFdLIRsSW5
	8Zd9xx4ayKJZ8RPbY8JCwuOvFhnHFx5W4a5bGeXBVjXODY1Ahak/lhR0Ucu+9Nu/xZNJ8s/Xnf/
	eVuNBaM+cqqKNy1Z31aZcMBa7j5N/AsCb6vCAdzHzE3deZ60bzI43dzfg/0ljjS+cK1nWCppZII
	ToWuCZLmOC553mDxGsJk90tkVEDLvjzpJumGQfbVvn6AunuvRjzJPVWOh5I10wHuBJuyOjhK1Cw
	722Wbob1/sf5i76aol6TQdxOjEkqmhzIKM8N93jVSjxnD2y8R5fXPOfyv4MAG9cpVDeR6sRi3cX
	zaqvF+1iXfv4EifiTY/rhW6M5JjiYn/rPiM0at2G9R71DkdZzGRIgnc/eOfmiwGx4=
X-Received: by 2002:a05:600c:4705:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-486fee0983dmr51086015e9.17.1774017708638;
        Fri, 20 Mar 2026 07:41:48 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm130648835e9.5.2026.03.20.07.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:41:48 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Fri, 20 Mar 2026 16:41:38 +0200
Subject: [PATCH v7 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-panel-patches-v7-1-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
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
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774017703; l=1398;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
 b=XpIs2OcjqEG0kwK3wW8POn+gnlHDANJIQ4sIneTR12hoxNhYKjaoyFsaAgphcR8f2uJpzGufb
 V8hHXGwDPfbDp9PdBfgmYN/lwavA5WLin9fiVAgLgfQuAN98DvbFCSx
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Add Samsung S6E8FC0 DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

