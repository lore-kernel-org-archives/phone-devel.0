Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432748;
	b=f62XukNIkbHARWVvMaqaXX3JrFfT0rN2+83ojHR3XjW3ekqaF2fD0x2r0Y7wA3tGXA5B
	 WFWLa/4DZsz0EBbMFRmLW14md+EhYPGV4u4IypFJWumnf72ralxwS4pwL0Is6L3zCpkqL
	 INox9QGvSRsy2hShKHdgBG4vsSGlOjtOkkSE02lFcp0h2DhjTsh1yGX7HEYyv73X3CQeR
	 fKeYoaRbNlSy6BitzNjRg8c2wBytMXxJ2OBrCYumYUTFMXSZNVQQwQcCGlqRYguNK3X1M
	 fwMqCdY1LPfvHXommZjIhy6ZfzUXMrBe/pBz8Iyt0vl/U7EvvMGTiJSJaFlcAYu5/Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
	b=Hzba69upP3vgrK737jdgEJyvtmVH9b9lKhvwyPGCsQGA8IVMEVzh5e89gtlrHXgxCeQ5
	 8eZC+wUZHkO5kWvd1QXW6XxDthxxYHu1cexCVLULOX2S4mY3IWqBi3ZkiKKXoTLB8bYJa
	 1q+ewF6BKqwDSP8BeFLNdwkf36wP5z4v7wj/7LfMOW/rcmy66T15FVfy3po4J0jI95s8N
	 Xl8M2Regy5nnlWgBQk4mM4z10X2eAUc3oWtV2FWTH2mKoMoiBinCZ3fhGxo4nCUzLEXOK
	 zWmW98KvsCbDl/C0bIzVxMz0ifRQcrTtTRet9G3rJD+2Xaglf8hmzcjAr+YIfhFLpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9100860A2618
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9100860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so514309166b.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432747; x=1796037547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=HTqjUcY9hLartbQ+wDqUUWh+DYA5uBQlIQNY8L8c0PwQFxlYvRUmqcKq9vBHjiWlIQ
         ZEUY4IVw5jmJePNOlSkdFejLPzyC/gnES/8A9mJHHXOsB8T5NCrWqcjznvksBUyFj8fX
         Gdoirno0KXw/7rEQXjyZtluV4Rd+3+z/PNlUakMZEHUQWIAO721PWX1/mvJ6P8xawItb
         ysROTquAqd3jS2dFl+6sDSphM2xYXtslTN97/hpIFiJOGhGv7AuWUlk/hK1ubkcgPaD+
         nmyLdRZ7rePh/oqb+a8G6vq0onwln8KbWQTA7ew4HWiVbD2Xc6bis5BHikU2+BPy7iLp
         b87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=xWB9fVpGywf5PDJ0N12XoRWm05Gmm091DUjxA7c1EghDxKpAJ3iRlZkLh1Z9e7Tz9A
         hamLZcVi2AYd67vEHsiMi5bFgFEc3iXF8XJCV6v+IREO0FDRHkSpGZc9V2GDTmEOpTSy
         pxoauhETptKdjlWrNK/KLqsM6nY1uKyg7fU1IeHzUzabQwERk0nuZBTMLnk1RZUMO9qH
         EeKrt4e0+N33cbCaG/vOiH8OFGxr9+XaxsTvvHvvrvEWHhAwhozYFQ5Dmh8i801mvvQC
         IQnYIvRICQTvNSQCLgUJOEdxiRoH1fq8oqvojHgPjyTnMCIY6Xm+qxPkxYQ0c4JT81HR
         tlKQ==
X-Forwarded-Encrypted: i=1; AL+hErHp0/WrlkeX9J3+H6Z3L4kXjBPqTcEr1D/YCoerq6EylAF0+v6KydwNZEYkI3ezvnjl4vuXvyB1ero2vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jKnID9c2K8mjjanqYgbuaS7QKVOfHvogWweby2xgYkf9rKQXn
	HnUT0MiT6y1xwLJj/CKWXF3ItEKni4db69ewcXb4c56BGOUIgUyj1lIx
X-Gm-Gg: AZFdTZfkMZ0PSHHimKN1yssIVYex9aCvclRqTzN0Www/CUDPVob5Vwca9ex25FEbdu7
	b6unfFZ0/yOZ3YAzNanw4ORvlvqlMRA2/KJ3FU6YMRsZlp4x7xWstDAqMNgU8PJ9HE/rz8rGXwb
	8ROISLKBcRzUNYg+43gFMMGxHT7EnGI3qX2PozXeo2vKjyUr4Am5HbJjT8Xwm7hsKNjXXw7J4zi
	jh454gVV76J2BUys69grdvytz/mLRBjQIra380Yy7H7qeeLWZbH4rGnEXhAf7H89odZ6BFI4L+0
	sn8uakC78gWgNb7mc0YsiGi+9J+9eUbIOXUIwfo8eO2O28hHwil+XY0IpodOQYRfmVay0q3efw6
	HWOWqI7E/nE6seX6GKTCM0h60hUwInt+MYy+shBs/9K4MKyBVfHiS4xUVR0kg85K5LpFwg1VlQh
	3NETj8bXmHZhUuTJGoiJHMDx7ARFjoEi4Pg2erS/leanHDqoNjMxZ9I7Nf7btijsKvieAGl2U2z
	f9oUAQMMNPdUlvp0Uqd+fM1mq6jXxM0oL/kgDUNSJtvxnATjlXbXCG+NiO3o4F4Vtale78mjwcP
	CJwvd4LMqMoQGQUKiRuRi31Ffpf4+lsD2LQu9aSbjpbuVI31ly8tcvMVkFhzZaTLYA==
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr863152766b.11.1795432746902;
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:36 +0300
Subject: [PATCH v3 3/7] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-3-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0

