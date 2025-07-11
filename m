Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CFE1EB5E1
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218932; cv=none; b=Sc1pu3cGAYl2m8LtvHuzfpxkgR3NLzrHiwruF+ppFF5qBKdo3DdPkxlcSrHMUNgNOMmychxvAvQYxLBlsNh/y1NzP6//Ljj82iAu3EXohODQ5r6X96Zs0ulqOaxNFyf0B31HXSSStzFr3yZaZ3+t6pyzvJzA7BHGOBrPKdg+/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218932; c=relaxed/simple;
	bh=5OC6pNsGYReu9joXH5h7Rf/JTtrwn+xwy7Hj9WpXny0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=diWza/qPHvJaBe/cpJ7dxTm0yKmxiDsQgCTtXDkZKVoGuG2SZrmMP+5g3Lh3TsUOr17rHVeWkB2aTrrgnD5Zr30+Q4ROd5F7KwfKEABuxiW95A937buuo2QqJKQW1uVh6Zkw0Gn2FxKR4kJRKb/KVzOgZzeHepWyDzzydezOvGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Eqbr0wAD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Eqbr0wAD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0df6f5758so323110666b.0
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 00:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218929; x=1752823729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5Djg5nQME5vYcmqvKhQyglqok2nNFSKPkcFvGfQlWU=;
        b=Eqbr0wADPS+ux4wCPZ/91HAiOBohYE8E0LO8kfZwj6GY2NaqOE37zHke2Gte/8OeXd
         dBwVAkA2KxAYQchsGQ0WKgESwI04Odl0gOnvuD5KIILXRR1g+gX1EiEGh541nTTJ/VCG
         hFoguoF2iV255yUTc8HqzabVOc/jFDrb0OP3nBNNV5F8378ZX5BAw4hG/3WIxVS1ELXm
         Ff0mSV7mujU/QZfRjK2AS2gpA6+PfqEFRDd2eYbnGMV4GJhOwPwKF/3sijdB6To/kG0o
         4GQgagXkZe5tt+KcW1IyZSIwvu1j/TFpNPpwT9fuiwi2NOOVbT37u+KqaAG+KPPt5dDU
         dcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218929; x=1752823729;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5Djg5nQME5vYcmqvKhQyglqok2nNFSKPkcFvGfQlWU=;
        b=Rig4sHlyFRHYA6nZi/UmDldjPPD7afSZyWBheyyyd2sWwA+mb8epTvoGIJF5+UyFVm
         DW1nvB1OH8LGTjIeHalT6Lyoarczrl0cBXafkAAzJTyPvbJHRUCOCA16tMbjn2A7fC+7
         M9ftiZHj1ya5cYJ9W9HAlznANbX1MHPJpp3VljwwOjLf98i4XOxpAy40TwKHw6GBDYfr
         e19fLIRqOpGQ6yk/C7lIG6nbwtFkpEBihTs2U2rOaKmMYTmHCm8hpaslnU2BNh7K/zhK
         QBvDVf0ovyiU/1NBVlcB1SRamdlRZSNgqk9qbfk1V2k6rXA6Y+nDhgIFK27kBCnB0JRO
         YTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF79X4gSyCjVO3JSd07ffonDoxw7k2qiyHtyyHkoy+vKIAAoaFhq+Xgspo5jtXYmHaMdSDa2KpIzUlUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxntpW/cSBNE+qCe8fZkowfVP9P0L9mm8IJxLSEqvm5OYyNFPb3
	Hsu8mk5hhwvb+udy3bOVufLRq+xirdWouZrRk1llafV1mjxRiuoRJGtOopbcvsRt3t8=
X-Gm-Gg: ASbGncuKm2eUvrgHWNfkwMAQUFvtt1w3Enl5ZjKRmVNtyQxzfL3Q58HqVkbLvn52QAg
	OnOKpdgmuZO2akqtL4+ZckAww4JbYdwfdif4UGKG+CljFNsEDbmcPusbmapvrLB2PdxuA8Kfo/7
	JCpQoP1WyxtRVoYO8S0Sf9qHpYR4VQ9cctL7en/+5J5YUdZVjFLN4LtJ2IjlU7BsLmC718ZnBLa
	+9TAHMwyBnaQXm4ZSO4lE8Bo+uZBbbfWtIaaz43YA1/3XpA+aSfTCB34+wz341HC/PBBgYw99wT
	M9xqeaFSOmoJR/iBuTumsiG74pJAl2aOWBHDggJc/euTAh/OTfl3Kb95Juv3yhDedeecuVOUihU
	7RNnty9NcUSxPZBSMybhL9t5xWfbOOJSHaRe4MYyEtyd0FbULu8vaVbF+Y3WzT6QhKuCY
X-Google-Smtp-Source: AGHT+IESgHYrJC+OdzlgHSAzNOcP6fy4JRfSY2wbcPvJRMMY/vEnmKTinb85fT9gtTl2Ni2GigiZmA==
X-Received: by 2002:a17:907:3d51:b0:ae0:d1f3:f7f4 with SMTP id a640c23a62f3a-ae6fbfa5a2fmr207016766b.13.1752218928862;
        Fri, 11 Jul 2025 00:28:48 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm252600966b.4.2025.07.11.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:28:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add RPMh regulator support for PM7550 & PMR735B
Date: Fri, 11 Jul 2025 09:28:38 +0200
Message-Id: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACe9cGgC/3WNzQqDMBCEX0X23C0xsv705HsUDzFdTQ6asCnSI
 r57U6HHnoZvYL7ZIbF4TnArdhDefPJhzaAvBVhn1pnRPzKDVppUrSuMS0OkckhT0YgSF4fCc0J
 Vq7ZhGivTdZDnUXjyr1N9HzI7n55B3ufTVn7bn5T+S7cSFVoztjxpJtvpfjJeogsrX21YYDiO4
 wM9o3hXxAAAAA==
X-Change-ID: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752218928; l=1136;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5OC6pNsGYReu9joXH5h7Rf/JTtrwn+xwy7Hj9WpXny0=;
 b=Vh8dM9rS4cRJ4mw0SRv1GCJrTOGSf2g2lykF7iWN1GB14UZcrbdwfr4dbRRoizqR0VWLy31j+
 20lVoDCl+ltC0ieh5zYxgD77yrYkZLaMtIC6utCzZk7fPNhzx0maYV9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add support for the regulators on PM7550 and PMR735B, which
can be paired with the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update pm7550 ldo12/13 type to pmic5_pldo515_mv
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com

---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      regulator: qcom-rpmh: add support for pmr735b regulators
      regulator: qcom-rpmh: add support for pm7550 regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 35 +++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 58 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

