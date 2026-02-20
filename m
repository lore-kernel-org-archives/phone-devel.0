Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0902318EC5
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579154; cv=none; b=AJSbobpiizSJ2Db4BaVJryImD7hHTj2TofX/GqZLR9wkM5S+0cZpk+28qy/BRCMZJLc5dOC58Vl/S00A299bnKi4VVQAcFZoLloNkdFNKxfN06fl5k2I7kGB7CHgI24r452mUUpbMeqALVWq2CrOu988H75xoJtvVdFa+JaPgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579154; c=relaxed/simple;
	bh=yoEDD4gAmiWFwPEm4AeHmKBZfnULQrqulEoYZuZ0WU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nYa7N8IllqufSreb/BCWBlxmDAwros7qjOhjBFVT4KrN2YJ0Fj4rKTiZ/TMFmfZWTIsoaUYCRiX66jExSzXN6CZsbuLRruMEK5YS92OeFtCL/Qarrep+L7L0iU0zg7DvWtP/qpDkOJd5DPnEGoufVZicSedj9u35zzY4QDNqM64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aar4kcbi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aar4kcbi"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so4716416a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579151; x=1772183951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0XmHxVEq/bC4S3qNZMApkfuiBP/5qHFpqPImKfYHcc=;
        b=aar4kcbiDnJg9DoePDB0W4eZkAlLXj6W3+A1WQrFlW/R0MbpkBQeBm2bog7c8H/VwP
         3H1w1Qi40CIxAoSawfdtOcLD8v6t+5nIstdvb4cPyZaNx9ktpVl5+dCSqIVVriLOMU2+
         JO+SsDXmp8o4OnhAZJNht4Kr41pgfXcC9iggotCF4knAc7lELhxpqJXAzEnVnKyPmQGT
         7S4rz9MJfU6hLyhJwXKnrj9VFzEn8N1rtbgXPpcUy90XVcfiTpKkOMAaWBXgtKZSmUKi
         HkbchKW9kp/jamrqw+8OPrwYpgNqcCyBnE3a3vfZU8BSFA3mCB+1a7em9t52EFbz5ry7
         IjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579151; x=1772183951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0XmHxVEq/bC4S3qNZMApkfuiBP/5qHFpqPImKfYHcc=;
        b=ii70JldPW9niV/Z3GBS31ogfjR0Y7jNoqWap9Ko/sMrMGg+NWRY1kiZdOiw+GzlCHj
         AaTNvi6raim/nIT0keoYhiQ5p8CFNDlhTaA0b3I0fLCsRFw8lcasa/0z8CXiNJGvZd6F
         5QHK4y7mYoHHdliQ7Mv3KN7ozFDHBntWGIq3/Vagz5Uo+3BfR4hIrWl/3eNhHikqDuSk
         BZRaIq7J9f10AQf8OhFA2I+4qKjuymnKcdrf4gdVDrZr7boj9ohBAEsymxC1xJIDxbzc
         HVCLKH7BQegkFAFSe9y71fPTPU2oTciVUNc8R7JlbQbHAJeWHXgto16qW0EAFd71M1ZV
         17IA==
X-Forwarded-Encrypted: i=1; AJvYcCVP/QDFllKr00VfjdTN+6eTv9nspl7IyUeFukUlrrVAFCGEmfbo+8Na/U9iyGBTpl1CkrQFnGERR2Sh0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuA2EaaJv9BhYgVKmF5zcl2IkP1v7Xbb6+Fzp3yriQljXgOBkL
	gEJXcoOe0sZv7PQHVamCQF51p/B/eDIp3ZMEDBwKSDhicmi4zPw4hmbxdF67CxiTP2I=
