Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED33064A2
	for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362918; cv=none; b=N9NKWhqgfNDZhkQQhcX98TgfhRSkbDWbUfP/pFU17oPz7fNdkLTqOV3fz3hffydweo/SStNBHtL71z6x8RRft4hFpL6piFviAHcq5OUI08wmugeEI5/p4Wi+LKoYlKScRKq7N16oOgfHodofXQJE5BSNy11lAzaMJaMmwDwFSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362918; c=relaxed/simple;
	bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lca4n7O4rdZDIMPQV+MSW33yaWQzS/V0JIUNHtxiSzBqVTvEKJomkFXfrRnVutq+H9DWaWVa4/ghsp4RQ5WAPifGmGIGXmwFcW4CoxMclK2kiLdhIT+dhzx7EgwCfNozlEfyORPpzl4FyuOO6SD0euEdlqV5Y2PeML0l1Nv9tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM1UaWHl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM1UaWHl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso8437453a12.1
        for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362915; x=1760967715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=fM1UaWHlRd14xskxqcqtIe14cA+6vlilfymhbso1USIylcJCulvX6eO7+T4tbHW4bb
         Yd9z1SApzDUU3I8noOmiFoyNMIBDfaYqzARyPXBjI2rqd+uoFElGWnMaRUKgUNWZLIXe
         yM8SO6CEjNfxwP7urgWoOZNiVHfFYTxt+nVUV41vWkSzbT5WBLgZa0oNiMcSmFGGmynd
         g1X5IaM7+1bs1JavpcyGbhPRNxO7gpbXoIMclo7iUzkNcdW7xustMTiyJIn72I2tcBxN
         PSZtzEdVKTWSuNByHYg/fMNFl+jsLVeDfl1PllsFo8JDSsHsh8Vsb4K46YCmQR2LSdWy
         u+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362915; x=1760967715;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=BInsnVKU/vjFYfalRNwoB6auiIojyk/cuYzNfGvxq7bD348CHTW6IaU9HGKG+FQq1N
         eUCvM6A8hY1XVFGHvgfarZhxETAm13hRwcDukNO1XOdVEzg19mXyXRd2rfVXeVympU/a
         Kno/XIHi18RVUH2b9ViLk5HsLJwxI6JqhvDnGJSmbFqQfPURALxSgtJmfHq1OZzJ4uLm
         frrxkLZAw8zkGI34hUP49RLAOTfM3ZINnM93ISrnP+ME3+VmVoMjO5iPXtBKUX9a0hP7
         6uTOF3gHvnYlAEpIYVq6+DuLvFqlfKVs6bnxH5g/OP2ad6sOjzrNfDxgw+aUxvymIhnI
         5lmA==
X-Forwarded-Encrypted: i=1; AJvYcCVi29go4nCZBs6zqClQ24tTKSc1RBaweKy316x2Z948O8jZbxOHilnJ4CMowrwrSUV5qiceD5Jb8eX0kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL03r+m9SoI1aVYLzoFaMuSdIeXu4ciEmC1WF9itS4vPqn5I/T
	q6zTeq3Cy9/YlFbrLoJ7Rada3YjqROC+xenK51EoT3HADsqTZQcobxSL
X-Gm-Gg: ASbGncs2jRyKviVeXUYSzXqFoV7hBzXXr/waJoFjnxOXuhnhJnrksCSjFFMvnGyq/Do
	CqBwGmH11MPfRzQOnrZnlwVAhZVkvOEGzJyYD0B67sl26OPE6ghsOhn7eLyE7OJeI2P2U/3Pas4
	lzJPCeA2c0MqvUXLIdc9B6jBJI9O7lu2Hn4B4I9tp45fSF/kpjbZwjZURdULbFUQkOp6ASZVrvj
	L59d3m24Y2DSw3myCIQ03zDPFpt0wSSCEJv4QDsBovpWli9P0FGm21wj4Q+sRr46ZJcY3uIWyU5
	Nrd4TZLK0DQvEHM6jEArUgUZHkrRjPpXdIlHxL6mv6/i9H4QruXzOLONC3mFGpbryM0L/F3qh4K
	MKCjJMjkCwiabdpKCNos7KkNeDSvHjGIT6RWLwf6AbTArhZ891KfaTGCmGvfiTX3WrYnOxEkhjS
	X6Jg0FsT/rYq0ZxEUCOm3z+eU=
