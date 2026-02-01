Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D8126C02
	for <phone-devel@vger.kernel.org>; Sun,  1 Feb 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769965686; cv=none; b=kqK7/nyTX1CZ1uoONJHEqRNOgTLGwWYWcqdnwiKqaZDxPAqKeMeyGNXfNR1qmvmKpB8UvXwUVVQGWUrJXWrRBK+3vmk+RenbONBxBTNGHYE2ih5aLfmdztBo8UqNRtuqMvP3oiTgtd0VJ94OWbUrz2pi2VegXsLdH/POAdjAQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769965686; c=relaxed/simple;
	bh=HC/GsoZABfP/swmhazc2X5Dfl3xUTt1ryP1//hm9SCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jxoNQSvjMiM3E+MdTB2o35eykHbgHLNsY60NpVtkRR8WRAGupPuqblNTvAYADOylO/tsyhnrQ50pr4nDqRm1nKzzEgK6ErLDnKJrOytFg90ksSP3pgrW+GrLzVDX42wA2PAmHlD5NxoY4WbLc5g4Phk6v7MLXuQvpNJ1/VS/bQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXQPM5tN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXQPM5tN"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305552so3426718f8f.0
        for <phone-devel@vger.kernel.org>; Sun, 01 Feb 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965684; x=1770570484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtEuBedDLC2NCvu5kyy4qD7YNneBQG05ke8bNHSOJkA=;
        b=iXQPM5tNXPSMm5qVJvFJRQCaQW+d3mm+pT5OTHJF3O/B8mP3jSpx6veXz8qH6312Cs
         v4MSZxFJxL0L5Xer2Qv7PS3jNC+zMN9SeDoJQbvkTaB9vFWuHK7k3NEhtYTvE0SI2B6c
         fuiqxoeuKB6NNIt8v6dXZOZ9ewdKcrPZXiSqonwxHTk7wCKRNs0QhVRQPLfHSKe0ZCf2
         OOqcuV2bG8kzMQiz0kjiMVVJDXe8AoVhuJUvU1Akt6RClWBXqkj8l9If616hTH4iZGu/
         GjZSpIkwGLQ5+W5YBxNi0amGfO/YjWELptcbtbXOy+W2/spWAE84ztM+gxgkeeICCzQk
         5FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965684; x=1770570484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtEuBedDLC2NCvu5kyy4qD7YNneBQG05ke8bNHSOJkA=;
        b=xLKLjxtz3DiY6D6F6TjZda5d9JI9malMBIM78ZHmV58/gKl2KIEYKi0wFGNH3eKrTy
         CFDG84g84UNakJ1RRnQSXSeoLByHzqN+miOXSVnBI3lpcuO28clZK+NT9dGJmW83FJLW
         3gNfdG2sY/UIlugP7JubdCxQFyzjVR2r5o5zNUeRPStPdyGYrYYZPiMEercXHUGcBpVx
         71lxr5q9GN9FiQBZvdknYX+xPCoh7Ffkty5neAEQV/5+oSjWgpRCo6tq3NOMZk3gx/mL
         zZPsPiL+oew379f9fqVF5qC08eRTL5QCI53vLssnQZehBeyFM+uv66ILcB4exbeIXxVe
         Ocvg==
X-Forwarded-Encrypted: i=1; AJvYcCWSyMe8WTLdJEgmEPdctkItRoazzNvxqwYJ3LXVlcUOaCeb49733+YvEbTgKjX/QEbSppVLskKBCwTtag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOoWXR5LKhPkOSXGrkmRkK0Nh3cwD69y9aWihV+/x7w6eS3QYD
	gJ1EgDUwSxzpz8/8NXks0p//OgaKVNrrB8iKodyGDjguno5IPfgw5Vtr
X-Gm-Gg: AZuq6aLwXfVvZ4B4UTAk0xbgbIT1hvJ2Nb5SLlurDOdmtPkFYudr5oUnlKPoioWXApS
	vU+EG49s/Wr5ftc0nDnnLjyxMLVXEriC+Rb3Jg34RL73eTcgapm4O43OTU4VWkcF0wjHAU3v4P/
	D6gZMXhc3gERecvihblvDHA5NG+plRbnp5S9SCLSElsmkZKCs78BSwJ3FPNONfeiOWPMjuI5RXY
	aRwGxwpLlXirQk7fGX65UEAuPfPdloBe8NDLkZeAKNgsPn2mwkbtIFSnJFe1u/do19kcswcc7Wy
	JWFjbGtnWJySlZQtoKelHy4LrWNoNKPrOgOfLmzTf/vmC3L08y5r+IFAb8Leh3RZM0UM81li3GX
	iDtl+/0AUPP+5ndHuweBdGHX064mjH2Kr47DcakVbO6M8T2BTYR9IqQ0nypvfNbISi13EOmUxNu
	EVH0MEgTEXyw68mQ==
X-Received: by 2002:a5d:5751:0:b0:436:1b1:6cbb with SMTP id ffacd0b85a97d-43601b16f1emr3377181f8f.7.1769965683658;
        Sun, 01 Feb 2026 09:08:03 -0800 (PST)
Received: from [192.168.8.10] ([2a00:f502:260:44d4:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm40615460f8f.19.2026.02.01.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 09:08:03 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] iio: light: Add support for Capella cm36686 and
 cm36672p sensors
Date: Sun, 01 Feb 2026 19:03:47 +0200
Message-Id: <20260201-cm36686-v1-0-4949a2a9ba63@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwND3eRcYzMzCzPdtGTzRAtjC9M0w+QUJaDqgqLUtMwKsEnRsbW1ACN
 mvQRZAAAA
X-Change-ID: 20260201-cm36686-fc7a8385f1cd
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>
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
available. This code is based on Android downstream kernels for devices
which did use these sensors and a previous submission for cm36672p to
mailing lists:
https://github.com/LineageOS/android_kernel_xiaomi_msm8992/blob/cm-14.1/drivers/iio/light/cm36686.c
https://github.com/shakalaca/ASUS_ZenFone_ZD551KL/blob/android-6.0/kernel/drivers/input/misc/cm36283.c
https://lore.kernel.org/linux-iio/1465462845-1571-1-git-send-email-capellamicro@gmail.com/

The following code has been tested on Asus ZenFone 2 Laser/Selfie, which
uses cm36686 as its ambient light and proximity sensor.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: Add binding document for cm36686
      iio: light: Add support for Capella cm36686 and cm36672p sensors

 .../bindings/iio/light/capella,cm36686.yaml        |  74 ++
 drivers/iio/light/Kconfig                          |  11 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/cm36686.c                        | 810 +++++++++++++++++++++
 4 files changed, 896 insertions(+)
---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260201-cm36686-fc7a8385f1cd

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

