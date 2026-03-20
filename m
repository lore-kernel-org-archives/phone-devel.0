Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA23D7D7C
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025149; cv=none; b=TSRuInoRcXWORmPU9Oj9CrGFFWLbh6xnDgWTIQlho2O/plILN03RkFqhHYAsgITjELQGWdSYfejJ4jXXEjldgUHqRLr8RNvWLkzbWnOvLe5q6MZ6FID1G+DbBSSl7h7t6t8eIiDd3OkrmFyVai5NrJDWCetIWkGhvohhiV72E9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025149; c=relaxed/simple;
	bh=FyYL7KjhfBkhq4Z8eKOH65vilPS2pr7+rN80jiOzQpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrMHxy39u1/86FnOtianmViX/Kcew0mOGQuWzd/x+Gtx3SBHBBaNjfgEQpyOCBCNNvuEau3rAiCRnNoMjDujLgaAH2epNx3z99X+e5145MgWH1q8+rIKkWAQdt0KdbmHBQctMpYsDZjAFPyeILhsojySV5+9LhGz5J9gekq1Khg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggb+tcOd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggb+tcOd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so280265766b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025146; x=1774629946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGTiQESNTxF+kqg9mPQcr06UPYRyUnWm55j6lAp7RWY=;
        b=ggb+tcOdscs9eAYb2e5tKZQk+kYeBWr0YUE4G3u/8CrB98na6hfC4/nlQ9YZY0vG4G
         J/qMUikmGXDksQECftmOJ7t34pgaEgTAXbN0Y0ViNimfZz01VakjTty+H74kwEPnZX2M
         mkcw8Ztd8WVUGaxIwHJ3doZ2+jCv/Pl0BWYcSTu+d7GXXdkmJOmR1KYGBauuWrt3Fmi5
         TLkVcoQ5HLWg3S8Hnhje2IsFZDM2ZayW4ADGsN4dTeay8nxR1p3FAm3gDs0pN5r42L0k
         6ejQDQVHWsL6j1i+Ldjica4ALzeKpVDxvuH9/PFeIb+2PNQQq5G7CUR35fSdj1OwNGZ+
         VmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025146; x=1774629946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AGTiQESNTxF+kqg9mPQcr06UPYRyUnWm55j6lAp7RWY=;
        b=J8Z/KIiF6I8fKI46lopWmVPG358M6CKm1FAR+RQIP9LlebPa7fCTKZUX0+SjpktpFQ
         Vgcv79yIwgh3gpXPNQkE+jRQYcxv8xvFqbLtKu880gok/uT6euyoUVpZ1owvDQTKzz1W
         r5pmoLCYxDMnARiJyIA8ttdRikULvA3fPdjrRI6Hk0cxh8lwCklwS1TxARP78S7ytQ8E
         0EA8xU/GGDNWrGs2GSWfRk+GLVN5pjr3lKSlElubF4rUrWhKCxzuOyMbeHg37sA73NBY
         XDCTbbrtQCrQCEJSICQCvBSsBkdMojqhbgJrSzaQBRZFU/dYxTVDtGu+cmidN2OXI2aX
         +vww==
X-Forwarded-Encrypted: i=1; AJvYcCVMd43B0GMU/SLs/p5wjUPsvmUocMiRGH9uMEFTVwY0G+XfZmNQsF035BkaslPwUJ+7bggwJKIuymMveg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQopPRpUHwnT45jvVZ30enoJgaJbZBQmN9jyGSxE/U7JjiIDsn
	GaITa+rUopSygeZwohxYHCizToubtzQG0swOGrMneC1GlpdWw26zDgsB
X-Gm-Gg: ATEYQzxXLlYDZdltBnOnG90ucv7U5yBUILHZ4o4r9naDRgPUy5A69NXt2OoakCve4w4
	XGqg52oo825tYKD9jCS63iqirjfD4PvISDyd+rct3J+AgoZlsxDwRNEiEBRD8Ag3K6/3G09VFQ+
	BZ4+Om1GnmFJe9quuFWuQjRVPR9N57eOlvYgzBLHSGJpLcEI4o8gxIjl9vP2qrZe7sOiY9xqFQK
	BbN3nQy3SOG8Ocp/+qmKvd4ER/nEWoVBqzmsko3LxEaqmUn8ye47aAY/yYaNZS2f86ua6sMRrs/
	kvleBBvqmRBYBW8wWNJfJp1ZNHtWivqElfHlPPL/MXHKM6gWAJZIZMAMz+/DE5TCfE+1UBnLzLR
	GdhvCqDV+8HVBw4sZoo+D1MwTVabQWtVK0WOO9HiVogxNm96Akb1LK6G1SI/YbqCH5YlDmlva/B
	ULCHW6FMvOmQtqCR079gMr7SoyPg==
X-Received: by 2002:a17:907:c70c:b0:b96:eb7e:bc55 with SMTP id a640c23a62f3a-b982f1edf01mr278179666b.10.1774025145822;
        Fri, 20 Mar 2026 09:45:45 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:45 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:37 +0200
Subject: [PATCH v6 2/8] iio: light: vcnl4000: sort includes by their name
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-2-0d24d20b1a5b@gmail.com>
References: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
In-Reply-To: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
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

Sort include headers by file name for better readability.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 5e03c3d8874b..939ff2d65105 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -18,12 +18,12 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/err.h>
 #include <linux/delay.h>
-#include <linux/pm_runtime.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>

-- 
2.53.0

