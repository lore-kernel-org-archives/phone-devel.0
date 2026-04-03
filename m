Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E813C73DB
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228438; cv=none; b=tCgiILQn4YazSERkv+dMLk+BvQoxhG2Ia/IoKRXbOXMLUm3Tm+IhghYKI6hnsacvlh9y0ODleNP2xyOS19FBwrW04OgMKfz85y+n2dWKuDgpyvIlr+8UHAuwo234gC3Viu5UnGrPZbkAc8xmSxqmprnaPR80EUHl7G1x0VHrMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228438; c=relaxed/simple;
	bh=FhRIVcnNMzecnoa4rPDjvVpIXXCoMM3iqgJIuyFG5Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ppiP21BKTTtk14fxFiKRXewxBsEVhyfdU9EYSpYkOpMxyAbIdmF3f+zrtiQWcmQdplhq6INtDv6VwseL3fNsIdg2Rx2iFmME5TBSX8oKYUPPHg3pC7gBcKVZqxXxKUl7iHLauvNhUkrQajEhtEM6kyMoHLWUQh2fS7NmOgAZtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PHpF51M0; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PHpF51M0"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so3680847a12.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228436; x=1775833236; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0/QY6ehQue8Ry1HwgL+iBOWAjcDTargnHsUC+wjaTU=;
        b=PHpF51M0kLHzN34mxvbVESWh5St6DaiaUp3Mv9hJEFArBH4qzc8FHPKXN4MRm6yl0J
         vu5cdFW6Q3F+rfFKvo6lBRb7XfV3BTltjOIYnX5z+hjYBuW/GA+6EBYRnzuGYmC5gJ8g
         qQfPLz8QPlMjwxtnJCh/SELWQSA8OoHfMoNa8zB6/5HVJltQ9ywg+9+/u4tPu+nahzeM
         dMHCkkHfPPmV/cSlgMghnbMvEtqzk9jZjdfcKnUuqpc7Lu0G8KhJ5nBT6HGGOmDv51IJ
         f+KpXW0/AVGd1dUS4N9AXpOe2NT54yurzxVLi0QCxlSisdWMw/9xpNaJsClEwm7C3dwa
         J28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228436; x=1775833236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0/QY6ehQue8Ry1HwgL+iBOWAjcDTargnHsUC+wjaTU=;
        b=TFqoVDsTTHoBjrBn6a796tFVUuxtF8qToMocAhUfNBz8+UNWfCZEpudJmJo9dh/WhT
         HrwPLkkAA7BrKiSNpBHKhLvrh75vm3mKlQ4XLz1mjbhsQXVmJz4GOyQ+gK0jL0KnE/as
         gH5piv9+dqarMEKeO+2SPJgMh50ZvDctT2+KuZEDWCovCMXhMJe7sHMKBXDfIqGUb7zB
         7Z/s9/Tq4Ggq444qjMteNWtl8A8aZzGdQm+QOz5pA/kIcNLJi/8au2P066dPKhhBkx/s
         HTSpISTnAwzS04E2kEqGArBDf+p9ego4yQ+2tIOYAI7JslGf8qDkj481JLARGyEGjteX
         Ivag==
X-Forwarded-Encrypted: i=1; AJvYcCX2ALPfE8Wk3XfGxseHsI/V0eJlteKqqiQ/M/sPQFLy6IcDqyPk2QnRq1m7BZLRgk027OToM+CN8Kr+rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4DUB4o1LcRwUim5yc/eSDuljg/gw69cZ6ZsNfUfABrBCI0yWS
	d4xtuDQcMpj0HUQC1f/oZNZ0FyVxSt37o2t/525h0e9gbSfciCbau7FFvxgPLwFAjJQ=
X-Gm-Gg: AeBDiesq+qFl/qGkBXwuRjy1bUJ44QSNDl1KmX9qoamX2wP5kv2Hm/7+qxNDIhNDPj2
	0fxWq17DUUBXrBpfNona5FHM/nCuZwQguJWs20+bXWA84HdjWUPW3n6YwCz1IlEoCnX6gRaEESl
	08y5epJ2tIoR2y5jC4rFNmtZja5ZP2tGVc+/2cryGtnAOhhBsEqBrYbq6npJBT9ICF3nYGwV3nq
	5YNtoVaK++GqoKW7SE/qPuFU5OIX3HL6AsV8NHGI7FDMsNhY4T/94WOVVg8U83P1bk+6231JycQ
	AYjK0U5IsEZHt2ENxVlJJ/kgwDkRvvKOL8v5TV0T+D3Elm1ooDnwQ5UzdGAjjqeXhSiZsQdpQli
	be2QtuPZX1u1UJ76Vrzx33tCqfeLS+v7tqxH1fxTA9QSRkrCGOTgcKEQ0VemKBIs583CySrgXA9
	wcNUDph0GA2idP6wUk5084+LqU0QUm43YKdsclcCEkDlui4QxcbWbEvJBgPDE2mAEexkMgfipLh
	z9lnlAg+3a7u4lSK3ys8yE49+kTqKn3msIrVA==
X-Received: by 2002:a05:6402:5106:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-66e3f71d3c4mr1491095a12.20.1775228435709;
        Fri, 03 Apr 2026 08:00:35 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Describe IMEM on Milos
Date: Fri, 03 Apr 2026 17:00:22 +0200
Message-Id: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFrxJm7UBMQsFeRbpI46gjJtFMKoXSu
 xttlw/ef38BocIk0KsFCn1YOKcGx4OCcPfpRsiXxmC06bTTFiM/syBHimi9ts4Yd3KdhzZ4Fbr
 y/I+dh41lGh8U6q+wG4XeU3upmwajF8KQY+Taq0Rzxf3JwLCuXxo0Qq2fAAAA
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=594;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FhRIVcnNMzecnoa4rPDjvVpIXXCoMM3iqgJIuyFG5Z4=;
 b=v0PIV7ASjl5AGLPJMb0wR7ZvLdSq7YzlZaP6WosPRsq/8BDQLdIwBfqHtSgd2wZ2sKyuaZDsR
 O0IL2KwwsCuCoyPwl4SvSCSGi370fvObb4oLiUB+FWU8uxhFK9Si2hy
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: sram: qcom,imem: Add the Milos compatible
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-imem-3a034224946a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

