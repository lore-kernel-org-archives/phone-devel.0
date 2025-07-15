Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8715C1FF7DC
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563957; cv=none; b=geCDQ6AfC+QpFpYaoZ3+4uZor0CVlzatYVsJI5+1nU3sH8xs4cfYfnsmLVy6896AQS3tzw5fmjvloTWAmyfZ6/jVed3zVJht6N8Sj3FNDIXZkjqcQ2NWtOBfrnhAr5dJh3rnW8jIDutcibLSsEAiGJmiHo0pp4zjhHBD06roTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563957; c=relaxed/simple;
	bh=7xd0aEtQAkfRhhfcCuzFJQNDslw5DAv7Mc2CrfAcRN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ktO4Q6JoSXPBAz9YSxUBEnPBZxa0dcKuL3VqUKhOY4HhIoXeJMifvsAxsQ5+KGQRsK6MOOq3cNuTy85+jZ2cPoyvh4E3Pl5Na9a5mXrrqAGyiBSy+dSHGQKGQV4izs9AIPnE7OmeHdELX1+oYzO2XKix8nnoMxFXzGeSxrwxFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N+IexZZ+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N+IexZZ+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8421271a12.2
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563954; x=1753168754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rm5Emm3+mo6FT7qDpobA6G+QLjpbiKmx/DuT9aUyZyc=;
        b=N+IexZZ+4ZDdwqD7jT9PWyq4yxSo7i0qjS1RUrNObrH1yjQ8j0z1J6hqav/aVwYVWd
         bZhHsa484ndLqXHBySyq6xtAWps/kLEjLYg242MZIRxfg63AUww0pUucz9q3N9DOQ7L8
         RHcb8x9doqzERmxCamIz81p95SRka5RMt9zc1FQa9rZz4vowBCO0RjZlTbs6jg3LMuB1
         8vfPd1FAhhzRXNqbw5qLBRPKxFmmo8bfon9syTslDqM9+MvyDqUsoC51ravaWxmriISH
         tDxwszYTdsYUNHmMbQ+dICs/USKKvcbBBkb1oR2ZMeHcKRVzdYzbWcsex9lleVe6WcyT
         FWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563954; x=1753168754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm5Emm3+mo6FT7qDpobA6G+QLjpbiKmx/DuT9aUyZyc=;
        b=dm9W6Wp+mi6fXFxqTa6hH1cfOeSgZ16GdS29GuoyDXTDV1Td/yMgwM1qv3NzaaWP/e
         tmrnhXYp6C0ZUca7Qoln4iNMezrXWI/uK4MyxdjNGALWMdl0cnp1aT90a5ZeKmJtStRi
         dUAF0OT+9jsJEPF+5vfoO8stKaiYjx5JHnU4CBgFyWOc/0V2f1Zu08ijcVMcJRIpzTY+
         v0Hb7rXMf4GtxBz4j+lkw1pZ6QrNNNAYSmpUEUyyklrokpVDyX5vS8r3G0bFnqiBvzZT
         zKGsY8cfGhPfgUcqyt8mDVyp9Xj/qZDxNNeDndasXAg2CvBc0NcTcYJU7UVgFS7f62YR
         jrWg==
X-Forwarded-Encrypted: i=1; AJvYcCV1mNbQgHgj4/+S/J2HDErtxXy6GiSwP0/P+lgEcVJhD95dsf0/KeK1RmWp9CGVz/HXf2tJY/ch9W4tag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLAY9QbcYfL7WlXtWbTdCL3aBDLZaO2VK3xjghNIE4bUwwo/1
	wbYYO8SBr9fE8kECfV255PHTBV7xGVDziu3QdRFqfrOSSI5b/MektLYsWPzAQ3VU0y0=
X-Gm-Gg: ASbGncuyx1+yjoHqreoFsUI4eUFEqd4GsnLJs3KO+ckuIeVihZLTpqvP+OIDQCWIg4p
	OrefHCgMRqMi4G2fE2GQQc70rztAMAuB+0AOGyBrBvMAbVorxNQaIkA+KUiTYienLA0+R7HAcYm
	1BNn7YCmArFgApsUuiYcFHoD6xI3SL9tzO08kSoHME2r3s2Z8yr9U2yHTsit94dlivmDAUFaExz
	vWccMRoTl3gAPwu5WW4BEAYt2GsaGc5Q9BaOMwuDhIKWJguyKtrwn3VQ99jbYflC8F4usVJ1uGA
	MxoWpQEhscydRDdckgAjPYOTgjRzmlBphxAlePTUDR7+i+QUXf0MIzz1w34eFQyHEBnvKPkLboT
	ZX6tGHwcBQq3EOcM39QSExrksufcPBmEBAsWCPmJnx8YeqgRKxsdiLH9M
