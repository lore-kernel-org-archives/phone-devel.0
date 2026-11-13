Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596877;
	b=2Nnnz2BfrFoHUKHPcC+gk1Ro5u7RDVDAuT/ZcLb2UdYURTweTJRp8mQ2qnNJTadNTg5b
	 WFtrB+mbm4nNIMCrs2DF+4+gwTm8GGIK1QVzRq6Gkj7QjtbMptKyZNbjt0rs/GqFoM14z
	 iFsUVCm+1eKj2v8wRzSlKt475Rk10tgc4kgsjH5FKc7d/WfO6XmBF7ytu3uEpia6H5YWG
	 eQTshyFk6Q+X7mVR9dpCxNrlFPJqh/GQ+aLbRdZK5NVc6/G3gq7Yf9kPc8iJEpnvYg2fc
	 kdF6v1zoU4hBNOqMnrHIc8QCisGlXyM9HOPok/R99G0JUMBCt+mI+9hB9N2A1ivAO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
	b=dDcV6lXYxO1feAqvTmijW475P+mmT33i5GLk9joIOzKEWE5dnAs1Yts5qiB1eI/z5Fb+
	 s4N20KzqPPy+nN92Uj49jP3AtMBCssyH1B9AtOH/ljBN/2ZPSRCGgSxlovYf8H27EB7/r
	 zFeQ/vI674j6Q+JCtmqMKl/ITq7caW3t83B9DVrYQJyfVJXFLdW/AhGGkRAs65waRmMHa
	 mgJObqzuk0UhWYV7YFc/bs7WSfuwuu3lMlp2jdmdWhS7G9BNgwFnwTQ7W0bvTzYOVEHmq
	 eEURamFpLWrkDkLgBve9RVXKQ1Mb55vFF9MM8HhZv9Nx06OOD78Gzf9mGl5/j68fgbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA060A3807
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCA060A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4697404c2bso227966966b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596876; x=1795201676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=uwGcGaPh+BHfex7icC71WkfRYapSs0f9axsnDYJawncCBYbSymIONXbbByTOPA4Mxq
         +CThUvi39AO8kULxSYQr/f+xw1u6F1k09nzML4VhxmzWUWhRKrEMjgv2KeZZ3eAFw3EN
         g7LeZJ3AcCY9gsAwwTotWDvhn77KU5DIk0XZo5qBTBt4xvbvhUhhurEHQNLnQmTuKPSo
         g3wdA9Q4hQLuYGgtlW6F0M768H8c74wm6DdYrw8qOGQklh1OVG/IizczWWSUvUDEXMee
         U7hP5vy0RVUrnqMXRViuaOTkZmH1czb4EuZQoMFrl6qOh/lYG6qVAfp8IGf+Pu3RD8jw
         gxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596876; x=1795201676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=ivbhhpk/49YUDVU5eFYJR0RP+QrSx3nUrsHlSvyWuvIf/76xI+K1psmD/uNfGK8ySV
         laTEl4uRLTvUxPkg4UTDCRVMy5pNs0yyaWM3NzdQVpUu7oWaZW6PISeSbuqmc7OlId9g
         QqL5LPp4LtrKQQbi0KnuSfpnQnNzT6/RTeH6Uwwwl0cxzI//665LGiRLJ918g7SvJ37V
         AHrwfdmOMYS81zLmpy5ei9Vn7Ei4YiHY1h11Nlx6rZY3QvRC31cTGeFHYxc5of+e+vae
         Fxn9A3nXYi5r+nnt2Au2F6SmndjWUjS38u8cp00VIy7jh/DMSkHNqSpVtAVXIX836hAJ
         hFpw==
X-Forwarded-Encrypted: i=1; AL+hErGMhs/ffpJFL0jr4iXfdAfvT+dWiCBXmUhgizDrj8Im+uUTN9igIbvZn8so6NdaZrmRXvNmxkJwD8plYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6VzpwY/1PyKE1MXLjL6TAbQScbgoX1SeYMb8byKM8+/+HtpuF
	5Xmx11HBsTRoQZVvK6XCzfvnHcircZW8ud8yUozMJ/GRbIrXrdoYrR5y
X-Gm-Gg: AYBFou0DQowhn3OGYVnJp1S0Mss8nJLm/8xAZwDj0C1KoKaJVIj9N/desWiFiBDhCgH
	k1hygahXkS56kHaZLX3dmidWLb4IfoLUODJH6GoWr9+4BIVskLtoN+5UenyggrbSPFcBgV1KkGP
	jNEWTLvvH5yWd3Mr3w3g/iTcfJBAiajfxacEuxxMGQj46pbWW2BKCLAevej2PpLQypl5UbWvYEb
	OLR/pfjdy3z4QAvKJTDOqJDvA6bRccpCYOY1gOMIdEaohWh0xOu+gOsl6HBNKpFeMNsFteGvKdE
	jy0DnTUlL/gacOP2VEKt/m1CYwNPA/N+oj1PT3j0WrEcZvNPwsf4wtdDQoYxOPhW1Uy/s9SwL0U
	pJpp+1SJu0lnb2UO6AZFeXh/xlzqjDbMSLZcGBfoF2uVHusE+M8TL9CvNO71bgK+oyQopy5GAPb
	G1fGXsZGAvXMg+d/5bgITePLAAd0AfqjDO4SpQ95gI+dAQawhZ8RTMPong51VdM9eZQBcO9yX+z
	ithGSFYZ1TWx2FCYgidB7FbclowMvRPtvqrKEHJsJkHmBavFbvkmxCXzfHxzbxRl0JKYylgmUM7
	5+GICm5oI5JwMc+CI7XtblxjlW2nYb5CB9s71pJJ/SqYsN0hMk7XmKZuiHXNS28f
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr336353966b.32.1794596875807;
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:01 +0300
Subject: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
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
Message-Id: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
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

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

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

