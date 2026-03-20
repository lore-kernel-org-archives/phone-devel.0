Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DE383C7C
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017709; cv=none; b=kKMtZgMvNz1JO/tfIWbe5UOXxjmVOiFpki9nKEP1BLeZDXe4rD/PcKGfmO4DFWFuRQyhylMbnMYYK4bgJQAZW/q00wSILAP6kCdpj9EN73Txxeo4M15emLEnR0tsst+CFIG6tKcae+9jhotmtN/Jkc1/p+NC8Qwhw1pNApCoj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017709; c=relaxed/simple;
	bh=50tiwvglNxbyBlgetkc1oq4ZzZhktrOLX+44zsu45ac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BsIWohNupgf8Qrec/MMeeMGvDUBz9gtBqg1omqzljLpJjkYBHnMP4fiZsT+ng3LZ2mP2UrWrHW9qLCcaN3T+qjJSu7W52imVwoFAex6QJldzHPY2xz0YmW7LI/TSO02nfA12VvPutLwOcPGp1Ou+U2/JyXKRjfayzm12E2QMpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etT4EQno; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etT4EQno"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fda2a389so5275155e9.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017706; x=1774622506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcH0uThvj0OwbtgaciluWQ94LA2SpO28hcpjq2xkeq0=;
        b=etT4EQno7uKZLCNGCRlYlrwc6F1K8aLOv0nuP5w+jvRI0gk4H4G5BBcD7ycR4Bdxqp
         K2wGMM2OXjWaZ5PbRSXypfMEHihqNnuvaEN1jPDKTe7wufIZwlsWYfNQC1oX1nIjWQwH
         wiY3tvLCoItXGfFFdmpTkWXZo6j4fwWRNJIS0TopMdZtPRSHzuRkNFLqa0IfM6GuTR/P
         DJXEgnpMFtHKpV9IihiSa6CQ2fpGQqe+IZ0Lkgnzq7RvJvg/qH65riSm9wsRsFmXl08P
         TTJy5eQFk0eaXvCWe81eCuruZxD0lCBPepVuYCoitnLd60jfNisLMn+kMYegDqvdBiX7
         m3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017706; x=1774622506;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcH0uThvj0OwbtgaciluWQ94LA2SpO28hcpjq2xkeq0=;
        b=UUdRqrGIRzDOnZvPkvSZRrcxO/MVpRsZNiSht7gisD6qZY8yCbyApy7+mdP2y9VssJ
         EGwiCXaLkQvd9NBBBx0lV51QkfpS3iQGuz4wYJ0NpYPyLR8k+uo775t2XoXFs3lo35Y4
         zLfVD4XXigeAhLmRRVj93XtA/juRHZeXg6phfxQS9cKebZQgMTh32RH9V5dMutZolHpi
         zhRjuOxERwZyEvhn27QfuDad7dPcpJUyP1diRZh8MMrvYQufG+qcoUd/X5aXG0/vAvGn
         GCYGXxMG5MES1XYDg7QdIiNj57ykOefXBn1iHr6mWUlPukeIzpEuWV4zJbwXPKiQPlXR
         b25A==
X-Forwarded-Encrypted: i=1; AJvYcCW+GV1jwoFpOvXJ3Yf0eMpcQTm00zjBzKU5zV7Mzq3/K19+CQK/KRExFKnucM/KmPKK3wEbPByqdpXRkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Rn5o/F3tyW0f6TlObdSc4nWVtPzvVqCcX2FMK6cZL1lstb44
	1VJO2y6+n4p1OZNJVHJrC0L0yS/8wkn58r+zEri7WWcgIvwSIw+U7amZ
X-Gm-Gg: ATEYQzz+utGrIY1cQGfOrRX7zl11d8pnOPzFR3AUDcBDbvW38EXhmgUxP3YsAjyG0Lx
	SjT/tc593kZm2v3sgCBsop480muaik3rXlQsJRkZshXF19wVUCZiYGZKOvtkR+aYBL2a5ED8nTE
	6u3/ppFNwGzSFiZB7PShK2iCfMW3G405Z0NRwNwapOhaT3fYFpRE4jixFGtQKgPyHDO69BqObLy
	dSWYfvR6egS6PFVe5yX3L6DOiQQfaoaUvKjd8rnoqs/GDRFEYlf6Ca1JOONU7LPD/aJvPeuxYw4
	JrtTMu56Trv+tzhunVyuH+jfs2T9K5Hhwpf6dY1oQS1CZ190uN6sG7X/QxZXNnlMCvX5xMI7IZg
	ahDxGKW1ORwtUeXh6D/YZ3jfvc+IwzJS8ofmcQiCpqD9FGXtA0YA0aYwtCCuaSoeHl6yoPhch0A
	otV5zAkR15Ww/BEGZP3zAv9TtTwjsfU4KITDHsBi7oeB1IxCUW7TEm7Z/8WnLWHCM=
