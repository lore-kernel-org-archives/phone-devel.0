Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393B36C9C2
	for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912491; cv=none; b=rh7XyZ5JtOiSJBljX2ZONFFQr5XRPUPa9MXButWiNl0Ef/8llPSsvDWiqxM0UH4mVBurqgcH+pCheUR01FDxXl9euI/SnTTsHWnbMtTTqPciDnkgt9JWMzHRmdbfnxCSjktwoX80tjE1Kryj6Hcrk/wXjHqy2Qq/cRuWtx/ml0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912491; c=relaxed/simple;
	bh=kTpBUkX0rt0xbSv0yoLPWHk+BTyd3gSxlTejaHQkxZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4MhPWXTC//N0c2oKQU5P2ur1EAuOwd2L0pqa+x6vD60yt0nWbkJEbFas2rb/GJ2p0Yx5E7UQrfn0FlvbVleWZPDAJwX3hQ0F7sQasrU/KmktlSdwCgBjxLGiuUo+B6q3w6eblFYgKEhOXm+CGoHAc9GERk6xKO7r3/jiDaghkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHU9eUVE; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHU9eUVE"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bdc947aa88so100165687b3.3
        for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912488; x=1780517288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=VHU9eUVEdIg2NokaADiwijJJykp+GQcvIF4/NLF9mvPHPBTTvfGo3Yq8rO1ZeB/SOO
         YrBAIpB68z3Hp7ocdNBb02YA6QocUSSK8LDPvIXoX4LIzpwQX1ToWlpy+dJEIqwvtTAe
         GIzYNoq6oHAoKrE9N5OnlRD7lsAtopbIqiPRDGzusX4/APNYDu5I72ASVVlPEH6piDSl
         7o6eM5dsz+W3+1miFSjWmjn6Nthzc/YTStH6T1vNwOViSGx9xhugro2wR0GSavkF9B7w
         seNVuhj5x58Mq29cFS8UkLk7sJU6i3eBPGf++8tsJ/cy34yPs3GeYaOKSfEYag9orfAd
         9tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912488; x=1780517288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=UqcWdN9SkqyyeF7BH5241EdSYS0IDVdL99ZuLzP/XYdsK8p8E2ajH/ox+2+WVjSRUy
         2wZKFcOyM4vLE/r38/wgy3KFJOt0/I7IKDVoHu/bwDPN+d84/Rfy5+DPLYI4KSRV8sMa
         25m19yU6TqT3BEIZh+T4Y8gk+/Go5x0BCp5g1jQwF+xsLhsfGUXZCYjfNn641NzqP4kN
         SxE2ROOdgJIVdYk8OdtxoMVAfVho2/8O0k32EqsYKSoYsYoZ237AeOClw89KLRRCuzGR
         urSj5ugGnIUUP3m9432eYrGOoclaw7nURBOqY9xM7QoSk5gE0BbuL6D5Ek8Gv1FtiiYj
         xNuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uNObojBlEfhrPL0hnIvs5MhxrUXvvKGmiuqU8YpULfWmq6CjOF49WVrfHCKCHKikkNZZlZm05+3WgMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpGXfLPzzjaUQwRrag9MSDY6yxFiPSMD/OHXPwDoC2d4/4s5M
	ZOuM6Tokat2HLcDYErbcj0V3vbXNDcZLucOevhYruAtGD3d0jfuN7FbF
X-Gm-Gg: Acq92OE7hnmn42AAG9UdxvCxk7V9uqHFzWW6gFM/CPhzFKyzjKg+qw6lNgAKz4Q02Dg
	bRwrkHMGFC734qVlkpzzDWH0OgeRsECJTiEFhux6tDZCyQhPRZKmAlLXePVKUo/Z8IG+n8hKn/d
	VsBbm3YDlrh/T35BufVXbpUDg7yD8TM7KV9rfQpjj5PkYfAKZOHvtP3OYhHdIPHEukkFbBOu8rZ
	ldoyqzIcgVNQa9YiHBb7AVp9bIH+HGyWdd5FmO96PZCZdJWKe7r/Y7Ohb85dtV1VsG10VlbyCEB
	WD+m4OrEQcNj2vzNhDNdwVqyWr/35qIS2DFWPE23+6vMV1K6V1eLT5IzvIoJMuCO8G6gFjahFiN
	4YNLfibpQdSwBrEcRhpbK5O8QrL1Z+1L/tyYhYC+R/B5fvaf3fyr1vTJoQiQilMgwXB4H1U6AFJ
	gHHQivyvP8O9cDBtRBfE8kJh4JMJbSaX4jjR6L
X-Received: by 2002:a05:690c:48c7:b0:7d0:1583:4cd2 with SMTP id 00721157ae682-7d3339e48acmr245510687b3.9.1779912488525;
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add
 initial device tree
Date: Wed, 27 May 2026 23:08:00 +0300
Message-Id: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXRhkZcRSyKaQ1S0iJEenfF8
 i3+v8GjI/RQJTc4PMjTYiN4mkA3KGuQUR8NIhMyK4Rk1z4tlqEyMzJZlFrokiue9xCL1aGm87v
 VzW+/tyN227uAEB7MUA1dbwAAAA==
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree with for Sony Xperia M2 with support for:
- Framebuffer
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 406 +++++++++++++++++++++
 3 files changed, 408 insertions(+)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

