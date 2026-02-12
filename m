Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3A2E091D
	for <phone-devel@vger.kernel.org>; Thu, 12 Feb 2026 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907553; cv=none; b=s1KbMh1nKAGgPsRiMJz3yT1sNiN0/Cqu4XU1fblZU+GBe+87GSackz7RztGvuPX09Haj6FsaiNAfJkHDPZt53bvn8P3njY2Gy6FLmKW6rDkHoAR0jTXCGcUHmlCJ4UuS6veM0ngn7g5f3JPrJ3+at5oXu+lqbe2Q9eB0S+dDYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907553; c=relaxed/simple;
	bh=ztzWfLugSvt8j6TU74+8rEShDoaqsOXJUBug2RAETNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T6bEfI5NZRgYTtFH7Xj72UECDlNI/865QXCjY8GV6jHjRsoNJNvDTeIFjHq4DkWSPazDKjtEU+cJFNWYjOAqyQs9POSa1G7vnFkzK8mXQj08OhOVhriMR2fWZN8rfUAaVvyI+pQd/kkIDO34TQMSdd95qmWA9Yjc9TvswKJIw/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kyf129lE; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kyf129lE"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64937edbc9eso6140135d50.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Feb 2026 06:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770907550; x=1771512350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkab2DdyEe+Pi5CQKEjli4RcLlAn8ftg9dt9hgOYnmw=;
        b=Kyf129lEFeKhoB1soRRuuR7SEFLjEPB/i/MuJhuo+cMU+n4gOqCnL7/uf8r77m9XM2
         6Ulz1bNzgAvUmrGscLRNCECCitILKgKwL5wpiouEhaSVMmKVgvCik6ECxzCtawt/VGW3
         pqGI2WTXFUYtBSjlMwO1Tuncn2J8ZQC3hTwQiAXYZeFJz87dkCJJ5Y1QmhvqhgMXyDK5
         gBT2V1cmOKF0hlxTr/2CwbV+iQqXh/kSpJYcbqv1cFuC5UPAOJZLBl7J5if8LhWH36pG
         ktjHqF/5n3jzdjACnrTK5lwBQtksl7nmVQH8AhXgeD8zq77pWxzUfXq/97nxKTL1+LKD
         NGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907550; x=1771512350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkab2DdyEe+Pi5CQKEjli4RcLlAn8ftg9dt9hgOYnmw=;
        b=X467hzdNr8ZqyX3lfvwNQ/JAljnQV4IF7d1UWhRQz584BYXDvjGw+P/xI7E0PXbwsp
         ZAEnDdmOvJe9meymMl1u9FHWZJpSKQi1uCj6D/wLvmlrpXFAse+WD9k31H3SQax4GcAm
         MGEdVP67ZbkpUCW86b1UWoXbPboWsc6yqcgJ5tte53qy9JVxxIeo88qoAUSshzgjKZ63
         Hb/1NOjW014Q49HG9epHiXn0bpEXb9N+98LlqyrZqrBb91hw/d5fUmmvZUDgD6HXphOu
         eCigIjzf+2SSWNEuyn+LrUHRGsaeEkCGfsDVFJXFvQiY7pgERP2nPI18kc4+oD091aPp
         RWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiwdQ1lLv492RVfKpAe1uZoVNX0xzSv5KKfmi4GjCBbyvGqqCy5YNMAjC2byOc/TaucKEaYU7vYZ7cLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtyP/l+W3N8Rx0c1T7j3WRP2IhypNJ5uEQEkLtC/jSHwSY/I+
	bma95LZvM7Fq/JvScwIPSND88PDJ9xlkYZ4u9/OlYhEY6RczSwH/jNp9
X-Gm-Gg: AZuq6aJouO5Lvx1Q1mgyovHIk2p8V4wtWGdAc1r0USwFJWzUNIfFr4GBqJPuRwpe7/U
	fvHwfOzF2cTaAqD2m3rAznggWvhbCthFdng17Ov9h952LKEGLweEtt00/P/azFEvyZ8ii7VNpI6
	OX8wIt6IhBqg0I2yfnKzb2zsJoG7oAcRBhd1ki6eOpDonBg/CLla1IltfpF6dG9Ozv76jmCf9k5
	aF4Y59jVMtLB74btoZI2/0MQkydt697s/VT8hbMsy+KEinfB1Steiy938AQbcV2N9KSwaeCCtbw
	Y1UXVcs6dnfkVE+ZH12ZcnZMngccppSQmGcXitIO0F5SIP5Lk43PDu+mibopWIDtHW3fEvN4pIc
	yKmXC+wIBMenhB9hLzwsd/B8mjhTJNhPtVXEupPLECfQ6jxddBREOAUaZu8stc/uywkuSQxK2VC
	fPKsB+ze5xXvH3uex8W1YYfC5Rag==
X-Received: by 2002:a53:d041:0:20b0:64a:ea66:bb2a with SMTP id 956f58d0204a3-64bbaa47b0emr2230772d50.21.1770907550339;
        Thu, 12 Feb 2026 06:45:50 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc83c201sm4897318d50.3.2026.02.12.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:45:50 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v4 0/2] iio: light: Add support for Capella cm36686 and
 cm36672p sensors
Date: Thu, 12 Feb 2026 16:42:46 +0200
Message-Id: <20260212-cm36686-v4-0-8f587d4a72bf@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3eRcYzMzCzPdtGTzRAtjC9M0w+QUJaDqgqLUtMwKsEnRsbW1AJ5
 1bepZAAAA
X-Change-ID: 20260201-cm36686-fc7a8385f1cd
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This patch series adds support for Capella cm36686 and cm36672p ambient
light and proximity sensors.

Capella cm36686 is a combined ambient light and proximity sensor with
adjustable integration time, interrupt and hysteresis support. It has
the slave address of 0x60. cm36672p is fully compatible with cm36686,
except that it is a proximity-only sensor.

Unfortunately, datasheets for these sensors are not publicly
available. Initially, this patch series introduced a new driver, which
had code based on Android downstream kernels for devices which did use
these sensors and a previous submission for cm36672p to mailing lists:
https://github.com/LineageOS/android_kernel_xiaomi_msm8992/blob/cm-14.1/drivers/iio/light/cm36686.c
https://github.com/shakalaca/ASUS_ZenFone_ZD551KL/blob/android-6.0/kernel/drivers/input/misc/cm36283.c
https://lore.kernel.org/linux-iio/1465462845-1571-1-git-send-email-capellamicro@gmail.com/

However, a compatible driver has been found which is already upstream
and can be used instead. Hence, this patch series adds support for
Capella CM36686 and CM36672P to an existing driver for VCNL4040.

The following code has been tested on Asus ZenFone 2 Laser/Selfie, which
uses cm36686 as its ambient light and proximity sensor.

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
 drivers/iio/light/vcnl4000.c                       | 40 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 6 deletions(-)
---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260201-cm36686-fc7a8385f1cd

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

