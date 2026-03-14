Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35E388362
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524795; cv=none; b=HKrymLPUy6YlrpRJ0x2KetMurqQw8FAlrJRAEB+0FOs5pGKhLQTm1lqBqAKB7p4fmcp5hKELiZzuce6Iq56NpKhWBaRw8zVUrddv9PRVk9acaUlQ6FXAlehjwi4m8oM/ZB6XX86FdyA6nmFVtCh7NXGZDv6pzY69sFhlkoRDurc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524795; c=relaxed/simple;
	bh=HuTZem6WD63BD435M83j22Zf/cfFLJrqs3suzghbsJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFifFiKQxYoEhC+Tb9dUYhA+sVf7sU8tkJzJfvVz91q8n8t3PB+tT+EuYcjEQQVk4NTbCszXdxFV2GtIBDq4iBCIKxaSPV7nc+0SFxfKQ4i5fPtpwBaQBsDW9MDZIRRCppgciKPfGPj6Kxtm57ng3ZeoTlkcyG9fj5uCngw3s0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlSIqeQG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlSIqeQG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-485345e1013so31651885e9.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524789; x=1774129589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WouhV1wJdcqRp0ZqWSI8CA+UTeojrOgDEfJ5Sm8iumM=;
        b=MlSIqeQGJOjs7A26w+w8YgdGfUise1OBdCjtcAqzj0xHVntxWTQeeuvg2QgXCZ9/HS
         h4iYc5F7dzgO29N5YcXWGVx4g1fgF+/pLHFiU9Raq/QzeurOyTjx4HMZCcdzEMk4J5gT
         sV3bwDiUJTlAh5AWvbL3mKsopn900BJQkdCQcKNsagdV3nb+sioRnv0eqNxnUYjXDqkJ
         CDN2eKi9r5mbKSjMYXx8t6ZRKB8t5LZg/XCyFYROC8AEqcEXbZN/6y/XofaCbpVvWtY0
         0lxqSNVL7tWgoXYMhOifEYOoAJ8fwmL0AlNrhbsYv7hVp1X9Pjj6oLJtu2wTzmJIL0UW
         SVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524789; x=1774129589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WouhV1wJdcqRp0ZqWSI8CA+UTeojrOgDEfJ5Sm8iumM=;
        b=kWqZRcK8jebr8tBZ/qGm/2B8HaSill4TV1Yn++J1TmJdpJBlCOv9taNHDyFMu3xDYl
         tVVGdyorGB6BxRoOc/lEj801vqm3Kq4AUfVHVkoKgh99MMxSB62DRX/xcvg58zukyTtV
         5XujxMDkYOijoU6SBBlNV+6S9FIl62OComKii1WZbX2I9N4eTyrPl1mLivQLeyA36cX6
         3EMJtsSzxAYX07nZOJ0P4ueugIqUDcXdh49dIkH/er2oMlXnAmqRt4PXFbLzNI/6iLZy
         b5ptXoroyonaS40m1KVb48wND6s9lXI4aYIZXqMf6GtAu8orqOGBUji2SHAXw49HK+jl
         6oKA==
X-Forwarded-Encrypted: i=1; AJvYcCUVFJiaGaGt9dNmgs+sI/0emzAzSpxww/L3qtBjZmoXXhjZylu0GH66oSA/T51wSDFNv7WoZpMnEKldFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMJKxUlxoQ8eYEwd5fLFdVCmH5bVGot5yffxQMZzUsEFBMcqBF
	rftnrpBR/bvJhuId/Uvr6ShK1XK0x5FKSwvWZYOQCG23ppkBmK4ILeUh
X-Gm-Gg: ATEYQzzUKuYXzEbqlaRJC8rqn5iI7tHMDcV+pt5XLa3n69AAmKw5h4VEYaH7KuG/2n/
	lweXTb+bR17H78HX6XhBZvbJrNQWsXqKpPe3RqOh7TYJ6iHGm032ruFNXl/BFenaafElwISt4p2
	5y4vFuRND0HMK0UkEqA3oDTDep8EjMv/VL22BpWmK/iXLiOSfwLmz05B/BWVzzvH4YjiOXfLUiZ
	u3pVZ2Lcbeq53EnIv0Jh2Mxu49LIRkm4wIY/SpL65IOsm2s5cTweFodNKJn1MwZYUc+ECRuhtpf
	hyylzyUQ8dFfRyFQy4olVMMYtauPotzY4M6Dkq9pf7+ZAmDE7dbVuspbiMMDLcketHNxKrY3Xz6
	wgcKek9C9dS8G84PzhR7fBqY5MB1DdDUMm5if48e5uACsCbyxY7A9GPHT2gz+ujlvZdfz1NI5SW
	sfBp2CJMHumfGhpBSoFq26rIG2jDOp1aMUCFR5ZmCIjR0RKRw2NVOtieiNN7rAYuk=
X-Received: by 2002:a05:600c:2295:b0:483:a2b0:d210 with SMTP id 5b1f17b1804b1-4854f56d693mr146590025e9.7.1773524788919;
        Sat, 14 Mar 2026 14:46:28 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm28756221f8f.4.2026.03.14.14.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:46:28 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Sat, 14 Mar 2026 23:46:21 +0200
Subject: [PATCH v4 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FCO-M1906F9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-panel-patches-v4-1-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524783; l=1325;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=HuTZem6WD63BD435M83j22Zf/cfFLJrqs3suzghbsJU=;
 b=xtreJUwAcy92CqVk1xHYCShCK+Jg73BZ0BQMe9255qqbRrr3GsfgqWIc6mOmasBBAXN7FBBEk
 jSuFlUctZmnAsixaABv59Wd0hoJ9EYftBq1fI0I1Y16SzmbAb/eSIeD
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Add Samsung S6E8FCO DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
index eccfc66d7fe24fbe86e3c25f35beb0855c4fcee6..05451c1b00dbfee9034a05be7be50c3820d3787c 100644
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
+      - samsung,s6e8fco-m1906f9
 
   reg:
     maxItems: 1

-- 
2.53.0

