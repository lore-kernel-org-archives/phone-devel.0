Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF0322550
	for <phone-devel@vger.kernel.org>; Thu, 11 Sep 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594631; cv=none; b=kPnuW5oHIEcC9mV/RFDv/Z/jLgtfnT2ivyfnGL6ZBfxw9p1N/a3HD1ZkpSvvA5FS5v6I9ZTZJxHRooQXI6nVMW0JIgLfsr7EA73gIpyxTz/KajUOdyPQY/7Iq3sekiGxmLZ0PYKAhJ3fdAKBH5SegFtnOQnxnYljPKNSxDusTek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594631; c=relaxed/simple;
	bh=yBCaFmppglJhLccQJZKQZw4xpkp6mRE3c++kCJrg1T4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KmgbCOeQuNgKBAhNzBU9ih1hG+4PtEgU18j625NmqRK8nMRLIowd7VvT87Hn9iw/0G8bNLf/zQh1DE+BiHD59OBa70UKWThakMAQ3XfATXIRUI52x9od5/tWlpOj/CGbN/16HyjRxg0+DCMxmBDkyoz6NKqc6qknSLgu55cNWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC20Iulj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC20Iulj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3df35a67434so490170f8f.3
        for <phone-devel@vger.kernel.org>; Thu, 11 Sep 2025 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757594628; x=1758199428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cxhDISSO7o9GdiN7Tbrubbnu3jZsi+4r/rV2Buvoow=;
        b=cC20IuljYqQV2E1OVFiHD/bavQVqW6fQtfzSVnsXI0do4A2lh5Y/dRd9N66jo6njWg
         ehE2cQm6UqVDG5U2puyU+DE5eVQVLtPu8609OQ31oGlxyLxyZ1Hw8CrgxE0tGZps/Rmx
         FTvMGnxjiFnCFsBGG7DpR60TGUcvceIbxzcGeZIEikHJ62huB9aX0xye+ommjVoVIM52
         RLflMkphUWMpgbXW4TMLQJUnSKkKkUAzkeO4b3TSafPJy49AwLqhzTk6Wg/Pd6Kvkcfg
         k/4kjVSmtM1SwNmoR1Wej6x7Mk1V48lV1xPSk0wI2BbylnOfSzHQ0kPiaCe+emJOXL9C
         n5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757594628; x=1758199428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cxhDISSO7o9GdiN7Tbrubbnu3jZsi+4r/rV2Buvoow=;
        b=nqCL/RXPfk3DhiFnLuitOQIsaJdWTnVO/jdXWOBqqd68if84cTQcaM+/T1iGaSYOal
         kDfh+jjjENPYVpwQ6w28Uyo76Cw6gXScOkHFXT0ohOLCRuuiwX/RnEt/wUmfCwzWJBrb
         a5A9mhQwD7NfssSFLjx0QhAvDRp+deFamxAzNscOUt8adrID6uDD4MLYqRdyX8l9TVnY
         QlMv1kp7lAjHZL0ufOSsIOvTJfqHPLhCsT1X0YffAaBdOo6et/wiHX+oQWdJUqdU6Bps
         +jiabYMBrfIJzyN2EXnOR+pwJXQZ11sJDNxrFJJeSUKCHAOEIlQK3i42+h45onz3/STX
         8miA==
X-Forwarded-Encrypted: i=1; AJvYcCUffS7migyWn9EcgONxJrAQoq4EqJw3uNlnOpVvt4L4AYdDpnlUeCXkhmDndyudKW4ljSvWQwuGBjepIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf8qc8GGgj3LzolBr4Ga1/4LggVBzuc81Q7FzmC925Ep4Xr2T
	AbO+3mgvqbFUXd+m6dBjoSlxKBx7rRMpWSqxUSWdlRqCfZNeBDNWA1Yt
