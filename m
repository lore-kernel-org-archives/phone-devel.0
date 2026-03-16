Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FAD3D16E9
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681595; cv=none; b=ADoGyxwyhHKJg7y/jkSFFgB9m57EtFIFiXhshZDb3CQX8Xiu1QYl1pds+9PVz7C6FytiL9PhB5trUaYW54B1IK/Kxv1BRMwrroCeq5gt+vntx3oyA7khm5TpbKqJbjOdTJDwFwSrR/V3NJ2mQLWk5t1iRGkstMBUvq4K+Rf3h+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681595; c=relaxed/simple;
	bh=FyYL7KjhfBkhq4Z8eKOH65vilPS2pr7+rN80jiOzQpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/twbpgwzv2i8QxBJM1b/0gB2omFRXIWIz4BU816Yy6g2DiV0GgNuL1OGaX9RNdgAUZ07NDlmWYwZrfY05t6ZUQU2o2NOezq660iZ6XFG3BNIZtdNnLteW8x2xB3dffSXFrmMO/zwvrimbiF/6QW01d/d+6z1d5g+YFkXtmwbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4NhUkx5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4NhUkx5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso383234666b.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 10:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773681593; x=1774286393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGTiQESNTxF+kqg9mPQcr06UPYRyUnWm55j6lAp7RWY=;
        b=N4NhUkx5yXG1WNgC3quqRNlR4pOqVEOUR6t8Il2JDWvlcGTLYM7CLixNyI8Mnwrl9Z
         mX/NyoniGiquWWQNCFwgbx4Ly21QuGOEQezjG2b5H1CUm3jMJeeVYxvGzLj78LOC75cZ
         JSIoF/ppNljUvPY82OOyvk5Uof1QCUD+JbDkP9OqIUemhx4TEa7d954jfmJtq15DuugJ
         ELnuSMIsBSWxp4OwADccnLXbKBnj+qCfFaStgJRTFK13npZid0HQ3VrwERqTKNxkYCBr
         3KSbWHBBR7vKFPLyCOTwlXCZa/EPPsdJfm18rvzUhBJ8SxQ/znsdzPyE/gSHUlyzqbK/
         QtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681593; x=1774286393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AGTiQESNTxF+kqg9mPQcr06UPYRyUnWm55j6lAp7RWY=;
        b=TZt4CLbjlC+C0PzaUlyhzD2W0wASzLWs6BiQ6SDOW+SiS+hHki76sNlFD9UuSThcO+
         gopfl7VVWbw8p5z0Oo0Dj6MX/r1k/3puyfSlHihPndQHRiARD4k0StY+YSoIboyAjEa6
         TDK20ks/CKAu3JJrf7RJoY3arxbtUrWg+kGtnDDOI1vL8f+iXgL4krDaf5ykufLT/j6X
         XgQhgwcMY2g4w4iVpTaGIYWhOwz2vdcetuw27nOqzkWTIjobwylpQsWbWn8HtjRXVCx0
         gHFVybWd53FX/Z47Le5xKMXAa68yOh/XN+4hfz8zg1fnNQK71shphtr+Vy0qMgGwVpMs
         z8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV7OjSZXzidFSmGezrtBC6hcOrB7QbvIcC9071A65pPOLaWULCOkHV3JY4h43JhZajV5E4lFfhn4MwcnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3h/nqqIY6qjVeoj7vJYfmL5FRS2IpVBTjMM99svVw8Rr8o7Y6
	KpE8CJH3bNTGGpnOULJrOMJ0g7eU7/BcYaX3OW8yIiE8wpArtOEmQxzV
X-Gm-Gg: ATEYQzy5QmiQGG7qyxdzqxH9mZeXQ9z9pxXWUIBkT7INSrAaL0ou+N6DfinjurBSNPp
	ZUyvLBHWC2vqoah2fipO4bkZ9u5zD8X3VbomGJ0k81QyoP2XS2GKZwA9Z3pGpBMqmwb0JeLxTde
	xOZJNURkMc62uUGt7gHbN4fEyntml6pgOGQqHov2UCNk85CAE9WdH0VvSmbB2PzBWLwQuEUvxZO
	498Yop74I4LQVJ5TNyNk23IEYEXTl05KOykEkPTLBi4wSHmq2A+mMQYTtbIV3wRcnwah9gbLJEx
	L9fXqEP2kNTLjlst/xp3VYgLdIZmao4MIkTnFikRznmPaEcf8jqx/KVc/GEZtbX4oNOebu9nKb7
	twqcHyNobFj6f31nyd0xneS+xyrPXaCSH4l0tQpJtEZsTojeMa4LJD3OuC/qHQVAbGrd8049fxO
	+R0RBSjuCi8IAF49ALRHpKrURr5g==
X-Received: by 2002:a17:907:e2d2:b0:b94:c55:81d2 with SMTP id a640c23a62f3a-b9764f4bdf8mr721875566b.1.1773681592603;
        Mon, 16 Mar 2026 10:19:52 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97846174cfsm505940266b.22.2026.03.16.10.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:19:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 16 Mar 2026 19:19:46 +0200
Subject: [PATCH v4 2/7] iio: light: vcnl4000: sort includes by their name
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-vcnl4000-regulators-v4-2-854fc2eaf54b@gmail.com>
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
In-Reply-To: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
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

