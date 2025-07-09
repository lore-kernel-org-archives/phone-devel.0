Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FBA1D63E4
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072928; cv=none; b=XxMrIdqhjwhjvBJv/BVbGib02wHWUs+XJU50El4Yczd3LPuWU5NFkE6cwyAniKLayxYl2i+a3D2MMhLTwXex/W0PdWusXsW6WCO5geHEkD0Gzp1vIv7/AImN+sJ3Rdp0be6FnisS1xW9oMlzKGwudUG0Zdn0njnJTcfcD6LO0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072928; c=relaxed/simple;
	bh=+2bfuo/XxdFtjNlpBnRSz55oWsfelV2bXIgIhY/HOGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P2Eo4/Y0L1GTqAwlO4cCuXfNMc07LqwezIgHN/z6/2gM9RGBc5DsKm9oe7sw4rAeD0XiX8ugjrpNvvFjnFTx83zscaIS6aicGFGBRP5awhdSj2EGFriu6kr2Bsv8tQsT+bZO+OjYx6ZwMHya81SRsafBxyOMWUOPVv7YU4tKLL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E1BwbKxT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E1BwbKxT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1811435a12.0
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072924; x=1752677724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsudQgPEXLO/8rlrHg7A+VcqH4UVc0XGQUOkZdmkbM4=;
        b=E1BwbKxTcKBCaV5Ij/+rHcE8p3g0bwuFB75skGhRurqQLpG69++LXi8ntlEKOZSY1i
         S5aVNip+/zOF0yFON+7v6uW/QmZUjR6in5NOtAwEo2YcLk95LUCBteD6HZ4EtbMlJ+sN
         LthDYz5Fe6VW3RDlMiNG0wC/d34MDA1fQpNWITEGQtf3XfQSu65mcQIHAEzOd3YKhUIv
         FHxt/+J9G6mPvm6I/xMByj1BmBCVE6yeB75OwzYdL72YkoLNo+AHcOej809fHjzMXUJX
         k8FvTVqDtd4Jtxutjwa39PJawUcE9Sdxe7Y2fEM7gRk4vTyPJV2VusGZ94a+5SKHDJVU
         LivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072924; x=1752677724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsudQgPEXLO/8rlrHg7A+VcqH4UVc0XGQUOkZdmkbM4=;
        b=pNUCiPP2fZ0Jexng15hwZS3MoY+1FeB8HhsDhMo0k2o+0eBSZqXMsriTVho/YFMqkm
         4WYYAJdxUF42AoOLcmo8+1JI1R1hF/HmJpxuyJc+7A8MRuziVitxQUuWNXn2Sp/nVm4E
         6EC8VaT/iL5mkJrqnTjBckzo18hMJoH2r+ISaNm5qvaEVXXOZKq+fHY0cxVAlY+Ise4h
         pSzR0ROrn13qyRM7z0Vq1K9TIC22WxR/41Q8GIyNgO1Vc6A477U+r3LtbBAQ/d80STwN
         AJQmk1YeOfa37Zx0YpELnMQSucY2LpGXatF0LZbjhIKDRecdPOFTnyLm4YcKmZnOv/UB
         AD/A==
X-Forwarded-Encrypted: i=1; AJvYcCXItDKivLV/FAjjkN8prXpj+WEGDpWK1ZK937OP5MpLkxcU92rBxaFJgXYzrF3yTUlaArSFFZlJVg96aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxANO7jNs8CGLC/894CTcdquNEaCrOm8DMq8snq3SmwVPJlPlBQ
	Opi56gISLQy8dwzdcSJuA/QjF2EcsHOy6hzbizwuWVBozz03iCl6/XtyNKMBPhPRcn8=
X-Gm-Gg: ASbGncsLnffLDAChMc1wOlC3k7M5IDoG4N0ugdNmdvuzOkpjoieY3jAi63ZQ5wHg0t8
	MZ1tj4nNSAroiIj3Bp3M8HiM/HKIaZAAMCd3mDagcNr09WDQW002iCc7EoHIvQqCzeYogOpFR9q
	ZHBp9tqkdNQ8qFCMhuhE/191NCXg1B/l5DlfbOw6hHNE0XOFPtQ8UoRi/T+BA0u9Gcx/DlM6Ygk
	ILoanQ4SXONFGR17zfyuuePB6P9tTXE4I+ixns3rfZmSlxawUE01a2jKZw60xxW2ieiV3/MAqkH
	A+U700G78Us+mM1wv+CpEnwFEUO/VSEx6SW0cHnUAijNxvLfATqDp5BM4opggdHL3rpTK2EX5gK
	0MRBY5GJXhxEX42nAwSHUBFL6rmIQsQPwqDopz+fzjdA=
X-Google-Smtp-Source: AGHT+IEJi9D3i6knXbAjsckZ7Ciww/QJ7BLM67HvKfXZJLKXPgCmFN58CA6mh9SyrO15bCmZYpI2PQ==
X-Received: by 2002:a17:907:3c88:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-ae6d1266a1bmr305624866b.3.1752072924078;
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add support for eUSB2 repeater on PMIV0104
Date: Wed, 09 Jul 2025 16:55:13 +0200
Message-Id: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGCbmgC/22Pwa7CIBBFf6WZtWOACtWu3n+8uKB0sCxKK1CiM
 f33h/UlunB5ZzL3nHlApOAoQls9IFB20U2+BLGrwAzaXwhdXzIIJiRTgmEcG1VLpCV2GGgmnSg
 g65ujlbIRJ2ahnM6BrLtttb/nVw50XUp7eg2h05HQTOPoUltltecKg+HwiS0WG7SsnjTxxqXFO
 39BK1Vdc6M6bnWbBTxJg4tpCvftn8w31L+6/K6eOTLkp/4o5YFTdzA/VrswD5OnffGD87quf4d
 lDUsmAQAA
X-Change-ID: 20250620-sm7635-eusb-repeater-0d78f557290f
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+2bfuo/XxdFtjNlpBnRSz55oWsfelV2bXIgIhY/HOGo=;
 b=xWvHS2PiKGx9o1Y75d8aHnX5JAyJpQ/n8m6U4OfOHpTGyPApAs6B48YmWcriEDLmsi3xk8qVe
 PPsYGLmQPflDDpV6LeYtlYy1puVL7D8jpEP5qSk6tv1ji9/vpUFkq2+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a new property qcom,tune-res-fsdif for the eUSB2 repeater and add
the compatible for the repeater on the PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Expand the dt-bindings qcom,tune-res-fsdif commit message regarding
  the register value in dt.
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com

---
Luca Weiss (4):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Document qcom,tune-res-fsdif
      phy: qualcomm: phy-qcom-eusb2-repeater: Support tune-res-fsdif prop
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for PMIV0104
      phy: qualcomm: phy-qcom-eusb2-repeater: Add support for PMIV0104

 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml |  7 +++++++
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c            | 15 +++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-eusb-repeater-0d78f557290f
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

