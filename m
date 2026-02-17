Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00A333725
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330416; cv=none; b=EMsQt6/3uxEhfdhrnle2TAQ7FxkYaxfk2JOj8UKYVhjP18k62WR1gBpCJ8/vYKgEAS/lxJX504qvC3rFE53sC5Cly0aLl0/Nf756zhwuZngVa6yzdkx1Ugi4eDLt5c2LkFi9tBOmYwA2KWWA9OMrkBQyfWQvZZdOkY+SaapUcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330416; c=relaxed/simple;
	bh=YpXWy4g7+t7X7zx1cT8W68M3ZmvB/pe8TsSW1+fLS3I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JqipLgsIATxsJxxhbp16qcWiBg9AuCj2XX8L3BC8lWZR0cdZkGyySDYfDZeiu+FRD44/xkI4m/n+Gvdq5+64KCxNz+9JV8gHWSZGYpWGcxWM7sDd9tVr8aPz21xkmy1XZyOnqShsEZf8ZJRBn1E+fD5xcV0r5q3lS9EjySA+56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEvHhf9j; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEvHhf9j"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797a52d8c34so34761827b3.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 04:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771330413; x=1771935213; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ad+zouveqL0jevr2Wpb297zGwvqmkqHDiYrYOYw1pbk=;
        b=KEvHhf9jEMLq6m+C8bP21gXfThW2EicJ7pFNoNLSfXB7cLhEgKcB+eVb9NCcNhjRNG
         p3T8cWiqA0xrDyTwRuvqvZoiknYKl/wurDY9yPRkKJSWONHsO2OLKeiMk0vaGbd5r6cL
         RJ/Z6genHZUdrLYeKJ6SXLT7TnRxdAK7jUxz1/ByXJLVygSCmSSG3TIIdFHbWz+WnFzo
         PUdAsgsUEyAkAxNApEvpc2JLDgzD5hLoxmmKEcPjtrfCHaSyY0zuH994dSWHHoBVOmMm
         ePnyViELZbfVdcLpHZXkHui9pVgrs5zz9SOiA74TQV2NfjRbXFvnPlQZ7Lv5H+l9QfNS
         +kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330413; x=1771935213;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad+zouveqL0jevr2Wpb297zGwvqmkqHDiYrYOYw1pbk=;
        b=ZR2tpFWh2bn8T0xvoASVlOQe0GKpSeKAuHQ56PIBUFb8/mVZaiok3YIHEVmAPsRD6e
         j54x8thbntMFnjZE9g0IJ5aXCww2NYJw9zHyX2v5YMr1zrCwhwCI/rmOWDejM0EQiPk7
         d320cnLr76IDFF0EUqwAMWFIOqkl503py+KkNeK8DuTYehNGamquPkI7JyRplF3kbsow
         gyhkUbvn2pYmebLxF4q5m+Z/dzu7bnWNvRzYvgTFB4ZIzbPoBwi8RNoOjnP7MNGGAxuT
         qQIHzm8m/IXZpnLG8A+JNOoU34Mjt2s0V7ibvx7ox0yGiihtjBQk03hvbLdUzI7lMCM9
         XH4w==
X-Forwarded-Encrypted: i=1; AJvYcCW2V93t6dT6Xm/Ml9RGhQ536Bc5sf9rnOQtzG93eu90gDtXHq6tjmz7T4S+61NLcQBk9fe7tjnodMhkRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaRrWZGigp1nI03FX666tMu/AUpq5ak8eNbf2f+BqznGEgcEAn
	RKS75XsPbr8RTy/b7f2UllZmji6O8BVFiUI+k7FaE9Gr3Cu0dLGiQc4v
X-Gm-Gg: AZuq6aInwIavhstSDSQCywOaLBbUMJCRQt4x60qK4hbR/GyYxnz8OicIePqm1kDDtlh
	ofO0wJxE/82dHjIDJ4aRWSchpW4VkX53p7ZErQR1xTdk/l8TqIwStk1lc7x08jAeIHHVABReFjc
	Lv0sIvqhCTZZ5Cvafh1NaQttF0GiGFy7zZTwk8nUlkV1V6TkntlhVZYDKmpmJisiPEvkZjmZxU5
	NRjt8KtsFm4223XFTB8FLf/3GKdUNCJIJ3rHdTNb7+zdc3sOdYRrMQCRRy5CphQE7WdHZSHDt8f
	mRNHD273QPPrXUtQqANHaq/MvXQk+F2R4N7SNiU2Eb85+3i8O6P4n49dgrsYwSnwK3gRAGYZCWO
	fdPgKlQrIl2LYtQ51PLZBMoj6k4OUaRmc4P6AijbgZhjL/LeXFntn7LW8/nJhaS6sdWQGZJVlN3
	Ogjf4LMEsA818cOXjb5hr2/S8QbA==
