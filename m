Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F276335554
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409673; cv=none; b=LwJGhQbw6DbNvmoclssOnQFY46a8SHiIKHKAKC19wC8MUyzVaepLb6Nrvtn2teo8/fRdHSA2kmjJKqDsbLNEXCVWhPoLpMKxn4KjzJxN6DzAxiVz7KZWvXlWJGok4wycxjTjwcV+qMrzLJcA+OVYbgyjAixD2x7BJdSqZl0XaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409673; c=relaxed/simple;
	bh=Q3U+5k1MvoRdWNZqyqWnSS2ZPwFJtCBfEHKSkleJKtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rvJXRmAKNvagqUDNzpfLEO5Ca8koexGFUKC/k/iiDMrbRXndSTSKXh0XiQvPO2BVSp4uUrb90qYkK+hrcjrfv9NJOf6CLPEuyOPzteEol8RiU1KIQ6qhNQzfQQlfD4pLBkbWdZOizKBMvup71HZaZ2E4gQu63V4NN1Y5hzRaD9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yej2iAN2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yej2iAN2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6712fd40860so533981a12.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409670; x=1777014470; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWDoup54yGiZZn5FFTCb80LFjkN7Dfch2gvN3C5FWn0=;
        b=yej2iAN2TiOabVBGu4MF72oav8gO6COSCaEFnb2pMitC+FJwkZEkTDwxtY/V1/Hx61
         m5URZWjrirH8MjppvMOddIMiQzTMIbgL//Aw917PQnQCfN3joQC1y4fA/lrajFm4YwTj
         bT/wcfMmULtvI93dCECuFlYKepTdFu+h6VIhqbdGuxcBVS/5EoAZ6gOXJRb3oJHOmz2Z
         QzfXJ6D78yE7qGHUm97Sm90NzzzXB0/fRaUP3TkdkttGp/zED+DnbDRH2G0WCjhNPq1T
         cwzNp1DOW1j8+jKsnvzsFtV+PXFt1fnRRavco+u987WCttfdX3zfGrhiEvxTf5xoioRE
         hMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409670; x=1777014470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWDoup54yGiZZn5FFTCb80LFjkN7Dfch2gvN3C5FWn0=;
        b=D4p1MCtkCI/f+XdNo714T/j+xwLqy9+/k7KGfDIhLKs1yEfKrcAF6GORZ5HBMiKVTw
         s2KfoSiXVx9hGmm95FDbC2EhGmGrrpoh0ekjlO/czm0vTYA4ynyUvph5kJYq2MBbk53l
         esQCVIFYQFW4qSvJ1lxHI70Xs5Bwgs+hXSqQEEiBhz+PpeatjhJ5sMBltvdidq2cVnP3
         jBhaUvDpuEYrU8U+S5sywqQ3xzyYEMe6br2fkPn5Y5/3TH0ilM6+i8JmhhBTG/EKSXwy
         EZeXPyKyVL/I0xo9i2AHsZjdGB/9Rlgea+TH8BLl2oM+rA/6glvHau0wQaEjYZebAoPb
         Qdbw==
X-Forwarded-Encrypted: i=1; AFNElJ/nyboOFsH9OqDhdkSsCLoHNmWdbecS+6uQ0obhbaIEotYm5qkuWoTm6zbascbDdYvbKswXOOaoJmJCkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxErPVphbk4qb+SiWIrPpUmTrkHbUXeIAqeTnRN0oYiGNMTaCa2
	lDfw159HGwQHYJrNjNW98qXRykB0sCrbWnSnT9R8hUn+2eP5Gw6xRaz9W7tqaapQtfg=
X-Gm-Gg: AeBDiev7yoCqjcArcZBrpXxgcAv7lFhh6BUK3MDcui+MY4lfsmFYA/14eDmSWpIcfbd
	Zw4u7TJQ+F8hZD6alalegVyHttSmu7yQlmFPHX3J5A9+gtz1xlx4Wl+kzOBnl94KFGXvfH2c3jw
	ZRbG4KxDgTY/sltn2oSc9luTgpjUrtoFukeenRw79i9qL+B++670A2XYrWCvoy8aVJXGTfl4n2f
	mwceZxC2aGZIrEYyhSsOm/AdqnKtmZaxqke8bLUFtL0hdBkyqSaOUOiYHUZ9/YnomKNOgTLVq8o
	OsGQYTCP0SxCGUkuRoIIpnl8B0KLXltebUF1B+yOz5TY+ERJtb40qivPwQnVCROxW94cWPP1CMe
	miFN0QzQMSwMBF/if1vclMfa7JMfzsbPl+WpyAR/s4a9MIXQ4Bdob6ckdJqjWpT0EIvPSdadNAZ
	Pokk/SHcJ356rQljxxw+OPXP07BMv0/qGQ7zaV9OLiCCHVs1BAckdVU7jC6apjDQnCPtiz9T3tW
	HR4KF4LRXnHcRDRCvyAJqJUsO0=
X-Received: by 2002:a17:907:8e0e:b0:b9a:cb5e:5379 with SMTP id a640c23a62f3a-ba419171db1mr84163466b.15.1776409669646;
        Fri, 17 Apr 2026 00:07:49 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Add support for GXCLK for Milos
Date: Fri, 17 Apr 2026 09:07:43 +0200
Message-Id: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQQ6CMBAF0KuQrq2ZFgRh5T2MiwIDTIRW20owh
 rtb68JE4/JP8t+fB3NoCR2rkgezOJMjo0NINwlrBqV75NSGzCTIHFLI+USjcbxfmvHc+JHv1T4
 tZJsrgcBC6WKxoyWCx9M7W7zeguvfR1Yrh7wx00S+SjQunkc7Ezl7FQZy3th7fGgWsfFvexYcO
 EANJaLYlao4dIrsZTAat2EgcrP8EBmkP4QMRLnDusxU0YLKvol1XZ/2T318JAEAAA==
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=1290;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Q3U+5k1MvoRdWNZqyqWnSS2ZPwFJtCBfEHKSkleJKtU=;
 b=ItnCRFeepb3xdXIGRx23ePVoTpbsJ6cicQ7SXkETPWOcf6/bgmzgAVAUFXbGC8dnDknPIxtNv
 fqY038lsnThDHoJOTNJwKhswdIWVpMfu/JbcooXn+erEEhddbITdwvz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Replace unevaluatedProperties with additionalProperties
- Pick up tags
- Link to v2: https://patch.msgid.link/20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com

Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: f4d9dc7f102a8d7e7fa018ae048aa324349122a4
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

