Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432751;
	b=i5myJfSygvgtFFq6MEPnOE7BaOi2BdefOK441MeBBePI6x4stvgBS40GRpfCfZeDbPVm
	 X1QHUx3/fqt0ahm/Sk+bYU1AMzt6NMJbpGZvVkUVfL/c3eec2muFcbL8yIJVY1BbCq+i6
	 na/KaeNjBlG3TML+I1+5TE2GOIhtRwknRdVIC5IFyjF7AQYyGRIyU9y8/ykHFRc27/MtZ
	 7ol8KPY0yEftBbEzFW6l5NJiXhUITpq9SUGjEKBOG42mpa3MbFp6MMvPgWx3pZ3xWmCVK
	 GtqAa28CvdiZV7c6h732ZbwdT6zYAV+EbfpjKvuwvwONBCwX84UNoVbP5R6mDvPdAwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
	b=3YAqRZTcz284x1DU8ALEhjUqywye2G4UhWtXZhcgs2/x9WKQgbg4VSC3EywSZ6apBXqM
	 eG5dQyn51FqwmmwE0UNK0EXSfDPvWb2g3eOqNMl2Ep1AY8U+3zVaM1QomjCyt/F8DzsY/
	 r5LCOsrrlrLGRT4nk9IXOGaiVL77KaxWqR5PMFfQndQb9oa4IK5etLt0XSfeGakM6amSq
	 SkjHj8RoQGZLGaNCYsbUqF1waw36Y3CZn31rK5Eam2NQ5jFtFZ3/ivUS/ehNhV1mkxAXm
	 sTkdXKmUzh6f2EVfd+uAivCSlwHAJUijkxOWCn3PTWIgmX4ozNMQjUBgrQVQ7j2NtSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7AB60A2620
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A7AB60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcoKie5q
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c516a574bffso169800466b.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432749; x=1796037549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=JcoKie5qcPIy9VJGNJOeooy8iE89M63mPT4Tj1eTTLSnqtXq2b1lwRilTuF8Wo+w30
         2mxiL2i3Kgv1GdMK5qHeDH7IacTvYGU6YHektDgrSNsjjnCE7wnipEghpMjLc55Zi4Hj
         kgzPLiOhYpRTUT4KP2wf0Oo6kIWuFOkV8cF6MluV+qhv6OhNdw5ZYUmNc1PDQCzxjgcM
         CV+RTr5c85OgIHVnYYn4g2IuTNj8mjnugocu6PNncbEOYSkWeudE4IVx9G5+bwbOTt7i
         HgpA9vdDoDQCptPRtZwyqsw4GEVjsXpuOQPBTB/cDi2VXoVWy684JhnOA2J1Ipoh5CfY
         548g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=kiNKk7LwAKu15I2x3riIDTHB305R+vwmiessLLfF3n+UO+aT+xPYQjXP3okL4DoYjU
         HTXF+nPh+u99VrJST/U4RsXYhBGFkzrOSuuNh6OEYV0ABU7olub5Ga4NOa9PKtoYUIao
         DP0moFAMiQExHTNgaHwToPs8d4ZFwBlDnpuk0hEEQevYRt2wmzZfweH+6LqJ4JG6M70T
         DS9DSDzMqq0sR0Pr8XgNA3fLLGGPRVcEJctK8SVxlG46cO/WmdrNivuTHX6JjsrNtxtK
         oz0JWMphu0rt6lkDa5KUkElhCoknBinTVA18i8taRN9U5Pe/xdc77ov/nidfzi6Fnlsh
         h9Fg==
X-Forwarded-Encrypted: i=1; AL+hErFCZq0mkX43r1Ocr+8Zvp2uLpqS/14baLitxJl8dhfUDj9Y3+ZIWewRgRRByVO0cSyQiCKGzOyME5U4GQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8f5SqIoxnIzm8/1iJ70H3XTSgTSymAx6RQN5ZcZu+XVN7KCzij
	pw5VSZuOJ/xivjiw6wSzpLbplQx6qoHWJSb7rIWwPec37RDVBC7Sd95V
X-Gm-Gg: AZFdTZcsTZtyoaxm150+QrXVucVho/KDHwbKMFSakFhlkkMnjAHeeou0Xoodjfv/zYo
	8Xonrfh8E+f+uSBtYhJdCBQlYnN3AGz3KUTVZ+GHFUioafk66xX6SFdg6jW0nWmWV5rMfQRfUOR
	fTPAaBZEwQIdC8gdF7p654uB2XVLLbOJPSaQTX93M/4LskVs/K/j0PDTtmwxB8zvlOohSY4/XTj
	sE7CMVpbyASKJ2NhHBUq5arcOLzfzmTXhODc0qAkXdtl3sAIToAmgypTDuLe4CPGUfvztLqwWjl
	wDkTaoZd8Wyor1nfE1V1g6yqL0wPxMMlPMDUFNdw1rlxOsF8xFmUtl5lpsixDn9YRRwQr0gWV7/
	YqE2p4Ujl/de0DrgaXFtl0klrzZbs0JDviEpUb7KOjVMzpnMnGTdtd8g+61/C/75CF5lk7ZvXIr
	nYPDRmnTBhLki3jhgiCI/qLPL9BdjhkgegK34HUwbSbbEK8gJhf2E2InA8n8hX/lZ1S1j2Nyzc+
	CLppJvMCoLOpKbEF/Ns09ihJcH2EGC/3PAvOK1Y5Wu3nix4TqjkKkav95uIRdJC16PtD2i7quv+
	yBXxdgiLDE0z5jhq0cAFkNIFo9U814oNubH2YjvWrs/yFO5P0pZgobS87F04V1tAow==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr952960766b.48.1795432749405;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:37 +0300
Subject: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
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
Message-Id: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
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

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

