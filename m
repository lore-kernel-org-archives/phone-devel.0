Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7A246BC6
	for <phone-devel@vger.kernel.org>; Mon,  6 Oct 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747217; cv=none; b=qhudFQtqWyUz3DrfCBeVf2DcO9EgKkdDCDUkJ3sjbDo15/yu7hmAv0HZQ4Kv3ckUTdrvmTlxwbUAMyNhj5WgFnzm9rj7sQX6ukWMwTMQ263VaZvN8rUx86ayeVfim0MdxKdeeJnt/tJy0AvgQ6bJMfZqPE4TSuDx1oWLcuBAWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747217; c=relaxed/simple;
	bh=iiRKz6V48H3i94AjmBnBN5xSNDizfIgD9Gcbi+zlpdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trS0FA7IVr5lDVsA33HkXwzh/S/XoLIj+90wOpAv6LKQ33pGeR5xkvv4fVvpWXNZUUxjIESMI3jfK87h9Fq5FhcsiI3Qfzt9L0Uf3mTtmm9NeOBc18AYUuU4Pr9ME70eOexNRV4bm6a55eiXCWnGivmy5o1twjrttL73INP44+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM+pjH3a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM+pjH3a"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so52409545e9.0
        for <phone-devel@vger.kernel.org>; Mon, 06 Oct 2025 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759747214; x=1760352014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzjH1OWPTlMaVVjV/DrVYMpKdRTpAYxQjDGXPx2pYEQ=;
        b=jM+pjH3ahHiUx8xQ/wRLxcb0BCpdHeIVpJIovIXITqUPEymFxWAFGhHwsXXkh5J0KT
         Aq/ownUtmoSq4QG/QYr5UdaLPFfWgmkzXNTyHWT7BdoeNU7DIX8EftseQCuVXsxZfR3U
         7i64RQm5Vy8J8oaXLg2mPZ14xHpi/hmvE67//rN4ks78IQDbrOesSmdx/X7wAM00+ZpR
         M2rtEmQ0nnZmmAMC922L76K92i6Zyk6GEbPg6KkRwx8wVrE+PJ7cEg1XaOtNQ/sP0gYF
         14bju5MQ5qRl1II3IqXMNZTAvwo8JhtHJEL31h22lc9p5IGheh9hRGob9njFso9fJpQ5
         weyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747214; x=1760352014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzjH1OWPTlMaVVjV/DrVYMpKdRTpAYxQjDGXPx2pYEQ=;
        b=jrKauo821AYHoeiZTK3XTfAZODo/MAzM4F/NT1oSiflDcl014yyPdMvZZOg1AarfQn
         KxPSeLP+emrsmcbHRiT+HpxKHOyhDXognOKOtQEGXHM+BZTi8fkD3hVDw3UmsDlxIHVZ
         HpjStZxNdvslkqSpl+ARsU01ZRpSjDCTe/DrMgpWK/cEM3InnehAOT8X2Ujhzh3O4DT9
         xdGGr33ESeESu4YYFrnuno2gIPt6ID0pLSKh/hiMYMmFjn7ed+kr2zGnDRNARyISyV4N
         MvXskglCPw1h7lIt+AXgwEQRN0Say6TVOuCs2kjurEPjHtJkBPXWhcOyW7xTg0DOQtGC
         1JuA==
X-Forwarded-Encrypted: i=1; AJvYcCVBHgeNCFEap/MwRqLEFZ81hVVpTuVC8qpYJlzXhZXB84iTngVhHlxb9NqYGimQvFWieS4j/YfR23hlnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MQrVIyBU49ytkd764FKVuzFcYY/xorSGRWuqSGwAgOUYlkce
	FezkMti1yYSg+l7TDQXduXa59FDkvr4KqOYCeW7MDjVW5CwMR+VO5iDj
