Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E92D0C92
	for <phone-devel@vger.kernel.org>; Fri,  2 Oct 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952601; cv=none; b=UoEOzRI9sGrCcq7m6zPHr9j63xnWU2RfyHpsB/uv4OF12rR2+F1KrU4NA88opXj0Ldej2eV4A4QtOZJr42RaBoA1EPTJ6MzszIV6CZWFfp+1yxLQkU6GPUA+Zc/UsGBl1QPgxf9GZ+P9w7TmYE7f1swTR1/k+7ZyAK4E4PpKynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952601; c=relaxed/simple;
	bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wyx6vHgrDcbNtLAOvGKCDb9Zq5FqpLFhUYi4l+OjtsQHnatFLWW+jpq4t7s811tqqSRdTBHcd7h4D4JjFWGuM06FLKyWRA12zk4VngyvzeWUlGwiQUBF7a+StRqHIGr6XSVMy6GqXGICRCiMtOmiAK52s6f1kuMUah3D2cCpDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qbHtZRkU; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qbHtZRkU"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af85996a92so1265292a12.1
        for <phone-devel@vger.kernel.org>; Fri, 02 Oct 2026 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952594; x=1791557394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=qbHtZRkUia2Yp76jDnwnDeyn48Nd18nKAcq7gWhecHeGIfVwVcgYsoX/pDKx9t8Acx
         95Zc3YfAv2H6tJic/a4SFKeWgV2ZLHNEsrO/JojdSty0XA/oG8jo0pGuPdrKuh+E0whs
         YHM3qy/fQdDOWQ9htpvfCHb1vCkLlbpfH9CQV8vOH0v9AXlQYQ2L1jfvWBvOuV4KkPw/
         BBQj133BJ/qvPjRomVGQ+HS0F+3mL7DqVwh/Yb9n7hZ2KxASzRM3BlfvYQ4SV7QvgP7k
         WuChdFOTSdVJCAmqHVq3IunMNOSHDE2AjMiCtDC1C53YXTWsPvfScKNgX0TvGs5HY8mu
         vUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952594; x=1791557394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9dINPrQCPR0iqwn2K3Vkhxxuj3wUNi7Zp3ZQDcumLQ=;
        b=rn6DLs8xW4h1YDG3TxcH4bEARy/xyL9DLfCYmGqZenI1MOANczvJZ9SgpJ209mIc0/
         85gZIiqBRyaVol2y5o6L/BnsjQKGdkj6lSBDuBDxry2cFLDwOWSblcypKDweKCs6Ezfu
         OdRvWr1mcPlUWgRPpc6UDROiFBxjdJajH6VtVy0zk+PnPZRdYpIqYXNxH1+ckJdsN1Lp
         hz23V5OZxm7HFYnN3jKzZEZqsCOnX0ISQvl1Of9qVMUbFj6jTQ8AOyL6FlwiVdMhrsfd
         4eqD7BHHzNJu8hLPGNhn3QdbQE0/KjQ5MzVbirS0+wrQ7m+w46Mxi1smJfBBHUyo+gqO
         156A==
X-Forwarded-Encrypted: i=1; AKwUvBw+EAMYt2EZGtr91xkN1bVGsGf+KtKNvXyDxruFGZLAb7baVPjs6lMy9iRXHAhC/iw1/hEGgcEYtwqluw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZa9EtrbkhoV7ps5mm/bvYu175BjQBNfhpqDKUDjHMcXpUeRHX
	Iwr01cJRzs8WuVgvYT8ihx9PRBCKkB58MKNyH8RnzsHqFg12wNWoyYfr3z5AqCz6gPg=
X-Gm-Gg: AYBFou3Jh7ztuT+Mjzme3QEssYtv6M2D9ZPc/XXy5sQA+XCm1TpNk3of5kF/WQ66FUu
	6yN5wd8mDfwuuMwb3VitkbCiOM70okdC8cIfkWyeRY+EdyT7F3C0+KlYPyeFs6RBeokvIvnsOeY
	RbRTMB5Sh6Go5396Sh2jX0qJUR0FXpYMaFUD3nfxbhZjaX2o100pSzwi4gkNB7fdIxwvgjdCvgM
	Ndmz4MWC7vqLGitgCeUlwvO1LQAIrNrY2oAnIZd5LdgGRKgowdCw+Ch5g9aVi1QFXmCKEuqvELR
	ZVKsFtu9qYwcIbJ5V0ResVLRTCHN3uexzxJ2ag1jVrK4nrwPwnJ8p4HLBT7I699ky1hD7PFBk5v
	F2wKmrag7di7rhLZrWbAiDRYtiTJkxyKverVRJIFWxKR6XkTtzUOzNi4rVrAe+djjPE5RVl8qWb
	VkC2ukCgijpePONQN/dSboVzENNFt7PkQiSWfNTvWiCM/1F02kmK2yeRNJYpb0De4LlaXIjVZQL
	Q3RmPUzQm7jEdoSFkv94QG4dBeGJKoomoKyd+qrrHHQJqdvCV+R
X-Received: by 2002:a17:906:ba87:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c2e4ae235a3mr249670166b.24.1790952594706;
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:49:51 +0200
Subject: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b: Tighten
 compatible matching
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=816;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UFIj2wMvo5XUOBicWCPYVsxIWkd4wo9mTw61yb2XBXA=;
 b=PdkVOKEXFAm0sgIKoBhGPzu1gFBftu0qHcNL1NRDXWSJcJrDJjbnmsITJ+q/d43jScGvZmi84
 7Ed2SsdoD+nCXXCG78S/8INaau1afyaoLL/nPkm+xz2NKKuEYhhR0vd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
and nothing else.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
index e58bb3d45331..34e97003d293 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
@@ -18,8 +18,7 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: djn,98-03057-6598b-i
+    const: djn,98-03057-6598b-i
 
   reg:
     maxItems: 1

-- 
2.56.0

