Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36734EEFC
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603218; cv=none; b=MLMWZrtbn5gB6byxQjvOArvUT/inhY4pvARA9fCWwB7BB1fxm9BN4wYro18rNA0u7SnrVm5GP5er45ercEfn7RXVczx7Re0MbXJcX/YZwt73gN9jqfxCLODPT8KYhRM2EdJUw91V4OPaNOnj6z48GgD6uFbmtAaGtyuBIrQepZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603218; c=relaxed/simple;
	bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmJ+sxnlmgcYhsBbWnpo+U4KNZ8p7JttxClvDWYenKShjE72tO15ivGZobNUOJTTWGBoPoWAiDh8x8cxDONO+RrXmqENAL5adQNK7v0V3bN9Oqxrqq98cXG+QliqiE3cHWXXi2SeU873g2QfClF4QG+BEpoky23Ym6LRvnxXsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bM1AAuD2; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bM1AAuD2"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b88593aa4dcso743603866b.3
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603213; x=1770208013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=bM1AAuD2KvXogd5aScJ/QmkjU/l7uS3WAfQbGioAUERsUe9UDXyHsUHajfaqFIXo9N
         4Snm8sCVXNnnYfSKUahtMhzGkAQ1Qow5mkWva/H9h1t2utCcrnrTZbPdV61XRcO28Wje
         t2Wv+Zc5wI5Nj1B4PybxafeLrR9VjQXcPaV5aYMM0skZOn/J6g7fEPBruPxy8tyyPV7U
         M0WFhhxqjYThZlPXApbZcx/XeUy0u6/OMJhjnVsHCb5CPRZ3AXVm2ygoNnummgg+44ib
         H4ZBwJ1lTzrXTLh4eUe38YFisgowgXU6zgnJH14ycxGPgbph3A1elBe1iynh2EuCmcQ3
         6pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603213; x=1770208013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=DnP1wr4x4xJvyuz2szCDaSUhtSQUV1+v08JlodEQ3+zsq1kBsygd71RfuFIjfp05x4
         Lnre9+qwULirzn5MTbz+9Z51ENpKtzzNj7/s23zWLGzW2AbRO4NFI02MJ8v1gXkJllPf
         wNKOS//ocato9gaW5V91kY1n9CbeSlEU7E8TMpprNKwQv8PRefZ25m3Qfq4ckVz2ZCw0
         tMbx1vYS0l82ehDR25rmTrVUmV+ulYTTvzFuu7f609HA5k8G9gX8vbDo4o7IXdYDGc7A
         cvjNsATRxDBByGdkB7Vs26UHnpXaMRnrhGsI6OZmXrRQq4oqd/Z4Xfj0a0D2J7IFoyeP
         zT0g==
X-Forwarded-Encrypted: i=1; AJvYcCXFHFllgE7KRtkY3V5QVuc8iDvcBcP0SJRg81TwXJ3ed5EM33AjKZmHuZ05ql9Q2fu88RgEl+zCbYHBdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBV6576twv40AvPANGbzfpcLBacz4V7VGYeuaHTdJRxdkEAgM7
	IoajbgseyMqFrgb24nSOFWR9tZ9vhLdSzUFzzxXQhNOz3S4wQ8KWeE+mO4EKd3easEo=
X-Gm-Gg: AZuq6aIdDZMFfha4uOctJAnF8Sn3LUBNtS1x19oWAANqrmYXK2RyAT/B5tKCZFd9ZS+
	G2qRyCongItDK0eqEJ79Rr0wGeeUawii6l+ap8N0GbDJ12EaX19r9qK6FrBQfIEy1ZflwdnnZc3
	5+ewYE0S/zhm76ERxXc9V58oJWPfSXoHAnWlRvniY8nVaytwuEapH6RbMq2XNsqf3HHuzjlR2k+
	lb4yU0Z0XRCNpcSkzceW70y3D6wvAbpbxmivLg9PFutzo4o8Ea5JFqx2HYXoByjKRrU4W24G16t
	M/9NqA0FR6N7yZLwOGaMlhXPTowh69sqvzm0PbWUiqkIfzNceMFoMl8BvS0ZFZAeThmH3w+zYog
	+Fqu2EbzGK0K3U7jUAVnO6DyNUpVecg8ayoonFoXiLRC1o7t+rlZyrCs+FyOsd7ZtYinsBIHinY
	dkFizNNnTw5X2d/gEac5eKLSjIJX8ZC3amY9+SgbXSAIpnyWs4e23QJQ0QrUxakGf9Lw==
X-Received: by 2002:a17:907:6d19:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8dab346cc6mr391601866b.33.1769603213084;
        Wed, 28 Jan 2026 04:26:53 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Add LPASS LPI pin controller support for SM6350
Date: Wed, 28 Jan 2026 13:26:48 +0100
Message-Id: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQM4muEi1KpxpIC40IorsnL
 d/i/wcyJaYMnXgg0cWZ91igKgFuHeNCyL4YtNRWKt1iDrZuJG4H47mFgJN3o/E0NdYoKNWRaOb
 7P/bD+37vl6xUYQAAAA==
X-Change-ID: 20260128-sm6350-lpi-tlmm-bdca4deb5641
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=1773;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
 b=UsE+EyCE2pBBQZcFymi5Q0PEW7r/CykmAv6cAEboBbsuABg6FyiTEFpjDDYFfyMV5kqMeo4vV
 FWV/6spJRJHCmqCx2acLsST+juopXH9Pt4zcWzBt6+IF99A/YA/J0Ny
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Introduce support for the LPASS LPI pin controller for the Qualcomm
SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
in the arm64 defconfig.

The custom slew offset for gpio14 is described as
"qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
some reasonable solution to have this handled correctly in the patches
here, but suggestions are welcome how to improve the situation. There's
of course several ways to implement a solution for this.

[0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  66 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  20 +++
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    | 149 +++++++++++++++++++++
 8 files changed, 372 insertions(+)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-sm6350-lpi-tlmm-bdca4deb5641

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