X-Received: by 2002:a05:600c:5248:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-486feb5d82emr55320655e9.0.1774017706082;
        Fri, 20 Mar 2026 07:41:46 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm130648835e9.5.2026.03.20.07.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:41:45 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v7 0/3] Add support for the Samsung S6E8FC0 DSI and M1906F9
 display panel
Date: Fri, 20 Mar 2026 16:41:37 +0200
Message-Id: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33S22rEIBAG4FcJXtdlPETNUsq+R+mFh7ErTTbbm
 IaWZd+9JnvR4EURhBG+3xnxRjJOCTM5Njcy4ZJyGi+l0E8N8Wd7eUeaQqkJB66AM0Ov9oJ92Wd
 /xkxVp0LUCMEwIMVcJ4zpe8t7fXvUE35+ldj5cUgGzNluscfmeUsV65JG6gMTRgNldLH96Wr9B
 87zwY9j/7JGO5uR+nEY0nxsguxAWWTStpEJ5dEpzZxj0mNw5STaVkGwiqxNnFOex+lnm3FhWxe
 PcbioxlkYBap1qzh0UuvYnd4Hm/rSxLAlLfxfzYtmTtkgNQuthFqLPy0Yr7UoWmEwHkAFcFhru
 dey1nK9G71z3IMX3tS63Wtd67ZojF0XteOmPFyt1V7Xn2BR66tZAZ5H0yK4vb7f778yoVBjZQI
 AAA==
X-Change-ID: 20260218-panel-patches-696df7e0d810
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774017703; l=3536;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=50tiwvglNxbyBlgetkc1oq4ZzZhktrOLX+44zsu45ac=;
 b=JsopaJdRW44W8oeIbtsI7vKkqeMl6iCEMEL6N6v+uTn8PqIzcMtEu1cQ3vLRaf8Vx7J9sMNdc
 ZAc6FAmLU3HD2t0DIm3blqiiyPdsam0HzDhN+d/c02SVtjrpK86HYy/
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

This adds a driver to support the Samsung S6E8FC0 DSI controller with the
M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
generated using linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v7:
- Mark as DRM_MODE_TYPE_PREFERRED
- Link to v6: https://lore.kernel.org/r/20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com

Changes in v6:
- Rename some identifiers to be more panel generic like David asked
- Link to v5: https://lore.kernel.org/r/20260317-panel-patches-v5-0-ef99f7b280da@gmail.com

Changes in v5:
- Fix typo in panel name, s6e8fco -> s6e8fc0 (zero -> O). Was like this in
  downstream, but in samsung website it ends with a 0 [1]. Found in [2]
- Link to v4: https://lore.kernel.org/r/20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com

[1] https://semiconductor.samsung.com/display-ic/mobile-ddi/part-number/s6e8fc0/
[2] https://sashiko.dev/#/patchset/20260314-panel-patches-v4-0-1ecbb2c0c3c8%40gmail.com

Changes in v4:
- Use exisiting binding instead of creating a new one
- Mention dsi phy power source in commit message
- Mention only DSI controller, not panel where it makes sense
- Remove VIDEOMODE_HELPERS selection
- Collect trailers
- Link to v3: https://lore.kernel.org/r/20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com

Changes in v3:
- Make driver, bindings, compatible specific to M1906F9 panel
- Adjust brightness scale and default
- de-mystify some dsi writes
- move pinctrl for mdss into panel node
- Rename regulator nodes and names according to schematic
- Treat vreg_l9a as input to vddi regulator
- Add myself to copyright header, remove years
- Link to v2: https://lore.kernel.org/r/20260223-panel-patches-v2-0-1b6ad471d540@gmail.com

Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FC0-M1906F9
      drm: panel: Add Samsung S6E8FC0 DSI controller for M1906F9 panel
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |   5 +-
 MAINTAINERS                                        |   5 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  | 301 +++++++++++++++++++++
 6 files changed, 418 insertions(+), 1 deletion(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260303034847.13870-1-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>

