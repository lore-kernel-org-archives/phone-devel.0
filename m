Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C148527E05B
	for <phone-devel@vger.kernel.org>; Wed,  2 Jul 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471800; cv=none; b=Zi7sP8loEyp01tlDldqy9B5w0s27lLucD3yWqACE+7iCV8b47R+RIiKUTllSdxDETkFqF42z0oDVzeDOBZFEltIFXaAENa+ZQc1fPovgZ8UOXqbiWon8KHHnXBTP8mrj0qJtXp+rlVlR7TJgswrxpzpyjmS9v+2ZpBo7H2nnhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471800; c=relaxed/simple;
	bh=Gg3Ztw5mbV6LN/f/Ji5k38/KgNR5/X94oaYADowlyfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EVm776hwHsbdM2zU9F3d2A1BS6h34Qi09cYJ+4VmvndPxRewe68UcCBlafEDvQu2VRiRtv+VaXu+wkWN0oC0sXnG4Ud2/5xdAqo72gAfqHBEE5tr0U+pwCYHWNxGTpSRqRONiI0t6lM1hHrRdfHdDaIoC2B7AP8Aihbj7KA1y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cx82pC1A; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cx82pC1A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso7823508a12.2
        for <phone-devel@vger.kernel.org>; Wed, 02 Jul 2025 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751471796; x=1752076596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCAc2KTVC/KYVThbWt25dTqshZNAwmGCU6+3oetHyms=;
        b=cx82pC1AG+m5QUG1yiU/TGP+060ba7XsfTWmAlc9psG9McdkjaoECKhDm+DjU4KfWz
         Zh/bZi8Jzv4gj0+eHKJv0XyiIo3gMaD4FVzVjarKi4w641RlBor/Lrg/W1gkLEKEWXUx
         BM/xj2S8iQBYB7xZeLtqdNDDkvIWVCo1mYaoCSshGpnCx8piJYYWPmNrEa8AFu4vYc+Q
         w4KO0BTKT8V/VhCvAuYI3Mv1+OecEVSbGMHRqwNzn9e+5njwiu11gSxdDVyBv/92AIdU
         OPc3lfGRIXldsT2OZAjjfNEvuLjp0Zz/NJPW7EmoFfFPyHJGKJOlV96nxZ61y8jQmbnp
         N59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471796; x=1752076596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCAc2KTVC/KYVThbWt25dTqshZNAwmGCU6+3oetHyms=;
        b=vtmyT4EmUWyR5YHBgXTH47hQa3C1RZDoC1RFNWQbASNnfi10h6Tf28Q43rk95HZLQo
         y4kyV4ouzj+zfz4xQJNJN1322eQlWY9JsRljdXGShVtdieLhbiYMktFnjvSMzaPvpXlx
         2QZMvkKH5Jhn+vxe3Hs3d7/KXXFe/mQUfN5y6A+m+VfXMuacHVml/MH0qhCUXFbdZH9E
         GhnDHz3bskzNIRA+Xjn/xDuk1UosvpukJ3WCH//63FNlshR0LpVENTIdBi99gdw4SXT8
         MhbNyTk2iPiOBYG158OpOOm8m8j57fm+HnxqItroZ0F4I8ymIxtSPRSzIOdjBl+MSYQZ
         IUCA==
X-Forwarded-Encrypted: i=1; AJvYcCVu2UhGj2KaR0qiySQn4rVQSsV6dzGSmZo+kmHftpKBqq4c49IA94O+Gz3vUah6gKRTF1lMHcr3okfXgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/br+pQkaPQ5SGQoX8Lg0BhZRnJlbvwabWiWKzzS9LRM8xFuHb
	GiYlUgms7yC9poVXIO7Pbl/cXTywIxGTd2hqIHjJg4LJHDc7NOulpzMiSKL58RV0upNH2HcaKZV
	NCjJF
X-Gm-Gg: ASbGncsCsYU6e99CDebiat+SOxS+U6pNomiA4Qp1whR1ZpgH9DSZKhGySYT73OgpCZ+
	BwCteitOtibaoJNOSu7+xfEnVo0wmXRmo0fse1vW3dQ/eMVsU21YdzMNN3QqFAx6aqCIATxmXRH
	MpnSKF5G+afIEWJDJR2heb+SnST+RgqtCu6JExkvJwFhcIpyyTlbkDO9Qab7/IX+AQxT3nDIoNw
	mye8K63xdsYHPb1f2FqsYwkjug2Sfis57j5pIyf5IUPMuzjiQvB+rs6mcBk16/hEtYBFn7Y/bsS
	N+jOSuEJFMM241TOrEC5O42X5OnUagMY8cyKuSiyg8K0HwUuIZTgUVE/kOzfT2vjJ/qGWTJtLlR
	bwnGieOvgnMAU+jH4AbLKFGiF+AMbkhkvuxSdzZqFbfXE3wVHPbC2pNWPZ/IOH5quEYHtL8Lf01
	GeyIB/J9U=
X-Google-Smtp-Source: AGHT+IHXrZ5By/YIGmoOwxks5XDcOiTKWLCdtObMvsXO7AjbA2fZCsAU3x165zE/3s/lKEpePIpfqQ==
X-Received: by 2002:aa7:d0cf:0:b0:5f3:857f:2b38 with SMTP id 4fb4d7f45d1cf-60e52d021b7mr2841293a12.17.1751471796023;
        Wed, 02 Jul 2025 08:56:36 -0700 (PDT)
Received: from otso.local (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82909b93sm9151109a12.29.2025.07.02.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:56:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
Date: Wed, 02 Jul 2025 17:56:15 +0200
Message-Id: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9WZWgC/13MQQ6DIBCF4auYWZcGUah01Xs0LhSHOkkFAsa0M
 dy91KSbLv+XvG+HhJEwwbXaIeJGibwrIU4VmHlwD2Q0lQbBheRKcJaWi2okC+TMGp9MW2ymTum
 mVSOUU4ho6XWA9770TGn18X34W/1df5T8p7aacYajHTR2nZK6vdmBYpi9w7PxC/Q55w8FF3fas
 AAAAA==
X-Change-ID: 20250620-sm7635-pinctrl-9fe3d869346b
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751471795; l=979;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gg3Ztw5mbV6LN/f/Ji5k38/KgNR5/X94oaYADowlyfY=;
 b=QBFfi9v+fdzcREV4KRyqPt7V0s/Wzvd6gSLuSqnD6tQpuUCQcoANwHrXEuD7fsiaHVXr8OTSZ
 rqtj7W1yVuMCAPYLDcEv+iu1wcbPQi/Ll9GhXRJ0eKtc0B1meLKGwzG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the pinctrl driver for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com

---
Luca Weiss (2):
      dt-bindings: pinctrl: document the Milos Top Level Mode Multiplexer
      pinctrl: qcom: Add Milos pinctrl driver

 .../bindings/pinctrl/qcom,milos-tlmm.yaml          |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-milos.c               | 1340 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pinctrl-9fe3d869346b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

