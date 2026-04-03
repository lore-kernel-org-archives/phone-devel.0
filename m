Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A002364EB1
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224519; cv=none; b=F3VBcPrB4PYUwN6N5CyiX9Dkt1pDOiQFeeiKLaDtbfcSdLzuD2QMgT3tcpXBFtCRi5qaYx82sBoxLiYrEO9DwJjoqVuZrDuVPblXMiHk9hH+2RHPrsoiatIAyHQiNW2Q3l0T9vDPcdJEZJ5ZDwWOg/5MlnHWPvwUMwQoSRWTzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224519; c=relaxed/simple;
	bh=BF5TJfTjAHAamhIZ3z7tthOS+Ma4qFWW4uI2TjjrfiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sRzPul6CWviJ2HLa4vPQWfAT7CYNWY2TRcU9Ta0A6JL2cZT1FFJ2TAYdQj+3IeS8QUdbmWtNVeH7Vwuyekf+ZjPzrH/necYnbxsd9CiTdjP00C+tJ67nHwd32se0JTDaid4XcaU54rpDI/Uh1JY4nejOZvHjKqSfMeADa41+BDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zLJfnmrd; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zLJfnmrd"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b982d56dac4so340192366b.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224513; x=1775829313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=zLJfnmrd7IwQH6jBIst/CazD9GSOjzcGAuig9yuWw1DOrhayV6t1lZMRxZqpfYCnMA
         2QKoIFcFmROJTgiDrucvnel4zQwLuBBv6EtVrR68ODcmMyXL2ZbVOzv2o6EEHoc3FuNj
         K/Z2Ve0zOat0xTN4zbDwhf46fWIugfUtReye5Zt2csFDp0l10y/0YaQZFrnyqVA70AiW
         SUVPLbXqPPbbPJJnnQu9+cq0xLWGcMa9CAAiitDdVd12Fvb/0qSKOUkA1HrfqsiDBPgS
         eg4+6MqRCqR+qSOxISzdXoICL7k2ex/raLt4VeLyoIlCyElFn5XS4f8EBJAUcV/oLO6V
         zdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224513; x=1775829313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=eH1ea+oUspv2GVRZIU/RTv/amr2ZDriT7SAkGfK+Xx9CGkRFf2Cbhx3EFOZ1m+1Le1
         Rdg6W7MdJN7HTDvby/VGto4Qk3vSbX6wIZ275gFsK5gii+TqpKHK4fHRk0Lrug4hwehA
         uQiq10/IFM8x0SEqfmlTgR7o4UUhyw+4Gd7NZ3QVOMU5OVNDPrlFwI1j+Qpv/p5cZtZ0
         Zj9BywCK/e3iPHGuQcbxUj4k/ZsXAH8ewQHRwbLx+qpCqWDsoPwIUyTrpEVhRYad3Iuw
         xfx1t6aviDGSxxphdKE/agE1pDwt5rrbA7jOnVZZPTW3Kb2oBkQcAoX13c48yw6DcOFM
         fn0g==
X-Forwarded-Encrypted: i=1; AJvYcCWFG6Njc31j3hEmgoovu7Gozo/A/2AMTqAZujjqk/aSHQsgnA3oag3bgQfa+5B/H50o5NIl9Z4aG8Cn4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz542ID7xfDbl1HxCFlBbvhV0VRDJEr99e2XSxTBdKqQlK3Op2P
	NoUjYuUcAZA1FwEbEBixStk/hOF+/YQ+zVloy5RwnzeOJb2Lv9TtfCXcbEULtHGSYm8=
X-Gm-Gg: ATEYQzwI+xD6Yg1f5rJ9RZ8x/iCZQbLNINnUCAx9wdJeREyT8gVyIl/tcl2Mf1OhYOa
	N/lBXh17sCr6tekTAgqhV9eIsX7PfJunfJwZIrUysoUVP7mKNN3NEK0MIkYboUY4Z5575p6rvee
	YcpvJX05r76ywRW+9/UhDlvRd+9xNpBAhcWafDbmtxeg6IegCNcmlIcUO9Kax+8NXvsWMl7Rr5F
	Z+Ntis9mbORMkDqEf3JFOFT2hOj+OZs2UwMjGllNLAgnWmQthDiBSFKRL5xHuuPeREYOIarenME
	1/4pD5oopLYBCUJk/xwhefzLKMre1tOkh8raWaYkR8GNECgqys03IGvZKTIubh/xZBTha2TQ79N
	pyZBlxigC/KOQ9a48O6vLxXr9AEq9sfMmdzs/daXHgZGehzdkAiOZq65953PvmgaA1UfaWAM2Wu
	KBel2GoTEPa6sPHwm9IzlRxeJcn6KJd3jNMw5IsDJv6JyWMwlCUU3CiRntwYExEUWtMKJ+Ffsbk
	qADC5GQTLffnvsUCPBY5FRAFl5HEUCeODjnsw==
X-Received: by 2002:a17:906:478e:b0:b9c:69df:4d8e with SMTP id a640c23a62f3a-b9c69df5f1amr156882866b.25.1775224513349;
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Fri, 03 Apr 2026 15:52:46 +0200
Message-Id: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBBFr0Jm7RjaIFVX3sOwaOtUJhGKbUUM4
 e5W2Lt8k7z3Z4ZIgSnCuZgh0MiRfZ9B7gqwre7vhHzLDLKUdSlEjR0/fEQ31GgSvtkxSum0VkY
 c6Gghe0Mgx9PavDYbB3q+cjptRzA6ElrfdZzORU9TwjVflRJ+Qssx+fBZfxrFavyZHwWWKJWpn
 DFK0clenOYwtL6nfd6AZlmWL7EDcifnAAAA
X-Change-ID: 20260116-milos-fp6-bt-wifi-22faa7b15e8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1518;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BF5TJfTjAHAamhIZ3z7tthOS+Ma4qFWW4uI2TjjrfiU=;
 b=ednRrit/bAoAzVhkyGxL0NIrpVGJR0/5C62DiVQLNXJsmwqOGJ0X52r5uAazLmVy1hmNy7lOE
 ooCDQy+mLlJBCy0nu87HL3O/iRHxdVPR3Q8pIcTIF19ewqq5MrpRoDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the required bits to enable Bluetooth and WiFi on the Milos
SoC-based Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Drop applied pd-mapper patch
- Add compatibles for wcn6755 with fallback to wcn6750 (wifi & bt)
- Rebase on linux-next
- Pick up one tag (discard the rest due to addition of wcn6755
  compatibles)
- Link to v1: https://lore.kernel.org/r/20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com

---
Luca Weiss (7):
      regulator: dt-bindings: qcom,qca6390-pmu: Document WCN6755 PMU
      dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6755 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi

 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  10 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |  16 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |  16 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 191 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  74 ++++++--
 5 files changed, 285 insertions(+), 22 deletions(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260116-milos-fp6-bt-wifi-22faa7b15e8c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

