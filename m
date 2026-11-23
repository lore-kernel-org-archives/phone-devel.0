Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432746;
	b=pJ4qAcUTB013DlHb1A5QdDEq9PYguqdj0AO3wQads/JZi+2rIwVJy9ZbrsYdNW3Mlpc0
	 7Il+uskjDYmaVFACip2UYsHgMCCABv0FuSc1CuWXSyMpFhgIYbH55+edit09UPXQVUUuB
	 NODzxIEnesjQqYwAIF6e5677fmdZ/871Gw9ylxDnodpn4fQkA9RIr5KU2UoVFiaX3aZ79
	 HYUOXeQKqCaE9oeYaP+XnR8ZpqS+uYq74bH6GXvBGbHngZzy7G4R15zvEM2/ZXKV023O2
	 8au095IH30GVPBjEPvtyfUrvdhGDvcDky85ROn+fnP0neMr16b1XygIfB4cPkyZrTzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=GiX9diDSDqTDFxCjZOwmkNgBMfED7XYiFhubzRw/IMqKK67IyP4iGQ87rAgZ7onwraoB
	 KlPtQecJukhIaJWiwfyl+hfQgOVWVjZnoDBIu0gBikM6K+ii9KEa2UCf0xIiFFKY2Jz1r
	 F66xLUtyLdpK9wHKdKqHKv1SlLqf7DPwlX523eHl9Ji/3dKK4vDAZKCNIGiM9v9sADeEt
	 8qJopsfgwgcCdULhMZWeem2zdd+udrl79FlQY/1b62rBTOsQesfO8I77EXo/dFNVlO5GE
	 MdU3OqpOAE4Dx1yrdJSv9KYMwcVwqp4CNkQJgo8mTzBrs6n29lUUsLMWSiGFODknkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B9606A6B5
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8B9606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfIg7S0N
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so600586566b.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432744; x=1796037544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=VfIg7S0NyjDFiESdcciLc42EeZNUHkJFW+yGCnS+PA5FOZnFbalkEzBPwAkLuIayTa
         eRr83rB0tVsFoar4KBae9dFGYMZVX68eI4RjOO0yq+tVzl2VhYKSok73vfwwVjZbSg6H
         d6ewwLont5tR6xs0d8c2QiD02Y4M2y5Y02DebZ/RuAAl5cc1HPD8id35r3iMfrsLug4z
         MijCMWgZ2iXwVRvzNp7hJH2BQXLmLsLnSHzmlnWqZq/sjECnDCsociBw6WQ2fZU1z1KX
         zmfHulnVN2dQYmRqS/w3NZULcuK1a7Ac/Y7lAXMV9j+jf3FA7SbDfrxoGfY3rN+z3yX2
         SM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=LAYQCajAL9q7Fb+lVqcBRPB2xouXX0hIkq0Sfk5YEzogKuvsXULJhkatdcKIRZ/S5b
         QZAf0RHjblcJy+tjVKgrcT3lCC/7irOqp8OSJtXESNASSrS9n9gSvue3V9S/8iYnEMmR
         KuTmRR7i3lZMGf74uHt+UGZXR7vjBDQ1FpZ5rZJ9czStz0Igs5pPZeDrK0bM6ywVsFvB
         DMD/E7N0CpY5cpT9i/pTUbsAeyMNDZC3ifscetGz8LNIsqDIDvl9CnHMUIfrnnP+mkZi
         Z4NJavQrkPngUeKeKobD8nYiizhMs8ZNkLyKhBkrjn3ry97UnnkcEzGhO9xfeJgMaaC9
         gq8Q==
X-Forwarded-Encrypted: i=1; AL+hErHbUqPoRak988vphNOE5vpdJVZSOpLkWScjx3qrrQcsb1NinD0S54/v6stczM+OTQkhPeOYYd7QTOUCnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Efy4IJ1TiIhIEYhdGTKC5o/2A95u0N7gcFzieYTWVo92IQp81
	onP+2biapelolHdeswLuwtnN21zreEXAYc3nf4Oe6SHEXdDjpJfJT1TA
X-Gm-Gg: AZFdTZeKiFrAf6DasFf/1t+L9bTzqQ4DOtxEkqpvOS87uE0bXHLWg14zAv2Qq5yqC+a
	J98ALc4xUVFffP+G5Eixj4oSS1HeBhLTXQvzSgGMOXB9C/moJ0BBJnkH9Ggknxe0g1D31CWC9Gk
	m4sGjmpL0xUSGfYHHdm1DMaeOIe6ml2ogOLI18OMffyCDPrwlrg3jhFaqe/N4/xiGSQ2NoCnCah
	HfxA8zfolVWZOAqZL0hGygvMAWHSSgKBYlekh+c4oikqvxHXRZq7OMJp9MZIys/64QLFLlCTmBr
	ui2w7m2k46pOux5NsOy1CgcAp3k/gaZkZ3fCgHpYw0mgnCI3PwxDgQK8hTu5WXLt4StDhhAnQ+2
	jNrhIIiNOmAlF6A9OtIIvctQ+Kw5OB6ruqyq2cJCkfsn3sS3zfWFgXum7WuU+eFfvVCWaFqhnpn
	4M6MljebgS/IQXSBafwkqa5Wtm+AZ4H3c7NMH1o1Wz71Mdqmh2GysnHx5cC0JtLHqNoHxdfOdOC
	84Vgjnmm/6c/hyI/FuQCGiYmUAzxUcChPYSBsg8xbr1s+8CgaaNqMbdvbXj17uKBC4K1ICAEQjD
	F3veA28JJOBYxLnefrlKSURKgqVsoSrm8TfoLXKiYgkpNEWfwNufznBRMaAaLLirwg==
X-Received: by 2002:a17:907:948e:b0:c51:3b09:f7f8 with SMTP id a640c23a62f3a-c513b09f8eamr826376566b.25.1795432744060;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:35 +0300
Subject: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
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
Message-Id: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
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
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
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

