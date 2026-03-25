Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8B4218B7
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462083; cv=none; b=oU3VGi7KtP0fY7R0w11vdA1HAoc1+X0kpy8jzZIJ0En2XhfUFCfnr1ALE4xhxR4Hgppw4kfo395Ya0Oe/elZvxMZlIN7mFG2BMs3CnzF0Zom8QXYSuQDE8oU9zDXUQQsrWvzoBQtNf93XRKVlT1+DHcS2xsVXPCGmxryl2j4PVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462083; c=relaxed/simple;
	bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRYi02zbMq0X5oC9f9xuuDHEWVyMNKqz++VUkqvmxvcNNE5IInDe6M+zhRXocTyLwclJBgbKBODhaLjlJn9yZoOworyzdC1jrzLLpCs/+KMCZ0FQA1KqxXcIGq9SDqeVp8pTnkuN7xG6UpzeIz++E+QVcEQTmkaQTk/fBfw8Z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq1ZarGF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq1ZarGF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so9867625ad.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462080; x=1775066880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=Pq1ZarGF9TL0vKJmvaevq1b13it8hPBAYEV8Snb+4rZKq0/HLKMcy4165GSIHgY8Et
         06vb6HpVn0WO4z/ZKgYUJwaLOYQrBTW7YSXWAKPT+U2H2D/PRaG5VZQL7tgpgVaYiWCp
         oeo4XnjVQu4R6EINyfy8Xv21vb/vU6oZl7hbIgxYPzzGgrY4KU3yBfvog+8sTc9+a5fz
         VQ5jkB5hnkxjmuggtWH7ki9esxh+lPrf9z3slLwbzopfHvsZhTGN52gllnSUXdHUp5jq
         xf9yHdFTsYUZEUo2nD8wHPCsgTzqcYt7e+NX+E5MKNKMS9ClS1tNjT1m8KSztt735BBh
         QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462080; x=1775066880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=hWyHFCgBBrlTzLisYt+uoaWaCe6x34tVrb01H8rPdTMcuwa0y/ldgZsKKMvncREOyJ
         Oe7gOzzMs+yPkDBVqVTB0IZx7ahPjUUpIT0Mb+6S0xpiOzWfMIXbeDlcnFhEEuDo4eaF
         atlAzyxNDbla1DdOelSspHSEwncQM9LRuarsriTBZOftk+e/uWyZj5TpNfyFhor0hNQO
         tfKaXN9oD61mhyLARCiT5DE/sRgUw8Yzi1SfF2hlH6u/3Tlo2M/9P9wnzG/xV1OEBIjy
         n3bc4yPAnGVdm9XwcGhxr2wMTbnJe4xoZxTy3LeP3ei4vzxcWawtkX8dDI/J1dwgbEyK
         97/w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2f6o+XmNW+0pv9isgd+GN+AqAF5IujC1XWcM8/XfhlTbJdqDzi4b2NAFkcXw3ytw6XL2Lozhxjs2Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRq9fPYzmy6Vh3cq+Yq+X8zxS4HMDyRZWqXyNaifxMaBZvwCSc
	bopMTSWzEzHYt94KPYYvbUtvyBsT27CQAilTIzP7qgse6W32nsSRhNqi
X-Gm-Gg: ATEYQzzpEsaMgxbfKzYvwK48FqAJCKaj5cF2m77pmk7O+dbvVXnMf2MDTg7mTuQRN0S
	dN/8H/JephfNfGEHFRe1qxg6GsDHJ+xAaG2KIURIV/Dpe7VBRpH68gJZYR/K8EVIB4FXH757ODN
	5k0WUmp5LW3w4pBKkDjy1JiTjpIjYmIIQ/ei5qcw0RHcVKDO+zjnCLnCep6b/amEZEDCcesxFiZ
	XA88dOT68FN7NLeP6SWWJ7eH1n57rP2ZpNrszAAWOPwmfjYanOg7T1ywgPx1qenV3od7AypjobA
	XP5Ka0LPDJJNV4vVmQNdhhiUcRqHotiDaRAEzwg3xKpCZY0zJZiX2vNWJrEc+GUqNvXTGvaeWfx
	nR/Glh7wxqchrgBEGPt3JIetE2MZApCrUBDFPzPIzCHqlICIpasvsJlfI1ca5myHwogVfziMhOE
	TeVmCnnD8orxktqq76qznwV9fvyLl6
X-Received: by 2002:a17:903:8c7:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2b0b0695a47mr41847625ad.4.1774462080126;
        Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:59 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:27 +0000
Subject: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=850;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
 b=f2ywcUw6qhQWvHyTyNv4T149ViOhu8Y4DN0CMzzvFS+yL2U+g3sDFvUmgPmgqRQun2OmgiGWK
 iGQLZq9lALSDBlMVUEXSVv7UjdbHBHOv8L9hpbNCB5IlKhRe3SeE4+q
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3..0297bfbb275 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0

