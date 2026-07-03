Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E244370ADA
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065620; cv=none; b=lCW1YvbYvCNIUNYGkkLqE41GpMNLgTIRW1YGJfG+EyjUOw35PpUFi1uUbhlgF9HTNgjX5i3bcoFVs+/GxE5Tpdn+maPpIk3v08F6QW/bkk/LNIHwttn8GwtaEfIWKzs0ryt0g3Rgf4D4ff0V8bvM6Jvo9eK1KacvD/mSvu9A9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065620; c=relaxed/simple;
	bh=cXawQkAkES/EtQ2U21t1nXPu9yCgC3LC/ilrBUgPwqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bTOhHHceYO9WMrfhQsEtLNXb/eVk7RlqsjFOlkWfaomBT2+qbCyqKX4F3ff7yCk1XO0NIbmo0261dMUqsfuBU27GTfn6RdIoyhf+XHwQF9VtlbnDUL7ujI1Imwy6nFGvgqsONaFom/54XItIbEokn1o3axqw5gk4CnMo/JWlW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzYnb6Ns; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzYnb6Ns"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-461edb387ddso305623f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065617; x=1783670417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbgcaj2LDFDPaFWKXTYQNHTo75owqcWEeCmEV7+wZUs=;
        b=MzYnb6NsVHamPvRTfPGJPOrxg+08QdX6hv/F7xJ7cY7WJ+tCvrIKzdOodx6rz8/uyF
         n9xk3rAFr6iIugCE+Y44ygtx95i7h//SsGLrYdsMDh4khNlAD+PAIznNJNRVC5f2yK+V
         HbV07mAgwz9fVffNg5DscLLZBFHeOiaDsAqmHetBzdiZAsrw5CYwFqOq/u3Xn7zb9cMA
         tskY8ELh1n2KQ4Id1P42mAn7UmiSwFspN9ri+KEAoUsQ3cY3C+lRC7oPpE4V3kX/NpgH
         YxKxzOB7RuZ8esCyZNZWyIQY29Xtxka3smryK6OMJAN6gPT02muGl+cA060+PogvrqaP
         oE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065617; x=1783670417;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbgcaj2LDFDPaFWKXTYQNHTo75owqcWEeCmEV7+wZUs=;
        b=e2A/viyhrEA6hgyNnmdkbYSnAOK8p4HbQaL5qpX4QdhwrqbDeYqnf7ChqIyDfNlxop
         yiV9KwZ50AMLkyWr6K2nx4KjWzfSzMBsaW5kYtYofN4D8hqrNk5X9/KdpMGPpE9PU89G
         DYrG21OJ/o90i6HwOT1Z5rFzzIElRf+JaXi0oVezJrgKTZVmLLh78f0XgEjq3byadRhS
         P8qJrOX8MJGAKg7msvtu8xDIA31zP2lAe58wb+zKrCGNDNIlPpKxp351Axmfjmd4R/Tb
         HEFF5WCa3yP+dJfPkPYAYpEpSP8Q3Z1Zaee25hRm5hYRagP3rZRLeaAA9K2/3x+J8POz
         dBrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRNB+iYvd9pyU7aN1HsJWzOTcY5lM9/P9QSXiMVBIGehtCJtY62lfEhY5Vs/p5vPSHm6ZZpvUBp8Bikg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51LImEDK46QAba1nQTprU7iGlvZ3+aCHe+9uTNwVDND3+KhG9
	Y8oyWy/yztI+B/gjyN4SOPcyv76IhIy4KLSLMSCyXW1icy8MKLfZObTb
X-Gm-Gg: AfdE7cn7FDBIy4+Coj2NBtNKQk71SsxgI+Nw1US06Axg5YOdNjyQ7ivOvtejrdlUSMk
	Xgmrz7Gzub63OBz1+8Gr802H5TuLx23nnkox5xqFev2JleBYp9+wDr4JLhZdPHvxalVRLJfCYSz
	qDCaconRloVb36oZDevubwZV4eTbDoHxWl6TY51igh2LLh5F9y0kVoeuVSh0zZbpGXniXBtqyN6
	KSLK/nBvKiJD0aOPO7tVecHQZr/KRrsPOvcwC5ybSK5IE9SoOhraTVq1KNgAEhy0ZiPWwIEz30T
	xKJVYevFmtOPLaFiBDOYNJeSKV6IgKvWkWVuwlfQY7wPEfx2PUxTzue9buH6RBbRaoYAnbLUMnq
	2OI+GFRoP8u75ZO1fCKTNA8tpezGt5Upq+nNMoZsR5fU2fj/e27AwgY/NRkR8ckAlRcydVyRsVj
	Qy19CFlGl3lMkkGrGtSA==
X-Received: by 2002:a5d:56cf:0:b0:475:f0d1:eb5d with SMTP id ffacd0b85a97d-477b1b996a6mr9797187f8f.56.1783065616579;
        Fri, 03 Jul 2026 01:00:16 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:16 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree for SM7125 Samsung platform
Date: Fri, 03 Jul 2026 10:59:37 +0300
Message-Id: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNz3eJcc0MjU93ixNzi0rx03SQzC9MUiyTL5BQTAyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgBZ3v1xcgAAAA==
X-Change-ID: 20260627-sm7125-samsung-b685d8b9cd40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  31 ++
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  31 ++
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 518 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 585 insertions(+)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

