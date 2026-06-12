Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFD37BE63
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261766; cv=none; b=GPE9Vnm8ow1IGO+Sf1QGiAUcjRriuKvAHwoCQAzRcXUB/jLYLqHevyKYt1YQqJsUaOxMpF8nwSzQRYgMf2ThadQgO12TEv2wq1ERIeYXZKDNni8ilTNuGqpeqtPIEUK3mJ3H8INCG/NOlkDK43OVYLXXOHG0T2Sl9dtIV3vLQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261766; c=relaxed/simple;
	bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UjeZTDHtD7dg8YsOigG43xWK5SNoirpuHkSokRXn7FUA5qAU4WqU++wAEnAsw0ObsH/xiStwF6+g0KmeR/bD9LZKy2pGczzujgpcdRcScQRknN3pm5Ryvp3ZHKF19DUjGY2vfVHpd+Jg7t8DtScZ/ir7x3/bYQ5oKxkUvKcNgcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UBalcRBn; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UBalcRBn"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bed4f2f0898so112043366b.3
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261762; x=1781866562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=UBalcRBnlIAfFUTrVUOe6LC8D7vMqKFrbOYILd/Dx7UBXr1haQCUeD5f0aJ4bsCncy
         7HT1y5iv89fKN/ObSR5cT2DJXE1Z5IA+vbpZkmSptDnMItaeWwPj718FdYkrZtExwT+o
         deOZT0fhYg5ed/di8Mo5HVZ3YBb7gWkoN9dpknyG5Mbglb9lynxYRg536l6e+3nOMg2p
         xDJSkVfyn2lRUVnHz/brpe/2bfSeMZ4kjgXoJALEGGnFFVy/CcsPMtLumvIA3bM14cWb
         89PHleGt03sgJZXnkb7FM35piPHcZOR1Ixh70Dl7RYjbyS2aCgXgTv8HTzNU19js+6V2
         4AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261762; x=1781866562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=mhXOhCTcWh59IJXx8t6abP4KIW1Ol8FG/vPhtB+yp39iduwZAc+iaISnYq3B6rSzOp
         fOEgLfgxDot9UGrYyIvwLrIZiXQbgkG24K0Y+74GBAU/B6Ta7sIh3S/qoCf0YuqLbNFy
         TTgYTqPniVQqx52yVcbNmC++JHLhZEo58yTwFQi8bqrJpxBrEISw4gBxriuvDrGdR4C9
         azQKqsa61NemM+ar3K6f3jeUYFU/R2KFN/aTjhUm3n8EK+GR7JfM+rq53HNob3z2aNd8
         FcXaqTRuZKKICmUUtsCMcgXnjezdGBsTZKt2F1D9W3g9ZMERTSmO+6APZ0RAForM39Fg
         PKMA==
X-Forwarded-Encrypted: i=1; AFNElJ/NDR7AZzV1O2uxJYwtMWwIeAkF6cyURvbDbobFtP7IYWv0zQzyle4bkUhQ1qTqa20irHlMHMkiG6u9Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AuocnwlNdoDIl15ehJwgV22SNfry0LNRx4rgTeLrpIB+0Hjz
	SVJlI/pO5AHBrJhh9FBeaIPb/T2iFPUncT+AsxV/9h3NM0wG6LLBi8+z88cT1xoG/No=
X-Gm-Gg: Acq92OF6SV6cwNzyAnoJdxn5QBAOc4cwXVqZCuHeM+4Ke3CgNd3nds6Zd2nH0yvOouO
	bVE9jwG0Q+9jwKAeu92CIxnxxyR4/bpRunqAWkWozvQRlwe4dji8S70BLWdKr8DJWb84eyblt0e
	P2s2fzIXb6oHh01CSZDxm73vjbwML65bu3FQSCCSKyYlZgUFY+jUMdckNyCwwLbveRGozvvttHv
	5DyeW0LU+bfLzEhyZL1XQ11+i9x4QU4/HU9kOXJBrL2z9FqBSjmgoRygVKEwhWDrg49oo520ESC
	Z4/ZR7umDaUjnIraIf+YxVreJIHkKXBWgyTDGBHl157iGMeu9KVuZu4nUrJUmG+ys/42kfGXJAE
	KLqI8nWqE3SXI61sJL9EvtzscF1DAe7E1jaRo8MjVQI1bg9z9w80Asqu421R9DZJ4q0tjtS0vFM
	UAaaPXaGKo1zNNEcbyvWiQSKpyodPv853l2K49VLN/DmtTOlnC9gUJv5j1Z7qhI4j/NSJ8VLQAP
	0R+piDgbQkjbNb0c+zleZeAO0wFA3TfSwZ6x6mL/9OGT4l0
X-Received: by 2002:a17:907:c308:b0:bf4:9f78:8399 with SMTP id a640c23a62f3a-bfe2acf357emr117904366b.42.1781261761918;
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Sort kodiak pinctrl nodes & add camera mclk
 definitions
Date: Fri, 12 Jun 2026 12:55:50 +0200
Message-Id: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mj3ez8lMzEbN3kxFzd3OScbN1E81QL8xTTJENTC1MloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAyNd1CXMAAAA=
X-Change-ID: 20260612-kodiak-cam-mclk-a7e87d5b1585
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=704;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
 b=JDb4H6sSEzWpZuNT4YY9jzkb8Myz1vbnJisiKns1kVM2EVGQa7W9H8MWDn7RYLoeOA85wFL98
 Kynnoq/HiGjCYH/vOlyakAUJue3zOo2kEQQKziGv2plVxdLVFPfVhwr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

First patch is just cleanup with no functional change, the second patch
adds some camera mclk pinctrl definitions for preparation of adding more
cameras on different kodiak devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1413 +++++++++++++++++-----------------
 1 file changed, 724 insertions(+), 689 deletions(-)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-kodiak-cam-mclk-a7e87d5b1585

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