X-Google-Smtp-Source: AGHT+IGTniZJrYciFFYZBc7bF6mk7b3Np/gZ8mj4KDQqFogc0fSKiYX5xC7hJ7v63RRcAe0CRjZAKg==
X-Received: by 2002:a05:6402:50c6:b0:632:930c:ed60 with SMTP id 4fb4d7f45d1cf-639d5c57a9cmr18367424a12.30.1760362914853;
        Mon, 13 Oct 2025 06:41:54 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:41:53 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v7 0/7] clk: bcm: kona: Add bus clock support, bus clocks
 for BCM21664/BCM281xx
Date: Mon, 13 Oct 2025 15:41:47 +0200
Message-Id: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsB7WgC/2XOQW7DIBCF4atErEsFAx4gq96j6gLwkKAkpjKt1
 Sry3UssVbHs5Rvp+zV3VmnMVNnxcGcjTbnmMrRhXg4snv1wIp77thkI6ARI4JcyeB6+K4/XEi9
 cgzNEyZPTgjX0OVLKP0vw/aPtc65fZfxd+pN8XP9TuE1NkgtO1hjXG+Mxwdvp5vP1NZYbe6Qme
 HIl1I5D416hiugxGGe3XK253XHVeI8pdCFFFdBsuV5xuee68dRpLZGsApu2HJ/cyv3zuHCPqtc
 OhNdrPs/zH0h8yMqoAQAA
X-Change-ID: 20250212-kona-bus-clock-4297eefae940
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGfsqDN//gqTt9R3qAwvz9aqyD+IazKsaM/t
 knYTxVTgLeJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aI39D/0X/eu+v0YEBQ0VmNui0QudP42X0o5jin/jjC4l4X2qk9bEyFuipLBEKShMoN5CDEQuK8V
 bnKcFkFtzfrAVHLAbS3MZeEtTaSnV+RGe72uuMIgWvN0HloBShTTvLPscfE6eqjFNjEHW5KL4Ir
 c2hidjnG8fM9YuITj2TECgcG/V0GMVAItCQmfonCSDSghJ4EkJhGGW7UXK2txDfeeHbukbopNt0
 xQPoCJj93OpDPADkXeBrm+vHPWVrvC9EDt8NSXf8ZVv6On0YYgcjDYPFsN1VgfbkXjZpWwnkHJA
 oJkg+dtKNCnbdyYcgfi4NvSTYYfpgNj9AZcaijsN0nzD7ep6bGmcJRjzbcI3nTwQUagfdys2WHG
 otC++HrlPcukmFX9awoCuCDwvHtXFxmXN54nQD1DUv7T5zohwHJw+wucfIOneEyx19B28e6jTFY
 4cDuQGs6X+9zKFr8tVD49njdwjtyCw9aXx/G6CFwOOSrQ6gIVaj3lmhJKiTt8Hlq+K54GTel2Gs
 En416gwixlgYjlSg0wkIZvImSVTe7n0HS2gZAkNNidKHDT8tJrV17CIM6meumFN6Qix2ifiG2XA
 01uG5sL5Yt7K5X0Nc10SbsgYY8pOem5KpOc3mYGerELAqODmicLitZsg6bTLDa/XZ7Ic70DAxIQ
 8CeferthCAFGRwg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Drop DTS patches to make merging into the clock tree easier. They will be re-sent
  in a subsequent patchset.
- Link to v6: https://lore.kernel.org/r/20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com

Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (7):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 8 files changed, 499 insertions(+), 25 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

