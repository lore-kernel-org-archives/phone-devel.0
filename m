Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE672F533A
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275963; cv=none; b=JJu0VbTliTWgf3Fj1y7uBHgQujSwrqgCV3JF4RRh1VJqHzZmeXP0Bh2hJkQhYv/tyWDVQh405h+413tX7BlSeoV4y42+kH4rMVHcBP3Q5Rgqx7ehHrMNGk8HPiHydclBkLipQlkeGtp+5j1V7ZSljRV7TDuk0pO4IDgfKtSuUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275963; c=relaxed/simple;
	bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MeHFvGjPj7DBNfYEtt1B46lDC51e/+xhRnqWFAeG1gSje7o3wnQEKdafA4KidC8OW4J1wFPf8v5Qgn1a+kaxJhnh2eHhcHh+Mn3wFOFXwDT/Hd09tRZ+Wpa4DizV9bVY8bFGP9sFE9SGY2uZwTfkmJGdBHS/eFb15g2XvuxrQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yfjJbs8z; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yfjJbs8z"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso287424a12.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275958; x=1758880758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=yfjJbs8zJsQGgpDtUh+/DhjEBnUciTKP4fenL/W/StDYTtrH1s01OgdQ3nIlhvowS8
         T4RWct+vVfttatWB3xNrqwyebq4K2v44o4Ta3a/Kd42FKQhI7d66eMjw0N0AtxsWRLMh
         a2Xp32jmSJMVkMlVZ+ErCkdLErJWasksYy3gM7UiBUV9f0UPAChKDJrB0NQwTUGgfTS5
         YZVYKNvgZWx+GssTNrCc1JrQgGD6A+t8j4g+yNJoRgusmhOsvsYMzE9wEYL7dxB5R/Y9
         Z4KOW8N4NW+Tt4tgpMRWu8+vvF/hYjwa/4IPmQ3eEGxAe65aCv0iOmzQVY15B3On1TdW
         ZC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275958; x=1758880758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=k97tf+g1KBjpnzUqIF3FFNxctWt2GGwf7f9DmJeq0Un77L5ag3kT2QykoRcohJhSzp
         SIKaSXRQSudc3vLoJ1i2UXuckezd94Vqd4Oh8NCOpUH6QmFoNcCZxx4CFtFyGOamXE6z
         +itacHZj7bPDyTowu63UiXYsH2NXDOL2rnlmlfKGyQ6hIbEbYnSrtNK34p5G43spgUQV
         t179SjDMs+w9picagZnomUPyhdb9m+L9iMy1XoFzWaSH7RJn9WA/rGnHjRHrEd9ce9Yu
         qFje/Su6pVthOQiNQ2WJa3cfaa3tq0yKRIX+bb7Q20R4XhqWhiWNrE5s9x2GhoT+aAg+
         xcFw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEaGZ+BuNl6vAZhagrBtP9vRP8/oFZJy7GkX1r+DJaiww0lmM7j4+e9oYb3agpGiV4sxmhvIOaoIB6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/OcNyoCrd6hXSdIW+srK17AH2n1jsiht/kMZvXqyKDqCwNYD
	IVpBPe7KmQtwHCQp/ZcRPH59PJWYX7/8yZ2KiJucxubLgvyXc/SJ1GsU+gvUWDw3J28=
X-Gm-Gg: ASbGncs3Oq/rRjGZFDvIjCT0QwSuuk0cx5+H17sLjzrrxX24ygycIjdNWZAdTDW7mhA
	2MW+hiHvKZ0RNmeWRyW/2EwQPad/tlO1tBx/8Sctkv1uysKcNzCjEKsRgU8FaTE6mHlkNHSfeIU
	pBqNUXCloevj/zn0e1VQJPCi/cgbrl20t51FIqs1uClBn8x1o6crlpegZ2HNlYDnxFz+fbWT3z1
	BUk32p7DJoFrxlj678oLS5aQ+r/Qdm5WqGIxu2GCYsmERHNX/R9a1WhnmD8IpF+2jruKAUcpHq8
	nSVudS/7uBCR1Z3tfPezgBj/NFqefgmaUCS5uou452oMUU+13uvUUw+vXPW/w0nA8YLlUDc2TmE
	+PZh0cH4mxjSdNOj/Hf8qJNMt8VgKB0LAJDM/8xBSb9AsGKcT/WWTNOsiXlnni0ibf9TZDQ==
X-Google-Smtp-Source: AGHT+IGVYm9E/cx1SKKQgvlhctnWTkhe6Z+JABeK/WVkRlVG4Nq2CQ/rYTfusBlwv0oZAUdV2jr6XA==
X-Received: by 2002:a05:6402:23c2:b0:627:f3b4:c01a with SMTP id 4fb4d7f45d1cf-62fc0a5a09fmr2234196a12.17.1758275958517;
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add MDSS_CORE reset for SM6350 MDSS
Date: Fri, 19 Sep 2025 11:57:22 +0200
Message-Id: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIpzWgC/x3MPQqAMAxA4atIZgNt/aNeRRyqjZrBKo2IULy7x
 fEb3ksgFJkE+iJBpJuFj5ChywLmzYWVkH02GGUaZbVF2duqUbh7EYwkdKHv3FRr43WnHOTujLT
 w8z+H8X0/9sPIj2MAAAA=
X-Change-ID: 20250919-sm6350-mdss-reset-d7ab412d170a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=860;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
 b=nEOvSMIjb1EJx8t/h3B9Qt+6O9RQANHQ/rfdz2FT+zMFtNxpXQ4F4ptH5JHP5tdcBoV5FrGri
 a3q1vhC481vCmbBR9Tm/W2lJACJtJCfDyKcCaIy9h921kC4lQ2W+72x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With v6.17-rc kernel, the display stack needs reference to the
MDSS_CORE, otherwise display init becomes quite broken.

Add the resets into the dispcc driver and add a reference to the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss

 arch/arm64/boot/dts/qcom/sm6350.dtsi           | 2 ++
 drivers/clk/qcom/dispcc-sm6350.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 3 files changed, 13 insertions(+)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250919-sm6350-mdss-reset-d7ab412d170a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

