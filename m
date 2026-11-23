Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443957;
	b=Z+j6rIaxr13483zQ6qSE8IRopbizS+vIjaMAnHsxcdzo97Pa47+4zl4OWdM/5cdlZodA
	 oV7W69J1NQdP3bPQxpj5nBrCKSTIs72sz+YZ86IiSNcgixoOgtFZu3TE0sANsV+Jo70J3
	 7XQRlxni7eJgjrhOIT3ReYocqja33XMBFmclNvl0Veehs6K6XkqhRqHySLWXJdmi5i3g4
	 SWzGjnyM8Dtn02NH8UNzJ/+XxgV+7cO2NySSeJxTNscj7iKosYF/ttXM65/2959+hzl8B
	 bB37/qiXEafTTdY0lo/KwueK2Hd09dqaIiuW0yABFQLtdOtg886qGLOw/b53ojsuCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
	b=aLc6LtoihGQvfn+zdUvQ4wNmgDZUcQVFcd+WtDgUogR7dYpqB5oM9yr2GLpX7/ER/DAD
	 Xxs64n2gm43XzaqcoH6Yad2MeCs1EmSkXICFD8HL1DI3M+8FbWKAKPL07n+WgeO5wePlB
	 Vyr69QQEKchARADLtLaL4PPwwAdi/wTAsqDrt4vRRm8crWh/FKibmqZ5dw45UOy1uBNAE
	 FuJ0Ego2OgVqKR+mC4tU7NJXaTCl8cJsyA5DXaqtAfdAVdKqIK+28aEEUMg+RCdq7UzE4
	 bDr4EiiUgcWX84v9r+4zLoDdo5zrHHNRDs5QSfsaZF2HNj4RcBFhIM7dEAQS2PdW/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6nuidiG;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08643606A31E
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08643606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6nuidiG
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5188e4980fso65863266b.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443955; x=1796048755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=N6nuidiG+5vQf5rbJG0/ZZfSA2H5qTBRj5x8gfftXQ+FifN68FFoSAnREczQihSB7I
         4mEqGLi6FyO4HCGknJJSPwjJRDTQJ8GaV2bR81cyt8zHv3IpKBWavSMuZ7fMwq9EXvR/
         THT/7p8jzu3qblI/XshVDHBwxvpZwFmLKLUodS+41Jlm1SWbV7aN1/mCpBsKhiSJx4KT
         vfuCrR8nXJU4P0mWCN65wRo4pOgpiL4yZo9JrXTmtQOJxH8HExQyZoeeHRO/q6wla2/5
         okCOZz+c1/7NbQug6TuG9/kNcQw0TqxzyUot8l0W1FCELUJjZWC5VHm4xLwiFMV4/WZo
         QHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443955; x=1796048755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=H7vgjgc6vCwpCzl1EhFBrUx54XhdhJefkR5mDXwZijwBiO+NuIreDcEHQApFDHAWdw
         hyKyD3jS4p9lgRxGS/x8V5XFOV5MVxfysPOIT63v4YkD2t1mSEOmmP9xuSRyec9KplQM
         W9kBAt1oST5TuTNMHhqXhyA9n/e4SibRKT+o7i4zzZJu02GluW63SwmI8JnaWKMTuwN/
         Hqf32rPfoiEqYMVIGJ30CMvPeEfE/Es66/P5MCg/1+Jn/+64zrUxYgMTuyNcCbENPp6D
         rGvAHwd9jb28Lr71I/E87fwAj5/4Mx7uRATPiy9LvbWyVe69mgyWOPyvRajOet519jzd
         +GDQ==
X-Forwarded-Encrypted: i=1; AL+hErFEfR+u9EBnzk3eblsJ/4by38rdO4b2vRKJpPNWEPTB+f8Z/LkpBrxl40TgEXUs6lRbdKO+g+2FbgbrOw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n/RaWDUEE6pPgTZRf7l8a+L4RJVbjjvcvZa3Pna7f9n8pEE4Q
	iZbyyb73Gcm8v89TOfYIwYxBNj7JaNrU2EG4t3H6DarOtoSkr7I4LqfKxoY7WN1SvsU=
