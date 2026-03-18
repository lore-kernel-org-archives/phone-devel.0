Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C333D8916
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849927; cv=none; b=fsoZs1LSeR23jiLia8socWF6p6jnIvhRx2EDxDxuAOvb0HZjKX8fcqUhkZWcDsH9Tg2txQCTqSODJ5/yX+N6go0DJCL00KnmG3dwZJkKAwB60HI/AnlzrT//RHX0BPSOIWu4PQkA3P+xo4YwXSGaYTDaIE8TWNqjybW9daU/Lg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849927; c=relaxed/simple;
	bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvzo4Xw424z5BTo8ariDd4tV2BJ0/gSD8GpEuQjSN4co8RvWgKD5jXzybU5GjNhVqDRSXM5+M8QKQav6thtguwY9tbD3OQtewhHdlPEZVR0cF+zRJvQwqAw70dge5Wqi3zC+EdL5N3xqdf6O1yBYs8TYBgma3sxZNkN7b5gLHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/uz44L3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/uz44L3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso13445e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773849917; x=1774454717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=F/uz44L3b2SWdC6l06V3z6CbgrUhCHM7WchU4WvIFVdTNQERARlmIs+2DowAwE5Mcy
         f3MKt+mWCS2dOoU/Qw6Ap2BZBmKwMaV953YoLkErWC9yf2gQhhsT0Vmwo7Om/gTEdc4x
         JotFRL+IPQezmvJHYyrUCbJjFsnYCDoNjaQW9RldO+WN61KIeyYKdsZw+yKGg0UCb0pS
         SRqgcq8cOdrznJrEUEvRPuu5oAHG43qYoVbB/eZdTYO6nfe0ReH4t4tzBInHZCRO4+Fy
         6oofGrc4n2p2mQRvKrUchaB2aTyWf/3AqLr/DEcBq3xMeyzB0dt6K0kE+3UiSzKB62Oh
         nLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849917; x=1774454717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=B3ZA9Ev9+tf9F8nT6IDO04IZLP+xTHjX8MK4lrYNbCFO4gkuqbiFFn3+YHsyE/GGYP
         thWQFq75TGmEeijtejhO5BgG8NoURGw4+OqNB5mgdtz2/jeDOApsxDis6kGkSSoP+O7w
         +s9PPUE9mizghPzYlqEXrI6az4nF+m/7zmT1BUWhYH4nuQ7SYwveSmoZRfKaiMuVI+eW
         K97exsDgC/lwY5h5hkgQrtmWxx9rMgebUmIrqIj2+WdQff7JiXYDm+XzNLVENSo7JlEH
         nCpWkMHVrEIv400DIYqrz831/qBlvrYEGfMTeBDZqJUNf27Z4Y1mhjOXpbVbyp+x8JGc
         8n2A==
X-Forwarded-Encrypted: i=1; AJvYcCX/43ns9yBEHx42/a0BzELDv3u0f8G7rSrWMB55zzAi0jIEZ96dr+4+Vv+WENAyjKSYdJJ32KVg7uGNgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0WrrX5QtKKnuDmKN9w3xj9iXzCR60fksht6jDXlMkiFbdGLe
	aIC9XcMO0o5VElqvvMIXmu/naJgwSPUoL1WfyIdl3UJX+CTkoxfxYMLz
X-Gm-Gg: ATEYQzysrwHkmbbTS9gjffjQ3i0olaC4ABlhk6pETmAOYSAqePrgjWT952jQzaLvBjK
	mhZ90pUjIQCDOcEDY3IYfToBliCCase2CNY2IX5Ld/+lp2Z7ENbv6CZ/qk1MbF1U2gFg3MGLzW3
	Lo77/E86AHDQQxmmQZzzLAdIIWD33w/swgsr7uXqTOSPR3THOWznzbE938OTYsOOg7AhiMenfmX
	W3NIcv8K4RrowtL4jqL+x+gy4JHWGL9Igbafw4d5oPQd4SUkokZ9NxlK/nSo+rzt4q/wHAFRnlg
	o7xH5+Smm/GMF6B0+v34UEMuoLjDp6+vzeOfgmh2zm4iUV4M5IVv/NvgqpECtSKqMkQ9R1IILq8
	ZeOj9HME46MwDP3pTX/G2IDTmxYQePvuENun5BPuf8++DGGC4qBZxchcEJFBuWMR1X+ks5/Jxu4
	zp/j6GmUgqOd9y2uDjm26BVKhCxgeuWcX1cAhewdu4VwFkE4qBJVV1/MCsk+TfKJk0ie4Tjs+o2
	w==
X-Received: by 2002:a05:600c:83ca:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-486f446dee9mr60800635e9.32.1773849917122;
        Wed, 18 Mar 2026 09:05:17 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8baec5csm2282225e9.15.2026.03.18.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:05:16 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Mar 2026 18:04:48 +0200
Subject: [PATCH v6 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-panel-patches-v6-1-7a30c2f85e0b@gmail.com>
References: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
In-Reply-To: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849909; l=1398;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
 b=TQHggHRPaa6/4FzPIkqTMIOpA7S4t9AmV+QlZloldI26s/thYR/QwHca9pFK7MT4G8Ux66P92
 CYVUoKwIZZBCrT54aPY9NRIZiPlIsy+1I6bs2i20fTkzDhL1puXAvRz
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

