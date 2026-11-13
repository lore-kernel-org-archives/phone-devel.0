Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596869;
	b=IdmNGRItSfK7sTYvGTNBQeAo6oX4vgmeZbcCNGku7s9FPUumxxik5t9KtmMTNzxcZrPS
	 +uZPdCZHDIyLEsDEaA/GVmXbVhWKGIFYDPdVTK5wkCYw+1L/3rZqjMyz0OD7iuurCuLLq
	 lUUkmaT8bgxz8pNHd869ke+NbYKyTm6/GEeEbg5fYcDRDWt6WvjUuGRnAdqBD5lkgaXlV
	 Uf3BhalLeLuw5BXb6AjuXlwwJhtKA/bBnci8nePHWNO596Dsq4yxDkUfttWUsL7KnDX8l
	 rVUs+DULlyKyKKObViGXQGTcJZSP3ufP50H7rUUUS1OBXse36rfMEcvYATZ2C58wyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=pLUBtJYBDVohBJCCnffOOyTghdEcG6n0Nw89O2DO69bQC9SKy+RI7V4+B2DvH/9ea/fZ
	 AuNYL+RQ62/chVIr1roO5gqsGDZfPggMXSikQRo7CDtCYj6l6evcRXPn+U+mC6btmwPv7
	 A3mz70TlW66jQiVajylK4Xc5/WH0jJ4tXPuHwQEsC5J3Jz8dBrP3hPlJGQHBGwb8nDDOk
	 OPyfOnChx6RpcOJ8F9tStr3rAJEbvDsqqdE/pEnXXM2twHBvV8/iKAkQckfGpUozXUpbP
	 AVlfHROG3JHhxWy024yYodFVuNyYBnszwtRUbyEZFSc5EJeuyTzQf8JNNS3AVcJMvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A7606A8BC
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1A7606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c506a231b88so233039466b.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596868; x=1795201668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=rE2u3Ig9QQmvYdO4meupm38R07509KcJIbOAEE8bkGwjMEOVzVv0JJLzRE37Peidsb
         smpNCeOpTI7ROICLLY5L90EV6xSGREQ/ui4lN8ruSeUYnNG4G3X9tiX6tmBDjD4S+rmA
         EJ+gM48JWQjmSoetmjwKebkBu1/6kW1rn3mdQb8JgRGM1t922TkimGEZMcSERFZuIPXi
         452eL4fN1PQASGBc2YGLxX4d6X09AtHZIOSnl2GtlrSWA8UO0+oSOyfyLdzIXzzzqMTS
         vEBgWlzFFtez3312Bw35huiUspC7CzTPnn3dJJdqQugkUMAD1AMnk+Aob0x4KYw0XNBZ
         gFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596868; x=1795201668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=hoGnuzYvhCqu4P+QPhvnkpAfmL1qmeV1V6dO94UJXlcnriGg1VXTvruCW4xWpJh3id
         mrIXvSgmL5uR9Y/IPseKLi7ExwTRNmXl2BNid0NVieahnzt88TkgGMdVPSxbkKG2IpPZ
         5Xt3IX/cQy8dVSKTT5E8WWxSo4XvKZXzVW3NMU031fz+Q+Hlpdmz86U4kWh0BYfC8z9G
         Uh9Byfrcu1DXid2DzHBf0InsvBrhUGLafxjEGj6wJq2MOIXuiM92CGznuDGsObGmL4uU
         egF8Id8M2fCMpriPrfNWulLs1yoCT+WJqJhbekoixoUA1sVeaXy/X0/JIOfkEGg7k78v
         m/vw==
X-Forwarded-Encrypted: i=1; AL+hErFBcyTd+uVGzjQpCc9q+57Q/wlAC6qV8URVU2xYx9X3xfxcpjHJvwZhdIaI7GO5pPYxcBAkXHnsuYoi1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z86rnjlWu7Wh1+Ny/olJYGWporToXeRK7WnU2UeF+XOB7NNnsmb
	nkEg8LrJmLxRx9XUbN10YVzVl0X1FL7mO3D6KMIfhrBFsddgNRIwHsv8
X-Gm-Gg: AYBFou30wUvxPJpxJU3IM/d6a9epB86+P68zxDDPpGwXKdLbC8HyGUYhLwDdeXweN6C
	+PkZZgfa3fSOtCnMz7nTidqFyGAoQbjKFYU6G8PxTOkCFaPWrEtTqGGoBDeAIKWmdAtjeswIDiy
	DoJRRH5wQMX8KZtAi/+uodf0EeBxwTKduVJKEpnvOu/nQ0bby+dJMYJZL5MtRDdEwdFDzHVj45q
	/Hek/zxVl7xkZrX+yd7SP4Qv95zUafBtePXzN1VAoKuDlG07kRJ1J4vY79VpNShOUMvy/K0sPFs
	nzZ0ttLUCo31ixbYJhInufyOdt18d7IbhSuj1I8WFFyq7OZOud6Yr/U5ZAkkSBKCTbHHuEHUHUV
	S9PQM3VJEyUr19v9umC7twYPOYHKQpiCaTyDLFnLmuxhWSnCf+ukvkhcLZ1TgfEKqjFTefN7H2a
	29hkD690DjCYYyiOiKwpA6XxOZW3zRJXzfTRkQoZSyPD590XKZ1GgxCWPxZaAKHEJt12RCEmt/Y
	Jq8rGqv/jvcgLyyCsorQnPNZT8qqJPYWoCM9m8lowx9IW2v+TCzgsmEZDoNF5tjRSMgaQGZapUy
	M5Hemt0BWv3wzDHUQXChTmm+De2ns2hMv5JHTKldXbJUkGNzgkhT9eR34cuoFFBZ
X-Received: by 2002:a17:907:2d8a:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c509683f389mr411823466b.44.1794596867571;
        Fri, 13 Nov 2026 11:07:47 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:58 +0300
Subject: [PATCH v2 2/9] dt-bindings: serial: mediatek,uart: Add compatible
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
Message-Id: <20261113-initial-mt6895-v2-2-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0