X-Gm-Gg: AZFdTZes10VLCVNl1DcYPyTFKi3vj4W07tFvqsFJMfz6gq75gfFDFWDGSwTIFAoFtSm
	bjfQGmbVxwSCFcU7Fwki5XAYr13zshkGGT3ex8Ycr6RMiLmoOkBDIiiUiSSjvGhkT/dS7jKMoTh
	EqdJe4azPKVKLFuUH3Y+mH/RU/o2G/ManWpYNIIwxvaxVPOApPXPKuP8cEHT+1oAPB+RvZ0iAo5
	stnM0VmPc/Pz7qbV77VAYchqwk6jOvziBrETt9Ko73N5rNPbuBP1jNm3KX/xw/LabqFHiNjGxDu
	WfWx3qApYY3M1PsPbdtZxBeUkGK2PekSDcVlw75hAOsVgiZQpYasNtvHAd71d31hKVHpavMNViO
	4Mkjg7brNHcKi7vJij5iRPtIb0E8cnbFBO3QhfbcJV8mBob/W8rCugY5vENqBJOfd0kTTtox57o
	wdzZxKG+GAsw5Y23tHe+pUE86obIJQfLxx6qHj4RW4OkeOBd/YoeOb4vLYA39hnCsR+pu8Jtp8x
	lVc281XYWLqUD2TWJCyCgmbJwXYxkxJ2eW69LMV19coN7uB6q6SM4HnX1IOXCI+kRU24t7Fx2BK
	3bwJhdXNcjL/uBmcEJv+DiO3gY8dHxngOe6HP1GKvuj7XWQhZAKmItNlsdj8bQo8z+KfN1fpkWl
	jU3LGG/stma9YmwbXFA==
X-Received: by 2002:a17:906:1c11:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c513ab38967mr715904966b.49.1795443955446;
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] phy: exynos5-usbdrd: gs101 PIPE3 init fixes
Date: Mon, 23 Nov 2026 14:25:53 +0000
Message-Id: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPFMBGsC/42NQQrCMBBFr1Jm7UgmBqmuvEfpoolJOiBJSWqxl
 N7dsSdw8+F9eP9vUH1hX+HebFD8wpVzEtCnBtw4pOiRn8Kglb4S0Q1jJUX4rhanccUscpqHWSw
 0xrk2kAlKKxB/Kj7w59jueuGR65zLelwt9Gv/WV0ICW24OGMldesfL05DyedcIvT7vn8BPNREj
 sMAAAA=
X-Change-ID: 20261119-gs101-usb-phy-orientation-44cc8f14f020
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Hi,

This series contains two fixes for the USB 3.1 PIPE3 PHY initialization
on Google Tensor gs101:

1. Re-initialize the PIPE3 PHY from the Type-C orientation switch
   callback when the orientation changes while the PHY is already
   initialized. When a cable is connected during boot, the PHY can be
   initialized before the TCPC reports the orientation, and DWC3 runtime
   PM is forbidden by default. Without re-initializing, the SuperSpeed
   lanes stay programmed for the wrong orientation and the link comes up
   in high-speed only.

2. Apply the existing gs101_tunes_pipe3_postlock[] table once the PLL
   and CDR have locked. It disables the high-speed RX squelch detector
   in P3 / U3 to save power while the link is suspended. The table was
   added in commit 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos
   USBDRD 3.1 combo phy (HS & SS)") but never applied.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- Add patch 2 to apply the existing gs101 postlock tuning table
  (PTS_PIPE3_POSTLOCK).
- Patch 1 is unchanged from v1.
- Link to v1: https://lore.kernel.org/r/20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org

---
André Draszik (2):
      phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation change
      phy: exynos5-usbdrd: apply gs101 postlock tuning

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 ++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

