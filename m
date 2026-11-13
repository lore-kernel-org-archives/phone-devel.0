Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596872;
	b=FncHBVOOcy2pgZhdPQKP29sBK+ExOowvshkABXrZ92vlvNWbt6yYcpZ4ZQl3KI0HIZ8M
	 mAd1Cp5f7V1I6VKbTJwxGlHdyY62G+qz4xmhbaTut70+n/YDVD207uyQaIOqxUfolDBT+
	 3BgQCdUOXzlagnF02Ra7QT1ep86h/ajppTDMnnWu+YtGNjB7RhUBd2q/HaN+jen/bdhyo
	 lE+4JB80XYQfk8cgIlFyY8rPjc23WaqgAfQg4uJYl8yfBYtRyDeE2Iml17CNh3TtH5kbR
	 HvFy/4SXYb0ASZbOTLo7QpThOszHUgbKJFsjhz28odwLzaFN02qeZxwVFK03nLVYPmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
	b=ZrA+QaLQIaPFfVzcdTDi2VlkUYSH/Vdmj5YEr3D2GK4N1fP4lRafX1PCju5QaSOhuK/0
	 rxJP9+6do6aEwd5XCV5jdbuo5kLE7euARueycLkeE/R1O7kgrLbE1MWtGNb2o4lBtBRXc
	 VTlVIPEAbsBVog7EOPa7jiR31/PsBOusy/KoACa8x8r+b3DHQzIh1RWXwVKvPvKE+xOOx
	 hPV2GIjyAOVeAvQ+cqMprIi6jnxvk0KDzA/2xWi04DjDDnHP47vtCK4P3lGywz9fQoxDX
	 Tb5QYKt7USuB0Ejs/BkpTpw6HN0/FbEWioTfsrsaYA3eVrKMd0UlrtAEgui4SLM68Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786560A2615
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C786560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3208018a12.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596870; x=1795201670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=HePccj35FvhTjvXwtdVBJgEGNVeh2KrOUDPZqigubVdBbr/KLsuRN5y64YNXHBWId4
         m5z0PK1xgJg2mvVjc5PNTWLFyq96goUIFhvhIPhZLDaMHVwkfH1EPNEemnp6vzvRPKLg
         Yuy1HRPofIJAEzZc6kSFJD1IKjUzSort9TdQEdO9ff62aiFdDCjMk7tpoNy2qzHJ8s96
         YMdgBD2K4ZYcf0zITt9tCnTJE3UbVZJCXEo3J7dmh0cYnycfUhsDbPWzieA+Tru3tD+O
         CE6bH2un439G7EPfZMZmwydwevOgw046xvR0kNIjHzWfD+tp7t1hWAKcpujb0Shia4NI
         mV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596870; x=1795201670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=qV3Bfhb9MNGwK8ZrGw2ffD5SnTvr+EZn92HO9ZY6AhRv4XNH7aVwe2tXgodseOI0Qv
         jnu3bCRA+5esus1MZURTU4exsSLPw6ebiIPqTTF03gQ72tkSgcM77330sqWHzvykniFN
         piyLpb04kOuD3BBd1qEr4ufkybC+Am/GfJn8DD+PTBQudKg43e6ZF0CQ+i127nXbO0Nx
         w7ew6QqTbtMblSwfOE8zuhE5ZMJn3/k/HFQgp/JPkS32Ulumki4FRWNdcEqHnxas4cOy
         g0Rb+L54qXlCnIpAcCJyz/vwJXjGm00kpqLd0qkj9M32vdQs+LJKXcBE27RS1Je/qk6U
         XYVw==
X-Forwarded-Encrypted: i=1; AL+hErF8TgVe0dG7Q02PeXO4O4RFsNIqupgTT1bMUzgToYHkd/FDLBekum/pjwS2+yT9IRzlMuGPTKndkobaqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q+7xQI8xwJnkJFvg/C7OaacBiLhq/s2WLrLb4Eb87tSS5Jsqy
	HLQO5BTuOwGydYhRQx0jqGdG86v5ZqFABASYJXsXd4eGh9TYKJd1uAVA
X-Gm-Gg: AYBFou2h6yV7za/Fn2uScHWxNk66/cVo+Qr6YgbAF2wb/xwfiU5N4bGyj9vGu3LRqZk
	sgrPu+WsCctbwv+VYvwtAf1vBSPQGMZSDBk1NGGhCidbOHEhVhf8DWumeXf+EVT+Ql54yzysav5
	QWNV2AoEJhzYSxQNwfyYmOlNEpMmKUoq9rdv+KnmlwrlCzq+NRB5ZarpkCCDWfcBQOu2NySpNrm
	6UYa4+rYBWgcaZT8ixv8j0FJ0XnkJcBr41l5RxBrmYQvQqlV8J3SmSoFtEavwzaUYpk46IJ++k8
	x4GCVycpgaosD3JfnE2M6eSLy/tZHgGSE6AVd0PRLJ+7TuvFXt6jnsgjeaCbMXLJZtGWdHrPZC6
	oVAgXnfrx+lGE64CBRZwGznB6qdmKRy33ND/GnUwgOwxGdNBb6roG82lvA1DOcY9ZuN9fpQgKhN
	diFzGc2DpywMHqUCQcxZNMuQ9MdJM86jTGatjWYgrWAQEU8xZ3OwLC1y+ZRzBqPtYhL6MQKGpND
	b8RKcBs3lR60g6igIBbnpwoBgH4nJl2X+//uGGPfKH9YCQQn43xpnzadc7clj0OBlAVkplOA3af
	pLRkqiYxCCXXR3aOmxKXgcJaOaPAYqSmDIYIW7J4d/BqWi7MTnpJY3KSjqa8d7tR
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr389984566b.24.1794596870123;
        Fri, 13 Nov 2026 11:07:50 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:49 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:59 +0300
Subject: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
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
Message-Id: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
known yet.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8e8991ac95ea..d0a73b9c81d6 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6895-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8163-wdt

-- 
2.56.0