X-Gm-Gg: ASbGnctU4GdYhCMAdx4VlgZ3MHnIuJyq58ZicInGk22iZw5IaBae2MryuZu+WmYVeEl
	fQ9ygfKP9ie6V0Zh66MMcHO9bt2PTEQrOzw99OD7inyKumPTOXhaC4XrVldo3Daz/4Zz4rUydrv
	CZ8K/MWDvjG4Pkge1CuDClAXmG569QQbEad7lc6gxRBcV4IKrRLYu1ViUREVPWQuBrqnO71JlnB
	0QA/jvj757YLlDH8KN1QqWI7pos6BdRijko7xC9YTRuFE/eXHP4EeJHEjCg0TTiYvp+2dD4rggq
	xrpmWRe5u6vpnozI5hgeL19oDQWrRVMnRG5huJHXACfcFsNHFAVuDy92TfoIz4QaJEadwi+XE6U
	w56olR6tAg9jr84+521WY8oFkTfey62XRn3caM6ZcrFAjUM3rcc6CWcRiV31hSXBbzKE0TkWG4M
	2a
X-Google-Smtp-Source: AGHT+IEoGaMrYGkJ4T3Yd0bCD2iHWWdU1nSheZhOJ5yRImg85hMTre/1891fZpRuN44sRaZK3S19rQ==
X-Received: by 2002:a5d:5f56:0:b0:3e7:5f26:f1ec with SMTP id ffacd0b85a97d-3e75f26f712mr2058592f8f.19.1757594627953;
        Thu, 11 Sep 2025 05:43:47 -0700 (PDT)
Received: from Radijator.localdomain (93-143-13-188.adsl.net.t-com.hr. [93.143.13.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm22591495e9.6.2025.09.11.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:43:47 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH v4 0/3] Marvell 88PM886 PMIC GPADC driver
Date: Thu, 11 Sep 2025 14:43:43 +0200
Message-Id: <20250911-88pm886-gpadc-v4-0-60452710d3a0@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP/DwmgC/3XOTQrCMBCG4atI1kYy0yZNXHkPcRGTqUboD60Gt
 fTupgVRii7fD+ZhBtZTF6hn29XAOoqhD02dIl+vmDvb+kQ8+NQMBUqhseBat5XWip9a6x3XQOg
 seImOWLppOyrDffb2h9Tn0F+b7jHzEab1LZmFFIELXiqBClGpkuzO3y5UhfREE4Pb3B9PNokRv
 5QMlgompZDGAUHujSz/KdlHMUIulSwpuRJgvXHuKOGXMo7jC9fpjug+AQAA
X-Change-ID: 20250827-88pm886-gpadc-81e2ca1d52ce
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Karel Balej <balejk@matfyz.cz>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=yBCaFmppglJhLccQJZKQZw4xpkp6mRE3c++kCJrg1T4=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmHjjCqvGOawPdf5Hv8CzUbgakLgj+5m3bfW3vGZ/37D
 /5uZn/rO0pZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiMk6MDNO2z/WpnZXS6OI6
 4+xRlrel6kIeGn3+h8vSrRaHGZsoLWH4p7O7UW1O5cPzGy8cP8hnLLFkvVXW2k1nF0uGZYrVX4u
 wZgYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

This series adds a driver for the GPADC found on the Marvell 88PM886
PMIC. The GPADC monitors various system voltages and is a prerequisite
for battery monitoring on boards using the PMIC.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v4:
- More refactoring
- Update trailers
- Rebase on v6.17-rc5
- Link to v3: https://lore.kernel.org/r/20250905-88pm886-gpadc-v3-0-4601ad9ccb51@dujemihanovic.xyz

Changes in v3:
- Refactor driver according to comments
- Update trailers
- Rebase on v6.17-rc4
- Link to v2: https://lore.kernel.org/r/20250831-88pm886-gpadc-v2-0-759c1e14d95f@dujemihanovic.xyz

Changes in v2:
- Refactor driver according to comments
- Add binding patch
- Link to v1: https://lore.kernel.org/r/20250829-88pm886-gpadc-v1-0-f60262266fea@dujemihanovic.xyz

---
Duje Mihanović (3):
      dt-bindings: mfd: 88pm886: Add #io-channel-cells
      iio: adc: Add driver for Marvell 88PM886 PMIC ADC
      mfd: 88pm886: Add GPADC cell

 .../bindings/mfd/marvell,88pm886-a1.yaml           |   4 +
 MAINTAINERS                                        |   5 +
 drivers/iio/adc/88pm886-gpadc.c                    | 393 +++++++++++++++++++++
 drivers/iio/adc/Kconfig                            |  13 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/mfd/88pm886.c                              |   1 +
 include/linux/mfd/88pm886.h                        |  58 +++
 7 files changed, 475 insertions(+)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250827-88pm886-gpadc-81e2ca1d52ce

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

