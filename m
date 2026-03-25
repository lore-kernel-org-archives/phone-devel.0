Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133F40FD85
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462057; cv=none; b=lgjFzG3959GSeAI07A71TI9vRwy899p+KZDPYYJk3wxMM+Bf0F4lR5++5ZFXID1DpUeszc+wrY9WU1pQvKMLn8T09rf6unWZpIFbxTCC6Mj4D74xinmIhKV5m0ejncV4rQrupza2d8rKEETmEg9Yic6EvH3oBSp5sfwOOWJdalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462057; c=relaxed/simple;
	bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YIlSSo8bFiUUN0xPrX2fcuhL5b2waZ9L3mKj0rH5xNDUp8iH/8wrBWqVdr6zV7WS59+TNhKOkb3Hn3v3vy12FHAq2jgS8yi16/a+ROk3a5qsue0HddjcwqcAZJSuFsRBEODAd19RA+7Ut5CRbuTN+Op5/ov0OoPT2UBFkYbkyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGNxcxjU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGNxcxjU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so579076a91.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462055; x=1775066855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=YGNxcxjUtxqB0bxk2tWvfN7+xR7w5l4EPzffIkE9kPmXTlICzJIeyPZ9R8Wemy0aZf
         km5qypmOEeEiuh3nm0eKfELVG/WyEKJ/ZS+vxmpUZUg4ykLjpIfIpCH0Th+bcobdDkgg
         M4FPuIkKLRcPUk99D/yR9Bh6/kZ0Kd4VGmnMC2uZB1oMnayFNY4hdo5QiD+p8DAFoHyJ
         82Z7k45+bhOaVT+9oVGwkMnZgUxtvVGS+6nBTSS4EPVxD/+xVREtqLxunwogYzdC1np/
         ttQ80lwe6wOeD52LxyW0LtjUtkMNIn+/ehhJ3XjMIl4OjKjuzUHpY7ObQJtDXdpKhZf5
         bxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462055; x=1775066855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=XGbN7WStA0rnIM5AvUFMkRRW4ihaTe+INZDHbBwyOJdwugKGUVs5fMeOXHRu5ctqxd
         IOhvqf8yy8ERQNdHlREIX+8p9lKUtfWpSsFxkngH7t1UiUGhN6QABm4jWy5FpWYW24DX
         DvfRy2t6cLRxbfzxrd2a0f5LAuh54YMjK7pmnx4TxwK/lJQSbRIdOCbmEe4m3gbdrToi
         iT+13X0WQVUyDrO8r5rEo5UHk0I1ozX8nM+6afXJKWw9uvV8W8tdi0xGA2ajcXb0V+TM
         pq5G+rl2QewZJguJHV0nYnC2+jJn8wAmYI6/D7d1jnu7zFlNZg91RWwKZSRv13/6djT9
         VKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpIsbWNTnC0hN4Ba2eAp2cLZCYNXb7cZhwsNz91tzn1Z38BcegGa+Yi2yfImlBU4jxOVZnjmi+f1K48g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXOh64z+johFjuJzpyr8MV9qTmBbHBF8iz9+PJGBHR27jB057f
	XMinwTES3PIdvA91EtSYFAgOCvFTH/Vuvi0gjGuj0zhpknHYqqc2/xIs
X-Gm-Gg: ATEYQzxRBygvzDz5kN0WHJ40JGgRk6LqHB9lrqVqFNn9AzKLpYVS2GnNrX7H4qBqP6s
	NO2LB4WXeJmu6L2cp3q1Flo694F59PjOP6IVllrL9LsqtJ2BR87gXnpx88v8jQfkm9q5BY8PY1L
	EM1B75oNyGRtVvnfMj7INbz3prYLnVg1wG+qD78LTnL0QIFtNLtMAyjdvc8IfTet27EBMXTaXdg
	0G10czKTT8V/d0kNhQxXXAes1tz5B25OGPSIF2X8Mx4uSUVCtfNuBDuVvAKujwe7bp+z2B/S9+d
	Kpd1ybKKQ28t6xDIyJlkmIpvAbPhXullccheMxmAcB44fPn4sm/2p4N2Tbf71OActZomOceZiJX
	zWV0S0MUcFuuRd/xpn07JQnCK6DsBh99zEME4g06QAPowaqYRw1XMlgMAloXbdZXmKs4aDVbM19
	mW2w3sJzhZ3OFXKRcsAnDtk9KJ1q0c
X-Received: by 2002:a17:903:22ca:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0a4dace22mr76613765ad.10.1774462054938;
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Wed, 25 Mar 2026 18:07:23 +0000
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugqQrtVaSLjJnEaSFKRkUQ7
 96oy7f4fwflJKzwLnZIvIrKGDOqRwH9YGNgFJcNpjRt+TQNBom/MKJ1DhcllISrENa2qci9vG9
 rgtxOib1s17f73NaFvtzP5wyO4w+tnvDleQAAAA==
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1316;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
 b=FTGDeN4f4HSu3HsrxdqeKr4af3eKQ0NpAJch2iaq19oGsccNrLS+g9iaX+SYWX5PAjLHHCMD/
 G3XSfR0V/MdAl0iw07TAOtfNpDU4LgFGi2V9fIgH6cXkpvWlUy1Kr8m
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 152 insertions(+), 77 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

