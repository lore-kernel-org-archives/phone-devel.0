Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903868;
	b=pNmoLSZCBkPGcD/Z3JG7eMxVL2f3BTkXP1QRqJqw+0e6pwyXIYKuq43nYNACXFZVED58
	 FCK4A8wlF8iIWQaU38HsVt3FXBFbh+wZEJbcnuvVqY996Ff0P2JZnAWQRopc+DNgQcMZC
	 khvMe3Ds0EtgOk5OSFb6fqQ5/gVfrg3qQITrXYELb6azuMXLijbjai4Vp+5OMruzdnNY4
	 O1Nwvwxex2IiZOX8EoGbtVKQpOV95TFHRmNH44n/glrBXUQPc7gYYdsKa1fbL+yluXZq3
	 d5yncvPKRayV+oBsp7we094aQ/o1TDC41Xedqu76WON3E4VePPC6zxxhuw0kwZOGJ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=cDuojNdlorb2QCWq4+NmE6KAl92dubx+j1pdv1TYqhz9tk7lIdQz6ViYdRFkqFdxMKej
	 SPgFkS+Do+GIFyg8eG5457OL1CWZFhbbW8T0liiMdaKhewZ23PwIt82v/4r3JMh+Sj4kK
	 WCmOG/oTfo4okIcIJxEh9VW2Pa60GzseAh7+BK4pf7mzDKsa6lO8PWtm8E0wsF8FL0vG4
	 lC8qxmOJxcbSg/fz5hVxW9aniAUKp1tPfOI8XiP0gdai7EoAcI9BvGgXflS4gOGXDywLR
	 7UFhatlLzRw/NKQlW5QwvTcOyomYncXDlKJsUayFu8sMTi/oi6OtWVjyTqycxbD4reg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B35606A893
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B35606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so5583183a12.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903866; x=1795508666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=OOSmJG84RijGLublSYWVTMpImlN/WVaYVWH8oU+ddcnl85mJ/nXFQyXqkaCNhDH+47
         KhPkhKvIgNqhs/kM6bF4Bjnb8RAXPDNiq+6SRu1e4EJd5VM2sQCBSKFGSnfCqWk9sOeV
         MIVJpk5h3nFj9f/1YrTEHJMEXcWrwO99d/pZ5BtX58KFjfbONFw225vcTxt9ec8AUS/y
         2axT99gaXokVpb6sSCIlV0RXDZWOkSp2aDJuhAZhA3KYRVANLXZ0bHRnUjRTl+KsPlKC
         aKx7YZKcZ3YEuWgllL/cLAeG8Fp9dk+/dWZQ1/7ZMIicNIKl+4smwKMlxNp6B8uf2lWw
         hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903866; x=1795508666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=0xQR3+aL6WKnG56XlvWKN5tFzEUbTjBOw5UY4dwXtQLiLbnCrNQ41wPy/aJBxe3Bez
         ZNVc1b87y8aAYIPwbvi1HEFS5WGsMd/WQsusrGyCdYNHbt0TO8pXmH1sbG5skWF+yD/S
         YSYwbX6wuMLTjPllQUvPwkBBOMOXG7NhJCKCjCUEqcQPqcrMk/KpSZ5Uv3w4cqk48n4V
         Ok90CcOUYaHOnhbczMZrUarETeJToLv5rV3qCkagI90BB1qW42lCYJsNfW2AT6XujwOm
         gbw//8eHCd7NDeaPd8l5cfMjUwkVt/DG8NbY6kta3ZXzj03WsJY5B5uk5G/J0xVTrkxe
         vLcQ==
X-Forwarded-Encrypted: i=1; AL+hErE1b49hd5E2F46WsWTz7byKJOLDF9NPI/IK/HaseXWBiVSX8fF0nMBz1UfY/TgZY44Cmwy9p7beWHVm/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vBJFtPtKRU6FWIn7188CDwLUm21oAzRafFxDVDbRX2GCo144B
	kBG84wnxVMB5rRZ3I/ofALBfxMSC1J0LLkKT+EqF55exXHHDLbDNGnhdvPX77jpiT+Y=
X-Gm-Gg: AYBFou0vw8hXqY8t4KPsXl6RbJhTv0qXPFqq/te6yqWdvXZvvcjHqz0hLw1EgmO1f/i
	kN25nn2XZwCTyrmnA+JiQTHeKGJuXcvAoA8rTyvPLmlcNphLaYTHQDBP7fGDMSB7Ai6QglypN//
	uWSzTT6OgcIAKXtL/1qE3kk3HJlv6Tvj6BvijSlthLA10BlykKNr+ajntbrL16nphBxfk2kP59c
	7HbKqiynmNnNDCN5+rVkvnlf73/zQDpDCkRfnbfpJeaaJf3XFE6Wg8lb262LygDs9Ll+otUwsfI
	OuORalZ1YMHGElZ3hWDwVUNu5walt9/xb73VCgMTf+BOGKGHwp/aDz7uvI3jtVp0S+Oe7gh8MNU
	oou84+xYWrUot1NhgaVgHHo/npUqzAlSbv1trF6byiijSskTe5cKSDE0MhymkWtzWq2z0xKBuEF
	0wyk9TXBxhfnPZO/lz50CcLvTOurw3q4mNtaq3kCR37sBNBeDrSHrx3GPN7V/o16H7btS5IPFMW
	jmb7oHXqnAK9TTmG29SfOOcCrEOQz+PGzl7j+RngtnIwj814gq4MSOfdDLZKKMn04uqblLO24On
	ZMyWiuzG1Q/aumzcGdFqxLx02zPPWn5a7nRA77GM3YazcWRC6oZiX6E4vOqs/4PpPf66gDhxEf1
	c9yLYN8JH7U2KJ8Mp6LUyguGYMy8DrjhWfL/J0oX+Zn00JRJY
X-Received: by 2002:a05:6402:210d:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6b7c0c6f70amr9699533a12.26.1794903866141;
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:12 +0100
Subject: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
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
Message-Id: <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Va/ZiG9pLV9kgIqnenCHkblc6VfgP1Axc4rzf1uTf/VYu24H6meIDJzjF7cPq8pDHyZN9T6da
 Mb3xtpa7EcBDjzIwW6JQazspouxo37NOrWeZduY4MV8OdBzf5BelcoA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

