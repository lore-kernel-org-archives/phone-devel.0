Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A647026E17D
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564590; cv=none; b=XJEKTT/K2maqiEJ8tl2o+x3q4KCSCUbNOC9n+Mrl3A48dVB2dusGsd7OFhFv7FvEhuTQ0z07Zf5A8SL0z67cg48hEPxovsAYgdONDoLBPhXEonDUQMuXoQCL7pe7WG2cfRyIE1ew1SMwQxo+x412qpwLvkCpad1FV4tAgFOIr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564590; c=relaxed/simple;
	bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCu8SKGlsFQwNGFBP0AdAqGbKU1VX+CKzfpBjs0k1vgPKRYnv9XDbwDUb3zecnfIdkF8E1OiGb2znKRfBjtNKefIJLmsRGIZQgRJstxyMQWDVt4HNkw4L/LDC26KujXsT7Eo+dSR06Gba3qnM2EQVHT1FTOWNT8gdFkCGyDcoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=E6ZPNxYU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="E6ZPNxYU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d3f72391so50347715e9.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564587; x=1753169387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=E6ZPNxYUQZEUp2kfYTVx+u++gszDAwN5h1/4yViI0XrX9W+5a4cREaW3fzw/DlDexa
         ms5ooQ43n+UohTJTeNd7TBZNxrSAxHeaSazntEJTdJAbx3fuK+C1nk2YOv+nM/6BcvA4
         g6HCwh4iRCPOLo3TnornCSWtFYe3FW+4elQK8hz+dfeB+3cn0mJSWDfw1lZgOIE0047u
         pCS6C4SS1agIVmKUjjbUbNAfk/f9znMXO+HR+MyM9qayEEvT/9yBJbzF+dxjXm/DX/vn
         dQ4/hKbsiCs2jw304NcvXNBT51NeWdCF8KYfxiPAUOGTSOB919Z6rPN5wtyHjNxM7PB9
         1Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564587; x=1753169387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6fKdp/I3oAtJ41AZWsqTeQzY0qXnxN3fwHvXO8WXa4=;
        b=CZgajs+Y1HMsdqoJEn5zYiclWknX6HtzXAX/MucyJ2HCqXAHcXGZ0Iqhlm8FMVpbpU
         CuNEZjlSm178WwA6ezQFo7mhk6a2p9rT7QZ6JjWDEJebx0gBqyQ1p6mOXxB0HtPh47jU
         An6eqoYCfWi+ZG0S7qR2aZC6D96eyy72Fd0Jx3eaZmuYjHd7Txvh6SDbpWyYR5/XjIOS
         Lnr/soh+r2nhg4ngoL+nRXXGXo9AnKkHZXs8Y3WkQzFZorwvgaSuJF8y+vGsTvtf9nLj
         h81W/mMcE8R6OTncYnePmAmZzSvCLY+tvZTEj5wSvFA/UsjyXdHSyCBQ/gnV66mNBM7p
         kAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLUZXodZYPwnOvyXbRDq3Cte0B+R7JWONdNSP+Tdq6jTa2GpH+yzAPr8itxWS6z/9DXyIlYJvcdPzWvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XjidVqjYKHJ3L9odM9zo1e+9IrWd1DJef4krEF3t+oAaHcYd
	OJmP10Dtv6dOkMnPYTVsTfgUZAdzz8qXTI2q529qNOIh/5jpeSPocSDdF8qB4BKGoc0=
X-Gm-Gg: ASbGncuhsnKV0CfUXAlYBe3iTTiBu2bG9Q0lIib5Gcz5igoglXIu1hR8pGonbIWGpK3
	fXHiPMPOVknJLCASjyXFQWgELbDs0wzUQnIkANr+ywpdb6Iz90fyC06puNXx8Rai4LI6QW4BnQ/
	DJraF9otpjkN81w4b83/tuAD7B4eFLREcbdotXFS5GBD2PdqNxjFKhf0IfARrjOO+HiNK5r4a4H
	A2lVvTf1W3woiknvfqlk+KMs/2MBZ/p/KT/wN8U4Ve8zxm/jrfNf3aIX7hhgFT8P0sRgBmH1nFx
	dUzqfa5/m59zMguNHaCEDvO8dlvy5In6h/XPMCJatdm87Gl2xSxTRR+8wKGbfQP2bEz+94WNd4L
	dGftEKwDLNOwji5yo39s0AVWwMod7kvlCOKXg5xGI+efl1jLL6cHVgKU0
X-Google-Smtp-Source: AGHT+IGG5/C3xBwiXlZfBkTPzKSCxIpXMT5JelM0B6XvmfLgCo3iFhVlka1xI/0VqzDpufUqJcL89w==
X-Received: by 2002:a05:600c:350f:b0:456:11a6:a511 with SMTP id 5b1f17b1804b1-45611a6a7e3mr67459555e9.20.1752564586974;
        Tue, 15 Jul 2025 00:29:46 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Changes for the eUSB2 PHY on Milos
Date: Tue, 15 Jul 2025 09:29:33 +0200
Message-Id: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0DdmgC/2XNwQ6DIAyA4VcxnMdSUGF62nssOyDUwUExsJEZ4
 7sPTZYls7e/Sb8uJGJwGElbLCRgctH5MUd5Koi2anwgdSY34cBrEBxoHKQoa4qv2NHJztSUnep
 EddGmZyRfTQF7997F2z23dfHpw7w/SGzbfq36YCVGgTaVkQJBCKnZtVcuTNaPeNZ+IJuX+M+Q0
 BwNno1KNoB5pEL4N9Z1/QBi9jRk9gAAAA==
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1471;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fbYN3aPb3XXCiKQcnuxlj3EeuZKZPuonSYvZ100x1TE=;
 b=Rjj/7cfLdOoBVZeq1Uex30CfHl4mVnyxTojkjaBXB3wvxI+1Sg0gPtk3KypHpCgYRDpZMiCTv
 fBxKY9XYn3nBqH3/pWsaQOIzRV1+9BRmnl1PtkcifgHnhb/tPXnWY7h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on Milos and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Make "extra register write" commit unconditional for all targets,
  write the register directly as per Konrad's suggestion
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com

Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Clarify commit message for "Add missing write from init sequence"
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com

---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add Milos compatible
      dt-bindings: phy: qcom,snps-eusb2: document the Milos Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Update init sequence per HPG 1.0.2

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

