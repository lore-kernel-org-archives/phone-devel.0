Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4230F3370FF
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316515; cv=none; b=lsHtFv5YoJiFD1bwlNh0gD24TEkN1/FGcKk/lpC7lhEMbk3FwCtrUcqS/oTnj7HQUxKMeqN0ZVbRQ7UWJjjGTB4OJrUEhCMUD6XVT5ESUkFBB42MwGtx9onv+BK4nZ2IAoJ3UyE1tSiORyLGTgf9/drSOwZrNhiAW6HqqdUYJHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316515; c=relaxed/simple;
	bh=yA9E6KaDsxKPIDVp/qlGO5Alr8mjPeG4xbNuJb0oR2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qny6KmESWhQqwoOUK72tDsVJES3GQM+UmXXo9uFYoAzq+QjUGVZwPdOAGqYli/DLBcYKydNI215A3BZa4ENmcCI4pyjiTKfGb6Dc6Z+biYFG6oEOJEFlIYvmpzZ0BleO8FSjTIWbqzsUkHKZ0AQcrKB38BN/qEFnE8ULDIHPezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITF3UPTO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITF3UPTO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439f59dfda2so754232f8f.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316513; x=1773921313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRYRKIiNKleJTVNHw1u9qIzA0TEmO35mvkJQdWfCz+I=;
        b=ITF3UPTOoQMKCa4nq0FaV0kTFvGZD3W2z09DkLRs6vwdc3u+rGcy5vWTlL9yfYlh8F
         6OphfycGbUebh/rro+7iXeCaWy6mlIGRN2pAGwFgt0K9scONNZq1W9g3L5yYHPprvVHV
         LJ5ERF0efzf1W6V37hLI21l3ZJzDcqpZ3AlkyoDhKMaIJf29T7DEf6IyqoXHqTHXjVAQ
         PDWDSUQ7Tz/dq6halA5KPQDHGJkEPkX0KkCvqD5dhLwe3hnqq+B+6B122Ghjgp+CFPUa
         ESVncG/c7cJTJbYljIH10LAuX2re6MFuNBLXR+YdziN1E/ltquvBSZPmSUuB7Pr/VHPv
         lVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316513; x=1773921313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRYRKIiNKleJTVNHw1u9qIzA0TEmO35mvkJQdWfCz+I=;
        b=ayI2iVA/zT7YLNxHVzzpSJ4bf0VOEeVXy+inq+6+Fza9CPpg7rCfuvDBrOfpj2izni
         mG1qrLSZEj9dvt7D1t+lP6/ABa50aGZUZZiQMIGWZI/hdQpU7yXMAK689w9HuS5N1LAN
         g5yeahbl6f3MoKj0F/yK/+ePFeiwdqtvGKkf8lBENCUDb0Jzbq95UxxxS0dB4fhShi04
         tU3dkKE5I7DjWhICCcLrWVlOgFcn1ndjfjpH/UHwnQgDdA2IwBRr3bo02ISBSP0TBHG4
         cZSb4Ya74R/W6YVnnj6wGQhELQW+CAChXsicEpN4SJgsv5zGvHmowtMdmRrXdMUBBhyM
         uCSg==
X-Forwarded-Encrypted: i=1; AJvYcCXz0RZM/2t5uwWR/lJ9LJL+5dI61Ejos/GM6RAA55M3uz+acdIHffSz1ucjij0ApgafkDc7oTt7Xe1OGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7OeRjEMJoa8NRbDzV0tr3qsMqfKateh9KFqdGTBorsaPQQ/J
	Hmxf8BwOY9KaLPveDgJKAWIrGa453RvZFo2QuzgPZU1EUFubQ2KLw/f+
X-Gm-Gg: ATEYQzwbsfFNVF367294iCzpVHbiGyZ0EWF2fbzlDzTirIIfbxxz26YLM25auvcMdFv
	t1CYgzaBcJd+5njWpQDg3mMB00yAAIHKTe9fQkB0Z2RMTeZX0SH+xAD9ul1lAQV2Cp8xXTxMGB/
	AqL3QHmguppDuuwgUSdXtpvaRFMM8vS1reWi0Nv8F3MHCb3fxE0uQ9HJc45m07OsYyaFwuOY58x
	mhI4o2Zr4L3mar5kLE2sYgplUZCNu3uNgm4kBQndIKlS1sPvtyynvjtjUsegTBPx7aXdKS3mGdv
	IOW+8Hw6va/cbqjwvwrmAO9YMHooFS1ovM5JnuW/AtCpUw8+lslkWZasoeu4PH4MvDjk0L3MNM/
	JKK5CoOmwFiqurehWfVnW0sYZ4OnJLTkkuZLRLcIaHfLiLw3DLF9ezoQ9Ccbu2Bw/i9eu1oMCDc
	+zJ+4mI7BxiiDhDvY7IMMOmzvneFzxgO6ove/riDjB5sTgYSS3rclyy1mC5Zke6vA=
X-Received: by 2002:a05:6000:2003:b0:439:8eef:11f8 with SMTP id ffacd0b85a97d-439f8430d42mr11227244f8f.36.1773316512551;
        Thu, 12 Mar 2026 04:55:12 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:12 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v3 0/3] Add support for the Samsung S6E8FCO DSI and M1906F9
 display panel
Date: Thu, 12 Mar 2026 13:55:07 +0200
Message-Id: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32PS2rEMBBEr2K0jga1LEu2CWHuEbJoSe0ZEf9iK
 SZh8N0j25uQRWhoqIJ6VD1YpCVQZG3xYAutIYZpzKJ8Kpi743gjHnzWTAqphYSazzhSn39yd4p
 cN9p3hoSvQbCcmRfqwtfBe3079UIfnxmbTpMNFCMe2LZ4PqjlfqpW5gJlbQQHvmJ/ndG9U0oXN
 039y462GIm7aRhCaguvGqGRQGHVQakdWW3AWlCOvM1Oh5UWHjXbS9xDTNPyfWxc4WhxzpHlnzk
 rcMGNqbQUjTKma663AUOfSwwHaZX/pmVOg9XolQFfKfE7vW3bD9UjCKNtAQAA
X-Change-ID: 20260218-panel-patches-696df7e0d810
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=2432;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=yA9E6KaDsxKPIDVp/qlGO5Alr8mjPeG4xbNuJb0oR2A=;
 b=3HOTNWD8H2o2C83ehzi1BnRnYjF9DjHnFV2r0iH8jLlWZLGpQfU2XgTpykZGX6jWTxrnzxKmd
 DmKkKWOH3e/CZJKKx8rummOKOhp98f593gyZFhesVwJEPmzS1mE9+Xi
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

This adds a driver to support the Samsung S6E8FCO DSI controller with the
M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
generated using linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v3:
- Make driver, bindings, compatible specific to M1906F9 panel
- Adjust brightness scale and default
- de-mystify some dsi writes
- move pinctrl for mdss into panel node
- Rename regulator nodes and names according to schematic
- Treat vreg_l9a as input to vddi regulator
- Add myself to copyright header, remove years
- Link to v2: https://lore.kernel.org/r/20260223-panel-patches-v2-0-1b6ad471d540@gmail.com

Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO-M1906F9
      drm: panel: Add Samsung S6E8FCO DSI controller for M1906F9 panel
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../display/panel/samsung,s6e8fco-m1906f9.yaml     |  63 +++++
 MAINTAINERS                                        |   6 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 302 +++++++++++++++++++++
 6 files changed, 479 insertions(+)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260303034847.13870-1-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>

