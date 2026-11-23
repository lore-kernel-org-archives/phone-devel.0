Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432742;
	b=VaGrGRxJfoRYhmp21S/fJpg/cNB+3jwiJ9X760ynuCcmEk2ReP1acsYJ2i+NORozqggr
	 C3iYrKxCBho+3qCeV0J7g9wXd3wYMOky6L4dUma5Ll3Wos06FtdbNGvSdZVutyMOZm/9R
	 PLc1vrOFPTlv6qTSim6mqa8F6iMxESPQjVkUa6AMz5VTaA67X42dXTlOG3gAZb+ZOzk49
	 HFslaBx0EX85Vw6AeRg8SWogHi/WlXX9IwnOeSU40/jVbYTdWzGK41BFAAujtSSyVSCgn
	 96s1iENKpOt/CSbQB9OXB8BxXsYcP+77SBPyl1SnAsPcoXHik8e/wu/HM4CkLYP7etg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
	b=gsMPim6Pap7C4Jjw0sf2JvF9dunD/Avk1RyvLF23avG5eW79ovVKXqGMbDdXrrzxZX3j
	 uvRS3gyp/CNfrH6NGLTeuJGjQjphtucL6HFEpsjrNm6B56z5yruYmtkOt/EWeXGcl2BwB
	 aIxj6RuTMmNK2urIcbATuHXtNlJTY9ubLTDnR07wle+9/SJeCU+yJCfbkiI4W/ebcvt9Q
	 1hTbmt7i/Ma+az0RauVMQRaHLGSIMqHK/W19Dzx0huLtTEm3WYNSufPhM1FzpfJi84boY
	 7kqdjrajZ6uFOKBntVJWBWBYUmD53zA9O7DimuUxlOgc8TIBWDyaQJQVcUphFGkp58Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88258606A68D
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88258606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5126505cb3so398557266b.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432741; x=1796037541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=JK7SjlHShqGKrK0MfBGja0a0+74eIVz0GikP/sp5w8+YnuWmehFbl5uiXQUjtJ5tiv
         tW2CXRUpyk7pKWHsifd/MUE+XHb49uhymcmyVz5d7wqN06KCa8HiFfLD+tRWDGplid5J
         lnDwwrCR3VsKX3Yxc16haWUr1L//I9LYp4XX/wkMBgZGlsyBf84J4pwNww6hnyGnd+Hu
         zMOgQk4NgPVyI85Hy+cZCo3R8HqtGjI+EoM7xtjaSUqiTDPi9nbBeaWxE02L6A8QQC2S
         ZYtQ36mx0ABEdHAAUuiQiYaBuO5AlXK+BFvFoojQxooRVUvAtKnl13KkH7qn6sxgkzAT
         jJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=FzyD7PjjU8kNxi9xaVKRZMvzYRx7OxMlsSlTCCc7SLfJ4OswrAzJMIs9Xb5NHWHez8
         33Axa2LKFdv1IjEaBs+1J/p/QmhGcPYNqt8MY097oChIjE0skAQJI09lsxIC/eiG786z
         tSZH2TaEuCaJDc1NS8qM/99BhsyhYeI9Vi9ugIc3zsd/vQkrv865S1VvkD6RYB8gMygg
         5bUvKeGxHzK5T5isTZiqCqi4fuge9SnD9cQxIfNVErD5TxIkJ5e/eEvkZKnRufTq2t9f
         QPJYBJ9m4JCOGnT2+wfX6wuJN/U7pgkbHZMwec2zIdlBqYlTxc7fj8rIaoKyCTjybQYa
         +2mA==
X-Forwarded-Encrypted: i=1; AL+hErFcgjXRMvSo74umkrQpQrq8v8LOss4/a9OxtKD3KLLFfRTnslcxBeEX6D/DmwfhNfqU82N1PuIDvNcpUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+4g4yzGrcOkLQ4VckDBR5cPL1CJyKu0bAhtgxkBetNh5YHmYX
	q01saoOQqdj7Zvb3ENdD57YSVsnWor2Z0sCj8QqhEOMtY6fwTPFYbp3u
X-Gm-Gg: AZFdTZetxUzFhw2Ab51GHDymfGB0bQ9OAdUrPxa0iZv2Rt1XyxutaOyhJWnGbbTQNZF
	/XKH57PjoJIDN5HML8zYf0UDNyIwDUFcf7pHb4BGJ3/f/zdQXoXg4bqynPbH7WA8KwaOEC96nFW
	xE+qvd/T5G4KldbHic5SsJY8mtXdpsIttzj5G16uUeM8JBD3brxiFI8KEQf8TY3Of/r+Ifs8+c5
	8qN+XjnAPTOm6M7kOcOedFqAEqFDZkXMCyp7gy/YbFCelyL3FkU60KI3T1dOVGpPzARM+/z+ivY
	WLT3J7/lrZKvUD+NYw/bxKY3DIvIBTPNskOkkS5TUClVamkJy1JmWz2RaO/nCX3u81SNt/1rueC
	TfG61S4crkKkcdENcGzTJ28aCv2awdvgZ7fybx8c6Af4hLlnizL96zclwwcveyKZj0+KOwX3pYo
	L0+YhuiAn7F1S7XU++TsQ153biKwjAJ7BcMFxKug6iZrgF7e1AADQ8izWzYSemBXN2dF1Vn37v8
	XBCmYbXqKbePY6DwYFBpU8J3Tc66ieuM7YzarakZpvrSv6rC3UlcnUe1ihMFqSFw91ahHZ+yIaY
	il8ctMeuPAPGJ9QLAX/b7w+oYQPfPZ99vJDxlEZ5Y4HDfICiYlrBsfIEDDi1245uOQ==
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr586385266b.16.1795432740595;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:34 +0300
Subject: [PATCH v3 1/7] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
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
Message-Id: <20261123-initial-mt6895-v3-1-95c46597e63d@gmail.com>
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

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..13e5c31cecba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0