X-Gm-Gg: AZuq6aLIqqawV0RV8dwKKcY5oc/xyV27/q7gJwy3Ca/8SkVUQZJxxcoUioCNg2qshbe
	7+dsofN548xJBlvxuqQ5KpoCRpDBGW0pgljEj600z5IXDsIY53P/ZqwtvlUquH5SueTUBMYHkRp
	zkrrUYz6rwpnm+IJLPVJFECXGrkU49ssC/eBO6Tia3om4DBPwrtTKcCWfFMbQ7lY93srIplXHl4
	fUnNqqTr2fTn7Ad2kIBiwcw0un+0AEd4JMivT3MOcBlJuYo5AYcOGwf2S2ryYM1ew/ZBC5oA9Vl
	dE5j6uYR/ps4NrvU5IhudzvKLJXo2qrqSsM7vMf7vcfuRUeqo0AqoLlIlI6fAIYHTaFgsiFRia9
	yHuVYFKL0WIcPiBzAVxsmqALqtG99cBmCkNdzmh7KLUr4uztA8QIBXRlL/IOHlxVOoCnHK4DRU/
	V+wMnzzMr/11Kztqs5DA/9TFfMmIbai5RRDcl1fn2aq1MQPgOhyUieKI5JqWltDJspBwYX9YXeH
	B3OMA==
X-Received: by 2002:a17:907:3e84:b0:b88:23f5:3cfa with SMTP id a640c23a62f3a-b905444e673mr286684066b.31.1771579150928;
        Fri, 20 Feb 2026 01:19:10 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Battery temperature ADC plumbing on Qualcomm
 platforms
Date: Fri, 20 Feb 2026 10:19:04 +0100
Message-Id: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4Xs2TVtTQlw8j0Mh/4s0gMttpVgC
 O9uhavH2WTm2w0SRUcJumqDSItLLvgC4lKBGZV/EjpbGAQTkjPOUKuMmaYZlTXYyFurB6YbqQ0
 UZY40uPXIPfqTI73epZrPI2iVCE2YJpe7ytOasZRrJngLP2F0KYf4Od5Z+GH8X144MrSSk2laa
 ZWp74NycR6Dp2vJQ7/v+xczmJfD3QAAAA==
X-Change-ID: 20251010-bat-temp-adc-8539bf0b85bc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=2272;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yoEDD4gAmiWFwPEm4AeHmKBZfnULQrqulEoYZuZ0WU8=;
 b=jsDYWvi96TwbF7f2f6x6W5eoPqMCy5LlHsEXA5S763cxOoXOBgPsLvRpMbqrin2aAqG1CXKmd
 ioG/5VIg8u5CZZskC+yThS7iAbk9ZQjJ9oVEkzysJZOenCMGD+Hko2F
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This implements a solution to get battery temperature readings working
on (for example) smartphones with Qualcomm SoCs.

The solution chosen in downstream Qualcomm kernels is exposing
ADC_BAT_THERM_PU* in the ADC driver as temperature channels with the
lookup table ("struct vadc_map_pt") for the specific NTC found in a
device's battery patched to adjust the lookup table. Patching a kernel
per-device is obviously nothing we can put upstream.

The high level solution proposed here:
* ADC driver provides temperature channel in (milli)volt as IIO channel
* generic-adc-thermal driver converts voltage to temperature based on
  provided lookup table from DT (driver has one IIO channel input, one
  IIO channel output)
* The fuel gauge driver can use that temperature IIO channel to expose
  battery temperature via the power supply device

See RFC for other variants or alternatives considered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebase on linux-next (a different patch to add IIO to
  generic-adc-thermal has already landed upstream)
- Un-mark as RFC
- Link to v1: https://lore.kernel.org/r/20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com

---
Luca Weiss (5):
      iio: adc: qcom-spmi-adc5: Add battery thermal channels
      dt-bindings: thermal: generic-adc: Document #io-channel-cells
      thermal/drivers/generic-adc: Allow probe without TZ registration
      arm64: dts: qcom: pm7250b: Define battery temperature ADC channels
      arm64: dts: qcom: sm7225-fairphone-fp4: Add battery temperature node

 .../bindings/thermal/generic-adc-thermal.yaml      |  4 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 24 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 83 ++++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   |  6 ++
 drivers/iio/adc/qcom-vadc-common.c                 | 16 +++++
 drivers/thermal/thermal-generic-adc.c              | 20 +++---
 include/linux/iio/adc/qcom-vadc-common.h           |  3 +
 7 files changed, 147 insertions(+), 9 deletions(-)
---
base-commit: 8dd3bcb7855ad929d732f48e8a2307fdab6a5667
change-id: 20251010-bat-temp-adc-8539bf0b85bc

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

