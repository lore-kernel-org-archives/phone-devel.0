Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED0359A9F
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574687; cv=none; b=DKbN5idFI9olgtUDOe6rx5ZzCV+pWsEOFszkqrdThDDAQRCgmVm1KX/FVwkmvK5+UciMG0/RM+UMIOlFC93xP04fGg5iQ621kx4ipAv9aNifBkAyaxjs5Y8v4NJenZZ1IO7YO3PBwxBvgrTU067+M1E+8oUubA+fpw5zfotXJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574687; c=relaxed/simple;
	bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezwqatdRsv8G0CzPNb5+FCjpOb1JK3kWE3IVMmQEhQdo8tOwD+/1fglR4lv2T+FU7DGzCmxldD4wJVp7Y7YMeHDIXR3HqZqAX8FW0OU/y7V9LitPws6GP1bhleGuBhcPkH4ykpuYVpC9vuUKmTkIxNWlrGKqZj0dpHYpBX9qgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pLYnKQY4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pLYnKQY4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso8411724a12.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574683; x=1776179483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=pLYnKQY4990byypb+jPCD3xWBqcofEyEeYsfxFDO+VURl7LNMqfoEP3PKVm5X7LRh9
         JVZZKccGi0XQpkOOv6BroI2kBRhatjUf8qk2wDIsg5w/6PCQ48OnnNAgr5YyjoC337vo
         mO8ETurkEpUKQUDNyplMSt9U6NL7s8cyfcjZOGubG2a7qCzuhGvKEIJk2C7q16gho9xX
         BZUEw6bNjuRTVZtWuybtIXACoILmnUEwwTBa4X4tinNC2htQEWsMmQPeUeZMHgqBCGGC
         /pRQlySh7XO/9nbiImz/PlYJQ6vXUrhAF7Dj/lcnk9C/fHlH4z06LiMgNeXaSrxZDU59
         c1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574683; x=1776179483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=UY6dYt1JFScNyxf6jsNknL6rwYhnHnBo9Y+JrrMZLUgFBEnN5TsVk6+2b74u1782ih
         ysJNzIs3m9N5OUaUgsiH/QK1PykpBUmEhRZRQ7oN1/1XKf1ltw6tdouqTrFlYA/BFCEL
         sAjDqyIfjCBCsm8p1JPoR1bHMuKlonnklZeJCCPvJptDBs/unQE8U2Bc3wF8Tdk4oYjt
         ynx5w+bi+VSRPOVS6fyYdr6BmekHe59HJlGOwD6HIP3JTUBvVgvU0rrqHMY1R40CJZb3
         XSMt1TyfpAFC4IcsZRRpgkdBb2yP59Bm6PmMGRlFfwHevMr3KMw/0RKC3fhDQ2yEEfVU
         RTZA==
X-Forwarded-Encrypted: i=1; AJvYcCWX+E5n0497R3bglp8erNkph+8H65Vv3I4OebH0+53tziVHVkOn5uysoEFBrU7nshxygZsSI7njcStHBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPrMFH4yR586VL010m0BwSLP1r/d47ts6/ytCeNLURcPd4SDF
	agSaNdimtLefIW9375M9wNFW82SUYN2k3I1eUX2HfDUiqg0cFvO3l9zOeK5K1LJP8DI=
X-Gm-Gg: AeBDiesB6/I8no5XGY3V9aNWGptWXYcmCriAk3zgPfFJ0ifSd8ozKl1D/eU9pJL7VZ9
	+lfUCR0oB9qaiSUKjj1nY+jKedUpgi69kN+8szyWC/xzis+11jsV1Xe0QgmjeGRIGKp/ekE94H8
	uy+VJRRGZti6E2Gf3l6CwnYOHVRS/34wRV4xuDj/3aAHD41Lj5R5gsLSx/2Nt0QE7XhuH3Maoia
	4j3drnHK5YFWNf9aNBkR6wGY+7Xj0Y4gzMqQ/UhuuUY/BnMzUmcDmVLFd357RovEd5WVb8Fbhu5
	nve2pMraDO71WHWtgbnps9EwxqFtk1/sBnfSKtpnudPTetTeMyBYdpRjS6XbMX+Onc0XihktXLK
	tDf34FJS9eizM4cGd+zX+pAT7zuEzo3oqi6kCaxv2QJtAUClvHLohI4ZWSQiWx2iPNYZ3S0v0RL
	PIcoCM4P4PGVwRo2qKgTR+pgweJjALBrES7IZ3jPrSFkeOSFE8M/X+Z/jZPsyj6HG2raNuS9SKb
	W2x+g==
X-Received: by 2002:a05:6402:430f:b0:66e:c7c2:fdbf with SMTP id 4fb4d7f45d1cf-66ec7c2fe80mr4857561a12.22.1775574683352;
        Tue, 07 Apr 2026 08:11:23 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Describe IMEM on Milos
Date: Tue, 07 Apr 2026 17:11:09 +0200
Message-Id: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBREf4XctTWlNBhZ+R+GRYsXuca22BaCI
 fy75bF0eZKZMzNDQE8YoMpm8DhSIGcTiFMGTafsExk9EoPgouSSF8zQ2wVGBg0rFC+kEPIqSwW
 p0Htsadpk93rnMOgXNnE1HAmPnyGtxD0GWgVkjTOGYpVZnCI7lgSsio5CdP673RvzrfHvyZgzz
 qSQErWWF55fbq0i33fO4jnJoV6W5QfcU+CF6wAAAA==
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=726;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
 b=t8ws3HTAXyiAvzcnuJZO0pMo5EnFg9ixXGNLiV3mKbIx6VrCOeei/HrOt1so0kG4xP8sVq5th
 mJ4nKteG69fA4vCNYdvSfXyfeKsdgwFKv0bLmM07dUzEHmHv0oSUalh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-imem-3a034224946a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