X-Gm-Gg: ASbGncvWJZ8JjphQ5WKots5GLeW6JgXuznqvAn/qzwFpQumoJR6RMb+QVfnXftMN+Rh
	InttnhVel6ynnfUkwTmgATawIvGVZsObNi87VXAQjOarV5W5wCnq6rB2t3Fx5GPJRBV3GL2Y53n
	/R0tRJM7Vv3MvnB4b1cPuSo/IqEo5XXUYwct3IzW0pnIW1iZbY9m9vTppIYkHlAQBBh7U4iTC1Z
	QC9iXIZC+mOUz2A1FVeFP8iK64Z0WOhEacU7M+7H9DmT/TgGjFVPxvZQZeYs1j1spsXrpZ2Yow0
	+nwUJNNCocVmnR15wVZ+C1Ly47McPXgfhoXgpEBuVzMGeB3Qa3megqJIODtj2wjUnUlysUJJ1MY
	p+lPoH2i/Ptb2AJQQJW0AH44S6+vrvdF9vTkSym4M9PPH2As=
X-Google-Smtp-Source: AGHT+IH8IP56xn3I1QnYJ20Z/tbvzMEjsIxzoUAxJ76fWNZWqgnXCy0iaYNHjZBQMNdm0WTsLpQWmw==
X-Received: by 2002:a05:6000:1888:b0:425:75ab:952c with SMTP id ffacd0b85a97d-42575ab9635mr3779332f8f.51.1759747213714;
        Mon, 06 Oct 2025 03:40:13 -0700 (PDT)
Received: from tpt440p ([41.84.247.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f01absm20132296f8f.44.2025.10.06.03.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:40:13 -0700 (PDT)
From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	corbet@lwn.net
Cc: linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	maemo-leste@lists.dyne.org,
	phone-devel@vger.kernel.org,
	"Sicelo A. Mhlongo" <absicsz@gmail.com>
Subject: [PATCH] leds: lp55xx_common: enable use without FW_LOADER_USER_HELPER
Date: Mon,  6 Oct 2025 12:37:53 +0200
Message-ID: <20251006103954.243150-1-absicsz@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many distributions disable FW_LOADER_USER_HELPER, and this configuration
makes lp55xx LEDs completely unusable. Enable their use by only implying
the user helper, since the basic LEDs and the hardware patterns can be used
with only the sysfs interface.

Tested on Nokia N900 with LP5523.

Additionally do not refer to the sysfs interface as legacy anymore, since
it might be the only one available to users.

Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
---
 Documentation/leds/leds-lp5521.rst | 2 +-
 Documentation/leds/leds-lp5523.rst | 2 +-
 drivers/leds/Kconfig               | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-lp5521.rst b/Documentation/leds/leds-lp5521.rst
index 0432615b083d6..6888c5beceed8 100644
--- a/Documentation/leds/leds-lp5521.rst
+++ b/Documentation/leds/leds-lp5521.rst
@@ -22,7 +22,7 @@ More details of the instructions can be found from the public data sheet.
 LP5521 has the internal program memory for running various LED patterns.
 There are two ways to run LED patterns.
 
-1) Legacy interface - enginex_mode and enginex_load
+1) sysfs interface - enginex_mode and enginex_load
    Control interface for the engines:
 
    x is 1 .. 3
diff --git a/Documentation/leds/leds-lp5523.rst b/Documentation/leds/leds-lp5523.rst
index 7d7362a1dd575..d150bb7d7b703 100644
--- a/Documentation/leds/leds-lp5523.rst
+++ b/Documentation/leds/leds-lp5523.rst
@@ -35,7 +35,7 @@ If both fields are NULL, 'lp5523' is used by default.
 LP5523 has the internal program memory for running various LED patterns.
 There are two ways to run LED patterns.
 
-1) Legacy interface - enginex_mode, enginex_load and enginex_leds
+1) sysfs interface - enginex_mode, enginex_load and enginex_leds
 
   Control interface for the engines:
 
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e3dce7e35a49..3d1895ec38b2e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -443,8 +443,8 @@ config LEDS_LP55XX_COMMON
 	depends on LEDS_CLASS_MULTICOLOR
 	depends on OF
 	depends on I2C
-	select FW_LOADER
-	select FW_LOADER_USER_HELPER
+	imply FW_LOADER
+	imply FW_LOADER_USER_HELPER
 	help
 	  This option supports common operations for LP5521/5523/55231/5562/5569/
 	  8501 devices.
-- 
2.51.0

