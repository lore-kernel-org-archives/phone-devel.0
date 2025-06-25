Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C928751F
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842736; cv=none; b=cd/joVuwJYODtcuUCA8cOC/lk7zBv+xhO3qX4GTv+/GjWMNbfzgMav3MZeCkrs+38L8KjhSBdoSj9BayKJYsRhi2NE4H8VURIf7dDkB2a6zLB2rGhi7vz5t52P242FFNDcTEn2avtKJRhl8wc+hoe574h2jTIcP54T+Evj3A9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842736; c=relaxed/simple;
	bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mlndQxVSYyC3HQglBuMwy042lJF80HlivntngAVoz+dNzQeepVYFbs5p2wOhFAckk41JG0cHTaEGJZ/MsouzyfVX3iCuCd0Y7X87uZd/BZ1wbiFu0+F3TQJpfQZlcr6HJKD9FWVB6rgHjIti02c5lVXojFHzrCTMCqQDQfDqrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jRV6u6PH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jRV6u6PH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so2118733a12.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842731; x=1751447531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=jRV6u6PHugZ3CpY/ErUm7pXEI5u44R3MxNoWSRiKsEdwVles5tnoSPaqUG7U9i3tvW
         1fBSxuBpVLknNHnOTK0PbQYD6udBbHpHGXdr5mTJ2bXhQ8RIXB85z+9dz6BhoO35OfFy
         RyndGUETJZkeqLIW5aFXvOwE98E7ADar2BVOkM4js/UrjgLVyApDKzLl8JwTCcvulzz3
         6pONGOgOypkFA2fIv+iLJTMcqxzkpBF7zhtLic0OdQbmXfWDI9Ee/sbKmDC28VIAuR4l
         UbtQvsIz8vylYXGwrxzDESs05nOw1G4P+Ap+KeZzcS3iO8R0zJY9OO6+rbCV3vziliKR
         4+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842731; x=1751447531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=uDqhRlqSKx71SM3HWZ+9YHOb0ew9LmSyhLSKTXFZMeKjLu2HqqY9289EHtokRkSZbm
         xvg5YcU4jGFINRQ/e0pFWVO6QqlPQtpd2wajGe48CZCMBD1e7FRhz8+Rm0Ywvl6RHXDW
         +uphQX6q+k/ZUWJqq5UfzGpV/spxtD9chem8kv1Q/wqnhFx0avPloQgBfTZw2HxR8PmZ
         ccqfs60yKhgSK/MMHIrQBBfuwjaBaPCZP9XEbpfsCS+KoAYh7Sb+SICBnuSd4W0L7ZVi
         4teUKaNsA/dWJIkippKimxOKM+FDh4EP2Hl8yIPFpJyrs7DbKcgl/4Nlp6nZRmFVs8RM
         ql2A==
X-Forwarded-Encrypted: i=1; AJvYcCVdKHnx/0D7fRJ+IWrhC3CFnHKBHz3I0SoS+nlH8Yfscbcj7Rfq6AN9FJRUq2bee8a2QzuMIDKbOQD9RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbl3NQx1BVAvyawtCYLSiBiZHrA46H3DGs6gpRp+lHci1HgFca
	2bRuSDtWYcc1sW/gdulf4GQdA5cx7Zce5cW3oCjoEr1Xt0gMHb0e8P0YKSSigGQMUsc=
X-Gm-Gg: ASbGncvA6pISNtpLfAso6O70Lke0kaduZcHmi9qEsANWnnsCDhDFcydq5ZRR/IzSkrY
	2gaB+I+hJcfFS++bMggOVR53nEhWys0gv8ne5xBXcaLFFHaBme7AiqxsZBUoL0OVdlCQ3pHh9RH
	r3+g2+VUBFviZegdD2ICkilVvqfJ+WhSjL837mbznHasWsN5wfQNkTINPjG9It40ReZNUM1pfKH
	5sTB1tQZ7VWkLtU+zvq9uR00vPlPEKEgMuzbUz6HJIPF8b5OiQYcMD5PMgG7+BK3psd7MfE9mlB
	3lLwQhYTJha15enYugvMB77g0efRj+tA4+Ck6ga/ydwvWI2GjNVP5w4lOZJBPe9uPRru2uXU2dG
	vBmdE+pPsdIlGdzpsr0oTteRCsL0QgAwr
X-Google-Smtp-Source: AGHT+IFEzb5lbk3K1+lIUPljZOLxKwp2Mr0rANsWiHgyk6VUfW/suAoRrgQe45mR9hXiAYd1pDszpg==
X-Received: by 2002:a17:906:7950:b0:ad5:2d77:7ca7 with SMTP id a640c23a62f3a-ae0be9fbf22mr232942066b.43.1750842730958;
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm11076666b.135.2025.06.25.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add pinctrl driver for SM7635
Date: Wed, 25 Jun 2025 11:12:00 +0200
Message-Id: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU92CzLzkkqIcXcu0VOMUCzNLYxOzJCWgpoKi1LTMCrC
 B0bG1tQA6kYpdYAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842730; l=737;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
 b=KzTL/Z/wD17NRYxyIrHXpQRPy8zNXoOYDCUaeDvp5VN57JpWxhNksgX6aQZmwOrPoKPeY2t3l
 LqJm7ikR6sRAWuBNm0KJLJUi0Bz0UxmeH6pF6k24fbzK17kWZufq8Pe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the pinctrl driver for the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: pinctrl: document the SM7635 Top Level Mode Multiplexer
      pinctrl: qcom: Add SM7635 pinctrl driver

 .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm7635.c              | 1340 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pinctrl-9fe3d869346b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

