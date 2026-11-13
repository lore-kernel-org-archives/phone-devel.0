Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596880;
	b=pSIS28AHol4b+kOQZUexkwwhqEdHhj9XTaRsnoMF4f/HUQPUYcz1luwwCT3lNJDFgbdS
	 pYsdt5MpbgBZNYBCzC08/TehbQXi8sWv2P8esf2KWkrFYfcOQHTuuvSKGyDSzIhWbixPP
	 6OGGRF+m0D6muZScbhToaOjqF4sPtfLwma5X0dcGlMtv/dPJj41wtY8nC4ag8Gt2DwY2R
	 ExR26e1gSLD9OvHQBnW3HofsTVKEGGDm58w7JUS3nVJqjQDTY2/bTMX+RWvE11NNl6K52
	 g0/dLYlZpgivmWzNSlZC5Q/H+qVJma10JmU2GzwU9YKs/CgvpNkNWOq6O0lBJl5ptwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
	b=yciR9BiaUaHyloI9K+EZbAcf+WvypW9jrF2/BxpHcLt4iP8aWwFspv0l2dbaoLT5M3oH
	 uDjAzBRqJpj28+cBeA3+su94mvTMlegmPbXAyjaO++ndtSW/5C65j2gwFARcPDkEIg6CO
	 g74IqC3T8sMfTkegaISntCTWwvsMMRzsUuGxea0ZITcH3MYOXUWbq5XPByxqSDmrYFArr
	 B8K4MK0wxeQlwZyetvXJG8wBn41CcnsBRN8bPrgV5lD93P+L1xBcxJVTHzpU8Pzg6dBQ1
	 UK9uG/0S7hOSW22dp65/V+YIWEIzkrqQNa9Ts5ACC09di4XY4z+3bknaSKgIDRHBhyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC060A381A
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DC060A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abdJekNZ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c247f6687dcso323062366b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596878; x=1795201678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=abdJekNZ8HxFrzNGohRBeEoTf/523bitcDzqsMoXfu/U4MopGkOP+b8MXZ5tWxql83
         +H4idS6CeHAz29Ea3I8Yr8DkY2D1+ljIBctRuNZ1EQHnxCBrrSzbgBs4xgLyJVibQTIQ
         LYPvOHevrIg4Xv1JpSAMiLR37kb9Qq0S0VvubHWWazdzfJLS1TikFNzYi8HMMVqCOQbI
         eKti5JdPJe5aXqzgfLGy8UYM3/T2YWQ3JRtjF20hkIhmgBcvDm4bRhNg46dcYztv2oc6
         BEcFEfaaFNumUsm4LprF9aHBwJYDZeY8ItR+D6Dw/wamqL2ToslkaAQt7JXd/JPGbXXY
         Xx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596878; x=1795201678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=xCYPhB5y4NJBUMmGbdpONRj/zOqM+L8DGJh8paJJlYrhP3oI85q9aHW0Fl06KoT7R8
         ZWOSKOMOtNKGTdhuWJw0ACRBxxpJCewPaZcUfjfMmHUVctczDPRzmWkJpjRbNMnkMhPM
         C7F0dOia6mPFzatHorhCHatjtqFRAYtnzlQXsGm044vjXYd25e1FEsAc1Z7vOhU3ZHsf
         /uvrJMeCsz0Gnw+Gy0uMcuBPZQelajOpv3Dd3PlH9ESzckgKsMRToYzJQLdwlP0vNE+w
         4ssGR24/zX4jd+WGTgV3hEfub2Klyy+4Q1lewQfg/j808Qg+qaqKsMItEX4lcvyz82CC
         BbAw==
X-Forwarded-Encrypted: i=1; AL+hErGdoJqaj1qPPbHmi3OLInr/SwIdjyTgzZG+LZM7u+J7cYq8Yoypezy6rusFK9QWEX5VCTIi+AUt7cuy/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SGYyAe6E3GYR/vkibUmJI9n0R1dOqPxQ09M7gJr2h5uZ7Y4/M
	yfqmFx7jtuQhS3ry808os0foRnpGktoRzyqWN2MP9nFgqsOcZhEnw73q
X-Gm-Gg: AYBFou1zGoE6FJAM+2t7xQLOW5KjNGYEzbtrw8+CH8KeeG83xbJEvVhibhbsXEgXvXO
	3E35mwHR+PXIEOejWk6iYK86Nu8Nk/a9zKA8QYBYf7hjiCcnb8DbfGIkeNyKTsnCXbqNe06nRrE
	GUvUktDhM0Gd9efLkZUp9rh9Df1/qDMchReYOcQoj88WPpjCj1C6gYL/BCABsgLgkQMJmpfKJd5
	6+Gwv4qp7v55nqRXvgNz0GMFl78vXVa+9R0Pevo1B5YTty/W8Z9uPpuLGDQTbQTmhYYNFTRvRRq
	BlpVnRg9DHRwMdO5YoG5FgoFxup6BGsRYY5cUjfeyQHMtRC02itkuEKZKbsiN+CbE27M7xmGK1W
	Ebxy6XTlBXVKHcqqRrb5D7+BzT7cMkNo0VQrmzfDvBQUorGwGLxXke6SVYpeVT6O+3JEM3Yd0PL
	qpkgGNxRg0bUDUYXL8cMxD+pDFkJckqMZQHdIyQ9fu+JpTM6Sfcc2uiWXrD+q5qANSEpKd9p87M
	lT51LxfEXDzlsrdcQXgH+WqwczZ1/Vqwi2+Ah98EUMu2qOOajMD3KKyX8JES+NvOlOy0FsJSbQD
	14xf8JFbEIj/jTg47/FkZwmf9AWiWMhqo1vLDq3jrmD5xMEDF5EGZVrI9ddDwxvQ
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id a640c23a62f3a-c5096398047mr303416966b.11.1794596878270;
        Fri, 13 Nov 2026 11:07:58 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:02 +0300
Subject: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
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
Message-Id: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
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
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0

