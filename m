Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3024476CF5
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106050; cv=none; b=iQWH/uIWdrzLIMjvOPxnX6T1tJponRIbUqBTFch3R6woLy2wWUg96Ta7Q7HfmQMtPAUUZJoQ25izdq4l1yF4VTrIOGrwA84dVViupwAYNCnzwyO6fGLzwEK5lpp6PTDqy9pWOXfSEse5ME/pnEgqsANFFEsAoDMv08p205Va3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106050; c=relaxed/simple;
	bh=j2GoRf7ZyxMoQlNfl1xVkoIXThOGTCbJ4xKL6FitXhQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iBl/MnWBoh5CF2ZVmecTI2DFi1HuUYXWwTqaP7qCnQNtcson8M+NNDkqMI4UE/YjLZhPnkpR05BXxyTBG5+cY77KLfiwOjZKlaZnek9CisK3X3GELyT+ao+t314N9C93r+TpApmxqs2Baoq9IUKATjPpi5PoT7A2uXHo2BgoUXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZXTdp8b; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZXTdp8b"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980dc26022so32855245e9.1
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106034; x=1786710834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CRUvoaEPrt3nnywHrC5/Up+6Ih2V7GkEApPQ+21TUKo=;
        b=jZXTdp8ba2F2Hynm/TVsQm2XgEqtmwvuRUjZ3qPNfw7xKgHGDmrnPW0NA7bMGTTeeJ
         aA3mDvd5V1yZd80eqEEWEo5kpLvUOnNPhTJbDrwFvVVS2X0eszSqjkc1fS0upH4FVu/r
         kE1LwjrguFLr3Hpk4DImt80T/Pw2uu3hDQ5dSuizYgDJERGpWDIqs3qfN9/W4zhpvHEz
         HLesE4cLwKFkSo0SEPKCkboYnRBey08UOnNVF+UD7kI6ZesLXcpFngiUW6dnXsLLa3wU
         xu5rBw/KWVjBJSPOi7wOFnwUh4rd7EPed3/f6Z9HkSDyVfVyffOJJGpJFHYtuZmlwHbh
         8WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106034; x=1786710834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CRUvoaEPrt3nnywHrC5/Up+6Ih2V7GkEApPQ+21TUKo=;
        b=CJwuVBfQWQi2/zt/F0uQRXxNVfZl3DH2IZeBUS5dDIx6aRVJBW/EC7XRBEYbaZMgVL
         aZTSbIzoT/2zOIlaCI9XDSS+PiR+IqiGtEzub85n0bgCeeBEx/rQmqkLN+MUpWkKseQl
         qXdMyW5HOcWziFBhhOXU6VGd2Yg0H03t2H81JOzDaPir9drHQRDcV7Va6hOg0izrRZm4
         vVxh2jyryc5E6uf/ekfx8XSj2+weoFSOCD+y9Hzfr+rMp9tkQ0x/6f8CJ8noybwRyu5X
         zWQYrdYnWsb55QqIn/0KFoHPJOLALwkeFyIUDhiv8zhgyPutz5JZ73arQ3ZI1tKmFFaj
         jyWA==
X-Forwarded-Encrypted: i=1; AHgh+RrFkHRtYi9yM8LkeHYSBoWGehPGE+yZS84pqhGfHgPMoopmgPheoGgOLsruTdA0pRb9zQGcmidiWFrpzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD2C1/Mt0S4j+jYgt4dhBKaa/uf62d/fSoDN2o8ACnf+bDtVE/
	pDn7NLd0kOkdcGfA6zSuHeq1mjFSTm6U8sv8LVg3qWzBaw5wDGoWU2pq+wp5SA==
X-Gm-Gg: AR+sD10LBt/5bIAUyWaaPsm4H7zaZ90reZOD0jpK6t3gEs5rgmeB8Bqx3twSdnN39bT
	WLt9AdxXofr9zlnFiW76ivIv56qkdgykebfA0Peo+GmmqVQ+IpnPHZdEp6aAB/pLnLMPJbHwgeP
	9FcNreZH9Sqoko+lWBI6SbB6ojqokAbJiXz6BCkffZWQ1xxAFrrsb7LVcA7LLub+htWJKxamxDP
	ceX4C5zJYuEpIW05WaWcs8Q3hFShviuEuBOENR8oCU+3vnDF3GpNEIIjGtm7pMyWEdxhhXUc3X/
	shC6TvQFKHt5xDmQTeqpQW/sK19qg4iAZn5eu6wq8HJ07F4nLlko+zAKTJwVWA6oM7IZnSpvj2I
	8W+SSs8OHOOwSUJGUF8ibp7L8G1aJtEJffnFbvdb8DXNJl+RdwL45qY/7rYvTaj26nVGg0pW/mg
	siUlU7vmft7Lix/Lh8tx2PqdFJzWUa4S56THFg4e8l9LpVkmVTLbs2Qyzzw/YrzoFa
X-Received: by 2002:a05:600c:17d8:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-4994e7c5fbemr204694005e9.9.1786106034003;
        Fri, 07 Aug 2026 05:33:54 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:33:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree for SM7125 Samsung platform
Date: Fri, 07 Aug 2026 15:33:29 +0300
Message-Id: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNTQ6CMBgFr2K6tqY/lKIr72Fc0PYDaiyYFhoN4
 e62sCG6nOTNvBkF8BYCuhxm5CHaYIc+AT8ekO7qvgVsTWLECCtJySQOTlImcKhdmPoWq7ISplJ
 nbQqCkvTy0Nj3GrzdNw6TeoAecyUvOhvGwX/Wx0jzbotLwn/jkWKCOYhGCkaKStNr62r7POnBo
 RyPbK+LP50l3XBFJSECtOJ7fVmWL3aoZNj9AAAA
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
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Changes in v3:
- Updated copyright information.
- Added tags given in v2.
- Link to v2: https://patch.msgid.link/20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com

Changes in v2:
- Renamed regulator nodes to satisfy dtbs_check.
- Renamed pin configurations for SD card to satisfy dtbs_check.
- Moved rmtfs_mem to the common dtsi, shifted addresses 0x1000 to the
  left and added "qcom,use-guard-pages".
- Converted decimal 0 to hex 0x0 where applicable.
- Pinctrl names are now listed after pinctrl themselves.
- Renamed vol-up to button-vol-up to satisfy dtbs_check.
- Framebuffer uses cont_splash_mem instead of retyping reg.
- Removed pinctrl-names from vibrator.
- Added a blank line at the top to the comment for &pm6150_pon
- Added a comment explaining what the reserved gpio ranges are.
- Added a blank line before "status = "okay"" where applicable.
- Link to v1: https://patch.msgid.link/20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 581 insertions(+)
---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