X-Received: by 2002:a05:690c:113:b0:796:3f2f:a310 with SMTP id 00721157ae682-797a0cb9039mr93355227b3.32.1771330412998;
        Tue, 17 Feb 2026 04:13:32 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16eb07sm115610727b3.7.2026.02.17.04.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:13:32 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v5 0/2] iio: light: Add support for Capella cm36686 and
 cm36672p sensors
Date: Tue, 17 Feb 2026 14:13:14 +0200
Message-Id: <20260217-cm36686-v5-0-63c2de9709d8@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3eRcYzMzCzPdtGTzRAtjC9M0w+QUJaDqgqLUtMwKsEnRsbW1AHg
 nh2pZAAAA
X-Change-ID: 20260201-cm36686-fc7a8385f1cd
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.3

This patch series adds support for Capella cm36686 and cm36672p ambient
light and proximity sensors.

Capella cm36686 is a combined ambient light and proximity sensor with
adjustable integration time, interrupt and hysteresis support. It has
the slave address of 0x60. cm36672p is partially compatible with
cm36686, in that it is a proximity-only sensor that shares the same
proximity register field interface with cm36686.

Unfortunately, datasheets for these sensors are not publicly
available. Initially, this patch series introduced a new driver, which
had code based on Android downstream kernels for devices which did use
these sensors and a previous submission for cm36672p to mailing lists:
https://github.com/LineageOS/android_kernel_xiaomi_msm8992/blob/cm-14.1/drivers/iio/light/cm36686.c
https://github.com/shakalaca/ASUS_ZenFone_ZD551KL/blob/android-6.0/kernel/drivers/input/misc/cm36283.c
https://lore.kernel.org/linux-iio/1465462845-1571-1-git-send-email-capellamicro@gmail.com/

The following code has been tested on Asus ZenFone 2 Laser/Selfie, which
uses cm36686 as its ambient light and proximity sensor.

Changes since v4:
- CM36672P is only partially compatible with CM36686, reword patch
  series commits to reflect that.
- Add comment explaining why we use VCNL4040 device ID for CM36686.
- Link to v4:
https://lore.kernel.org/linux-iio/20260212-cm36686-v4-0-8f587d4a72bf@gmail.com/

Changes since v3 (misversioned as v1):
- Move Capella enum IDs up so device IDs are sorted by string literal.
- Move device tree table entries up so they are sorted by string
  literal.
- Add a trailing comma to the cm36672p_channels proximity channel entry.
- Link to v3:
https://lore.kernel.org/linux-iio/20260210-cm36686-v1-0-aef68dd46ad4@gmail.com/

Changes since v2:
- Remove the previous unnecessary proposed driver and bindings.
- Add a fallback compatible for cm36686 of vcnl4040.
- Add a new compatible for cm36672p.
- Add channel info for cm36672p.
- Remove redundant information in the dt-bindings commit message.
- Link to v2:
https://lore.kernel.org/linux-iio/20260209-cm36686-v2-0-a48126d2b124@gmail.com/

Changes since v1:
- Add copyright information.
- Sort includes in alphabetical order.
- Add trailing commas.
- Remove blank spaces where unnecessary.
- Add a fallback for capella,cm36686 compatible.
- Make power supplies required.
- Add '-microamp' suffix for capella,proximity-led-current.
- Replace local caching and i2c_smbus calls with regmap API.
- Make interrupt optional.
- Add action or reset only after setup is done.
- Replace mutex_[un]lock calls with guard(mutex)
- Add comments on where mutex is used.
- Add comments on proximity register defaults.
- Remove default proximity sensor duty ratio and integration time. Those
  were taken from the testing device and had no real reason to be there.
- Replace dev_err_probe on device's part ID with a warning.
- Replace chip->supplies property with a single
  devm_regulator_bulk_get_enable call.
- Use individual structs instead of array-style device info
- Remove enums which are no longer used.
- Link to v1:
https://lore.kernel.org/linux-iio/20260201-cm36686-v1-0-4949a2a9ba63@gmail.com/

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: iio: light: vcnl4000: add Capella CM36686 and CM36672P
      iio: light: vcnl4000: add support for Capella CM36686 and CM36672P

 .../bindings/iio/light/vishay,vcnl4000.yaml        | 17 +++++----
 drivers/iio/light/vcnl4000.c                       | 41 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 6 deletions(-)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260201-cm36686-fc7a8385f1cd

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