X-Google-Smtp-Source: AGHT+IFWv5NE2d8sdGkdncQkeDI14IZ6O0yr1kGNqs7F/kZQXvRGoaJHtyYP+E/Tt/FniiVadsE+bA==
X-Received: by 2002:a05:6402:280b:b0:60c:5853:5b7f with SMTP id 4fb4d7f45d1cf-611e84fdedcmr14210105a12.32.1752563953728;
        Tue, 15 Jul 2025 00:19:13 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 00/11] Add clock drivers for Milos
Date: Tue, 15 Jul 2025 09:19:00 +0200
Message-Id: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQAdmgC/13P0Q6CIBQG4FdxXEdDUFGveo/WBeExWQkGxGzOd
 w+11ublf87+b+dMyIFV4FCdTMhCUE4ZHQM7JEh2Qt8AqyZmRAnNSUEJdj0vWI7lw8i7w7yoqoa
 xspGMo9gZLLRqXL3zJeZOOW/se+VDukx/Ur6TQooJloKllAATJYFTK5QdOqPhKE2PFi3Qv8BJt
 hdoFCrIuOCSNBlv98K8HWjh+Yp/+u1KdBUOcNz3yteJhtHjr89iY/4AAyBdyyEBAAA=
X-Change-ID: 20250620-sm7635-clocks-7699d338dc37
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=3094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7xd0aEtQAkfRhhfcCuzFJQNDslw5DAv7Mc2CrfAcRN0=;
 b=KmiAwRrF46kq8Z+FNHZF8V3uDR/PJtSyyBbFB5IdRNtbQbIUP2wd9GkJXpI+T1AalV8GI5t2w
 R1B7ASszydUAs2ZkgTYNEhEtjExdyuNuaO/wJjC3p1oMr3TBNwAwyir
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
VIDEOCC on the Milos SoC (e.g. SM7635).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Move dfs_rcgs to qcom_cc_driver_data (update common & gcc)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com

Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Use new qcom_cc_driver_data to configure e.g. always-on clks instead
  of in probe function, plus some other related bits from the probe
  function
- Add patch to support registering rcg dfs in qcom_cc_really_probe
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com

---
Luca Weiss (11):
      clk: qcom: common: Add support to register rcg dfs in qcom_cc_really_probe
      dt-bindings: clock: qcom: document the Milos Global Clock Controller
      clk: qcom: Add Global Clock controller (GCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Camera Clock Controller
      clk: qcom: Add Camera Clock controller (CAMCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Display Clock Controller
      clk: qcom: Add Display Clock controller (DISPCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos GPU Clock Controller
      clk: qcom: Add Graphics Clock controller (GPUCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Video Clock Controller
      clk: qcom: Add Video Clock controller (VIDEOCC) driver for Milos

 .../bindings/clock/qcom,milos-camcc.yaml           |   51 +
 .../bindings/clock/qcom,milos-dispcc.yaml          |   63 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   62 +
 .../bindings/clock/qcom,milos-videocc.yaml         |   53 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 drivers/clk/qcom/Kconfig                           |   47 +
 drivers/clk/qcom/Makefile                          |    5 +
 drivers/clk/qcom/camcc-milos.c                     | 2161 +++++++++++++
 drivers/clk/qcom/common.c                          |   10 +
 drivers/clk/qcom/common.h                          |    2 +
 drivers/clk/qcom/dispcc-milos.c                    |  974 ++++++
 drivers/clk/qcom/gcc-milos.c                       | 3225 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-milos.c                     |  562 ++++
 drivers/clk/qcom/videocc-milos.c                   |  403 +++
 include/dt-bindings/clock/qcom,milos-camcc.h       |  131 +
 include/dt-bindings/clock/qcom,milos-dispcc.h      |   61 +
 include/dt-bindings/clock/qcom,milos-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,milos-gpucc.h       |   56 +
 include/dt-bindings/clock/qcom,milos-videocc.h     |   36 +
 19 files changed, 8114 insertions(+)
---
base-commit: b803ad80123e6efccfeeffa7cd37f98f642e37f4
change-id: 20250620-sm7635-clocks-7699d338dc37

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

